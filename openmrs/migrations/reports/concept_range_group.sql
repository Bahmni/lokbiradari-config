CREATE TABLE IF NOT EXISTS reporting_concept_range(
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
