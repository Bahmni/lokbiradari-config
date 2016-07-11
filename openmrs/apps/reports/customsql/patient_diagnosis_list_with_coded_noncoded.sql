select identifier,
  patient_name name, village,  state, Diagnosis, diagnosis_date, username,
  CASE coded_noncoded
  WHEN 14 THEN 'Non-Coded'
  ELSE 'Coded'
  END as 'Coded/Non-Coded'

from (
       SELECT
         patient_identifier.identifier,
         concat(pn.given_name, " ", pn.family_name) patient_name, pa.city_village village, pa.state_province state,
         value_text AS 'Diagnosis',
         date(diagnosis.obs_datetime) diagnosis_date,
         username,
         diagnosis.concept_id coded_noncoded
       FROM obs diagnosis, users, patient_identifier, person_name pn, person_address pa
       WHERE diagnosis.concept_id = 14
             AND date(diagnosis.obs_datetime) between '#startDate#' and '#endDate#'
             AND diagnosis.creator = users.user_id
             AND patient_identifier.patient_id = diagnosis.person_id
             AND diagnosis.person_id = pn.person_id
             AND diagnosis.person_id = pa.person_id
       UNION ALL

       SELECT
         patient_identifier.identifier,
         concat(pn.given_name, " ", pn.family_name) patient_name, pa.city_village village, pa.state_province state,
         coded_diagnosis.name AS 'Diagnosis',
         date(diagnosis.obs_datetime) diagnosis_date,
         username,
         diagnosis.concept_id coded_noncoded
       FROM obs diagnosis, users, patient_identifier, concept_name coded_diagnosis, person_name pn, person_address pa
       WHERE diagnosis.concept_id = 15
             AND date(diagnosis.obs_datetime) between '#startDate#' and '#endDate#'
             AND diagnosis.creator = users.user_id
             AND patient_identifier.patient_id = diagnosis.person_id
             AND diagnosis.value_coded = coded_diagnosis.concept_id
             AND concept_name_type='FULLY_SPECIFIED'
             AND diagnosis.person_id = pn.person_id
             AND diagnosis.person_id = pa.person_id
     ) all_diagnoses
ORDER BY diagnosis_date
;
