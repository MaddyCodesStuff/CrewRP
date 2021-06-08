USE `essentialmode`;

INSERT INTO `licenses` (`type`, `label`)
VALUES ('aircraft', 'Aircraft License')
;

CREATE TABLE `aircraft_categories`
(
    `name`  varchar(60) NOT NULL,
    `label` varchar(60) NOT NULL,

    PRIMARY KEY (`name`)
);

INSERT INTO `aircraft_categories` (`name`, `label`)
VALUES ('plane', 'Planes'),
       ('heli', 'Helicopters')
;

CREATE TABLE `aircrafts`
(
    `name`     varchar(60) NOT NULL,
    `model`    varchar(60) NOT NULL,
    `price`    int(11)     NOT NULL,
    `category` varchar(60) DEFAULT NULL,
    PRIMARY KEY (`model`)
);

INSERT INTO `aircrafts` (`name`, `model`, `price`, `category`)
VALUES ('Alpha Z1', 'alphaz1', 670000, 'plane'),
       ('Besra', 'besra', 2750000, 'plane'),
       ('Cuban 800', 'cuban800', 125000, 'plane'),
       ('Dodo', 'dodo', 200000, 'plane'),
       ('Duster', 'duster', 73000, 'plane'),
       ('Howard NX25', 'howard', 320000, 'plane'),
       ('Luxor', 'luxor', 1500000, 'plane'),
       ('Luxor Deluxe ', 'luxor2', 1750000, 'plane'),
       ('Mallard', 'stunt', 250000, 'plane'),
       ('Mammatus', 'mammatus', 95000, 'plane'),
       ('Nimbus', 'nimbus', 900000, 'plane'),
       ('Rogue', 'rogue', 475000, 'plane'),
       ('Sea Breeze', 'seabreeze', 370000, 'plane'),
       ('Shamal', 'shamal', 1150000, 'plane'),
       ('Ultra Light', 'microlight', 10000, 'plane'),
       ('Velum', 'velum2', 180000, 'plane'),
       ('Vestra', 'vestra', 820000, 'plane'),
       ('Buzzard', 'buzzard2', 145000, 'heli'),
       ('Frogger', 'frogger', 220000, 'heli'),
       ('Havok', 'havok', 200000, 'heli'),
       ('Maverick', 'maverick', 500000, 'heli'),
       ('Sea Sparrow', 'seasparrow', 450000, 'heli'),
       ('SuperVolito', 'supervolito', 1000000, 'heli'),
       ('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
       ('Swift', 'swift', 1000000, 'heli'),
       ('Swift Deluxe', 'swift2', 1250000, 'heli'),
       ('Volatus', 'volatus', 1250000, 'heli')
;
