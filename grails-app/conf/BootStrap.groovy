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


        if (!adminKen.authorities.contains(adminRole)) {
            UserRole.create(adminKen, adminRole, true)
//            Role.create adminKen, userRole
        }

        if(MetaDataset.findAll().size() == 0) {
            metaDatasetService.loadDatasets()
        }
		for (String url in [
			'/dataset/**', '/results/**','/signature/**',
			'/user/**','/requestmap/**','/role/**','/admin/**'
			]) {
		 new Requestmap(url: url, configAttribute: 'ROLE_ADMIN').save()
		}
		for (String url in [
			'/welcome','/login/**','/register/**'
			]) {
		 new Requestmap(url: url, configAttribute: 'permitAll').save()
		}
		for (String url in [
			'/dataset/**', '/results/**','/signature/**'
			]) {
		 new Requestmap(url: url, configAttribute: 'ROLE_USER').save()
		}
    }
    def destroy = {
    }
}
