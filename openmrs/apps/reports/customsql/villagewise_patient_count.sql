select county_district as District,
	address3 as Blocks,
	city_village as Village,
	count(city_village) as Patient_Count  
from person_address 
group by city_village 
having count(city_village) > 0 
order by county_district,address3,city_village;
