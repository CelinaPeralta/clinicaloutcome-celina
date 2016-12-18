import org.broadinstitute.cancer.clinout.domain.User
import grails.plugins.springsecurity.SecurityConfigType
// // locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

//def ENV_NAME = "APPNAME_CONFIG"
//if(!grails.config.location || !(grails.config.location instanceof List)) {
//	grails.config.location = []
//}
//if(System.getenv(ENV_NAME)) {
//	println "Including configuration file specified in environment: " + System.getenv(ENV_NAME);
//	grails.config.location << "file:" + System.getenv(ENV_NAME)
// 
//} else if(System.getProperty(ENV_NAME)) {
//	println "Including configuration file specified on command line: " + System.getProperty(ENV_NAME);
//	grails.config.location << "file:" + System.getProperty(ENV_NAME)
// 
//} else {
//	println "No external configuration file defined."
//}

grails.project.groupId = "org.broadinstitute.cancer.clinout" // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.deployment.tomcat.version = "6.0.43"
grails.deployment.tomcat.url = "http://www.apache.net.pl/tomcat/tomcat-6/v6.0.43/bin/apache-tomcat-6.0.43.zip"

grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*', '/uploads/*', '/examples/*', '/themes/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = [
    'org.broadinstitute.cancer.clinout.services',
    'org.broadinstitute.cancer.clinout.controllers',
    'org.broadinstitute.cancer.clinout.domain',
    'org.broadinstitute.cancer.clinout.util'
]
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// enable query caching by default
grails.hibernate.cache.queries = true

// set per-environment serverURL stem for creating absolute links
environments {
    development {
        grails.logging.jul.usebridge = true
        //grails.serverURL = "http://clinicaloutcome.elasticbeanstalk.com"
    }
    production {
		grails.logging.jul.usebridge = false
        grails.serverURL = "http://clinicaloutcome.us-east-1.elasticbeanstalk.com/"
		grails.app.context=""
    }
}


grails.app.context = ""

grails {
   mail {
     host = "smtp.gmail.com"
     port = 465
     username = "clinicaloutcome2@gmail.com"
     password = "hoshidalabken"
     props = ["mail.smtp.auth":"true", 					   
              "mail.smtp.socketFactory.port":"465",
              "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
              "mail.smtp.socketFactory.fallback":"false"]   
   }   
}


grails.mail.default.from="clinicaloutcome2@gmail.com"

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'org.broadinstitute.cancer.clinout.domain.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'org.broadinstitute.cancer.clinout.domain.UserRole'
grails.plugins.springsecurity.authority.className = 'org.broadinstitute.cancer.clinout.domain.Role'
grails.plugins.springsecurity.logout.afterLogoutUrl = "/"
grails.plugins.springsecurity.failureHandler.defaultFailureUrl = '/login/auth'
//grails.plugins.springsecurity.securityConfigType = SecurityConfigType.Requestmap
grails.plugins.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
grails.plugins.springsecurity.interceptUrlMap = [
'/adminmanage/**': ['ROLE_ADMIN','IS_AUTHENTICATED_FULLY'],
   '/welcome':['permitAll'],
   '/login/**':['permitAll'],
   '/register/**':['permitAll'],
   '/dataset/**':['ROLE_USER','ROLE_ADMIN','IS_AUTHENTICATED_FULLY'],
   '/results/**':['ROLE_USER','ROLE_ADMIN','IS_AUTHENTICATED_FULLY'],
   '/signature/**':['ROLE_USER','ROLE_ADMIN','IS_AUTHENTICATED_FULLY'],
   '/user/**':['ROLE_USER','ROLE_ADMIN','IS_AUTHENTICATED_FULLY'],
   '/requestmap/**':['ROLE_USER','ROLE_ADMIN','IS_AUTHENTICATED_FULLY'],
   '/role/**':['ROLE_USER','ROLE_ADMIN','IS_AUTHENTICATED_FULLY'],
   '/admin/**':['ROLE_ADMIN','IS_AUTHENTICATED_FULLY']
]
// log4j configuration
log4j = {
	// Example of changing the log pattern for the default console
	// appender:
	//
	appenders {
		console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
//        console name: "stdout", threshold: org.apache.log4j.Level.INFO
	}

	root {
		info 'stdout'
	}

	debug 'grails.app.services.grails.plugins.springsecurity.ui.SpringSecurityUiService'
	debug 'org.springframework.security'
	
//    trace 'org.broadinstitute.cancer.clinout.controllers.LoginController'

	error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
		   'org.codehaus.groovy.grails.web.pages', //  GSP
		   'org.codehaus.groovy.grails.web.sitemesh', //  layouts
		   'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
		   'org.codehaus.groovy.grails.web.mapping', // URL mapping
		   'org.codehaus.groovy.grails.commons', // core / classloading
		   'org.codehaus.groovy.grails.plugins', // plugins
		   'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
		   'org.springframework',
		   'org.hibernate',
		   'net.sf.ehcache.hibernate'
}


//com.mfelix.grails.plugins.langSelector.lang.flags = [
//    "es":"es",
//    "en":"gb",
//    "fr":"fr",
//    "da":"dk",
//    "de":"de",
//    "it":"it",
//    "ja":"jp",
//    "nl":"nl",
//    "ru":"ru",
//    "th":"th",
//    "zh":"cn",
//    "pt":"pt"
//]

grails.plugins.dynamicController.mixins = [
    'com.burtbeckwith.grails.plugins.appinfo.IndexControllerMixin':      'org.broadinstitute.cancer.clinout.controllers.AdminManageController',
    'com.burtbeckwith.grails.plugins.appinfo.HibernateControllerMixin':  'org.broadinstitute.cancer.clinout.controllers.AdminManageController',
    'com.burtbeckwith.grails.plugins.appinfo.Log4jControllerMixin':      'org.broadinstitute.cancer.clinout.controllers.AdminManageController',
    'com.burtbeckwith.grails.plugins.appinfo.SpringControllerMixin':     'org.broadinstitute.cancer.clinout.controllers.AdminManageController',
    'com.burtbeckwith.grails.plugins.appinfo.MemoryControllerMixin':     'org.broadinstitute.cancer.clinout.controllers.AdminManageController',
    'com.burtbeckwith.grails.plugins.appinfo.PropertiesControllerMixin': 'org.broadinstitute.cancer.clinout.controllers.AdminManageController',
    'com.burtbeckwith.grails.plugins.appinfo.ThreadsControllerMixin':    'org.broadinstitute.cancer.clinout.controllers.AdminManageController',
    'com.burtbeckwith.grails.plugins.appinfo.ScopesControllerMixin':     'org.broadinstitute.cancer.clinout.controllers.AdminManageController'
]


grails.plugins.springsecurity.controllerAnnotations.staticRules = [
   '/adminmanage/**': ['ROLE_ADMIN'],
   '/welcome':['permitAll'],
   '/login/**':['permitAll'],
   '/register/**':['permitAll'],
   '/dataset/**':['ROLE_USER','ROLE_ADMIN'],
   '/results/**':['ROLE_USER','ROLE_ADMIN'],
   '/signature/**':['ROLE_USER','ROLE_ADMIN'],
   '/user/**':['ROLE_ADMIN'],
   '/requestmap/**':['ROLE_ADMIN'],
   '/role/**':['ROLE_ADMIN'],
   '/admin/**':['ROLE_ADMIN']
]

grails.plugins.appinfo.additional = [
   "My Config": [
      configs: "Configs"
   ]
]

google.analytics.enabled = true
google.analytics.webPropertyID = "UA-33851510-1"

grails.validateable.classes = [
    org.broadinstitute.cancer.clinout.controllers.SubmitCommand
]

//grails.plugins.springsecurity.onInteractiveAuthenticationSuccessEvent = { e, appCtx ->
//    org.broadinstitute.cancer.clinout.domain.User.withTransaction {
//        def user = User.findById(appCtx.springSecurityService.principal.id)
//        if(!user.isAttached())
//            user.attach()
//        user.lastLogin = new Date()
//        user.save(flush: true, failOnError: true)
//    }
//}

grails.plugins.springsecurity.ui.encodePassword = false

//grails.war.dependencies = [
//    'GenePattern.jar'
//    "grails-test-2.1.0.jar"
//]


//grails.plugins.springsecurity.useSecurityEventListener = true
//grails.plugins.springsecurity. onInteractiveAuthenticationSuccessEvent = { e, appCtx ->
//   // handle InteractiveAuthenticationSuccessEvent
//}
//
//grails.plugins.springsecurity. onAbstractAuthenticationFailureEvent = { e, appCtx ->
//   // handle AbstractAuthenticationFailureEvent
//}
//
//grails.plugins.springsecurity. onAuthenticationSuccessEvent = { e, appCtx ->
//   // handle AuthenticationSuccessEvent
//}
//
//grails.plugins.springsecurity. onAuthenticationSwitchUserEvent = { e, appCtx ->
//   // handle AuthenticationSwitchUserEvent
//}
//
//grails.plugins.springsecurity. onAuthorizationEvent = { e, appCtx ->
//   // handle AuthorizationEvent
//}

