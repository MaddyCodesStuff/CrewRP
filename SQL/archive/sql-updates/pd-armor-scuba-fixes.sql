-- Mission row PD
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LSPD', 'bodyarmor_1', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LSPD', 'bodyarmor_2', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LSPD', 'bodyarmor_3', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LSPD', 'scuba', 0);

-- Paleto PD
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('PaletoPD', 'bodyarmor_1', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('PaletoPD', 'bodyarmor_2', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('PaletoPD', 'bodyarmor_3', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('PaletoPD', 'scuba', 0);

-- SandyPD
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('SandyPD', 'bodyarmor_1', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('SandyPD', 'bodyarmor_2', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('SandyPD', 'bodyarmor_3', 0);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('SandyPD', 'scuba', 0);

DELETE
FROM `shops`
WHERE `store` = 'PD';