package org.broadinstitute.cancer.clinout.controllers

import org.springframework.dao.DataIntegrityViolationException
import org.broadinstitute.cancer.clinout.domain.Dataset
import org.broadinstitute.cancer.clinout.domain.MetaDataset
import grails.converters.JSON

class DatasetController {

    def index() {

        if(session.reset) {
            session.organ   = null
            session.disease = null
            session.outcome = null
            session.dataset = null
            session.job     = null
            session.files   = null
        }
    }

    def treeData(String item, String selection) {
        
        def tree = []

        switch(item) {
            case "organ":
                def diseases, count = [:], organ = selection

                session.organ = organ

                diseases = MetaDataset.findAllByOrgan(organ).collect { meta -> meta.disease } as Set

                diseases.each { disease ->
                    count[disease] = MetaDataset.findAllByDiseaseAndOrgan(disease, organ).size()
                }
                diseases.eachWithIndex { disease, index ->
                    Map map = [:]
                    map.data = "${disease} (${count[disease]})"
                    map.attr = [
                        "selection" : "$disease", 
                        "item" : "disease",
                        "organ" : "$organ",
                        "disease" : "$disease"
                    ]
                    map.state = "closed"
                    map.id = "disease_${index}"
                    tree << map
                }
                break

            case "disease":
                def outcomes, count = [:], disease = selection

                session.disease = disease

                def metas = MetaDataset.where {
                    organ == params.organ && disease == disease
                }
                outcomes = metas.collect { meta -> meta.outcome } as Set
                outcomes.each { outcome ->
                    def m = MetaDataset.createCriteria()
                    def results = m.listDistinct {
                        eq("organ", params.organ)
                        eq("disease", disease)
                        eq("outcome", outcome)
                    }
                    count[outcome] = results.size()
                }
                outcomes.eachWithIndex { outcome, index ->
                    Map map = [:]
                    map.data = "${outcome} (${count[outcome]})"
                    map.attr = [
                        "selection" : "${outcome}", 
                        "item" : "outcome",
                        "organ" : "${params.organ}",
                        "disease" : "$disease",
                        "outcome" : "$outcome"
                    ]
                    map.state = "closed"
                    map.id = "outcome_${index}"
                    tree << map
                }
                break

            case "outcome":
                def datasets, count = [:], outcome = selection

                session.outcome = outcome

                def metas = MetaDataset.where {
                    organ == params.organ && disease == params.disease && outcome == outcome
                }
                datasets = metas.collect { meta -> meta.datasetName } as Set

                datasets.eachWithIndex { dataset, index ->
                    Map map = [:]
                    map.data = "${dataset}"
                    map.attr = [
                        "selection" : "${dataset}",
                        "item" : "dataset",
                        "organ" : "${params.organ}",
                        "disease" : "${params.disease}",
                        "outcome" : "${params.outcome}"
                    ]
                    map.state = "open"
                    map.id = "dataset_${index}"
                    tree << map
                }
                break

            default:
                def organCount = [:]

                def organs = MetaDataset.findAll().collect { meta -> meta.organ } as Set

                organs.each { organ ->
                    organCount[organ] = MetaDataset.findAllByOrgan(organ).size()
                }
                organs.eachWithIndex { organ, index ->
                    def diseases = MetaDataset.findAllByOrgan(organ).collect { meta -> meta.disease } as Set

                    Map map = [:]
                    map.data = "${organ} (${organCount[organ]})"
                    map.attr = [ 
                        "selection" : "$organ", 
                        "item" : "organ",
                        "organ" : "$organ",
                    ]
                    map.state = "closed"
                    map.id = "organ_${index}"
                    tree << map
                }
        }

        render tree as JSON
    }

    def select(String name) {

        def metaDataset = MetaDataset.findByDatasetName(name)

        session.dataset = name

        render template: "metadataset", model: [metaDatasetInstance: metaDataset]
    }

    def submit(String organ, String disease, String outcome, String dataset) {
        
        session.dataset = dataset

        redirect controller: 'signature', action: 'upload'
    }
}

//{
//	"data" : "node_title",
//	// omit `attr` if not needed; the `attr` object gets passed to the jQuery `attr` function
//	"attr" : { "id" : "node_identificator", "some-other-attribute" : "attribute_value" },
//	// `state` and `children` are only used for NON-leaf nodes
//	"state" : "closed", // or "open", defaults to "closed"
//	"children" : [ /* an array of child nodes objects */ ]
//}

//{
//	// `data` can also be an object
//	"data" : {
//		"title" : "The node title",
//		// omit when not needed
//		"attr" : {},
//		// if `icon` contains a slash / it is treated as a file, used for background
//		// otherwise - it is added as a class to the <ins> node
//		"icon" : "folder"
//	},
//
//	// the `metadata` property will be saved using the jQuery `data` function on the `li` node
//	"metadata" : "a string, array, object, etc",
//
//	// if you use the language plugin - just set this property
//	// also make sure that `data` is an array of objects
//	"language" : "en" // any code you are using
//}