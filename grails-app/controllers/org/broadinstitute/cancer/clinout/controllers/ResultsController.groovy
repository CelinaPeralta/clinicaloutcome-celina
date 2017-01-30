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
		
		int index = 0
		int index1 = 0
		while (true) {
			String[] splitArray = survivalDifferenceLines[index1].split("\\s+")
			if (splitArray[0] == "cls=0") {
				index = index1
			}
			if (splitArray[0] == "cls=1") {
				break
			}
			index1++
		}

		int index2 = 0
		int index3 = 0
		int match = 0
		while (true) {
			String[] splitArray = coxRegressionLines[index3].split("\\s+")
			if (splitArray[0] == "factor(cls)1") {
				if (match == 0) {
					index2 = index3
					match = match + 1
				} else {
					break
				}
			}
			index3++
		}
		
        map.survivalDifferenceLine1 = survivalDifferenceLines[index]
		//println "1"
		//println survivalDifferenceLines[7]
        map.survivalDifferenceLine2 = survivalDifferenceLines[index1]
		//println "2"
		//println survivalDifferenceLines[8]
        map.survivalDifferenceLine3 = survivalDifferenceLines[index1+2]
		//println "3"
		//println survivalDifferenceLines[10]
        map.coxRegressionLine1      = coxRegressionLines[index2]
		//println "4"
		//println coxRegressionLines[12]
        map.coxRegressionLine2      = coxRegressionLines[index3]
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
