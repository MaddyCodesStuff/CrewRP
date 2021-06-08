USE `essentialmode`;

INSERT INTO `addon_account` (`name`, `label`, `shared`)
VALUES ('society_storeclerk', 'Storeclerk', 1)
;

INSERT INTO `datastore` (`name`, `label`, `shared`)
VALUES ('society_storeclerk', 'Storeclerk', 1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`)
VALUES ('society_storeclerk', 'Storeclerk', 1)
;

INSERT INTO `jobs` (`name`, `label`)
VALUES ('storeclerk', 'Storeclerk')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('police', 0, 'clerk', 'Clerk', 0, '{}', '{}'),
       ('police', 4, 'boss', 'Owner', 0, '{}', '{}')
;