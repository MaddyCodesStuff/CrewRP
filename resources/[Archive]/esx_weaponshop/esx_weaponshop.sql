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
