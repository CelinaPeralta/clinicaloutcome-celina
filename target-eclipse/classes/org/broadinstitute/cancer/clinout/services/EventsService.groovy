package org.broadinstitute.cancer.clinout.services

import org.grails.datastore.mapping.model.MappingContext.Listener
import org.broadinstitute.cancer.clinout.domain.User
class EventsService {

    def serviceMethod() {
        
    }
    
    //@Listener('logout')
    def method(User user){
        Date disconnectDate = new Date()

        //do something very long with user

        return disconnectDate
    }
}
