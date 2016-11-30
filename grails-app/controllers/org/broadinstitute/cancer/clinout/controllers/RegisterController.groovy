package org.broadinstitute.cancer.clinout.controllers

//import grails.plugins.springsecurity.ui.RegisterController;
import grails.plugins.springsecurity.ui.ResetPasswordCommand;
import groovy.text.SimpleTemplateEngine
import grails.util.Environment
import grails.validation.Validateable

import org.codehaus.groovy.grails.commons.ApplicationHolder as AH
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.broadinstitute.cancer.clinout.util.UserDetails
import org.broadinstitute.cancer.clinout.domain.User

import grails.plugins.springsecurity.ui.RegisterCommand

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    def register = { RegisterCommand command ->

        if (command.hasErrors()) {
            render view: 'index', model: [command: command]
            return
        }
		
		def user = lookupUserClass().newInstance(email: command.email, username: command.username, accountLocked: true, enabled: true, password: command.password)
		
		
        RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, command.username)
        if (registrationCode == null || registrationCode.hasErrors()) {
            // null means problem creating the user
            flash.error = message(code: 'spring.security.ui.register.miscError')
            flash.chainedParams = params
            redirect action: 'index'
            return
        }

        String url = generateLink('verifyRegistration', [t: registrationCode.token])

        def conf = SpringSecurityUtils.securityConfig
        def body = conf.ui.register.emailBody
        if (body.contains('$')) {
            body = evaluate(body, [user: user, url: url])
        }
        mailService.sendMail {
            to command.email
            from conf.ui.register.emailFrom
            subject conf.ui.register.emailSubject
            html body.toString()
        }
        mailService.sendMail {
            to "yujin.hoshida@mssm.edu", "clinicaloutcome2@gmail.com"
            from conf.ui.register.emailFrom
            subject "Clinical Outcome New User Notfication"
            html g.render(template:"notify", model: [command: command, count: User.findAll().size()])
        }

        render view: 'index', model: [emailSent: true]
    }

    protected String generateLink(String action, linkParams) {

        def url = grailsApplication.config.grails.serverURL

        createLink(base: "$url",
            controller: 'register', action: action,
            params: linkParams)
    }
}
