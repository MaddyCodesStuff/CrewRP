USE `essentialmode`;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 2, 'probationary', 'Probationary Firefighter', 260, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 3, 'firefighter1', 'Firefighter 1', 280, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 5, 'firefighter2', 'Firefighter II', 300, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 6, 'firefighter3', 'Probationary Firefighter III', 320, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 7, 'lieutenant', 'Lieutenant', 350, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 8, 'captain', 'Captain', 375, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('fireman', 9, 'batallionchief', 'Batallion Chief', 425, '{}', '{}');

UPDATE `job_grades`
SET `label`  = 'Fire Chief',
    `salary` = 450
WHERE `name` = 'boss'
  AND `job_name` = 'fireman';
UPDATE `job_grades`
SET `label`  = 'Volunteer Firefighter',
    `salary` = 250
WHERE `name` = 'recruit'
  AND `job_name` = 'fireman';
UPDATE `job_grades`
SET `label`  = 'Trainee Firefighter',
    `salary` = 255
WHERE `name` = 'officer'
  AND `job_name` = 'fireman';

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('offfireman', 2, 'probationary', 'Probationary Firefighter', 0, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('offfireman', 3, 'firefighter1', 'Firefighter 1', 0, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('offfireman', 5, 'firefighter2', 'Firefighter II', 0, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('offfireman', 6, 'firefighter3', 'Probationary Firefighter III', 0, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('offfireman', 7, 'lieutenant', 'Lieutenant', 0, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('offfireman', 8, 'captain', 'Captain', 0, '{}', '{}');
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES ('offfireman', 9, 'batallionchief', 'Batallion Chief', 0, '{}', '{}');

UPDATE `job_grades`
SET `label`  = 'Fire Chief',
    `salary` = 0
WHERE `name` = 'boss'
  AND `job_name` = 'offfireman';
UPDATE `job_grades`
SET `label`  = 'Volunteer Firefighter',
    `salary` = 0
WHERE `name` = 'recruit'
  AND `job_name` = 'offfireman';
UPDATE `job_grades`
SET `label`  = 'Trainee Firefighter',
    `salary` = 0
WHERE `name` = 'officer'
  AND `job_name` = 'offfireman';

