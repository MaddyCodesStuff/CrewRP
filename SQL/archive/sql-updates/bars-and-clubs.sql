/*
 * New booze
 */
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('beer_1', 'Domestic Beer', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('beer_2', 'Imported Beer', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('beer_3', 'Craft Beer', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('bourbon', 'Bourbon', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('rye', 'Rye Whiskey', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('scotch', 'Scotch Whiskey', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('tequila', 'Tequila', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('moonshine', 'Moonshine', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('vodka', 'Vodka', -1, 0, 1);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('gin', 'Gin', -1, 0, 1);
# Should already exist in the database (wine making hobby)
# INSERT INTO items (name, label, `limit`, rare, can_remove)
# VALUES ('fresh_glass', 'Fresh Wine', -1, 0, 1);
# INSERT INTO items (name, label, `limit`, rare, can_remove)
# VALUES ('middle_glass', 'Middle Aged Wine', -1, 0, 1);
# INSERT INTO items (name, label, `limit`, rare, can_remove)
# VALUES ('fine_glass', 'Fine Wine', -1, 0, 1);

/*
 * Bar booze
 */
DELETE
FROM `shops`
WHERE `store` = 'Tequilalala';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'beer_1', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'beer_2', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'beer_3', 8);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'bourbon', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'rye', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'scotch', 65);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'tequila', 35);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'vodka', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'gin', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'fresh_glass', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'middle_glass', 12);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala', 'fine_glass', 50);

DELETE
FROM `shops`
WHERE `store` = 'Tequilalala_2';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'beer_1', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'beer_2', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'beer_3', 8);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'bourbon', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'rye', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'scotch', 65);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'tequila', 35);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'vodka', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'gin', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'fresh_glass', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'middle_glass', 12);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2', 'fine_glass', 50);

DELETE
FROM `shops`
WHERE `store` = 'YellowJackInn';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'beer_1', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'beer_2', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'beer_3', 8);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'bourbon', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'rye', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'scotch', 65);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'tequila', 35);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'moonshine', 100);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'vodka', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'gin', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'fresh_glass', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'middle_glass', 12);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn', 'fine_glass', 50);

DELETE
FROM `shops`
WHERE `store` = 'LostMC';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'beer_1', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'beer_2', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'beer_3', 8);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'bourbon', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'rye', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'scotch', 65);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'tequila', 35);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'moonshine', 100);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'vodka', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'gin', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'fresh_glass', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'middle_glass', 12);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC', 'fine_glass', 50);

DELETE
FROM `shops`
WHERE `store` = 'BahamaMamas';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'beer_1', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'beer_2', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'beer_3', 8);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'bourbon', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'rye', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'scotch', 65);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'tequila', 35);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'vodka', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'gin', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'fresh_glass', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'middle_glass', 12);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas', 'fine_glass', 50);

DELETE
FROM `shops`
WHERE `store` = 'VanillaUnicorn';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'beer_1', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'beer_2', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'beer_3', 8);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'bourbon', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'rye', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'scotch', 65);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'tequila', 35);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'vodka', 60);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'gin', 50);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'fresh_glass', 4);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'middle_glass', 12);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn', 'fine_glass', 50);

/*
 * Bar Snacks
 */
DELETE
FROM `shops`
WHERE `store` = 'Tequilalala_snacks';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_snacks', 'cheesebows', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_snacks', 'chips', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_snacks', 'chips2', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_snacks', 'chips3', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_snacks', 'bread', 3);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_snacks', 'pizza', 4);

DELETE
FROM `shops`
WHERE `store` = 'Tequilalala_2_snacks';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2_snacks', 'cheesebows', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2_snacks', 'chips', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2_snacks', 'chips2', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2_snacks', 'chips3', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2_snacks', 'bread', 3);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Tequilalala_2_snacks', 'pizza', 4);

DELETE
FROM `shops`
WHERE `store` = 'YellowJackInn_snacks';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn_snacks', 'cheesebows', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn_snacks', 'chips', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn_snacks', 'chips3', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn_snacks', 'chips2', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn_snacks', 'bread', 3);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('YellowJackInn_snacks', 'pizza', 4);

DELETE
FROM `shops`
WHERE `store` = 'LostMC_snacks';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC_snacks', 'cheesebows', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC_snacks', 'chips', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC_snacks', 'chips2', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC_snacks', 'chips3', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC_snacks', 'bread', 3);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('LostMC_snacks', 'pizza', 4);

DELETE
FROM `shops`
WHERE `store` = 'BahamaMamas_snacks';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas_snacks', 'cheesebows', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas_snacks', 'chips', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas_snacks', 'chips2', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas_snacks', 'chips3', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas_snacks', 'bread', 3);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('BahamaMamas_snacks', 'pizza', 4);

DELETE
FROM `shops`
WHERE `store` = 'VanillaUnicorn_snacks';
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn_snacks', 'cheesebows', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn_snacks', 'chips', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn_snacks', 'chips2', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn_snacks', 'chips3', 2);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn_snacks', 'bread', 3);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('VanillaUnicorn_snacks', 'pizza', 4);