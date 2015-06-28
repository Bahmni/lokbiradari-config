select distinct concat(p.given_name,' ', p.middle_name, ' ',p.family_name) as Name ,pa.city_village as Village, pa.state_province as State,dcv.concept_full_name as Diagnosis
from diagnosis_concept_view dcv
   inner join obs o on dcv.concept_id=o.value_coded and o.voided=0
   inner join person_address pa on o.person_id=pa.person_id
   inner join person_name p on p.person_id = pa.person_id
where dcv.concept_full_name in ('Pregnancy Induced Hypertension','Hypertension','Eclampcia','Congenital heart disease','Rheumatic heart disease','Ischemic heart disease','Valvular Heart Disease','Fibroid uterus','Prolapse uterus','Dysfunctional uterine bleeding','Ovarian cyst','Contracture') and date(o.obs_datetime) between '#startDate#' and '#endDate#';
