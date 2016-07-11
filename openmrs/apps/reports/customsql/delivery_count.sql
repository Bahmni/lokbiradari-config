SELECT name as 'Delivery Type',count(*) as count from obs
  INNER JOIN person p on obs.person_id = p.person_id
  INNER JOIN concept_name cn on cn.concept_id=obs.value_coded and concept_name_type='FULLY_SPECIFIED'
where obs.concept_id=(select concept_id from concept_name where name='Delivery, Type'
                                                                and concept_name_type='FULLY_SPECIFIED') AND obs.obs_datetime between '#startDate#' and '#endDate#'
      and obs.voided=false
GROUP BY name
ORDER BY name

