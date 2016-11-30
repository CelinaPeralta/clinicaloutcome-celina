package org.broadinstitute.cancer.clinout.domain

class GeneExpressionData {
    
    PatientCohort patientCohort
    
    static belongsTo = PatientCohort

    static constraints = {
    }
}
