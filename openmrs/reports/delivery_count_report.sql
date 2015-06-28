select cn.name, count(distinct p.person_id) as Count
from obs o
   inner join person p on o.person_id = p.person_id and o.voided=0
   inner join concept_name cn on o.concept_id=cn.concept_id and cn.voided=0 and cn.concept_name_type = 'FULLY_SPECIFIED'
where cn.name in ('Delivery Notes') and date(o.obs_datetime) between '#startDate#' and '#endDate#'
group by cn.name;
