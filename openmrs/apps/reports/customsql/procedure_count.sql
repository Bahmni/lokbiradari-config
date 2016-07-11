SELECT name,
  sum(case when gender = 'M' then cnt else 0 end) M,
  sum(case when gender = 'F' then cnt else 0 end) F,
  sum(case when gender not in ('M','F')  then cnt else 0 end) O
from (
SELECT name,gender,count(gender) as cnt from obs
  INNER JOIN person p on obs.person_id = p.person_id
  INNER JOIN concept_name cn on cn.concept_id=obs.value_coded and concept_name_type='FULLY_SPECIFIED'
where obs.concept_id=(select concept_id from concept_name where name='Surgical Procedure'
 and concept_name_type='FULLY_SPECIFIED') AND obs.obs_datetime between '#startDate#' and '#endDate#'
  and obs.voided=false
GROUP BY name,gender
ORDER BY name,gender
             ) as xxx
GROUP BY name
;
