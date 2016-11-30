package org.broadinstitute.cancer.clinout.services

import grails.util.Environment
import org.broadinstitute.cancer.clinout.domain.MetaDataset
import java.io.*;

class MetaDatasetService {

    def loadDatasets() {

        print "Loading Datasets........................."

        def lines
		InputStream path

        Environment.executeForCurrentEnvironment {
            production {
				path = this.class.classLoader.getResourceAsStream('csv/metadata_w_header.csv')
            }
            development {
                path = this.class.classLoader.getResourceAsStream('csv/metadata_w_header.csv')
            }
        }
		BufferedReader r = new BufferedReader(new InputStreamReader(path));
		String l,dump
		dump = r.readLine()
		while((l = r.readLine()) != null) {
			def meta = new MetaDataset(l)
            meta.save()
		} 
		path.close()
		
        int count = MetaDataset.count()

        println("${count} datasets successfully loaded")
    }

    def emptyTable() {

        print "Emptying Dataset Table..........."

        MetaDataset.where { }.deleteAll()

        println "table dropped"
    }
}
