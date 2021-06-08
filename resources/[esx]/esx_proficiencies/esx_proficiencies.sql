USE `essentialmode`;

CREATE TABLE `proficiencies`
(
    `id`         int(11)     NOT NULL AUTO_INCREMENT,
    `name`       varchar(32) NULL DEFAULT NULL,
    `label`      varchar(64) NULL DEFAULT NULL,
    `maxlevel`   int(3)      NULL DEFAULT '1',
    `active`     int(1)      NULL DEFAULT NULL,
    `multiplier` int(1)      NULL DEFAULT NULL,
    `basexp`     int(5)      NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
)
    COLLATE = 'utf8_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 1
;

CREATE TABLE `characters_proficiencies_xp`
(
    `owner`       varchar(50) NOT NULL,
    `xp`          int(11)     NULL DEFAULT NULL,
    `proficiency` varchar(20) NOT NULL,
    `level`       int(11)     NULL DEFAULT NULL,
    UNIQUE INDEX `Index 1` (`owner`, `proficiency`)
)
    COLLATE = 'utf8_general_ci'
    ENGINE = InnoDB
;
