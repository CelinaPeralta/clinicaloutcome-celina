// Place your Spring DSL code here
beans = {

    userDetailsService(org.broadinstitute.cancer.clinout.services.UserDetailsService)

    datasetService(org.broadinstitute.cancer.clinout.services.DatasetService)

    metaDatasetService(org.broadinstitute.cancer.clinout.services.MetaDatasetService)

    genePatternService(org.broadinstitute.cancer.clinout.services.GenePatternService)
    
    securityListenerService(org.broadinstitute.cancer.clinout.services.SecurityListenerService)

}
