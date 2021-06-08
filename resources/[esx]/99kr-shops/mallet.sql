CREATE TABLE IF NOT EXISTS `items`
(
    `name`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `label`      varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `limit`      int(11)                           NOT NULL DEFAULT -1,
    `rare`       int(11)                           NOT NULL DEFAULT 0,
    `can_remove` int(11)                           NOT NULL DEFAULT 1,
    PRIMARY KEY (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
--
-- Table structure for table `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('mallet', 'Mallet', -1, 0, 1);

