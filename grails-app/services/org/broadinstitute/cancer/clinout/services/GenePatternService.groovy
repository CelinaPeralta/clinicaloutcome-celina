package org.broadinstitute.cancer.clinout.services

import org.genepattern.client.GPClient
import org.genepattern.webservice.JobResult
import org.genepattern.webservice.Parameter
import org.genepattern.webservice.AnalysisWebServiceProxy
import org.genepattern.webservice.WebServiceException
import org.genepattern.webservice.WebServiceErrorMessageException
import org.genepattern.webservice.UnavailableException
import org.broadinstitute.cancer.clinout.domain.MetaDataset
import org.codehaus.groovy.grails.commons.ApplicationHolder

class GenePatternService {

    static final SERVER_ADDRESS = "http://ec2-54-164-57-77.compute-1.amazonaws.com:8080/gp/"
    static final USERNAME = "shunyip@bu.edu"
    static final PASSWORD = "ken1password"

    static client = new GPClient(SERVER_ADDRESS, USERNAME, PASSWORD)
    static proxy = new AnalysisWebServiceProxy(SERVER_ADDRESS, USERNAME, PASSWORD)

	
    /**
     *
     *
     * @retrun
     */
    def getClient() { client }

    /**
     *
     *
     * @retrun
     */
    def getProxy() { proxy }

    /**
     *
     *
     * @retrun
     */
    def isDone(int job) { client.isComplete job }

    /**
     *
     *
     * @retrun
     */
    def getJobResult(int job) { client.createJobResult job }

    /**
     * get the error message from the given job number
     * 
     * @param String error message
     * @retrun
     */
    def getError(int job) { 
		File resultsfolder = ApplicationHolder.application.parentContext.getResource("web-app/results").file
		def Resultspath = resultsfolder.absolutePath
        
        def destination = "$Resultspath/${job}"
        
        def result = getJobResult job
        
        def mainError = result.downloadFile "stderr.txt", destination
        
        def childError = mainError.text.find(/\d{5}/) as int
        
    }

    /**
     * check to see if a job had or had and error
     * 
     * @param int job number to check
     * @retrun
     */
    def hasError(int job) { getJobResult(job).hasStandardError() }

    /**
     * get status for a given job
     *
     * @param int job number to check
     * @retrun
     */
    def getJobStatus(int job) { proxy.checkStatus job }

    /**
     *
     *
     * @param int job number to check
     * @return
     */
    def getChildren(int job) { proxy.getChildren job }

    /**
     * gets analysis result files for the given job number
     * 
     * @param int job number to check
     * @retrun
     */
    def getResultFiles(int jobNumber) { proxy.getResultFiles jobNumber }

    /**
     * run analysis on the given dataset using the given signature
     * 
     * @param String name of dataset
     * @param String name of the signature
     * @retrun
     */
    def runAnalysis(String dataset, String signature) {
        def meta = MetaDataset.findByDatasetName(dataset)
        switch(meta.outcomeType) {
            case "binary": binaryAnalysis(dataset, signature); break

            case "time-to-event": runTimeToEventAnalysis(dataset, signature); break
        }
    }

    /**
     * run time to event analysis with the given dataset and signature
     * 
     * @param String name of the dataset
     * @param String name of the signature
     * @return JobResult
     */
    def runTimeToEventAnalysis(String dataset, String signature) {
		File uploadsfolder = ApplicationHolder.application.parentContext.getResource("web-app/uploads").file
		def UL = uploadsfolder.absolutePath
		File databasefolder = ApplicationHolder.application.parentContext.getResource("web-app/database").file
		def DB = databasefolder.absolutePath

		
        Parameter[] params = [
            new Parameter("ntp_for_coc_no_p1.input.exp.filename",  "$DB/${dataset}.gct"),
            new Parameter("ntp_for_coc_no_p1.input.features.filename", "$UL/${signature}"),
            new Parameter("SurvivalDifference2.input.surv.data.file", "$DB/${dataset}.txt"),
            new Parameter("SurvivalCurve_COC4.input.surv.data.filename", "$DB/${dataset}.txt"),
            new Parameter("CoxRegression_for_COC3.input.surv.data.filename", "$DB/${dataset}.txt")
        ]
        
        println "Running Time to Event Analysis....."

        client.runAnalysisNoWait "OutcomeChecker_TimeToEvent", params
    }

    /**
     * run a binary
     *
     * @retrun
     */
    def binaryAnalysis(String dataset, String signature) {
        File uploadsfolder = ApplicationHolder.application.parentContext.getResource("web-app/uploads").file
		def UL = uploadsfolder.absolutePath
		File databasefolder = ApplicationHolder.application.parentContext.getResource("web-app/database").file
		def DB = databasefolder.absolutePath

		
        Parameter[] params = [
            new Parameter("ntp_for_coc_no_p1.input.exp.filename", "$DB/${dataset}.gct"),
            new Parameter("ntp_for_coc_no_p1.input.features.filename", "$UL/${signature}"),
            new Parameter("TwoByTwo_for_COC3.input.surv.data.filename", "$DB/${dataset}.txt"),
            new Parameter("LogisticRegression_for_COC2.input.clin.data.filename", "$DB/${dataset}.txt")
        ]

        println "Running Binary Analysis....."
        
        client.runAnalysisNoWait "OutcomeChecker_Binary", params
    }

    /**
     *
     *
     * @param int job number to check
     * @retrun
     */
    def downloadResults(int job, String dataset) {
        def meta = MetaDataset.findByDatasetName(dataset)
        switch(meta.outcomeType) {
			case "binary": downloadBinaryResults(job, dataset); break
            case "time-to-event": downloadTimeToEventResults(job, dataset); break
        }
    }

    /**
     *
     *
     * @param int job number to check
     * @retrun
     */
    def downloadTimeToEventResults(int job, String dataset) {
		println "Downloading Results..."
        File resultsfolder = ApplicationHolder.application.parentContext.getResource("web-app/results").file
		def Resultspath = resultsfolder.absolutePath

        def children                  = proxy.getChildren job
		
		def NTPrediction              = client.createJobResult children[0]
        def survivalDifference        = client.createJobResult children[1]
		def coxRegression             = client.createJobResult children[2]
        def survivalCurve             = client.createJobResult children[3]
		
        def files = [:], destination = "$Resultspath/${job}"
		
		files.Heatmap            = NTPrediction.downloadFile "NTP_heatmap.png", destination
        files.survivalDifference = survivalDifference.downloadFile "${dataset}_SurvivalDifferenceTest.txt", destination
		files.coxRegression      = coxRegression.downloadFile "CoxRegression_result.txt", destination
        files.survivalCurve      = survivalCurve.downloadFile "SurvivalCurve.png", destination

		println "Download Finished."
		
		
		return files
    }

    /**
     * download results files for binary analysis
     * 
     * @param int job number
     * @param String dataset name
     * @retrun
     */
    def downloadBinaryResults(int job, String dataset) {
		println "Downloading Results..."
        File resultsfolder = ApplicationHolder.application.parentContext.getResource("web-app/results").file
		def Resultspath = resultsfolder.absolutePath

        def children                  = proxy.getChildren job
		
        def NTPrediction              = client.createJobResult children[0]
        def logisticRegressionResult  = client.createJobResult children[1]
        def twoByTwoResult            = client.createJobResult children[2]

        def files = [:], destination = "$Resultspath/${job}"
		
        files.heatmap            = NTPrediction.downloadFile "NTP_heatmap.png", destination
        files.logisticRegression = logisticRegressionResult.downloadFile "LogisticRegression_result.txt", destination
        files.table2x2           = twoByTwoResult.downloadFile "table2x2.txt", destination
        files.performance2x2     = twoByTwoResult.downloadFile "performance2x2.txt", destination
		println "Download Finished."
		return files
		
    }

    /**
     * downloads the error file from the given job number
     * 
     * @param int job number to get error from
     * @returns File object representing the error file
     */
    def downloadErrorFile(int job) {
		File resultsfolder = ApplicationHolder.application.parentContext.getResource("web-app/results").file
		def Resultspath = resultsfolder.absolutePath

        def destination = "$Resultspath/results/${job}"
        def result = getJobResult job
        
        result.downloadFile "stderr.txt", destination
    }
}
