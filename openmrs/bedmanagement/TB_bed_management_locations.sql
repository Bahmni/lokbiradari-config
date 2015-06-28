# TB Ward (20 Beds)
SET @location_tag_id = (select location_tag_id from location_tag where name='Admission Location');
insert into location (name, description, creator, retired, date_created, uuid) values('TB Ward', 'TB Ward', 1, 0, NOW(), UUID());
SET @parent_location_id = (select location_id from location where name='TB Ward');
insert into location_tag_map values( @parent_location_id , @location_tag_id);

insert into location (name, description, creator, retired, date_created, uuid, parent_location) values('TB Ward Physical Location', 'TB Ward Physical Location', 1, 0, NOW(), UUID(), @parent_location_id);
SET @location_id = (select location_id from location where name='TB Ward Physical Location');

insert into location_tag_map values( @location_id , @location_tag_id);

insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(61, '1', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(62, '2', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(63, '3', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(64, '4', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(65, '5', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(66, '6', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(67, '7', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(68, '8', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(69, '9', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(70, '10', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(71, '11', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(72, '12', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(73, '13', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(74, '14', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(75, '15', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(76, '16', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(77, '17', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(78, '18', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(79, '19', 'AVAILABLE', 1, UUID(), 1, NOW(), false);
insert into bed (bed_id, bed_number, status, bed_type_id, uuid, creator, date_created, voided) values(80, '20', 'AVAILABLE', 1, UUID(), 1, NOW(), false);


insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(61, @location_id, 1, 1, 61);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(62, @location_id, 1, 2, 62);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(63, @location_id, 1, 3, 63);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(64, @location_id, 1, 4, 64);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(65, @location_id, 1, 5, 65);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(66, @location_id, 1, 6, 66);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(67, @location_id, 1, 7, 67);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(68, @location_id, 1, 8, 68);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(69, @location_id, 1, 9, 69);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(70, @location_id, 2, 1, 70);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(71, @location_id, 2, 2, 71);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(72, @location_id, 2, 3, 72);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(73, @location_id, 2, 4, 73);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(74, @location_id, 2, 5, 74);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(75, @location_id, 2, 6, 75);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(76, @location_id, 2, 7, 76);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(77, @location_id, 2, 8, 77);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(78, @location_id, 2, 9, 78);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(79, @location_id, 3, 1, 79);
insert into bed_location_map(bed_location_map_id, location_id, row_number, column_number, bed_id) values(80, @location_id, 3, 2, 80);

