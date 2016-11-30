package org.broadinstitute.cancer.clinout.controllers

import org.genepattern.webservice.JobResult
import org.genepattern.webservice.AnalysisWebServiceProxy
import org.broadinstitute.cancer.clinout.domain.MetaDataset
import grails.converters.JSON

class ResultsController {

    def genePatternService

    def loading() {
        session.job = genePatternService.runAnalysis session.dataset, session.signature
    }

    def status() {
        def data = [:], meta = MetaDataset.findByDatasetName session.dataset
        
        if(genePatternService.isDone(session.job)) {
            session.files = genePatternService.downloadResults session.job, session.dataset
            data.ready  = true
            data.result = meta.outcomeType=="time-to-event" ? 'timeToEvent' : 'binary'
        }
        else {
            data.ready = false
        }

        render data as JSON
    }

    def binary() {
		session.files = genePatternService.downloadResults session.job, session.dataset
        Map map = [:]

        map.twoByTwoLines           = session.files.table2x2.readLines().drop(2)
        map.logisticRegressionLines = session.files.logisticRegression.readLines()
        map.performanceLines        = session.files.performance2x2.readLines().drop(1)
        map.jobNumber               = session.job
        map.dataset                 = session.dataset

        if(map.logisticRegressionLines.size() > 34)
            map.logisticRegressionLines = map.logisticRegressionLines.drop(30)
        else
            map.logisticRegressionLines = map.logisticRegressionLines.drop(28)

        session.reset = true

        [map: map]
    }

    def timeToEvent() {
		session.files = genePatternService.downloadResults session.job, session.dataset
        Map map = [:]
		
        def survivalDifferenceLines = session.files.survivalDifference.readLines()
        def coxRegressionLines = session.files.coxRegression.readLines()
		
		
        map.survivalDifferenceLine1 = survivalDifferenceLines[7]
		//println "1"
		//println survivalDifferenceLines[7]
        map.survivalDifferenceLine2 = survivalDifferenceLines[8]
		//println "2"
		//println survivalDifferenceLines[8]
        map.survivalDifferenceLine3 = survivalDifferenceLines[10]
		//println "3"
		//println survivalDifferenceLines[10]
        map.coxRegressionLine1      = coxRegressionLines[12]
		//println "4"
		//println coxRegressionLines[12]
        map.coxRegressionLine2      = coxRegressionLines[17]
		//println "5"
		//println coxRegressionLines[17]
        map.jobNumber               = session.job
        map.dataset                 = session.dataset

		
        session.reset = true

        [map: map]
    }

    def error() {

    }
}
