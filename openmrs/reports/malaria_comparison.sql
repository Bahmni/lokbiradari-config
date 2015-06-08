select r.identifier "Patient ID", r.given_name as "First Name", r.family_name as "Last Name", r.gender as "Gender", r.age as "Age",
        date(r.obs_datetime) as "Test_Date", r.value_text as "Rapid Test For Malaria", p.value_text as "PS For MP"
    from
        (select pi.identifier, pn.given_name, pn.family_name, ps.gender, floor(datediff(o.obs_datetime,ps.birthdate)/365) as age,
                o.person_id, cn.name, o.value_text, o.obs_datetime
        from obs o
                inner join concept_name cn on o.concept_id=cn.concept_id
        inner join patient_identifier pi on o.person_id = pi.patient_id
        inner join person ps on ps.person_id = o.person_id
        inner join person_name pn on o.person_id = pn.person_id
                where cn.name = "RAPID TEST FOR MALARIA" and o.value_text is not null and o.voided = 0) as r
        inner join
        (select o.person_id, cn.name, o.value_text, o.obs_datetime
                from obs o
                inner join concept_name cn on o.concept_id=cn.concept_id
        where cn.name = "PS FOR MP" and o.value_text is not null and o.voided = 0) as p
        on r.person_id=p.person_id and date(r.obs_datetime) = date(p.obs_datetime)
    where date(r.obs_datetime) between '#startDate#' and '#endDate#'
    group by r.obs_datetime,r.identifier,r.value_text,p.value_text
    order by r.obs_datetime;
