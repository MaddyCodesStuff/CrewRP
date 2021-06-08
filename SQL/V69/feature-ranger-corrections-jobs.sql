INSERT INTO `addon_account` (`name`, `label`, `shared`)
VALUES ('society_corrections', 'Prison Guard', 1),
       ('society_ranger', 'Park Ranger', 1)
;

INSERT INTO `datastore` (`name`, `label`, `shared`)
VALUES ('society_corrections', 'Prison Guard', 1),
       ('society_ranger', 'Park Ranger', 1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`)
VALUES ('society_corrections', 'Prison Guard', 1),
       ('society_ranger', 'Park Ranger', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`)
VALUES ('corrections', 'Prison Guard', 1),
       ('parkranger', 'Park Ranger', 1)
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('corrections', 0, 'guard', 'Prison Guard', 300, '{}', '{}'),
       ('corrections', 4, 'boss', 'Prison Warden', 300, '{}', '{}'),
       ('parkranger', 0, 'ranger', 'Park Ranger', 300, '{}', '{}'),
       ('parkranger', 4, 'boss', 'Chief Ranger', 300, '{}', '{}')
;

