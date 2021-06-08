USE `essentialmode`;

INSERT INTO `licenses` (`type`, `label`)
VALUES ('boating', 'Boating License')
;

DROP TABLE `boat_categories`;

CREATE TABLE `boat_categories`
(
    `name`  varchar(60) NOT NULL,
    `label` varchar(60) NOT NULL,

    PRIMARY KEY (`name`)
);

INSERT INTO `boat_categories` (`name`, `label`)
VALUES ('boat', 'Boats'),
       ('subs', 'Submersibles')
;

DROP TABLE `boats`;

CREATE TABLE `boats`
(
    `name`     varchar(60) NOT NULL,
    `model`    varchar(60) NOT NULL,
    `price`    int(11)     NOT NULL,
    `category` varchar(60) DEFAULT NULL,
    PRIMARY KEY (`model`)
);

INSERT INTO `boats` (`name`, `model`, `price`, `category`)
VALUES ('Dinghy 4Seat', 'dinghy', 50000, 'boat'),
       ('Dinghy 2Seat', 'dinghy2', 48000, 'boat'),
       ('Dinghy 3Seat', 'dinghy3', 50000, 'boat'),
       ('Dinghy Yacht', 'dinghy4', 50000, 'boat'),
       ('Jetmax', 'jetmax', 75000, 'boat'),
       ('Marquis', 'marquis', 125000, 'boat'),
       ('Seashark', 'seashark', 10000, 'boat'),
       ('Seashark Yacht', 'seashark3', 10000, 'boat'),
       ('Speeder', 'speeder', 60000, 'boat'),
       ('Speeder Rasta', 'speeder2', 60000, 'boat'),
       ('Squalo', 'squalo', 47000, 'boat'),
       ('Suntrap', 'suntrap', 17500, 'boat'),
       ('Toro', 'toro', 90000, 'boat'),
       ('Toro Yacht', 'toro2', 90000, 'boat'),
       ('Tropic', 'tropic', 40000, 'boat'),
       ('Tropic Yacht', 'tropic2', 40000, 'boat'),
       ('Kraken', 'submersible2', 175000, 'subs'),
       ('Submarine', 'submersible', 150000, 'subs')
;
