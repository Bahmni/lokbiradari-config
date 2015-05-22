CREATE TABLE reporting_concept_range(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
concept_name VARCHAR(255) NOT NULL,
low_value INT NOT NULL DEFAULT 0,
high_value INT NOT NULL DEFAULT 0,
sort_order INT NOT NULL DEFAULT 0
);

insert into reporting_concept_range(name,concept_name,low_value,high_value,sort_order) value ('Haemoglobin 00-06', 'Haemoglobin', 0 , 6, 1);
insert into reporting_concept_range(name,concept_name,low_value,high_value,sort_order) value ('Haemoglobin 06-09', 'Haemoglobin', 6 , 9, 2);
insert into reporting_concept_range(name,concept_name,low_value,high_value,sort_order) value ('Haemoglobin 09-12', 'Haemoglobin', 9 , 12, 3);
insert into reporting_concept_range(name,concept_name,low_value,high_value,sort_order) value ('Haemoglobin 12 above', 'Haemoglobin', 12 , 999, 4);



insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('0 - 5 years', 'Haemoglobin', 0, 0, 1, -1, 1);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('5 - 12 years', 'Haemoglobin', 5, 0, 12, -1, 2);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('12 ‐ 18 years', 'Haemoglobin', 12, 0, 18, -1, 3);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('18 ‐ 45 years', 'Haemoglobin', 18, 0, 45, -1, 4);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('>= 45 Years', 'Haemoglobin', 45, 0, 999, 0, 5);

