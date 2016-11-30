package org.broadinstitute.cancer.clinout.services

import grails.util.Environment

class DataService {

    def serviceMethod() {

    }
    
    def loadData() {
        
        def file, path
        
        Environment.executeForCurrentEnvironment {
            production {
                path = "/xchip/cogs/dogmatix/cmap/data/"
            }
            development {
                path = "test/data/"
            }
        }
        
        file = new File(path)
    }
    
    def emptyTable(String clazz) {
        
        def domainClass = grailsApplication.getArtefact(
            DomainClassArtefactHandler.TYPE, "org.broadinstitute.cmap.domain." + clazz.capitalize())
        
        domainClass.getClazz().where { }.deleteAll()
    }
}
