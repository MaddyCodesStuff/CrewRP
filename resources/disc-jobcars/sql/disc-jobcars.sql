CREATE TABLE IF NOT EXISTS `job_cars`
(
    `id`     bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `owner`  text                 NOT NULL,
    `plate`  text                 NOT NULL,
    `props`  longtext             NULL,
    `stored` boolean DEFAULT TRUE NULL,
    `model`  text                 NOT NULL,
    `job`    text                 NOT NULL,
    CONSTRAINT `id`
        UNIQUE (`id`)
);
