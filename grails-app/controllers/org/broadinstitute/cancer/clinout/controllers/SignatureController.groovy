package org.broadinstitute.cancer.clinout.controllers

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import org.broadinstitute.cancer.clinout.domain.MetaDataset
import grails.util.Holders

class SignatureController {

    def grailsApplication

    static defaultAction = "upload"

    static final DELIM = "\t"

    def upload() {}

    def sigFile() {
		File layoutFolder = Holders.grailsApplication.parentContext.getResource("web-app/uploads").file
        def path = layoutFolder.absolutePath

        if (request instanceof MultipartHttpServletRequest) {
            for(filename in request.fileNames){
                MultipartFile file = request.getFile(filename)

                String newFileName = UUID.randomUUID().toString() + file.originalFilename.substring(file.originalFilename.lastIndexOf("."))
                session.signature = newFileName

                file.transferTo(new File("$path/$newFileName"))
            }
        }
        redirect controller: 'results', action: 'loading'
    }

    def sigText(String class1, String class2) {
		File layoutFolder = Holders.grailsApplication.parentContext.getResource("web-app/uploads").file

        def path = layoutFolder.absolutePath, name = "${UUID.randomUUID() as String}.txt"

        def list1 = class1.split(), list2 = class2.split()
		File pathAsFile = new File("$path")
		pathAsFile.mkdirs()
        def writer = new File("$path/$name").newWriter()
        writer.println "gene_name" + DELIM + "gene_symbol" + DELIM + "up1_dn2"
        list1.each {
            writer.println it + DELIM + it + DELIM + "1"
        }
        list2.each {
            writer.println it + DELIM + it + DELIM + "2"
        }
        writer.close()

        session.signature = name

        redirect controller: 'results', action: 'loading'
    }
}
