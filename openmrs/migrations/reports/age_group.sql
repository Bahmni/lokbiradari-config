CREATE TABLE IF NOT EXISTS reporting_age_group(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
report_group_name VARCHAR(255) NOT NULL,
min_years INT NOT NULL DEFAULT 0,
min_days INT NOT NULL DEFAULT 0,
max_years INT NOT NULL DEFAULT 0,
max_days INT NOT NULL DEFAULT 0,
sort_order INT NOT NULL DEFAULT 0
);

insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('0 - 5 years', 'Haemoglobin', 0, 0, 1, -1, 1);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('5 - 12 years', 'Haemoglobin', 5, 0, 12, -1, 2);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('12 ‐ 18 years', 'Haemoglobin', 12, 0, 18, -1, 3);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('18 ‐ 45 years', 'Haemoglobin', 18, 0, 45, -1, 4);
insert into reporting_age_group(name, report_group_name, min_years, min_days, max_years , max_days, sort_order) values('>= 45 Years', 'Haemoglobin', 45, 0, 999, 0, 5);

