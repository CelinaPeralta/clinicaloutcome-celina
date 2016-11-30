package org.broadinstitute.cancer.clinout.domain

class PatientCohort {

    MetaDataset meta
    byte[] geneExpressionData
    String clinicalOutcomeData
    Date dateCreated
    Date lastUpdated

    static embedded = ['meta']

    static constraints = {
    }
}
