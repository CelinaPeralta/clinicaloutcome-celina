package org.broadinstitute.cancer.clinout.domain

class Signature {
    
    

    static constraints = {
    }
}

class SignatureEntry {
    String geneName
    String probeId
    String up1Down2
    String coxScore
}