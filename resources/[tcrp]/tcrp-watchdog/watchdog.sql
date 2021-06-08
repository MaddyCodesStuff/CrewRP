CREATE TABLE IF NOT EXISTS `watchdog`
(
    `id`        int(11)     NOT NULL AUTO_INCREMENT,
    `timestamp` varchar(32) NOT NULL,
    `user`      varchar(32) NOT NULL,
    `type`      varchar(32) NOT NULL,
    `message`   longtext    NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`;
COMMIT;
