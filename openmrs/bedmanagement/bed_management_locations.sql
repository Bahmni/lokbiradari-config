select * from location;
select * from location_tag;
select * from location_tag_map;
select * from bed_type;
select * from bed;
select * from bed_location_map;
select * from bed_patient_assignment_map;

insert into location_tag (name, description, creator, retired, date_created, uuid) values('Admission Location', 'General Ward Patients', 2, 0, NOW(), UUID());
SET @location_tag_id = (select location_tag_id from location_tag where name='Admission Location');

insert into bed_type values(1, 'bed', 'bed', 'bed');

# ICU WARD (2 Beds)
insert into location (name, description, creator, retired, date_created, uuid) values('ICU', 'ICU', 1, 0, NOW(), UUID());
SET @parent_location_id = (select location_id from location where name='ICU');
insert into location_tag_map values( @parent_location_id , @location_tag_id);

insert into location (name, description, creator, retired, date_created, uuid, parent_location) values('ICU Physical Location', 'ICU Physical Location', 1, 0, NOW(), UUID(), @parent_location_id);
SET @location_id = (select location_id from location where name='ICU Physical Location');

insert into location_tag_map values( @location_id , @location_tag_id);


insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(1, '1', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(2, '2', 'AVAILABLE', 1, UUID(), 1, NOW(), false);

insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(1, @location_id, 1, 1, 1);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(2, @location_id, 1, 2, 2);

# NICU (7 Beds)

insert into location (name, description, creator, retired, date_created, uuid) values('NICU', 'NICU', 1, 0, NOW(), UUID());
SET @parent_location_id = (select location_id from location where name='NICU');
insert into location_tag_map values( @parent_location_id , @location_tag_id);

insert into location (name, description, creator, retired, date_created, uuid, parent_location) values('NICU Physical Location', 'NICU Physical Location', 1, 0, NOW(), UUID(), @parent_location_id);
SET @location_id = (select location_id from location where name='NICU Physical Location');
insert into location_tag_map values( @location_id , @location_tag_id);

insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(3, '1', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(4, '2', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(5, '3', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(6, '4', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(7, '5', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(8, '6', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(9, '7', 'AVAILABLE', 1, UUID(), 1, NOW(), false);

insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(3, @location_id, 1, 1, 3);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(4, @location_id, 1, 2, 4);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(5, @location_id, 1, 3, 5);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(6, @location_id, 1, 4, 6);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(7, @location_id, 1, 5, 7);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(8, @location_id, 2, 5, 8);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(9, @location_id, 2, 4, 9);

# General Ward (28 + 32 + 2 Beds)

insert into location (name, description, creator, retired, date_created, uuid) values('General Ward', 'General Ward', 1, 0, NOW(), UUID());
SET @parent_location_id = (select location_id from location where name='General Ward');
insert into location_tag_map values( @parent_location_id , @location_tag_id);

insert into location (name, description, creator, retired, date_created, uuid, parent_location) values('General Ward Physical Location', 'General Ward Physical Location', 1, 0, NOW(), UUID(), @parent_location_id);
SET @location_id = (select location_id from location where name='General Ward Physical Location');

insert into location_tag_map values( @location_id , @location_tag_id);


insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(10, '1', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(11, '2', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(12, '3', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(13, '4', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(14, '5', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(15, '6', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(16, '7', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(17, '8', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(18, '9', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(19, '10', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(20, '11', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(21, '12', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(22, '13', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(23, '14', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(24, '15', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(25, '16', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(26, '17', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(27, '18', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(28, '19', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(29, '20', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(30, '21', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(31, '22', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(32, '23', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(33, '24', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(34, '25', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(35, '26', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(36, '27', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(37, '28', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(38, '29', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(39, '30', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(40, '31', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(41, '32', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(42, '33', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(43, '34', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(44, '35', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(45, '36', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(46, '37', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(47, '38', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(48, '39', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(49, '40', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(50, '41', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(51, '42', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(52, '43', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(53, '44', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(54, '45', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(55, '46', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(56, '47', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(57, '48', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(58, '49', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(59, '50', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(60, '51', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(61, '52', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(62, '53', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(63, '54', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(64, '55', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(65, '56', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(66, '57', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(67, '58', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(68, '59', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(69, '60', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(70, '61', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(71, '62', 'AVAILABLE', 1, UUID(), 1, NOW(), false);

insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(10, @location_id, 1, 1, 10);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(11, @location_id, 1, 2, 11);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(12, @location_id, 1, 3, 12);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(13, @location_id, 1, 4, 13);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(14, @location_id, 1, 5, 14);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(15, @location_id, 1, 6, 15);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(16, @location_id, 1, 7, 16);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(17, @location_id, 1, 8, 17);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(18, @location_id, 1, 9, 18);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(19, @location_id, 2, 1, 19);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(20, @location_id, 2, 2, 20);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(21, @location_id, 2, 3, 21);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(22, @location_id, 2, 4, 22);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(23, @location_id, 2, 5, 23);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(24, @location_id, 2, 6, 24);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(25, @location_id, 2, 7, 25);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(26, @location_id, 2, 8, 26);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(27, @location_id, 2, 9, 27);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(28, @location_id, 3, 1, 28);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(29, @location_id, 3, 2, 29);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(30, @location_id, 3, 3, 30);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(31, @location_id, 3, 4, 31);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(32, @location_id, 3, 5, 32);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(33, @location_id, 3, 6, 33);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(34, @location_id, 3, 7, 34);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(35, @location_id, 3, 8, 35);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(36, @location_id, 3, 9, 36);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(37, @location_id, 4, 1, 37);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(38, @location_id, 4, 2, 38);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(39, @location_id, 4, 3, 39);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(40, @location_id, 4, 4, 40);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(41, @location_id, 4, 5, 41);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(42, @location_id, 4, 6, 42);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(43, @location_id, 4, 7, 43);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(44, @location_id, 4, 8, 44);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(45, @location_id, 4, 9, 45);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(46, @location_id, 5, 1, 46);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(47, @location_id, 5, 2, 47);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(48, @location_id, 5, 3, 48);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(49, @location_id, 5, 4, 49);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(50, @location_id, 5, 5, 50);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(51, @location_id, 5, 6, 51);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(52, @location_id, 5, 7, 52);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(53, @location_id, 5, 8, 53);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(54, @location_id, 5, 9, 54);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(55, @location_id, 6, 1, 55);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(56, @location_id, 6, 2, 56);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(57, @location_id, 6, 3, 57);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(58, @location_id, 6, 4, 58);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(59, @location_id, 6, 5, 59);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(60, @location_id, 6, 6, 60);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(61, @location_id, 6, 7, 61);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(62, @location_id, 6, 8, 62);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(63, @location_id, 6, 9, 63);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(64, @location_id, 7, 1, 64);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(65, @location_id, 7, 2, 65);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(66, @location_id, 7, 3, 66);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(67, @location_id, 7, 4, 67);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(68, @location_id, 7, 5, 68);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(69, @location_id, 7, 6, 69);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(70, @location_id, 7, 7, 70);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(71, @location_id, 7, 8, 71);



