USE `essentialmode`;

ALTER TABLE `users`
    ADD COLUMN `firstname`   varchar(50) NULL DEFAULT '',
    ADD COLUMN `lastname`    varchar(50) NULL DEFAULT '',
    ADD COLUMN `dateofbirth` varchar(25) NULL DEFAULT '',
    ADD COLUMN `sex`         varchar(10) NULL DEFAULT '',
    ADD COLUMN `height`      varchar(5)  NULL DEFAULT ''
;

CREATE TABLE `characters`
(
    `identifier`  varchar(255) NOT NULL,
    `firstname`   varchar(255) NOT NULL,
    `lastname`    varchar(255) NOT NULL,
    `dateofbirth` varchar(255) NOT NULL,
    `sex`         varchar(1)   NOT NULL DEFAULT 'f',
    `height`      varchar(128) NOT NULL
);
