package org.broadinstitute.cancer.clinout.controllers

import org.springframework.dao.DataIntegrityViolationException
import org.broadinstitute.cancer.clinout.domain.MetaDataset

class MetaDatasetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [metaDatasetInstanceList: MetaDataset.list(params), metaDatasetInstanceTotal: MetaDataset.count()]
    }

    def create() {
        [metaDatasetInstance: new MetaDataset(params)]
    }

    def save() {
        def metaDatasetInstance = new MetaDataset(params)
        if (!metaDatasetInstance.save(flush: true)) {
            render(view: "create", model: [metaDatasetInstance: metaDatasetInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), metaDatasetInstance.id])
        redirect(action: "show", id: metaDatasetInstance.id)
    }

    def show() {
        def metaDatasetInstance = MetaDataset.get(params.id)
        if (!metaDatasetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), params.id])
            redirect(action: "list")
            return
        }

        [metaDatasetInstance: metaDatasetInstance]
    }

    def edit() {
        def metaDatasetInstance = MetaDataset.get(params.id)
        if (!metaDatasetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), params.id])
            redirect(action: "list")
            return
        }

        [metaDatasetInstance: metaDatasetInstance]
    }

    def update() {
        def metaDatasetInstance = MetaDataset.get(params.id)
        if (!metaDatasetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (metaDatasetInstance.version > version) {
                metaDatasetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'metaDataset.label', default: 'MetaDataset')] as Object[],
                          "Another user has updated this MetaDataset while you were editing")
                render(view: "edit", model: [metaDatasetInstance: metaDatasetInstance])
                return
            }
        }

        metaDatasetInstance.properties = params

        if (!metaDatasetInstance.save(flush: true)) {
            render(view: "edit", model: [metaDatasetInstance: metaDatasetInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), metaDatasetInstance.id])
        redirect(action: "show", id: metaDatasetInstance.id)
    }

    def delete() {
        def metaDatasetInstance = MetaDataset.get(params.id)
        if (!metaDatasetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), params.id])
            redirect(action: "list")
            return
        }

        try {
            metaDatasetInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'metaDataset.label', default: 'MetaDataset'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
