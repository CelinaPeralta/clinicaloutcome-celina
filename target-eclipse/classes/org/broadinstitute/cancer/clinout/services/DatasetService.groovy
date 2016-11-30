package org.broadinstitute.cancer.clinout.services

import grails.util.Environment
import org.broadinstitute.cancer.clinout.domain.Dataset

class DatasetService {

    def loadDatasets() {

        print "Loading Datasets........................."

        def lines, path

        Environment.executeForCurrentEnvironment {
            production {
                path = "/xchip/cogs/dogmatix/cmap/data/"
            }
            development {
                path = "metadata_w_header_noChiang.csv"
            }
        }

        lines = new File(path).readLines()

        lines.drop(1).each { line ->

            def dataset = new Dataset(line)
            dataset.save()
        }

        int count = Dataset.count()

        println("${count} datasets successfully loaded")
    }

    def emptyTable() {

        print "Emptying Dataset Table..........."

        Dataset.where { }.deleteAll()

        println "table dropped"
    }
}
