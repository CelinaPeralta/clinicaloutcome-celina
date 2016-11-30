/*
 * Broad Institute of MIT and HarvardTo change this template, choose Tools | Templates
 * Broad Institute of MIT and Harvardand open the template in the editor.
 */

package org.broadinstitute.cancer.clinout.util

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.userdetails.User

/**
 *
 * @author Shun Hang Yip
 */
class UserDetails extends GrailsUser {

    final String email

    UserDetails(String username, 
        String password, 
        boolean enabled,
        boolean accountNonExpired, 
        boolean credentialsNonExpired,
        boolean accountNonLocked,
        Collection<GrantedAuthority> authorities,
        long id, String email) {
        
        super(username, password, enabled, accountNonExpired,
            credentialsNonExpired, accountNonLocked, authorities, id)

        this.email = email
    }
    
}