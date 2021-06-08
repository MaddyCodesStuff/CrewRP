USE 'essentialmode';

DELETE
FROM `users`;
DELETE
FROM `user_accounts`;
DELETE
FROM `user_contacts`;
DELETE
FROM `user_inventory`;
DELETE
FROM `user_lastcharacter`;
DELETE
FROM `user_licenses`;
DELETE
FROM `user_parkings`;
DELETE
FROM `characters`;
DELETE
FROM `owned_properties`;
DELETE
FROM `owned_vehicles`;
DELETE
FROM `rented_vehicles`;
DELETE
FROM `cardealer_vehicles`;
DELETE
FROM `billing`;

DELETE
FROM `jobs`
WHERE `name` = 'vigne';
DELETE
FROM `jobs`
WHERE `name` = 'trucker';
DELETE
FROM `job_grades`
WHERE `job_name` = 'vigne';
DELETE
FROM `job_grades`
WHERE `job_name` = 'trucker';