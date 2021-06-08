USE `essentialmode`;

INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation1_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation1_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation1_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation2_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation2_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation2_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation3_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation3_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation3_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation4_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation4_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation4_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation5_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation5_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation5_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation6_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation6_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation6_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation7_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation7_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation7_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation8_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation8_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation8_Gadgets', 'parachute', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation9_Gadgets', 'binoculars', '50');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation9_Gadgets', 'scuba', '100');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation9_Gadgets', 'parachute', '150');

INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation2_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation2_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation2_Armor', 'bodyarmor_3', '500');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation3_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation3_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation3_Armor', 'bodyarmor_3', '500');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation4_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation4_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation4_Armor', 'bodyarmor_3', '500');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation5_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation5_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation5_Armor', 'bodyarmor_3', '500');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation6_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation6_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation6_Armor', 'bodyarmor_3', '500');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation7_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation7_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation7_Armor', 'bodyarmor_3', '500');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation8_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation8_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation8_Armor', 'bodyarmor_3', '500');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation9_Armor', 'bodyarmor_1', '150');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation9_Armor', 'bodyarmor_2', '300');
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation9_Armor', 'bodyarmor_3', '500');

CREATE TABLE IF NOT EXISTS `properties_wardrobe`
(
    `id`       int(11)     NOT NULL AUTO_INCREMENT,
    `property` varchar(32) NOT NULL,
    `owner`    varchar(50) NOT NULL,
    `name`     varchar(50) NOT NULL,
    `data`     longtext    NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`owner`, `property`, `name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = `latin1`;

UPDATE `items`
SET `label` = 'Diamonds'
WHERE `name` = 'diamond';
UPDATE `items`
SET `label` = 'Fuel'
WHERE `name` = 'essence';
UPDATE `items`
SET `label` = 'Oil'
WHERE `name` = 'petrol';
UPDATE `items`
SET `label` = 'Refined Oil'
WHERE `name` = 'petrol_raffin';

UPDATE `job_grades`
SET `skin_male` = '{"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'
WHERE `job_name` = 'tailor';
UPDATE `job_grades`
SET `skin_female` = '{"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'
WHERE `job_name` = 'tailor';
UPDATE `job_grades`
SET `salary` = '40'
WHERE `job_name` = 'storeclerk'
  AND `name` = 'clerk';
UPDATE `job_grades`
SET `salary` = '25'
WHERE `job_name` = 'unemployment';
UPDATE `job_grades`
SET `salary` = '35'
WHERE `job_name` = 'taxi';
UPDATE `job_grades`
SET `salary` = '45'
WHERE `job_name` = 'realestateagent';

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (210, 'TheCornerSuites10', 'The Corner Suites Apartment 10', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (211, 'TheCornerSuites11', 'The Corner Suites Apartment 11', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (212, 'TheCornerSuites12', 'The Corner Suites Apartment 12', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (213, 'TheCornerSuites13', 'The Corner Suites Apartment 13', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (214, 'TheCornerSuites14', 'The Corner Suites Apartment 14', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (215, 'TheCornerSuites15', 'The Corner Suites Apartment 15', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (216, 'TheCornerSuites16', 'The Corner Suites Apartment 16', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (217, 'TheCornerSuites17', 'The Corner Suites Apartment 17', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (218, 'TheCornerSuites18', 'The Corner Suites Apartment 18', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (219, 'TheCornerSuites19', 'The Corner Suites Apartment 19', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (202, 'TheCornerSuites2', 'The Corner Suites Apartment 2', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (201, 'TheCornerSuites20', 'The Corner Suites Apartment 1', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (220, 'TheCornerSuites20', 'The Corner Suites Apartment 20', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (203, 'TheCornerSuites3', 'The Corner Suites Apartment 3', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (204, 'TheCornerSuites4', 'The Corner Suites Apartment 4', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (205, 'TheCornerSuites5', 'The Corner Suites Apartment 5', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (206, 'TheCornerSuites6', 'The Corner Suites Apartment 6', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (207, 'TheCornerSuites7', 'The Corner Suites Apartment 7', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (208, 'TheCornerSuites8', 'The Corner Suites Apartment 8', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (209, 'TheCornerSuites9', 'The Corner Suites Apartment 9', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheCornerSuites', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (181, 'TheTahitian1', 'The Tahitian Apartment 1', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (190, 'TheTahitian10', 'The Tahitian Apartment 10', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (191, 'TheTahitian11', 'The Tahitian Apartment 11', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (192, 'TheTahitian12', 'The Tahitian Apartment 12', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (193, 'TheTahitian13', 'The Tahitian Apartment 13', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (194, 'TheTahitian14', 'The Tahitian Apartment 14', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (195, 'TheTahitian15', 'The Tahitian Apartment 15', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (196, 'TheTahitian16', 'The Tahitian Apartment 16', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (197, 'TheTahitian17', 'The Tahitian Apartment 17', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (198, 'TheTahitian18', 'The Tahitian Apartment 18', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (199, 'TheTahitian19', 'The Tahitian Apartment 19', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (182, 'TheTahitian2', 'The Tahitian Apartment 2', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (200, 'TheTahitian20', 'The Tahitian Apartment 20', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (183, 'TheTahitian3', 'The Tahitian Apartment 3', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (184, 'TheTahitian4', 'The Tahitian Apartment 4', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (185, 'TheTahitian5', 'The Tahitian Apartment 5', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (186, 'TheTahitian6', 'The Tahitian Apartment 6', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (187, 'TheTahitian7', 'The Tahitian Apartment 7', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (188, 'TheTahitian8', 'The Tahitian Apartment 8', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (189, 'TheTahitian9', 'The Tahitian Apartment 9', NULL, '{"x":266.16,"y":-1007.51,"z":-98.01}',
        '{"x":266.09,"y":-1003.61,"z":-99.01}', NULL, '[]', 'TheTahitian', 0, 1, 0,
        '{"x":259.67,"y":-1003.97,"z":-98.01}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (171, 'Bilingsgate1', 'Bilingsgate Motel Room 1', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (180, 'Bilingsgate10', 'Bilingsgate Motel Room 10', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (172, 'Bilingsgate2', 'Bilingsgate Motel Room 2', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (173, 'Bilingsgate3', 'Bilingsgate Motel Room 3', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (174, 'Bilingsgate4', 'Bilingsgate Motel Room 4', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (175, 'Bilingsgate5', 'Bilingsgate Motel Room 5', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (176, 'Bilingsgate6', 'Bilingsgate Motel Room 6', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (177, 'Bilingsgate7', 'Bilingsgate Motel Room 7', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (178, 'Bilingsgate8', 'Bilingsgate Motel Room 8', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (179, 'Bilingsgate9', 'Bilingsgate Motel Room 9', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'Bilingsgate', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (110, 'PinkCage1', 'Pink Cage Motel Room 1', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (150, 'PinkCage10', 'Pink Cage Motel Room 10', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (141, 'PinkCage2', 'Pink Cage Motel Room 2', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (143, 'PinkCage3', 'Pink Cage Motel Room 3', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (144, 'PinkCage4', 'Pink Cage Motel Room 4', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (145, 'PinkCage5', 'Pink Cage Motel Room 5', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (146, 'PinkCage6', 'Pink Cage Motel Room 6', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (147, 'PinkCage7', 'Pink Cage Motel Room 7', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (148, 'PinkCage8', 'Pink Cage Motel Room 8', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (149, 'PinkCage9', 'Pink Cage Motel Room 9', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'PinkCage', 0, 1, 0, '{"x":151.8,"y":-1001.46,"z":-100.0}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (151, 'TemplarHotel1', 'Templar Hotel Room 1', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (160, 'TemplarHotel10', 'Templar Hotel Room 10', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (161, 'TemplarHotel11', 'Templar Hotel Room 11', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (162, 'TemplarHotel12', 'Templar Hotel Room 12', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (163, 'TemplarHotel13', 'Templar Hotel Room 13', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (164, 'TemplarHotel14', 'Templar Hotel Room 14', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (165, 'TemplarHotel15', 'Templar Hotel Room 15', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (166, 'TemplarHotel16', 'Templar Hotel Room 16', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (167, 'TemplarHotel17', 'Templar Hotel Room 17', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (168, 'TemplarHotel18', 'Templar Hotel Room 18', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (169, 'TemplarHotel19', 'Templar Hotel Room 19', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (152, 'TemplarHotel2', 'Templar Hotel Room 2', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (170, 'TemplarHotel20', 'Templar Hotel Room 20', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (153, 'TemplarHotel3', 'Templar Hotel Room 3', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (154, 'TemplarHotel4', 'Templar Hotel Room 4', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (155, 'TemplarHotel5', 'Templar Hotel Room 5', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (156, 'TemplarHotel6', 'Templar Hotel Room 6', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (157, 'TemplarHotel7', 'Templar Hotel Room 7', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (158, 'TemplarHotel8', 'Templar Hotel Room 8', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (159, 'TemplarHotel9', 'Templar Hotel Room 9', NULL, '{"x":151.39,"y":-1007.66,"z":-100.00}',
        '{"x":151.51,"y":-1006.79,"z":-100.00}', NULL, '[]', 'TemplarHotel', 0, 1, 0,
        '{"x":151.8,"y":-1001.46,"z":-100.0}', 10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (243, 'HLMVinewood1', 'HLM Vinewood - Apartment 1', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (252, 'HLMVinewood10', 'HLM Vinewood - Apartment 10', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (244, 'HLMVinewood2', 'HLM Vinewood - Apartment 2', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (245, 'HLMVinewood3', 'HLM Vinewood - Apartment 3', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (246, 'HLMVinewood4', 'HLM Vinewood - Apartment 4', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (247, 'HLMVinewood5', 'HLM Vinewood - Apartment 5', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (248, 'HLMVinewood6', 'HLM Vinewood - Apartment 6', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (249, 'HLMVinewood7', 'HLM Vinewood - Apartment 7', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (250, 'HLMVinewood8', 'HLM Vinewood - Apartment 8', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (251, 'HLMVinewood9', 'HLM Vinewood - Apartment 9', NULL, '{"x":-859.9,"y":691.46,"z":151.86}',
        '{"x":-859.81,"y":689.87,"z":152.86}', NULL, '[]', 'HLMVinewood', 0, 1, 0,
        '{"x":-858.31,"y":697.37,"z":144.25}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (138, 'HLMLittleSeoul1', 'HLM Little Seoul Apartment 1', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (253, 'HLMLittleSeoul2', 'HLM Little Seoul Apartment 2', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (261, 'HLMLittleSeoul10', 'HLM Little Seoul Apartment 10', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (254, 'HLMLittleSeoul3', 'HLM Little Seoul Apartment 3', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (255, 'HLMLittleSeoul4', 'HLM Little Seoul Apartment 4', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (256, 'HLMLittleSeoul5', 'HLM Little Seoul Apartment 5', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (257, 'HLMLittleSeoul6', 'HLM Little Seoul Apartment 6', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (258, 'HLMLittleSeoul7', 'HLM Little Seoul Apartment 7', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (259, 'HLMLittleSeoul8', 'HLM Little Seoul Apartment 8', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (260, 'HLMLittleSeoul9', 'HLM Little Seoul Apartment 9', NULL, '{"x":-682.54,"y":592.57,"z":144.38}',
        '{"x":-671.64,"y":587.72,"z":140.57}', NULL, '[]', 'HLMLittleSeoul', 0, 1, 0,
        '{"x":-767.43,"y":-751.68,"z":26.87}', 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (223, 'EclipseTowers1', 'Eclipse Towers Apartment 1', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (232, 'EclipseTowers10', 'Eclipse Towers Apartment 10', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (224, 'EclipseTowers2', 'Eclipse Towers Apartment 2', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (225, 'EclipseTowers3', 'Eclipse Towers Apartment 3', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (226, 'EclipseTowers4', 'Eclipse Towers Apartment 4', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (227, 'EclipseTowers5', 'Eclipse Towers Apartment 5', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (228, 'EclipseTowers6', 'Eclipse Towers Apartment 6', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (229, 'EclipseTowers7', 'Eclipse Towers Apartment 7', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (230, 'EclipseTowers8', 'Eclipse Towers Apartment 8', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (231, 'EclipseTowers9', 'Eclipse Towers Apartment 9', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'EclipseTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (233, 'TinselTowers1', 'Tinsel Towers Apartment 1', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (242, 'TinselTowers10', 'Tinsel Towers Apartment 10', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (234, 'TinselTowers2', 'Tinsel Towers Apartment 2', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (235, 'TinselTowers3', 'Tinsel Towers Apartment 3', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (236, 'TinselTowers4', 'Tinsel Towers Apartment 4', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (237, 'TinselTowers5', 'Tinsel Towers Apartment 5', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (238, 'TinselTowers6', 'Tinsel Towers Apartment 6', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (239, 'TinselTowers7', 'Tinsel Towers Apartment 7', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (240, 'TinselTowers8', 'Tinsel Towers Apartment 8', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (241, 'TinselTowers9', 'Tinsel Towers Apartment 9', NULL, '{"x":-602.9,"y":58.92,"z":97.2}',
        '{"x":-605.2,"y":59.02,"z":98.2}', NULL, '[]', 'TinselTowers', 0, 1, 0, '{"x":-621.23,"y":54.4,"z":96.6}',
        10000);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (132, 'Bilingsgate', 'Bilingsgate Motel', '{"x":561.87,"y":-1752.12,"z":28.29}', NULL, NULL,
        '{"x":563.0,"y":-1752.59,"z":28.16}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (222, 'EclipseTowers', 'Eclipse Towers', '{"x":-773.92,"y":312.29,"z":84.7}', NULL, NULL,
        '{"x":-774.32,"y":309.48,"z":85.7}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (137, 'HLMVinewood', 'HLM Vinewood', '{"x":-599.25,"y":147.80,"z":60.67}', NULL, NULL,
        '{"x":-598.77,"y":144.23,"z":59.05}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (139, 'LeBurton', 'LeBurton', '{"x":-448.48,"y":-132.4,"z":38.08}', NULL, NULL,
        '{"x":-453.02,"y":-135.06,"z":37.42}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (131, 'PinkCage', 'Pink Cage Motel', '{"x":325.16,"y":-229.54,"z":53.22}', NULL, NULL,
        '{"x":324.32,"y":-231.43,"z":53.22}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (133, 'TemplarHotel', 'Templar Hotel', '{"x":288.23,"y":-1094.99,"z":28.42}', NULL, NULL,
        '{"x":290.73,"y":-1095.47,"z":28.41}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (135, 'TheCornerSuites', 'The Corner Suites', '{"x":-551.07,"y":-812.99,"z":29.75}', NULL, NULL,
        '{"x":-551.13,"y":-821.46,"z":27.19}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (134, 'TheTahitian', 'The Tahitian', '{"x":-27.91,"y":-1566.18,"z":28.92}', NULL, NULL,
        '{"x":-27.73,"y":-1569.42,"z":28.32}', '[]', NULL, 0, 0, 1, NULL, 0);
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (221, 'TinselTowers', 'Tinsel Towers', '{"x":-595.79,"y":36.25,"z":42.61}', NULL, NULL,
        '{"x":-595.91,"y":33.42,"z":42.56}', '[]', NULL, 0, 0, 1, NULL, 0);


CREATE TABLE IF NOT EXISTS `twitter_accounts`
(
    `id`         int(11)                           NOT NULL AUTO_INCREMENT,
    `username`   varchar(50) CHARACTER SET `utf8`  NOT NULL DEFAULT '0',
    `password`   varchar(50) COLLATE `utf8mb4_bin` NOT NULL DEFAULT '0',
    `avatar_url` varchar(255) COLLATE `utf8mb4_bin`         DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 38
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

CREATE TABLE IF NOT EXISTS `twitter_tweets`
(
    `id`       int(11)                                   NOT NULL AUTO_INCREMENT,
    `authorId` int(11)                                   NOT NULL,
    `realUser` varchar(50) COLLATE `utf8mb4_unicode_ci`           DEFAULT NULL,
    `message`  varchar(256) COLLATE `utf8mb4_unicode_ci` NOT NULL,
    `time`     timestamp                                 NOT NULL DEFAULT current_timestamp(),
    `likes`    int(11)                                   NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
    CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 170
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_unicode_ci`;

CREATE TABLE IF NOT EXISTS `twitter_likes`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `authorId` int(11) DEFAULT NULL,
    `tweetId`  int(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
    KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
    CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
    CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 137
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
