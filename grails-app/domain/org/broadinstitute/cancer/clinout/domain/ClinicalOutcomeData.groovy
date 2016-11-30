package org.broadinstitute.cancer.clinout.domain

class ClinicalOutcomeData {
    
    String sampleName
    String time
    boolean status
    String sex
    String hb
    String hcv
    String childPugh
    PatientCohort patientCohort
    
    static belongsTo = PatientCohort
    
    static constraints = {
    }
}
