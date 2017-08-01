grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.8
grails.project.source.level = 1.8
grails.project.war.file = "target/clinicaloutcome.war"
//grails.dependency.cache.dir = "target/ivy-cache"
//grails.dependency.cache.dir = "${user.home}/.ivy2/cache"
grails.tomcat.jvmArgs=["-Xms2048m",  "-Xmx2048m", "-XX:PermSize=2048m", "-XX:MaxPermSize=2048m"]
grails.project.dependency.resolver = "maven"
grails.project.dependency.resolution = {
	//    pom true
    // inherit Grails' default dependencies
    inherits("global") {
        //excludes "xml-apis"
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenCentral()
		
        mavenRepo "https://oss.sonatype.org/content/groups/public/"

        // uncomment these to enable remote dependency resolution from public Maven repositories
        mavenLocal()
        mavenRepo "https://oss.sonatype.org/content/repositories/releases/"
		mavenRepo "https://repo.grails.org/grails/plugins"
        mavenRepo "http://snapshots.repository.codehaus.org"
        mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2/"
        mavenRepo "http://repository.jboss.com/maven2/"
        
//        // Hardcoded path to the jar fiels
//        flatDir name:'myRepo', dirs:'lib' 
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'mysql:mysql-connector-java:5.1.20'
        
    }
    plugins {
		build ":release:2.2.1"
	
        runtime ":hibernate:3.6.10.14"
        runtime ":jquery:1.11.0.2"
        runtime ":resources:1.2.14"
        runtime ":cached-resources:1.0"
		compile "org.grails.plugins:google-visualization:1.0.2"
        compile ":less-resources:1.3.3.2"
        compile ':app-info:1.0.1'
        //compile ":svn:1.0.2"
        compile ":famfamfam:1.0.1"
        compile ":mail:1.0.8-SNAPSHOT"
        compile ":spring-security-ui:0.2"
        compile ":spring-security-core:1.2.7.3"
        compile ":lang-selector:0.3"
        compile ":google-analytics:2.0"
        compile ":cache-headers:1.1.5"
        compile ":dynamic-controller:0.4"
        compile ":jquery-ui:1.10.4"
        compile ":events-push:1.0.M3"
        compile ":platform-core:1.0.M6"
        compile ":h2:0.2.6"
		

        // Uncomment these (or add new ones) to enable additional resources capabilities
        runtime ":zipped-resources:1.0"
        runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:7.0.50"
    }
}