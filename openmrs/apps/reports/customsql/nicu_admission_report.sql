select pi.identifier as 'Identifier',concat(coalesce(pn.given_name,''),' ',coalesce(pn.middle_name,''),' ',coalesce(pn.family_name,''))as Name,
p.gender as 'Gender',p.birthdate as 'DOB',bd.bed_number as 'Bed Number',va.date_created as 'Admission Date', va.date_changed as 'Discharge Date' from visit_attribute va
inner join visit_attribute_type vat on vat.visit_attribute_type_id = va.attribute_type_id
                                       and vat.name='Admission Status'
                                       and cast(va.date_created as DATE) BETWEEN '#startDate#' and '#endDate#'
inner join visit v on v.visit_id = va.visit_id
inner join bed_patient_assignment_map bedmap on bedmap.patient_id=v.patient_id
  inner join bed_location_map blm on blm.bed_id=bedmap.bed_id
  inner join location l on l.location_id = blm.location_id and l.name='NICU Physical Location'
  inner join bed bd on bd.bed_id=blm.bed_id
  inner join patient_identifier pi on pi.patient_id=v.patient_id
inner join person p on p.person_id=pi.patient_id
INNER JOIN person_name pn on pn.person_id=p.person_id
order by va.date_created;
