package org.broadinstitute.cancer.clinout.domain

class MetaDataset {

    String datasetId
    String datasetName
    String samples
    String studyDesignLevel
    String studyDesign
    String patientEnrollment
    String organ
    String disease
    String tissueType
    String outcome
    String outcomeType
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
    String notes
    boolean publicAccessToGenomicData
    boolean publicAccessToClinicalData


    static constraints = {
    }

    MetaDataset(String string) {

        def parts = string.split(/,/)

        datasetId                  = parts[0] ?: ""
        datasetName                = parts[1] ?: ""
        samples                    = parts[2] ?: ""
        studyDesignLevel           = parts[3] ?: ""
        studyDesign                = parts[4] ?: ""
        patientEnrollment          = parts[5] ?: ""
        organ                      = parts[6] ?: ""
        disease                    = parts[7] ?: ""
        tissueType                 = parts[8] ?: ""
        outcome                    = parts[9] ?: ""
        outcomeType                = parts[10] ?: ""
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
        notes                      = parts[23] ?: ""
    }

}