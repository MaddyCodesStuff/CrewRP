-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2019 at 12:25 PM
-- Server version: 10.1.41-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @`OLD_CHARACTER_SET_CLIENT` = @@`CHARACTER_SET_CLIENT` */;
/*!40101 SET @`OLD_CHARACTER_SET_RESULTS` = @@`CHARACTER_SET_RESULTS` */;
/*!40101 SET @`OLD_COLLATION_CONNECTION` = @@`COLLATION_CONNECTION` */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `essentialmode`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account`
(
    `id`     int(11)                            NOT NULL,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `shared` int(11)                            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`)
VALUES (3, 'society_ambulance', 'Ambulance', 1),
       (4, 'caution', 'Caution', 0),
       (5, 'society_police', 'Police', 1),
       (6, 'society_taxi', 'Taxi', 1),
       (7, 'society_cardealer', 'Car Dealer', 1),
       (8, 'society_taxi', 'Taxi', 1),
       (9, 'property_black_money', 'Argent Sale Propriété', 0),
       (10, 'society_realestateagent', 'Real Estate Agent', 1),
       (11, 'society_mecano', 'Mechanic', 1),
       (12, 'society_gitrdone', 'GrD Construction', 1),
       (13, 'society_vigne', 'Winegrower', 1),
       (14, 'society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data`
(
    `id`           int(11) NOT NULL,
    `account_name` varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `money`        double  NOT NULL,
    `owner`        varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`)
VALUES (1, 'society_ambulance', 10, NULL),
       (2, 'society_police', 10, 'steam:11000010079e29a'),
       (3, 'society_taxi', 5, NULL),
       (4, 'society_cardealer', 10632162, 'steam:11000010079e29a'),
       (5, 'caution', 0, 'steam:110000102b5c8b8'),
       (6, 'property_black_money', 0, 'steam:110000102b5c8b8'),
       (7, 'society_realestateagent', 374760, NULL),
       (8, 'society_mecano', 15, NULL),
       (9, 'caution', 0, 'steam:11000010079e29a'),
       (10, 'property_black_money', 0, 'steam:11000010079e29a'),
       (11, 'caution', 0, 'steam:11000010ec8a88b'),
       (12, 'property_black_money', 0, 'steam:11000010ec8a88b'),
       (13, 'caution', 0, 'steam:1100001022a4ec2'),
       (14, 'property_black_money', 0, 'steam:1100001022a4ec2'),
       (15, 'caution', 0, 'steam:1100001059883bd'),
       (16, 'property_black_money', 0, 'steam:1100001059883bd'),
       (17, 'caution', 0, 'steam:110000102d2e853'),
       (18, 'property_black_money', 0, 'steam:110000102d2e853'),
       (19, 'caution', 0, 'steam:110000104e3efcd'),
       (20, 'property_black_money', 0, 'steam:110000104e3efcd'),
       (21, 'property_black_money', 0, 'steam:11000010aa8b577'),
       (22, 'caution', 0, 'steam:11000010aa8b577'),
       (23, 'caution', 0, 'steam:110000104ab4ae4'),
       (24, 'property_black_money', 0, 'steam:110000104ab4ae4'),
       (25, 'property_black_money', 0, 'steam:11000010003c4b8'),
       (26, 'caution', 0, 'steam:11000010003c4b8'),
       (27, 'caution', 0, 'steam:1100001114b4a38'),
       (28, 'property_black_money', 0, 'steam:1100001114b4a38'),
       (29, 'caution', 0, 'steam:11000011aa55d5a'),
       (30, 'property_black_money', 0, 'steam:11000011aa55d5a'),
       (31, 'caution', 0, 'steam:110000108328a4c'),
       (32, 'property_black_money', 0, 'steam:110000108328a4c'),
       (33, 'caution', 0, 'steam:110000104333f98'),
       (34, 'property_black_money', 0, 'steam:110000104333f98'),
       (35, 'caution', 0, 'steam:110000103c985ee'),
       (36, 'property_black_money', 0, 'steam:110000103c985ee'),
       (37, 'caution', 0, 'steam:110000104a7d38d'),
       (38, 'property_black_money', 0, 'steam:110000104a7d38d'),
       (39, 'property_black_money', 0, 'steam:11000010deac345'),
       (40, 'caution', 0, 'steam:11000010deac345'),
       (41, 'society_gitrdone', 0, NULL),
       (42, 'society_vigne', 970, NULL),
       (43, 'caution', 0, 'steam:11000010c861bdb'),
       (44, 'property_black_money', 0, 'steam:11000010c861bdb'),
       (45, 'property_black_money', 0, 'steam:110000136e4df83'),
       (46, 'caution', 0, 'steam:110000136e4df83'),
       (47, 'property_black_money', 0, 'steam:110000103e4adf1'),
       (48, 'caution', 0, 'steam:110000103e4adf1'),
       (49, 'caution', 0, 'steam:11000010979381c'),
       (50, 'property_black_money', 0, 'steam:11000010979381c'),
       (51, 'caution', 0, 'steam:110000105063f4d'),
       (52, 'property_black_money', 0, 'steam:110000105063f4d'),
       (53, 'caution', 0, 'steam:110000105b0d643'),
       (54, 'property_black_money', 0, 'steam:110000105b0d643'),
       (55, 'caution', 0, 'steam:110000106080551'),
       (56, 'property_black_money', 0, 'steam:110000106080551'),
       (57, 'property_black_money', 0, 'steam:11000010051bf9a'),
       (58, 'caution', 0, 'steam:11000010051bf9a'),
       (59, 'property_black_money', 0, 'steam:1100001114a1946'),
       (60, 'caution', 0, 'steam:1100001114a1946'),
       (61, 'caution', 0, 'steam:110000103f6f09b'),
       (62, 'property_black_money', 0, 'steam:110000103f6f09b'),
       (63, 'property_black_money', 0, 'steam:1100001004c2f59'),
       (64, 'caution', 0, 'steam:1100001004c2f59');

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory`
(
    `id`     int(11)                            NOT NULL,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `shared` int(11)                            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`)
VALUES (2, 'society_ambulance', 'Ambulance', 1),
       (3, 'society_police', 'Police', 1),
       (4, 'society_taxi', 'Taxi', 1),
       (5, 'society_cardealer', 'Car Dealer', 1),
       (6, 'society_taxi', 'Taxi', 1),
       (7, 'property', 'Property', 0),
       (8, 'society_mecano', 'Mechanic', 1),
       (9, 'society_gitrdone', 'GrD Construction', 1),
       (10, 'society_vigne', 'Winegrower', 1),
       (11, 'society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items`
(
    `id`             int(11)                            NOT NULL,
    `inventory_name` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `name`           varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `count`          int(11)                            NOT NULL,
    `owner`          varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`)
VALUES (1, 'society_cardealer', 'chips2', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aircrafts`
--

CREATE TABLE `aircrafts`
(
    `name`     varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `model`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `price`    int(11)                           NOT NULL,
    `category` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `aircrafts`
--

INSERT INTO `aircrafts` (`name`, `model`, `price`, `category`)
VALUES ('Alpha Z1', 'alphaz1', 1121000, 'plane'),
       ('Besra', 'besra', 1000000, 'plane'),
       ('Buzzard', 'buzzard2', 500000, 'heli'),
       ('Cuban 800', 'cuban800', 240000, 'plane'),
       ('Dodo', 'dodo', 500000, 'plane'),
       ('Duster', 'duster', 175000, 'plane'),
       ('Frogger', 'frogger', 800000, 'heli'),
       ('Havok', 'havok', 250000, 'heli'),
       ('Howard NX25', 'howard', 975000, 'plane'),
       ('Luxor', 'luxor', 1500000, 'plane'),
       ('Luxor Deluxe ', 'luxor2', 1750000, 'plane'),
       ('Mammatus', 'mammatus', 300000, 'plane'),
       ('Maverick', 'maverick', 750000, 'heli'),
       ('Ultra Light', 'microlight', 50000, 'plane'),
       ('Nimbus', 'nimbus', 900000, 'plane'),
       ('Rogue', 'rogue', 1000000, 'plane'),
       ('Sea Breeze', 'seabreeze', 850000, 'plane'),
       ('Sea Sparrow', 'seasparrow', 815000, 'heli'),
       ('Shamal', 'shamal', 1150000, 'plane'),
       ('Mallard', 'stunt', 250000, 'plane'),
       ('SuperVolito', 'supervolito', 1000000, 'heli'),
       ('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
       ('Swift', 'swift', 1000000, 'heli'),
       ('Swift Deluxe', 'swift2', 1250000, 'heli'),
       ('Velum', 'velum2', 450000, 'plane'),
       ('Vestra', 'vestra', 950000, 'plane'),
       ('Volatus', 'volatus', 1250000, 'heli');

-- --------------------------------------------------------

--
-- Table structure for table `aircraft_categories`
--

CREATE TABLE `aircraft_categories`
(
    `name`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(60) COLLATE `utf8mb4_bin` NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `aircraft_categories`
--

INSERT INTO `aircraft_categories` (`name`, `label`)
VALUES ('heli', 'Helicopters'),
       ('plane', 'Planes');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing`
(
    `id`          int(11)                            NOT NULL,
    `identifier`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `sender`      varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `target_type` varchar(50) COLLATE `utf8mb4_bin`  NOT NULL,
    `target`      varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`       varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `amount`      int(11)                            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `boats`
--

CREATE TABLE `boats`
(
    `name`     varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `model`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `price`    int(11)                           NOT NULL,
    `category` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `boats`
--

INSERT INTO `boats` (`name`, `model`, `price`, `category`)
VALUES ('Dinghy 4Seat', 'dinghy', 25000, 'boat'),
       ('Dinghy 2Seat', 'dinghy2', 20000, 'boat'),
       ('Dinghy Yacht', 'dinghy4', 25000, 'boat'),
       ('Jetmax', 'jetmax', 30000, 'boat'),
       ('Marquis', 'marquis', 45000, 'boat'),
       ('Seashark', 'seashark', 10000, 'boat'),
       ('Seashark Yacht', 'seashark3', 10000, 'boat'),
       ('Speeder', 'speeder', 40000, 'boat'),
       ('Squalo', 'squalo', 32000, 'boat'),
       ('Submarine', 'submersible', 29000, 'subs'),
       ('Kraken', 'submersible2', 31000, 'subs'),
       ('Suntrap', 'suntrap', 34000, 'boat'),
       ('Toro', 'toro', 38000, 'boat'),
       ('Toro Yacht', 'toro2', 38000, 'boat'),
       ('Tropic', 'tropic', 27000, 'boat'),
       ('Tropic Yacht', 'tropic2', 27000, 'boat');

-- --------------------------------------------------------

--
-- Table structure for table `boat_categories`
--

CREATE TABLE `boat_categories`
(
    `name`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(60) COLLATE `utf8mb4_bin` NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `boat_categories`
--

INSERT INTO `boat_categories` (`name`, `label`)
VALUES ('boat', 'Boats'),
       ('subs', 'Submersibles');

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses`
(
    `id`          int(11)                            NOT NULL,
    `name`        varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `job`         varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `description` varchar(75) COLLATE `utf8mb4_bin`  NOT NULL,
    `owner`       varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `businesses_properties`
--

CREATE TABLE `businesses_properties`
(
    `id`        int(11)                            DEFAULT NULL,
    `name`      varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `data`      longtext COLLATE `utf8mb4_bin`,
    `owner`     varchar(50) COLLATE `utf8mb4_bin`  DEFAULT NULL,
    `employees` longtext COLLATE `utf8mb4_bin`,
    `job`       longtext COLLATE `utf8mb4_bin`
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `businesses_properties`
--

INSERT INTO `businesses_properties` (`id`, `name`, `data`, `owner`, `employees`, `job`)
VALUES (NULL, 'Test Police Academy', '{\"data\":{\"position\":{\"z\":3,\"x\":2,\"y\":1}}}', NULL, NULL, 'police'),
       (NULL, 'Test Police Academy 2', '{\"data\":{\"position\":{\"z\":3,\"x\":2,\"y\":1}}}', NULL, NULL, 'police');

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles`
(
    `id`      int(11)                            NOT NULL,
    `vehicle` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `price`   int(11)                            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters`
(
    `identifier`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `firstname`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `lastname`    varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `dateofbirth` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `sex`         varchar(1) COLLATE `utf8mb4_bin`   NOT NULL DEFAULT 'f',
    `height`      varchar(128) COLLATE `utf8mb4_bin` NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `communityservice`
--

CREATE TABLE `communityservice`
(
    `identifier`        varchar(100) NOT NULL,
    `actions_remaining` int(10)      NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`;

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore`
(
    `id`     int(11)                            NOT NULL,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `shared` int(11)                            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`id`, `name`, `label`, `shared`)
VALUES (1, 'society_ambulance', 'Ambulance', 1),
       (2, 'society_police', 'Police', 1),
       (3, 'property', 'Propriété', 0),
       (4, 'society_gitrdone', 'GrD Construction', 1),
       (5, 'society_vigne', 'Winegrower', 1),
       (6, 'society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data`
(
    `id`    int(11)                            NOT NULL,
    `name`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `owner` varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `data`  longtext COLLATE `utf8mb4_bin`
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`)
VALUES (1, 'society_ambulance', NULL, '{}'),
       (2, 'society_police', NULL,
        '{\"weapons\":[{\"name\":\"WEAPON_RPG\",\"count\":0},{\"name\":\"WEAPON_ASSAULTSMG\",\"count\":0}]}'),
       (3, 'property', 'steam:110000102b5c8b8', '{}'),
       (4, 'property', 'steam:11000010079e29a',
        '{\"dressing\":[{\"label\":\"Biker\",\"skin\":{\"beard_2\":10,\"makeup_4\":0,\"age_2\":0,\"sex\":0,\"lipstick_4\":0,\"hair_color_2\":9,\"torso_1\":181,\"makeup_1\":0,\"decals_2\":0,\"shoes_2\":0,\"pants_2\":0,\"helmet_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_color_1\":17,\"bags_1\":0,\"ears_1\":-1,\"face\":0,\"eyebrows_1\":0,\"chain_2\":0,\"glasses_2\":0,\"beard_4\":2,\"chain_1\":0,\"bags_2\":0,\"torso_2\":0,\"beard_3\":4,\"hair_1\":2,\"makeup_2\":0,\"hair_2\":5,\"arms\":20,\"glasses_1\":0,\"bproof_1\":0,\"lipstick_1\":0,\"age_1\":0,\"decals_1\":0,\"helmet_1\":-1,\"makeup_3\":0,\"shoes_1\":1,\"skin\":0,\"ears_2\":0,\"pants_1\":71,\"beard_1\":5,\"eyebrows_2\":0,\"bproof_2\":0,\"mask_2\":0,\"eyebrows_3\":0,\"eyebrows_4\":0,\"lipstick_3\":0,\"mask_1\":4,\"tshirt_1\":38}},{\"skin\":{\"beard_2\":0,\"makeup_4\":0,\"age_2\":0,\"sex\":0,\"lipstick_4\":0,\"ears_2\":0,\"torso_1\":13,\"makeup_1\":0,\"decals_2\":0,\"shoes_2\":2,\"pants_2\":3,\"helmet_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_color_1\":0,\"bags_1\":0,\"ears_1\":-1,\"face\":0,\"bproof_2\":0,\"chain_2\":0,\"glasses_2\":0,\"beard_4\":0,\"chain_1\":0,\"bags_2\":0,\"torso_2\":3,\"beard_3\":0,\"hair_1\":0,\"makeup_2\":0,\"helmet_1\":-1,\"hair_color_2\":0,\"glasses_1\":0,\"bproof_1\":0,\"skin\":0,\"age_1\":0,\"decals_1\":1,\"eyebrows_1\":0,\"makeup_3\":0,\"lipstick_1\":0,\"shoes_1\":1,\"hair_2\":0,\"pants_1\":15,\"beard_1\":0,\"mask_1\":0,\"eyebrows_4\":0,\"mask_2\":0,\"eyebrows_2\":0,\"arms\":11,\"tshirt_1\":15,\"eyebrows_3\":0,\"lipstick_3\":0},\"label\":\"Test\"}]}'),
       (5, 'property', 'steam:11000010ec8a88b', '{}'),
       (6, 'property', 'steam:1100001022a4ec2', '{}'),
       (7, 'property', 'steam:1100001059883bd',
        '{\"dressing\":[{\"skin\":{\"bproof_1\":0,\"eyebrows_1\":0,\"mask_1\":0,\"bags_1\":0,\"ears_1\":-1,\"lipstick_2\":0,\"lipstick_1\":0,\"torso_2\":0,\"ears_2\":0,\"pants_1\":96,\"eyebrows_2\":0,\"beard_1\":0,\"tshirt_2\":0,\"shoes_1\":51,\"hair_color_1\":0,\"pants_2\":0,\"chain_2\":0,\"mask_2\":0,\"glasses_1\":0,\"makeup_4\":0,\"lipstick_3\":0,\"bags_2\":0,\"face\":0,\"torso_1\":250,\"beard_3\":0,\"arms\":85,\"makeup_1\":0,\"hair_1\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"age_2\":0,\"sex\":0,\"helmet_1\":122,\"glasses_2\":0,\"beard_2\":0,\"makeup_3\":0,\"hair_2\":0,\"lipstick_4\":0,\"age_1\":0,\"decals_2\":1,\"skin\":0,\"shoes_2\":0,\"chain_1\":126,\"bproof_2\":0,\"tshirt_1\":129,\"eyebrows_3\":0,\"beard_4\":0,\"decals_1\":58,\"hair_color_2\":0,\"helmet_2\":0},\"label\":\"EMS TIME\"},{\"skin\":{\"bproof_1\":0,\"eyebrows_1\":0,\"mask_1\":0,\"bags_1\":0,\"ears_1\":-1,\"lipstick_2\":0,\"lipstick_1\":0,\"torso_2\":0,\"ears_2\":0,\"pants_1\":59,\"eyebrows_2\":0,\"makeup_1\":0,\"tshirt_2\":0,\"shoes_1\":24,\"hair_color_1\":0,\"pants_2\":8,\"chain_2\":0,\"mask_2\":0,\"glasses_1\":0,\"makeup_4\":0,\"lipstick_3\":0,\"bags_2\":0,\"face\":0,\"torso_1\":55,\"shoes_2\":0,\"bproof_2\":0,\"helmet_1\":17,\"glasses_2\":0,\"makeup_2\":0,\"decals_1\":0,\"hair_1\":0,\"age_2\":0,\"helmet_2\":7,\"sex\":0,\"beard_2\":0,\"makeup_3\":0,\"beard_3\":0,\"lipstick_4\":0,\"age_1\":0,\"decals_2\":0,\"skin\":0,\"hair_2\":0,\"chain_1\":0,\"eyebrows_4\":0,\"tshirt_1\":58,\"eyebrows_3\":0,\"beard_4\":0,\"arms\":19,\"hair_color_2\":0,\"beard_1\":0},\"label\":\"Bike PD\"}]}'),
       (8, 'property', 'steam:110000102d2e853', '{}'),
       (9, 'property', 'steam:110000104e3efcd', '{}'),
       (10, 'property', 'steam:11000010aa8b577', '{}'),
       (11, 'property', 'steam:110000104ab4ae4', '{}'),
       (12, 'property', 'steam:11000010003c4b8',
        '{\"dressing\":[{\"skin\":{\"bproof_1\":0,\"eyebrows_1\":0,\"mask_1\":0,\"bags_1\":0,\"ears_1\":-1,\"lipstick_2\":0,\"lipstick_1\":0,\"torso_2\":0,\"ears_2\":0,\"pants_1\":0,\"eyebrows_2\":0,\"makeup_1\":0,\"tshirt_2\":0,\"shoes_1\":0,\"hair_color_1\":0,\"pants_2\":0,\"chain_2\":0,\"mask_2\":0,\"eyebrows_4\":0,\"makeup_4\":0,\"lipstick_3\":0,\"bags_2\":0,\"face\":0,\"torso_1\":55,\"shoes_2\":0,\"beard_3\":0,\"glasses_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"decals_1\":0,\"hair_1\":0,\"helmet_1\":-1,\"helmet_2\":0,\"age_2\":0,\"sex\":0,\"makeup_3\":0,\"beard_2\":0,\"lipstick_4\":0,\"age_1\":0,\"decals_2\":0,\"skin\":0,\"hair_2\":0,\"chain_1\":0,\"glasses_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"beard_4\":0,\"arms\":0,\"hair_color_2\":0,\"beard_1\":0},\"label\":\"police\"}]}'),
       (13, 'property', 'steam:1100001114b4a38', '{}'),
       (14, 'property', 'steam:11000011aa55d5a', '{}'),
       (15, 'property', 'steam:110000108328a4c', '{}'),
       (16, 'property', 'steam:110000104333f98',
        '{\"dressing\":[{\"skin\":{\"arms\":8,\"pants_1\":76,\"chain_1\":0,\"decals_1\":0,\"glasses_1\":0,\"shoes_2\":2,\"beard_1\":0,\"eyebrows_2\":10,\"makeup_4\":0,\"makeup_2\":0,\"lipstick_3\":0,\"helmet_2\":0,\"pants_2\":0,\"beard_4\":0,\"bags_1\":0,\"beard_3\":0,\"skin\":0,\"hair_color_2\":38,\"hair_2\":0,\"hair_color_1\":0,\"hair_1\":13,\"ears_2\":0,\"torso_1\":8,\"mask_1\":0,\"decals_2\":0,\"makeup_1\":0,\"bags_2\":0,\"face\":0,\"lipstick_2\":0,\"eyebrows_1\":21,\"chain_2\":0,\"eyebrows_3\":0,\"tshirt_1\":57,\"helmet_1\":-1,\"age_1\":0,\"age_2\":0,\"tshirt_2\":0,\"makeup_3\":0,\"shoes_1\":8,\"beard_2\":0,\"lipstick_4\":0,\"mask_2\":0,\"glasses_2\":0,\"bproof_2\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"torso_2\":10,\"ears_1\":-1,\"sex\":0,\"lipstick_1\":0},\"label\":\"Sponsor\"},{\"skin\":{\"arms\":1,\"pants_1\":25,\"chain_1\":0,\"decals_1\":0,\"glasses_1\":17,\"shoes_2\":0,\"beard_1\":10,\"eyebrows_2\":10,\"makeup_4\":0,\"makeup_2\":0,\"sex\":0,\"lipstick_2\":0,\"eyebrows_3\":9,\"beard_4\":0,\"hair_1\":19,\"beard_3\":0,\"skin\":0,\"hair_color_2\":2,\"hair_2\":0,\"hair_color_1\":27,\"bags_1\":0,\"ears_2\":0,\"makeup_1\":0,\"mask_1\":0,\"helmet_2\":0,\"torso_1\":142,\"mask_2\":0,\"face\":0,\"bproof_2\":0,\"eyebrows_1\":5,\"eyebrows_4\":0,\"ears_1\":-1,\"tshirt_1\":3,\"helmet_1\":-1,\"age_1\":0,\"age_2\":0,\"tshirt_2\":1,\"makeup_3\":0,\"shoes_1\":10,\"glasses_2\":4,\"lipstick_4\":0,\"chain_2\":0,\"decals_2\":0,\"pants_2\":1,\"lipstick_3\":0,\"bproof_1\":0,\"torso_2\":0,\"beard_2\":7,\"bags_2\":0,\"lipstick_1\":0},\"label\":\"Prime\"}]}'),
       (17, 'property', 'steam:110000103c985ee', '{}'),
       (18, 'property', 'steam:110000104a7d38d', '{}'),
       (19, 'property', 'steam:11000010deac345', '{}'),
       (20, 'society_gitrdone', NULL, '{}'),
       (21, 'society_vigne', NULL, '{}'),
       (22, 'property', 'steam:11000010c861bdb', '{}'),
       (23, 'property', 'steam:110000136e4df83', '{}'),
       (24, 'property', 'steam:110000103e4adf1', '{}'),
       (25, 'property', 'steam:11000010979381c', '{}'),
       (26, 'property', 'steam:110000105063f4d', '{}'),
       (27, 'property', 'steam:110000105b0d643', '{}'),
       (28, 'property', 'steam:110000106080551', '{}'),
       (29, 'property', 'steam:11000010051bf9a', '{}'),
       (30, 'property', 'steam:1100001114a1946', '{}'),
       (31, 'property', 'steam:110000103f6f09b', '{}'),
       (32, 'property', 'steam:1100001004c2f59',
        '{\"dressing\":[{\"skin\":{\"eyebrows_2\":10,\"shoes_1\":15,\"hair_color_2\":0,\"lipstick_4\":0,\"tshirt_1\":60,\"age_2\":0,\"bproof_2\":0,\"lipstick_2\":0,\"decals_1\":0,\"lipstick_1\":0,\"tshirt_2\":0,\"decals_2\":0,\"bags_2\":0,\"face\":44,\"mask_1\":0,\"beard_4\":3,\"eyebrows_4\":0,\"beard_1\":9,\"bproof_1\":0,\"torso_2\":0,\"skin\":7,\"ears_1\":-1,\"eyebrows_1\":0,\"hair_color_1\":4,\"makeup_1\":0,\"mask_2\":0,\"pants_1\":35,\"makeup_3\":0,\"eyebrows_3\":0,\"beard_2\":10,\"chain_2\":0,\"age_1\":0,\"glasses_2\":5,\"helmet_1\":-1,\"pants_2\":0,\"beard_3\":3,\"makeup_2\":0,\"hair_1\":19,\"arms\":1,\"ears_2\":0,\"torso_1\":23,\"lipstick_3\":0,\"shoes_2\":0,\"glasses_1\":5,\"bags_1\":0,\"chain_1\":0,\"makeup_4\":0,\"sex\":0,\"helmet_2\":0,\"hair_2\":0},\"label\":\"Green Blazer Over Black\"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types`
(
    `id`       int(11) NOT NULL,
    `label`    varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `amount`   int(11)                            DEFAULT NULL,
    `category` int(11)                            DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`)
VALUES (105, 'Misuse of a horn', 30, 0),
       (106, 'Illegally Crossing a continuous Line', 40, 0),
       (107, 'Driving on the wrong side of the road', 250, 0),
       (108, 'Illegal U-Turn', 250, 0),
       (109, 'Illegally Driving Off-road', 170, 0),
       (110, 'Refusing a Lawful Command', 30, 0),
       (111, 'Illegally Stoped of a Vehicle', 150, 0),
       (112, 'Illegal Parking', 70, 0),
       (113, 'Failing to Yield to the right', 70, 0),
       (114, 'Failure to comply with Vehicle Information', 90, 0),
       (115, 'Failing to stop at a Stop Sign ', 105, 0),
       (116, 'Failing to stop at a Red Light', 130, 0),
       (117, 'Illegal Passing', 100, 0),
       (118, 'Driving an illegal Vehicle', 100, 0),
       (119, 'Driving without a License', 1500, 0),
       (120, 'Hit and Run', 800, 0),
       (121, 'Exceeding Speeds Over < 5 mph', 90, 0),
       (122, 'Exceeding Speeds Over 5-15 mph', 120, 0),
       (123, 'Exceeding Speeds Over 15-30 mph', 180, 0),
       (124, 'Exceeding Speeds Over > 30 mph', 300, 0),
       (125, 'Impeding traffic flow', 110, 1),
       (126, 'Public Intoxication', 90, 1),
       (127, 'Disorderly conduct', 90, 1),
       (128, 'Obstruction of Justice', 130, 1),
       (129, 'Insults towards Civilans', 75, 1),
       (130, 'Disrespecting of an LEO', 110, 1),
       (131, 'Verbal Threat towards a Civilan', 90, 1),
       (132, 'Verbal Threat towards an LEO', 150, 1),
       (133, 'Providing False Information', 250, 1),
       (134, 'Attempt of Corruption', 1500, 1),
       (135, 'Brandishing a weapon in city Limits', 120, 2),
       (136, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
       (137, 'No Firearms License', 600, 2),
       (138, 'Possession of an Illegal Weapon', 700, 2),
       (139, 'Possession of Burglary Tools', 300, 2),
       (140, 'Grand Theft Auto', 1800, 2),
       (141, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
       (142, 'Frabrication of an Illegal Substance', 1500, 2),
       (143, 'Possession of an Illegal Substance ', 650, 2),
       (144, 'Kidnapping of a Civilan', 1500, 2),
       (145, 'Kidnapping of an LEO', 2000, 2),
       (146, 'Robbery', 650, 2),
       (147, 'Armed Robbery of a Store', 650, 2),
       (148, 'Armed Robbery of a Bank', 1500, 2),
       (149, 'Assault on a Civilian', 2000, 3),
       (150, 'Assault of an LEO', 2500, 3),
       (151, 'Attempt of Murder of a Civilian', 3000, 3),
       (152, 'Attempt of Murder of an LEO', 5000, 3),
       (153, 'Murder of a Civilian', 10000, 3),
       (154, 'Murder of an LEO', 30000, 3),
       (155, 'Involuntary manslaughter', 1800, 3),
       (156, 'Fraud', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items`
(
    `name`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `label`      varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `limit`      int(11)                           NOT NULL DEFAULT '-1',
    `rare`       int(11)                           NOT NULL DEFAULT '0',
    `can_remove` int(11)                           NOT NULL DEFAULT '1'
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`)
VALUES ('acetone', 'Acetone', 5, 0, 1),
       ('alive_chicken', 'Chicken', 20, 0, 1),
       ('apple', 'Apple', -1, 0, 1),
       ('banana', 'Banana', -1, 0, 1),
       ('bandage', 'Bandage', 20, 0, 1),
       ('bleach', 'Blox Bleach', -1, 0, 1),
       ('bleeder', 'The Bleeder Burger', -1, 0, 1),
       ('blowpipe', 'Chalumeaux', -1, 0, 1),
       ('blowtorch', 'Blowtorch', 1, 0, 1),
       ('book', 'Book', -1, 0, 1),
       ('bread', 'Sandwich', -1, 0, 1),
       ('burger', 'Bacon Roll', -1, 0, 1),
       ('c4_bank', 'C4', 1, 0, 1),
       ('candy', 'EarthQuakes Candy Bar', -1, 0, 1),
       ('candy2', 'Captain\'s Log Candy Bar', -1, 0, 1),
       ('candy3', 'Meteorite Candy Bar', -1, 0, 1),
       ('candy4', 'Zebrabar Candy Bar', -1, 0, 1),
       ('candy5', 'Ego Chaser Candy Bar', -1, 0, 1),
       ('cannabis', 'Cannabis', 40, 0, 1),
       ('carokit', 'Car Kit', -1, 0, 1),
       ('carotool', 'Repair Tools', -1, 0, 1),
       ('cereal', 'Crackles O\'Dawn Cereal', -1, 0, 1),
       ('cheesebows', 'Big Cheese Cips', -1, 0, 1),
       ('chips', 'SuperSalt Chips', -1, 0, 1),
       ('chips2', 'Habanero Chips', -1, 0, 1),
       ('chips3', 'Sticky Ribs Chips', -1, 0, 1),
       ('cigarette', 'Redwood Cigarettes', -1, 0, 1),
       ('cigarette2', 'Cardiaque Cigarettes', -1, 0, 1),
       ('cigarette3', 'Debonaire Cigarettes', -1, 0, 1),
       ('cigarette4', 'Debonaire Cigarettes Menthol', -1, 0, 1),
       ('cigarette5', '69 Brand Cigarettes', -1, 0, 1),
       ('cigarette6', '69 Brand Cigarettes Menthol', -1, 0, 1),
       ('clay', 'Clay', -1, 0, 1),
       ('clothe', 'Clothing', 40, 0, 1),
       ('cocacola', 'Coca Cola', -1, 0, 1),
       ('cocaine', 'Cocaine', 40, 0, 1),
       ('cocaleaf', 'Coca Leaf', 100, 0, 1),
       ('coke_pooch', 'Pouch of coke', -1, 0, 1),
       ('copper', 'Copper', 56, 0, 1),
       ('coupon', 'Vinewood Scratch Card', -1, 0, 1),
       ('coupon2', 'Burgershot Scratch Card', -1, 0, 1),
       ('coupon3', 'Mega Melons Scratch Card', -1, 0, 1),
       ('coupon4', 'Barf Scratch Card', -1, 0, 1),
       ('crappy', 'The Crappy Burger', -1, 0, 1),
       ('cutted_wood', 'Cut Wood', 20, 0, 1),
       ('diamond', 'Diamon', 50, 0, 1),
       ('donut', 'Rusty Brown\'s Ring Donuts', -1, 0, 1),
       ('donut2', 'Birthday Donut', -1, 0, 1),
       ('egg', 'Farm Fresh Eggs', -1, 0, 1),
       ('electronics', 'Electronics', -1, 0, 1),
       ('essence', 'Essence', 24, 0, 1),
       ('fabric', 'Fabric', 80, 0, 1),
       ('fanta', 'Fanta Exotic', -1, 0, 1),
       ('firstaid', 'First-Aid Kit', 10, 0, 1),
       ('fish', 'Fish', 100, 0, 1),
       ('fishstix', 'Fishy Stix', -1, 0, 1),
       ('fixkit', 'Repair Kit', -1, 0, 1),
       ('fixtool', 'Repair Tool', -1, 0, 1),
       ('flashlight', 'Flashlight', 1, 0, 1),
       ('fries', 'Frenchies Fries', -1, 0, 1),
       ('gauze', 'Gauze', 25, 0, 1),
       ('gazbottle', 'Gas Bottle', -1, 0, 1),
       ('gold', 'Gold', 21, 0, 1),
       ('grand_cru', 'Vintage Bottle', -1, 0, 1),
       ('greenapple', 'Green Apple', -1, 0, 1),
       ('grip', 'Grip', 1, 0, 1),
       ('hat', 'Hat', -1, 0, 1),
       ('heartstopper', 'The Heartstopper Burger', -1, 0, 1),
       ('hotsauce', 'Hot Sauce Extra Fiery', -1, 0, 1),
       ('hydrocodone', 'Hydrocodone', 5, 0, 1),
       ('iron', 'Iron', 42, 0, 1),
       ('jewels', 'Jewels', -1, 0, 1),
       ('jus_raisin', 'Grape juice', -1, 0, 1),
       ('laptop', 'Laptop', -1, 0, 1),
       ('largecola', 'Large Drink E-Cola', -1, 0, 1),
       ('largesprunk', 'Large Drink Sprunk', -1, 0, 1),
       ('lighter', 'Lighter', -1, 0, 1),
       ('lithium', 'Lithium Batteries', 10, 0, 1),
       ('lockpick', 'Lockpick', 10, 0, 1),
       ('loka', 'Loka Crush', -1, 0, 1),
       ('lotteryticket', 'Lottery Ticket', -1, 0, 1),
       ('macka', 'Skinkmacka', -1, 0, 1),
       ('marabou', 'Marabou Mjölkchoklad', -1, 0, 1),
       ('marijuana', 'Marijuana', 14, 0, 1),
       ('maxpads', 'Lax to the Max pads', -1, 0, 1),
       ('meatfree', 'Meat Free Burger', -1, 0, 1),
       ('medikit', 'Medical Kit', 5, 0, 1),
       ('medkit', 'Medkit', 5, 0, 1),
       ('metal', 'Metal', 50, 0, 1),
       ('meth', 'Meth', 30, 0, 1),
       ('methlab', 'Portable Methlab', 1, 0, 1),
       ('milk', 'Milk', -1, 0, 1),
       ('moneyshot', 'Money Shot Burger', -1, 0, 1),
       ('morphine', 'Morphine', 5, 0, 1),
       ('noodles', 'Chicken Noodles', -1, 0, 1),
       ('noodles2', 'Seafood Noodles', -1, 0, 1),
       ('orange', 'Orange', -1, 0, 1),
       ('packaged_chicken', 'Packaged Chicken', 100, 0, 1),
       ('packaged_plank', 'Planks', 100, 0, 1),
       ('pants', 'Pants', -1, 0, 1),
       ('pastacarbonara', 'Pasta Carbonara', -1, 0, 1),
       ('patches', 'Nicotine Patches', -1, 0, 1),
       ('pear', 'Pear', -1, 0, 1),
       ('petrol', 'Fuel', 24, 0, 1),
       ('petrol_raffin', 'Refined Fuel', 24, 0, 1),
       ('pineapple', 'Pineapple', -1, 0, 1),
       ('pizza', 'Pizza', -1, 0, 1),
       ('plastic', 'Plastics', -1, 0, 1),
       ('popsicle', 'Orange-O-Tang Popsicle', -1, 0, 1),
       ('popsicle2', 'Creamy Chufty Popsicle', -1, 0, 1),
       ('popsicle3', 'Chocolate Starfish Popsicle', -1, 0, 1),
       ('popsicle4', 'Chilldo Popsicle', -1, 0, 1),
       ('popsicle5', 'Chocolate Chufty Popsicle', -1, 0, 1),
       ('raisin', 'Grapes', -1, 0, 1),
       ('raspberry', 'Raspberry', 1, 0, 1),
       ('saffron', 'Saffron', -1, 0, 1),
       ('shirt', 'Shirt', -1, 0, 1),
       ('shoes', 'Shoes', -1, 0, 1),
       ('silencieux', 'Silencer', 1, 0, 1),
       ('slaughtered_chicken', 'Slaughtered Chicken', 20, 0, 1),
       ('slushy', 'Sludgie Blue Slushy', -1, 0, 1),
       ('slushy2', 'Sludgie Green Slushy', -1, 0, 1),
       ('soup', 'Tomato Soup', -1, 0, 1),
       ('soup2', 'Vegetable Soup', -1, 0, 1),
       ('speaker', 'Speaker', -1, 0, 1),
       ('sprite', 'Sprite', -1, 0, 1),
       ('sprite2', 'Sprunk Light', -1, 0, 1),
       ('stone', 'Stone', 7, 0, 1),
       ('toothpaste', 'Toothpaste', -1, 0, 1),
       ('torpedo', 'The Torpedo Burger', -1, 0, 1),
       ('vicodin', 'Vicodin', 5, 0, 1),
       ('vine', 'Vine', -1, 0, 1),
       ('washed_stone', 'Clean Stone', 7, 0, 1),
       ('water', 'Water', -1, 0, 1),
       ('wood', 'Wood', 20, 0, 1),
       ('wool', 'Wool', 40, 0, 1),
       ('xanax', 'Xanax', -1, 0, 1),
       ('yusuf', 'Skin', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs`
(
    `name`        varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `label`       varchar(50) COLLATE `utf8mb4_bin`          DEFAULT NULL,
    `whitelisted` tinyint(1)                        NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`)
VALUES ('ambulance', 'Ambulance', 1),
       ('busdriver', 'Bus Driver', 0),
       ('cardealer', 'Car Dealer', 1),
       ('fisherman', 'Fisherman', 0),
       ('fueler', 'Fuel', 0),
       ('garbage', 'Garbage Collection', 0),
       ('lumberjack', 'Lumberjack', 1),
       ('mecano', 'Mechanic', 0),
       ('miner', 'Miner', 0),
       ('offambulance', 'Off-Duty', 1),
       ('offpolice', 'Off-Duty', 1),
       ('police', 'Police', 1),
       ('realestateagent', 'Real Estate', 1),
       ('reporter', 'Journalist', 1),
       ('tailor', 'Tailor', 0),
       ('taxi', 'Taxi', 0),
       ('unemployed', 'Unemployed', 0),
       ('vigne', 'Winegrower', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades`
(
    `id`          int(11)                           NOT NULL,
    `job_name`    varchar(50) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `grade`       int(11)                           NOT NULL,
    `name`        varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `label`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `salary`      int(11)                           NOT NULL,
    `skin_male`   longtext COLLATE `utf8mb4_bin`    NOT NULL,
    `skin_female` longtext COLLATE `utf8mb4_bin`    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`)
VALUES (1, 'unemployed', 0, 'unemployed', 'Unemployed', 10, '{}', '{}'),
       (2, 'ambulance', 0, 'student', 'Student Nurse / EMT', 30,
        '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',
        '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
       (3, 'ambulance', 1, 'probation', 'Probation Nurse / EMT', 30,
        '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',
        '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
       (4, 'ambulance', 2, 'npa', 'NPA / EMT', 40,
        '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',
        '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
       (5, 'ambulance', 4, 'boss', 'Dean of Medicine', 1000,
        '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',
        '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
       (6, 'lumberjack', 0, 'employee', 'Interim', 0, '{}', '{}'),
       (7, 'fisherman', 0, 'employee', 'Interim', 0, '{}', '{}'),
       (8, 'fueler', 0, 'employee', 'Interim', 0, '{}', '{}'),
       (9, 'reporter', 0, 'employee', 'Interim', 0, '{}', '{}'),
       (10, 'tailor', 0, 'employee', 'Interim', 0,
        '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}',
        '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
       (11, 'miner', 0, 'employee', 'Interim', 0,
        '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}',
        '{}'),
       (12, 'slaughterer', 0, 'employee', 'Interim', 0,
        '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}',
        '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
       (13, 'police', 0, 'cadet', 'Academy Cadet', 30, '{}',
        '{\"tshirt_2\":1,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":6,\"glasses_1\":4,\"hair_1\":2,\"sex\":1,\"decals_2\":0,\"tshirt_1\":36,\"helmet_1\":8,\"helmet_2\":0,\"arms\":44,\"face\":19,\"decals_1\":60,\"torso_1\":48,\"hair_2\":0,\"skin\":34,\"pants_2\":0}'),
       (14, 'police', 1, 'probie', 'Probationary Officer', 40, '{}', '{}'),
       (15, 'police', 2, 'officer', 'Police Officer', 50, '{}', '{}'),
       (16, 'police', 3, 'detective', 'Detective', 60, '{}', '{}'),
       (17, 'police', 4, 'boss', 'Chief of Police', 1000, '{}', '{}'),
       (18, 'taxi', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
       (19, 'taxi', 1, 'novice', 'Novice', 24, '{}', '{}'),
       (20, 'taxi', 2, 'experimente', 'Expert', 36, '{}', '{}'),
       (21, 'taxi', 3, 'uber', 'Uber', 48, '{}', '{}'),
       (22, 'taxi', 4, 'boss', 'Manager', 0, '{}', '{}'),
       (23, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
       (24, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
       (25, 'cardealer', 2, 'experienced', 'Expert', 40, '{}', '{}'),
       (26, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
       (27, 'realestateagent', 0, 'location', 'Location', 10, '{}', '{}'),
       (28, 'realestateagent', 1, 'vendeur', 'Vendor', 25, '{}', '{}'),
       (29, 'realestateagent', 2, 'gestion', 'Management', 40, '{}', '{}'),
       (30, 'realestateagent', 3, 'boss', 'Boss', 0, '{}', '{}'),
       (31, 'mecano', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
       (32, 'mecano', 1, 'novice', 'Novice', 24, '{}', '{}'),
       (33, 'mecano', 2, 'experimente', 'Expert', 36, '{}', '{}'),
       (34, 'mecano', 3, 'chief', 'Head Mechanic', 48, '{}', '{}'),
       (35, 'mecano', 4, 'boss', 'Boss', 0, '{}', '{}'),
       (36, 'garbage', 0, 'employee', 'Employee', 0,
        '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}',
        '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
       (37, 'ambulance', 3, 'lpn', 'LPN / EMT', 40, '', ''),
       (38, 'ambulance', 5, 'medic', 'Nurse / Paramedic', 50, '', ''),
       (39, 'ambulance', 6, 'aprn', 'APRN / Paramedic', 60, '', ''),
       (40, 'ambulance', 8, 'headnurse', 'Head Nurse', 70, '', ''),
       (41, 'ambulance', 9, 'chiefmedic', 'Paramedic Chief', 70, '', ''),
       (42, 'ambulance', 10, 'gp', 'General Practicioner', 80, '', ''),
       (43, 'ambulance', 11, 'sp', 'Student Physician', 90, '', ''),
       (44, 'ambulance', 12, 'physician', 'Physician', 100, '', ''),
       (45, 'ambulance', 13, 'studentsurgeon', 'Student Surgeon', 200, '', ''),
       (46, 'ambulance', 14, 'surgeon', 'Surgeon', 300, '', ''),
       (47, 'ambulance', 15, 'chiefsurgery', 'Chief of Surgery', 400, '', ''),
       (48, 'ambulance', 16, 'cmo', 'Chief Medical Officer', 500, '', ''),
       (49, 'police', 5, 'fto', 'Field Training Officer', 70, '{}', '{}'),
       (50, 'police', 6, 'detcorporal', 'Det. Corporal', 80, '{}', '{}'),
       (51, 'police', 7, 'corporal', 'Corporal', 90, '{}', '{}'),
       (52, 'police', 8, 'sergeant', 'Sergeant', 100, '{}', '{}'),
       (53, 'police', 9, 'lieutenant', 'Lieutenant', 200, '{}', '{}'),
       (54, 'police', 10, 'inspector', 'Inspector', 300, '{}', '{}'),
       (55, 'police', 11, 'sheriff', 'Sheriff', 400, '{}', '{}'),
       (56, 'police', 12, 'captain', 'Captain', 400, '{}', '{}'),
       (57, 'police', 13, 'assistant', 'Assistant Chief', 500, '{}', '{}'),
       (58, 'offpolice', 0, 'cadet', 'Academy Cadet', 0, '{}', '{}'),
       (59, 'offpolice', 1, 'probie', 'Probationary Officer', 0, '{}', '{}'),
       (60, 'offpolice', 2, 'officer', 'Police Officer', 0, '{}', '{}'),
       (61, 'offpolice', 3, 'detective', 'Detective', 0, '{}', '{}'),
       (62, 'offpolice', 4, 'boss', 'Chief of Police', 0, '{}', '{}'),
       (63, 'offpolice', 5, 'fto', 'Field Training Officer', 0, '{}', '{}'),
       (64, 'offpolice', 6, 'detcorporal', 'Detective Corporal', 0, '{}', '{}'),
       (65, 'offpolice', 7, 'corporal', 'Corporal', 0, '{}', '{}'),
       (66, 'offpolice', 8, 'sergeant', 'Sergeant', 0, '{}', '{}'),
       (67, 'offpolice', 9, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
       (68, 'offpolice', 10, 'inspector', 'Inspector', 0, '{}', '{}'),
       (69, 'offpolice', 11, 'sheriff', 'Sheriff', 0, '{}', '{}'),
       (70, 'offpolice', 12, 'captain', 'Captain', 0, '{}', '{}'),
       (71, 'offpolice', 13, 'assistant', 'Assistant Chief', 0, '{}', '{}'),
       (72, 'offambulance', 0, 'student', 'Ambulance', 0, '{}', '{}'),
       (73, 'offambulance', 1, 'probation', 'Doctor', 0, '{}', '{}'),
       (74, 'offambulance', 2, 'npa', 'NPA / EMT', 0, '{}', '{}'),
       (75, 'offambulance', 4, 'boss', 'Dean of Medicine', 0, '{}', '{}'),
       (76, 'offambulance', 3, 'lpn', 'LPN / EMT', 0, '{}', '{}'),
       (77, 'offambulance', 5, 'medic', 'Nurse / Paramedic', 0, '{}', '{}'),
       (78, 'offambulance', 6, 'aprn', 'APRN / Paramedic', 0, '{}', '{}'),
       (79, 'offambulance', 8, 'headnurse', 'Head Nurse', 0, '{}', '{}'),
       (80, 'offambulance', 9, 'chiefmedic', 'Paramedic Chief', 0, '{}', '{}'),
       (81, 'offambulance', 10, 'gp', 'General Practicioner', 0, '{}', '{}'),
       (82, 'offambulance', 11, 'sp', 'Student Physician', 0, '{}', '{}'),
       (83, 'offambulance', 12, 'physician', 'Physician', 0, '{}', '{}'),
       (84, 'offambulance', 13, 'studentsurgeon', 'Student Surgeon', 0, '{}', '{}'),
       (85, 'offambulance', 14, 'surgeon', 'Surgeon', 0, '{}', '{}'),
       (86, 'offambulance', 15, 'chiefsurgery', 'Chief of Surgery', 0, '{}', '{}'),
       (87, 'offambulance', 16, 'cmo', 'Chief Medical Officer', 0, '{}', '{}'),
       (88, 'busdriver', 0, 'busdriver', 'Bus Driver', 0, '{}', '{}'),
       (94, 'vigne', 0, 'recrue', 'Interim', 500,
        '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}',
        '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
       (95, 'vigne', 1, 'novice', 'Winegrower', 750,
        '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}',
        '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
       (96, 'vigne', 2, 'cdisenior', 'Team boss', 1200,
        '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}',
        '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
       (97, 'vigne', 3, 'boss', 'Boss', 1600,
        '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}',
        '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses`
(
    `id`    int(11)                            NOT NULL,
    `type`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(255) COLLATE `utf8mb4_bin` NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `type`, `label`)
VALUES (1, 'aircraft', 'Aircraft License'),
       (2, 'weed_processing', 'Weed Processing License'),
       (3, 'driver', 'Driver License'),
       (4, 'aircraft', 'Aircraft License'),
       (5, 'boating', 'Boating License');

-- --------------------------------------------------------

--
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties`
(
    `id`     int(11)                            NOT NULL,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `price`  double                             NOT NULL,
    `rented` int(11)                            NOT NULL,
    `owner`  varchar(60) COLLATE `utf8mb4_bin`  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles`
(
    `owner`   varchar(30) COLLATE `utf8mb4_bin` NOT NULL,
    `plate`   varchar(12) COLLATE `utf8mb4_bin` NOT NULL,
    `vehicle` longtext COLLATE `utf8mb4_bin`    NOT NULL,
    `type`    varchar(20) COLLATE `utf8mb4_bin` NOT NULL DEFAULT 'car',
    `job`     varchar(20) COLLATE `utf8mb4_bin`          DEFAULT NULL,
    `stored`  tinyint(1)                        NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `patreon`
--

CREATE TABLE `patreon`
(
    `email`        varchar(64) NOT NULL,
    `cars_allowed` int(11)     NOT NULL,
    `cars_out`     int(11)     NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`;

--
-- Dumping data for table `patreon`
--

INSERT INTO `patreon` (`email`, `cars_allowed`, `cars_out`)
VALUES ('test@gmail.com', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `patreon_cars`
--

CREATE TABLE `patreon_cars`
(
    `model` varchar(32) NOT NULL,
    `name`  varchar(32) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`;

--
-- Dumping data for table `patreon_cars`
--

INSERT INTO `patreon_cars` (`model`, `name`)
VALUES ('dominator', 'Dominator'),
       ('dominator2', 'Dominator GTX'),
       ('dominator3', 'Dominator 3'),
       ('rhino', 'Rhino'),
       ('stretch', 'Stretch Limo');

-- --------------------------------------------------------

--
-- Table structure for table `phone_app_chat`
--

CREATE TABLE `phone_app_chat`
(
    `id`      int(11)      NOT NULL,
    `channel` varchar(20)  NOT NULL,
    `message` varchar(255) NOT NULL,
    `time`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8`;

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls`
(
    `id`       int(11)     NOT NULL,
    `owner`    varchar(10) NOT NULL COMMENT 'Name',
    `num`      varchar(10) NOT NULL COMMENT 'Phone Number',
    `incoming` int(11)     NOT NULL COMMENT 'Define Incoming Call',
    `time`     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `accepts`  int(11)     NOT NULL COMMENT 'Accept Call'
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8`;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages`
(
    `id`          int(11)      NOT NULL,
    `transmitter` varchar(10)  NOT NULL,
    `receiver`    varchar(10)  NOT NULL,
    `message`     varchar(255) NOT NULL DEFAULT '0',
    `time`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `isRead`      int(11)      NOT NULL DEFAULT '0',
    `owner`       int(11)      NOT NULL DEFAULT '0'
) ENGINE = MyISAM
  DEFAULT CHARSET = `utf8`;

-- --------------------------------------------------------

--
-- Table structure for table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts`
(
    `id`         int(11)                             NOT NULL,
    `identifier` varchar(60) CHARACTER SET `utf8mb4`          DEFAULT NULL,
    `number`     varchar(10) CHARACTER SET `utf8mb4`          DEFAULT NULL,
    `display`    varchar(64) CHARACTER SET `utf8mb4` NOT NULL DEFAULT '-1'
) ENGINE = MyISAM
  DEFAULT CHARSET = `utf8`;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties`
(
    `id`         int(11) NOT NULL,
    `name`       varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `label`      varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `entering`   varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `exit`       varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `inside`     varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `outside`    varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `ipls`       varchar(255) COLLATE `utf8mb4_bin` DEFAULT '[]',
    `gateway`    varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `is_single`  int(11)                            DEFAULT NULL,
    `is_room`    int(11)                            DEFAULT NULL,
    `is_gateway` int(11)                            DEFAULT NULL,
    `room_menu`  varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `price`      int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`,
                          `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`)
VALUES (1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}',
        '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}',
        '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0,
        '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
       (2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}',
        '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}',
        '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}',
        1500000),
       (3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}',
        '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}',
        '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0,
        '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
       (4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}',
        '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}',
        '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0,
        '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
       (5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}',
        '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}',
        '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0,
        '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
       (6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}',
        '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}',
        '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0,
        '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
       (7, 'LowEndApartment', 'Basic apartment', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}',
        '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}',
        '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0,
        '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
       (8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}',
        '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}',
        '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0,
        '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
       (9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}',
        '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}',
        '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0,
        '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
       (10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}',
        '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}',
        '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0,
        '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
       (11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}',
        '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}',
        '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}',
        1700000),
       (12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL,
        '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
       (13, 'Modern1Apartment', 'Modern Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
       (14, 'Modern2Apartment', 'Modern Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
       (15, 'Modern3Apartment', 'Modern Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
       (16, 'Mody1Apartment', 'Mody Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
       (17, 'Mody2Apartment', 'Mody Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
       (18, 'Mody3Apartment', 'Mody Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
       (19, 'Vibrant1Apartment', 'Vibrant Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
       (20, 'Vibrant2Apartment', 'Vibrant Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
       (21, 'Vibrant3Apartment', 'Vibrant Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
       (22, 'Sharp1Apartment', 'Sharp Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
       (23, 'Sharp2Apartment', 'Sharp Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
       (24, 'Sharp3Apartment', 'Sharp Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
       (25, 'Monochrome1Apartment', 'Monochrome Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
       (26, 'Monochrome2Apartment', 'Monochrome Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
       (27, 'Monochrome3Apartment', 'Monochrome Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
       (28, 'Seductive1Apartment', 'Seductive Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
       (29, 'Seductive2Apartment', 'Seductive Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
       (30, 'Seductive3Apartment', 'Seductive Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
       (31, 'Regal1Apartment', 'Regal Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
       (32, 'Regal2Apartment', 'Regal Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
       (33, 'Regal3Apartment', 'Regal Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
       (34, 'Aqua1Apartment', 'Aqua Apartment 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}',
        '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
       (35, 'Aqua2Apartment', 'Aqua Apartment 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}',
        '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
       (36, 'Aqua3Apartment', 'Aqua Apartment 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}',
        '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0,
        '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
       (37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL,
        '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
       (38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}',
        '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0,
        '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
       (39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}',
        '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0,
        '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
       (40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL,
        '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
       (41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}',
        '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0,
        '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
       (42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}',
        '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0,
        '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
       (43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL,
        '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
       (44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}',
        '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0,
        '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
       (53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL,
        '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
       (54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL,
        '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL,
        '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}',
        '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0,
        '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
       (63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL,
        '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
       (64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL,
        '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL,
        '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}',
        '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0,
        '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
       (100, 'MedEndApartment1', 'Medium Apartment 1', '{\"y\":3107.56,\"z\":41.49,\"x\":240.6}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":3100.77,\"z\":41.49,\"x\":240.21}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (101, 'MedEndApartment2', 'Medium Apartment 2', '{\"y\":3169.1,\"z\":41.81,\"x\":246.7}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":3163.97,\"z\":41.82,\"x\":245.83}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (102, 'MedEndApartment3', 'Medium Apartment 3', '{\"y\":2667.22,\"z\":39.06,\"x\":980.38}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":2668.77,\"z\":39.06,\"x\":986.38}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (103, 'MedEndApartment4', 'Medium Apartment 4', '{\"y\":3031.08,\"z\":42.89,\"x\":195.85}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":3031.39,\"z\":42.27,\"x\":200.68}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (104, 'MedEndApartment5', 'Medium Apartment 5', '{\"y\":4642.17,\"z\":42.88,\"x\":1724.43}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":4637.34,\"z\":42.31,\"x\":1724.27}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (105, 'MedEndApartment6', 'Medium Apartment 6', '{\"y\":4739.73,\"z\":40.99,\"x\":1664.98}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":4740.93,\"z\":41.08,\"x\":1670.92}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (106, 'MedEndApartment7', 'Medium Apartment 7', '{\"y\":6577.19,\"z\":31.74,\"x\":12.57}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":6572.61,\"z\":31.72,\"x\":16.93}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (107, 'MedEndApartment8', 'Medium Apartment 8', '{\"y\":6190.84,\"z\":30.73,\"x\":-374.31}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":6186.58,\"z\":30.52,\"x\":-372.65}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (108, 'MedEndApartment9', 'Medium Apartment 9', '{\"y\":6597.56,\"z\":30.86,\"x\":-27.06}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":6601.55,\"z\":30.44,\"x\":-30.55}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000),
       (109, 'MedEndApartment10', 'Medium Apartment 10', '{\"y\":6340.1,\"z\":28.84,\"x\":-367.33}',
        '{\"y\":-1012.27,\"z\":-100.2,\"x\":346.49}', '{\"y\":-1000.09,\"z\":-100.2,\"x\":347.06}',
        '{\"y\":6336.97,\"z\":28.84,\"x\":-371.3}', '[]', NULL, 1, 1, 0, '{\"x\":345.3,\"y\":-995.24,\"z\":-100.2}',
        500000);

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles`
(
    `vehicle`     varchar(60) COLLATE `utf8mb4_bin`  NOT NULL,
    `plate`       varchar(12) COLLATE `utf8mb4_bin`  NOT NULL,
    `player_name` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `base_price`  int(11)                            NOT NULL,
    `rent_price`  int(11)                            NOT NULL,
    `owner`       varchar(30) COLLATE `utf8mb4_bin`  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops`
(
    `id`    int(11)                            NOT NULL,
    `store` varchar(100) COLLATE `utf8mb4_bin` NOT NULL,
    `item`  varchar(100) COLLATE `utf8mb4_bin` NOT NULL,
    `price` int(11)                            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`)
VALUES (1, 'TwentyFourSeven', 'bread', 30),
       (2, 'TwentyFourSeven', 'water', 15),
       (3, 'RobsLiquor', 'bread', 30),
       (4, 'RobsLiquor', 'water', 15),
       (5, 'LTDgasoline', 'bread', 30),
       (6, 'LTDgasoline', 'water', 15);

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash`
(
    `id`         int(11)                           NOT NULL,
    `identifier` varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `society`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `amount`     int(11)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks`
(
    `name`     varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `model`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `price`    int(11)                           NOT NULL,
    `category` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `truck_categories`
--

CREATE TABLE `truck_categories`
(
    `name`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(60) COLLATE `utf8mb4_bin` NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `truck_categories`
--

INSERT INTO `truck_categories` (`name`, `label`)
VALUES ('box', 'Boxed Trucks'),
       ('haul', 'Haulers'),
       ('other', 'Other Trucks'),
       ('trans', 'Transport Trucks');

-- --------------------------------------------------------

--
-- Table structure for table `trunk_inventory`
--

CREATE TABLE `trunk_inventory`
(
    `id`    int(11)                          NOT NULL,
    `plate` varchar(8) COLLATE `utf8mb4_bin` NOT NULL,
    `data`  text COLLATE `utf8mb4_bin`       NOT NULL,
    `owned` int(11)                          NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users`
(
    `identifier`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `license`          varchar(50) COLLATE `utf8mb4_bin`          DEFAULT NULL,
    `money`            int(11)                                    DEFAULT NULL,
    `name`             varchar(50) COLLATE `utf8mb4_bin`          DEFAULT '',
    `skin`             longtext COLLATE `utf8mb4_bin`,
    `job`              varchar(50) COLLATE `utf8mb4_bin`          DEFAULT 'unemployed',
    `job_grade`        int(11)                                    DEFAULT '0',
    `loadout`          longtext COLLATE `utf8mb4_bin`,
    `position`         varchar(255) COLLATE `utf8mb4_bin`         DEFAULT NULL,
    `bank`             int(11)                                    DEFAULT NULL,
    `permission_level` int(11)                                    DEFAULT NULL,
    `group`            varchar(50) COLLATE `utf8mb4_bin`          DEFAULT NULL,
    `is_dead`          tinyint(1)                                 DEFAULT '0',
    `firstname`        varchar(50) COLLATE `utf8mb4_bin`          DEFAULT '',
    `lastname`         varchar(50) COLLATE `utf8mb4_bin`          DEFAULT '',
    `dateofbirth`      varchar(25) COLLATE `utf8mb4_bin`          DEFAULT '',
    `sex`              varchar(10) COLLATE `utf8mb4_bin`          DEFAULT '',
    `height`           varchar(5) COLLATE `utf8mb4_bin`           DEFAULT '',
    `status`           longtext COLLATE `utf8mb4_bin`,
    `last_property`    varchar(255) COLLATE `utf8mb4_bin`         DEFAULT NULL,
    `phone_number`     varchar(10) COLLATE `utf8mb4_bin`          DEFAULT NULL,
    `tattoos`          longtext COLLATE `utf8mb4_bin`,
    `jail`             int(11)                           NOT NULL DEFAULT '0',
    `ped`              varchar(32) COLLATE `utf8mb4_bin`          DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts`
(
    `id`         int(11)                           NOT NULL,
    `identifier` varchar(22) COLLATE `utf8mb4_bin` NOT NULL,
    `name`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `money`      double                            NOT NULL DEFAULT '0'
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts`
(
    `id`         int(11)                            NOT NULL,
    `identifier` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `name`       varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `number`     int(11)                            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `user_inventory`
--

CREATE TABLE `user_inventory`
(
    `id`         int(11)                           NOT NULL,
    `identifier` varchar(22) COLLATE `utf8mb4_bin` NOT NULL,
    `item`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `count`      int(11)                           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`)
VALUES (2294, 'steam:110000104ab4ae4', 'methlab', 0),
       (2295, 'steam:110000104ab4ae4', 'packaged_plank', 0),
       (2296, 'steam:110000104ab4ae4', 'gauze', 0),
       (2297, 'steam:110000104ab4ae4', 'jus_raisin', 0),
       (2298, 'steam:110000104ab4ae4', 'packaged_chicken', 0),
       (2299, 'steam:110000104ab4ae4', 'cigarette', 0),
       (2300, 'steam:110000104ab4ae4', 'grip', 0),
       (2301, 'steam:110000104ab4ae4', 'fanta', 0),
       (2302, 'steam:110000104ab4ae4', 'toothpaste', 0),
       (2303, 'steam:110000104ab4ae4', 'alive_chicken', 0),
       (2304, 'steam:110000104ab4ae4', 'coke_pooch', 0),
       (2305, 'steam:110000104ab4ae4', 'blowpipe', 0),
       (2306, 'steam:110000104ab4ae4', 'hydrocodone', 0),
       (2307, 'steam:110000104ab4ae4', 'lockpick', 0),
       (2308, 'steam:110000104ab4ae4', 'cocacola', 0),
       (2309, 'steam:110000104ab4ae4', 'lighter', 0),
       (2310, 'steam:110000104ab4ae4', 'grand_cru', 0),
       (2311, 'steam:110000104ab4ae4', 'fabric', 0),
       (2312, 'steam:110000104ab4ae4', 'water', 28),
       (2313, 'steam:110000104ab4ae4', 'vine', 0),
       (2314, 'steam:110000104ab4ae4', 'fish', 0),
       (2315, 'steam:110000104ab4ae4', 'cutted_wood', 0),
       (2316, 'steam:110000104ab4ae4', 'wool', 0),
       (2317, 'steam:110000104ab4ae4', 'cannabis', 0),
       (2318, 'steam:110000104ab4ae4', 'shoes', 0),
       (2319, 'steam:110000104ab4ae4', 'washed_stone', 0),
       (2320, 'steam:110000104ab4ae4', 'burger', 108),
       (2321, 'steam:110000104ab4ae4', 'fixkit', 0),
       (2322, 'steam:110000104ab4ae4', 'medkit', 0),
       (2323, 'steam:110000104ab4ae4', 'acetone', 0),
       (2324, 'steam:110000104ab4ae4', 'raspberry', 0),
       (2325, 'steam:110000104ab4ae4', 'flashlight', 0),
       (2326, 'steam:110000104ab4ae4', 'fixtool', 0),
       (2327, 'steam:110000104ab4ae4', 'metal', 0),
       (2328, 'steam:110000104ab4ae4', 'meth', 0),
       (2329, 'steam:110000104ab4ae4', 'firstaid', 0),
       (2330, 'steam:110000104ab4ae4', 'medikit', 0),
       (2331, 'steam:110000104ab4ae4', 'wood', 0),
       (2332, 'steam:110000104ab4ae4', 'laptop', 0),
       (2333, 'steam:110000104ab4ae4', 'silencieux', 0),
       (2334, 'steam:110000104ab4ae4', 'bandage', 0),
       (2335, 'steam:110000104ab4ae4', 'cocaine', 0),
       (2336, 'steam:110000104ab4ae4', 'marabou', 0),
       (2337, 'steam:110000104ab4ae4', 'pastacarbonara', 0),
       (2338, 'steam:110000104ab4ae4', 'yusuf', 0),
       (2339, 'steam:110000104ab4ae4', 'book', 0),
       (2340, 'steam:110000104ab4ae4', 'vicodin', 0),
       (2341, 'steam:110000104ab4ae4', 'stone', 0),
       (2342, 'steam:110000104ab4ae4', 'sprite', 0),
       (2343, 'steam:110000104ab4ae4', 'gazbottle', 0),
       (2344, 'steam:110000104ab4ae4', 'slaughtered_chicken', 0),
       (2345, 'steam:110000104ab4ae4', 'shirt', 0),
       (2346, 'steam:110000104ab4ae4', 'macka', 0),
       (2347, 'steam:110000104ab4ae4', 'marijuana', 0),
       (2348, 'steam:110000104ab4ae4', 'diamond', 0),
       (2349, 'steam:110000104ab4ae4', 'essence', 0),
       (2350, 'steam:110000104ab4ae4', 'pizza', 0),
       (2351, 'steam:110000104ab4ae4', 'petrol_raffin', 0),
       (2352, 'steam:110000104ab4ae4', 'copper', 0),
       (2353, 'steam:110000104ab4ae4', 'raisin', 0),
       (2354, 'steam:110000104ab4ae4', 'petrol', 0),
       (2355, 'steam:110000104ab4ae4', 'iron', 0),
       (2356, 'steam:110000104ab4ae4', 'pants', 0),
       (2357, 'steam:110000104ab4ae4', 'carokit', 0),
       (2358, 'steam:110000104ab4ae4', 'saffron', 0),
       (2359, 'steam:110000104ab4ae4', 'coupon', 0),
       (2360, 'steam:110000104ab4ae4', 'clothe', 0),
       (2361, 'steam:110000104ab4ae4', 'bread', 40),
       (2362, 'steam:110000104ab4ae4', 'speaker', 0),
       (2363, 'steam:110000104ab4ae4', 'hat', 0),
       (2364, 'steam:110000104ab4ae4', 'loka', 0),
       (2365, 'steam:110000104ab4ae4', 'c4_bank', 0),
       (2366, 'steam:110000104ab4ae4', 'lotteryticket', 0),
       (2367, 'steam:110000104ab4ae4', 'morphine', 0),
       (2368, 'steam:110000104ab4ae4', 'lithium', 0),
       (2369, 'steam:110000104ab4ae4', 'jewels', 0),
       (2370, 'steam:110000104ab4ae4', 'carotool', 0),
       (2371, 'steam:110000104ab4ae4', 'chips', 0),
       (2372, 'steam:110000104ab4ae4', 'gold', 0),
       (2373, 'steam:110000104ab4ae4', 'xanax', 0),
       (2374, 'steam:110000104ab4ae4', 'cocaleaf', 0),
       (2375, 'steam:110000104ab4ae4', 'cheesebows', 0),
       (2376, 'steam:110000104ab4ae4', 'blowtorch', 0),
       (2377, 'steam:11000010079e29a', 'methlab', 0),
       (2378, 'steam:11000010079e29a', 'packaged_plank', 0),
       (2379, 'steam:11000010079e29a', 'gauze', 16),
       (2380, 'steam:11000010079e29a', 'jus_raisin', 0),
       (2381, 'steam:11000010079e29a', 'packaged_chicken', 0),
       (2382, 'steam:11000010079e29a', 'cigarette', 0),
       (2383, 'steam:11000010079e29a', 'fanta', 0),
       (2384, 'steam:11000010079e29a', 'grip', 0),
       (2385, 'steam:11000010079e29a', 'alive_chicken', 0),
       (2386, 'steam:11000010079e29a', 'toothpaste', 0),
       (2387, 'steam:11000010079e29a', 'coke_pooch', 0),
       (2388, 'steam:11000010079e29a', 'blowpipe', 0),
       (2389, 'steam:11000010079e29a', 'hydrocodone', 0),
       (2390, 'steam:11000010079e29a', 'water', 14),
       (2391, 'steam:11000010079e29a', 'cocacola', 0),
       (2392, 'steam:11000010079e29a', 'lockpick', 0),
       (2393, 'steam:11000010079e29a', 'grand_cru', 0),
       (2394, 'steam:11000010079e29a', 'lighter', 0),
       (2395, 'steam:11000010079e29a', 'fabric', 0),
       (2396, 'steam:11000010079e29a', 'vine', 0),
       (2397, 'steam:11000010079e29a', 'cutted_wood', 0),
       (2398, 'steam:11000010079e29a', 'fish', 0),
       (2399, 'steam:11000010079e29a', 'shoes', 0),
       (2400, 'steam:11000010079e29a', 'wool', 0),
       (2401, 'steam:11000010079e29a', 'cannabis', 0),
       (2402, 'steam:11000010079e29a', 'washed_stone', 0),
       (2403, 'steam:11000010079e29a', 'burger', 7),
       (2404, 'steam:11000010079e29a', 'fixkit', 0),
       (2405, 'steam:11000010079e29a', 'medkit', 12),
       (2406, 'steam:11000010079e29a', 'acetone', 0),
       (2407, 'steam:11000010079e29a', 'raspberry', 0),
       (2408, 'steam:11000010079e29a', 'fixtool', 0),
       (2409, 'steam:11000010079e29a', 'flashlight', 0),
       (2410, 'steam:11000010079e29a', 'firstaid', 24),
       (2411, 'steam:11000010079e29a', 'metal', 0),
       (2412, 'steam:11000010079e29a', 'medikit', 7),
       (2413, 'steam:11000010079e29a', 'meth', 0),
       (2414, 'steam:11000010079e29a', 'wood', 0),
       (2415, 'steam:11000010079e29a', 'bandage', 23),
       (2416, 'steam:11000010079e29a', 'laptop', 0),
       (2417, 'steam:11000010079e29a', 'silencieux', 0),
       (2418, 'steam:11000010079e29a', 'cocaine', 0),
       (2419, 'steam:11000010079e29a', 'marabou', 0),
       (2420, 'steam:11000010079e29a', 'pastacarbonara', 0),
       (2421, 'steam:11000010079e29a', 'yusuf', 0),
       (2422, 'steam:11000010079e29a', 'book', 0),
       (2423, 'steam:11000010079e29a', 'vicodin', 0),
       (2424, 'steam:11000010079e29a', 'stone', 8),
       (2425, 'steam:11000010079e29a', 'slaughtered_chicken', 0),
       (2426, 'steam:11000010079e29a', 'sprite', 0),
       (2427, 'steam:11000010079e29a', 'gazbottle', 25),
       (2428, 'steam:11000010079e29a', 'macka', 0),
       (2429, 'steam:11000010079e29a', 'shirt', 0),
       (2430, 'steam:11000010079e29a', 'marijuana', 0),
       (2431, 'steam:11000010079e29a', 'diamond', 0),
       (2432, 'steam:11000010079e29a', 'pizza', 0),
       (2433, 'steam:11000010079e29a', 'essence', 0),
       (2434, 'steam:11000010079e29a', 'petrol_raffin', 0),
       (2435, 'steam:11000010079e29a', 'raisin', 0),
       (2436, 'steam:11000010079e29a', 'iron', 0),
       (2437, 'steam:11000010079e29a', 'copper', 0),
       (2438, 'steam:11000010079e29a', 'petrol', 0),
       (2439, 'steam:11000010079e29a', 'pants', 0),
       (2440, 'steam:11000010079e29a', 'saffron', 0),
       (2441, 'steam:11000010079e29a', 'carokit', 0),
       (2442, 'steam:11000010079e29a', 'coupon', 0),
       (2443, 'steam:11000010079e29a', 'clothe', 0),
       (2444, 'steam:11000010079e29a', 'bread', 0),
       (2445, 'steam:11000010079e29a', 'speaker', 0),
       (2446, 'steam:11000010079e29a', 'loka', 0),
       (2447, 'steam:11000010079e29a', 'hat', 0),
       (2448, 'steam:11000010079e29a', 'c4_bank', 0),
       (2449, 'steam:11000010079e29a', 'lotteryticket', 0),
       (2450, 'steam:11000010079e29a', 'lithium', 0),
       (2451, 'steam:11000010079e29a', 'morphine', 0),
       (2452, 'steam:11000010079e29a', 'jewels', 0),
       (2453, 'steam:11000010079e29a', 'carotool', 0),
       (2454, 'steam:11000010079e29a', 'chips', 0),
       (2455, 'steam:11000010079e29a', 'gold', 0),
       (2456, 'steam:11000010079e29a', 'xanax', 0),
       (2457, 'steam:11000010079e29a', 'cocaleaf', 0),
       (2458, 'steam:11000010079e29a', 'cheesebows', 0),
       (2459, 'steam:11000010079e29a', 'blowtorch', 0),
       (2460, 'steam:110000104e3efcd', 'methlab', 0),
       (2461, 'steam:110000104e3efcd', 'packaged_plank', 0),
       (2462, 'steam:110000104e3efcd', 'gauze', 0),
       (2463, 'steam:110000104e3efcd', 'jus_raisin', 0),
       (2464, 'steam:110000104e3efcd', 'packaged_chicken', 0),
       (2465, 'steam:110000104e3efcd', 'cigarette', 0),
       (2466, 'steam:110000104e3efcd', 'alive_chicken', 0),
       (2467, 'steam:110000104e3efcd', 'fanta', 0),
       (2468, 'steam:110000104e3efcd', 'grip', 0),
       (2469, 'steam:110000104e3efcd', 'toothpaste', 0),
       (2470, 'steam:110000104e3efcd', 'coke_pooch', 0),
       (2471, 'steam:110000104e3efcd', 'blowpipe', 0),
       (2472, 'steam:110000104e3efcd', 'hydrocodone', 0),
       (2473, 'steam:110000104e3efcd', 'cocacola', 0),
       (2474, 'steam:110000104e3efcd', 'lockpick', 0),
       (2475, 'steam:110000104e3efcd', 'water', 13),
       (2476, 'steam:110000104e3efcd', 'lighter', 0),
       (2477, 'steam:110000104e3efcd', 'grand_cru', 0),
       (2478, 'steam:110000104e3efcd', 'fabric', 0),
       (2479, 'steam:110000104e3efcd', 'vine', 0),
       (2480, 'steam:110000104e3efcd', 'cutted_wood', 0),
       (2481, 'steam:110000104e3efcd', 'fish', 0),
       (2482, 'steam:110000104e3efcd', 'wool', 0),
       (2483, 'steam:110000104e3efcd', 'cannabis', 0),
       (2484, 'steam:110000104e3efcd', 'shoes', 0),
       (2485, 'steam:110000104e3efcd', 'washed_stone', 0),
       (2486, 'steam:110000104e3efcd', 'burger', 27),
       (2487, 'steam:110000104e3efcd', 'fixkit', 0),
       (2488, 'steam:110000104e3efcd', 'medkit', 19),
       (2489, 'steam:110000104e3efcd', 'acetone', 0),
       (2490, 'steam:110000104e3efcd', 'raspberry', 0),
       (2491, 'steam:110000104e3efcd', 'fixtool', 0),
       (2492, 'steam:110000104e3efcd', 'flashlight', 0),
       (2493, 'steam:110000104e3efcd', 'meth', 0),
       (2494, 'steam:110000104e3efcd', 'metal', 0),
       (2495, 'steam:110000104e3efcd', 'firstaid', 0),
       (2496, 'steam:110000104e3efcd', 'medikit', 0),
       (2497, 'steam:110000104e3efcd', 'wood', 0),
       (2498, 'steam:110000104e3efcd', 'laptop', 0),
       (2499, 'steam:110000104e3efcd', 'silencieux', 0),
       (2500, 'steam:110000104e3efcd', 'bandage', 0),
       (2501, 'steam:110000104e3efcd', 'cocaine', 0),
       (2502, 'steam:110000104e3efcd', 'marabou', 0),
       (2503, 'steam:110000104e3efcd', 'pastacarbonara', 0),
       (2504, 'steam:110000104e3efcd', 'yusuf', 0),
       (2505, 'steam:110000104e3efcd', 'book', 0),
       (2506, 'steam:110000104e3efcd', 'vicodin', 0),
       (2507, 'steam:110000104e3efcd', 'stone', 0),
       (2508, 'steam:110000104e3efcd', 'sprite', 0),
       (2509, 'steam:110000104e3efcd', 'gazbottle', 0),
       (2510, 'steam:110000104e3efcd', 'slaughtered_chicken', 0),
       (2511, 'steam:110000104e3efcd', 'macka', 0),
       (2512, 'steam:110000104e3efcd', 'shirt', 0),
       (2513, 'steam:110000104e3efcd', 'marijuana', 0),
       (2514, 'steam:110000104e3efcd', 'essence', 0),
       (2515, 'steam:110000104e3efcd', 'diamond', 0),
       (2516, 'steam:110000104e3efcd', 'pizza', 0),
       (2517, 'steam:110000104e3efcd', 'petrol_raffin', 0),
       (2518, 'steam:110000104e3efcd', 'copper', 0),
       (2519, 'steam:110000104e3efcd', 'raisin', 0),
       (2520, 'steam:110000104e3efcd', 'petrol', 0),
       (2521, 'steam:110000104e3efcd', 'iron', 0),
       (2522, 'steam:110000104e3efcd', 'pants', 0),
       (2523, 'steam:110000104e3efcd', 'carokit', 0),
       (2524, 'steam:110000104e3efcd', 'saffron', 0),
       (2525, 'steam:110000104e3efcd', 'clothe', 0),
       (2526, 'steam:110000104e3efcd', 'coupon', 0),
       (2527, 'steam:110000104e3efcd', 'speaker', 0),
       (2528, 'steam:110000104e3efcd', 'bread', 0),
       (2529, 'steam:110000104e3efcd', 'hat', 0),
       (2530, 'steam:110000104e3efcd', 'loka', 0),
       (2531, 'steam:110000104e3efcd', 'c4_bank', 0),
       (2532, 'steam:110000104e3efcd', 'lotteryticket', 0),
       (2533, 'steam:110000104e3efcd', 'morphine', 0),
       (2534, 'steam:110000104e3efcd', 'lithium', 0),
       (2535, 'steam:110000104e3efcd', 'jewels', 0),
       (2536, 'steam:110000104e3efcd', 'carotool', 0),
       (2537, 'steam:110000104e3efcd', 'chips', 0),
       (2538, 'steam:110000104e3efcd', 'gold', 0),
       (2539, 'steam:110000104e3efcd', 'cocaleaf', 0),
       (2540, 'steam:110000104e3efcd', 'cheesebows', 0),
       (2541, 'steam:110000104e3efcd', 'xanax', 0),
       (2542, 'steam:110000104e3efcd', 'blowtorch', 0),
       (2543, 'steam:110000102d2e853', 'pants', 0),
       (2544, 'steam:110000102d2e853', 'burger', 25),
       (2545, 'steam:110000102d2e853', 'lockpick', 0),
       (2546, 'steam:110000102d2e853', 'morphine', 0),
       (2547, 'steam:110000102d2e853', 'washed_stone', 0),
       (2548, 'steam:110000102d2e853', 'essence', 0),
       (2549, 'steam:110000102d2e853', 'metal', 0),
       (2550, 'steam:110000102d2e853', 'clothe', 0),
       (2551, 'steam:110000102d2e853', 'shoes', 0),
       (2552, 'steam:110000102d2e853', 'fixkit', 0),
       (2553, 'steam:110000102d2e853', 'cocaine', 0),
       (2554, 'steam:110000102d2e853', 'speaker', 0),
       (2555, 'steam:110000102d2e853', 'coke_pooch', 0),
       (2556, 'steam:110000102d2e853', 'laptop', 0),
       (2557, 'steam:110000102d2e853', 'jewels', 0),
       (2558, 'steam:110000102d2e853', 'cutted_wood', 0),
       (2559, 'steam:110000102d2e853', 'cheesebows', 0),
       (2560, 'steam:110000102d2e853', 'blowtorch', 0),
       (2561, 'steam:110000102d2e853', 'fabric', 0),
       (2562, 'steam:110000102d2e853', 'bandage', 0),
       (2563, 'steam:110000102d2e853', 'raisin', 0),
       (2564, 'steam:110000102d2e853', 'grand_cru', 0),
       (2565, 'steam:110000102d2e853', 'hydrocodone', 0),
       (2566, 'steam:110000102d2e853', 'vine', 0),
       (2567, 'steam:110000102d2e853', 'carokit', 0),
       (2568, 'steam:110000102d2e853', 'vicodin', 0),
       (2569, 'steam:110000102d2e853', 'fanta', 0),
       (2570, 'steam:110000102d2e853', 'packaged_plank', 0),
       (2571, 'steam:110000102d2e853', 'loka', 0),
       (2572, 'steam:110000102d2e853', 'sprite', 0),
       (2573, 'steam:110000102d2e853', 'water', 33),
       (2574, 'steam:110000102d2e853', 'iron', 0),
       (2575, 'steam:110000102d2e853', 'lighter', 0),
       (2576, 'steam:110000102d2e853', 'gauze', 0),
       (2577, 'steam:110000102d2e853', 'bread', 0),
       (2578, 'steam:110000102d2e853', 'yusuf', 0),
       (2579, 'steam:110000102d2e853', 'methlab', 0),
       (2580, 'steam:110000102d2e853', 'copper', 0),
       (2581, 'steam:110000102d2e853', 'flashlight', 0),
       (2582, 'steam:110000102d2e853', 'carotool', 0),
       (2583, 'steam:110000102d2e853', 'wood', 0),
       (2584, 'steam:110000102d2e853', 'book', 0),
       (2585, 'steam:110000102d2e853', 'xanax', 0),
       (2586, 'steam:110000102d2e853', 'lithium', 0),
       (2587, 'steam:110000102d2e853', 'wool', 0),
       (2588, 'steam:110000102d2e853', 'gold', 0),
       (2589, 'steam:110000102d2e853', 'toothpaste', 0),
       (2590, 'steam:110000102d2e853', 'lotteryticket', 0),
       (2591, 'steam:110000102d2e853', 'petrol', 0),
       (2592, 'steam:110000102d2e853', 'firstaid', 0),
       (2593, 'steam:110000102d2e853', 'slaughtered_chicken', 0),
       (2594, 'steam:110000102d2e853', 'macka', 0),
       (2595, 'steam:110000102d2e853', 'silencieux', 0),
       (2596, 'steam:110000102d2e853', 'coupon', 0),
       (2597, 'steam:110000102d2e853', 'shirt', 0),
       (2598, 'steam:110000102d2e853', 'saffron', 0),
       (2599, 'steam:110000102d2e853', 'gazbottle', 0),
       (2600, 'steam:110000102d2e853', 'pastacarbonara', 0),
       (2601, 'steam:110000102d2e853', 'meth', 0),
       (2602, 'steam:110000102d2e853', 'raspberry', 0),
       (2603, 'steam:110000102d2e853', 'pizza', 0),
       (2604, 'steam:110000102d2e853', 'cigarette', 0),
       (2605, 'steam:110000102d2e853', 'chips', 0),
       (2606, 'steam:110000102d2e853', 'hat', 0),
       (2607, 'steam:110000102d2e853', 'jus_raisin', 0),
       (2608, 'steam:110000102d2e853', 'petrol_raffin', 0),
       (2609, 'steam:110000102d2e853', 'marabou', 0),
       (2610, 'steam:110000102d2e853', 'cocacola', 0),
       (2611, 'steam:110000102d2e853', 'alive_chicken', 0),
       (2612, 'steam:110000102d2e853', 'stone', 0),
       (2613, 'steam:110000102d2e853', 'cocaleaf', 0),
       (2614, 'steam:110000102d2e853', 'medikit', 0),
       (2615, 'steam:110000102d2e853', 'c4_bank', 0),
       (2616, 'steam:110000102d2e853', 'blowpipe', 0),
       (2617, 'steam:110000102d2e853', 'grip', 0),
       (2618, 'steam:110000102d2e853', 'packaged_chicken', 0),
       (2619, 'steam:110000102d2e853', 'medkit', 0),
       (2620, 'steam:110000102d2e853', 'marijuana', 0),
       (2621, 'steam:110000102d2e853', 'diamond', 0),
       (2622, 'steam:110000102d2e853', 'fixtool', 0),
       (2623, 'steam:110000102d2e853', 'cannabis', 0),
       (2624, 'steam:110000102d2e853', 'fish', 0),
       (2625, 'steam:110000102d2e853', 'acetone', 0),
       (2626, 'steam:11000010ec8a88b', 'pants', 0),
       (2627, 'steam:11000010ec8a88b', 'morphine', 0),
       (2628, 'steam:11000010ec8a88b', 'lockpick', 0),
       (2629, 'steam:11000010ec8a88b', 'burger', 0),
       (2630, 'steam:11000010ec8a88b', 'washed_stone', 0),
       (2631, 'steam:11000010ec8a88b', 'essence', 0),
       (2632, 'steam:11000010ec8a88b', 'fixkit', 0),
       (2633, 'steam:11000010ec8a88b', 'metal', 0),
       (2634, 'steam:11000010ec8a88b', 'shoes', 0),
       (2635, 'steam:11000010ec8a88b', 'clothe', 0),
       (2636, 'steam:11000010ec8a88b', 'cocaine', 0),
       (2637, 'steam:11000010ec8a88b', 'coke_pooch', 0),
       (2638, 'steam:11000010ec8a88b', 'laptop', 0),
       (2639, 'steam:11000010ec8a88b', 'speaker', 0),
       (2640, 'steam:11000010ec8a88b', 'jewels', 0),
       (2641, 'steam:11000010ec8a88b', 'cheesebows', 0),
       (2642, 'steam:11000010ec8a88b', 'cutted_wood', 0),
       (2643, 'steam:11000010ec8a88b', 'blowtorch', 0),
       (2644, 'steam:11000010ec8a88b', 'bandage', 0),
       (2645, 'steam:11000010ec8a88b', 'grand_cru', 0),
       (2646, 'steam:11000010ec8a88b', 'fabric', 0),
       (2647, 'steam:11000010ec8a88b', 'raisin', 0),
       (2648, 'steam:11000010ec8a88b', 'hydrocodone', 0),
       (2649, 'steam:11000010ec8a88b', 'vicodin', 0),
       (2650, 'steam:11000010ec8a88b', 'carokit', 0),
       (2651, 'steam:11000010ec8a88b', 'vine', 0),
       (2652, 'steam:11000010ec8a88b', 'fanta', 0),
       (2653, 'steam:11000010ec8a88b', 'loka', 0),
       (2654, 'steam:11000010ec8a88b', 'sprite', 0),
       (2655, 'steam:11000010ec8a88b', 'packaged_plank', 0),
       (2656, 'steam:11000010ec8a88b', 'water', 995),
       (2657, 'steam:11000010ec8a88b', 'iron', 0),
       (2658, 'steam:11000010ec8a88b', 'methlab', 0),
       (2659, 'steam:11000010ec8a88b', 'lighter', 0),
       (2660, 'steam:11000010ec8a88b', 'bread', 997),
       (2661, 'steam:11000010ec8a88b', 'gauze', 0),
       (2662, 'steam:11000010ec8a88b', 'yusuf', 0),
       (2663, 'steam:11000010ec8a88b', 'carotool', 0),
       (2664, 'steam:11000010ec8a88b', 'copper', 0),
       (2665, 'steam:11000010ec8a88b', 'wood', 0),
       (2666, 'steam:11000010ec8a88b', 'flashlight', 0),
       (2667, 'steam:11000010ec8a88b', 'book', 0),
       (2668, 'steam:11000010ec8a88b', 'xanax', 0),
       (2669, 'steam:11000010ec8a88b', 'gold', 0),
       (2670, 'steam:11000010ec8a88b', 'lithium', 0),
       (2671, 'steam:11000010ec8a88b', 'wool', 0),
       (2672, 'steam:11000010ec8a88b', 'toothpaste', 0),
       (2673, 'steam:11000010ec8a88b', 'lotteryticket', 0),
       (2674, 'steam:11000010ec8a88b', 'petrol', 0),
       (2675, 'steam:11000010ec8a88b', 'slaughtered_chicken', 0),
       (2676, 'steam:11000010ec8a88b', 'macka', 0),
       (2677, 'steam:11000010ec8a88b', 'firstaid', 0),
       (2678, 'steam:11000010ec8a88b', 'silencieux', 0),
       (2679, 'steam:11000010ec8a88b', 'coupon', 0),
       (2680, 'steam:11000010ec8a88b', 'shirt', 0),
       (2681, 'steam:11000010ec8a88b', 'saffron', 0),
       (2682, 'steam:11000010ec8a88b', 'gazbottle', 0),
       (2683, 'steam:11000010ec8a88b', 'pastacarbonara', 0),
       (2684, 'steam:11000010ec8a88b', 'meth', 0),
       (2685, 'steam:11000010ec8a88b', 'pizza', 0),
       (2686, 'steam:11000010ec8a88b', 'raspberry', 0),
       (2687, 'steam:11000010ec8a88b', 'chips', 0),
       (2688, 'steam:11000010ec8a88b', 'cigarette', 0),
       (2689, 'steam:11000010ec8a88b', 'hat', 0),
       (2690, 'steam:11000010ec8a88b', 'petrol_raffin', 0),
       (2691, 'steam:11000010ec8a88b', 'marabou', 0),
       (2692, 'steam:11000010ec8a88b', 'jus_raisin', 0),
       (2693, 'steam:11000010ec8a88b', 'cocacola', 0),
       (2694, 'steam:11000010ec8a88b', 'alive_chicken', 0),
       (2695, 'steam:11000010ec8a88b', 'stone', 0),
       (2696, 'steam:11000010ec8a88b', 'cocaleaf', 0),
       (2697, 'steam:11000010ec8a88b', 'medikit', 0),
       (2698, 'steam:11000010ec8a88b', 'c4_bank', 0),
       (2699, 'steam:11000010ec8a88b', 'blowpipe', 0),
       (2700, 'steam:11000010ec8a88b', 'grip', 0),
       (2701, 'steam:11000010ec8a88b', 'medkit', 102),
       (2702, 'steam:11000010ec8a88b', 'packaged_chicken', 0),
       (2703, 'steam:11000010ec8a88b', 'marijuana', 0),
       (2704, 'steam:11000010ec8a88b', 'diamond', 0),
       (2705, 'steam:11000010ec8a88b', 'fixtool', 0),
       (2706, 'steam:11000010ec8a88b', 'fish', 0),
       (2707, 'steam:11000010ec8a88b', 'cannabis', 0),
       (2708, 'steam:11000010ec8a88b', 'acetone', 0),
       (2709, 'steam:11000010079e29a', 'popsicle', 0),
       (2710, 'steam:11000010079e29a', 'soup2', 0),
       (2711, 'steam:11000010079e29a', 'moneyshot', 0),
       (2712, 'steam:11000010079e29a', 'coupon2', 0),
       (2713, 'steam:11000010079e29a', 'chips2', 0),
       (2714, 'steam:11000010079e29a', 'candy2', 0),
       (2715, 'steam:11000010079e29a', 'candy5', 0),
       (2716, 'steam:11000010079e29a', 'donut', 0),
       (2717, 'steam:11000010079e29a', 'pineapple', 0),
       (2718, 'steam:11000010079e29a', 'largesprunk', 0),
       (2719, 'steam:11000010079e29a', 'meatfree', 0),
       (2720, 'steam:11000010079e29a', 'soup', 0),
       (2721, 'steam:11000010079e29a', 'crappy', 0),
       (2722, 'steam:11000010079e29a', 'fishstix', 0),
       (2723, 'steam:11000010079e29a', 'noodles', 0),
       (2724, 'steam:11000010079e29a', 'candy3', 0),
       (2725, 'steam:11000010079e29a', 'milk', 0),
       (2726, 'steam:11000010079e29a', 'apple', 0),
       (2727, 'steam:11000010079e29a', 'hotsauce', 0),
       (2728, 'steam:11000010079e29a', 'coupon4', 0),
       (2729, 'steam:11000010079e29a', 'cigarette6', 0),
       (2730, 'steam:11000010079e29a', 'slushy', 0),
       (2731, 'steam:11000010079e29a', 'coupon3', 0),
       (2732, 'steam:11000010079e29a', 'patches', 0),
       (2733, 'steam:11000010079e29a', 'pear', 0),
       (2734, 'steam:11000010079e29a', 'chips3', 0),
       (2735, 'steam:11000010079e29a', 'bleeder', 0),
       (2736, 'steam:11000010079e29a', 'cigarette2', 0),
       (2737, 'steam:11000010079e29a', 'candy4', 0),
       (2738, 'steam:11000010079e29a', 'popsicle2', 0),
       (2739, 'steam:11000010079e29a', 'cigarette3', 0),
       (2740, 'steam:11000010079e29a', 'egg', 0),
       (2741, 'steam:11000010079e29a', 'orange', 0),
       (2742, 'steam:11000010079e29a', 'bleach', 0),
       (2743, 'steam:11000010079e29a', 'candy', 0),
       (2744, 'steam:11000010079e29a', 'largecola', 0),
       (2745, 'steam:11000010079e29a', 'popsicle3', 0),
       (2746, 'steam:11000010079e29a', 'cigarette5', 0),
       (2747, 'steam:11000010079e29a', 'torpedo', 0),
       (2748, 'steam:11000010079e29a', 'banana', 0),
       (2749, 'steam:11000010079e29a', 'cereal', 0),
       (2750, 'steam:11000010079e29a', 'sprite2', 0),
       (2751, 'steam:11000010079e29a', 'slushy2', 0),
       (2752, 'steam:11000010079e29a', 'popsicle5', 0),
       (2753, 'steam:11000010079e29a', 'popsicle4', 0),
       (2754, 'steam:11000010079e29a', 'maxpads', 0),
       (2755, 'steam:11000010079e29a', 'heartstopper', 0),
       (2756, 'steam:11000010079e29a', 'noodles2', 0),
       (2757, 'steam:11000010079e29a', 'cigarette4', 0),
       (2758, 'steam:11000010079e29a', 'fries', 0),
       (2759, 'steam:110000102d2e853', 'soup2', 0),
       (2760, 'steam:110000102d2e853', 'moneyshot', 0),
       (2761, 'steam:110000102d2e853', 'popsicle', 0),
       (2762, 'steam:110000102d2e853', 'chips2', 0),
       (2763, 'steam:110000102d2e853', 'coupon2', 0),
       (2764, 'steam:110000102d2e853', 'candy5', 0),
       (2765, 'steam:110000102d2e853', 'candy2', 0),
       (2766, 'steam:110000102d2e853', 'pineapple', 0),
       (2767, 'steam:110000102d2e853', 'largesprunk', 0),
       (2768, 'steam:110000102d2e853', 'donut', 0),
       (2769, 'steam:110000102d2e853', 'meatfree', 0),
       (2770, 'steam:110000102d2e853', 'crappy', 0),
       (2771, 'steam:110000102d2e853', 'fishstix', 0),
       (2772, 'steam:110000102d2e853', 'candy3', 0),
       (2773, 'steam:110000102d2e853', 'soup', 0),
       (2774, 'steam:110000102d2e853', 'cigarette6', 0),
       (2775, 'steam:110000102d2e853', 'noodles', 0),
       (2776, 'steam:110000102d2e853', 'milk', 0),
       (2777, 'steam:110000102d2e853', 'apple', 0),
       (2778, 'steam:110000102d2e853', 'hotsauce', 0),
       (2779, 'steam:110000102d2e853', 'bleeder', 0),
       (2780, 'steam:110000102d2e853', 'coupon4', 0),
       (2781, 'steam:110000102d2e853', 'pear', 0),
       (2782, 'steam:110000102d2e853', 'coupon3', 0),
       (2783, 'steam:110000102d2e853', 'slushy', 0),
       (2784, 'steam:110000102d2e853', 'cigarette3', 0),
       (2785, 'steam:110000102d2e853', 'patches', 0),
       (2786, 'steam:110000102d2e853', 'chips3', 0),
       (2787, 'steam:110000102d2e853', 'cigarette2', 0),
       (2788, 'steam:110000102d2e853', 'egg', 0),
       (2789, 'steam:110000102d2e853', 'orange', 0),
       (2790, 'steam:110000102d2e853', 'bleach', 0),
       (2791, 'steam:110000102d2e853', 'largecola', 0),
       (2792, 'steam:110000102d2e853', 'candy4', 0),
       (2793, 'steam:110000102d2e853', 'popsicle2', 0),
       (2794, 'steam:110000102d2e853', 'candy', 0),
       (2795, 'steam:110000102d2e853', 'popsicle3', 0),
       (2796, 'steam:110000102d2e853', 'cigarette5', 0),
       (2797, 'steam:110000102d2e853', 'torpedo', 0),
       (2798, 'steam:110000102d2e853', 'sprite2', 0),
       (2799, 'steam:110000102d2e853', 'cereal', 0),
       (2800, 'steam:110000102d2e853', 'popsicle5', 0),
       (2801, 'steam:110000102d2e853', 'banana', 0),
       (2802, 'steam:110000102d2e853', 'heartstopper', 0),
       (2803, 'steam:110000102d2e853', 'slushy2', 0),
       (2804, 'steam:110000102d2e853', 'maxpads', 0),
       (2805, 'steam:110000102d2e853', 'fries', 0),
       (2806, 'steam:110000102d2e853', 'cigarette4', 0),
       (2807, 'steam:110000102d2e853', 'noodles2', 0),
       (2808, 'steam:110000102d2e853', 'popsicle4', 0),
       (2809, 'Char1:11000010c861bdb', 'laptop', 0),
       (2810, 'Char1:11000010c861bdb', 'silencieux', 0),
       (2811, 'Char1:11000010c861bdb', 'washed_stone', 0),
       (2812, 'Char1:11000010c861bdb', 'vicodin', 0),
       (2813, 'Char1:11000010c861bdb', 'macka', 0),
       (2814, 'Char1:11000010c861bdb', 'pear', 0),
       (2815, 'Char1:11000010c861bdb', 'popsicle2', 0),
       (2816, 'Char1:11000010c861bdb', 'clothe', 0),
       (2817, 'Char1:11000010c861bdb', 'popsicle5', 0),
       (2818, 'Char1:11000010c861bdb', 'cigarette4', 0),
       (2819, 'Char1:11000010c861bdb', 'sprite', 0),
       (2820, 'Char1:11000010c861bdb', 'cocaine', 0),
       (2821, 'Char1:11000010c861bdb', 'fabric', 0),
       (2822, 'Char1:11000010c861bdb', 'meth', 0),
       (2823, 'Char1:11000010c861bdb', 'jewels', 0),
       (2824, 'Char1:11000010c861bdb', 'saffron', 0),
       (2825, 'Char1:11000010c861bdb', 'patches', 0),
       (2826, 'Char1:11000010c861bdb', 'cocacola', 0),
       (2827, 'Char1:11000010c861bdb', 'yusuf', 0),
       (2828, 'Char1:11000010c861bdb', 'firstaid', 0),
       (2829, 'Char1:11000010c861bdb', 'lotteryticket', 0),
       (2830, 'Char1:11000010c861bdb', 'popsicle4', 0),
       (2831, 'Char1:11000010c861bdb', 'lighter', 0),
       (2832, 'Char1:11000010c861bdb', 'carokit', 0),
       (2833, 'Char1:11000010c861bdb', 'pastacarbonara', 0),
       (2834, 'Char1:11000010c861bdb', 'moneyshot', 0),
       (2835, 'Char1:11000010c861bdb', 'petrol_raffin', 0),
       (2836, 'Char1:11000010c861bdb', 'cannabis', 0),
       (2837, 'Char1:11000010c861bdb', 'soup', 0),
       (2838, 'Char1:11000010c861bdb', 'milk', 0),
       (2839, 'Char1:11000010c861bdb', 'petrol', 0),
       (2840, 'Char1:11000010c861bdb', 'iron', 0),
       (2841, 'Char1:11000010c861bdb', 'acetone', 0),
       (2842, 'Char1:11000010c861bdb', 'bandage', 0),
       (2843, 'Char1:11000010c861bdb', 'gold', 0),
       (2844, 'Char1:11000010c861bdb', 'methlab', 0),
       (2845, 'Char1:11000010c861bdb', 'medikit', 0),
       (2846, 'Char1:11000010c861bdb', 'cheesebows', 0),
       (2847, 'Char1:11000010c861bdb', 'maxpads', 0),
       (2848, 'Char1:11000010c861bdb', 'loka', 0),
       (2849, 'Char1:11000010c861bdb', 'largesprunk', 0),
       (2850, 'Char1:11000010c861bdb', 'fries', 0),
       (2851, 'Char1:11000010c861bdb', 'burger', 0),
       (2852, 'Char1:11000010c861bdb', 'alive_chicken', 0),
       (2853, 'Char1:11000010c861bdb', 'hydrocodone', 0),
       (2854, 'Char1:11000010c861bdb', 'shoes', 0),
       (2855, 'Char1:11000010c861bdb', 'hat', 0),
       (2856, 'Char1:11000010c861bdb', 'candy2', 0),
       (2857, 'Char1:11000010c861bdb', 'slushy', 0),
       (2858, 'Char1:11000010c861bdb', 'grand_cru', 0),
       (2859, 'Char1:11000010c861bdb', 'candy5', 0),
       (2860, 'Char1:11000010c861bdb', 'bleach', 0),
       (2861, 'Char1:11000010c861bdb', 'chips', 0),
       (2862, 'Char1:11000010c861bdb', 'largecola', 0),
       (2863, 'Char1:11000010c861bdb', 'chips2', 0),
       (2864, 'Char1:11000010c861bdb', 'fixtool', 0),
       (2865, 'Char1:11000010c861bdb', 'cigarette', 0),
       (2866, 'Char1:11000010c861bdb', 'lithium', 0),
       (2867, 'Char1:11000010c861bdb', 'cigarette6', 0),
       (2868, 'Char1:11000010c861bdb', 'crappy', 0),
       (2869, 'Char1:11000010c861bdb', 'lockpick', 0),
       (2870, 'Char1:11000010c861bdb', 'banana', 0),
       (2871, 'Char1:11000010c861bdb', 'morphine', 0),
       (2872, 'Char1:11000010c861bdb', 'fanta', 0),
       (2873, 'Char1:11000010c861bdb', 'pineapple', 0),
       (2874, 'Char1:11000010c861bdb', 'copper', 0),
       (2875, 'Char1:11000010c861bdb', 'candy3', 0),
       (2876, 'Char1:11000010c861bdb', 'grip', 0),
       (2877, 'Char1:11000010c861bdb', 'candy4', 0),
       (2878, 'Char1:11000010c861bdb', 'fishstix', 0),
       (2879, 'Char1:11000010c861bdb', 'blowpipe', 0),
       (2880, 'Char1:11000010c861bdb', 'cigarette2', 0),
       (2881, 'Char1:11000010c861bdb', 'noodles2', 0),
       (2882, 'Char1:11000010c861bdb', 'fish', 0),
       (2883, 'Char1:11000010c861bdb', 'pants', 0),
       (2884, 'Char1:11000010c861bdb', 'coupon4', 0),
       (2885, 'Char1:11000010c861bdb', 'vine', 0),
       (2886, 'Char1:11000010c861bdb', 'meatfree', 0),
       (2887, 'Char1:11000010c861bdb', 'c4_bank', 0),
       (2888, 'Char1:11000010c861bdb', 'noodles', 0),
       (2889, 'Char1:11000010c861bdb', 'marabou', 0),
       (2890, 'Char1:11000010c861bdb', 'chips3', 0),
       (2891, 'Char1:11000010c861bdb', 'bread', 0),
       (2892, 'Char1:11000010c861bdb', 'donut', 0),
       (2893, 'Char1:11000010c861bdb', 'wool', 0),
       (2894, 'Char1:11000010c861bdb', 'xanax', 0),
       (2895, 'Char1:11000010c861bdb', 'metal', 0),
       (2896, 'Char1:11000010c861bdb', 'heartstopper', 0),
       (2897, 'Char1:11000010c861bdb', 'water', 0),
       (2898, 'Char1:11000010c861bdb', 'torpedo', 0),
       (2899, 'Char1:11000010c861bdb', 'coke_pooch', 0),
       (2900, 'Char1:11000010c861bdb', 'toothpaste', 0),
       (2901, 'Char1:11000010c861bdb', 'gauze', 0),
       (2902, 'Char1:11000010c861bdb', 'cigarette3', 0),
       (2903, 'Char1:11000010c861bdb', 'jus_raisin', 0),
       (2904, 'Char1:11000010c861bdb', 'stone', 0),
       (2905, 'Char1:11000010c861bdb', 'orange', 0),
       (2906, 'Char1:11000010c861bdb', 'marijuana', 0),
       (2907, 'Char1:11000010c861bdb', 'coupon3', 0),
       (2908, 'Char1:11000010c861bdb', 'slushy2', 0),
       (2909, 'Char1:11000010c861bdb', 'coupon2', 0),
       (2910, 'Char1:11000010c861bdb', 'speaker', 0),
       (2911, 'Char1:11000010c861bdb', 'gazbottle', 0),
       (2912, 'Char1:11000010c861bdb', 'soup2', 0),
       (2913, 'Char1:11000010c861bdb', 'sprite2', 0),
       (2914, 'Char1:11000010c861bdb', 'cutted_wood', 0),
       (2915, 'Char1:11000010c861bdb', 'slaughtered_chicken', 0),
       (2916, 'Char1:11000010c861bdb', 'popsicle3', 0),
       (2917, 'Char1:11000010c861bdb', 'cocaleaf', 0),
       (2918, 'Char1:11000010c861bdb', 'fixkit', 0),
       (2919, 'Char1:11000010c861bdb', 'coupon', 0),
       (2920, 'Char1:11000010c861bdb', 'essence', 0),
       (2921, 'Char1:11000010c861bdb', 'cereal', 0),
       (2922, 'Char1:11000010c861bdb', 'shirt', 0),
       (2923, 'Char1:11000010c861bdb', 'book', 0),
       (2924, 'Char1:11000010c861bdb', 'raspberry', 0),
       (2925, 'Char1:11000010c861bdb', 'hotsauce', 0),
       (2926, 'Char1:11000010c861bdb', 'bleeder', 0),
       (2927, 'Char1:11000010c861bdb', 'raisin', 0),
       (2928, 'Char1:11000010c861bdb', 'popsicle', 0),
       (2929, 'Char1:11000010c861bdb', 'egg', 0),
       (2930, 'Char1:11000010c861bdb', 'apple', 0),
       (2931, 'Char1:11000010c861bdb', 'diamond', 0),
       (2932, 'Char1:11000010c861bdb', 'pizza', 0),
       (2933, 'Char1:11000010c861bdb', 'candy', 0),
       (2934, 'Char1:11000010c861bdb', 'cigarette5', 0),
       (2935, 'Char1:11000010c861bdb', 'medkit', 0),
       (2936, 'Char1:11000010c861bdb', 'packaged_plank', 0),
       (2937, 'Char1:11000010c861bdb', 'flashlight', 0),
       (2938, 'Char1:11000010c861bdb', 'packaged_chicken', 0),
       (2939, 'Char1:11000010c861bdb', 'carotool', 0),
       (2940, 'Char1:11000010c861bdb', 'wood', 0),
       (2941, 'Char1:11000010c861bdb', 'blowtorch', 0),
       (2942, 'steam:110000136e4df83', 'silencieux', 0),
       (2943, 'steam:110000136e4df83', 'washed_stone', 0),
       (2944, 'steam:110000136e4df83', 'laptop', 0),
       (2945, 'steam:110000136e4df83', 'vicodin', 0),
       (2946, 'steam:110000136e4df83', 'macka', 0),
       (2947, 'steam:110000136e4df83', 'popsicle5', 0),
       (2948, 'steam:110000136e4df83', 'pear', 0),
       (2949, 'steam:110000136e4df83', 'popsicle2', 0),
       (2950, 'steam:110000136e4df83', 'clothe', 0),
       (2951, 'steam:110000136e4df83', 'cigarette4', 0),
       (2952, 'steam:110000136e4df83', 'sprite', 0),
       (2953, 'steam:110000136e4df83', 'fabric', 0),
       (2954, 'steam:110000136e4df83', 'meth', 0),
       (2955, 'steam:110000136e4df83', 'cocaine', 0),
       (2956, 'steam:110000136e4df83', 'jewels', 0),
       (2957, 'steam:110000136e4df83', 'cocacola', 0),
       (2958, 'steam:110000136e4df83', 'patches', 0),
       (2959, 'steam:110000136e4df83', 'popsicle4', 0),
       (2960, 'steam:110000136e4df83', 'saffron', 0),
       (2961, 'steam:110000136e4df83', 'yusuf', 0),
       (2962, 'steam:110000136e4df83', 'firstaid', 0),
       (2963, 'steam:110000136e4df83', 'cannabis', 0),
       (2964, 'steam:110000136e4df83', 'carokit', 0),
       (2965, 'steam:110000136e4df83', 'lighter', 0),
       (2966, 'steam:110000136e4df83', 'lotteryticket', 0),
       (2967, 'steam:110000136e4df83', 'pastacarbonara', 0),
       (2968, 'steam:110000136e4df83', 'moneyshot', 0),
       (2969, 'steam:110000136e4df83', 'bandage', 0),
       (2970, 'steam:110000136e4df83', 'petrol_raffin', 0),
       (2971, 'steam:110000136e4df83', 'soup', 0),
       (2972, 'steam:110000136e4df83', 'milk', 0),
       (2973, 'steam:110000136e4df83', 'iron', 0),
       (2974, 'steam:110000136e4df83', 'petrol', 0),
       (2975, 'steam:110000136e4df83', 'acetone', 0),
       (2976, 'steam:110000136e4df83', 'methlab', 0),
       (2977, 'steam:110000136e4df83', 'gold', 0),
       (2978, 'steam:110000136e4df83', 'cheesebows', 0),
       (2979, 'steam:110000136e4df83', 'medikit', 0),
       (2980, 'steam:110000136e4df83', 'maxpads', 0),
       (2981, 'steam:110000136e4df83', 'alive_chicken', 0),
       (2982, 'steam:110000136e4df83', 'largesprunk', 0),
       (2983, 'steam:110000136e4df83', 'loka', 0),
       (2984, 'steam:110000136e4df83', 'hydrocodone', 0),
       (2985, 'steam:110000136e4df83', 'hat', 0),
       (2986, 'steam:110000136e4df83', 'burger', 0),
       (2987, 'steam:110000136e4df83', 'fries', 0),
       (2988, 'steam:110000136e4df83', 'candy5', 0),
       (2989, 'steam:110000136e4df83', 'grand_cru', 0),
       (2990, 'steam:110000136e4df83', 'slushy', 0),
       (2991, 'steam:110000136e4df83', 'shoes', 0),
       (2992, 'steam:110000136e4df83', 'candy2', 0),
       (2993, 'steam:110000136e4df83', 'chips', 0),
       (2994, 'steam:110000136e4df83', 'lithium', 0),
       (2995, 'steam:110000136e4df83', 'bleach', 0),
       (2996, 'steam:110000136e4df83', 'chips2', 0),
       (2997, 'steam:110000136e4df83', 'largecola', 0),
       (2998, 'steam:110000136e4df83', 'cigarette', 0),
       (2999, 'steam:110000136e4df83', 'fanta', 0),
       (3000, 'steam:110000136e4df83', 'morphine', 0),
       (3001, 'steam:110000136e4df83', 'cigarette6', 0),
       (3002, 'steam:110000136e4df83', 'fixtool', 0),
       (3003, 'steam:110000136e4df83', 'lockpick', 0),
       (3004, 'steam:110000136e4df83', 'candy4', 0),
       (3005, 'steam:110000136e4df83', 'crappy', 0),
       (3006, 'steam:110000136e4df83', 'banana', 0),
       (3007, 'steam:110000136e4df83', 'candy3', 0),
       (3008, 'steam:110000136e4df83', 'blowpipe', 0),
       (3009, 'steam:110000136e4df83', 'copper', 0),
       (3010, 'steam:110000136e4df83', 'pineapple', 0),
       (3011, 'steam:110000136e4df83', 'fish', 0),
       (3012, 'steam:110000136e4df83', 'grip', 0),
       (3013, 'steam:110000136e4df83', 'cigarette2', 0),
       (3014, 'steam:110000136e4df83', 'fishstix', 0),
       (3015, 'steam:110000136e4df83', 'meatfree', 0),
       (3016, 'steam:110000136e4df83', 'c4_bank', 0),
       (3017, 'steam:110000136e4df83', 'noodles2', 0),
       (3018, 'steam:110000136e4df83', 'noodles', 0),
       (3019, 'steam:110000136e4df83', 'pants', 0),
       (3020, 'steam:110000136e4df83', 'coupon4', 0),
       (3021, 'steam:110000136e4df83', 'chips3', 0),
       (3022, 'steam:110000136e4df83', 'vine', 0),
       (3023, 'steam:110000136e4df83', 'donut', 0),
       (3024, 'steam:110000136e4df83', 'marabou', 0),
       (3025, 'steam:110000136e4df83', 'heartstopper', 0),
       (3026, 'steam:110000136e4df83', 'bread', 0),
       (3027, 'steam:110000136e4df83', 'wool', 0),
       (3028, 'steam:110000136e4df83', 'toothpaste', 0),
       (3029, 'steam:110000136e4df83', 'cigarette3', 0),
       (3030, 'steam:110000136e4df83', 'xanax', 0),
       (3031, 'steam:110000136e4df83', 'metal', 0),
       (3032, 'steam:110000136e4df83', 'water', 5),
       (3033, 'steam:110000136e4df83', 'coke_pooch', 0),
       (3034, 'steam:110000136e4df83', 'jus_raisin', 0),
       (3035, 'steam:110000136e4df83', 'coupon3', 0),
       (3036, 'steam:110000136e4df83', 'torpedo', 0),
       (3037, 'steam:110000136e4df83', 'gauze', 0),
       (3038, 'steam:110000136e4df83', 'speaker', 0),
       (3039, 'steam:110000136e4df83', 'orange', 0),
       (3040, 'steam:110000136e4df83', 'marijuana', 0),
       (3041, 'steam:110000136e4df83', 'stone', 0),
       (3042, 'steam:110000136e4df83', 'slushy2', 0),
       (3043, 'steam:110000136e4df83', 'coupon2', 0),
       (3044, 'steam:110000136e4df83', 'cutted_wood', 0),
       (3045, 'steam:110000136e4df83', 'popsicle3', 0),
       (3046, 'steam:110000136e4df83', 'gazbottle', 0),
       (3047, 'steam:110000136e4df83', 'soup2', 0),
       (3048, 'steam:110000136e4df83', 'fixkit', 0),
       (3049, 'steam:110000136e4df83', 'slaughtered_chicken', 0),
       (3050, 'steam:110000136e4df83', 'coupon', 0),
       (3051, 'steam:110000136e4df83', 'cocaleaf', 0),
       (3052, 'steam:110000136e4df83', 'sprite2', 0),
       (3053, 'steam:110000136e4df83', 'bleeder', 0),
       (3054, 'steam:110000136e4df83', 'raspberry', 0),
       (3055, 'steam:110000136e4df83', 'essence', 0),
       (3056, 'steam:110000136e4df83', 'cereal', 0),
       (3057, 'steam:110000136e4df83', 'shirt', 0),
       (3058, 'steam:110000136e4df83', 'popsicle', 0),
       (3059, 'steam:110000136e4df83', 'raisin', 0),
       (3060, 'steam:110000136e4df83', 'hotsauce', 0),
       (3061, 'steam:110000136e4df83', 'diamond', 0),
       (3062, 'steam:110000136e4df83', 'book', 0),
       (3063, 'steam:110000136e4df83', 'flashlight', 0),
       (3064, 'steam:110000136e4df83', 'apple', 0),
       (3065, 'steam:110000136e4df83', 'egg', 0),
       (3066, 'steam:110000136e4df83', 'pizza', 0),
       (3067, 'steam:110000136e4df83', 'cigarette5', 0),
       (3068, 'steam:110000136e4df83', 'wood', 0),
       (3069, 'steam:110000136e4df83', 'medkit', 1),
       (3070, 'steam:110000136e4df83', 'packaged_plank', 0),
       (3071, 'steam:110000136e4df83', 'carotool', 0),
       (3072, 'steam:110000136e4df83', 'candy', 0),
       (3073, 'steam:110000136e4df83', 'blowtorch', 0),
       (3074, 'steam:110000136e4df83', 'packaged_chicken', 0),
       (3075, 'steam:11000010c861bdb', 'laptop', 0),
       (3076, 'steam:11000010c861bdb', 'vicodin', 0),
       (3077, 'steam:11000010c861bdb', 'washed_stone', 0),
       (3078, 'steam:11000010c861bdb', 'macka', 0),
       (3079, 'steam:11000010c861bdb', 'silencieux', 0),
       (3080, 'steam:11000010c861bdb', 'popsicle5', 0),
       (3081, 'steam:11000010c861bdb', 'pear', 0),
       (3082, 'steam:11000010c861bdb', 'clothe', 0),
       (3083, 'steam:11000010c861bdb', 'cigarette4', 0),
       (3084, 'steam:11000010c861bdb', 'popsicle2', 0),
       (3085, 'steam:11000010c861bdb', 'cocaine', 0),
       (3086, 'steam:11000010c861bdb', 'jewels', 0),
       (3087, 'steam:11000010c861bdb', 'sprite', 0),
       (3088, 'steam:11000010c861bdb', 'meth', 0),
       (3089, 'steam:11000010c861bdb', 'fabric', 0),
       (3090, 'steam:11000010c861bdb', 'popsicle4', 0),
       (3091, 'steam:11000010c861bdb', 'cocacola', 0),
       (3092, 'steam:11000010c861bdb', 'patches', 0),
       (3093, 'steam:11000010c861bdb', 'saffron', 0),
       (3094, 'steam:11000010c861bdb', 'yusuf', 0),
       (3095, 'steam:11000010c861bdb', 'carokit', 0),
       (3096, 'steam:11000010c861bdb', 'firstaid', 0),
       (3097, 'steam:11000010c861bdb', 'lotteryticket', 0),
       (3098, 'steam:11000010c861bdb', 'lighter', 0),
       (3099, 'steam:11000010c861bdb', 'cannabis', 0),
       (3100, 'steam:11000010c861bdb', 'bandage', 0),
       (3101, 'steam:11000010c861bdb', 'soup', 0),
       (3102, 'steam:11000010c861bdb', 'petrol_raffin', 0),
       (3103, 'steam:11000010c861bdb', 'moneyshot', 0),
       (3104, 'steam:11000010c861bdb', 'pastacarbonara', 0),
       (3105, 'steam:11000010c861bdb', 'gold', 0),
       (3106, 'steam:11000010c861bdb', 'iron', 0),
       (3107, 'steam:11000010c861bdb', 'acetone', 0),
       (3108, 'steam:11000010c861bdb', 'milk', 0),
       (3109, 'steam:11000010c861bdb', 'petrol', 0),
       (3110, 'steam:11000010c861bdb', 'maxpads', 0),
       (3111, 'steam:11000010c861bdb', 'methlab', 0),
       (3112, 'steam:11000010c861bdb', 'largesprunk', 0),
       (3113, 'steam:11000010c861bdb', 'cheesebows', 0),
       (3114, 'steam:11000010c861bdb', 'medikit', 0),
       (3115, 'steam:11000010c861bdb', 'hat', 0),
       (3116, 'steam:11000010c861bdb', 'fries', 0),
       (3117, 'steam:11000010c861bdb', 'alive_chicken', 0),
       (3118, 'steam:11000010c861bdb', 'burger', 0),
       (3119, 'steam:11000010c861bdb', 'loka', 0),
       (3120, 'steam:11000010c861bdb', 'grand_cru', 0),
       (3121, 'steam:11000010c861bdb', 'hydrocodone', 0),
       (3122, 'steam:11000010c861bdb', 'candy2', 0),
       (3123, 'steam:11000010c861bdb', 'slushy', 0),
       (3124, 'steam:11000010c861bdb', 'shoes', 0),
       (3125, 'steam:11000010c861bdb', 'lithium', 0),
       (3126, 'steam:11000010c861bdb', 'chips', 0),
       (3127, 'steam:11000010c861bdb', 'candy5', 0),
       (3128, 'steam:11000010c861bdb', 'bleach', 0),
       (3129, 'steam:11000010c861bdb', 'largecola', 0),
       (3130, 'steam:11000010c861bdb', 'morphine', 0),
       (3131, 'steam:11000010c861bdb', 'chips2', 0),
       (3132, 'steam:11000010c861bdb', 'cigarette', 0),
       (3133, 'steam:11000010c861bdb', 'fixtool', 0),
       (3134, 'steam:11000010c861bdb', 'cigarette6', 0),
       (3135, 'steam:11000010c861bdb', 'lockpick', 0),
       (3136, 'steam:11000010c861bdb', 'banana', 0),
       (3137, 'steam:11000010c861bdb', 'candy4', 0),
       (3138, 'steam:11000010c861bdb', 'crappy', 0),
       (3139, 'steam:11000010c861bdb', 'fanta', 0),
       (3140, 'steam:11000010c861bdb', 'copper', 0),
       (3141, 'steam:11000010c861bdb', 'grip', 0),
       (3142, 'steam:11000010c861bdb', 'candy3', 0),
       (3143, 'steam:11000010c861bdb', 'pineapple', 0),
       (3144, 'steam:11000010c861bdb', 'fish', 0),
       (3145, 'steam:11000010c861bdb', 'noodles2', 0),
       (3146, 'steam:11000010c861bdb', 'fishstix', 0),
       (3147, 'steam:11000010c861bdb', 'c4_bank', 0),
       (3148, 'steam:11000010c861bdb', 'blowpipe', 0),
       (3149, 'steam:11000010c861bdb', 'cigarette2', 0),
       (3150, 'steam:11000010c861bdb', 'vine', 0),
       (3151, 'steam:11000010c861bdb', 'chips3', 0),
       (3152, 'steam:11000010c861bdb', 'coupon4', 0),
       (3153, 'steam:11000010c861bdb', 'meatfree', 0),
       (3154, 'steam:11000010c861bdb', 'pants', 0),
       (3155, 'steam:11000010c861bdb', 'marabou', 0),
       (3156, 'steam:11000010c861bdb', 'noodles', 0),
       (3157, 'steam:11000010c861bdb', 'donut', 0),
       (3158, 'steam:11000010c861bdb', 'heartstopper', 0),
       (3159, 'steam:11000010c861bdb', 'bread', 0),
       (3160, 'steam:11000010c861bdb', 'xanax', 0),
       (3161, 'steam:11000010c861bdb', 'metal', 0),
       (3162, 'steam:11000010c861bdb', 'toothpaste', 0),
       (3163, 'steam:11000010c861bdb', 'wool', 0),
       (3164, 'steam:11000010c861bdb', 'water', 0),
       (3165, 'steam:11000010c861bdb', 'torpedo', 0),
       (3166, 'steam:11000010c861bdb', 'coke_pooch', 0),
       (3167, 'steam:11000010c861bdb', 'coupon3', 0),
       (3168, 'steam:11000010c861bdb', 'cigarette3', 0),
       (3169, 'steam:11000010c861bdb', 'gauze', 0),
       (3170, 'steam:11000010c861bdb', 'jus_raisin', 0),
       (3171, 'steam:11000010c861bdb', 'orange', 0),
       (3172, 'steam:11000010c861bdb', 'slushy2', 0),
       (3173, 'steam:11000010c861bdb', 'marijuana', 0),
       (3174, 'steam:11000010c861bdb', 'stone', 0),
       (3175, 'steam:11000010c861bdb', 'popsicle3', 0),
       (3176, 'steam:11000010c861bdb', 'gazbottle', 0),
       (3177, 'steam:11000010c861bdb', 'soup2', 0),
       (3178, 'steam:11000010c861bdb', 'coupon2', 0),
       (3179, 'steam:11000010c861bdb', 'speaker', 0),
       (3180, 'steam:11000010c861bdb', 'sprite2', 0),
       (3181, 'steam:11000010c861bdb', 'cocaleaf', 0),
       (3182, 'steam:11000010c861bdb', 'fixkit', 0),
       (3183, 'steam:11000010c861bdb', 'cutted_wood', 0),
       (3184, 'steam:11000010c861bdb', 'slaughtered_chicken', 0),
       (3185, 'steam:11000010c861bdb', 'shirt', 0),
       (3186, 'steam:11000010c861bdb', 'essence', 0),
       (3187, 'steam:11000010c861bdb', 'coupon', 0),
       (3188, 'steam:11000010c861bdb', 'bleeder', 0),
       (3189, 'steam:11000010c861bdb', 'cereal', 0),
       (3190, 'steam:11000010c861bdb', 'book', 0),
       (3191, 'steam:11000010c861bdb', 'raspberry', 0),
       (3192, 'steam:11000010c861bdb', 'popsicle', 0),
       (3193, 'steam:11000010c861bdb', 'raisin', 0),
       (3194, 'steam:11000010c861bdb', 'hotsauce', 0),
       (3195, 'steam:11000010c861bdb', 'egg', 0),
       (3196, 'steam:11000010c861bdb', 'cigarette5', 0),
       (3197, 'steam:11000010c861bdb', 'apple', 0),
       (3198, 'steam:11000010c861bdb', 'diamond', 0),
       (3199, 'steam:11000010c861bdb', 'pizza', 0),
       (3200, 'steam:11000010c861bdb', 'medkit', 0),
       (3201, 'steam:11000010c861bdb', 'carotool', 0),
       (3202, 'steam:11000010c861bdb', 'packaged_plank', 0),
       (3203, 'steam:11000010c861bdb', 'candy', 0),
       (3204, 'steam:11000010c861bdb', 'flashlight', 0),
       (3205, 'steam:11000010c861bdb', 'packaged_chicken', 0),
       (3206, 'steam:11000010c861bdb', 'wood', 0),
       (3207, 'steam:11000010c861bdb', 'blowtorch', 0),
       (3208, 'steam:110000104e3efcd', 'popsicle3', 0),
       (3209, 'steam:110000104e3efcd', 'crappy', 0),
       (3210, 'steam:110000104e3efcd', 'torpedo', 0),
       (3211, 'steam:110000104e3efcd', 'slushy2', 0),
       (3212, 'steam:110000104e3efcd', 'hotsauce', 0),
       (3213, 'steam:110000104e3efcd', 'largecola', 0),
       (3214, 'steam:110000104e3efcd', 'patches', 0),
       (3215, 'steam:110000104e3efcd', 'coupon2', 0),
       (3216, 'steam:110000104e3efcd', 'candy', 0),
       (3217, 'steam:110000104e3efcd', 'maxpads', 0),
       (3218, 'steam:110000104e3efcd', 'cigarette3', 0),
       (3219, 'steam:110000104e3efcd', 'largesprunk', 0),
       (3220, 'steam:110000104e3efcd', 'meatfree', 0),
       (3221, 'steam:110000104e3efcd', 'soup2', 0),
       (3222, 'steam:110000104e3efcd', 'orange', 0),
       (3223, 'steam:110000104e3efcd', 'noodles', 0),
       (3224, 'steam:110000104e3efcd', 'milk', 0),
       (3225, 'steam:110000104e3efcd', 'cigarette6', 0),
       (3226, 'steam:110000104e3efcd', 'cigarette2', 0),
       (3227, 'steam:110000104e3efcd', 'coupon4', 0),
       (3228, 'steam:110000104e3efcd', 'candy4', 0),
       (3229, 'steam:110000104e3efcd', 'soup', 0),
       (3230, 'steam:110000104e3efcd', 'donut', 0),
       (3231, 'steam:110000104e3efcd', 'chips3', 0),
       (3232, 'steam:110000104e3efcd', 'fishstix', 0),
       (3233, 'steam:110000104e3efcd', 'bleach', 0),
       (3234, 'steam:110000104e3efcd', 'candy3', 0),
       (3235, 'steam:110000104e3efcd', 'bleeder', 0),
       (3236, 'steam:110000104e3efcd', 'candy2', 0),
       (3237, 'steam:110000104e3efcd', 'popsicle', 0),
       (3238, 'steam:110000104e3efcd', 'fries', 0),
       (3239, 'steam:110000104e3efcd', 'egg', 0),
       (3240, 'steam:110000104e3efcd', 'sprite2', 0),
       (3241, 'steam:110000104e3efcd', 'slushy', 0),
       (3242, 'steam:110000104e3efcd', 'chips2', 0),
       (3243, 'steam:110000104e3efcd', 'cigarette5', 0),
       (3244, 'steam:110000104e3efcd', 'popsicle2', 0),
       (3245, 'steam:110000104e3efcd', 'cigarette4', 0),
       (3246, 'steam:110000104e3efcd', 'popsicle5', 0),
       (3247, 'steam:110000104e3efcd', 'cereal', 0),
       (3248, 'steam:110000104e3efcd', 'coupon3', 0),
       (3249, 'steam:110000104e3efcd', 'pineapple', 0),
       (3250, 'steam:110000104e3efcd', 'moneyshot', 0),
       (3251, 'steam:110000104e3efcd', 'noodles2', 0),
       (3252, 'steam:110000104e3efcd', 'popsicle4', 0),
       (3253, 'steam:110000104e3efcd', 'pear', 0),
       (3254, 'steam:110000104e3efcd', 'candy5', 0),
       (3255, 'steam:110000104e3efcd', 'apple', 0),
       (3256, 'steam:110000104e3efcd', 'heartstopper', 0),
       (3257, 'steam:110000104e3efcd', 'banana', 0),
       (3258, 'steam:110000104333f98', 'shoes', 0),
       (3259, 'steam:110000104333f98', 'fixtool', 0),
       (3260, 'steam:110000104333f98', 'popsicle3', 0),
       (3261, 'steam:110000104333f98', 'slushy2', 0),
       (3262, 'steam:110000104333f98', 'raisin', 0),
       (3263, 'steam:110000104333f98', 'torpedo', 0),
       (3264, 'steam:110000104333f98', 'laptop', 0),
       (3265, 'steam:110000104333f98', 'hotsauce', 0),
       (3266, 'steam:110000104333f98', 'iron', 0),
       (3267, 'steam:110000104333f98', 'crappy', 0),
       (3268, 'steam:110000104333f98', 'maxpads', 0),
       (3269, 'steam:110000104333f98', 'patches', 0),
       (3270, 'steam:110000104333f98', 'coupon2', 0),
       (3271, 'steam:110000104333f98', 'candy', 0),
       (3272, 'steam:110000104333f98', 'lockpick', 0),
       (3273, 'steam:110000104333f98', 'largecola', 0),
       (3274, 'steam:110000104333f98', 'cannabis', 0),
       (3275, 'steam:110000104333f98', 'pants', 0),
       (3276, 'steam:110000104333f98', 'essence', 0),
       (3277, 'steam:110000104333f98', 'bandage', 0),
       (3278, 'steam:110000104333f98', 'blowtorch', 0),
       (3279, 'steam:110000104333f98', 'orange', 0),
       (3280, 'steam:110000104333f98', 'cigarette3', 0),
       (3281, 'steam:110000104333f98', 'meatfree', 0),
       (3282, 'steam:110000104333f98', 'marijuana', 0),
       (3283, 'steam:110000104333f98', 'soup2', 0),
       (3284, 'steam:110000104333f98', 'burger', 0),
       (3285, 'steam:110000104333f98', 'marabou', 0),
       (3286, 'steam:110000104333f98', 'shirt', 0),
       (3287, 'steam:110000104333f98', 'jewels', 0),
       (3288, 'steam:110000104333f98', 'largesprunk', 0),
       (3289, 'steam:110000104333f98', 'cocaleaf', 0),
       (3290, 'steam:110000104333f98', 'flashlight', 0),
       (3291, 'steam:110000104333f98', 'fish', 0),
       (3292, 'steam:110000104333f98', 'gazbottle', 0),
       (3293, 'steam:110000104333f98', 'pizza', 0),
       (3294, 'steam:110000104333f98', 'coupon4', 0),
       (3295, 'steam:110000104333f98', 'blowpipe', 0),
       (3296, 'steam:110000104333f98', 'wood', 0),
       (3297, 'steam:110000104333f98', 'c4_bank', 0),
       (3298, 'steam:110000104333f98', 'saffron', 0),
       (3299, 'steam:110000104333f98', 'noodles', 0),
       (3300, 'steam:110000104333f98', 'hat', 0),
       (3301, 'steam:110000104333f98', 'hydrocodone', 0),
       (3302, 'steam:110000104333f98', 'cigarette2', 0),
       (3303, 'steam:110000104333f98', 'fixkit', 0),
       (3304, 'steam:110000104333f98', 'milk', 0),
       (3305, 'steam:110000104333f98', 'medikit', 0),
       (3306, 'steam:110000104333f98', 'gold', 0),
       (3307, 'steam:110000104333f98', 'jus_raisin', 0),
       (3308, 'steam:110000104333f98', 'silencieux', 0),
       (3309, 'steam:110000104333f98', 'candy4', 0),
       (3310, 'steam:110000104333f98', 'cigarette6', 0),
       (3311, 'steam:110000104333f98', 'speaker', 0),
       (3312, 'steam:110000104333f98', 'carokit', 0),
       (3313, 'steam:110000104333f98', 'methlab', 0),
       (3314, 'steam:110000104333f98', 'cutted_wood', 0),
       (3315, 'steam:110000104333f98', 'soup', 0),
       (3316, 'steam:110000104333f98', 'toothpaste', 0),
       (3317, 'steam:110000104333f98', 'donut', 0),
       (3318, 'steam:110000104333f98', 'coke_pooch', 0),
       (3319, 'steam:110000104333f98', 'fanta', 0),
       (3320, 'steam:110000104333f98', 'lithium', 0),
       (3321, 'steam:110000104333f98', 'xanax', 0),
       (3322, 'steam:110000104333f98', 'cigarette', 0),
       (3323, 'steam:110000104333f98', 'acetone', 0),
       (3324, 'steam:110000104333f98', 'petrol', 0),
       (3325, 'steam:110000104333f98', 'alive_chicken', 0),
       (3326, 'steam:110000104333f98', 'packaged_chicken', 0),
       (3327, 'steam:110000104333f98', 'loka', 0),
       (3328, 'steam:110000104333f98', 'grand_cru', 0),
       (3329, 'steam:110000104333f98', 'diamond', 0),
       (3330, 'steam:110000104333f98', 'cocacola', 0),
       (3331, 'steam:110000104333f98', 'lighter', 0),
       (3332, 'steam:110000104333f98', 'fishstix', 0),
       (3333, 'steam:110000104333f98', 'petrol_raffin', 0),
       (3334, 'steam:110000104333f98', 'meth', 0),
       (3335, 'steam:110000104333f98', 'vine', 0),
       (3336, 'steam:110000104333f98', 'chips3', 0),
       (3337, 'steam:110000104333f98', 'bleach', 0),
       (3338, 'steam:110000104333f98', 'macka', 0),
       (3339, 'steam:110000104333f98', 'pastacarbonara', 0),
       (3340, 'steam:110000104333f98', 'book', 0),
       (3341, 'steam:110000104333f98', 'candy3', 0),
       (3342, 'steam:110000104333f98', 'vicodin', 0),
       (3343, 'steam:110000104333f98', 'packaged_plank', 0),
       (3344, 'steam:110000104333f98', 'copper', 0),
       (3345, 'steam:110000104333f98', 'gauze', 0),
       (3346, 'steam:110000104333f98', 'medkit', 0),
       (3347, 'steam:110000104333f98', 'candy2', 0),
       (3348, 'steam:110000104333f98', 'popsicle', 0),
       (3349, 'steam:110000104333f98', 'wool', 0),
       (3350, 'steam:110000104333f98', 'water', 12),
       (3351, 'steam:110000104333f98', 'yusuf', 0),
       (3352, 'steam:110000104333f98', 'bleeder', 0),
       (3353, 'steam:110000104333f98', 'stone', 0),
       (3354, 'steam:110000104333f98', 'washed_stone', 0),
       (3355, 'steam:110000104333f98', 'firstaid', 0),
       (3356, 'steam:110000104333f98', 'fries', 0),
       (3357, 'steam:110000104333f98', 'egg', 0),
       (3358, 'steam:110000104333f98', 'sprite2', 0),
       (3359, 'steam:110000104333f98', 'chips2', 0),
       (3360, 'steam:110000104333f98', 'sprite', 0),
       (3361, 'steam:110000104333f98', 'bread', 13),
       (3362, 'steam:110000104333f98', 'slushy', 0),
       (3363, 'steam:110000104333f98', 'morphine', 0),
       (3364, 'steam:110000104333f98', 'popsicle2', 0),
       (3365, 'steam:110000104333f98', 'cigarette5', 0),
       (3366, 'steam:110000104333f98', 'cheesebows', 0),
       (3367, 'steam:110000104333f98', 'coupon', 0),
       (3368, 'steam:110000104333f98', 'fabric', 0),
       (3369, 'steam:110000104333f98', 'popsicle5', 0),
       (3370, 'steam:110000104333f98', 'carotool', 0),
       (3371, 'steam:110000104333f98', 'metal', 0),
       (3372, 'steam:110000104333f98', 'cereal', 0),
       (3373, 'steam:110000104333f98', 'lotteryticket', 0),
       (3374, 'steam:110000104333f98', 'cigarette4', 0),
       (3375, 'steam:110000104333f98', 'coupon3', 0),
       (3376, 'steam:110000104333f98', 'pineapple', 0),
       (3377, 'steam:110000104333f98', 'popsicle4', 0),
       (3378, 'steam:110000104333f98', 'moneyshot', 0),
       (3379, 'steam:110000104333f98', 'clothe', 0),
       (3380, 'steam:110000104333f98', 'noodles2', 0),
       (3381, 'steam:110000104333f98', 'candy5', 0),
       (3382, 'steam:110000104333f98', 'heartstopper', 0),
       (3383, 'steam:110000104333f98', 'raspberry', 0),
       (3384, 'steam:110000104333f98', 'pear', 0),
       (3385, 'steam:110000104333f98', 'grip', 0),
       (3386, 'steam:110000104333f98', 'banana', 0),
       (3387, 'steam:110000104333f98', 'apple', 0),
       (3388, 'steam:110000104333f98', 'chips', 0),
       (3389, 'steam:110000104333f98', 'cocaine', 0),
       (3390, 'steam:110000104333f98', 'slaughtered_chicken', 0),
       (3524, 'steam:11000010979381c', 'noodles2', 0),
       (3525, 'steam:11000010979381c', 'chips3', 0),
       (3526, 'steam:11000010979381c', 'candy3', 0),
       (3527, 'steam:11000010979381c', 'stone', 0);
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`)
VALUES (3528, 'steam:11000010979381c', 'hydrocodone', 0),
       (3529, 'steam:11000010979381c', 'candy4', 0),
       (3530, 'steam:11000010979381c', 'sprite2', 0),
       (3531, 'steam:11000010979381c', 'macka', 0),
       (3532, 'steam:11000010979381c', 'laptop', 0),
       (3533, 'steam:11000010979381c', 'fries', 0),
       (3534, 'steam:11000010979381c', 'apple', 0),
       (3535, 'steam:11000010979381c', 'banana', 0),
       (3536, 'steam:11000010979381c', 'meth', 0),
       (3537, 'steam:11000010979381c', 'orange', 0),
       (3538, 'steam:11000010979381c', 'methlab', 0),
       (3539, 'steam:11000010979381c', 'coke_pooch', 0),
       (3540, 'steam:11000010979381c', 'loka', 0),
       (3541, 'steam:11000010979381c', 'morphine', 0),
       (3542, 'steam:11000010979381c', 'sprite', 0),
       (3543, 'steam:11000010979381c', 'cutted_wood', 0),
       (3544, 'steam:11000010979381c', 'hat', 0),
       (3545, 'steam:11000010979381c', 'fabric', 0),
       (3546, 'steam:11000010979381c', 'pizza', 0),
       (3547, 'steam:11000010979381c', 'cheesebows', 0),
       (3548, 'steam:11000010979381c', 'popsicle', 0),
       (3549, 'steam:11000010979381c', 'cigarette', 0),
       (3550, 'steam:11000010979381c', 'cocacola', 0),
       (3551, 'steam:11000010979381c', 'fixkit', 0),
       (3552, 'steam:11000010979381c', 'candy5', 0),
       (3553, 'steam:11000010979381c', 'burger', 0),
       (3554, 'steam:11000010979381c', 'fanta', 0),
       (3555, 'steam:11000010979381c', 'c4_bank', 0),
       (3556, 'steam:11000010979381c', 'popsicle3', 0),
       (3557, 'steam:11000010979381c', 'xanax', 0),
       (3558, 'steam:11000010979381c', 'torpedo', 0),
       (3559, 'steam:11000010979381c', 'chips', 0),
       (3560, 'steam:11000010979381c', 'blowtorch', 0),
       (3561, 'steam:11000010979381c', 'slushy', 0),
       (3562, 'steam:11000010979381c', 'candy', 0),
       (3563, 'steam:11000010979381c', 'packaged_plank', 0),
       (3564, 'steam:11000010979381c', 'soup2', 0),
       (3565, 'steam:11000010979381c', 'firstaid', 0),
       (3566, 'steam:11000010979381c', 'heartstopper', 0),
       (3567, 'steam:11000010979381c', 'grip', 0),
       (3568, 'steam:11000010979381c', 'petrol_raffin', 0),
       (3569, 'steam:11000010979381c', 'bleeder', 0),
       (3570, 'steam:11000010979381c', 'alive_chicken', 0),
       (3571, 'steam:11000010979381c', 'slaughtered_chicken', 0),
       (3572, 'steam:11000010979381c', 'coupon2', 0),
       (3573, 'steam:11000010979381c', 'bandage', 0),
       (3574, 'steam:11000010979381c', 'gauze', 0),
       (3575, 'steam:11000010979381c', 'pastacarbonara', 0),
       (3576, 'steam:11000010979381c', 'petrol', 0),
       (3577, 'steam:11000010979381c', 'raisin', 0),
       (3578, 'steam:11000010979381c', 'blowpipe', 0),
       (3579, 'steam:11000010979381c', 'pear', 0),
       (3580, 'steam:11000010979381c', 'cigarette2', 0),
       (3581, 'steam:11000010979381c', 'wool', 0),
       (3582, 'steam:11000010979381c', 'metal', 0),
       (3583, 'steam:11000010979381c', 'water', 5),
       (3584, 'steam:11000010979381c', 'chips2', 0),
       (3585, 'steam:11000010979381c', 'fish', 0),
       (3586, 'steam:11000010979381c', 'washed_stone', 0),
       (3587, 'steam:11000010979381c', 'cannabis', 0),
       (3588, 'steam:11000010979381c', 'largecola', 0),
       (3589, 'steam:11000010979381c', 'saffron', 0),
       (3590, 'steam:11000010979381c', 'patches', 0),
       (3591, 'steam:11000010979381c', 'popsicle5', 0),
       (3592, 'steam:11000010979381c', 'medkit', 0),
       (3593, 'steam:11000010979381c', 'marabou', 0),
       (3594, 'steam:11000010979381c', 'hotsauce', 0),
       (3595, 'steam:11000010979381c', 'speaker', 0),
       (3596, 'steam:11000010979381c', 'coupon3', 0),
       (3597, 'steam:11000010979381c', 'donut', 0),
       (3598, 'steam:11000010979381c', 'gazbottle', 0),
       (3599, 'steam:11000010979381c', 'moneyshot', 0),
       (3600, 'steam:11000010979381c', 'clothe', 0),
       (3601, 'steam:11000010979381c', 'acetone', 0),
       (3602, 'steam:11000010979381c', 'carotool', 0),
       (3603, 'steam:11000010979381c', 'lockpick', 0),
       (3604, 'steam:11000010979381c', 'book', 0),
       (3605, 'steam:11000010979381c', 'wood', 0),
       (3606, 'steam:11000010979381c', 'soup', 0),
       (3607, 'steam:11000010979381c', 'cigarette5', 0),
       (3608, 'steam:11000010979381c', 'gold', 0),
       (3609, 'steam:11000010979381c', 'lighter', 0),
       (3610, 'steam:11000010979381c', 'yusuf', 0),
       (3611, 'steam:11000010979381c', 'vicodin', 0),
       (3612, 'steam:11000010979381c', 'vine', 0),
       (3613, 'steam:11000010979381c', 'fishstix', 0),
       (3614, 'steam:11000010979381c', 'fixtool', 0),
       (3615, 'steam:11000010979381c', 'meatfree', 0),
       (3616, 'steam:11000010979381c', 'jewels', 0),
       (3617, 'steam:11000010979381c', 'lotteryticket', 0),
       (3618, 'steam:11000010979381c', 'maxpads', 0),
       (3619, 'steam:11000010979381c', 'silencieux', 0),
       (3620, 'steam:11000010979381c', 'copper', 0),
       (3621, 'steam:11000010979381c', 'crappy', 0),
       (3622, 'steam:11000010979381c', 'toothpaste', 0),
       (3623, 'steam:11000010979381c', 'flashlight', 0),
       (3624, 'steam:11000010979381c', 'cocaine', 0),
       (3625, 'steam:11000010979381c', 'pineapple', 0),
       (3626, 'steam:11000010979381c', 'essence', 0),
       (3627, 'steam:11000010979381c', 'packaged_chicken', 0),
       (3628, 'steam:11000010979381c', 'slushy2', 0),
       (3629, 'steam:11000010979381c', 'lithium', 0),
       (3630, 'steam:11000010979381c', 'cigarette6', 0),
       (3631, 'steam:11000010979381c', 'cigarette4', 0),
       (3632, 'steam:11000010979381c', 'milk', 0),
       (3633, 'steam:11000010979381c', 'popsicle4', 0),
       (3634, 'steam:11000010979381c', 'grand_cru', 0),
       (3635, 'steam:11000010979381c', 'bleach', 0),
       (3636, 'steam:11000010979381c', 'shoes', 0),
       (3637, 'steam:11000010979381c', 'raspberry', 0),
       (3638, 'steam:11000010979381c', 'shirt', 0),
       (3639, 'steam:11000010979381c', 'largesprunk', 0),
       (3640, 'steam:11000010979381c', 'carokit', 0),
       (3641, 'steam:11000010979381c', 'egg', 0),
       (3642, 'steam:11000010979381c', 'bread', 0),
       (3643, 'steam:11000010979381c', 'popsicle2', 0),
       (3644, 'steam:11000010979381c', 'cigarette3', 0),
       (3645, 'steam:11000010979381c', 'cocaleaf', 0),
       (3646, 'steam:11000010979381c', 'diamond', 0),
       (3647, 'steam:11000010979381c', 'cereal', 0),
       (3648, 'steam:11000010979381c', 'marijuana', 0),
       (3649, 'steam:11000010979381c', 'coupon4', 0),
       (3650, 'steam:11000010979381c', 'candy2', 0),
       (3651, 'steam:11000010979381c', 'pants', 0),
       (3652, 'steam:11000010979381c', 'coupon', 0),
       (3653, 'steam:11000010979381c', 'noodles', 0),
       (3654, 'steam:11000010979381c', 'medikit', 0),
       (3655, 'steam:11000010979381c', 'iron', 0),
       (3656, 'steam:11000010979381c', 'jus_raisin', 0),
       (3657, 'steam:110000108328a4c', 'stone', 0),
       (3658, 'steam:110000108328a4c', 'noodles2', 0),
       (3659, 'steam:110000108328a4c', 'chips3', 0),
       (3660, 'steam:110000108328a4c', 'candy3', 0),
       (3661, 'steam:110000108328a4c', 'hydrocodone', 0),
       (3662, 'steam:110000108328a4c', 'laptop', 0),
       (3663, 'steam:110000108328a4c', 'fries', 0),
       (3664, 'steam:110000108328a4c', 'macka', 0),
       (3665, 'steam:110000108328a4c', 'sprite2', 0),
       (3666, 'steam:110000108328a4c', 'candy4', 0),
       (3667, 'steam:110000108328a4c', 'methlab', 0),
       (3668, 'steam:110000108328a4c', 'orange', 0),
       (3669, 'steam:110000108328a4c', 'apple', 0),
       (3670, 'steam:110000108328a4c', 'banana', 0),
       (3671, 'steam:110000108328a4c', 'meth', 0),
       (3672, 'steam:110000108328a4c', 'cutted_wood', 0),
       (3673, 'steam:110000108328a4c', 'loka', 0),
       (3674, 'steam:110000108328a4c', 'morphine', 0),
       (3675, 'steam:110000108328a4c', 'coke_pooch', 0),
       (3676, 'steam:110000108328a4c', 'sprite', 0),
       (3677, 'steam:110000108328a4c', 'cheesebows', 0),
       (3678, 'steam:110000108328a4c', 'fabric', 0),
       (3679, 'steam:110000108328a4c', 'pizza', 0),
       (3680, 'steam:110000108328a4c', 'hat', 0),
       (3681, 'steam:110000108328a4c', 'popsicle', 0),
       (3682, 'steam:110000108328a4c', 'cigarette', 0),
       (3683, 'steam:110000108328a4c', 'burger', 0),
       (3684, 'steam:110000108328a4c', 'candy5', 0),
       (3685, 'steam:110000108328a4c', 'cocacola', 0),
       (3686, 'steam:110000108328a4c', 'fixkit', 0),
       (3687, 'steam:110000108328a4c', 'popsicle3', 0),
       (3688, 'steam:110000108328a4c', 'torpedo', 0),
       (3689, 'steam:110000108328a4c', 'xanax', 0),
       (3690, 'steam:110000108328a4c', 'c4_bank', 0),
       (3691, 'steam:110000108328a4c', 'fanta', 0),
       (3692, 'steam:110000108328a4c', 'slushy', 0),
       (3693, 'steam:110000108328a4c', 'candy', 0),
       (3694, 'steam:110000108328a4c', 'chips', 0),
       (3695, 'steam:110000108328a4c', 'packaged_plank', 0),
       (3696, 'steam:110000108328a4c', 'heartstopper', 0),
       (3697, 'steam:110000108328a4c', 'petrol_raffin', 0),
       (3698, 'steam:110000108328a4c', 'blowtorch', 0),
       (3699, 'steam:110000108328a4c', 'grip', 0),
       (3700, 'steam:110000108328a4c', 'firstaid', 0),
       (3701, 'steam:110000108328a4c', 'coupon2', 0),
       (3702, 'steam:110000108328a4c', 'bleeder', 0),
       (3703, 'steam:110000108328a4c', 'soup2', 0),
       (3704, 'steam:110000108328a4c', 'bandage', 0),
       (3705, 'steam:110000108328a4c', 'alive_chicken', 0),
       (3706, 'steam:110000108328a4c', 'slaughtered_chicken', 0),
       (3707, 'steam:110000108328a4c', 'petrol', 0),
       (3708, 'steam:110000108328a4c', 'pastacarbonara', 0),
       (3709, 'steam:110000108328a4c', 'gauze', 0),
       (3710, 'steam:110000108328a4c', 'raisin', 0),
       (3711, 'steam:110000108328a4c', 'cigarette2', 0),
       (3712, 'steam:110000108328a4c', 'metal', 0),
       (3713, 'steam:110000108328a4c', 'water', 20),
       (3714, 'steam:110000108328a4c', 'wool', 0),
       (3715, 'steam:110000108328a4c', 'blowpipe', 0),
       (3716, 'steam:110000108328a4c', 'largecola', 0),
       (3717, 'steam:110000108328a4c', 'washed_stone', 0),
       (3718, 'steam:110000108328a4c', 'pear', 0),
       (3719, 'steam:110000108328a4c', 'chips2', 0),
       (3720, 'steam:110000108328a4c', 'cannabis', 0),
       (3721, 'steam:110000108328a4c', 'saffron', 0),
       (3722, 'steam:110000108328a4c', 'medkit', 0),
       (3723, 'steam:110000108328a4c', 'fish', 0),
       (3724, 'steam:110000108328a4c', 'patches', 0),
       (3725, 'steam:110000108328a4c', 'marabou', 0),
       (3726, 'steam:110000108328a4c', 'hotsauce', 0),
       (3727, 'steam:110000108328a4c', 'donut', 0),
       (3728, 'steam:110000108328a4c', 'speaker', 0),
       (3729, 'steam:110000108328a4c', 'coupon3', 0),
       (3730, 'steam:110000108328a4c', 'popsicle5', 0),
       (3731, 'steam:110000108328a4c', 'gazbottle', 0),
       (3732, 'steam:110000108328a4c', 'clothe', 0),
       (3733, 'steam:110000108328a4c', 'carotool', 0),
       (3734, 'steam:110000108328a4c', 'lockpick', 0),
       (3735, 'steam:110000108328a4c', 'acetone', 0),
       (3736, 'steam:110000108328a4c', 'wood', 0),
       (3737, 'steam:110000108328a4c', 'moneyshot', 0),
       (3738, 'steam:110000108328a4c', 'cigarette5', 0),
       (3739, 'steam:110000108328a4c', 'gold', 0),
       (3740, 'steam:110000108328a4c', 'soup', 0),
       (3741, 'steam:110000108328a4c', 'lighter', 0),
       (3742, 'steam:110000108328a4c', 'vine', 0),
       (3743, 'steam:110000108328a4c', 'book', 0),
       (3744, 'steam:110000108328a4c', 'vicodin', 0),
       (3745, 'steam:110000108328a4c', 'yusuf', 0),
       (3746, 'steam:110000108328a4c', 'lotteryticket', 0),
       (3747, 'steam:110000108328a4c', 'jewels', 0),
       (3748, 'steam:110000108328a4c', 'fishstix', 0),
       (3749, 'steam:110000108328a4c', 'maxpads', 0),
       (3750, 'steam:110000108328a4c', 'meatfree', 0),
       (3751, 'steam:110000108328a4c', 'fixtool', 0),
       (3752, 'steam:110000108328a4c', 'toothpaste', 0),
       (3753, 'steam:110000108328a4c', 'crappy', 0),
       (3754, 'steam:110000108328a4c', 'flashlight', 0),
       (3755, 'steam:110000108328a4c', 'silencieux', 0),
       (3756, 'steam:110000108328a4c', 'copper', 0),
       (3757, 'steam:110000108328a4c', 'cocaine', 0),
       (3758, 'steam:110000108328a4c', 'slushy2', 0),
       (3759, 'steam:110000108328a4c', 'packaged_chicken', 0),
       (3760, 'steam:110000108328a4c', 'pineapple', 0),
       (3761, 'steam:110000108328a4c', 'cigarette6', 0),
       (3762, 'steam:110000108328a4c', 'lithium', 0),
       (3763, 'steam:110000108328a4c', 'milk', 0),
       (3764, 'steam:110000108328a4c', 'essence', 0),
       (3765, 'steam:110000108328a4c', 'popsicle4', 0),
       (3766, 'steam:110000108328a4c', 'shirt', 0),
       (3767, 'steam:110000108328a4c', 'raspberry', 0),
       (3768, 'steam:110000108328a4c', 'grand_cru', 0),
       (3769, 'steam:110000108328a4c', 'shoes', 0),
       (3770, 'steam:110000108328a4c', 'cigarette4', 0),
       (3771, 'steam:110000108328a4c', 'bleach', 0),
       (3772, 'steam:110000108328a4c', 'popsicle2', 0),
       (3773, 'steam:110000108328a4c', 'largesprunk', 0),
       (3774, 'steam:110000108328a4c', 'egg', 0),
       (3775, 'steam:110000108328a4c', 'carokit', 0),
       (3776, 'steam:110000108328a4c', 'cocaleaf', 0),
       (3777, 'steam:110000108328a4c', 'bread', 0),
       (3778, 'steam:110000108328a4c', 'diamond', 0),
       (3779, 'steam:110000108328a4c', 'marijuana', 0),
       (3780, 'steam:110000108328a4c', 'cereal', 0),
       (3781, 'steam:110000108328a4c', 'candy2', 0),
       (3782, 'steam:110000108328a4c', 'noodles', 0),
       (3783, 'steam:110000108328a4c', 'pants', 0),
       (3784, 'steam:110000108328a4c', 'coupon', 0),
       (3785, 'steam:110000108328a4c', 'cigarette3', 0),
       (3786, 'steam:110000108328a4c', 'medikit', 0),
       (3787, 'steam:110000108328a4c', 'coupon4', 0),
       (3788, 'steam:110000108328a4c', 'jus_raisin', 0),
       (3789, 'steam:110000108328a4c', 'iron', 0),
       (3790, 'steam:110000105063f4d', 'egg', 0),
       (3791, 'steam:110000105063f4d', 'xanax', 0),
       (3792, 'steam:110000105063f4d', 'lighter', 0),
       (3793, 'steam:110000105063f4d', 'meatfree', 0),
       (3794, 'steam:110000105063f4d', 'shirt', 0),
       (3795, 'steam:110000105063f4d', 'coupon4', 0),
       (3796, 'steam:110000105063f4d', 'firstaid', 0),
       (3797, 'steam:110000105063f4d', 'saffron', 0),
       (3798, 'steam:110000105063f4d', 'pear', 0),
       (3799, 'steam:110000105063f4d', 'soup', 0),
       (3800, 'steam:110000105063f4d', 'vicodin', 0),
       (3801, 'steam:110000105063f4d', 'essence', 0),
       (3802, 'steam:110000105063f4d', 'cigarette6', 0),
       (3803, 'steam:110000105063f4d', 'cocaleaf', 0),
       (3804, 'steam:110000105063f4d', 'candy4', 0),
       (3805, 'steam:110000105063f4d', 'candy2', 0),
       (3806, 'steam:110000105063f4d', 'burger', 0),
       (3807, 'steam:110000105063f4d', 'noodles2', 0),
       (3808, 'steam:110000105063f4d', 'lotteryticket', 0),
       (3809, 'steam:110000105063f4d', 'cutted_wood', 0),
       (3810, 'steam:110000105063f4d', 'slushy2', 0),
       (3811, 'steam:110000105063f4d', 'loka', 0),
       (3812, 'steam:110000105063f4d', 'vine', 0),
       (3813, 'steam:110000105063f4d', 'chips', 0),
       (3814, 'steam:110000105063f4d', 'book', 0),
       (3815, 'steam:110000105063f4d', 'chips2', 0),
       (3816, 'steam:110000105063f4d', 'carotool', 0),
       (3817, 'steam:110000105063f4d', 'laptop', 0),
       (3818, 'steam:110000105063f4d', 'blowpipe', 0),
       (3819, 'steam:110000105063f4d', 'cocaine', 0),
       (3820, 'steam:110000105063f4d', 'macka', 0),
       (3821, 'steam:110000105063f4d', 'marijuana', 0),
       (3822, 'steam:110000105063f4d', 'popsicle', 0),
       (3823, 'steam:110000105063f4d', 'raisin', 0),
       (3824, 'steam:110000105063f4d', 'wood', 0),
       (3825, 'steam:110000105063f4d', 'popsicle5', 0),
       (3826, 'steam:110000105063f4d', 'slushy', 0),
       (3827, 'steam:110000105063f4d', 'apple', 0),
       (3828, 'steam:110000105063f4d', 'diamond', 0),
       (3829, 'steam:110000105063f4d', 'popsicle2', 0),
       (3830, 'steam:110000105063f4d', 'jus_raisin', 0),
       (3831, 'steam:110000105063f4d', 'clothe', 0),
       (3832, 'steam:110000105063f4d', 'maxpads', 0),
       (3833, 'steam:110000105063f4d', 'grip', 0),
       (3834, 'steam:110000105063f4d', 'donut', 0),
       (3835, 'steam:110000105063f4d', 'cigarette2', 0),
       (3836, 'steam:110000105063f4d', 'bleeder', 0),
       (3837, 'steam:110000105063f4d', 'coupon', 0),
       (3838, 'steam:110000105063f4d', 'c4_bank', 0),
       (3839, 'steam:110000105063f4d', 'popsicle4', 0),
       (3840, 'steam:110000105063f4d', 'speaker', 0),
       (3841, 'steam:110000105063f4d', 'candy3', 0),
       (3842, 'steam:110000105063f4d', 'heartstopper', 0),
       (3843, 'steam:110000105063f4d', 'fishstix', 0),
       (3844, 'steam:110000105063f4d', 'packaged_plank', 0),
       (3845, 'steam:110000105063f4d', 'lockpick', 0),
       (3846, 'steam:110000105063f4d', 'copper', 0),
       (3847, 'steam:110000105063f4d', 'morphine', 0),
       (3848, 'steam:110000105063f4d', 'iron', 0),
       (3849, 'steam:110000105063f4d', 'fixtool', 0),
       (3850, 'steam:110000105063f4d', 'fixkit', 0),
       (3851, 'steam:110000105063f4d', 'petrol', 0),
       (3852, 'steam:110000105063f4d', 'cigarette5', 0),
       (3853, 'steam:110000105063f4d', 'cereal', 0),
       (3854, 'steam:110000105063f4d', 'pineapple', 0),
       (3855, 'steam:110000105063f4d', 'gauze', 1),
       (3856, 'steam:110000105063f4d', 'banana', 0),
       (3857, 'steam:110000105063f4d', 'medkit', 0),
       (3858, 'steam:110000105063f4d', 'milk', 0),
       (3859, 'steam:110000105063f4d', 'medikit', 1),
       (3860, 'steam:110000105063f4d', 'lithium', 0),
       (3861, 'steam:110000105063f4d', 'cheesebows', 0),
       (3862, 'steam:110000105063f4d', 'candy', 0),
       (3863, 'steam:110000105063f4d', 'gold', 0),
       (3864, 'steam:110000105063f4d', 'patches', 0),
       (3865, 'steam:110000105063f4d', 'largecola', 0),
       (3866, 'steam:110000105063f4d', 'hydrocodone', 0),
       (3867, 'steam:110000105063f4d', 'grand_cru', 0),
       (3868, 'steam:110000105063f4d', 'gazbottle', 0),
       (3869, 'steam:110000105063f4d', 'fries', 0),
       (3870, 'steam:110000105063f4d', 'hotsauce', 0),
       (3871, 'steam:110000105063f4d', 'crappy', 0),
       (3872, 'steam:110000105063f4d', 'bleach', 0),
       (3873, 'steam:110000105063f4d', 'metal', 0),
       (3874, 'steam:110000105063f4d', 'stone', 0),
       (3875, 'steam:110000105063f4d', 'soup2', 0),
       (3876, 'steam:110000105063f4d', 'jewels', 0),
       (3877, 'steam:110000105063f4d', 'slaughtered_chicken', 0),
       (3878, 'steam:110000105063f4d', 'orange', 0),
       (3879, 'steam:110000105063f4d', 'wool', 0),
       (3880, 'steam:110000105063f4d', 'noodles', 0),
       (3881, 'steam:110000105063f4d', 'washed_stone', 0),
       (3882, 'steam:110000105063f4d', 'cigarette3', 0),
       (3883, 'steam:110000105063f4d', 'bandage', 0),
       (3884, 'steam:110000105063f4d', 'sprite2', 0),
       (3885, 'steam:110000105063f4d', 'torpedo', 0),
       (3886, 'steam:110000105063f4d', 'toothpaste', 0),
       (3887, 'steam:110000105063f4d', 'alive_chicken', 0),
       (3888, 'steam:110000105063f4d', 'sprite', 0),
       (3889, 'steam:110000105063f4d', 'pizza', 0),
       (3890, 'steam:110000105063f4d', 'marabou', 0),
       (3891, 'steam:110000105063f4d', 'pastacarbonara', 0),
       (3892, 'steam:110000105063f4d', 'yusuf', 0),
       (3893, 'steam:110000105063f4d', 'silencieux', 0),
       (3894, 'steam:110000105063f4d', 'flashlight', 0),
       (3895, 'steam:110000105063f4d', 'blowtorch', 0),
       (3896, 'steam:110000105063f4d', 'shoes', 0),
       (3897, 'steam:110000105063f4d', 'pants', 0),
       (3898, 'steam:110000105063f4d', 'coke_pooch', 0),
       (3899, 'steam:110000105063f4d', 'petrol_raffin', 0),
       (3900, 'steam:110000105063f4d', 'carokit', 0),
       (3901, 'steam:110000105063f4d', 'hat', 0),
       (3902, 'steam:110000105063f4d', 'raspberry', 0),
       (3903, 'steam:110000105063f4d', 'water', 0),
       (3904, 'steam:110000105063f4d', 'chips3', 0),
       (3905, 'steam:110000105063f4d', 'popsicle3', 0),
       (3906, 'steam:110000105063f4d', 'meth', 0),
       (3907, 'steam:110000105063f4d', 'fanta', 0),
       (3908, 'steam:110000105063f4d', 'coupon3', 0),
       (3909, 'steam:110000105063f4d', 'cocacola', 0),
       (3910, 'steam:110000105063f4d', 'bread', 0),
       (3911, 'steam:110000105063f4d', 'cigarette4', 0),
       (3912, 'steam:110000105063f4d', 'acetone', 0),
       (3913, 'steam:110000105063f4d', 'methlab', 0),
       (3914, 'steam:110000105063f4d', 'cannabis', 0),
       (3915, 'steam:110000105063f4d', 'moneyshot', 0),
       (3916, 'steam:110000105063f4d', 'largesprunk', 0),
       (3917, 'steam:110000105063f4d', 'packaged_chicken', 0),
       (3918, 'steam:110000105063f4d', 'fabric', 0),
       (3919, 'steam:110000105063f4d', 'coupon2', 0),
       (3920, 'steam:110000105063f4d', 'candy5', 0),
       (3921, 'steam:110000105063f4d', 'fish', 0),
       (3922, 'steam:110000105063f4d', 'cigarette', 0),
       (3923, 'Char2:110000108328a4c', 'noodles', 0),
       (3924, 'Char2:110000108328a4c', 'diamond', 0),
       (3925, 'Char2:110000108328a4c', 'stone', 0),
       (3926, 'Char2:110000108328a4c', 'grip', 0),
       (3927, 'Char2:110000108328a4c', 'cannabis', 0),
       (3928, 'Char2:110000108328a4c', 'morphine', 0),
       (3929, 'Char2:110000108328a4c', 'methlab', 0),
       (3930, 'Char2:110000108328a4c', 'popsicle3', 0),
       (3931, 'Char2:110000108328a4c', 'donut', 0),
       (3932, 'Char2:110000108328a4c', 'gold', 0),
       (3933, 'Char2:110000108328a4c', 'slushy2', 0),
       (3934, 'Char2:110000108328a4c', 'lithium', 0),
       (3935, 'Char2:110000108328a4c', 'blowpipe', 0),
       (3936, 'Char2:110000108328a4c', 'book', 0),
       (3937, 'Char2:110000108328a4c', 'orange', 0),
       (3938, 'Char2:110000108328a4c', 'moneyshot', 0),
       (3939, 'Char2:110000108328a4c', 'vine', 0),
       (3940, 'Char2:110000108328a4c', 'gazbottle', 0),
       (3941, 'Char2:110000108328a4c', 'packaged_plank', 0),
       (3942, 'Char2:110000108328a4c', 'apple', 5),
       (3943, 'Char2:110000108328a4c', 'essence', 0),
       (3944, 'Char2:110000108328a4c', 'popsicle2', 0),
       (3945, 'Char2:110000108328a4c', 'cigarette4', 0),
       (3946, 'Char2:110000108328a4c', 'coupon3', 0),
       (3947, 'Char2:110000108328a4c', 'toothpaste', 0),
       (3948, 'Char2:110000108328a4c', 'speaker', 0),
       (3949, 'Char2:110000108328a4c', 'fixkit', 0),
       (3950, 'Char2:110000108328a4c', 'alive_chicken', 0),
       (3951, 'Char2:110000108328a4c', 'raisin', 0),
       (3952, 'Char2:110000108328a4c', 'medikit', 0),
       (3953, 'Char2:110000108328a4c', 'blowtorch', 0),
       (3954, 'Char2:110000108328a4c', 'chips3', 0),
       (3955, 'Char2:110000108328a4c', 'cereal', 0),
       (3956, 'Char2:110000108328a4c', 'candy3', 0),
       (3957, 'Char2:110000108328a4c', 'fanta', 0),
       (3958, 'Char2:110000108328a4c', 'lockpick', 0),
       (3959, 'Char2:110000108328a4c', 'marabou', 0),
       (3960, 'Char2:110000108328a4c', 'hydrocodone', 0),
       (3961, 'Char2:110000108328a4c', 'coupon', 0),
       (3962, 'Char2:110000108328a4c', 'loka', 0),
       (3963, 'Char2:110000108328a4c', 'candy', 0),
       (3964, 'Char2:110000108328a4c', 'washed_stone', 0),
       (3965, 'Char2:110000108328a4c', 'chips', 3),
       (3966, 'Char2:110000108328a4c', 'grand_cru', 0),
       (3967, 'Char2:110000108328a4c', 'egg', 0),
       (3968, 'Char2:110000108328a4c', 'gauze', 0),
       (3969, 'Char2:110000108328a4c', 'coupon4', 0),
       (3970, 'Char2:110000108328a4c', 'firstaid', 0),
       (3971, 'Char2:110000108328a4c', 'copper', 0),
       (3972, 'Char2:110000108328a4c', 'slushy', 0),
       (3973, 'Char2:110000108328a4c', 'meth', 0),
       (3974, 'Char2:110000108328a4c', 'pants', 0),
       (3975, 'Char2:110000108328a4c', 'popsicle4', 0),
       (3976, 'Char2:110000108328a4c', 'cutted_wood', 0),
       (3977, 'Char2:110000108328a4c', 'silencieux', 0),
       (3978, 'Char2:110000108328a4c', 'jus_raisin', 0),
       (3979, 'Char2:110000108328a4c', 'chips2', 5),
       (3980, 'Char2:110000108328a4c', 'cigarette2', 0),
       (3981, 'Char2:110000108328a4c', 'lighter', 0),
       (3982, 'Char2:110000108328a4c', 'laptop', 0),
       (3983, 'Char2:110000108328a4c', 'shoes', 0),
       (3984, 'Char2:110000108328a4c', 'yusuf', 0),
       (3985, 'Char2:110000108328a4c', 'acetone', 0),
       (3986, 'Char2:110000108328a4c', 'cocacola', 0),
       (3987, 'Char2:110000108328a4c', 'shirt', 0),
       (3988, 'Char2:110000108328a4c', 'cigarette5', 0),
       (3989, 'Char2:110000108328a4c', 'soup2', 0),
       (3990, 'Char2:110000108328a4c', 'bandage', 0),
       (3991, 'Char2:110000108328a4c', 'bleach', 0),
       (3992, 'Char2:110000108328a4c', 'noodles2', 0),
       (3993, 'Char2:110000108328a4c', 'jewels', 0),
       (3994, 'Char2:110000108328a4c', 'fries', 0),
       (3995, 'Char2:110000108328a4c', 'raspberry', 0),
       (3996, 'Char2:110000108328a4c', 'cigarette3', 0),
       (3997, 'Char2:110000108328a4c', 'candy2', 0),
       (3998, 'Char2:110000108328a4c', 'pizza', 0),
       (3999, 'Char2:110000108328a4c', 'carotool', 0),
       (4000, 'Char2:110000108328a4c', 'coke_pooch', 0),
       (4001, 'Char2:110000108328a4c', 'metal', 0),
       (4002, 'Char2:110000108328a4c', 'wool', 0),
       (4003, 'Char2:110000108328a4c', 'xanax', 0),
       (4004, 'Char2:110000108328a4c', 'largecola', 0),
       (4005, 'Char2:110000108328a4c', 'milk', 0),
       (4006, 'Char2:110000108328a4c', 'wood', 0),
       (4007, 'Char2:110000108328a4c', 'soup', 0),
       (4008, 'Char2:110000108328a4c', 'water', 3),
       (4009, 'Char2:110000108328a4c', 'carokit', 0),
       (4010, 'Char2:110000108328a4c', 'banana', 0),
       (4011, 'Char2:110000108328a4c', 'vicodin', 0),
       (4012, 'Char2:110000108328a4c', 'bleeder', 0),
       (4013, 'Char2:110000108328a4c', 'torpedo', 0),
       (4014, 'Char2:110000108328a4c', 'slaughtered_chicken', 0),
       (4015, 'Char2:110000108328a4c', 'sprite2', 0),
       (4016, 'Char2:110000108328a4c', 'sprite', 0),
       (4017, 'Char2:110000108328a4c', 'cheesebows', 0),
       (4018, 'Char2:110000108328a4c', 'fabric', 0),
       (4019, 'Char2:110000108328a4c', 'packaged_chicken', 0),
       (4020, 'Char2:110000108328a4c', 'marijuana', 0),
       (4021, 'Char2:110000108328a4c', 'cocaleaf', 0),
       (4022, 'Char2:110000108328a4c', 'burger', 0),
       (4023, 'Char2:110000108328a4c', 'maxpads', 0),
       (4024, 'Char2:110000108328a4c', 'candy5', 0),
       (4025, 'Char2:110000108328a4c', 'pineapple', 0),
       (4026, 'Char2:110000108328a4c', 'pear', 0),
       (4027, 'Char2:110000108328a4c', 'iron', 0),
       (4028, 'Char2:110000108328a4c', 'donut2', 0),
       (4029, 'Char2:110000108328a4c', 'macka', 0),
       (4030, 'Char2:110000108328a4c', 'cigarette', 0),
       (4031, 'Char2:110000108328a4c', 'meatfree', 0),
       (4032, 'Char2:110000108328a4c', 'cigarette6', 0),
       (4033, 'Char2:110000108328a4c', 'heartstopper', 0),
       (4034, 'Char2:110000108328a4c', 'popsicle5', 0),
       (4035, 'Char2:110000108328a4c', 'cocaine', 0),
       (4036, 'Char2:110000108328a4c', 'saffron', 0),
       (4037, 'Char2:110000108328a4c', 'petrol_raffin', 0),
       (4038, 'Char2:110000108328a4c', 'popsicle', 0),
       (4039, 'Char2:110000108328a4c', 'crappy', 0),
       (4040, 'Char2:110000108328a4c', 'candy4', 0),
       (4041, 'Char2:110000108328a4c', 'fish', 0),
       (4042, 'Char2:110000108328a4c', 'coupon2', 0),
       (4043, 'Char2:110000108328a4c', 'c4_bank', 5),
       (4044, 'Char2:110000108328a4c', 'flashlight', 0),
       (4045, 'Char2:110000108328a4c', 'pastacarbonara', 0),
       (4046, 'Char2:110000108328a4c', 'petrol', 0),
       (4047, 'Char2:110000108328a4c', 'lotteryticket', 0),
       (4048, 'Char2:110000108328a4c', 'clothe', 0),
       (4049, 'Char2:110000108328a4c', 'largesprunk', 0),
       (4050, 'Char2:110000108328a4c', 'medkit', 0),
       (4051, 'Char2:110000108328a4c', 'hat', 0),
       (4052, 'Char2:110000108328a4c', 'fishstix', 0),
       (4053, 'Char2:110000108328a4c', 'patches', 0),
       (4054, 'Char2:110000108328a4c', 'fixtool', 0),
       (4055, 'Char2:110000108328a4c', 'hotsauce', 0),
       (4056, 'Char2:110000108328a4c', 'bread', 0),
       (4057, 'steam:110000108328a4c', 'donut2', 0),
       (4058, 'steam:11000010079e29a', 'donut2', 0),
       (4059, 'steam:110000104e3efcd', 'donut2', 0),
       (4060, 'steam:110000105b0d643', 'blowpipe', 0),
       (4061, 'steam:110000105b0d643', 'moneyshot', 0),
       (4062, 'steam:110000105b0d643', 'medkit', 4),
       (4063, 'steam:110000105b0d643', 'maxpads', 0),
       (4064, 'steam:110000105b0d643', 'candy4', 0),
       (4065, 'steam:110000105b0d643', 'candy5', 0),
       (4066, 'steam:110000105b0d643', 'laptop', 0),
       (4067, 'steam:110000105b0d643', 'book', 0),
       (4068, 'steam:110000105b0d643', 'iron', 0),
       (4069, 'steam:110000105b0d643', 'popsicle2', 0),
       (4070, 'steam:110000105b0d643', 'morphine', 0),
       (4071, 'steam:110000105b0d643', 'cereal', 0),
       (4072, 'steam:110000105b0d643', 'lighter', 0),
       (4073, 'steam:110000105b0d643', 'acetone', 0),
       (4074, 'steam:110000105b0d643', 'alive_chicken', 0),
       (4075, 'steam:110000105b0d643', 'apple', 0),
       (4076, 'steam:110000105b0d643', 'popsicle4', 0),
       (4077, 'steam:110000105b0d643', 'water', 990),
       (4078, 'steam:110000105b0d643', 'marijuana', 0),
       (4079, 'steam:110000105b0d643', 'bread', 993),
       (4080, 'steam:110000105b0d643', 'saffron', 0),
       (4081, 'steam:110000105b0d643', 'raisin', 0),
       (4082, 'steam:110000105b0d643', 'essence', 0),
       (4083, 'steam:110000105b0d643', 'cigarette5', 0),
       (4084, 'steam:110000105b0d643', 'gauze', 0),
       (4085, 'steam:110000105b0d643', 'pants', 0),
       (4086, 'steam:110000105b0d643', 'egg', 0),
       (4087, 'steam:110000105b0d643', 'petrol', 0),
       (4088, 'steam:110000105b0d643', 'packaged_plank', 0),
       (4089, 'steam:110000105b0d643', 'vicodin', 0),
       (4090, 'steam:110000105b0d643', 'slaughtered_chicken', 0),
       (4091, 'steam:110000105b0d643', 'meatfree', 0),
       (4092, 'steam:110000105b0d643', 'cigarette', 0),
       (4093, 'steam:110000105b0d643', 'burger', 0),
       (4094, 'steam:110000105b0d643', 'jewels', 0),
       (4095, 'steam:110000105b0d643', 'cocaine', 0),
       (4096, 'steam:110000105b0d643', 'crappy', 0),
       (4097, 'steam:110000105b0d643', 'cigarette6', 0),
       (4098, 'steam:110000105b0d643', 'noodles2', 0),
       (4099, 'steam:110000105b0d643', 'vine', 0),
       (4100, 'steam:110000105b0d643', 'milk', 0),
       (4101, 'steam:110000105b0d643', 'lockpick', 0),
       (4102, 'steam:110000105b0d643', 'bleeder', 0),
       (4103, 'steam:110000105b0d643', 'soup', 0),
       (4104, 'steam:110000105b0d643', 'toothpaste', 0),
       (4105, 'steam:110000105b0d643', 'patches', 0),
       (4106, 'steam:110000105b0d643', 'speaker', 0),
       (4107, 'steam:110000105b0d643', 'cigarette4', 0),
       (4108, 'steam:110000105b0d643', 'popsicle', 0),
       (4109, 'steam:110000105b0d643', 'coupon', 0),
       (4110, 'steam:110000105b0d643', 'candy3', 0),
       (4111, 'steam:110000105b0d643', 'bleach', 0),
       (4112, 'steam:110000105b0d643', 'firstaid', 0),
       (4113, 'steam:110000105b0d643', 'xanax', 0),
       (4114, 'steam:110000105b0d643', 'fixtool', 0),
       (4115, 'steam:110000105b0d643', 'popsicle5', 0),
       (4116, 'steam:110000105b0d643', 'chips', 0),
       (4117, 'steam:110000105b0d643', 'loka', 0),
       (4118, 'steam:110000105b0d643', 'largecola', 0),
       (4119, 'steam:110000105b0d643', 'lithium', 0),
       (4120, 'steam:110000105b0d643', 'noodles', 0),
       (4121, 'steam:110000105b0d643', 'raspberry', 0),
       (4122, 'steam:110000105b0d643', 'pastacarbonara', 0),
       (4123, 'steam:110000105b0d643', 'hydrocodone', 0),
       (4124, 'steam:110000105b0d643', 'medikit', 0),
       (4125, 'steam:110000105b0d643', 'grand_cru', 0),
       (4126, 'steam:110000105b0d643', 'hat', 0),
       (4127, 'steam:110000105b0d643', 'coke_pooch', 0),
       (4128, 'steam:110000105b0d643', 'fabric', 0),
       (4129, 'steam:110000105b0d643', 'carotool', 0),
       (4130, 'steam:110000105b0d643', 'fish', 0),
       (4131, 'steam:110000105b0d643', 'blowtorch', 0),
       (4132, 'steam:110000105b0d643', 'sprite2', 0),
       (4133, 'steam:110000105b0d643', 'diamond', 0),
       (4134, 'steam:110000105b0d643', 'packaged_chicken', 0),
       (4135, 'steam:110000105b0d643', 'banana', 0),
       (4136, 'steam:110000105b0d643', 'yusuf', 0),
       (4137, 'steam:110000105b0d643', 'heartstopper', 0),
       (4138, 'steam:110000105b0d643', 'meth', 0),
       (4139, 'steam:110000105b0d643', 'clothe', 0),
       (4140, 'steam:110000105b0d643', 'pear', 0),
       (4141, 'steam:110000105b0d643', 'washed_stone', 0),
       (4142, 'steam:110000105b0d643', 'fries', 0),
       (4143, 'steam:110000105b0d643', 'wool', 0),
       (4144, 'steam:110000105b0d643', 'wood', 0),
       (4145, 'steam:110000105b0d643', 'pineapple', 0),
       (4146, 'steam:110000105b0d643', 'macka', 0),
       (4147, 'steam:110000105b0d643', 'coupon3', 0),
       (4148, 'steam:110000105b0d643', 'torpedo', 0),
       (4149, 'steam:110000105b0d643', 'fixkit', 0),
       (4150, 'steam:110000105b0d643', 'stone', 0),
       (4151, 'steam:110000105b0d643', 'silencieux', 0),
       (4152, 'steam:110000105b0d643', 'pizza', 0),
       (4153, 'steam:110000105b0d643', 'methlab', 0),
       (4154, 'steam:110000105b0d643', 'candy2', 0),
       (4155, 'steam:110000105b0d643', 'marabou', 0),
       (4156, 'steam:110000105b0d643', 'cigarette2', 0),
       (4157, 'steam:110000105b0d643', 'sprite', 0),
       (4158, 'steam:110000105b0d643', 'bandage', 0),
       (4159, 'steam:110000105b0d643', 'copper', 0),
       (4160, 'steam:110000105b0d643', 'gold', 0),
       (4161, 'steam:110000105b0d643', 'soup2', 0),
       (4162, 'steam:110000105b0d643', 'largesprunk', 0),
       (4163, 'steam:110000105b0d643', 'donut', 0),
       (4164, 'steam:110000105b0d643', 'flashlight', 0),
       (4165, 'steam:110000105b0d643', 'fanta', 0),
       (4166, 'steam:110000105b0d643', 'slushy', 0),
       (4167, 'steam:110000105b0d643', 'carokit', 0),
       (4168, 'steam:110000105b0d643', 'metal', 0),
       (4169, 'steam:110000105b0d643', 'slushy2', 0),
       (4170, 'steam:110000105b0d643', 'cannabis', 0),
       (4171, 'steam:110000105b0d643', 'popsicle3', 0),
       (4172, 'steam:110000105b0d643', 'shoes', 0),
       (4173, 'steam:110000105b0d643', 'cheesebows', 0),
       (4174, 'steam:110000105b0d643', 'chips2', 0),
       (4175, 'steam:110000105b0d643', 'petrol_raffin', 0),
       (4176, 'steam:110000105b0d643', 'cocaleaf', 0),
       (4177, 'steam:110000105b0d643', 'orange', 0),
       (4178, 'steam:110000105b0d643', 'donut2', 0),
       (4179, 'steam:110000105b0d643', 'fishstix', 0),
       (4180, 'steam:110000105b0d643', 'shirt', 0),
       (4181, 'steam:110000105b0d643', 'candy', 0),
       (4182, 'steam:110000105b0d643', 'grip', 0),
       (4183, 'steam:110000105b0d643', 'cutted_wood', 0),
       (4184, 'steam:110000105b0d643', 'jus_raisin', 0),
       (4185, 'steam:110000105b0d643', 'gazbottle', 0),
       (4186, 'steam:110000105b0d643', 'lotteryticket', 0),
       (4187, 'steam:110000105b0d643', 'chips3', 0),
       (4188, 'steam:110000105b0d643', 'c4_bank', 0),
       (4189, 'steam:110000105b0d643', 'hotsauce', 0),
       (4190, 'steam:110000105b0d643', 'coupon2', 0),
       (4191, 'steam:110000105b0d643', 'cigarette3', 0),
       (4192, 'steam:110000105b0d643', 'cocacola', 0),
       (4193, 'steam:110000105b0d643', 'coupon4', 0),
       (4194, 'steam:110000106080551', 'moneyshot', 0),
       (4195, 'steam:110000106080551', 'medkit', 0),
       (4196, 'steam:110000106080551', 'maxpads', 0),
       (4197, 'steam:110000106080551', 'blowpipe', 0),
       (4198, 'steam:110000106080551', 'candy4', 0),
       (4199, 'steam:110000106080551', 'candy5', 0),
       (4200, 'steam:110000106080551', 'popsicle2', 0),
       (4201, 'steam:110000106080551', 'book', 0),
       (4202, 'steam:110000106080551', 'iron', 0),
       (4203, 'steam:110000106080551', 'laptop', 0),
       (4204, 'steam:110000106080551', 'lighter', 0),
       (4205, 'steam:110000106080551', 'alive_chicken', 0),
       (4206, 'steam:110000106080551', 'acetone', 0),
       (4207, 'steam:110000106080551', 'morphine', 0),
       (4208, 'steam:110000106080551', 'cereal', 0),
       (4209, 'steam:110000106080551', 'marijuana', 0),
       (4210, 'steam:110000106080551', 'water', 987),
       (4211, 'steam:110000106080551', 'popsicle4', 0),
       (4212, 'steam:110000106080551', 'apple', 0),
       (4213, 'steam:110000106080551', 'bread', 991),
       (4214, 'steam:110000106080551', 'gauze', 0),
       (4215, 'steam:110000106080551', 'cigarette5', 0),
       (4216, 'steam:110000106080551', 'saffron', 0),
       (4217, 'steam:110000106080551', 'essence', 0),
       (4218, 'steam:110000106080551', 'raisin', 0),
       (4219, 'steam:110000106080551', 'vicodin', 0),
       (4220, 'steam:110000106080551', 'pants', 0),
       (4221, 'steam:110000106080551', 'packaged_plank', 0),
       (4222, 'steam:110000106080551', 'egg', 0),
       (4223, 'steam:110000106080551', 'petrol', 0),
       (4224, 'steam:110000106080551', 'jewels', 0),
       (4225, 'steam:110000106080551', 'burger', 0),
       (4226, 'steam:110000106080551', 'meatfree', 0),
       (4227, 'steam:110000106080551', 'slaughtered_chicken', 0),
       (4228, 'steam:110000106080551', 'cigarette', 0),
       (4229, 'steam:110000106080551', 'crappy', 0),
       (4230, 'steam:110000106080551', 'cocaine', 0),
       (4231, 'steam:110000106080551', 'cigarette6', 0),
       (4232, 'steam:110000106080551', 'noodles2', 0),
       (4233, 'steam:110000106080551', 'vine', 0),
       (4234, 'steam:110000106080551', 'milk', 0),
       (4235, 'steam:110000106080551', 'bleeder', 0),
       (4236, 'steam:110000106080551', 'toothpaste', 0),
       (4237, 'steam:110000106080551', 'soup', 0),
       (4238, 'steam:110000106080551', 'lockpick', 0),
       (4239, 'steam:110000106080551', 'speaker', 0),
       (4240, 'steam:110000106080551', 'cigarette4', 0),
       (4241, 'steam:110000106080551', 'popsicle', 0),
       (4242, 'steam:110000106080551', 'coupon', 0),
       (4243, 'steam:110000106080551', 'patches', 0),
       (4244, 'steam:110000106080551', 'candy3', 0),
       (4245, 'steam:110000106080551', 'fixtool', 0),
       (4246, 'steam:110000106080551', 'firstaid', 0),
       (4247, 'steam:110000106080551', 'bleach', 0),
       (4248, 'steam:110000106080551', 'xanax', 0),
       (4249, 'steam:110000106080551', 'lithium', 0),
       (4250, 'steam:110000106080551', 'popsicle5', 0),
       (4251, 'steam:110000106080551', 'chips', 0),
       (4252, 'steam:110000106080551', 'loka', 0),
       (4253, 'steam:110000106080551', 'largecola', 0),
       (4254, 'steam:110000106080551', 'medikit', 0),
       (4255, 'steam:110000106080551', 'raspberry', 0),
       (4256, 'steam:110000106080551', 'pastacarbonara', 0),
       (4257, 'steam:110000106080551', 'hydrocodone', 0),
       (4258, 'steam:110000106080551', 'noodles', 0),
       (4259, 'steam:110000106080551', 'fabric', 0),
       (4260, 'steam:110000106080551', 'grand_cru', 0),
       (4261, 'steam:110000106080551', 'hat', 0),
       (4262, 'steam:110000106080551', 'carotool', 0),
       (4263, 'steam:110000106080551', 'coke_pooch', 0),
       (4264, 'steam:110000106080551', 'sprite2', 0),
       (4265, 'steam:110000106080551', 'blowtorch', 0),
       (4266, 'steam:110000106080551', 'diamond', 0),
       (4267, 'steam:110000106080551', 'packaged_chicken', 0),
       (4268, 'steam:110000106080551', 'fish', 0),
       (4269, 'steam:110000106080551', 'clothe', 0),
       (4270, 'steam:110000106080551', 'meth', 0),
       (4271, 'steam:110000106080551', 'yusuf', 0),
       (4272, 'steam:110000106080551', 'heartstopper', 0),
       (4273, 'steam:110000106080551', 'banana', 0),
       (4274, 'steam:110000106080551', 'wool', 0),
       (4275, 'steam:110000106080551', 'washed_stone', 0),
       (4276, 'steam:110000106080551', 'fries', 0),
       (4277, 'steam:110000106080551', 'wood', 0),
       (4278, 'steam:110000106080551', 'pear', 0),
       (4279, 'steam:110000106080551', 'torpedo', 0),
       (4280, 'steam:110000106080551', 'fixkit', 0),
       (4281, 'steam:110000106080551', 'pineapple', 0),
       (4282, 'steam:110000106080551', 'coupon3', 0),
       (4283, 'steam:110000106080551', 'macka', 0),
       (4284, 'steam:110000106080551', 'stone', 0),
       (4285, 'steam:110000106080551', 'silencieux', 0),
       (4286, 'steam:110000106080551', 'candy2', 0),
       (4287, 'steam:110000106080551', 'pizza', 0),
       (4288, 'steam:110000106080551', 'methlab', 0),
       (4289, 'steam:110000106080551', 'copper', 0),
       (4290, 'steam:110000106080551', 'cigarette2', 0),
       (4291, 'steam:110000106080551', 'marabou', 0),
       (4292, 'steam:110000106080551', 'sprite', 0),
       (4293, 'steam:110000106080551', 'bandage', 0),
       (4294, 'steam:110000106080551', 'gold', 0),
       (4295, 'steam:110000106080551', 'soup2', 0),
       (4296, 'steam:110000106080551', 'largesprunk', 0),
       (4297, 'steam:110000106080551', 'donut', 0),
       (4298, 'steam:110000106080551', 'flashlight', 0),
       (4299, 'steam:110000106080551', 'slushy2', 0),
       (4300, 'steam:110000106080551', 'fanta', 0),
       (4301, 'steam:110000106080551', 'metal', 0),
       (4302, 'steam:110000106080551', 'carokit', 0),
       (4303, 'steam:110000106080551', 'slushy', 0),
       (4304, 'steam:110000106080551', 'cheesebows', 0),
       (4305, 'steam:110000106080551', 'shoes', 0),
       (4306, 'steam:110000106080551', 'popsicle3', 0),
       (4307, 'steam:110000106080551', 'chips2', 0),
       (4308, 'steam:110000106080551', 'cannabis', 0),
       (4309, 'steam:110000106080551', 'petrol_raffin', 0),
       (4310, 'steam:110000106080551', 'orange', 0),
       (4311, 'steam:110000106080551', 'donut2', 0),
       (4312, 'steam:110000106080551', 'cocaleaf', 0),
       (4313, 'steam:110000106080551', 'fishstix', 0),
       (4314, 'steam:110000106080551', 'cutted_wood', 0),
       (4315, 'steam:110000106080551', 'candy', 0),
       (4316, 'steam:110000106080551', 'jus_raisin', 0),
       (4317, 'steam:110000106080551', 'grip', 0),
       (4318, 'steam:110000106080551', 'shirt', 0),
       (4319, 'steam:110000106080551', 'gazbottle', 0),
       (4320, 'steam:110000106080551', 'hotsauce', 0),
       (4321, 'steam:110000106080551', 'chips3', 0),
       (4322, 'steam:110000106080551', 'c4_bank', 0),
       (4323, 'steam:110000106080551', 'lotteryticket', 0),
       (4324, 'steam:110000106080551', 'cocacola', 0),
       (4325, 'steam:110000106080551', 'cigarette3', 0),
       (4326, 'steam:110000106080551', 'coupon2', 0),
       (4327, 'steam:110000106080551', 'coupon4', 0),
       (4328, 'steam:11000010051bf9a', 'medkit', 0),
       (4329, 'steam:11000010051bf9a', 'maxpads', 0),
       (4330, 'steam:11000010051bf9a', 'moneyshot', 0),
       (4331, 'steam:11000010051bf9a', 'candy4', 0),
       (4332, 'steam:11000010051bf9a', 'blowpipe', 0),
       (4333, 'steam:11000010051bf9a', 'candy5', 0),
       (4334, 'steam:11000010051bf9a', 'book', 0),
       (4335, 'steam:11000010051bf9a', 'iron', 0),
       (4336, 'steam:11000010051bf9a', 'laptop', 0),
       (4337, 'steam:11000010051bf9a', 'popsicle2', 0),
       (4338, 'steam:11000010051bf9a', 'cereal', 0),
       (4339, 'steam:11000010051bf9a', 'alive_chicken', 0),
       (4340, 'steam:11000010051bf9a', 'acetone', 0),
       (4341, 'steam:11000010051bf9a', 'lighter', 0),
       (4342, 'steam:11000010051bf9a', 'morphine', 0),
       (4343, 'steam:11000010051bf9a', 'popsicle4', 0),
       (4344, 'steam:11000010051bf9a', 'bread', 0),
       (4345, 'steam:11000010051bf9a', 'apple', 0),
       (4346, 'steam:11000010051bf9a', 'water', 0),
       (4347, 'steam:11000010051bf9a', 'marijuana', 0),
       (4348, 'steam:11000010051bf9a', 'essence', 0),
       (4349, 'steam:11000010051bf9a', 'saffron', 0),
       (4350, 'steam:11000010051bf9a', 'raisin', 0),
       (4351, 'steam:11000010051bf9a', 'cigarette5', 0),
       (4352, 'steam:11000010051bf9a', 'gauze', 0),
       (4353, 'steam:11000010051bf9a', 'egg', 0),
       (4354, 'steam:11000010051bf9a', 'packaged_plank', 0),
       (4355, 'steam:11000010051bf9a', 'petrol', 0),
       (4356, 'steam:11000010051bf9a', 'vicodin', 0),
       (4357, 'steam:11000010051bf9a', 'pants', 0),
       (4358, 'steam:11000010051bf9a', 'meatfree', 0),
       (4359, 'steam:11000010051bf9a', 'burger', 0),
       (4360, 'steam:11000010051bf9a', 'slaughtered_chicken', 0),
       (4361, 'steam:11000010051bf9a', 'cigarette', 0),
       (4362, 'steam:11000010051bf9a', 'jewels', 0),
       (4363, 'steam:11000010051bf9a', 'vine', 0),
       (4364, 'steam:11000010051bf9a', 'cocaine', 0),
       (4365, 'steam:11000010051bf9a', 'cigarette6', 0),
       (4366, 'steam:11000010051bf9a', 'noodles2', 0),
       (4367, 'steam:11000010051bf9a', 'crappy', 0),
       (4368, 'steam:11000010051bf9a', 'bleeder', 0),
       (4369, 'steam:11000010051bf9a', 'toothpaste', 0),
       (4370, 'steam:11000010051bf9a', 'lockpick', 0),
       (4371, 'steam:11000010051bf9a', 'milk', 0),
       (4372, 'steam:11000010051bf9a', 'soup', 0),
       (4373, 'steam:11000010051bf9a', 'patches', 0),
       (4374, 'steam:11000010051bf9a', 'popsicle', 0),
       (4375, 'steam:11000010051bf9a', 'coupon', 0),
       (4376, 'steam:11000010051bf9a', 'speaker', 0),
       (4377, 'steam:11000010051bf9a', 'cigarette4', 0),
       (4378, 'steam:11000010051bf9a', 'candy3', 0),
       (4379, 'steam:11000010051bf9a', 'fixtool', 0),
       (4380, 'steam:11000010051bf9a', 'xanax', 0),
       (4381, 'steam:11000010051bf9a', 'firstaid', 0),
       (4382, 'steam:11000010051bf9a', 'bleach', 0),
       (4383, 'steam:11000010051bf9a', 'loka', 0),
       (4384, 'steam:11000010051bf9a', 'largecola', 0),
       (4385, 'steam:11000010051bf9a', 'popsicle5', 0),
       (4386, 'steam:11000010051bf9a', 'chips', 0),
       (4387, 'steam:11000010051bf9a', 'lithium', 0),
       (4388, 'steam:11000010051bf9a', 'hydrocodone', 0),
       (4389, 'steam:11000010051bf9a', 'pastacarbonara', 0),
       (4390, 'steam:11000010051bf9a', 'noodles', 0),
       (4391, 'steam:11000010051bf9a', 'raspberry', 0),
       (4392, 'steam:11000010051bf9a', 'medikit', 0),
       (4393, 'steam:11000010051bf9a', 'carotool', 0),
       (4394, 'steam:11000010051bf9a', 'grand_cru', 0),
       (4395, 'steam:11000010051bf9a', 'fabric', 0),
       (4396, 'steam:11000010051bf9a', 'coke_pooch', 0),
       (4397, 'steam:11000010051bf9a', 'hat', 0),
       (4398, 'steam:11000010051bf9a', 'fish', 0),
       (4399, 'steam:11000010051bf9a', 'blowtorch', 0),
       (4400, 'steam:11000010051bf9a', 'diamond', 0),
       (4401, 'steam:11000010051bf9a', 'packaged_chicken', 0),
       (4402, 'steam:11000010051bf9a', 'sprite2', 0),
       (4403, 'steam:11000010051bf9a', 'banana', 0),
       (4404, 'steam:11000010051bf9a', 'meth', 0),
       (4405, 'steam:11000010051bf9a', 'clothe', 0),
       (4406, 'steam:11000010051bf9a', 'yusuf', 0),
       (4407, 'steam:11000010051bf9a', 'heartstopper', 0),
       (4408, 'steam:11000010051bf9a', 'pear', 0),
       (4409, 'steam:11000010051bf9a', 'wool', 0),
       (4410, 'steam:11000010051bf9a', 'fries', 0),
       (4411, 'steam:11000010051bf9a', 'wood', 0),
       (4412, 'steam:11000010051bf9a', 'washed_stone', 0),
       (4413, 'steam:11000010051bf9a', 'torpedo', 0),
       (4414, 'steam:11000010051bf9a', 'pineapple', 0),
       (4415, 'steam:11000010051bf9a', 'coupon3', 0),
       (4416, 'steam:11000010051bf9a', 'fixkit', 0),
       (4417, 'steam:11000010051bf9a', 'macka', 0),
       (4418, 'steam:11000010051bf9a', 'pizza', 0),
       (4419, 'steam:11000010051bf9a', 'candy2', 0),
       (4420, 'steam:11000010051bf9a', 'methlab', 0),
       (4421, 'steam:11000010051bf9a', 'silencieux', 0),
       (4422, 'steam:11000010051bf9a', 'stone', 0),
       (4423, 'steam:11000010051bf9a', 'sprite', 0),
       (4424, 'steam:11000010051bf9a', 'cigarette2', 0),
       (4425, 'steam:11000010051bf9a', 'copper', 0),
       (4426, 'steam:11000010051bf9a', 'marabou', 0),
       (4427, 'steam:11000010051bf9a', 'bandage', 0),
       (4428, 'steam:11000010051bf9a', 'soup2', 0),
       (4429, 'steam:11000010051bf9a', 'gold', 0),
       (4430, 'steam:11000010051bf9a', 'flashlight', 0),
       (4431, 'steam:11000010051bf9a', 'largesprunk', 0),
       (4432, 'steam:11000010051bf9a', 'donut', 0),
       (4433, 'steam:11000010051bf9a', 'slushy', 0),
       (4434, 'steam:11000010051bf9a', 'slushy2', 0),
       (4435, 'steam:11000010051bf9a', 'metal', 0),
       (4436, 'steam:11000010051bf9a', 'carokit', 0),
       (4437, 'steam:11000010051bf9a', 'fanta', 0),
       (4438, 'steam:11000010051bf9a', 'shoes', 0),
       (4439, 'steam:11000010051bf9a', 'chips2', 0),
       (4440, 'steam:11000010051bf9a', 'cheesebows', 0),
       (4441, 'steam:11000010051bf9a', 'cannabis', 0),
       (4442, 'steam:11000010051bf9a', 'popsicle3', 0),
       (4443, 'steam:11000010051bf9a', 'orange', 0),
       (4444, 'steam:11000010051bf9a', 'petrol_raffin', 0),
       (4445, 'steam:11000010051bf9a', 'fishstix', 0),
       (4446, 'steam:11000010051bf9a', 'donut2', 0),
       (4447, 'steam:11000010051bf9a', 'cocaleaf', 0),
       (4448, 'steam:11000010051bf9a', 'grip', 0),
       (4449, 'steam:11000010051bf9a', 'shirt', 0),
       (4450, 'steam:11000010051bf9a', 'candy', 0),
       (4451, 'steam:11000010051bf9a', 'jus_raisin', 0),
       (4452, 'steam:11000010051bf9a', 'cutted_wood', 0),
       (4453, 'steam:11000010051bf9a', 'c4_bank', 0),
       (4454, 'steam:11000010051bf9a', 'chips3', 0),
       (4455, 'steam:11000010051bf9a', 'lotteryticket', 0),
       (4456, 'steam:11000010051bf9a', 'gazbottle', 0),
       (4457, 'steam:11000010051bf9a', 'hotsauce', 0),
       (4458, 'steam:11000010051bf9a', 'coupon4', 0),
       (4459, 'steam:11000010051bf9a', 'cocacola', 0),
       (4460, 'steam:11000010051bf9a', 'cigarette3', 0),
       (4461, 'steam:11000010051bf9a', 'coupon2', 0),
       (4462, 'steam:11000010aa8b577', 'maxpads', 0),
       (4463, 'steam:11000010aa8b577', 'blowpipe', 0),
       (4464, 'steam:11000010aa8b577', 'moneyshot', 0),
       (4465, 'steam:11000010aa8b577', 'medkit', 0),
       (4466, 'steam:11000010aa8b577', 'candy4', 0),
       (4467, 'steam:11000010aa8b577', 'laptop', 0),
       (4468, 'steam:11000010aa8b577', 'book', 0),
       (4469, 'steam:11000010aa8b577', 'candy5', 0),
       (4470, 'steam:11000010aa8b577', 'iron', 0),
       (4471, 'steam:11000010aa8b577', 'popsicle2', 0),
       (4472, 'steam:11000010aa8b577', 'lighter', 0),
       (4473, 'steam:11000010aa8b577', 'acetone', 0),
       (4474, 'steam:11000010aa8b577', 'cereal', 0),
       (4475, 'steam:11000010aa8b577', 'alive_chicken', 0),
       (4476, 'steam:11000010aa8b577', 'morphine', 0),
       (4477, 'steam:11000010aa8b577', 'marijuana', 0),
       (4478, 'steam:11000010aa8b577', 'popsicle4', 0),
       (4479, 'steam:11000010aa8b577', 'water', 0),
       (4480, 'steam:11000010aa8b577', 'apple', 0),
       (4481, 'steam:11000010aa8b577', 'bread', 0),
       (4482, 'steam:11000010aa8b577', 'gauze', 0),
       (4483, 'steam:11000010aa8b577', 'raisin', 0),
       (4484, 'steam:11000010aa8b577', 'cigarette5', 0),
       (4485, 'steam:11000010aa8b577', 'saffron', 0),
       (4486, 'steam:11000010aa8b577', 'essence', 0),
       (4487, 'steam:11000010aa8b577', 'pants', 0),
       (4488, 'steam:11000010aa8b577', 'petrol', 0),
       (4489, 'steam:11000010aa8b577', 'packaged_plank', 0),
       (4490, 'steam:11000010aa8b577', 'egg', 0),
       (4491, 'steam:11000010aa8b577', 'vicodin', 0),
       (4492, 'steam:11000010aa8b577', 'jewels', 0),
       (4493, 'steam:11000010aa8b577', 'slaughtered_chicken', 0),
       (4494, 'steam:11000010aa8b577', 'meatfree', 0),
       (4495, 'steam:11000010aa8b577', 'burger', 0),
       (4496, 'steam:11000010aa8b577', 'cigarette', 0),
       (4497, 'steam:11000010aa8b577', 'noodles2', 0),
       (4498, 'steam:11000010aa8b577', 'vine', 0),
       (4499, 'steam:11000010aa8b577', 'crappy', 0),
       (4500, 'steam:11000010aa8b577', 'cocaine', 0),
       (4501, 'steam:11000010aa8b577', 'cigarette6', 0),
       (4502, 'steam:11000010aa8b577', 'bleeder', 0),
       (4503, 'steam:11000010aa8b577', 'toothpaste', 0),
       (4504, 'steam:11000010aa8b577', 'soup', 0),
       (4505, 'steam:11000010aa8b577', 'milk', 0),
       (4506, 'steam:11000010aa8b577', 'lockpick', 0),
       (4507, 'steam:11000010aa8b577', 'coupon', 0),
       (4508, 'steam:11000010aa8b577', 'cigarette4', 0),
       (4509, 'steam:11000010aa8b577', 'popsicle', 0),
       (4510, 'steam:11000010aa8b577', 'speaker', 0),
       (4511, 'steam:11000010aa8b577', 'patches', 0),
       (4512, 'steam:11000010aa8b577', 'firstaid', 0),
       (4513, 'steam:11000010aa8b577', 'bleach', 0),
       (4514, 'steam:11000010aa8b577', 'fixtool', 0),
       (4515, 'steam:11000010aa8b577', 'xanax', 0),
       (4516, 'steam:11000010aa8b577', 'candy3', 0),
       (4517, 'steam:11000010aa8b577', 'loka', 0),
       (4518, 'steam:11000010aa8b577', 'popsicle5', 0),
       (4519, 'steam:11000010aa8b577', 'lithium', 0),
       (4520, 'steam:11000010aa8b577', 'largecola', 0),
       (4521, 'steam:11000010aa8b577', 'chips', 0),
       (4522, 'steam:11000010aa8b577', 'pastacarbonara', 0),
       (4523, 'steam:11000010aa8b577', 'medikit', 0),
       (4524, 'steam:11000010aa8b577', 'noodles', 0),
       (4525, 'steam:11000010aa8b577', 'hydrocodone', 0),
       (4526, 'steam:11000010aa8b577', 'raspberry', 0),
       (4527, 'steam:11000010aa8b577', 'coke_pooch', 0),
       (4528, 'steam:11000010aa8b577', 'carotool', 0),
       (4529, 'steam:11000010aa8b577', 'grand_cru', 0),
       (4530, 'steam:11000010aa8b577', 'hat', 0),
       (4531, 'steam:11000010aa8b577', 'fabric', 0),
       (4532, 'steam:11000010aa8b577', 'sprite2', 0),
       (4533, 'steam:11000010aa8b577', 'fish', 0),
       (4534, 'steam:11000010aa8b577', 'blowtorch', 0),
       (4535, 'steam:11000010aa8b577', 'diamond', 0),
       (4536, 'steam:11000010aa8b577', 'packaged_chicken', 0),
       (4537, 'steam:11000010aa8b577', 'banana', 0),
       (4538, 'steam:11000010aa8b577', 'yusuf', 0),
       (4539, 'steam:11000010aa8b577', 'meth', 0),
       (4540, 'steam:11000010aa8b577', 'clothe', 0),
       (4541, 'steam:11000010aa8b577', 'heartstopper', 0),
       (4542, 'steam:11000010aa8b577', 'pear', 0),
       (4543, 'steam:11000010aa8b577', 'wood', 0),
       (4544, 'steam:11000010aa8b577', 'washed_stone', 0),
       (4545, 'steam:11000010aa8b577', 'wool', 0),
       (4546, 'steam:11000010aa8b577', 'fries', 0),
       (4547, 'steam:11000010aa8b577', 'pineapple', 0),
       (4548, 'steam:11000010aa8b577', 'macka', 0),
       (4549, 'steam:11000010aa8b577', 'torpedo', 0),
       (4550, 'steam:11000010aa8b577', 'fixkit', 0),
       (4551, 'steam:11000010aa8b577', 'coupon3', 0),
       (4552, 'steam:11000010aa8b577', 'silencieux', 0),
       (4553, 'steam:11000010aa8b577', 'pizza', 0),
       (4554, 'steam:11000010aa8b577', 'candy2', 0),
       (4555, 'steam:11000010aa8b577', 'methlab', 0),
       (4556, 'steam:11000010aa8b577', 'stone', 0),
       (4557, 'steam:11000010aa8b577', 'sprite', 0),
       (4558, 'steam:11000010aa8b577', 'copper', 0),
       (4559, 'steam:11000010aa8b577', 'cigarette2', 0),
       (4560, 'steam:11000010aa8b577', 'marabou', 0),
       (4561, 'steam:11000010aa8b577', 'bandage', 0),
       (4562, 'steam:11000010aa8b577', 'flashlight', 0),
       (4563, 'steam:11000010aa8b577', 'gold', 0),
       (4564, 'steam:11000010aa8b577', 'largesprunk', 0),
       (4565, 'steam:11000010aa8b577', 'donut', 0),
       (4566, 'steam:11000010aa8b577', 'soup2', 0),
       (4567, 'steam:11000010aa8b577', 'carokit', 0),
       (4568, 'steam:11000010aa8b577', 'metal', 0),
       (4569, 'steam:11000010aa8b577', 'slushy2', 0),
       (4570, 'steam:11000010aa8b577', 'fanta', 0),
       (4571, 'steam:11000010aa8b577', 'slushy', 0),
       (4572, 'steam:11000010aa8b577', 'shoes', 0),
       (4573, 'steam:11000010aa8b577', 'popsicle3', 0),
       (4574, 'steam:11000010aa8b577', 'cannabis', 0),
       (4575, 'steam:11000010aa8b577', 'cheesebows', 0),
       (4576, 'steam:11000010aa8b577', 'chips2', 0),
       (4577, 'steam:11000010aa8b577', 'orange', 0),
       (4578, 'steam:11000010aa8b577', 'cocaleaf', 0),
       (4579, 'steam:11000010aa8b577', 'donut2', 0),
       (4580, 'steam:11000010aa8b577', 'petrol_raffin', 0),
       (4581, 'steam:11000010aa8b577', 'fishstix', 0),
       (4582, 'steam:11000010aa8b577', 'cutted_wood', 0),
       (4583, 'steam:11000010aa8b577', 'candy', 0),
       (4584, 'steam:11000010aa8b577', 'jus_raisin', 0),
       (4585, 'steam:11000010aa8b577', 'shirt', 0),
       (4586, 'steam:11000010aa8b577', 'grip', 0),
       (4587, 'steam:11000010aa8b577', 'gazbottle', 0),
       (4588, 'steam:11000010aa8b577', 'lotteryticket', 0),
       (4589, 'steam:11000010aa8b577', 'hotsauce', 0),
       (4590, 'steam:11000010aa8b577', 'c4_bank', 0),
       (4591, 'steam:11000010aa8b577', 'chips3', 0),
       (4592, 'steam:11000010aa8b577', 'cocacola', 0),
       (4593, 'steam:11000010aa8b577', 'coupon2', 0),
       (4594, 'steam:11000010aa8b577', 'cigarette3', 0),
       (4595, 'steam:11000010aa8b577', 'coupon4', 0),
       (4596, 'steam:11000010ec8a88b', 'popsicle2', 0),
       (4597, 'steam:11000010ec8a88b', 'candy5', 0),
       (4598, 'steam:11000010ec8a88b', 'maxpads', 0),
       (4599, 'steam:11000010ec8a88b', 'moneyshot', 0),
       (4600, 'steam:11000010ec8a88b', 'candy4', 0),
       (4601, 'steam:11000010ec8a88b', 'cigarette5', 0),
       (4602, 'steam:11000010ec8a88b', 'cereal', 0),
       (4603, 'steam:11000010ec8a88b', 'apple', 0),
       (4604, 'steam:11000010ec8a88b', 'popsicle4', 0),
       (4605, 'steam:11000010ec8a88b', 'egg', 0),
       (4606, 'steam:11000010ec8a88b', 'cigarette6', 0),
       (4607, 'steam:11000010ec8a88b', 'bleeder', 0),
       (4608, 'steam:11000010ec8a88b', 'noodles2', 0),
       (4609, 'steam:11000010ec8a88b', 'crappy', 0),
       (4610, 'steam:11000010ec8a88b', 'meatfree', 0),
       (4611, 'steam:11000010ec8a88b', 'patches', 0),
       (4612, 'steam:11000010ec8a88b', 'milk', 0),
       (4613, 'steam:11000010ec8a88b', 'popsicle', 0),
       (4614, 'steam:11000010ec8a88b', 'cigarette4', 0),
       (4615, 'steam:11000010ec8a88b', 'soup', 0),
       (4616, 'steam:11000010ec8a88b', 'candy3', 0),
       (4617, 'steam:11000010ec8a88b', 'largecola', 0),
       (4618, 'steam:11000010ec8a88b', 'noodles', 0),
       (4619, 'steam:11000010ec8a88b', 'bleach', 0),
       (4620, 'steam:11000010ec8a88b', 'popsicle5', 0),
       (4621, 'steam:11000010ec8a88b', 'sprite2', 0),
       (4622, 'steam:11000010ec8a88b', 'banana', 0),
       (4623, 'steam:11000010ec8a88b', 'pear', 0),
       (4624, 'steam:11000010ec8a88b', 'fries', 0),
       (4625, 'steam:11000010ec8a88b', 'heartstopper', 0),
       (4626, 'steam:11000010ec8a88b', 'cigarette2', 0),
       (4627, 'steam:11000010ec8a88b', 'pineapple', 0),
       (4628, 'steam:11000010ec8a88b', 'coupon3', 0),
       (4629, 'steam:11000010ec8a88b', 'torpedo', 0);
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`)
VALUES (4630, 'steam:11000010ec8a88b', 'candy2', 0),
       (4631, 'steam:11000010ec8a88b', 'donut', 0),
       (4632, 'steam:11000010ec8a88b', 'soup2', 0),
       (4633, 'steam:11000010ec8a88b', 'slushy2', 0),
       (4634, 'steam:11000010ec8a88b', 'largesprunk', 0),
       (4635, 'steam:11000010ec8a88b', 'slushy', 0),
       (4636, 'steam:11000010ec8a88b', 'fishstix', 0),
       (4637, 'steam:11000010ec8a88b', 'popsicle3', 0),
       (4638, 'steam:11000010ec8a88b', 'orange', 0),
       (4639, 'steam:11000010ec8a88b', 'chips2', 0),
       (4640, 'steam:11000010ec8a88b', 'donut2', 0),
       (4641, 'steam:11000010ec8a88b', 'hotsauce', 0),
       (4642, 'steam:11000010ec8a88b', 'cigarette3', 0),
       (4643, 'steam:11000010ec8a88b', 'coupon2', 0),
       (4644, 'steam:11000010ec8a88b', 'chips3', 0),
       (4645, 'steam:11000010ec8a88b', 'candy', 0),
       (4646, 'steam:11000010ec8a88b', 'coupon4', 0),
       (4647, 'steam:1100001114a1946', 'moneyshot', 0),
       (4648, 'steam:1100001114a1946', 'medkit', 0),
       (4649, 'steam:1100001114a1946', 'maxpads', 0),
       (4650, 'steam:1100001114a1946', 'blowpipe', 0),
       (4651, 'steam:1100001114a1946', 'candy4', 0),
       (4652, 'steam:1100001114a1946', 'popsicle2', 0),
       (4653, 'steam:1100001114a1946', 'candy5', 0),
       (4654, 'steam:1100001114a1946', 'laptop', 0),
       (4655, 'steam:1100001114a1946', 'book', 0),
       (4656, 'steam:1100001114a1946', 'iron', 0),
       (4657, 'steam:1100001114a1946', 'lighter', 0),
       (4658, 'steam:1100001114a1946', 'cereal', 0),
       (4659, 'steam:1100001114a1946', 'alive_chicken', 0),
       (4660, 'steam:1100001114a1946', 'morphine', 0),
       (4661, 'steam:1100001114a1946', 'acetone', 0),
       (4662, 'steam:1100001114a1946', 'marijuana', 0),
       (4663, 'steam:1100001114a1946', 'water', 993),
       (4664, 'steam:1100001114a1946', 'popsicle4', 0),
       (4665, 'steam:1100001114a1946', 'bread', 995),
       (4666, 'steam:1100001114a1946', 'apple', 0),
       (4667, 'steam:1100001114a1946', 'essence', 0),
       (4668, 'steam:1100001114a1946', 'saffron', 0),
       (4669, 'steam:1100001114a1946', 'cigarette5', 0),
       (4670, 'steam:1100001114a1946', 'raisin', 0),
       (4671, 'steam:1100001114a1946', 'gauze', 0),
       (4672, 'steam:1100001114a1946', 'egg', 0),
       (4673, 'steam:1100001114a1946', 'petrol', 0),
       (4674, 'steam:1100001114a1946', 'pants', 0),
       (4675, 'steam:1100001114a1946', 'vicodin', 0),
       (4676, 'steam:1100001114a1946', 'packaged_plank', 0),
       (4677, 'steam:1100001114a1946', 'cigarette', 0),
       (4678, 'steam:1100001114a1946', 'jewels', 0),
       (4679, 'steam:1100001114a1946', 'meatfree', 0),
       (4680, 'steam:1100001114a1946', 'slaughtered_chicken', 0),
       (4681, 'steam:1100001114a1946', 'burger', 0),
       (4682, 'steam:1100001114a1946', 'noodles2', 0),
       (4683, 'steam:1100001114a1946', 'vine', 0),
       (4684, 'steam:1100001114a1946', 'cigarette6', 0),
       (4685, 'steam:1100001114a1946', 'cocaine', 0),
       (4686, 'steam:1100001114a1946', 'crappy', 0),
       (4687, 'steam:1100001114a1946', 'lockpick', 0),
       (4688, 'steam:1100001114a1946', 'toothpaste', 0),
       (4689, 'steam:1100001114a1946', 'milk', 0),
       (4690, 'steam:1100001114a1946', 'bleeder', 0),
       (4691, 'steam:1100001114a1946', 'soup', 0),
       (4692, 'steam:1100001114a1946', 'speaker', 0),
       (4693, 'steam:1100001114a1946', 'coupon', 0),
       (4694, 'steam:1100001114a1946', 'popsicle', 0),
       (4695, 'steam:1100001114a1946', 'cigarette4', 0),
       (4696, 'steam:1100001114a1946', 'patches', 0),
       (4697, 'steam:1100001114a1946', 'candy3', 0),
       (4698, 'steam:1100001114a1946', 'bleach', 0),
       (4699, 'steam:1100001114a1946', 'fixtool', 0),
       (4700, 'steam:1100001114a1946', 'firstaid', 0),
       (4701, 'steam:1100001114a1946', 'xanax', 0),
       (4702, 'steam:1100001114a1946', 'lithium', 0),
       (4703, 'steam:1100001114a1946', 'largecola', 0),
       (4704, 'steam:1100001114a1946', 'chips', 0),
       (4705, 'steam:1100001114a1946', 'popsicle5', 0),
       (4706, 'steam:1100001114a1946', 'loka', 0),
       (4707, 'steam:1100001114a1946', 'noodles', 0),
       (4708, 'steam:1100001114a1946', 'hydrocodone', 0),
       (4709, 'steam:1100001114a1946', 'medikit', 0),
       (4710, 'steam:1100001114a1946', 'raspberry', 0),
       (4711, 'steam:1100001114a1946', 'pastacarbonara', 0),
       (4712, 'steam:1100001114a1946', 'carotool', 0),
       (4713, 'steam:1100001114a1946', 'fabric', 0),
       (4714, 'steam:1100001114a1946', 'grand_cru', 0),
       (4715, 'steam:1100001114a1946', 'hat', 0),
       (4716, 'steam:1100001114a1946', 'coke_pooch', 0),
       (4717, 'steam:1100001114a1946', 'fish', 0),
       (4718, 'steam:1100001114a1946', 'packaged_chicken', 0),
       (4719, 'steam:1100001114a1946', 'sprite2', 0),
       (4720, 'steam:1100001114a1946', 'diamond', 0),
       (4721, 'steam:1100001114a1946', 'blowtorch', 0),
       (4722, 'steam:1100001114a1946', 'clothe', 0),
       (4723, 'steam:1100001114a1946', 'heartstopper', 0),
       (4724, 'steam:1100001114a1946', 'meth', 0),
       (4725, 'steam:1100001114a1946', 'banana', 0),
       (4726, 'steam:1100001114a1946', 'yusuf', 0),
       (4727, 'steam:1100001114a1946', 'wool', 0),
       (4728, 'steam:1100001114a1946', 'pear', 0),
       (4729, 'steam:1100001114a1946', 'washed_stone', 0),
       (4730, 'steam:1100001114a1946', 'wood', 0),
       (4731, 'steam:1100001114a1946', 'fries', 0),
       (4732, 'steam:1100001114a1946', 'coupon3', 0),
       (4733, 'steam:1100001114a1946', 'macka', 0),
       (4734, 'steam:1100001114a1946', 'fixkit', 0),
       (4735, 'steam:1100001114a1946', 'torpedo', 0),
       (4736, 'steam:1100001114a1946', 'pineapple', 0),
       (4737, 'steam:1100001114a1946', 'silencieux', 0),
       (4738, 'steam:1100001114a1946', 'pizza', 0),
       (4739, 'steam:1100001114a1946', 'stone', 0),
       (4740, 'steam:1100001114a1946', 'candy2', 0),
       (4741, 'steam:1100001114a1946', 'methlab', 0),
       (4742, 'steam:1100001114a1946', 'bandage', 0),
       (4743, 'steam:1100001114a1946', 'marabou', 0),
       (4744, 'steam:1100001114a1946', 'sprite', 0),
       (4745, 'steam:1100001114a1946', 'copper', 0),
       (4746, 'steam:1100001114a1946', 'cigarette2', 0),
       (4747, 'steam:1100001114a1946', 'flashlight', 0),
       (4748, 'steam:1100001114a1946', 'donut', 0),
       (4749, 'steam:1100001114a1946', 'largesprunk', 0),
       (4750, 'steam:1100001114a1946', 'soup2', 0),
       (4751, 'steam:1100001114a1946', 'gold', 0),
       (4752, 'steam:1100001114a1946', 'fanta', 0),
       (4753, 'steam:1100001114a1946', 'metal', 0),
       (4754, 'steam:1100001114a1946', 'slushy2', 0),
       (4755, 'steam:1100001114a1946', 'slushy', 0),
       (4756, 'steam:1100001114a1946', 'carokit', 0),
       (4757, 'steam:1100001114a1946', 'popsicle3', 0),
       (4758, 'steam:1100001114a1946', 'shoes', 0),
       (4759, 'steam:1100001114a1946', 'cheesebows', 0),
       (4760, 'steam:1100001114a1946', 'chips2', 0),
       (4761, 'steam:1100001114a1946', 'cannabis', 0),
       (4762, 'steam:1100001114a1946', 'cocaleaf', 0),
       (4763, 'steam:1100001114a1946', 'orange', 0),
       (4764, 'steam:1100001114a1946', 'fishstix', 0),
       (4765, 'steam:1100001114a1946', 'petrol_raffin', 0),
       (4766, 'steam:1100001114a1946', 'donut2', 0),
       (4767, 'steam:1100001114a1946', 'grip', 0),
       (4768, 'steam:1100001114a1946', 'candy', 0),
       (4769, 'steam:1100001114a1946', 'cutted_wood', 0),
       (4770, 'steam:1100001114a1946', 'jus_raisin', 0),
       (4771, 'steam:1100001114a1946', 'shirt', 0),
       (4772, 'steam:1100001114a1946', 'hotsauce', 0),
       (4773, 'steam:1100001114a1946', 'lotteryticket', 0),
       (4774, 'steam:1100001114a1946', 'gazbottle', 0),
       (4775, 'steam:1100001114a1946', 'c4_bank', 0),
       (4776, 'steam:1100001114a1946', 'chips3', 0),
       (4777, 'steam:1100001114a1946', 'coupon4', 0),
       (4778, 'steam:1100001114a1946', 'coupon2', 0),
       (4779, 'steam:1100001114a1946', 'cocacola', 0),
       (4780, 'steam:1100001114a1946', 'cigarette3', 0),
       (4781, 'steam:1100001059883bd', 'candy4', 0),
       (4782, 'steam:1100001059883bd', 'moneyshot', 0),
       (4783, 'steam:1100001059883bd', 'blowpipe', 0),
       (4784, 'steam:1100001059883bd', 'medkit', 0),
       (4785, 'steam:1100001059883bd', 'maxpads', 0),
       (4786, 'steam:1100001059883bd', 'candy5', 0),
       (4787, 'steam:1100001059883bd', 'book', 0),
       (4788, 'steam:1100001059883bd', 'popsicle2', 0),
       (4789, 'steam:1100001059883bd', 'laptop', 0),
       (4790, 'steam:1100001059883bd', 'iron', 0),
       (4791, 'steam:1100001059883bd', 'alive_chicken', 0),
       (4792, 'steam:1100001059883bd', 'morphine', 0),
       (4793, 'steam:1100001059883bd', 'acetone', 0),
       (4794, 'steam:1100001059883bd', 'lighter', 0),
       (4795, 'steam:1100001059883bd', 'cereal', 0),
       (4796, 'steam:1100001059883bd', 'popsicle4', 0),
       (4797, 'steam:1100001059883bd', 'bread', 0),
       (4798, 'steam:1100001059883bd', 'apple', 0),
       (4799, 'steam:1100001059883bd', 'marijuana', 0),
       (4800, 'steam:1100001059883bd', 'water', 0),
       (4801, 'steam:1100001059883bd', 'gauze', 0),
       (4802, 'steam:1100001059883bd', 'cigarette5', 0),
       (4803, 'steam:1100001059883bd', 'essence', 0),
       (4804, 'steam:1100001059883bd', 'raisin', 0),
       (4805, 'steam:1100001059883bd', 'saffron', 0),
       (4806, 'steam:1100001059883bd', 'petrol', 0),
       (4807, 'steam:1100001059883bd', 'vicodin', 0),
       (4808, 'steam:1100001059883bd', 'egg', 0),
       (4809, 'steam:1100001059883bd', 'pants', 0),
       (4810, 'steam:1100001059883bd', 'packaged_plank', 0),
       (4811, 'steam:1100001059883bd', 'cigarette', 0),
       (4812, 'steam:1100001059883bd', 'burger', 0),
       (4813, 'steam:1100001059883bd', 'meatfree', 0),
       (4814, 'steam:1100001059883bd', 'jewels', 0),
       (4815, 'steam:1100001059883bd', 'slaughtered_chicken', 0),
       (4816, 'steam:1100001059883bd', 'vine', 0),
       (4817, 'steam:1100001059883bd', 'noodles2', 0),
       (4818, 'steam:1100001059883bd', 'crappy', 0),
       (4819, 'steam:1100001059883bd', 'cocaine', 0),
       (4820, 'steam:1100001059883bd', 'cigarette6', 0),
       (4821, 'steam:1100001059883bd', 'soup', 0),
       (4822, 'steam:1100001059883bd', 'bleeder', 0),
       (4823, 'steam:1100001059883bd', 'milk', 0),
       (4824, 'steam:1100001059883bd', 'lockpick', 0),
       (4825, 'steam:1100001059883bd', 'toothpaste', 0),
       (4826, 'steam:1100001059883bd', 'popsicle', 0),
       (4827, 'steam:1100001059883bd', 'patches', 0),
       (4828, 'steam:1100001059883bd', 'coupon', 0),
       (4829, 'steam:1100001059883bd', 'cigarette4', 0),
       (4830, 'steam:1100001059883bd', 'speaker', 0),
       (4831, 'steam:1100001059883bd', 'xanax', 0),
       (4832, 'steam:1100001059883bd', 'fixtool', 0),
       (4833, 'steam:1100001059883bd', 'candy3', 0),
       (4834, 'steam:1100001059883bd', 'bleach', 0),
       (4835, 'steam:1100001059883bd', 'firstaid', 0),
       (4836, 'steam:1100001059883bd', 'chips', 0),
       (4837, 'steam:1100001059883bd', 'loka', 0),
       (4838, 'steam:1100001059883bd', 'lithium', 0),
       (4839, 'steam:1100001059883bd', 'largecola', 0),
       (4840, 'steam:1100001059883bd', 'popsicle5', 0),
       (4841, 'steam:1100001059883bd', 'noodles', 0),
       (4842, 'steam:1100001059883bd', 'pastacarbonara', 0),
       (4843, 'steam:1100001059883bd', 'hydrocodone', 0),
       (4844, 'steam:1100001059883bd', 'raspberry', 0),
       (4845, 'steam:1100001059883bd', 'medikit', 0),
       (4846, 'steam:1100001059883bd', 'fabric', 0),
       (4847, 'steam:1100001059883bd', 'hat', 0),
       (4848, 'steam:1100001059883bd', 'grand_cru', 0),
       (4849, 'steam:1100001059883bd', 'carotool', 0),
       (4850, 'steam:1100001059883bd', 'coke_pooch', 0),
       (4851, 'steam:1100001059883bd', 'fish', 0),
       (4852, 'steam:1100001059883bd', 'packaged_chicken', 0),
       (4853, 'steam:1100001059883bd', 'blowtorch', 0),
       (4854, 'steam:1100001059883bd', 'diamond', 0),
       (4855, 'steam:1100001059883bd', 'sprite2', 0),
       (4856, 'steam:1100001059883bd', 'meth', 0),
       (4857, 'steam:1100001059883bd', 'yusuf', 0),
       (4858, 'steam:1100001059883bd', 'banana', 0),
       (4859, 'steam:1100001059883bd', 'heartstopper', 0),
       (4860, 'steam:1100001059883bd', 'clothe', 0),
       (4861, 'steam:1100001059883bd', 'wood', 0),
       (4862, 'steam:1100001059883bd', 'fries', 0),
       (4863, 'steam:1100001059883bd', 'washed_stone', 0),
       (4864, 'steam:1100001059883bd', 'wool', 0),
       (4865, 'steam:1100001059883bd', 'pear', 0),
       (4866, 'steam:1100001059883bd', 'macka', 0),
       (4867, 'steam:1100001059883bd', 'coupon3', 0),
       (4868, 'steam:1100001059883bd', 'torpedo', 0),
       (4869, 'steam:1100001059883bd', 'fixkit', 0),
       (4870, 'steam:1100001059883bd', 'pineapple', 0),
       (4871, 'steam:1100001059883bd', 'stone', 0),
       (4872, 'steam:1100001059883bd', 'pizza', 0),
       (4873, 'steam:1100001059883bd', 'silencieux', 0),
       (4874, 'steam:1100001059883bd', 'methlab', 0),
       (4875, 'steam:1100001059883bd', 'candy2', 0),
       (4876, 'steam:1100001059883bd', 'cigarette2', 0),
       (4877, 'steam:1100001059883bd', 'sprite', 0),
       (4878, 'steam:1100001059883bd', 'marabou', 0),
       (4879, 'steam:1100001059883bd', 'bandage', 0),
       (4880, 'steam:1100001059883bd', 'copper', 0),
       (4881, 'steam:1100001059883bd', 'largesprunk', 0),
       (4882, 'steam:1100001059883bd', 'donut', 0),
       (4883, 'steam:1100001059883bd', 'soup2', 0),
       (4884, 'steam:1100001059883bd', 'flashlight', 0),
       (4885, 'steam:1100001059883bd', 'gold', 0),
       (4886, 'steam:1100001059883bd', 'carokit', 0),
       (4887, 'steam:1100001059883bd', 'slushy', 0),
       (4888, 'steam:1100001059883bd', 'metal', 0),
       (4889, 'steam:1100001059883bd', 'slushy2', 0),
       (4890, 'steam:1100001059883bd', 'fanta', 0),
       (4891, 'steam:1100001059883bd', 'cannabis', 0),
       (4892, 'steam:1100001059883bd', 'shoes', 0),
       (4893, 'steam:1100001059883bd', 'cheesebows', 0),
       (4894, 'steam:1100001059883bd', 'chips2', 0),
       (4895, 'steam:1100001059883bd', 'popsicle3', 0),
       (4896, 'steam:1100001059883bd', 'donut2', 0),
       (4897, 'steam:1100001059883bd', 'petrol_raffin', 0),
       (4898, 'steam:1100001059883bd', 'fishstix', 0),
       (4899, 'steam:1100001059883bd', 'cocaleaf', 0),
       (4900, 'steam:1100001059883bd', 'orange', 0),
       (4901, 'steam:1100001059883bd', 'shirt', 0),
       (4902, 'steam:1100001059883bd', 'grip', 0),
       (4903, 'steam:1100001059883bd', 'cutted_wood', 0),
       (4904, 'steam:1100001059883bd', 'jus_raisin', 0),
       (4905, 'steam:1100001059883bd', 'candy', 0),
       (4906, 'steam:1100001059883bd', 'c4_bank', 0),
       (4907, 'steam:1100001059883bd', 'lotteryticket', 0),
       (4908, 'steam:1100001059883bd', 'hotsauce', 0),
       (4909, 'steam:1100001059883bd', 'chips3', 0),
       (4910, 'steam:1100001059883bd', 'gazbottle', 0),
       (4911, 'steam:1100001059883bd', 'cocacola', 0),
       (4912, 'steam:1100001059883bd', 'coupon2', 0),
       (4913, 'steam:1100001059883bd', 'cigarette3', 0),
       (4914, 'steam:1100001059883bd', 'coupon4', 0),
       (5049, 'steam:110000103f6f09b', 'medkit', 0),
       (5050, 'steam:110000103f6f09b', 'maxpads', 0),
       (5051, 'steam:110000103f6f09b', 'moneyshot', 0),
       (5052, 'steam:110000103f6f09b', 'blowpipe', 0),
       (5053, 'steam:110000103f6f09b', 'candy4', 0),
       (5054, 'steam:110000103f6f09b', 'book', 0),
       (5055, 'steam:110000103f6f09b', 'popsicle2', 0),
       (5056, 'steam:110000103f6f09b', 'candy5', 0),
       (5057, 'steam:110000103f6f09b', 'laptop', 0),
       (5058, 'steam:110000103f6f09b', 'iron', 0),
       (5059, 'steam:110000103f6f09b', 'lighter', 0),
       (5060, 'steam:110000103f6f09b', 'morphine', 0),
       (5061, 'steam:110000103f6f09b', 'alive_chicken', 0),
       (5062, 'steam:110000103f6f09b', 'acetone', 0),
       (5063, 'steam:110000103f6f09b', 'cereal', 0),
       (5064, 'steam:110000103f6f09b', 'bread', 0),
       (5065, 'steam:110000103f6f09b', 'popsicle4', 0),
       (5066, 'steam:110000103f6f09b', 'marijuana', 0),
       (5067, 'steam:110000103f6f09b', 'water', 0),
       (5068, 'steam:110000103f6f09b', 'apple', 0),
       (5069, 'steam:110000103f6f09b', 'raisin', 0),
       (5070, 'steam:110000103f6f09b', 'gauze', 0),
       (5071, 'steam:110000103f6f09b', 'essence', 0),
       (5072, 'steam:110000103f6f09b', 'saffron', 0),
       (5073, 'steam:110000103f6f09b', 'cigarette5', 0),
       (5074, 'steam:110000103f6f09b', 'egg', 0),
       (5075, 'steam:110000103f6f09b', 'petrol', 0),
       (5076, 'steam:110000103f6f09b', 'packaged_plank', 0),
       (5077, 'steam:110000103f6f09b', 'vicodin', 0),
       (5078, 'steam:110000103f6f09b', 'pants', 0),
       (5079, 'steam:110000103f6f09b', 'burger', 0),
       (5080, 'steam:110000103f6f09b', 'meatfree', 0),
       (5081, 'steam:110000103f6f09b', 'slaughtered_chicken', 0),
       (5082, 'steam:110000103f6f09b', 'cigarette', 0),
       (5083, 'steam:110000103f6f09b', 'jewels', 0),
       (5084, 'steam:110000103f6f09b', 'crappy', 0),
       (5085, 'steam:110000103f6f09b', 'noodles2', 0),
       (5086, 'steam:110000103f6f09b', 'cigarette6', 0),
       (5087, 'steam:110000103f6f09b', 'vine', 0),
       (5088, 'steam:110000103f6f09b', 'cocaine', 0),
       (5089, 'steam:110000103f6f09b', 'milk', 0),
       (5090, 'steam:110000103f6f09b', 'toothpaste', 0),
       (5091, 'steam:110000103f6f09b', 'lockpick', 0),
       (5092, 'steam:110000103f6f09b', 'bleeder', 0),
       (5093, 'steam:110000103f6f09b', 'soup', 0),
       (5094, 'steam:110000103f6f09b', 'cigarette4', 0),
       (5095, 'steam:110000103f6f09b', 'coupon', 0),
       (5096, 'steam:110000103f6f09b', 'popsicle', 0),
       (5097, 'steam:110000103f6f09b', 'speaker', 0),
       (5098, 'steam:110000103f6f09b', 'patches', 0),
       (5099, 'steam:110000103f6f09b', 'bleach', 0),
       (5100, 'steam:110000103f6f09b', 'candy3', 0),
       (5101, 'steam:110000103f6f09b', 'fixtool', 0),
       (5102, 'steam:110000103f6f09b', 'firstaid', 0),
       (5103, 'steam:110000103f6f09b', 'xanax', 0),
       (5104, 'steam:110000103f6f09b', 'largecola', 0),
       (5105, 'steam:110000103f6f09b', 'loka', 0),
       (5106, 'steam:110000103f6f09b', 'popsicle5', 0),
       (5107, 'steam:110000103f6f09b', 'chips', 0),
       (5108, 'steam:110000103f6f09b', 'lithium', 0),
       (5109, 'steam:110000103f6f09b', 'noodles', 0),
       (5110, 'steam:110000103f6f09b', 'hydrocodone', 0),
       (5111, 'steam:110000103f6f09b', 'raspberry', 0),
       (5112, 'steam:110000103f6f09b', 'medikit', 0),
       (5113, 'steam:110000103f6f09b', 'pastacarbonara', 0),
       (5114, 'steam:110000103f6f09b', 'hat', 0),
       (5115, 'steam:110000103f6f09b', 'coke_pooch', 0),
       (5116, 'steam:110000103f6f09b', 'fabric', 0),
       (5117, 'steam:110000103f6f09b', 'grand_cru', 0),
       (5118, 'steam:110000103f6f09b', 'carotool', 0),
       (5119, 'steam:110000103f6f09b', 'sprite2', 0),
       (5120, 'steam:110000103f6f09b', 'packaged_chicken', 0),
       (5121, 'steam:110000103f6f09b', 'fish', 0),
       (5122, 'steam:110000103f6f09b', 'blowtorch', 0),
       (5123, 'steam:110000103f6f09b', 'diamond', 0),
       (5124, 'steam:110000103f6f09b', 'banana', 0),
       (5125, 'steam:110000103f6f09b', 'yusuf', 0),
       (5126, 'steam:110000103f6f09b', 'clothe', 0),
       (5127, 'steam:110000103f6f09b', 'meth', 0),
       (5128, 'steam:110000103f6f09b', 'heartstopper', 0),
       (5129, 'steam:110000103f6f09b', 'wood', 0),
       (5130, 'steam:110000103f6f09b', 'wool', 0),
       (5131, 'steam:110000103f6f09b', 'pear', 0),
       (5132, 'steam:110000103f6f09b', 'washed_stone', 0),
       (5133, 'steam:110000103f6f09b', 'fries', 0),
       (5134, 'steam:110000103f6f09b', 'fixkit', 0),
       (5135, 'steam:110000103f6f09b', 'pineapple', 0),
       (5136, 'steam:110000103f6f09b', 'torpedo', 0),
       (5137, 'steam:110000103f6f09b', 'macka', 0),
       (5138, 'steam:110000103f6f09b', 'coupon3', 0),
       (5139, 'steam:110000103f6f09b', 'pizza', 0),
       (5140, 'steam:110000103f6f09b', 'stone', 0),
       (5141, 'steam:110000103f6f09b', 'candy2', 0),
       (5142, 'steam:110000103f6f09b', 'methlab', 0),
       (5143, 'steam:110000103f6f09b', 'silencieux', 0),
       (5144, 'steam:110000103f6f09b', 'copper', 0),
       (5145, 'steam:110000103f6f09b', 'sprite', 0),
       (5146, 'steam:110000103f6f09b', 'cigarette2', 0),
       (5147, 'steam:110000103f6f09b', 'bandage', 0),
       (5148, 'steam:110000103f6f09b', 'marabou', 0),
       (5149, 'steam:110000103f6f09b', 'flashlight', 0),
       (5150, 'steam:110000103f6f09b', 'gold', 0),
       (5151, 'steam:110000103f6f09b', 'largesprunk', 0),
       (5152, 'steam:110000103f6f09b', 'soup2', 0),
       (5153, 'steam:110000103f6f09b', 'donut', 0),
       (5154, 'steam:110000103f6f09b', 'carokit', 0),
       (5155, 'steam:110000103f6f09b', 'fanta', 0),
       (5156, 'steam:110000103f6f09b', 'slushy', 0),
       (5157, 'steam:110000103f6f09b', 'metal', 0),
       (5158, 'steam:110000103f6f09b', 'slushy2', 0),
       (5159, 'steam:110000103f6f09b', 'chips2', 0),
       (5160, 'steam:110000103f6f09b', 'cheesebows', 0),
       (5161, 'steam:110000103f6f09b', 'popsicle3', 0),
       (5162, 'steam:110000103f6f09b', 'shoes', 0),
       (5163, 'steam:110000103f6f09b', 'cannabis', 0),
       (5164, 'steam:110000103f6f09b', 'petrol_raffin', 0),
       (5165, 'steam:110000103f6f09b', 'donut2', 0),
       (5166, 'steam:110000103f6f09b', 'orange', 0),
       (5167, 'steam:110000103f6f09b', 'cocaleaf', 0),
       (5168, 'steam:110000103f6f09b', 'fishstix', 0),
       (5169, 'steam:110000103f6f09b', 'shirt', 0),
       (5170, 'steam:110000103f6f09b', 'candy', 0),
       (5171, 'steam:110000103f6f09b', 'grip', 0),
       (5172, 'steam:110000103f6f09b', 'cutted_wood', 0),
       (5173, 'steam:110000103f6f09b', 'jus_raisin', 0),
       (5174, 'steam:110000103f6f09b', 'chips3', 0),
       (5175, 'steam:110000103f6f09b', 'hotsauce', 0),
       (5176, 'steam:110000103f6f09b', 'lotteryticket', 0),
       (5177, 'steam:110000103f6f09b', 'gazbottle', 0),
       (5178, 'steam:110000103f6f09b', 'c4_bank', 0),
       (5179, 'steam:110000103f6f09b', 'cocacola', 0),
       (5180, 'steam:110000103f6f09b', 'coupon2', 0),
       (5181, 'steam:110000103f6f09b', 'cigarette3', 0),
       (5182, 'steam:110000103f6f09b', 'coupon4', 0),
       (5184, 'steam:1100001004c2f59', 'blowpipe', 0),
       (5185, 'steam:1100001004c2f59', 'maxpads', 0),
       (5186, 'steam:1100001004c2f59', 'moneyshot', 0),
       (5187, 'steam:1100001004c2f59', 'medkit', 0),
       (5188, 'steam:1100001004c2f59', 'candy4', 0),
       (5189, 'steam:1100001004c2f59', 'candy5', 0),
       (5190, 'steam:1100001004c2f59', 'iron', 0),
       (5191, 'steam:1100001004c2f59', 'book', 0),
       (5192, 'steam:1100001004c2f59', 'popsicle2', 0),
       (5193, 'steam:1100001004c2f59', 'laptop', 0),
       (5194, 'steam:1100001004c2f59', 'alive_chicken', 0),
       (5195, 'steam:1100001004c2f59', 'lighter', 0),
       (5196, 'steam:1100001004c2f59', 'morphine', 0),
       (5197, 'steam:1100001004c2f59', 'acetone', 0),
       (5198, 'steam:1100001004c2f59', 'cereal', 0),
       (5199, 'steam:1100001004c2f59', 'water', 0),
       (5200, 'steam:1100001004c2f59', 'bread', 0),
       (5201, 'steam:1100001004c2f59', 'marijuana', 0),
       (5202, 'steam:1100001004c2f59', 'apple', 0),
       (5203, 'steam:1100001004c2f59', 'popsicle4', 0),
       (5204, 'steam:1100001004c2f59', 'saffron', 0),
       (5205, 'steam:1100001004c2f59', 'raisin', 0),
       (5206, 'steam:1100001004c2f59', 'essence', 0),
       (5207, 'steam:1100001004c2f59', 'cigarette5', 0),
       (5208, 'steam:1100001004c2f59', 'gauze', 0),
       (5209, 'steam:1100001004c2f59', 'vicodin', 0),
       (5210, 'steam:1100001004c2f59', 'petrol', 0),
       (5211, 'steam:1100001004c2f59', 'egg', 0),
       (5212, 'steam:1100001004c2f59', 'pants', 0),
       (5213, 'steam:1100001004c2f59', 'packaged_plank', 0),
       (5214, 'steam:1100001004c2f59', 'burger', 0),
       (5215, 'steam:1100001004c2f59', 'jewels', 0),
       (5216, 'steam:1100001004c2f59', 'cigarette', 0),
       (5217, 'steam:1100001004c2f59', 'slaughtered_chicken', 0),
       (5218, 'steam:1100001004c2f59', 'meatfree', 0),
       (5219, 'steam:1100001004c2f59', 'noodles2', 0),
       (5220, 'steam:1100001004c2f59', 'vine', 0),
       (5221, 'steam:1100001004c2f59', 'crappy', 0),
       (5222, 'steam:1100001004c2f59', 'cocaine', 0),
       (5223, 'steam:1100001004c2f59', 'cigarette6', 0),
       (5224, 'steam:1100001004c2f59', 'toothpaste', 0),
       (5225, 'steam:1100001004c2f59', 'soup', 0),
       (5226, 'steam:1100001004c2f59', 'milk', 0),
       (5227, 'steam:1100001004c2f59', 'lockpick', 0),
       (5228, 'steam:1100001004c2f59', 'bleeder', 0),
       (5229, 'steam:1100001004c2f59', 'cigarette4', 0),
       (5230, 'steam:1100001004c2f59', 'popsicle', 0),
       (5231, 'steam:1100001004c2f59', 'patches', 0),
       (5232, 'steam:1100001004c2f59', 'speaker', 0),
       (5233, 'steam:1100001004c2f59', 'coupon', 0),
       (5234, 'steam:1100001004c2f59', 'fixtool', 0),
       (5235, 'steam:1100001004c2f59', 'candy3', 0),
       (5236, 'steam:1100001004c2f59', 'firstaid', 0),
       (5237, 'steam:1100001004c2f59', 'xanax', 0),
       (5238, 'steam:1100001004c2f59', 'bleach', 0),
       (5239, 'steam:1100001004c2f59', 'loka', 0),
       (5240, 'steam:1100001004c2f59', 'largecola', 0),
       (5241, 'steam:1100001004c2f59', 'lithium', 0),
       (5242, 'steam:1100001004c2f59', 'chips', 0),
       (5243, 'steam:1100001004c2f59', 'popsicle5', 0),
       (5244, 'steam:1100001004c2f59', 'medikit', 0),
       (5245, 'steam:1100001004c2f59', 'raspberry', 0),
       (5246, 'steam:1100001004c2f59', 'hydrocodone', 0),
       (5247, 'steam:1100001004c2f59', 'noodles', 0),
       (5248, 'steam:1100001004c2f59', 'pastacarbonara', 0),
       (5249, 'steam:1100001004c2f59', 'fabric', 0),
       (5250, 'steam:1100001004c2f59', 'coke_pooch', 0),
       (5251, 'steam:1100001004c2f59', 'carotool', 0),
       (5252, 'steam:1100001004c2f59', 'hat', 0),
       (5253, 'steam:1100001004c2f59', 'grand_cru', 0),
       (5254, 'steam:1100001004c2f59', 'fish', 0),
       (5255, 'steam:1100001004c2f59', 'diamond', 0),
       (5256, 'steam:1100001004c2f59', 'blowtorch', 0),
       (5257, 'steam:1100001004c2f59', 'sprite2', 0),
       (5258, 'steam:1100001004c2f59', 'packaged_chicken', 0),
       (5259, 'steam:1100001004c2f59', 'meth', 0),
       (5260, 'steam:1100001004c2f59', 'banana', 0),
       (5261, 'steam:1100001004c2f59', 'yusuf', 0),
       (5262, 'steam:1100001004c2f59', 'clothe', 0),
       (5263, 'steam:1100001004c2f59', 'heartstopper', 0),
       (5264, 'steam:1100001004c2f59', 'washed_stone', 0),
       (5265, 'steam:1100001004c2f59', 'pear', 0),
       (5266, 'steam:1100001004c2f59', 'wood', 0),
       (5267, 'steam:1100001004c2f59', 'wool', 0),
       (5268, 'steam:1100001004c2f59', 'fries', 0),
       (5269, 'steam:1100001004c2f59', 'pineapple', 0),
       (5270, 'steam:1100001004c2f59', 'macka', 0),
       (5271, 'steam:1100001004c2f59', 'coupon3', 0),
       (5272, 'steam:1100001004c2f59', 'fixkit', 0),
       (5273, 'steam:1100001004c2f59', 'torpedo', 0),
       (5274, 'steam:1100001004c2f59', 'candy2', 0),
       (5275, 'steam:1100001004c2f59', 'silencieux', 0),
       (5276, 'steam:1100001004c2f59', 'methlab', 0),
       (5277, 'steam:1100001004c2f59', 'stone', 0),
       (5278, 'steam:1100001004c2f59', 'pizza', 0),
       (5279, 'steam:1100001004c2f59', 'copper', 0),
       (5280, 'steam:1100001004c2f59', 'bandage', 0),
       (5281, 'steam:1100001004c2f59', 'cigarette2', 0),
       (5282, 'steam:1100001004c2f59', 'marabou', 0),
       (5283, 'steam:1100001004c2f59', 'sprite', 0),
       (5284, 'steam:1100001004c2f59', 'largesprunk', 0),
       (5285, 'steam:1100001004c2f59', 'soup2', 0),
       (5286, 'steam:1100001004c2f59', 'flashlight', 0),
       (5287, 'steam:1100001004c2f59', 'gold', 0),
       (5288, 'steam:1100001004c2f59', 'donut', 0),
       (5289, 'steam:1100001004c2f59', 'slushy', 0),
       (5290, 'steam:1100001004c2f59', 'fanta', 0),
       (5291, 'steam:1100001004c2f59', 'metal', 0),
       (5292, 'steam:1100001004c2f59', 'slushy2', 0),
       (5293, 'steam:1100001004c2f59', 'carokit', 0),
       (5294, 'steam:1100001004c2f59', 'cheesebows', 0),
       (5295, 'steam:1100001004c2f59', 'cannabis', 0),
       (5296, 'steam:1100001004c2f59', 'shoes', 0),
       (5297, 'steam:1100001004c2f59', 'chips2', 0),
       (5298, 'steam:1100001004c2f59', 'popsicle3', 0),
       (5299, 'steam:1100001004c2f59', 'cocaleaf', 0),
       (5300, 'steam:1100001004c2f59', 'orange', 0),
       (5301, 'steam:1100001004c2f59', 'fishstix', 0),
       (5302, 'steam:1100001004c2f59', 'petrol_raffin', 0),
       (5303, 'steam:1100001004c2f59', 'donut2', 0),
       (5304, 'steam:1100001004c2f59', 'grip', 0),
       (5305, 'steam:1100001004c2f59', 'shirt', 0),
       (5306, 'steam:1100001004c2f59', 'cutted_wood', 0),
       (5307, 'steam:1100001004c2f59', 'candy', 0),
       (5308, 'steam:1100001004c2f59', 'jus_raisin', 0),
       (5309, 'steam:1100001004c2f59', 'chips3', 0),
       (5310, 'steam:1100001004c2f59', 'gazbottle', 0),
       (5311, 'steam:1100001004c2f59', 'lotteryticket', 0),
       (5312, 'steam:1100001004c2f59', 'c4_bank', 0),
       (5313, 'steam:1100001004c2f59', 'hotsauce', 0),
       (5314, 'steam:1100001004c2f59', 'cigarette3', 0),
       (5315, 'steam:1100001004c2f59', 'cocacola', 0),
       (5316, 'steam:1100001004c2f59', 'coupon2', 0),
       (5317, 'steam:1100001004c2f59', 'coupon4', 0),
       (5452, 'steam:110000103e4adf1', 'maxpads', 0),
       (5453, 'steam:110000103e4adf1', 'blowpipe', 0),
       (5454, 'steam:110000103e4adf1', 'moneyshot', 0),
       (5455, 'steam:110000103e4adf1', 'candy4', 0),
       (5456, 'steam:110000103e4adf1', 'medkit', 0),
       (5457, 'steam:110000103e4adf1', 'book', 0),
       (5458, 'steam:110000103e4adf1', 'laptop', 0),
       (5459, 'steam:110000103e4adf1', 'iron', 0),
       (5460, 'steam:110000103e4adf1', 'candy5', 0),
       (5461, 'steam:110000103e4adf1', 'popsicle2', 0),
       (5462, 'steam:110000103e4adf1', 'alive_chicken', 0),
       (5463, 'steam:110000103e4adf1', 'acetone', 0),
       (5464, 'steam:110000103e4adf1', 'lighter', 0),
       (5465, 'steam:110000103e4adf1', 'cereal', 0),
       (5466, 'steam:110000103e4adf1', 'morphine', 0),
       (5467, 'steam:110000103e4adf1', 'apple', 0),
       (5468, 'steam:110000103e4adf1', 'marijuana', 0),
       (5469, 'steam:110000103e4adf1', 'bread', 17),
       (5470, 'steam:110000103e4adf1', 'water', 17),
       (5471, 'steam:110000103e4adf1', 'popsicle4', 0),
       (5472, 'steam:110000103e4adf1', 'raisin', 0),
       (5473, 'steam:110000103e4adf1', 'essence', 0),
       (5474, 'steam:110000103e4adf1', 'saffron', 0),
       (5475, 'steam:110000103e4adf1', 'gauze', 0),
       (5476, 'steam:110000103e4adf1', 'cigarette5', 0),
       (5477, 'steam:110000103e4adf1', 'pants', 0),
       (5478, 'steam:110000103e4adf1', 'egg', 0),
       (5479, 'steam:110000103e4adf1', 'vicodin', 0),
       (5480, 'steam:110000103e4adf1', 'petrol', 0),
       (5481, 'steam:110000103e4adf1', 'packaged_plank', 0),
       (5482, 'steam:110000103e4adf1', 'jewels', 0),
       (5483, 'steam:110000103e4adf1', 'slaughtered_chicken', 0),
       (5484, 'steam:110000103e4adf1', 'burger', 0),
       (5485, 'steam:110000103e4adf1', 'cigarette', 0),
       (5486, 'steam:110000103e4adf1', 'meatfree', 0),
       (5487, 'steam:110000103e4adf1', 'noodles2', 0),
       (5488, 'steam:110000103e4adf1', 'vine', 0),
       (5489, 'steam:110000103e4adf1', 'cigarette6', 0),
       (5490, 'steam:110000103e4adf1', 'cocaine', 0),
       (5491, 'steam:110000103e4adf1', 'crappy', 0),
       (5492, 'steam:110000103e4adf1', 'bleeder', 0),
       (5493, 'steam:110000103e4adf1', 'lockpick', 0),
       (5494, 'steam:110000103e4adf1', 'milk', 0),
       (5495, 'steam:110000103e4adf1', 'toothpaste', 0),
       (5496, 'steam:110000103e4adf1', 'soup', 0),
       (5497, 'steam:110000103e4adf1', 'speaker', 0),
       (5498, 'steam:110000103e4adf1', 'popsicle', 0),
       (5499, 'steam:110000103e4adf1', 'cigarette4', 0),
       (5500, 'steam:110000103e4adf1', 'coupon', 0),
       (5501, 'steam:110000103e4adf1', 'patches', 0),
       (5502, 'steam:110000103e4adf1', 'fixtool', 0),
       (5503, 'steam:110000103e4adf1', 'bleach', 0),
       (5504, 'steam:110000103e4adf1', 'candy3', 0),
       (5505, 'steam:110000103e4adf1', 'firstaid', 0),
       (5506, 'steam:110000103e4adf1', 'xanax', 0),
       (5507, 'steam:110000103e4adf1', 'lithium', 0),
       (5508, 'steam:110000103e4adf1', 'chips', 0),
       (5509, 'steam:110000103e4adf1', 'loka', 0),
       (5510, 'steam:110000103e4adf1', 'popsicle5', 0),
       (5511, 'steam:110000103e4adf1', 'largecola', 0),
       (5512, 'steam:110000103e4adf1', 'hydrocodone', 0),
       (5513, 'steam:110000103e4adf1', 'noodles', 0),
       (5514, 'steam:110000103e4adf1', 'medikit', 0),
       (5515, 'steam:110000103e4adf1', 'pastacarbonara', 0),
       (5516, 'steam:110000103e4adf1', 'raspberry', 0),
       (5517, 'steam:110000103e4adf1', 'grand_cru', 0),
       (5518, 'steam:110000103e4adf1', 'carotool', 0),
       (5519, 'steam:110000103e4adf1', 'hat', 0),
       (5520, 'steam:110000103e4adf1', 'coke_pooch', 0),
       (5521, 'steam:110000103e4adf1', 'fabric', 0),
       (5522, 'steam:110000103e4adf1', 'packaged_chicken', 0),
       (5523, 'steam:110000103e4adf1', 'diamond', 0),
       (5524, 'steam:110000103e4adf1', 'blowtorch', 0),
       (5525, 'steam:110000103e4adf1', 'sprite2', 0),
       (5526, 'steam:110000103e4adf1', 'fish', 0),
       (5527, 'steam:110000103e4adf1', 'banana', 0),
       (5528, 'steam:110000103e4adf1', 'heartstopper', 0),
       (5529, 'steam:110000103e4adf1', 'clothe', 0),
       (5530, 'steam:110000103e4adf1', 'meth', 0),
       (5531, 'steam:110000103e4adf1', 'yusuf', 0),
       (5532, 'steam:110000103e4adf1', 'wool', 0),
       (5533, 'steam:110000103e4adf1', 'wood', 0),
       (5534, 'steam:110000103e4adf1', 'washed_stone', 0),
       (5535, 'steam:110000103e4adf1', 'fries', 0),
       (5536, 'steam:110000103e4adf1', 'pear', 0),
       (5537, 'steam:110000103e4adf1', 'torpedo', 0),
       (5538, 'steam:110000103e4adf1', 'coupon3', 0),
       (5539, 'steam:110000103e4adf1', 'pineapple', 0),
       (5540, 'steam:110000103e4adf1', 'macka', 0),
       (5541, 'steam:110000103e4adf1', 'fixkit', 0),
       (5542, 'steam:110000103e4adf1', 'silencieux', 0),
       (5543, 'steam:110000103e4adf1', 'methlab', 0),
       (5544, 'steam:110000103e4adf1', 'pizza', 0),
       (5545, 'steam:110000103e4adf1', 'stone', 0),
       (5546, 'steam:110000103e4adf1', 'candy2', 0),
       (5547, 'steam:110000103e4adf1', 'sprite', 0),
       (5548, 'steam:110000103e4adf1', 'bandage', 0),
       (5549, 'steam:110000103e4adf1', 'copper', 0),
       (5550, 'steam:110000103e4adf1', 'cigarette2', 0),
       (5551, 'steam:110000103e4adf1', 'marabou', 0),
       (5552, 'steam:110000103e4adf1', 'flashlight', 0),
       (5553, 'steam:110000103e4adf1', 'donut', 0),
       (5554, 'steam:110000103e4adf1', 'gold', 0),
       (5555, 'steam:110000103e4adf1', 'soup2', 0),
       (5556, 'steam:110000103e4adf1', 'largesprunk', 0),
       (5557, 'steam:110000103e4adf1', 'carokit', 0),
       (5558, 'steam:110000103e4adf1', 'slushy2', 0),
       (5559, 'steam:110000103e4adf1', 'slushy', 0),
       (5560, 'steam:110000103e4adf1', 'fanta', 0),
       (5561, 'steam:110000103e4adf1', 'metal', 0),
       (5562, 'steam:110000103e4adf1', 'shoes', 0),
       (5563, 'steam:110000103e4adf1', 'cannabis', 0),
       (5564, 'steam:110000103e4adf1', 'popsicle3', 0),
       (5565, 'steam:110000103e4adf1', 'chips2', 0),
       (5566, 'steam:110000103e4adf1', 'cheesebows', 0),
       (5567, 'steam:110000103e4adf1', 'fishstix', 0),
       (5568, 'steam:110000103e4adf1', 'donut2', 0),
       (5569, 'steam:110000103e4adf1', 'orange', 0),
       (5570, 'steam:110000103e4adf1', 'cocaleaf', 0),
       (5571, 'steam:110000103e4adf1', 'petrol_raffin', 0),
       (5572, 'steam:110000103e4adf1', 'shirt', 0),
       (5573, 'steam:110000103e4adf1', 'grip', 0),
       (5574, 'steam:110000103e4adf1', 'candy', 0),
       (5575, 'steam:110000103e4adf1', 'cutted_wood', 0),
       (5576, 'steam:110000103e4adf1', 'jus_raisin', 0),
       (5577, 'steam:110000103e4adf1', 'chips3', 0),
       (5578, 'steam:110000103e4adf1', 'lotteryticket', 0),
       (5579, 'steam:110000103e4adf1', 'c4_bank', 0),
       (5580, 'steam:110000103e4adf1', 'hotsauce', 0),
       (5581, 'steam:110000103e4adf1', 'gazbottle', 0),
       (5582, 'steam:110000103e4adf1', 'cocacola', 0),
       (5583, 'steam:110000103e4adf1', 'cigarette3', 0),
       (5584, 'steam:110000103e4adf1', 'coupon4', 0),
       (5585, 'steam:110000103e4adf1', 'coupon2', 0),
       (5586, 'steam:110000102d2e853', 'donut2', 0),
       (5587, 'steam:110000104333f98', 'donut2', 0),
       (5588, 'Char1:1100001114b4a38', 'torpedo', 0),
       (5589, 'Char1:1100001114b4a38', 'cannabis', 0),
       (5590, 'Char1:1100001114b4a38', 'apple', 0),
       (5591, 'Char1:1100001114b4a38', 'methlab', 0),
       (5592, 'Char1:1100001114b4a38', 'cocaine', 0),
       (5593, 'Char1:1100001114b4a38', 'lockpick', 0),
       (5594, 'Char1:1100001114b4a38', 'shoes', 0),
       (5595, 'Char1:1100001114b4a38', 'jewels', 0),
       (5596, 'Char1:1100001114b4a38', 'sprite', 0),
       (5597, 'Char1:1100001114b4a38', 'xanax', 0),
       (5598, 'Char1:1100001114b4a38', 'flashlight', 0),
       (5599, 'Char1:1100001114b4a38', 'lotteryticket', 0),
       (5600, 'Char1:1100001114b4a38', 'patches', 0),
       (5601, 'Char1:1100001114b4a38', 'cigarette4', 0),
       (5602, 'Char1:1100001114b4a38', 'donut', 0),
       (5603, 'Char1:1100001114b4a38', 'cutted_wood', 0),
       (5604, 'Char1:1100001114b4a38', 'hotsauce', 0),
       (5605, 'Char1:1100001114b4a38', 'pizza', 0),
       (5606, 'Char1:1100001114b4a38', 'raspberry', 0),
       (5607, 'Char1:1100001114b4a38', 'wood', 0),
       (5608, 'Char1:1100001114b4a38', 'donut2', 0),
       (5609, 'Char1:1100001114b4a38', 'candy5', 0),
       (5610, 'Char1:1100001114b4a38', 'popsicle5', 0),
       (5611, 'Char1:1100001114b4a38', 'grip', 0),
       (5612, 'Char1:1100001114b4a38', 'medikit', 0),
       (5613, 'Char1:1100001114b4a38', 'cheesebows', 0),
       (5614, 'Char1:1100001114b4a38', 'crappy', 0),
       (5615, 'Char1:1100001114b4a38', 'gold', 0),
       (5616, 'Char1:1100001114b4a38', 'gazbottle', 0),
       (5617, 'Char1:1100001114b4a38', 'coke_pooch', 0),
       (5618, 'Char1:1100001114b4a38', 'maxpads', 0),
       (5619, 'Char1:1100001114b4a38', 'grand_cru', 0),
       (5620, 'Char1:1100001114b4a38', 'bleeder', 0),
       (5621, 'Char1:1100001114b4a38', 'coupon', 0),
       (5622, 'Char1:1100001114b4a38', 'iron', 0),
       (5623, 'Char1:1100001114b4a38', 'yusuf', 0),
       (5624, 'Char1:1100001114b4a38', 'packaged_plank', 0),
       (5625, 'Char1:1100001114b4a38', 'cigarette6', 0),
       (5626, 'Char1:1100001114b4a38', 'fabric', 0),
       (5627, 'Char1:1100001114b4a38', 'candy3', 0),
       (5628, 'Char1:1100001114b4a38', 'chips3', 0),
       (5629, 'Char1:1100001114b4a38', 'chips', 0),
       (5630, 'Char1:1100001114b4a38', 'fixtool', 0),
       (5631, 'Char1:1100001114b4a38', 'vicodin', 0),
       (5632, 'Char1:1100001114b4a38', 'orange', 0),
       (5633, 'Char1:1100001114b4a38', 'largecola', 0),
       (5634, 'Char1:1100001114b4a38', 'petrol', 0),
       (5635, 'Char1:1100001114b4a38', 'candy2', 0),
       (5636, 'Char1:1100001114b4a38', 'lighter', 0),
       (5637, 'Char1:1100001114b4a38', 'bleach', 0),
       (5638, 'Char1:1100001114b4a38', 'meatfree', 0),
       (5639, 'Char1:1100001114b4a38', 'carotool', 0),
       (5640, 'Char1:1100001114b4a38', 'bread', 0),
       (5641, 'Char1:1100001114b4a38', 'vine', 0),
       (5642, 'Char1:1100001114b4a38', 'alive_chicken', 0),
       (5643, 'Char1:1100001114b4a38', 'c4_bank', 0),
       (5644, 'Char1:1100001114b4a38', 'blowpipe', 0),
       (5645, 'Char1:1100001114b4a38', 'raisin', 0),
       (5646, 'Char1:1100001114b4a38', 'stone', 0),
       (5647, 'Char1:1100001114b4a38', 'cigarette5', 0),
       (5648, 'Char1:1100001114b4a38', 'cigarette2', 0),
       (5649, 'Char1:1100001114b4a38', 'candy4', 0),
       (5650, 'Char1:1100001114b4a38', 'cigarette', 0),
       (5651, 'Char1:1100001114b4a38', 'popsicle', 0),
       (5652, 'Char1:1100001114b4a38', 'fish', 0),
       (5653, 'Char1:1100001114b4a38', 'clothe', 0),
       (5654, 'Char1:1100001114b4a38', 'noodles2', 0),
       (5655, 'Char1:1100001114b4a38', 'carokit', 0),
       (5656, 'Char1:1100001114b4a38', 'copper', 0),
       (5657, 'Char1:1100001114b4a38', 'coupon3', 0),
       (5658, 'Char1:1100001114b4a38', 'cocacola', 0),
       (5659, 'Char1:1100001114b4a38', 'toothpaste', 0),
       (5660, 'Char1:1100001114b4a38', 'wool', 0),
       (5661, 'Char1:1100001114b4a38', 'lithium', 0),
       (5662, 'Char1:1100001114b4a38', 'pastacarbonara', 0),
       (5663, 'Char1:1100001114b4a38', 'popsicle2', 0),
       (5664, 'Char1:1100001114b4a38', 'acetone', 0),
       (5665, 'Char1:1100001114b4a38', 'macka', 0),
       (5666, 'Char1:1100001114b4a38', 'sprite2', 0),
       (5667, 'Char1:1100001114b4a38', 'marijuana', 0),
       (5668, 'Char1:1100001114b4a38', 'fishstix', 0),
       (5669, 'Char1:1100001114b4a38', 'essence', 0),
       (5670, 'Char1:1100001114b4a38', 'candy', 0),
       (5671, 'Char1:1100001114b4a38', 'loka', 0),
       (5672, 'Char1:1100001114b4a38', 'hat', 0),
       (5673, 'Char1:1100001114b4a38', 'chips2', 0),
       (5674, 'Char1:1100001114b4a38', 'egg', 0),
       (5675, 'Char1:1100001114b4a38', 'book', 0),
       (5676, 'Char1:1100001114b4a38', 'blowtorch', 0),
       (5677, 'Char1:1100001114b4a38', 'largesprunk', 0),
       (5678, 'Char1:1100001114b4a38', 'soup2', 0),
       (5679, 'Char1:1100001114b4a38', 'packaged_chicken', 0),
       (5680, 'Char1:1100001114b4a38', 'cereal', 0),
       (5681, 'Char1:1100001114b4a38', 'cocaleaf', 0),
       (5682, 'Char1:1100001114b4a38', 'burger', 0),
       (5683, 'Char1:1100001114b4a38', 'fries', 0),
       (5684, 'Char1:1100001114b4a38', 'medkit', 0),
       (5685, 'Char1:1100001114b4a38', 'laptop', 0),
       (5686, 'Char1:1100001114b4a38', 'gauze', 0),
       (5687, 'Char1:1100001114b4a38', 'metal', 0),
       (5688, 'Char1:1100001114b4a38', 'hydrocodone', 0),
       (5689, 'Char1:1100001114b4a38', 'fixkit', 0),
       (5690, 'Char1:1100001114b4a38', 'diamond', 0),
       (5691, 'Char1:1100001114b4a38', 'speaker', 0),
       (5692, 'Char1:1100001114b4a38', 'washed_stone', 0),
       (5693, 'Char1:1100001114b4a38', 'soup', 0),
       (5694, 'Char1:1100001114b4a38', 'slushy2', 0),
       (5695, 'Char1:1100001114b4a38', 'meth', 0),
       (5696, 'Char1:1100001114b4a38', 'slaughtered_chicken', 0),
       (5697, 'Char1:1100001114b4a38', 'firstaid', 0),
       (5698, 'Char1:1100001114b4a38', 'silencieux', 0),
       (5699, 'Char1:1100001114b4a38', 'milk', 0),
       (5700, 'Char1:1100001114b4a38', 'coupon2', 0),
       (5701, 'Char1:1100001114b4a38', 'pineapple', 0),
       (5702, 'Char1:1100001114b4a38', 'saffron', 0),
       (5703, 'Char1:1100001114b4a38', 'pear', 0),
       (5704, 'Char1:1100001114b4a38', 'moneyshot', 0),
       (5705, 'Char1:1100001114b4a38', 'coupon4', 0),
       (5706, 'Char1:1100001114b4a38', 'water', 0),
       (5707, 'Char1:1100001114b4a38', 'fanta', 0),
       (5708, 'Char1:1100001114b4a38', 'banana', 0),
       (5709, 'Char1:1100001114b4a38', 'jus_raisin', 0),
       (5710, 'Char1:1100001114b4a38', 'popsicle3', 0),
       (5711, 'Char1:1100001114b4a38', 'marabou', 0),
       (5712, 'Char1:1100001114b4a38', 'heartstopper', 0),
       (5713, 'Char1:1100001114b4a38', 'morphine', 0),
       (5714, 'Char1:1100001114b4a38', 'petrol_raffin', 0),
       (5715, 'Char1:1100001114b4a38', 'pants', 0),
       (5716, 'Char1:1100001114b4a38', 'popsicle4', 0),
       (5717, 'Char1:1100001114b4a38', 'shirt', 0),
       (5718, 'Char1:1100001114b4a38', 'cigarette3', 0),
       (5719, 'Char1:1100001114b4a38', 'bandage', 0),
       (5720, 'Char1:1100001114b4a38', 'noodles', 0),
       (5721, 'Char1:1100001114b4a38', 'slushy', 0),
       (5722, 'steam:110000104ab4ae4', 'patches', 0),
       (5723, 'steam:110000104ab4ae4', 'donut', 0),
       (5724, 'steam:110000104ab4ae4', 'torpedo', 0),
       (5725, 'steam:110000104ab4ae4', 'apple', 0),
       (5726, 'steam:110000104ab4ae4', 'cigarette4', 0),
       (5727, 'steam:110000104ab4ae4', 'donut2', 0),
       (5728, 'steam:110000104ab4ae4', 'crappy', 0),
       (5729, 'steam:110000104ab4ae4', 'popsicle5', 0),
       (5730, 'steam:110000104ab4ae4', 'hotsauce', 0),
       (5731, 'steam:110000104ab4ae4', 'candy5', 0),
       (5732, 'steam:110000104ab4ae4', 'maxpads', 0),
       (5733, 'steam:110000104ab4ae4', 'bleeder', 0),
       (5734, 'steam:110000104ab4ae4', 'cigarette6', 0),
       (5735, 'steam:110000104ab4ae4', 'candy3', 0),
       (5736, 'steam:110000104ab4ae4', 'chips3', 0),
       (5737, 'steam:110000104ab4ae4', 'orange', 0),
       (5738, 'steam:110000104ab4ae4', 'bleach', 0),
       (5739, 'steam:110000104ab4ae4', 'meatfree', 0),
       (5740, 'steam:110000104ab4ae4', 'candy2', 0),
       (5741, 'steam:110000104ab4ae4', 'largecola', 0),
       (5742, 'steam:110000104ab4ae4', 'candy4', 0),
       (5743, 'steam:110000104ab4ae4', 'popsicle', 0),
       (5744, 'steam:110000104ab4ae4', 'cigarette5', 0),
       (5745, 'steam:110000104ab4ae4', 'noodles2', 0),
       (5746, 'steam:110000104ab4ae4', 'cigarette2', 0),
       (5747, 'steam:110000104ab4ae4', 'coupon3', 0),
       (5748, 'steam:110000104ab4ae4', 'popsicle2', 0),
       (5749, 'steam:110000104ab4ae4', 'sprite2', 0),
       (5750, 'steam:110000104ab4ae4', 'fishstix', 0),
       (5751, 'steam:110000104ab4ae4', 'candy', 0),
       (5752, 'steam:110000104ab4ae4', 'soup2', 0),
       (5753, 'steam:110000104ab4ae4', 'largesprunk', 0),
       (5754, 'steam:110000104ab4ae4', 'egg', 0),
       (5755, 'steam:110000104ab4ae4', 'cereal', 0),
       (5756, 'steam:110000104ab4ae4', 'chips2', 0),
       (5757, 'steam:110000104ab4ae4', 'soup', 0),
       (5758, 'steam:110000104ab4ae4', 'coupon2', 0),
       (5759, 'steam:110000104ab4ae4', 'milk', 0),
       (5760, 'steam:110000104ab4ae4', 'slushy2', 0),
       (5761, 'steam:110000104ab4ae4', 'fries', 0),
       (5762, 'steam:110000104ab4ae4', 'pineapple', 0),
       (5763, 'steam:110000104ab4ae4', 'coupon4', 0),
       (5764, 'steam:110000104ab4ae4', 'banana', 0),
       (5765, 'steam:110000104ab4ae4', 'moneyshot', 0),
       (5766, 'steam:110000104ab4ae4', 'pear', 0),
       (5767, 'steam:110000104ab4ae4', 'cigarette3', 0),
       (5768, 'steam:110000104ab4ae4', 'popsicle3', 0),
       (5769, 'steam:110000104ab4ae4', 'noodles', 0),
       (5770, 'steam:110000104ab4ae4', 'heartstopper', 0),
       (5771, 'steam:110000104ab4ae4', 'popsicle4', 0),
       (5772, 'steam:110000104ab4ae4', 'slushy', 0),
       (5773, 'Char2:1100001114b4a38', 'apple', 0),
       (5774, 'Char2:1100001114b4a38', 'cocaine', 0),
       (5775, 'Char2:1100001114b4a38', 'cannabis', 0),
       (5776, 'Char2:1100001114b4a38', 'torpedo', 0),
       (5777, 'Char2:1100001114b4a38', 'methlab', 0),
       (5778, 'Char2:1100001114b4a38', 'shoes', 0),
       (5779, 'Char2:1100001114b4a38', 'sprite', 0),
       (5780, 'Char2:1100001114b4a38', 'lockpick', 0),
       (5781, 'Char2:1100001114b4a38', 'jewels', 0),
       (5782, 'Char2:1100001114b4a38', 'xanax', 0),
       (5783, 'Char2:1100001114b4a38', 'lotteryticket', 0),
       (5784, 'Char2:1100001114b4a38', 'patches', 0),
       (5785, 'Char2:1100001114b4a38', 'donut', 0),
       (5786, 'Char2:1100001114b4a38', 'flashlight', 0),
       (5787, 'Char2:1100001114b4a38', 'cigarette4', 0),
       (5788, 'Char2:1100001114b4a38', 'wood', 0),
       (5789, 'Char2:1100001114b4a38', 'raspberry', 0),
       (5790, 'Char2:1100001114b4a38', 'hotsauce', 0),
       (5791, 'Char2:1100001114b4a38', 'pizza', 0),
       (5792, 'Char2:1100001114b4a38', 'cutted_wood', 0),
       (5793, 'Char2:1100001114b4a38', 'candy5', 0),
       (5794, 'Char2:1100001114b4a38', 'medikit', 0),
       (5795, 'Char2:1100001114b4a38', 'popsicle5', 0),
       (5796, 'Char2:1100001114b4a38', 'donut2', 0),
       (5797, 'Char2:1100001114b4a38', 'grip', 0),
       (5798, 'Char2:1100001114b4a38', 'gold', 0),
       (5799, 'Char2:1100001114b4a38', 'crappy', 0),
       (5800, 'Char2:1100001114b4a38', 'cheesebows', 0),
       (5801, 'Char2:1100001114b4a38', 'gazbottle', 0),
       (5802, 'Char2:1100001114b4a38', 'coke_pooch', 0),
       (5803, 'Char2:1100001114b4a38', 'grand_cru', 0),
       (5804, 'Char2:1100001114b4a38', 'coupon', 0),
       (5805, 'Char2:1100001114b4a38', 'bleeder', 0),
       (5806, 'Char2:1100001114b4a38', 'iron', 0),
       (5807, 'Char2:1100001114b4a38', 'maxpads', 0),
       (5808, 'Char2:1100001114b4a38', 'packaged_plank', 0),
       (5809, 'Char2:1100001114b4a38', 'cigarette6', 0),
       (5810, 'Char2:1100001114b4a38', 'yusuf', 0),
       (5811, 'Char2:1100001114b4a38', 'fabric', 0),
       (5812, 'Char2:1100001114b4a38', 'candy3', 0),
       (5813, 'Char2:1100001114b4a38', 'chips3', 0),
       (5814, 'Char2:1100001114b4a38', 'chips', 0),
       (5815, 'Char2:1100001114b4a38', 'fixtool', 0),
       (5816, 'Char2:1100001114b4a38', 'orange', 0),
       (5817, 'Char2:1100001114b4a38', 'vicodin', 0),
       (5818, 'Char2:1100001114b4a38', 'petrol', 0),
       (5819, 'Char2:1100001114b4a38', 'candy2', 0),
       (5820, 'Char2:1100001114b4a38', 'lighter', 0),
       (5821, 'Char2:1100001114b4a38', 'largecola', 0),
       (5822, 'Char2:1100001114b4a38', 'bleach', 0),
       (5823, 'Char2:1100001114b4a38', 'bread', 0),
       (5824, 'Char2:1100001114b4a38', 'vine', 0),
       (5825, 'Char2:1100001114b4a38', 'carotool', 0),
       (5826, 'Char2:1100001114b4a38', 'alive_chicken', 0),
       (5827, 'Char2:1100001114b4a38', 'meatfree', 0),
       (5828, 'Char2:1100001114b4a38', 'raisin', 0),
       (5829, 'Char2:1100001114b4a38', 'c4_bank', 0),
       (5830, 'Char2:1100001114b4a38', 'cigarette5', 0),
       (5831, 'Char2:1100001114b4a38', 'stone', 0),
       (5832, 'Char2:1100001114b4a38', 'blowpipe', 0),
       (5833, 'Char2:1100001114b4a38', 'popsicle', 0),
       (5834, 'Char2:1100001114b4a38', 'cigarette2', 0),
       (5835, 'Char2:1100001114b4a38', 'cigarette', 0),
       (5836, 'Char2:1100001114b4a38', 'fish', 0),
       (5837, 'Char2:1100001114b4a38', 'candy4', 0),
       (5838, 'Char2:1100001114b4a38', 'clothe', 0),
       (5839, 'Char2:1100001114b4a38', 'noodles2', 0),
       (5840, 'Char2:1100001114b4a38', 'copper', 0),
       (5841, 'Char2:1100001114b4a38', 'carokit', 0),
       (5842, 'Char2:1100001114b4a38', 'coupon3', 0),
       (5843, 'Char2:1100001114b4a38', 'cocacola', 0),
       (5844, 'Char2:1100001114b4a38', 'lithium', 0),
       (5845, 'Char2:1100001114b4a38', 'wool', 0),
       (5846, 'Char2:1100001114b4a38', 'pastacarbonara', 0),
       (5847, 'Char2:1100001114b4a38', 'toothpaste', 0),
       (5848, 'Char2:1100001114b4a38', 'marijuana', 0),
       (5849, 'Char2:1100001114b4a38', 'macka', 0),
       (5850, 'Char2:1100001114b4a38', 'sprite2', 0),
       (5851, 'Char2:1100001114b4a38', 'popsicle2', 0),
       (5852, 'Char2:1100001114b4a38', 'acetone', 0),
       (5853, 'Char2:1100001114b4a38', 'fishstix', 0),
       (5854, 'Char2:1100001114b4a38', 'hat', 0),
       (5855, 'Char2:1100001114b4a38', 'loka', 0),
       (5856, 'Char2:1100001114b4a38', 'essence', 0),
       (5857, 'Char2:1100001114b4a38', 'candy', 0),
       (5858, 'Char2:1100001114b4a38', 'chips2', 0),
       (5859, 'Char2:1100001114b4a38', 'egg', 0),
       (5860, 'Char2:1100001114b4a38', 'largesprunk', 0),
       (5861, 'Char2:1100001114b4a38', 'blowtorch', 0),
       (5862, 'Char2:1100001114b4a38', 'book', 0),
       (5863, 'Char2:1100001114b4a38', 'cereal', 0),
       (5864, 'Char2:1100001114b4a38', 'packaged_chicken', 0),
       (5865, 'Char2:1100001114b4a38', 'cocaleaf', 0),
       (5866, 'Char2:1100001114b4a38', 'soup2', 0),
       (5867, 'Char2:1100001114b4a38', 'fries', 0),
       (5868, 'Char2:1100001114b4a38', 'medkit', 0),
       (5869, 'Char2:1100001114b4a38', 'laptop', 0),
       (5870, 'Char2:1100001114b4a38', 'hydrocodone', 0),
       (5871, 'Char2:1100001114b4a38', 'gauze', 0),
       (5872, 'Char2:1100001114b4a38', 'burger', 0),
       (5873, 'Char2:1100001114b4a38', 'speaker', 0),
       (5874, 'Char2:1100001114b4a38', 'diamond', 0),
       (5875, 'Char2:1100001114b4a38', 'washed_stone', 0),
       (5876, 'Char2:1100001114b4a38', 'metal', 0),
       (5877, 'Char2:1100001114b4a38', 'fixkit', 0),
       (5878, 'Char2:1100001114b4a38', 'silencieux', 0),
       (5879, 'Char2:1100001114b4a38', 'slaughtered_chicken', 0),
       (5880, 'Char2:1100001114b4a38', 'meth', 0),
       (5881, 'Char2:1100001114b4a38', 'soup', 0),
       (5882, 'Char2:1100001114b4a38', 'slushy2', 0),
       (5883, 'Char2:1100001114b4a38', 'firstaid', 0),
       (5884, 'Char2:1100001114b4a38', 'pineapple', 0),
       (5885, 'Char2:1100001114b4a38', 'pear', 0),
       (5886, 'Char2:1100001114b4a38', 'milk', 0),
       (5887, 'Char2:1100001114b4a38', 'coupon2', 0),
       (5888, 'Char2:1100001114b4a38', 'moneyshot', 0),
       (5889, 'Char2:1100001114b4a38', 'coupon4', 0),
       (5890, 'Char2:1100001114b4a38', 'saffron', 0),
       (5891, 'Char2:1100001114b4a38', 'water', 0),
       (5892, 'Char2:1100001114b4a38', 'banana', 0),
       (5893, 'Char2:1100001114b4a38', 'jus_raisin', 0),
       (5894, 'Char2:1100001114b4a38', 'popsicle3', 0),
       (5895, 'Char2:1100001114b4a38', 'petrol_raffin', 0),
       (5896, 'Char2:1100001114b4a38', 'fanta', 0),
       (5897, 'Char2:1100001114b4a38', 'marabou', 0),
       (5898, 'Char2:1100001114b4a38', 'morphine', 0),
       (5899, 'Char2:1100001114b4a38', 'popsicle4', 0),
       (5900, 'Char2:1100001114b4a38', 'pants', 0),
       (5901, 'Char2:1100001114b4a38', 'cigarette3', 0),
       (5902, 'Char2:1100001114b4a38', 'heartstopper', 0),
       (5903, 'Char2:1100001114b4a38', 'shirt', 0),
       (5904, 'Char2:1100001114b4a38', 'slushy', 0),
       (5905, 'Char2:1100001114b4a38', 'bandage', 0),
       (5906, 'Char2:1100001114b4a38', 'noodles', 0),
       (5907, 'steam:1100001114b4a38', 'cocaine', 0),
       (5908, 'steam:1100001114b4a38', 'apple', 0),
       (5909, 'steam:1100001114b4a38', 'cannabis', 0),
       (5910, 'steam:1100001114b4a38', 'torpedo', 0),
       (5911, 'steam:1100001114b4a38', 'methlab', 0),
       (5912, 'steam:1100001114b4a38', 'jewels', 0),
       (5913, 'steam:1100001114b4a38', 'shoes', 0),
       (5914, 'steam:1100001114b4a38', 'lockpick', 0),
       (5915, 'steam:1100001114b4a38', 'xanax', 0),
       (5916, 'steam:1100001114b4a38', 'sprite', 0),
       (5917, 'steam:1100001114b4a38', 'donut', 0),
       (5918, 'steam:1100001114b4a38', 'lotteryticket', 0),
       (5919, 'steam:1100001114b4a38', 'patches', 0),
       (5920, 'steam:1100001114b4a38', 'flashlight', 0),
       (5921, 'steam:1100001114b4a38', 'cigarette4', 0),
       (5922, 'steam:1100001114b4a38', 'pizza', 0),
       (5923, 'steam:1100001114b4a38', 'wood', 0),
       (5924, 'steam:1100001114b4a38', 'hotsauce', 0),
       (5925, 'steam:1100001114b4a38', 'raspberry', 0),
       (5926, 'steam:1100001114b4a38', 'cutted_wood', 0),
       (5927, 'steam:1100001114b4a38', 'candy5', 0),
       (5928, 'steam:1100001114b4a38', 'popsicle5', 0),
       (5929, 'steam:1100001114b4a38', 'grip', 0),
       (5930, 'steam:1100001114b4a38', 'medikit', 0),
       (5931, 'steam:1100001114b4a38', 'donut2', 0),
       (5932, 'steam:1100001114b4a38', 'cheesebows', 0),
       (5933, 'steam:1100001114b4a38', 'coke_pooch', 0),
       (5934, 'steam:1100001114b4a38', 'crappy', 0),
       (5935, 'steam:1100001114b4a38', 'gazbottle', 0),
       (5936, 'steam:1100001114b4a38', 'gold', 0),
       (5937, 'steam:1100001114b4a38', 'bleeder', 0),
       (5938, 'steam:1100001114b4a38', 'grand_cru', 0),
       (5939, 'steam:1100001114b4a38', 'maxpads', 0),
       (5940, 'steam:1100001114b4a38', 'coupon', 0),
       (5941, 'steam:1100001114b4a38', 'iron', 0),
       (5942, 'steam:1100001114b4a38', 'packaged_plank', 0),
       (5943, 'steam:1100001114b4a38', 'cigarette6', 0),
       (5944, 'steam:1100001114b4a38', 'candy3', 0),
       (5945, 'steam:1100001114b4a38', 'yusuf', 0),
       (5946, 'steam:1100001114b4a38', 'fabric', 0),
       (5947, 'steam:1100001114b4a38', 'vicodin', 0),
       (5948, 'steam:1100001114b4a38', 'fixtool', 0),
       (5949, 'steam:1100001114b4a38', 'orange', 0),
       (5950, 'steam:1100001114b4a38', 'chips3', 0),
       (5951, 'steam:1100001114b4a38', 'chips', 0),
       (5952, 'steam:1100001114b4a38', 'candy2', 0),
       (5953, 'steam:1100001114b4a38', 'lighter', 0),
       (5954, 'steam:1100001114b4a38', 'petrol', 0),
       (5955, 'steam:1100001114b4a38', 'largecola', 0),
       (5956, 'steam:1100001114b4a38', 'bleach', 0),
       (5957, 'steam:1100001114b4a38', 'alive_chicken', 0),
       (5958, 'steam:1100001114b4a38', 'vine', 0),
       (5959, 'steam:1100001114b4a38', 'bread', 0),
       (5960, 'steam:1100001114b4a38', 'carotool', 0),
       (5961, 'steam:1100001114b4a38', 'meatfree', 0),
       (5962, 'steam:1100001114b4a38', 'cigarette5', 0),
       (5963, 'steam:1100001114b4a38', 'stone', 0),
       (5964, 'steam:1100001114b4a38', 'c4_bank', 0),
       (5965, 'steam:1100001114b4a38', 'raisin', 0),
       (5966, 'steam:1100001114b4a38', 'blowpipe', 0),
       (5967, 'steam:1100001114b4a38', 'cigarette2', 0),
       (5968, 'steam:1100001114b4a38', 'cigarette', 0),
       (5969, 'steam:1100001114b4a38', 'popsicle', 0),
       (5970, 'steam:1100001114b4a38', 'fish', 0),
       (5971, 'steam:1100001114b4a38', 'candy4', 0),
       (5972, 'steam:1100001114b4a38', 'coupon3', 0),
       (5973, 'steam:1100001114b4a38', 'carokit', 0),
       (5974, 'steam:1100001114b4a38', 'clothe', 0),
       (5975, 'steam:1100001114b4a38', 'noodles2', 0),
       (5976, 'steam:1100001114b4a38', 'copper', 0),
       (5977, 'steam:1100001114b4a38', 'wool', 0),
       (5978, 'steam:1100001114b4a38', 'cocacola', 0),
       (5979, 'steam:1100001114b4a38', 'lithium', 0),
       (5980, 'steam:1100001114b4a38', 'toothpaste', 0),
       (5981, 'steam:1100001114b4a38', 'pastacarbonara', 0),
       (5982, 'steam:1100001114b4a38', 'marijuana', 0),
       (5983, 'steam:1100001114b4a38', 'macka', 0),
       (5984, 'steam:1100001114b4a38', 'acetone', 0),
       (5985, 'steam:1100001114b4a38', 'popsicle2', 0),
       (5986, 'steam:1100001114b4a38', 'sprite2', 0),
       (5987, 'steam:1100001114b4a38', 'candy', 0),
       (5988, 'steam:1100001114b4a38', 'fishstix', 0),
       (5989, 'steam:1100001114b4a38', 'essence', 0),
       (5990, 'steam:1100001114b4a38', 'loka', 0),
       (5991, 'steam:1100001114b4a38', 'hat', 0),
       (5992, 'steam:1100001114b4a38', 'egg', 0),
       (5993, 'steam:1100001114b4a38', 'book', 0),
       (5994, 'steam:1100001114b4a38', 'largesprunk', 0),
       (5995, 'steam:1100001114b4a38', 'chips2', 0),
       (5996, 'steam:1100001114b4a38', 'blowtorch', 0),
       (5997, 'steam:1100001114b4a38', 'fries', 0),
       (5998, 'steam:1100001114b4a38', 'cereal', 0),
       (5999, 'steam:1100001114b4a38', 'soup2', 0),
       (6000, 'steam:1100001114b4a38', 'packaged_chicken', 0),
       (6001, 'steam:1100001114b4a38', 'cocaleaf', 0);
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`)
VALUES (6002, 'steam:1100001114b4a38', 'medkit', 0),
       (6003, 'steam:1100001114b4a38', 'hydrocodone', 0),
       (6004, 'steam:1100001114b4a38', 'laptop', 0),
       (6005, 'steam:1100001114b4a38', 'burger', 0),
       (6006, 'steam:1100001114b4a38', 'gauze', 0),
       (6007, 'steam:1100001114b4a38', 'metal', 0),
       (6008, 'steam:1100001114b4a38', 'washed_stone', 0),
       (6009, 'steam:1100001114b4a38', 'speaker', 0),
       (6010, 'steam:1100001114b4a38', 'diamond', 0),
       (6011, 'steam:1100001114b4a38', 'fixkit', 0),
       (6012, 'steam:1100001114b4a38', 'slaughtered_chicken', 0),
       (6013, 'steam:1100001114b4a38', 'meth', 0),
       (6014, 'steam:1100001114b4a38', 'slushy2', 0),
       (6015, 'steam:1100001114b4a38', 'silencieux', 0),
       (6016, 'steam:1100001114b4a38', 'soup', 0),
       (6017, 'steam:1100001114b4a38', 'firstaid', 0),
       (6018, 'steam:1100001114b4a38', 'pineapple', 0),
       (6019, 'steam:1100001114b4a38', 'coupon2', 0),
       (6020, 'steam:1100001114b4a38', 'milk', 0),
       (6021, 'steam:1100001114b4a38', 'pear', 0),
       (6022, 'steam:1100001114b4a38', 'water', 0),
       (6023, 'steam:1100001114b4a38', 'saffron', 0),
       (6024, 'steam:1100001114b4a38', 'banana', 0),
       (6025, 'steam:1100001114b4a38', 'coupon4', 0),
       (6026, 'steam:1100001114b4a38', 'moneyshot', 0),
       (6027, 'steam:1100001114b4a38', 'popsicle3', 0),
       (6028, 'steam:1100001114b4a38', 'petrol_raffin', 0),
       (6029, 'steam:1100001114b4a38', 'jus_raisin', 0),
       (6030, 'steam:1100001114b4a38', 'marabou', 0),
       (6031, 'steam:1100001114b4a38', 'fanta', 0),
       (6032, 'steam:1100001114b4a38', 'morphine', 0),
       (6033, 'steam:1100001114b4a38', 'pants', 0),
       (6034, 'steam:1100001114b4a38', 'cigarette3', 0),
       (6035, 'steam:1100001114b4a38', 'heartstopper', 0),
       (6036, 'steam:1100001114b4a38', 'popsicle4', 0),
       (6037, 'steam:1100001114b4a38', 'bandage', 0),
       (6038, 'steam:1100001114b4a38', 'slushy', 0),
       (6039, 'steam:1100001114b4a38', 'shirt', 0),
       (6040, 'steam:1100001114b4a38', 'noodles', 0),
       (6041, 'steam:11000010079e29a', 'electronics', 0),
       (6042, 'steam:11000010079e29a', 'plastic', 0),
       (6043, 'steam:11000010079e29a', 'clay', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_lastcharacter`
--

CREATE TABLE `user_lastcharacter`
(
    `steamid` varchar(255) NOT NULL,
    `charid`  int(11)      NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `latin1`;

--
-- Dumping data for table `user_lastcharacter`
--

INSERT INTO `user_lastcharacter` (`steamid`, `charid`)
VALUES ('steam:110000102d2e853', 1),
       ('steam:110000104ab4ae4', 1),
       ('steam:11000010079e29a', 1),
       ('steam:110000104e3efcd', 1),
       ('steam:11000010ec8a88b', 1),
       ('steam:11000010c861bdb', 2),
       ('steam:110000136e4df83', 1),
       ('steam:110000104333f98', 1),
       ('steam:110000103e4adf1', 1),
       ('steam:11000010979381c', 1),
       ('steam:110000108328a4c', 1),
       ('steam:110000105063f4d', 1),
       ('steam:110000105b0d643', 1),
       ('steam:110000106080551', 1),
       ('steam:11000010051bf9a', 1),
       ('steam:11000010aa8b577', 1),
       ('steam:1100001114a1946', 1),
       ('steam:1100001059883bd', 1),
       ('steam:110000103f6f09b', 1),
       ('steam:1100001004c2f59', 1),
       ('steam:1100001114b4a38', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses`
(
    `id`    int(11)                           NOT NULL,
    `type`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `owner` varchar(60) COLLATE `utf8mb4_bin` NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `user_parkings`
--

CREATE TABLE `user_parkings`
(
    `id`         int(11) NOT NULL,
    `identifier` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `garage`     varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `zone`       int(11) NOT NULL,
    `vehicle`    longtext COLLATE `utf8mb4_bin`
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles`
(
    `name`     varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `model`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `price`    int(11)                           NOT NULL,
    `category` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`)
VALUES ('Akuma', 'AKUMA', 65000, 'motorcycles'),
       ('Adder', 'adder', 115000, 'super'),
       ('Alpha', 'alpha', 60000, 'sports'),
       ('Asea', 'asea', 20000, 'sedans'),
       ('Asterope', 'asterope', 30000, 'sedans'),
       ('Autarch', 'autarch', 247000, 'super'),
       ('Avarus', 'avarus', 28500, 'motorcycles'),
       ('Bagger', 'bagger', 20000, 'motorcycles'),
       ('Baller', 'baller2', 34000, 'suvs'),
       ('Baller Sport', 'baller3', 42500, 'suvs'),
       ('Banshee', 'banshee', 57000, 'sports'),
       ('Banshee 900R', 'banshee2', 90000, 'super'),
       ('Bati 801', 'bati', 29000, 'motorcycles'),
       ('Bati 801RR', 'bati2', 29000, 'motorcycles'),
       ('Bestia GTS', 'bestiagts', 59000, 'sports'),
       ('BF400', 'bf400', 22500, 'motorcycles'),
       ('Bf Injection', 'bfinjection', 22000, 'offroad'),
       ('Bifta', 'bifta', 19500, 'offroad'),
       ('Bison', 'bison', 30000, 'vans'),
       ('Blade', 'blade', 56500, 'muscle'),
       ('Blazer', 'blazer', 8000, 'offroad'),
       ('Blazer Sport', 'blazer4', 7500, 'offroad'),
       ('blazer5', 'blazer5', 12000, 'offroad'),
       ('Blista', 'blista', 17750, 'compacts'),
       ('BMX (velo)', 'bmx', 100, 'motorcycles'),
       ('Bobcat XL', 'bobcatxl', 23000, 'vans'),
       ('Brawler', 'brawler', 38500, 'offroad'),
       ('Brioso R/A', 'brioso', 20000, 'compacts'),
       ('Roosevelt', 'btype', 189000, 'sportsclassics'),
       ('Franken Strange', 'btype2', 89500, 'sportsclassics'),
       ('Roosevelt Valor', 'btype3', 200000, 'sportsclassics'),
       ('Buccaneer', 'buccaneer', 58500, 'muscle'),
       ('Buccaneer Rider', 'buccaneer2', 57500, 'muscle'),
       ('Buffalo', 'buffalo', 24000, 'sports'),
       ('Buffalo S', 'buffalo2', 29000, 'sports'),
       ('Bullet', 'bullet', 56000, 'super'),
       ('Burrito', 'burrito3', 44000, 'vans'),
       ('Camper', 'camper', 32000, 'vans'),
       ('Carbonizzare', 'carbonizzare', 57000, 'sports'),
       ('Carbon RS', 'carbonrs', 52000, 'motorcycles'),
       ('Casco', 'casco', 110000, 'sportsclassics'),
       ('Cavalcade\r\n', 'cavalcade', 27500, 'suvs'),
       ('Cavalcade 2', 'cavalcade2', 29250, 'suvs'),
       ('Cheetah', 'cheetah', 233000, 'super'),
       ('Chimera', 'chimera', 38000, 'motorcycles'),
       ('Chino', 'chino', 36500, 'muscle'),
       ('Chino Luxury', 'chino2', 23400, 'muscle'),
       ('Cliffhanger', 'cliffhanger', 37000, 'motorcycles'),
       ('Cognoscenti 55', 'cog55', 36000, 'sedans'),
       ('Cognoscenti Cabrio', 'cogcabrio', 41000, 'coupes'),
       ('Cognoscenti', 'cognoscenti', 36000, 'sedans'),
       ('Comet', 'comet2', 72500, 'sports'),
       ('Comet 5', 'comet5', 92000, 'sports'),
       ('Contender', 'contender', 70000, 'suvs'),
       ('Coquette', 'coquette', 75000, 'sports'),
       ('Coquette Classic', 'coquette2', 129500, 'sportsclassics'),
       ('Coquette BlackFin', 'coquette3', 129500, 'muscle'),
       ('Cruiser (velo)', 'cruiser', 120, 'motorcycles'),
       ('Cyclone', 'cyclone', 99100, 'super'),
       ('Daemon', 'daemon', 13100, 'motorcycles'),
       ('Daemon High', 'daemon2', 22500, 'motorcycles'),
       ('Defiler', 'defiler', 27560, 'motorcycles'),
       ('Diablous+', 'diablous', 40000, 'motorcycles'),
       ('Dilattante', 'dilettante', 5750, 'compacts'),
       ('Dominator', 'dominator', 50000, 'muscle'),
       ('Dominator GTX', 'dominator3', 55000, 'sports'),
       ('Double T', 'double', 55000, 'motorcycles'),
       ('Dubsta', 'dubsta', 49900, 'suvs'),
       ('Dubsta Luxury', 'dubsta2', 34500, 'suvs'),
       ('Dubsta 6x6', 'dubsta3', 49900, 'offroad'),
       ('Dukes', 'dukes', 60000, 'muscle'),
       ('Dune Buggy', 'dune', 15000, 'offroad'),
       ('Elegy', 'elegy2', 41250, 'sports'),
       ('Emperor', 'emperor', 21500, 'sedans'),
       ('Enduro', 'enduro', 15500, 'motorcycles'),
       ('Entity XF', 'entityxf', 99999, 'super'),
       ('Esskey', 'esskey', 4200, 'motorcycles'),
       ('Exemplar', 'exemplar', 37500, 'coupes'),
       ('F620', 'f620', 40000, 'coupes'),
       ('Faction', 'faction', 36500, 'muscle'),
       ('Faction Rider', 'faction2', 27400, 'muscle'),
       ('Faction XL', 'faction3', 33500, 'muscle'),
       ('Faggio', 'faggio', 3000, 'motorcycles'),
       ('Vespa', 'faggio2', 7000, 'motorcycles'),
       ('FCR 2', 'fcr2', 46000, 'motorcycles'),
       ('Felon', 'felon', 36000, 'coupes'),
       ('Felon GT', 'felon2', 41000, 'coupes'),
       ('Feltzer', 'feltzer2', 70000, 'sports'),
       ('Stirling GT', 'feltzer3', 110000, 'sportsclassics'),
       ('Fixter (velo)', 'fixter', 225, 'motorcycles'),
       ('Flash GT', 'flashgt', 105000, 'sports'),
       ('FMJ', 'fmj', 225000, 'super'),
       ('Fhantom', 'fq2', 17000, 'suvs'),
       ('Freecrawler', 'freecrawler', 45000, 'offroad'),
       ('Fugitive', 'fugitive', 30000, 'sedans'),
       ('Furore GT', 'furoregt', 57000, 'sports'),
       ('Fusilade', 'fusilade', 34250, 'sports'),
       ('Futo', 'futo', 22000, 'sports'),
       ('Gargoyle', 'gargoyle', 41500, 'motorcycles'),
       ('Gauntlet', 'gauntlet', 53250, 'muscle'),
       ('GB 200', 'gb200', 104500, 'sports'),
       ('Gang Burrito', 'gburrito', 16000, 'vans'),
       ('Burrito', 'gburrito2', 44000, 'vans'),
       ('Glendale', 'glendale', 20000, 'sedans'),
       ('Granger', 'granger', 37500, 'suvs'),
       ('Gresley', 'gresley', 27550, 'suvs'),
       ('GT 500', 'gt500', 79000, 'sportsclassics'),
       ('Guardian', 'guardian', 25600, 'offroad'),
       ('Hakuchou', 'hakuchou', 62500, 'motorcycles'),
       ('Hakuchou Sport', 'hakuchou2', 39000, 'motorcycles'),
       ('Hermes', 'hermes', 85000, 'muscle'),
       ('Hexer', 'hexer', 15000, 'motorcycles'),
       ('Hotknife', 'hotknife', 42500, 'muscle'),
       ('Huntley S', 'huntley', 33759, 'suvs'),
       ('Hustler', 'hustler', 34500, 'muscle'),
       ('Infernus', 'infernus', 170000, 'super'),
       ('Ingot', 'ingot', 13000, 'sedans'),
       ('Innovation', 'innovation', 27375, 'motorcycles'),
       ('Intruder', 'intruder', 30500, 'sedans'),
       ('Issi', 'issi2', 18500, 'compacts'),
       ('Jackal', 'jackal', 19500, 'coupes'),
       ('Jester', 'jester', 59000, 'sports'),
       ('Jester(Racecar)', 'jester2', 135000, 'sports'),
       ('Journey', 'journey', 7500, 'vans'),
       ('Kamacho', 'kamacho', 54900, 'offroad'),
       ('Khamelion', 'khamelion', 57000, 'sports'),
       ('Kuruma', 'kuruma', 29000, 'sports'),
       ('Landstalker', 'landstalker', 28000, 'suvs'),
       ('Lectro', 'lectro', 253000, 'motorcycles'),
       ('Lurcher', 'lurcher', 45000, 'muscle'),
       ('Lynx', 'lynx', 80000, 'sports'),
       ('Mamba', 'mamba', 123000, 'sports'),
       ('Manana', 'manana', 123000, 'sportsclassics'),
       ('Manchez', 'manchez', 35000, 'motorcycles'),
       ('Massacro', 'massacro', 64000, 'sports'),
       ('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
       ('Mesa', 'mesa', 23000, 'suvs'),
       ('Mesa Trail', 'mesa3', 25000, 'suvs'),
       ('Michelli GT', 'michelli', 92500, 'sportsclassics'),
       ('Minivan', 'minivan', 13750, 'vans'),
       ('Monroe', 'monroe', 65000, 'sportsclassics'),
       ('Moonbeam', 'moonbeam', 18000, 'vans'),
       ('Moonbeam Rider', 'moonbeam2', 17000, 'vans'),
       ('Nemesis', 'nemesis', 28900, 'motorcycles'),
       ('Neon', 'neon', 110000, 'sports'),
       ('Nero Custom', 'nero2', 50000, 'super'),
       ('Nightblade', 'nightblade', 38000, 'motorcycles'),
       ('Nightshade', 'nightshade', 78000, 'muscle'),
       ('9F', 'ninef', 65000, 'sports'),
       ('9F Cabrio', 'ninef2', 88800, 'sports'),
       ('Omnis', 'omnis', 60000, 'sports'),
       ('Oracle', 'oracle', 36000, 'coupes'),
       ('Oracle XS', 'oracle2', 41000, 'coupes'),
       ('Osiris', 'osiris', 215000, 'super'),
       ('Panto', 'panto', 9250, 'compacts'),
       ('Paradise', 'paradise', 14500, 'vans'),
       ('Pariah', 'pariah', 145000, 'sports'),
       ('Patriot', 'patriot', 22000, 'suvs'),
       ('PCJ-600', 'pcj', 22500, 'motorcycles'),
       ('Penumbra', 'penumbra', 24000, 'sports'),
       ('Pfister', 'pfister811', 105000, 'super'),
       ('Phoenix', 'phoenix', 32000, 'muscle'),
       ('Picador', 'picador', 27500, 'muscle'),
       ('Pigalle', 'pigalle', 87000, 'sportsclassics'),
       ('Prairie', 'prairie', 9445, 'compacts'),
       ('Premier', 'premier', 22500, 'sedans'),
       ('Primo', 'primo', 25000, 'sedans'),
       ('Primo Custom', 'primo2', 32500, 'sedans'),
       ('X80 Proto', 'prototipo', 140000, 'super'),
       ('Radius', 'radi', 24000, 'suvs'),
       ('raiden', 'raiden', 36000, 'sports'),
       ('Rapid GT', 'rapidgt', 94000, 'sports'),
       ('Rapid GT Convertible', 'rapidgt2', 99900, 'sports'),
       ('Rapid GT3', 'rapidgt3', 95000, 'sportsclassics'),
       ('Reaper', 'reaper', 97000, 'super'),
       ('Rebel', 'rebel2', 15000, 'offroad'),
       ('Regina', 'regina', 7500, 'sedans'),
       ('Retinue', 'retinue', 91000, 'sportsclassics'),
       ('Rhapsody', 'rhapsody', 13500, 'compacts'),
       ('riata', 'riata', 32500, 'offroad'),
       ('Rocoto', 'rocoto', 35900, 'suvs'),
       ('Ruffian', 'ruffian', 46250, 'motorcycles'),
       ('Ruiner 2', 'ruiner2', 37000, 'muscle'),
       ('Rumpo', 'rumpo', 14500, 'vans'),
       ('Rumpo Trail', 'rumpo3', 54000, 'vans'),
       ('Ruston', 'ruston', 100000, 'sports'),
       ('Sabre Turbo', 'sabregt', 56250, 'muscle'),
       ('Sabre GT', 'sabregt2', 17000, 'muscle'),
       ('Sanchez', 'sanchez', 8000, 'motorcycles'),
       ('Sanchez Sport', 'sanchez2', 50000, 'motorcycles'),
       ('Sanctus', 'sanctus', 50000, 'motorcycles'),
       ('Sandking', 'sandking', 27000, 'offroad'),
       ('Savestra', 'savestra', 67000, 'sportsclassics'),
       ('SC 1', 'sc1', 69000, 'super'),
       ('Schafter', 'schafter2', 25000, 'sedans'),
       ('Schafter V12', 'schafter3', 39500, 'sports'),
       ('Seminole', 'seminole', 26500, 'suvs'),
       ('Sentinel', 'sentinel', 36000, 'coupes'),
       ('Sentinel XS', 'sentinel2', 20500, 'coupes'),
       ('Sentinel3', 'sentinel3', 650000, 'sports'),
       ('Seven 70', 'seven70', 56000, 'sports'),
       ('ETR1', 'sheava', 127000, 'super'),
       ('Shotaro Concept', 'shotaro', 55000, 'motorcycles'),
       ('Slam Van', 'slamvan', 11500, 'muscle'),
       ('Slamvan Custom', 'slamvan3', 94000, 'muscle'),
       ('Sovereign', 'sovereign', 25200, 'motorcycles'),
       ('Stanier', 'stanier', 30000, 'sedans'),
       ('Stinger', 'stinger', 115000, 'sportsclassics'),
       ('Stinger GT', 'stingergt', 120000, 'sportsclassics'),
       ('Stratum', 'stratum', 14500, 'sedans'),
       ('Streiter', 'streiter', 30000, 'sports'),
       ('Stretch', 'stretch', 35000, 'sedans'),
       ('Sultan', 'sultan', 24000, 'sports'),
       ('Sultan RS', 'sultanrs', 56000, 'super'),
       ('Super Diamond', 'superd', 195000, 'sedans'),
       ('Surano', 'surano', 98000, 'sports'),
       ('Surfer', 'surfer', 11000, 'vans'),
       ('Surge', 'surge', 23000, 'sedans'),
       ('T20', 't20', 235000, 'super'),
       ('Taco Truck', 'taco', 50000, 'vans'),
       ('Tailgater', 'tailgater', 33500, 'sedans'),
       ('Tampa', 'tampa', 59000, 'muscle'),
       ('Drift Tampa', 'tampa2', 32500, 'sports'),
       ('Thrust', 'thrust', 48000, 'motorcycles'),
       ('Tornado', 'tornado', 45000, 'sportsclassics'),
       ('Tornado Convertible', 'tornado2', 45000, 'sportsclassics'),
       ('Tornado Custom', 'tornado5', 45000, 'sportsclassics'),
       ('Tri bike (velo)', 'tribike3', 37000, 'motorcycles'),
       ('Trophy Truck', 'trophytruck', 38500, 'offroad'),
       ('Trophy Truck Limited', 'trophytruck2', 45000, 'offroad'),
       ('Tropos', 'tropos', 55820, 'sports'),
       ('Turismo R', 'turismor', 245000, 'super'),
       ('Tyrus', 'tyrus', 200000, 'super'),
       ('Vacca', 'vacca', 75000, 'super'),
       ('Vader', 'vader', 18750, 'motorcycles'),
       ('Verlierer', 'verlierer2', 69500, 'sports'),
       ('Vigero', 'vigero', 57500, 'muscle'),
       ('Vindicator', 'vindicator', 48500, 'motorcycles'),
       ('Virgo', 'virgo', 27500, 'muscle'),
       ('Viseris', 'viseris', 875000, 'sportsclassics'),
       ('Visione', 'visione', 170000, 'super'),
       ('Voltic', 'voltic', 155000, 'super'),
       ('Voodoo', 'voodoo', 7200, 'muscle'),
       ('Vortex', 'vortex', 9800, 'motorcycles'),
       ('Warrener', 'warrener', 33500, 'sedans'),
       ('Washington', 'washington', 32000, 'sedans'),
       ('Windsor', 'windsor', 200000, 'coupes'),
       ('Windsor Drop', 'windsor2', 212000, 'coupes'),
       ('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
       ('XLS', 'xls', 34200, 'suvs'),
       ('Yosemite', 'yosemite', 97500, 'muscle'),
       ('Youga', 'youga', 8900, 'vans'),
       ('Youga Luxury', 'youga2', 8000, 'vans'),
       ('Z190', 'z190', 100500, 'sportsclassics'),
       ('Zentorno', 'zentorno', 239500, 'super'),
       ('Zion', 'zion', 37000, 'coupes'),
       ('Zion Cabrio', 'zion2', 35000, 'coupes'),
       ('Zombie', 'zombiea', 15000, 'motorcycles'),
       ('Zombie Luxuary', 'zombieb', 25600, 'motorcycles'),
       ('Z-Type', 'ztype', 122000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories`
(
    `name`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(60) COLLATE `utf8mb4_bin` NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`)
VALUES ('compacts', 'Compacts'),
       ('coupes', 'Coupés'),
       ('motorcycles', 'Motos'),
       ('muscle', 'Muscle'),
       ('offroad', 'Off Road'),
       ('sedans', 'Sedans'),
       ('sports', 'Sports'),
       ('sportsclassics', 'Sports Classics'),
       ('super', 'Super'),
       ('suvs', 'SUVs'),
       ('vans', 'Vans');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aircrafts`
--
ALTER TABLE `aircrafts`
    ADD PRIMARY KEY (`model`);

--
-- Indexes for table `aircraft_categories`
--
ALTER TABLE `aircraft_categories`
    ADD PRIMARY KEY (`name`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boats`
--
ALTER TABLE `boats`
    ADD PRIMARY KEY (`model`);

--
-- Indexes for table `boat_categories`
--
ALTER TABLE `boat_categories`
    ADD PRIMARY KEY (`name`);

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communityservice`
--
ALTER TABLE `communityservice`
    ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
    ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
    ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_properties`
--
ALTER TABLE `owned_properties`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
    ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `patreon`
--
ALTER TABLE `patreon`
    ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patreon_cars`
--
ALTER TABLE `patreon_cars`
    ADD PRIMARY KEY (`model`);

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
    ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
    ADD PRIMARY KEY (`model`);

--
-- Indexes for table `truck_categories`
--
ALTER TABLE `truck_categories`
    ADD PRIMARY KEY (`name`);

--
-- Indexes for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_inventory`
--
ALTER TABLE `user_inventory`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_parkings`
--
ALTER TABLE `user_parkings`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
    ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
    ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account`
--
ALTER TABLE `addon_account`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 15;
--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 65;
--
-- AUTO_INCREMENT for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 12;
--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;
--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 124;
--
-- AUTO_INCREMENT for table `datastore`
--
ALTER TABLE `datastore`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 7;
--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 33;
--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 157;
--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 98;
--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `owned_properties`
--
ALTER TABLE `owned_properties`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;
--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 80;
--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 333;
--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 14;
--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 110;
--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 7;
--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 66;
--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_inventory`
--
ALTER TABLE `user_inventory`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6044;
--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;
--
-- AUTO_INCREMENT for table `user_parkings`
--
ALTER TABLE `user_parkings`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT = @`OLD_CHARACTER_SET_CLIENT` */;
/*!40101 SET CHARACTER_SET_RESULTS = @`OLD_CHARACTER_SET_RESULTS` */;
/*!40101 SET COLLATION_CONNECTION = @`OLD_COLLATION_CONNECTION` */;
