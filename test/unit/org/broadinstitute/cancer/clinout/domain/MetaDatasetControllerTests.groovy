package org.broadinstitute.cancer.clinout.domain



import org.junit.*
import grails.test.mixin.*
import org.broadinstitute.cancer.clinout.controllers.MetaDatasetController

@TestFor(MetaDatasetController)
@Mock(MetaDataset)
class MetaDatasetControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/metaDataset/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.metaDatasetInstanceList.size() == 0
        assert model.metaDatasetInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.metaDatasetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.metaDatasetInstance != null
        assert view == '/metaDataset/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/metaDataset/show/1'
        assert controller.flash.message != null
        assert MetaDataset.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/metaDataset/list'


        populateValidParams(params)
        def metaDataset = new MetaDataset(params)

        assert metaDataset.save() != null

        params.id = metaDataset.id

        def model = controller.show()

        assert model.metaDatasetInstance == metaDataset
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/metaDataset/list'


        populateValidParams(params)
        def metaDataset = new MetaDataset(params)

        assert metaDataset.save() != null

        params.id = metaDataset.id

        def model = controller.edit()

        assert model.metaDatasetInstance == metaDataset
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/metaDataset/list'

        response.reset()


        populateValidParams(params)
        def metaDataset = new MetaDataset(params)

        assert metaDataset.save() != null

        // test invalid parameters in update
        params.id = metaDataset.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/metaDataset/edit"
        assert model.metaDatasetInstance != null

        metaDataset.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/metaDataset/show/$metaDataset.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        metaDataset.clearErrors()

        populateValidParams(params)
        params.id = metaDataset.id
        params.version = -1
        controller.update()

        assert view == "/metaDataset/edit"
        assert model.metaDatasetInstance != null
        assert model.metaDatasetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/metaDataset/list'

        response.reset()

        populateValidParams(params)
        def metaDataset = new MetaDataset(params)

        assert metaDataset.save() != null
        assert MetaDataset.count() == 1

        params.id = metaDataset.id

        controller.delete()

        assert MetaDataset.count() == 0
        assert MetaDataset.get(metaDataset.id) == null
        assert response.redirectedUrl == '/metaDataset/list'
    }
}
