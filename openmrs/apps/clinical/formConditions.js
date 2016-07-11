Bahmni.ConceptSet.FormConditions.rules = {
    'TB Template, Is patient referred' : function (formName, formFieldValues) {
        var TBPatientReferred = formFieldValues['TB Template, Is patient referred'];
        if (TBPatientReferred == 'True') {
            return {
                enable: ["TB Template, Place of Referral"],
                disable: ["TB Template, Started on Treatment","TB Template, Adherence to treatment","TB Template, Result of treatment","TB Template, Treatment Regime"]
            }
        } else {
            return {
                disable: ["TB Template, Place of Referral"],
                enable: ["TB Template, Started on Treatment","TB Template, Adherence to treatment","TB Template, Result of treatment","TB Template, Treatment Regime"]
            }
        } 
    },
    'TB Template, Diagnosis Based on' : function (formName, formFieldValues) {
        var DiagnosisFrom = formFieldValues['TB Template, Diagnosis Based on'];
        if (DiagnosisFrom == 'TB Template, Clinical Examination'|| DiagnosisFrom == 'TB Template, FNAC/ Biopsy' ) {
            return {
                enable: ["TB Template, Extra Pulmonary"]
            }
        } else {
            return {
                disable: ["TB Template, Extra Pulmonary"]
            }
        } 
    },
    'TB Template, Started on Treatment' : function (formName, formFieldValues) {
        var startedOnTreatment = formFieldValues["TB Template, Started on Treatment"];
        if (startedOnTreatment=="True") {
            return {
                enable: ["TB Template, Date of starting treatment"]
            }
        } else {
            return {
                disable: ["TB Template, Date of starting treatment"]
            }
        }
    }
};