CREATE TABLE `housing`
(
    `id`         int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`       varchar(60) NOT NULL,
    `zone`       varchar(60) NOT NULL,
    `price`      varchar(15) NOT NULL,
    `entrance`   longtext,
    `outside`    longtext,
    `garage_in`  longtext,
    `garage_out` longtext,
    `interior`   longtext,
    `owner`      varchar(32)
);

CREATE TABLE `housing_keys`
(
    `id`        int(11),
    `owner`     varchar(32) NOT NULL,
    `recipient` varchar(32) NOT NULL
);

CREATE TABLE `housing_interiors`
(
    `int_name` varchar(255) PRIMARY KEY,
    `inside`   longtext,
    `exit_out` longtext,
    `wardrobe` longtext,
    `storage`  longtext
);

ALTER TABLE `users`
    ADD `in_property` int NOT NULL;

CREATE TABLE `housing_inventory`
(
    `id`      int(11) PRIMARY KEY,
    `weapons` longtext,
    `items`   longtext,
    `owner`   varchar(32)
);