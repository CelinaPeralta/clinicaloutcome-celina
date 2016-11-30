package org.broadinstitute.cancer.clinout.domain

class Dataset {
    
    String datasetId
    String datasetName
    Number samples
    String studyDesignLevel
    String studyDesign
    String patientEnrollment
    String organ
    String disease
    String tissueType
    String clinicalOutcome
    String clinicalOutcomeType
    String geographicArea
    String country
    String ethnicity
    String timeScale
    String medianFollowUpTime
    String molecularInformation
    String referencePmid
    String assayPlatform
    String tissueStorage
    String accessionInPublicDatabase
    boolean publicAccessToGenomicData
    boolean publicAccessToClinicalData
    

    static constraints = {
    }
    
    Dataset(String string) {
        
        def parts = string.split(/,/)
        
        datasetId                  = parts[0] ?: ""
        datasetName                = parts[1] ?: ""
        samples                    = new String(parts[2]).toInteger()
        studyDesignLevel           = parts[3] ?: ""
        studyDesign                = parts[4] ?: ""
        patientEnrollment          = parts[5] ?: ""
        organ                      = parts[6] ?: ""
        disease                    = parts[7] ?: ""
        tissueType                 = parts[8] ?: ""
        clinicalOutcome            = parts[9] ?: ""
        clinicalOutcomeType        = parts[10] ?: ""
        geographicArea             = parts[11] ?: ""
        country                    = parts[12] ?: ""
        ethnicity                  = parts[13] ?: ""
        timeScale                  = parts[14] ?: ""
        medianFollowUpTime         = parts[15] ?: ""
        molecularInformation       = parts[16] ?: ""
        referencePmid              = parts[17] ?: ""
        assayPlatform              = parts[18] ?: ""
        tissueStorage              = parts[19] ?: ""
        accessionInPublicDatabase  = parts[20] ?: ""
        publicAccessToGenomicData  = parts[21].equalsIgnoreCase("Y") ?: false
        publicAccessToClinicalData = parts[22].equalsIgnoreCase("Y") ?: false
    }
}
