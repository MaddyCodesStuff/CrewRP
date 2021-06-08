CREATE TABLE `whitelist`
(
    `identifier` varchar(255) NOT NULL,
    `whitelist`  tinyint(1)   NOT NULL DEFAULT 0,
    PRIMARY KEY (`identifier`)
);
CREATE TABLE `banlist`
(
    `identifier` varchar(255) NOT NULL,
    `reason`     varchar(255) NOT NULL,
    `enddate`    varchar(255) NOT NULL,
    PRIMARY KEY (`identifier`)
);