select * from(
Select ANC_Mother_Identifier as ANC_Mother_Identifier ,Age,Birthdate,Tehsil,District,City_Village,max(A.Delivery_date) as Delivery_date,
max(A.Delivery_Type) as Delivery_Type,A.Mother_Weight as Mother_Weight,max(A.Child_Weight) as Child_Weight, max(A.Child_Gender) as Child_Gender from (
SELECT
o.person_id,
  pi.identifier AS 'ANC_Mother_Identifier',
  concat(pn.given_name, " ", pn.family_name)                    AS 'Patient Name',
  floor(DATEDIFF(DATE(o.obs_datetime), p.birthdate) / 365)      AS 'Age',
  DATE_FORMAT(p.birthdate, "%d-%b-%Y")                          AS 'Birthdate',
  paddress.city_village                                            AS 'City_Village', 
  paddress.address3                                                AS 'Tehsil', 
paddress.county_district AS 'District',
  
 date(GROUP_CONCAT(DISTINCT(IF(obs_fscn.name = 'Date of Birth', coalesce(o.value_numeric, o.value_boolean, o.value_text, o.value_datetime, coded_scn.name, coded_fscn.name), NULL)) ORDER BY o.obs_id DESC))AS 'Delivery_date',
  GROUP_CONCAT(DISTINCT(IF(obs_fscn.name = 'Delivery, Type', coalesce(o.value_numeric, o.value_boolean, o.value_text, o.value_datetime, coded_scn.name, coded_fscn.name), NULL)) ORDER BY o.obs_id DESC) AS 'Delivery_Type',
 case when o.form_namespace_and_path='6aa2c0e0-7c0f-4f44-b281-33e57b7595be^' then GROUP_CONCAT(DISTINCT(IF(obs_fscn.name = 'Weight', coalesce(o.value_numeric, o.value_boolean, o.value_text, o.value_datetime, coded_scn.name, coded_fscn.name), NULL)) ORDER BY o.obs_id DESC)end as 'Mother_Weight',
  case when o.form_namespace_and_path='a02c4673-bff7-4f32-a28a-f39c34687868^' then GROUP_CONCAT(DISTINCT(IF(obs_fscn.name = 'Weight', coalesce(o.value_numeric, o.value_boolean, o.value_text, o.value_datetime, coded_scn.name, coded_fscn.name), NULL)) ORDER BY o.obs_id DESC)end as 'Child_Weight',
(GROUP_CONCAT(DISTINCT(IF(obs_fscn.name = 'Gender', coalesce(o.value_numeric, o.value_boolean, o.value_text, o.value_datetime, coded_scn.name, coded_fscn.name), NULL)) ORDER BY o.obs_id DESC))AS 'Child_Gender'
  FROM obs o
  JOIN concept obs_concept ON obs_concept.concept_id=o.concept_id AND obs_concept.retired is false
  JOIN concept_name obs_fscn on o.concept_id=obs_fscn.concept_id AND obs_fscn.concept_name_type="FULLY_SPECIFIED" AND obs_fscn.voided is false
   AND obs_fscn.name IN ('Delivery Notes','Date of Birth','Delivery, Type','Delivery Note, Outcome of Delivery','Delivery Note, Liveborn infant details','Gender','Weight')
  LEFT JOIN concept_name obs_scn on o.concept_id=obs_scn.concept_id AND obs_scn.concept_name_type="SHORT" AND obs_scn.voided is false
  JOIN person p ON p.person_id = o.person_id AND p.voided is false
  JOIN patient_identifier pi ON p.person_id = pi.patient_id AND pi.voided is false
  JOIN patient_identifier_type pit ON pi.identifier_type = pit.patient_identifier_type_id AND pit.retired is false  JOIN person_name pn ON pn.person_id = p.person_id AND pn.voided is false
  JOIN encounter e ON o.encounter_id=e.encounter_id AND e.voided is false
  JOIN encounter_provider ep ON ep.encounter_id=e.encounter_id
  JOIN provider pro ON pro.provider_id=ep.provider_id
  LEFT OUTER JOIN person_name provider_person ON provider_person.person_id = pro.person_id
  JOIN visit v ON v.visit_id=e.visit_id AND v.voided is false
  JOIN visit_type vt ON vt.visit_type_id=v.visit_type_id AND vt.retired is false
  LEFT JOIN location l ON e.location_id = l.location_id AND l.retired is false
  LEFT JOIN obs parent_obs ON parent_obs.obs_id=o.obs_group_id
  LEFT JOIN concept_name parent_cn ON parent_cn.concept_id=parent_obs.concept_id AND parent_cn.concept_name_type="FULLY_SPECIFIED"
  LEFT JOIN concept_name coded_fscn on coded_fscn.concept_id = o.value_coded AND coded_fscn.concept_name_type="FULLY_SPECIFIED" AND coded_fscn.voided is false
  LEFT JOIN concept_name coded_scn on coded_scn.concept_id = o.value_coded AND coded_fscn.concept_name_type="SHORT" AND coded_scn.voided is false
  LEFT OUTER JOIN person_attribute pa ON p.person_id = pa.person_id AND pa.voided is false
  LEFT OUTER JOIN person_attribute_type pat ON pa.person_attribute_type_id = pat.person_attribute_type_id AND pat.retired is false
  LEFT OUTER JOIN concept_name scn ON pat.format = "org.openmrs.Concept" AND pa.value = scn.concept_id AND scn.concept_name_type = "SHORT" AND scn.voided is false
  LEFT OUTER JOIN concept_name fscn ON pat.format = "org.openmrs.Concept" AND pa.value = fscn.concept_id AND fscn.concept_name_type = "FULLY_SPECIFIED" AND fscn.voided is false 
  LEFT OUTER JOIN person_address paddress ON p.person_id = paddress.person_id AND paddress.voided is false 
  WHERE o.voided is false  
  AND cast(o.obs_datetime AS DATE) between '#startDate#'AND '#endDate#' GROUP BY e.encounter_id 
  ) as A group by A.ANC_Mother_Identifier)as sample where sample.Child_Weight>0;