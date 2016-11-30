class UrlMappings {

    static mappings = {
        
        "/admin/manage/$action?"(controller: "adminManage")
        "/adminManage/$action?"(controller: "errors", action: "urlMapping")
        
//        "/resource/$path**"(controller: 'script', action: 'parse')

        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view: 'welcome')

//        "/"(controller: "dataset", action:"index")
        
        
//        "/"(view:"landing")

//        "403"(controller: "errors", action: "accessDenied")
//        "404"(controller: "errors", action: "notFound")
//        "405"(controller: "errors", action: "notAllowed")
//        "500"(controller: "errors", action: "error")
    }
}
