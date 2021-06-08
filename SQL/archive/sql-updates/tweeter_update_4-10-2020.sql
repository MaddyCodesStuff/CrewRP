ALTER TABLE `twitter_accounts`
    ADD COLUMN `identifier` varchar(50) NULL AFTER `avatar_url`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('birthdaycake_slice', 'Slice of Birthday Cake', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('birthdaycake', 'Anniversary Cake', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('golddiamond', 'Diamond Ring - Gold', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('silverdiamond', 'Diamond Ring - Silver', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('silverband', 'Wedding Band - Silver', -1, 0, 1);