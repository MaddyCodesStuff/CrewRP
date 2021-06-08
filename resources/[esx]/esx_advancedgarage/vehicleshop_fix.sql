-- Modified Jan. 30th, 2020 - Implement vehicle health
-- UPDATE
USE `essentialmode`;

ALTER TABLE `owned_vehicles`
    ADD `health` varchar(255) NOT NULL DEFAULT "",

-- CREATE
USE `essentialmode`;

CREATE TABLE `owned_vehicles`
(
    `owner`     varchar(30) COLLATE `utf8mb4_bin` NOT NULL,
    `plate`     varchar(12) COLLATE `utf8mb4_bin` NOT NULL,
    `vehicle`   longtext COLLATE `utf8mb4_bin`    NOT NULL,
    `type`      varchar(20) COLLATE `utf8mb4_bin` NOT NULL DEFAULT 'car',
    `job`       varchar(20) COLLATE `utf8mb4_bin`          DEFAULT NULL,
    `stored`    tinyint(1)                        NOT NULL DEFAULT 0,
    `impounded` tinyint(1)                        NOT NULL DEFAULT 0,
    `locked`    tinyint(1)                        NOT NULL DEFAULT 1,
    `health`    varchar(255)                      NOT NULL DEFAULT "",
    PRIMARY KEY (`plate`)
)

-- Changed version of owned_vehicles to remove issues with car's not showing up

USE `essentialmode`;

CREATE TABLE `owned_vehicles`
(
    `owner`   varchar(22) NOT NULL,
    `plate`   varchar(12) NOT NULL,
    `vehicle` longtext,
    `type`    varchar(20) NOT NULL DEFAULT 'car',
    `job`     varchar(20) NOT NULL DEFAULT '',
    `stored`  tinyint(1)  NOT NULL DEFAULT '0',

    PRIMARY KEY (`plate`)
);

-- My owned_vehicles that i use

USE `essentialmode`;

CREATE TABLE `owned_vehicles`
(
    `owner`   varchar(30) NOT NULL,
    `plate`   varchar(12) NOT NULL,
    `vehicle` longtext    NOT NULL,
    `type`    varchar(20) NOT NULL DEFAULT 'car',
    `job`     varchar(20) NOT NULL,
    `stored`  tinyint(1)  NOT NULL DEFAULT '0',

    PRIMARY KEY (`plate`)
);
