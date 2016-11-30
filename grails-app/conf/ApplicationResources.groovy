modules = {

    'application' {

        dependsOn: 'jquery-ui'

        resource url:[dir: 'themes/classic', file: 'style.css']

        resource url:[dir: 'css', file: 'jquery.lightbox-0.5.css']

        resource url:[dir: 'js/jquery', file: 'jquery.cookie.js']

        resource url:[dir: 'js/jquery', file: 'jquery.jstree.js']

        resource url:[dir: 'js/jquery', file: 'jquery.lightbox-0.5.js']

        resource url:[dir: 'js', file: 'spin.js']
        
        resource url:[dir: 'js', file: 'application.js']
    }

    'selectDataset' {
        dependsOn: 'application'

        resource url:[dir: 'js', file: 'selectDataset.js']
    }

    'uploadSignature' {
        dependsOn: 'application'

        resource url:[dir: 'js', file: 'uploadSignature.js']
    }

    'resultsBinary' {
        dependsOn: 'application'

        resource url:[dir: 'js', file: 'resultsBinary.js']
    }

    'resultsTimeToEvent' {
        dependsOn: 'application'

        resource url:[dir: 'js', file: 'resultsTimeToEvent.js']
    }

    'loadingResults' {
        dependsOn: 'application'

        resource url:[dir: 'js', file: 'loadingResults.js']
    }

    overrides {

        'jquery-ui' {
            dependsOn 'jquery', 'jquery-theme'

            resource id:'js', url:[dir:'js/jquery', file:"jquery-ui-1.8.23.custom.min.js"],
                nominify: true, disposition: 'head'
        }

        'jquery-theme' {
            resource id:'theme', url:'/css/smoothness/jquery-ui-1.8.23.custom.css'

        }

        'ajax-login' {
		dependsOn 'jquery'
		resource url: [dir: 'js/jquery', file: 'jquery.form.js', plugin: 'spring-security-ui']
		resource url: [dir: 'js',        file: 'ajaxLogin.js']
	}

        'register' {
		dependsOn 'jquery-ui'

		for (name in ['reset',
		              'spring-security-ui',
		              'smoothness/jquery-ui-1.8.2.custom',
		              'jquery.jgrowl',
		              'jquery.safari-checkbox',
		              'auth']) {
			resource url: [dir: 'css', file: name + '.css', plugin: 'spring-security-ui']
		}

		for (name in ['jquery.jgrowl', 'jquery.checkbox']) {
			resource url: [dir: 'js/jquery', file: name + '.js', plugin: 'spring-security-ui']
		}

		resource url: [dir: 'js', file: 'spring-security-ui.js', plugin: 'spring-security-ui']
	}
    }

//    'custom-bootstrap' {
//
//        dependsOn 'bootstrap'
//        resource url:[dir: 'less', file: 'custom-bootstrap.less'], attrs:[rel: "stylesheet/less", type:'css']
//    }

//    'style' {
//
//        resource url:[dir: 'less', file: 'styles.less'],attrs:[rel: "stylesheet/less", type:'css']//, bundle: 'style'
//    }
}