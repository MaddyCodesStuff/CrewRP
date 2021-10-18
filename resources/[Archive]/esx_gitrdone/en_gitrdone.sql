INSERT INTO `addon_account` (`name`, `label`, `shared`)
VALUES ('society_gitrdone', 'GrD Construction', 1)
;

INSERT INTO `datastore` (`name`, `label`, `shared`)
VALUES ('society_gitrdone', 'GrD Construction', 1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`)
VALUES ('society_gitrdone', 'GrD Construction', 1)
;

INSERT INTO `jobs` (`name`, `label`)
VALUES ('gitrdone', 'GrD Construction')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('gitrdone', 2, 'laborer', 'Laborer', 60, '{}', '{}'),
       ('gitrdone', 2, 'operator', 'Equipment Operator', 60, '{}', '{}'),
       ('gitrdone', 3, 'foreman', 'Job Foreman', 85, '{}', '{}'),
       ('gitrdone', 4, 'boss', 'Contractor / Owner', 100, '{}', '{}')
;
