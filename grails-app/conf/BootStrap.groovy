import java.util.Date;

import org.broadinstitute.cancer.clinout.domain.User
import org.broadinstitute.cancer.clinout.domain.Role
import org.broadinstitute.cancer.clinout.domain.UserRole
import org.broadinstitute.cancer.clinout.domain.MetaDataset
import org.broadinstitute.cancer.clinout.domain.Requestmap

class BootStrap {

    def metaDatasetService
	
    def init = { servletContext ->

        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true)

        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true)
		
        def adminKen = User.findByEmail('clinicaloutcome2@gmail.com') ?: new User(username: 'kenyipsh',password: 'ken1password',enabled: true,email: 'clinicaloutcome2@gmail.com',accountExpired: false,accountLocked: false,passwordExpired: false).save(flush: true)
		
		def userKen = User.findByEmail('shunyip@bu.edu') ?: new User(username: 'shunyip',password:'ken1password',enabled: true,email: 'shunyip@bu.edu',accountExpired: false,accountLocked: false,passwordExpired: false).save(flush: true)
		
		if (!userKen.authorities.contains(userRole)) {
			UserRole.create(userKen, userRole, true)
//            Role.create adminKen, userRole
		}
        if (!adminKen.authorities.contains(adminRole)) {
            UserRole.create(adminKen, adminRole, true)
//            Role.create adminKen, userRole
        }

        if(MetaDataset.findAll().size() == 0) {
            metaDatasetService.loadDatasets()
        }
    }
    def destroy = {
    }
}
