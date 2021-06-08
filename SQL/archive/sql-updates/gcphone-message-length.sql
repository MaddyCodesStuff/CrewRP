ALTER TABLE `phone_messages`
    CHANGE COLUMN `message` `message` longtext NOT NULL DEFAULT '' AFTER `receiver`;