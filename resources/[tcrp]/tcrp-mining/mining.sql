USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('jackhammer', 'Jackhammer', 1, 0, 1);
UPDATE `items`
SET `label` = 'Mineral Ore'
WHERE `name` = 'washed_stone';