INSERT INTO `addon_account` (`name`, `label`, `shared`)
VALUES ('society_fireman', 'Firefighter', 1)
;

INSERT INTO `datastore` (`name`, `label`, `shared`)
VALUES ('society_fireman', 'Firefighter', 1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`)
VALUES ('society_fireman', 'Firefighter', 1)
;

INSERT INTO `jobs` (`name`, `label`)
VALUES ('fireman', 'LSFD'),
       ('offfireman', 'Off-Duty')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 0, 'recruit', 'Recrue', 200, '{}', '{}'),
       ('fireman', 1, 'officer', 'Officier', 250, '{}', '{}'),
       ('fireman', 4, 'boss', 'Commandant', 400, '{}', '{}'),
       ('offfireman', 0, 'recruit', 'Recrue', 200, '{}', '{}'),
       ('offfireman', 1, 'officer', 'Officier', 250, '{}', '{}'),
       ('offfireman', 4, 'boss', 'Commandant', 400, '{}', '{}')
;
