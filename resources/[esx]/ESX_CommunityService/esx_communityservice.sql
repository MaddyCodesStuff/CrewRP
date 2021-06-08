USE `essentialmode`;

CREATE TABLE `communityservice`
(
    `identifier`        varchar(100) NOT NULL,
    `actions_remaining` int(10)      NOT NULL,
    PRIMARY KEY (`identifier`)
);