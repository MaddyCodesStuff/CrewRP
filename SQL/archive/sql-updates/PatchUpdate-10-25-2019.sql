INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation1_Armor', 'bodyarmor_1', 150);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation1_Armor', 'bodyarmor_2', 300);
INSERT INTO `shops` (`store`, `item`, `price`)
VALUES ('Ammunation1_Armor', 'bodyarmor_3', 500);
INSERT INTO `items` (`name`, `label`, `limit`)
VALUES ('battery', 'Car Battery', 2),
       ('lowradio', 'Stock Radio', 5),
       ('stockrim', 'Stock Rim', 4),
       ('airbag', 'Airbag', 7),
       ('highradio', 'Aftermarket Radio', 5),
       ('highrim', 'Nice Rim', 4)
;


INSERT INTO `datastore` (`name`, `label`, `shared`)
VALUES ('user_ears', 'Ears', 0),
       ('user_glasses', 'Glasses', 0),
       ('user_helmet', 'Helmet', 0),
       ('user_mask', 'Mask', 0)
;

USE `essentialmode`;

CREATE TABLE `weashops`
(
    `id`    int(11)      NOT NULL AUTO_INCREMENT,
    `zone`  varchar(255) NOT NULL,
    `item`  varchar(255) NOT NULL,
    `price` int(11)      NOT NULL,

    PRIMARY KEY (`id`)
);

INSERT INTO `licenses` (`type`, `label`)
VALUES ('weapon', "Firearms license")
;

INSERT INTO `weashops` (`zone`, `item`, `price`)
VALUES ('GunShop', 'WEAPON_KNIFE', 75),
       ('GunShop', 'WEAPON_STUNGUN', 200),
       ('GunShop', 'WEAPON_FLASHLIGHT', 75),
       ('GunShop', 'WEAPON_FLARE', 150),
       ('GunShop', 'WEAPON_BOTTLE', 200),
       ('GunShop', 'WEAPON_BAT', 200),
;
