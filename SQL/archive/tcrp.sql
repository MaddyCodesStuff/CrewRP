CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET `utf8mb4` COLLATE `utf8mb4_bin` */;
USE `essentialmode`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.1.170    Database: essentialmode
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

/*!40101 SET @`OLD_CHARACTER_SET_CLIENT` = @@`CHARACTER_SET_CLIENT` */;
/*!40101 SET @`OLD_CHARACTER_SET_RESULTS` = @@`CHARACTER_SET_RESULTS` */;
/*!40101 SET @`OLD_COLLATION_CONNECTION` = @@`COLLATION_CONNECTION` */;
SET NAMES utf8;
/*!40103 SET @`OLD_TIME_ZONE` = @@`TIME_ZONE` */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @`OLD_UNIQUE_CHECKS` = @@`UNIQUE_CHECKS`, UNIQUE_CHECKS = 0 */;
/*!40014 SET @`OLD_FOREIGN_KEY_CHECKS` = @@`FOREIGN_KEY_CHECKS`, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @`OLD_SQL_MODE` = @@`SQL_MODE`, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @`OLD_SQL_NOTES` = @@`SQL_NOTES`, SQL_NOTES = 0 */;

--
-- Table structure for table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `addon_account`
(
    `id`     int(11)                            NOT NULL AUTO_INCREMENT,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `shared` int(11)                            NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `addon_account`
--

LOCK TABLES `addon_account` WRITE;
/*!40000 ALTER TABLE `addon_account`
    DISABLE KEYS */;
INSERT INTO `addon_account`
VALUES (1, 'society_ambulance', 'Ambulance', 1),
       (2, 'society_ambulance', 'Ambulance', 1),
       (3, 'society_ambulance', 'Ambulance', 1),
       (4, 'caution', 'Caution', 0),
       (5, 'society_police', 'Police', 1),
       (6, 'society_taxi', 'Taxi', 1),
       (7, 'society_cardealer', 'Car Dealer', 1),
       (8, 'society_taxi', 'Taxi', 1),
       (9, 'property_black_money', 'Argent Sale Propriété', 0),
       (10, 'society_realestateagent', 'Real Estate Agent', 1),
       (11, 'society_mecano', 'Mechanic', 1);
/*!40000 ALTER TABLE `addon_account`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `addon_account_data`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `account_name` varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `money`        double  NOT NULL,
    `owner`        varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `addon_account_data`
--

LOCK TABLES `addon_account_data` WRITE;
/*!40000 ALTER TABLE `addon_account_data`
    DISABLE KEYS */;
INSERT INTO `addon_account_data`
VALUES (1, 'society_ambulance', 0, NULL),
       (2, 'society_police', 0, NULL),
       (3, 'society_taxi', 0, NULL),
       (4, 'society_cardealer', 0, NULL),
       (5, 'caution', 0, 'steam:110000102b5c8b8'),
       (6, 'property_black_money', 0, 'steam:110000102b5c8b8'),
       (7, 'society_realestateagent', 0, NULL),
       (8, 'society_mecano', 0, NULL);
/*!40000 ALTER TABLE `addon_account_data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `addon_inventory`
(
    `id`     int(11)                            NOT NULL AUTO_INCREMENT,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `shared` int(11)                            NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `addon_inventory`
--

LOCK TABLES `addon_inventory` WRITE;
/*!40000 ALTER TABLE `addon_inventory`
    DISABLE KEYS */;
INSERT INTO `addon_inventory`
VALUES (1, 'society_ambulance', 'Ambulance', 1),
       (2, 'society_ambulance', 'Ambulance', 1),
       (3, 'society_police', 'Police', 1),
       (4, 'society_taxi', 'Taxi', 1),
       (5, 'society_cardealer', 'Car Dealer', 1),
       (6, 'society_taxi', 'Taxi', 1),
       (7, 'property', 'Property', 0),
       (8, 'society_mecano', 'Mechanic', 1);
/*!40000 ALTER TABLE `addon_inventory`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory_items`
--

DROP TABLE IF EXISTS `addon_inventory_items`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `addon_inventory_items`
(
    `id`             int(11)                            NOT NULL AUTO_INCREMENT,
    `inventory_name` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `name`           varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `count`          int(11)                            NOT NULL,
    `owner`          varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `addon_inventory_items`
--

LOCK TABLES `addon_inventory_items` WRITE;
/*!40000 ALTER TABLE `addon_inventory_items`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft_categories`
--

DROP TABLE IF EXISTS `aircraft_categories`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `aircraft_categories`
(
    `name`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `aircraft_categories`
--

LOCK TABLES `aircraft_categories` WRITE;
/*!40000 ALTER TABLE `aircraft_categories`
    DISABLE KEYS */;
INSERT INTO `aircraft_categories`
VALUES ('heli', 'Helicopters'),
       ('plane', 'Planes');
/*!40000 ALTER TABLE `aircraft_categories`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `aircrafts`
(
    `name`     varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `model`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `price`    int(11)                           NOT NULL,
    `category` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    PRIMARY KEY (`model`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts`
    DISABLE KEYS */;
INSERT INTO `aircrafts`
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
/*!40000 ALTER TABLE `aircrafts`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `billing`
(
    `id`          int(11)                            NOT NULL AUTO_INCREMENT,
    `identifier`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `sender`      varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `target_type` varchar(50) COLLATE `utf8mb4_bin`  NOT NULL,
    `target`      varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`       varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `amount`      int(11)                            NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `billing`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardealer_vehicles`
--

DROP TABLE IF EXISTS `cardealer_vehicles`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `cardealer_vehicles`
(
    `id`      int(11)                            NOT NULL AUTO_INCREMENT,
    `vehicle` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `price`   int(11)                            NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `cardealer_vehicles`
--

LOCK TABLES `cardealer_vehicles` WRITE;
/*!40000 ALTER TABLE `cardealer_vehicles`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
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
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters`
    DISABLE KEYS */;
INSERT INTO `characters`
VALUES ('Char2:110000102b5c8b8', 'Winter', 'Bear', '1977-08-21', 'f', '150'),
       ('steam:110000102b5c8b8', 'Bacon', 'Face', '1999-08-01', 'f', '189'),
       ('steam:110000102b5c8b8', 'Winter', 'Kirkpatrick', '1977-08-21', 'f', '180');
/*!40000 ALTER TABLE `characters`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `datastore`
(
    `id`     int(11)                            NOT NULL AUTO_INCREMENT,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `shared` int(11)                            NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `datastore`
--

LOCK TABLES `datastore` WRITE;
/*!40000 ALTER TABLE `datastore`
    DISABLE KEYS */;
INSERT INTO `datastore`
VALUES (1, 'society_ambulance', 'Ambulance', 1),
       (2, 'society_police', 'Police', 1),
       (3, 'property', 'Propriété', 0);
/*!40000 ALTER TABLE `datastore`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `datastore_data`
(
    `id`    int(11)                            NOT NULL AUTO_INCREMENT,
    `name`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `owner` varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `data`  longtext COLLATE `utf8mb4_bin`,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `datastore_data`
--

LOCK TABLES `datastore_data` WRITE;
/*!40000 ALTER TABLE `datastore_data`
    DISABLE KEYS */;
INSERT INTO `datastore_data`
VALUES (1, 'society_ambulance', NULL, '{}'),
       (2, 'society_police', NULL, '{}'),
       (3, 'property', 'steam:110000102b5c8b8', '{}');
/*!40000 ALTER TABLE `datastore_data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_types`
--

DROP TABLE IF EXISTS `fine_types`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `fine_types`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `label`    varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `amount`   int(11)                            DEFAULT NULL,
    `category` int(11)                            DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `fine_types`
--

LOCK TABLES `fine_types` WRITE;
/*!40000 ALTER TABLE `fine_types`
    DISABLE KEYS */;
INSERT INTO `fine_types`
VALUES (1, 'Usage abusif du klaxon', 30, 0),
       (2, 'Franchir une ligne continue', 40, 0),
       (3, 'Circulation à contresens', 250, 0),
       (4, 'Demi-tour non autorisé', 250, 0),
       (5, 'Circulation hors-route', 170, 0),
       (6, 'Non-respect des distances de sécurité', 30, 0),
       (7, 'Arrêt dangereux / interdit', 150, 0),
       (8, 'Stationnement gênant / interdit', 70, 0),
       (9, 'Non respect  de la priorité à droite', 70, 0),
       (10, 'Non-respect à un véhicule prioritaire', 90, 0),
       (11, 'Non-respect d\'un stop', 105, 0),
       (12, 'Non-respect d\'un feu rouge', 130, 0),
       (13, 'Dépassement dangereux', 100, 0),
       (14, 'Véhicule non en état', 100, 0),
       (15, 'Conduite sans permis', 1500, 0),
       (16, 'Délit de fuite', 800, 0),
       (17, 'Excès de vitesse < 5 kmh', 90, 0),
       (18, 'Excès de vitesse 5-15 kmh', 120, 0),
       (19, 'Excès de vitesse 15-30 kmh', 180, 0),
       (20, 'Excès de vitesse > 30 kmh', 300, 0),
       (21, 'Entrave de la circulation', 110, 1),
       (22, 'Dégradation de la voie publique', 90, 1),
       (23, 'Trouble à l\'ordre publique', 90, 1),
       (24, 'Entrave opération de police', 130, 1),
       (25, 'Insulte envers / entre civils', 75, 1),
       (26, 'Outrage à agent de police', 110, 1),
       (27, 'Menace verbale ou intimidation envers civil', 90, 1),
       (28, 'Menace verbale ou intimidation envers policier', 150, 1),
       (29, 'Manifestation illégale', 250, 1),
       (30, 'Tentative de corruption', 1500, 1),
       (31, 'Arme blanche sortie en ville', 120, 2),
       (32, 'Arme léthale sortie en ville', 300, 2),
       (33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
       (34, 'Port d\'arme illégal', 700, 2),
       (35, 'Pris en flag lockpick', 300, 2),
       (36, 'Vol de voiture', 1800, 2),
       (37, 'Vente de drogue', 1500, 2),
       (38, 'Fabriquation de drogue', 1500, 2),
       (39, 'Possession de drogue', 650, 2),
       (40, 'Prise d\'ôtage civil', 1500, 2),
       (41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
       (42, 'Braquage particulier', 650, 2),
       (43, 'Braquage magasin', 650, 2),
       (44, 'Braquage de banque', 1500, 2),
       (45, 'Tir sur civil', 2000, 3),
       (46, 'Tir sur agent de l\'état', 2500, 3),
       (47, 'Tentative de meurtre sur civil', 3000, 3),
       (48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
       (49, 'Meurtre sur civil', 10000, 3),
       (50, 'Meurte sur agent de l\'état', 30000, 3),
       (51, 'Meurtre involontaire', 1800, 3),
       (52, 'Escroquerie à l\'entreprise', 2000, 2),
       (53, 'Misuse of a horn', 30, 0),
       (54, 'Illegally Crossing a continuous Line', 40, 0),
       (55, 'Driving on the wrong side of the road', 250, 0),
       (56, 'Illegal U-Turn', 250, 0),
       (57, 'Illegally Driving Off-road', 170, 0),
       (58, 'Refusing a Lawful Command', 30, 0),
       (59, 'Illegally Stoped of a Vehicle', 150, 0),
       (60, 'Illegal Parking', 70, 0),
       (61, 'Failing to Yield to the right', 70, 0),
       (62, 'Failure to comply with Vehicle Information', 90, 0),
       (63, 'Failing to stop at a Stop Sign ', 105, 0),
       (64, 'Failing to stop at a Red Light', 130, 0),
       (65, 'Illegal Passing', 100, 0),
       (66, 'Driving an illegal Vehicle', 100, 0),
       (67, 'Driving without a License', 1500, 0),
       (68, 'Hit and Run', 800, 0),
       (69, 'Exceeding Speeds Over < 5 mph', 90, 0),
       (70, 'Exceeding Speeds Over 5-15 mph', 120, 0),
       (71, 'Exceeding Speeds Over 15-30 mph', 180, 0),
       (72, 'Exceeding Speeds Over > 30 mph', 300, 0),
       (73, 'Impeding traffic flow', 110, 1),
       (74, 'Public Intoxication', 90, 1),
       (75, 'Disorderly conduct', 90, 1),
       (76, 'Obstruction of Justice', 130, 1),
       (77, 'Insults towards Civilans', 75, 1),
       (78, 'Disrespecting of an LEO', 110, 1),
       (79, 'Verbal Threat towards a Civilan', 90, 1),
       (80, 'Verbal Threat towards an LEO', 150, 1),
       (81, 'Providing False Information', 250, 1),
       (82, 'Attempt of Corruption', 1500, 1),
       (83, 'Brandishing a weapon in city Limits', 120, 2),
       (84, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
       (85, 'No Firearms License', 600, 2),
       (86, 'Possession of an Illegal Weapon', 700, 2),
       (87, 'Possession of Burglary Tools', 300, 2),
       (88, 'Grand Theft Auto', 1800, 2),
       (89, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
       (90, 'Frabrication of an Illegal Substance', 1500, 2),
       (91, 'Possession of an Illegal Substance ', 650, 2),
       (92, 'Kidnapping of a Civilan', 1500, 2),
       (93, 'Kidnapping of an LEO', 2000, 2),
       (94, 'Robbery', 650, 2),
       (95, 'Armed Robbery of a Store', 650, 2),
       (96, 'Armed Robbery of a Bank', 1500, 2),
       (97, 'Assault on a Civilian', 2000, 3),
       (98, 'Assault of an LEO', 2500, 3),
       (99, 'Attempt of Murder of a Civilian', 3000, 3),
       (100, 'Attempt of Murder of an LEO', 5000, 3),
       (101, 'Murder of a Civilian', 10000, 3),
       (102, 'Murder of an LEO', 30000, 3),
       (103, 'Involuntary manslaughter', 1800, 3),
       (104, 'Fraud', 2000, 2);
/*!40000 ALTER TABLE `fine_types`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `items`
(
    `name`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `label`      varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `limit`      int(11)                           NOT NULL DEFAULT '-1',
    `rare`       int(11)                           NOT NULL DEFAULT '0',
    `can_remove` int(11)                           NOT NULL DEFAULT '1',
    PRIMARY KEY (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items`
    DISABLE KEYS */;
INSERT INTO `items`
VALUES ('alive_chicken', 'Chicken', 20, 0, 1),
       ('bandage', 'Bandage', 20, 0, 1),
       ('blowpipe', 'Chalumeaux', -1, 0, 1),
       ('bread', 'Bread', -1, 0, 1),
       ('carokit', 'Car Kit', -1, 0, 1),
       ('carotool', 'Repait Tools', -1, 0, 1),
       ('clothe', 'Clothing', 40, 0, 1),
       ('copper', 'Copper', 56, 0, 1),
       ('cutted_wood', 'Cut Wood', 20, 0, 1),
       ('diamond', 'Diamon', 50, 0, 1),
       ('essence', 'Essence', 24, 0, 1),
       ('fabric', 'Fabric', 80, 0, 1),
       ('fish', 'Fish', 100, 0, 1),
       ('fixkit', 'Repair Kit', -1, 0, 1),
       ('fixtool', 'Repair Tool', -1, 0, 1),
       ('gazbottle', 'Gas Bottle', -1, 0, 1),
       ('gold', 'Gold', 21, 0, 1),
       ('iron', 'Iron', 42, 0, 1),
       ('medikit', 'Medical Kit', 5, 0, 1),
       ('packaged_chicken', 'Packaged Chicken', 100, 0, 1),
       ('packaged_plank', 'Planks', 100, 0, 1),
       ('petrol', 'Fuel', 24, 0, 1),
       ('petrol_raffin', 'Refined Fuel', 24, 0, 1),
       ('slaughtered_chicken', 'Slaughtered Chicken', 20, 0, 1),
       ('stone', 'Stone', 7, 0, 1),
       ('washed_stone', 'Clean Stone', 7, 0, 1),
       ('water', 'Water', -1, 0, 1),
       ('wood', 'Wood', 20, 0, 1),
       ('wool', 'Wool', 40, 0, 1);
/*!40000 ALTER TABLE `items`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `job_grades`
(
    `id`          int(11)                           NOT NULL AUTO_INCREMENT,
    `job_name`    varchar(50) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `grade`       int(11)                           NOT NULL,
    `name`        varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `label`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `salary`      int(11)                           NOT NULL,
    `skin_male`   longtext COLLATE `utf8mb4_bin`    NOT NULL,
    `skin_female` longtext COLLATE `utf8mb4_bin`    NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `job_grades`
--

LOCK TABLES `job_grades` WRITE;
/*!40000 ALTER TABLE `job_grades`
    DISABLE KEYS */;
INSERT INTO `job_grades`
VALUES (1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
       (2, 'ambulance', 0, 'ambulance', 'Medic', 20,
        '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',
        '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
       (3, 'ambulance', 1, 'doctor', 'Doctor', 40,
        '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',
        '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
       (4, 'ambulance', 2, 'chief_doctor', 'Surgeon', 60,
        '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',
        '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
       (5, 'ambulance', 3, 'boss', 'Chief', 80,
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
       (13, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
       (14, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
       (15, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
       (16, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
       (17, 'police', 4, 'boss', 'Commander', 100, '{}', '{}'),
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
       (35, 'mecano', 4, 'boss', 'Boss', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `jobs`
(
    `name`        varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `label`       varchar(50) COLLATE `utf8mb4_bin`          DEFAULT NULL,
    `whitelisted` tinyint(1)                        NOT NULL DEFAULT '0',
    PRIMARY KEY (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs`
    DISABLE KEYS */;
INSERT INTO `jobs`
VALUES ('ambulance', 'Ambulance', 0),
       ('cardealer', 'Car Dealer', 0),
       ('fisherman', 'Fisherman', 0),
       ('fueler', 'Fuel', 0),
       ('lumberjack', 'Lumberjack', 0),
       ('mecano', 'Mechanic', 0),
       ('miner', 'Miner', 0),
       ('police', 'Police', 0),
       ('realestateagent', 'Real Estate', 0),
       ('reporter', 'Journalist', 0),
       ('slaughterer', 'Slaughterer', 0),
       ('tailor', 'Tailor', 0),
       ('taxi', 'Taxi', 0),
       ('unemployed', 'Unemployed', 0);
/*!40000 ALTER TABLE `jobs`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `licenses`
(
    `id`    int(11)                            NOT NULL AUTO_INCREMENT,
    `type`  varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses`
    DISABLE KEYS */;
INSERT INTO `licenses`
VALUES (1, 'aircraft', 'Aircraft License');
/*!40000 ALTER TABLE `licenses`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owned_properties`
--

DROP TABLE IF EXISTS `owned_properties`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `owned_properties`
(
    `id`     int(11)                            NOT NULL AUTO_INCREMENT,
    `name`   varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `price`  double                             NOT NULL,
    `rented` int(11)                            NOT NULL,
    `owner`  varchar(60) COLLATE `utf8mb4_bin`  NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `owned_properties`
--

LOCK TABLES `owned_properties` WRITE;
/*!40000 ALTER TABLE `owned_properties`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owned_vehicles`
--

DROP TABLE IF EXISTS `owned_vehicles`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `owned_vehicles`
(
    `owner`   varchar(30) COLLATE `utf8mb4_bin` NOT NULL,
    `plate`   varchar(12) COLLATE `utf8mb4_bin` NOT NULL,
    `vehicle` longtext COLLATE `utf8mb4_bin`    NOT NULL,
    `type`    varchar(20) COLLATE `utf8mb4_bin` NOT NULL DEFAULT 'car',
    `job`     varchar(20) COLLATE `utf8mb4_bin` NOT NULL,
    `storage` tinyint(1)                        NOT NULL DEFAULT '0',
    PRIMARY KEY (`plate`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `owned_vehicles`
--

LOCK TABLES `owned_vehicles` WRITE;
/*!40000 ALTER TABLE `owned_vehicles`
    DISABLE KEYS */;
INSERT INTO `owned_vehicles`
VALUES ('Char2:110000102b5c8b8', 'IJF 152',
        '{\"modVanityPlate\":-1,\"wheels\":0,\"model\":1171614426,\"modFender\":-1,\"modRoof\":-1,\"modHydrolic\":-1,\"modRearBumper\":-1,\"modTank\":-1,\"modTurbo\":false,\"modSteeringWheel\":-1,\"modRightFender\":-1,\"modAerials\":-1,\"modStruts\":-1,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"modHood\":-1,\"modTransmission\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"health\":1000,\"modXenon\":false,\"modTrimB\":-1,\"color2\":28,\"modSideSkirt\":-1,\"modSmokeEnabled\":false,\"modLivery\":-1,\"modArmor\":-1,\"modFrontBumper\":-1,\"windowTint\":-1,\"modBrakes\":-1,\"color1\":112,\"modFrame\":-1,\"modGrille\":-1,\"modSuspension\":-1,\"wheelColor\":156,\"modAirFilter\":-1,\"pearlescentColor\":112,\"modTrimA\":-1,\"neonEnabled\":[false,false,false,false],\"modDial\":-1,\"modSeats\":-1,\"modShifterLeavers\":-1,\"plateIndex\":4,\"plate\":\"IJF 152\",\"modDashboard\":-1,\"modPlateHolder\":-1,\"neonColor\":[255,0,255],\"modFrontWheels\":-1,\"dirtLevel\":5.0,\"modSpoilers\":-1,\"modExhaust\":-1,\"modArchCover\":-1,\"modAPlate\":-1,\"modBackWheels\":-1,\"modWindows\":-1,\"modEngineBlock\":-1}',
        'car', 'ambulance', 1),
       ('Char2:110000102b5c8b8', 'URP 509',
        '{\"wheelColor\":156,\"pearlescentColor\":112,\"modTransmission\":-1,\"modEngine\":-1,\"modHood\":-1,\"modDoorSpeaker\":-1,\"tyreSmokeColor\":[255,255,255],\"modDashboard\":-1,\"modFrame\":-1,\"modHorns\":-1,\"modTrimB\":-1,\"color2\":28,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"modXenon\":false,\"model\":1171614426,\"plate\":\"URP 509\",\"color1\":112,\"modFrontWheels\":-1,\"modSuspension\":-1,\"modAerials\":-1,\"modBackWheels\":-1,\"neonColor\":[255,0,255],\"modEngineBlock\":-1,\"modAPlate\":-1,\"modDial\":-1,\"modSpeakers\":-1,\"health\":1000,\"modShifterLeavers\":-1,\"modSeats\":-1,\"modAirFilter\":-1,\"neonEnabled\":[false,false,false,false],\"modTrunk\":-1,\"modPlateHolder\":-1,\"modSteeringWheel\":-1,\"modLivery\":-1,\"modVanityPlate\":-1,\"modExhaust\":-1,\"modBrakes\":-1,\"modStruts\":-1,\"modArmor\":-1,\"modWindows\":-1,\"modTurbo\":false,\"modArchCover\":-1,\"modFrontBumper\":-1,\"modTrimA\":-1,\"dirtLevel\":5.0,\"windowTint\":-1,\"wheels\":0,\"modRoof\":-1,\"modRightFender\":-1,\"modTank\":-1,\"modGrille\":-1,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modSmokeEnabled\":false,\"modFender\":-1,\"plateIndex\":4,\"modOrnaments\":-1}',
        'car', 'ambulance', 1);
/*!40000 ALTER TABLE `owned_vehicles`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_app_chat`
--

DROP TABLE IF EXISTS `phone_app_chat`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `phone_app_chat`
(
    `id`      int(11)      NOT NULL AUTO_INCREMENT,
    `channel` varchar(20)  NOT NULL,
    `message` varchar(255) NOT NULL,
    `time`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = `utf8`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `phone_app_chat`
--

LOCK TABLES `phone_app_chat` WRITE;
/*!40000 ALTER TABLE `phone_app_chat`
    DISABLE KEYS */;
INSERT INTO `phone_app_chat`
VALUES (28, 'foo', 'fuckyeah', '2019-08-25 01:11:10');
/*!40000 ALTER TABLE `phone_app_chat`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_calls`
--

DROP TABLE IF EXISTS `phone_calls`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `phone_calls`
(
    `id`       int(11)     NOT NULL AUTO_INCREMENT,
    `owner`    varchar(10) NOT NULL COMMENT 'Name',
    `num`      varchar(10) NOT NULL COMMENT 'Phone Number',
    `incoming` int(11)     NOT NULL COMMENT 'Define Incoming Call',
    `time`     timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `accepts`  int(11)     NOT NULL COMMENT 'Accept Call',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 124
  DEFAULT CHARSET = `utf8`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `phone_calls`
--

LOCK TABLES `phone_calls` WRITE;
/*!40000 ALTER TABLE `phone_calls`
    DISABLE KEYS */;
INSERT INTO `phone_calls`
VALUES (122, '7408728', '740-8728', 1, '2019-08-25 01:53:04', 0),
       (123, '7408728', '740-8728', 1, '2019-08-25 01:53:42', 0);
/*!40000 ALTER TABLE `phone_calls`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_messages`
--

DROP TABLE IF EXISTS `phone_messages`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `phone_messages`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `transmitter` varchar(10)  NOT NULL,
    `receiver`    varchar(10)  NOT NULL,
    `message`     varchar(255) NOT NULL DEFAULT '0',
    `time`        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `isRead`      int(11)      NOT NULL DEFAULT '0',
    `owner`       int(11)      NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 110
  DEFAULT CHARSET = `utf8`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `phone_messages`
--

LOCK TABLES `phone_messages` WRITE;
/*!40000 ALTER TABLE `phone_messages`
    DISABLE KEYS */;
INSERT INTO `phone_messages`
VALUES (106, '7408728', '7408728', 'Hey', '2019-08-25 01:54:38', 1, 0),
       (107, '7408728', '7408728', 'Hey', '2019-08-25 01:54:38', 1, 1),
       (108, '7408728', '7408728', 'Woo', '2019-08-25 01:54:52', 1, 0),
       (109, '7408728', '7408728', 'Woo', '2019-08-25 01:54:52', 1, 1);
/*!40000 ALTER TABLE `phone_messages`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_users_contacts`
--

DROP TABLE IF EXISTS `phone_users_contacts`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `phone_users_contacts`
(
    `id`         int(11)                             NOT NULL AUTO_INCREMENT,
    `identifier` varchar(60) CHARACTER SET `utf8mb4`          DEFAULT NULL,
    `number`     varchar(10) CHARACTER SET `utf8mb4`          DEFAULT NULL,
    `display`    varchar(64) CHARACTER SET `utf8mb4` NOT NULL DEFAULT '-1',
    PRIMARY KEY (`id`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = `utf8`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `phone_users_contacts`
--

LOCK TABLES `phone_users_contacts` WRITE;
/*!40000 ALTER TABLE `phone_users_contacts`
    DISABLE KEYS */;
INSERT INTO `phone_users_contacts`
VALUES (7, 'steam:110000102b5c8b8', '7408728', 'Winter');
/*!40000 ALTER TABLE `phone_users_contacts`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `properties`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
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
    `price`      int(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 110
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties`
    DISABLE KEYS */;
INSERT INTO `properties`
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
        '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000);
/*!40000 ALTER TABLE `properties`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rented_vehicles`
--

DROP TABLE IF EXISTS `rented_vehicles`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `rented_vehicles`
(
    `vehicle`     varchar(60) COLLATE `utf8mb4_bin`  NOT NULL,
    `plate`       varchar(12) COLLATE `utf8mb4_bin`  NOT NULL,
    `player_name` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `base_price`  int(11)                            NOT NULL,
    `rent_price`  int(11)                            NOT NULL,
    `owner`       varchar(30) COLLATE `utf8mb4_bin`  NOT NULL,
    PRIMARY KEY (`plate`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `rented_vehicles`
--

LOCK TABLES `rented_vehicles` WRITE;
/*!40000 ALTER TABLE `rented_vehicles`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `shops`
(
    `id`    int(11)                            NOT NULL AUTO_INCREMENT,
    `store` varchar(100) COLLATE `utf8mb4_bin` NOT NULL,
    `item`  varchar(100) COLLATE `utf8mb4_bin` NOT NULL,
    `price` int(11)                            NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops`
    DISABLE KEYS */;
INSERT INTO `shops`
VALUES (1, 'TwentyFourSeven', 'bread', 30),
       (2, 'TwentyFourSeven', 'water', 15),
       (3, 'RobsLiquor', 'bread', 30),
       (4, 'RobsLiquor', 'water', 15),
       (5, 'LTDgasoline', 'bread', 30),
       (6, 'LTDgasoline', 'water', 15);
/*!40000 ALTER TABLE `shops`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `society_moneywash`
(
    `id`         int(11)                           NOT NULL AUTO_INCREMENT,
    `identifier` varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `society`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `amount`     int(11)                           NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `society_moneywash`
--

LOCK TABLES `society_moneywash` WRITE;
/*!40000 ALTER TABLE `society_moneywash`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_categories`
--

DROP TABLE IF EXISTS `truck_categories`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `truck_categories`
(
    `name`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `truck_categories`
--

LOCK TABLES `truck_categories` WRITE;
/*!40000 ALTER TABLE `truck_categories`
    DISABLE KEYS */;
INSERT INTO `truck_categories`
VALUES ('box', 'Boxed Trucks'),
       ('haul', 'Haulers'),
       ('other', 'Other Trucks'),
       ('trans', 'Transport Trucks');
/*!40000 ALTER TABLE `truck_categories`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks`
--

DROP TABLE IF EXISTS `trucks`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `trucks`
(
    `name`     varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `model`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `price`    int(11)                           NOT NULL,
    `category` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    PRIMARY KEY (`model`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `trucks`
--

LOCK TABLES `trucks` WRITE;
/*!40000 ALTER TABLE `trucks`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `trucks`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `user_accounts`
(
    `id`         int(11)                           NOT NULL AUTO_INCREMENT,
    `identifier` varchar(22) COLLATE `utf8mb4_bin` NOT NULL,
    `name`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `money`      double                            NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts`
    DISABLE KEYS */;
INSERT INTO `user_accounts`
VALUES (2, 'Char2:110000102b5c8b8', 'black_money', 0),
       (4, 'steam:110000102b5c8b8', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contacts`
--

DROP TABLE IF EXISTS `user_contacts`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `user_contacts`
(
    `id`         int(11)                            NOT NULL AUTO_INCREMENT,
    `identifier` varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `name`       varchar(255) COLLATE `utf8mb4_bin` NOT NULL,
    `number`     int(11)                            NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `user_contacts`
--

LOCK TABLES `user_contacts` WRITE;
/*!40000 ALTER TABLE `user_contacts`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_inventory`
--

DROP TABLE IF EXISTS `user_inventory`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `user_inventory`
(
    `id`         int(11)                           NOT NULL AUTO_INCREMENT,
    `identifier` varchar(22) COLLATE `utf8mb4_bin` NOT NULL,
    `item`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `count`      int(11)                           NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 88
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `user_inventory`
--

LOCK TABLES `user_inventory` WRITE;
/*!40000 ALTER TABLE `user_inventory`
    DISABLE KEYS */;
INSERT INTO `user_inventory`
VALUES (1, 'Char2:110000102b5c8b8', 'alive_chicken', 0),
       (2, 'Char2:110000102b5c8b8', 'wool', 0),
       (3, 'Char2:110000102b5c8b8', 'packaged_plank', 0),
       (4, 'Char2:110000102b5c8b8', 'washed_stone', 0),
       (5, 'Char2:110000102b5c8b8', 'fabric', 0),
       (6, 'Char2:110000102b5c8b8', 'diamond', 0),
       (7, 'Char2:110000102b5c8b8', 'packaged_chicken', 0),
       (8, 'Char2:110000102b5c8b8', 'petrol_raffin', 0),
       (9, 'Char2:110000102b5c8b8', 'petrol', 0),
       (10, 'Char2:110000102b5c8b8', 'bandage', 0),
       (11, 'Char2:110000102b5c8b8', 'gold', 0),
       (12, 'Char2:110000102b5c8b8', 'medikit', 0),
       (13, 'Char2:110000102b5c8b8', 'essence', 0),
       (14, 'Char2:110000102b5c8b8', 'clothe', 0),
       (15, 'Char2:110000102b5c8b8', 'bread', 3),
       (16, 'Char2:110000102b5c8b8', 'wood', 0),
       (17, 'Char2:110000102b5c8b8', 'water', 2),
       (18, 'Char2:110000102b5c8b8', 'stone', 0),
       (19, 'Char2:110000102b5c8b8', 'slaughtered_chicken', 0),
       (20, 'Char2:110000102b5c8b8', 'fish', 0),
       (21, 'Char2:110000102b5c8b8', 'copper', 0),
       (22, 'Char2:110000102b5c8b8', 'iron', 0),
       (23, 'Char2:110000102b5c8b8', 'cutted_wood', 0),
       (24, 'Char2:110000102b5c8b8', 'blowpipe', 0),
       (25, 'Char2:110000102b5c8b8', 'gazbottle', 0),
       (26, 'Char2:110000102b5c8b8', 'carokit', 0),
       (27, 'Char2:110000102b5c8b8', 'fixkit', 0),
       (28, 'Char2:110000102b5c8b8', 'carotool', 0),
       (29, 'Char2:110000102b5c8b8', 'fixtool', 0),
       (59, 'steam:110000102b5c8b8', 'packaged_plank', 0),
       (60, 'steam:110000102b5c8b8', 'wood', 0),
       (61, 'steam:110000102b5c8b8', 'packaged_chicken', 0),
       (62, 'steam:110000102b5c8b8', 'medikit', 0),
       (63, 'steam:110000102b5c8b8', 'copper', 0),
       (64, 'steam:110000102b5c8b8', 'water', 0),
       (65, 'steam:110000102b5c8b8', 'petrol_raffin', 0),
       (66, 'steam:110000102b5c8b8', 'petrol', 0),
       (67, 'steam:110000102b5c8b8', 'stone', 0),
       (68, 'steam:110000102b5c8b8', 'wool', 0),
       (69, 'steam:110000102b5c8b8', 'slaughtered_chicken', 0),
       (70, 'steam:110000102b5c8b8', 'washed_stone', 0),
       (71, 'steam:110000102b5c8b8', 'iron', 0),
       (72, 'steam:110000102b5c8b8', 'gold', 0),
       (73, 'steam:110000102b5c8b8', 'carotool', 0),
       (74, 'steam:110000102b5c8b8', 'fixtool', 0),
       (75, 'steam:110000102b5c8b8', 'fixkit', 0),
       (76, 'steam:110000102b5c8b8', 'bandage', 0),
       (77, 'steam:110000102b5c8b8', 'diamond', 0),
       (78, 'steam:110000102b5c8b8', 'gazbottle', 0),
       (79, 'steam:110000102b5c8b8', 'blowpipe', 0),
       (80, 'steam:110000102b5c8b8', 'fish', 0),
       (81, 'steam:110000102b5c8b8', 'bread', 0),
       (82, 'steam:110000102b5c8b8', 'carokit', 0),
       (83, 'steam:110000102b5c8b8', 'cutted_wood', 0),
       (84, 'steam:110000102b5c8b8', 'alive_chicken', 0),
       (85, 'steam:110000102b5c8b8', 'clothe', 0),
       (86, 'steam:110000102b5c8b8', 'essence', 0),
       (87, 'steam:110000102b5c8b8', 'fabric', 0);
/*!40000 ALTER TABLE `user_inventory`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_lastcharacter`
--

DROP TABLE IF EXISTS `user_lastcharacter`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `user_lastcharacter`
(
    `steamid` varchar(255) NOT NULL,
    `charid`  int(11)      NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = `latin1`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `user_lastcharacter`
--

LOCK TABLES `user_lastcharacter` WRITE;
/*!40000 ALTER TABLE `user_lastcharacter`
    DISABLE KEYS */;
INSERT INTO `user_lastcharacter`
VALUES ('steam:110000102b5c8b8', 1);
/*!40000 ALTER TABLE `user_lastcharacter`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_parkings`
--

DROP TABLE IF EXISTS `user_parkings`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `user_parkings`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
    `identifier` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `garage`     varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `zone`       int(11) NOT NULL,
    `vehicle`    longtext COLLATE `utf8mb4_bin`,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `user_parkings`
--

LOCK TABLES `user_parkings` WRITE;
/*!40000 ALTER TABLE `user_parkings`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkings`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `users`
(
    `identifier`       varchar(50) COLLATE `utf8mb4_bin` NOT NULL,
    `license`          varchar(50) COLLATE `utf8mb4_bin`  DEFAULT NULL,
    `money`            int(11)                            DEFAULT NULL,
    `name`             varchar(50) COLLATE `utf8mb4_bin`  DEFAULT '',
    `skin`             longtext COLLATE `utf8mb4_bin`,
    `job`              varchar(50) COLLATE `utf8mb4_bin`  DEFAULT 'unemployed',
    `job_grade`        int(11)                            DEFAULT '0',
    `loadout`          longtext COLLATE `utf8mb4_bin`,
    `position`         varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `bank`             int(11)                            DEFAULT NULL,
    `permission_level` int(11)                            DEFAULT NULL,
    `group`            varchar(50) COLLATE `utf8mb4_bin`  DEFAULT NULL,
    `is_dead`          tinyint(1)                         DEFAULT '0',
    `firstname`        varchar(50) COLLATE `utf8mb4_bin`  DEFAULT '',
    `lastname`         varchar(50) COLLATE `utf8mb4_bin`  DEFAULT '',
    `dateofbirth`      varchar(25) COLLATE `utf8mb4_bin`  DEFAULT '',
    `sex`              varchar(10) COLLATE `utf8mb4_bin`  DEFAULT '',
    `height`           varchar(5) COLLATE `utf8mb4_bin`   DEFAULT '',
    `status`           longtext COLLATE `utf8mb4_bin`,
    `last_property`    varchar(255) COLLATE `utf8mb4_bin` DEFAULT NULL,
    `phone_number`     varchar(10) COLLATE `utf8mb4_bin`  DEFAULT NULL,
    PRIMARY KEY (`identifier`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users`
    DISABLE KEYS */;
INSERT INTO `users`
VALUES ('Char2:110000102b5c8b8', 'license:b64a594505510eff048de69d44f86e68648cefa3', 12330758, 'zebadrabbit',
        '{\"pants_1\":25,\"torso_1\":55,\"hair_2\":0,\"bags_2\":0,\"ears_2\":0,\"makeup_4\":0,\"makeup_3\":0,\"lipstick_4\":0,\"bproof_1\":0,\"sex\":0,\"skin\":0,\"makeup_1\":0,\"tshirt_2\":1,\"eyebrows_4\":0,\"ears_1\":2,\"beard_3\":0,\"torso_2\":0,\"eyebrows_2\":0,\"mask_1\":0,\"helmet_1\":46,\"shoes_2\":0,\"beard_1\":0,\"shoes_1\":25,\"hair_color_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"beard_2\":0,\"bags_1\":0,\"bproof_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"age_2\":0,\"helmet_2\":0,\"tshirt_1\":58,\"pants_2\":0,\"age_1\":0,\"chain_1\":0,\"makeup_2\":0,\"hair_color_1\":0,\"glasses_1\":0,\"hair_1\":0,\"mask_2\":0,\"beard_4\":0,\"decals_1\":0,\"arms\":41,\"lipstick_3\":0,\"face\":0,\"lipstick_1\":0,\"decals_2\":0,\"glasses_2\":0}',
        'police', 0,
        '[{\"ammo\":250,\"label\":\"Combat pistol\",\"components\":[\"clip_default\"],\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":250,\"label\":\"Pump shotgun\",\"components\":[],\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"ammo\":250,\"label\":\"Taser\",\"components\":[],\"name\":\"WEAPON_STUNGUN\"}]',
        '{\"x\":382.0,\"y\":-247.59999999998,\"z\":54.199999999998}', 260, 1, 'superadmin', 0, 'Winter', 'Bear',
        '1977-08-21', 'f', '150',
        '[{\"val\":0,\"percent\":0.0,\"name\":\"drunk\"},{\"val\":762400,\"percent\":76.24,\"name\":\"hunger\"},{\"val\":704000,\"percent\":70.4,\"name\":\"thirst\"}]',
        NULL, '104-2084'),
       ('steam:110000102b5c8b8', 'license:b64a594505510eff048de69d44f86e68648cefa3', 500, 'zebadrabbit',
        '{\"eyebrows_4\":0,\"bags_2\":0,\"makeup_4\":0,\"beard_3\":0,\"shoes_1\":3,\"face\":23,\"decals_2\":0,\"lipstick_3\":0,\"helmet_2\":0,\"glasses_2\":0,\"makeup_1\":0,\"decals_1\":0,\"hair_2\":0,\"hair_color_1\":0,\"chain_1\":7,\"lipstick_2\":0,\"eyebrows_2\":8,\"chain_2\":0,\"helmet_1\":-1,\"lipstick_4\":0,\"pants_1\":6,\"makeup_3\":0,\"glasses_1\":19,\"eyebrows_3\":0,\"hair_1\":8,\"arms\":6,\"mask_1\":0,\"eyebrows_1\":1,\"shoes_2\":0,\"age_1\":0,\"age_2\":0,\"torso_1\":7,\"lipstick_1\":0,\"beard_4\":0,\"bags_1\":0,\"makeup_2\":0,\"mask_2\":0,\"beard_1\":0,\"ears_2\":0,\"hair_color_2\":0,\"tshirt_1\":20,\"beard_2\":0,\"bproof_1\":0,\"skin\":0,\"torso_2\":0,\"sex\":1,\"tshirt_2\":2,\"ears_1\":-1,\"bproof_2\":0,\"pants_2\":0}',
        'unemployed', 0, '[]', '{\"y\":-996.3999999999,\"x\":199.40000000002,\"z\":30.0}', 1600, 0, 'user', 0, 'Winter',
        'Kirkpatrick', '1977-08-21', 'f', '180',
        '[{\"name\":\"hunger\",\"val\":981400,\"percent\":98.14},{\"name\":\"thirst\",\"val\":976750,\"percent\":97.675},{\"name\":\"drunk\",\"val\":0,\"percent\":0.0}]',
        NULL, '7408728');
/*!40000 ALTER TABLE `users`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_categories`
--

DROP TABLE IF EXISTS `vehicle_categories`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `vehicle_categories`
(
    `name`  varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `label` varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `vehicle_categories`
--

LOCK TABLES `vehicle_categories` WRITE;
/*!40000 ALTER TABLE `vehicle_categories`
    DISABLE KEYS */;
INSERT INTO `vehicle_categories`
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
/*!40000 ALTER TABLE `vehicle_categories`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @`saved_cs_client` = @@`character_set_client` */;
SET character_set_client = `utf8mb4`;
CREATE TABLE `vehicles`
(
    `name`     varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `model`    varchar(60) COLLATE `utf8mb4_bin` NOT NULL,
    `price`    int(11)                           NOT NULL,
    `category` varchar(60) COLLATE `utf8mb4_bin` DEFAULT NULL,
    PRIMARY KEY (`model`)
) ENGINE = InnoDB
  DEFAULT CHARSET = `utf8mb4`
  COLLATE = `utf8mb4_bin`;
/*!40101 SET character_set_client = @`saved_cs_client` */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles`
    DISABLE KEYS */;
INSERT INTO `vehicles`
VALUES ('Akuma', 'AKUMA', 7500, 'motorcycles'),
       ('Adder', 'adder', 900000, 'super'),
       ('Alpha', 'alpha', 60000, 'sports'),
       ('Ardent', 'ardent', 1150000, 'sportsclassics'),
       ('Asea', 'asea', 5500, 'sedans'),
       ('Autarch', 'autarch', 1955000, 'super'),
       ('Avarus', 'avarus', 18000, 'motorcycles'),
       ('Bagger', 'bagger', 13500, 'motorcycles'),
       ('Baller', 'baller2', 40000, 'suvs'),
       ('Baller Sport', 'baller3', 60000, 'suvs'),
       ('Banshee', 'banshee', 70000, 'sports'),
       ('Banshee 900R', 'banshee2', 255000, 'super'),
       ('Bati 801', 'bati', 12000, 'motorcycles'),
       ('Bati 801RR', 'bati2', 19000, 'motorcycles'),
       ('Bestia GTS', 'bestiagts', 55000, 'sports'),
       ('BF400', 'bf400', 6500, 'motorcycles'),
       ('Bf Injection', 'bfinjection', 16000, 'offroad'),
       ('Bifta', 'bifta', 12000, 'offroad'),
       ('Bison', 'bison', 45000, 'vans'),
       ('Blade', 'blade', 15000, 'muscle'),
       ('Blazer', 'blazer', 6500, 'offroad'),
       ('Blazer Sport', 'blazer4', 8500, 'offroad'),
       ('blazer5', 'blazer5', 1755600, 'offroad'),
       ('Blista', 'blista', 8000, 'compacts'),
       ('BMX (velo)', 'bmx', 160, 'motorcycles'),
       ('Bobcat XL', 'bobcatxl', 32000, 'vans'),
       ('Brawler', 'brawler', 45000, 'offroad'),
       ('Brioso R/A', 'brioso', 18000, 'compacts'),
       ('Btype', 'btype', 62000, 'sportsclassics'),
       ('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
       ('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
       ('Buccaneer', 'buccaneer', 18000, 'muscle'),
       ('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
       ('Buffalo', 'buffalo', 12000, 'sports'),
       ('Buffalo S', 'buffalo2', 20000, 'sports'),
       ('Bullet', 'bullet', 90000, 'super'),
       ('Burrito', 'burrito3', 19000, 'vans'),
       ('Camper', 'camper', 42000, 'vans'),
       ('Carbonizzare', 'carbonizzare', 75000, 'sports'),
       ('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
       ('Casco', 'casco', 30000, 'sportsclassics'),
       ('Cavalcade', 'cavalcade2', 55000, 'suvs'),
       ('Cheetah', 'cheetah', 375000, 'super'),
       ('Chimera', 'chimera', 38000, 'motorcycles'),
       ('Chino', 'chino', 15000, 'muscle'),
       ('Chino Luxe', 'chino2', 19000, 'muscle'),
       ('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
       ('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
       ('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
       ('Comet', 'comet2', 65000, 'sports'),
       ('Comet 5', 'comet5', 1145000, 'sports'),
       ('Contender', 'contender', 70000, 'suvs'),
       ('Coquette', 'coquette', 65000, 'sports'),
       ('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
       ('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
       ('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
       ('Cyclone', 'cyclone', 1890000, 'super'),
       ('Daemon', 'daemon', 11500, 'motorcycles'),
       ('Daemon High', 'daemon2', 13500, 'motorcycles'),
       ('Defiler', 'defiler', 9800, 'motorcycles'),
       ('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
       ('Dominator', 'dominator', 35000, 'muscle'),
       ('Double T', 'double', 28000, 'motorcycles'),
       ('Dubsta', 'dubsta', 45000, 'suvs'),
       ('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
       ('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
       ('Dukes', 'dukes', 28000, 'muscle'),
       ('Dune Buggy', 'dune', 8000, 'offroad'),
       ('Elegy', 'elegy2', 38500, 'sports'),
       ('Emperor', 'emperor', 8500, 'sedans'),
       ('Enduro', 'enduro', 5500, 'motorcycles'),
       ('Entity XF', 'entityxf', 425000, 'super'),
       ('Esskey', 'esskey', 4200, 'motorcycles'),
       ('Exemplar', 'exemplar', 32000, 'coupes'),
       ('F620', 'f620', 40000, 'coupes'),
       ('Faction', 'faction', 20000, 'muscle'),
       ('Faction Rider', 'faction2', 30000, 'muscle'),
       ('Faction XL', 'faction3', 40000, 'muscle'),
       ('Faggio', 'faggio', 1900, 'motorcycles'),
       ('Vespa', 'faggio2', 2800, 'motorcycles'),
       ('Felon', 'felon', 42000, 'coupes'),
       ('Felon GT', 'felon2', 55000, 'coupes'),
       ('Feltzer', 'feltzer2', 55000, 'sports'),
       ('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
       ('Fixter (velo)', 'fixter', 225, 'motorcycles'),
       ('FMJ', 'fmj', 185000, 'super'),
       ('Fhantom', 'fq2', 17000, 'suvs'),
       ('Fugitive', 'fugitive', 12000, 'sedans'),
       ('Furore GT', 'furoregt', 45000, 'sports'),
       ('Fusilade', 'fusilade', 40000, 'sports'),
       ('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
       ('Gauntlet', 'gauntlet', 30000, 'muscle'),
       ('Gang Burrito', 'gburrito', 45000, 'vans'),
       ('Burrito', 'gburrito2', 29000, 'vans'),
       ('Glendale', 'glendale', 6500, 'sedans'),
       ('Grabger', 'granger', 50000, 'suvs'),
       ('Gresley', 'gresley', 47500, 'suvs'),
       ('GT 500', 'gt500', 785000, 'sportsclassics'),
       ('Guardian', 'guardian', 45000, 'offroad'),
       ('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
       ('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
       ('Hermes', 'hermes', 535000, 'muscle'),
       ('Hexer', 'hexer', 12000, 'motorcycles'),
       ('Hotknife', 'hotknife', 125000, 'muscle'),
       ('Huntley S', 'huntley', 40000, 'suvs'),
       ('Hustler', 'hustler', 625000, 'muscle'),
       ('Infernus', 'infernus', 180000, 'super'),
       ('Innovation', 'innovation', 23500, 'motorcycles'),
       ('Intruder', 'intruder', 7500, 'sedans'),
       ('Issi', 'issi2', 10000, 'compacts'),
       ('Jackal', 'jackal', 38000, 'coupes'),
       ('Jester', 'jester', 65000, 'sports'),
       ('Jester(Racecar)', 'jester2', 135000, 'sports'),
       ('Journey', 'journey', 6500, 'vans'),
       ('Kamacho', 'kamacho', 345000, 'offroad'),
       ('Khamelion', 'khamelion', 38000, 'sports'),
       ('Kuruma', 'kuruma', 30000, 'sports'),
       ('Landstalker', 'landstalker', 35000, 'suvs'),
       ('RE-7B', 'le7b', 325000, 'super'),
       ('Lynx', 'lynx', 40000, 'sports'),
       ('Mamba', 'mamba', 70000, 'sports'),
       ('Manana', 'manana', 12800, 'sportsclassics'),
       ('Manchez', 'manchez', 5300, 'motorcycles'),
       ('Massacro', 'massacro', 65000, 'sports'),
       ('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
       ('Mesa', 'mesa', 16000, 'suvs'),
       ('Mesa Trail', 'mesa3', 40000, 'suvs'),
       ('Minivan', 'minivan', 13000, 'vans'),
       ('Monroe', 'monroe', 55000, 'sportsclassics'),
       ('The Liberator', 'monster', 210000, 'offroad'),
       ('Moonbeam', 'moonbeam', 18000, 'vans'),
       ('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
       ('Nemesis', 'nemesis', 5800, 'motorcycles'),
       ('Neon', 'neon', 1500000, 'sports'),
       ('Nightblade', 'nightblade', 35000, 'motorcycles'),
       ('Nightshade', 'nightshade', 65000, 'muscle'),
       ('9F', 'ninef', 65000, 'sports'),
       ('9F Cabrio', 'ninef2', 80000, 'sports'),
       ('Omnis', 'omnis', 35000, 'sports'),
       ('Oppressor', 'oppressor', 3524500, 'super'),
       ('Oracle XS', 'oracle2', 35000, 'coupes'),
       ('Osiris', 'osiris', 160000, 'super'),
       ('Panto', 'panto', 10000, 'compacts'),
       ('Paradise', 'paradise', 19000, 'vans'),
       ('Pariah', 'pariah', 1420000, 'sports'),
       ('Patriot', 'patriot', 55000, 'suvs'),
       ('PCJ-600', 'pcj', 6200, 'motorcycles'),
       ('Penumbra', 'penumbra', 28000, 'sports'),
       ('Pfister', 'pfister811', 85000, 'super'),
       ('Phoenix', 'phoenix', 12500, 'muscle'),
       ('Picador', 'picador', 18000, 'muscle'),
       ('Pigalle', 'pigalle', 20000, 'sportsclassics'),
       ('Prairie', 'prairie', 12000, 'compacts'),
       ('Premier', 'premier', 8000, 'sedans'),
       ('Primo Custom', 'primo2', 14000, 'sedans'),
       ('X80 Proto', 'prototipo', 2500000, 'super'),
       ('Radius', 'radi', 29000, 'suvs'),
       ('raiden', 'raiden', 1375000, 'sports'),
       ('Rapid GT', 'rapidgt', 35000, 'sports'),
       ('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
       ('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
       ('Reaper', 'reaper', 150000, 'super'),
       ('Rebel', 'rebel2', 35000, 'offroad'),
       ('Regina', 'regina', 5000, 'sedans'),
       ('Retinue', 'retinue', 615000, 'sportsclassics'),
       ('Revolter', 'revolter', 1610000, 'sports'),
       ('riata', 'riata', 380000, 'offroad'),
       ('Rocoto', 'rocoto', 45000, 'suvs'),
       ('Ruffian', 'ruffian', 6800, 'motorcycles'),
       ('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
       ('Rumpo', 'rumpo', 15000, 'vans'),
       ('Rumpo Trail', 'rumpo3', 19500, 'vans'),
       ('Sabre Turbo', 'sabregt', 20000, 'muscle'),
       ('Sabre GT', 'sabregt2', 25000, 'muscle'),
       ('Sanchez', 'sanchez', 5300, 'motorcycles'),
       ('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
       ('Sanctus', 'sanctus', 25000, 'motorcycles'),
       ('Sandking', 'sandking', 55000, 'offroad'),
       ('Savestra', 'savestra', 990000, 'sportsclassics'),
       ('SC 1', 'sc1', 1603000, 'super'),
       ('Schafter', 'schafter2', 25000, 'sedans'),
       ('Schafter V12', 'schafter3', 50000, 'sports'),
       ('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
       ('Seminole', 'seminole', 25000, 'suvs'),
       ('Sentinel', 'sentinel', 32000, 'coupes'),
       ('Sentinel XS', 'sentinel2', 40000, 'coupes'),
       ('Sentinel3', 'sentinel3', 650000, 'sports'),
       ('Seven 70', 'seven70', 39500, 'sports'),
       ('ETR1', 'sheava', 220000, 'super'),
       ('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
       ('Slam Van', 'slamvan3', 11500, 'muscle'),
       ('Sovereign', 'sovereign', 22000, 'motorcycles'),
       ('Stinger', 'stinger', 80000, 'sportsclassics'),
       ('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
       ('Streiter', 'streiter', 500000, 'sports'),
       ('Stretch', 'stretch', 90000, 'sedans'),
       ('Stromberg', 'stromberg', 3185350, 'sports'),
       ('Sultan', 'sultan', 15000, 'sports'),
       ('Sultan RS', 'sultanrs', 65000, 'super'),
       ('Super Diamond', 'superd', 130000, 'sedans'),
       ('Surano', 'surano', 50000, 'sports'),
       ('Surfer', 'surfer', 12000, 'vans'),
       ('T20', 't20', 300000, 'super'),
       ('Tailgater', 'tailgater', 30000, 'sedans'),
       ('Tampa', 'tampa', 16000, 'muscle'),
       ('Drift Tampa', 'tampa2', 80000, 'sports'),
       ('Thrust', 'thrust', 24000, 'motorcycles'),
       ('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
       ('Trophy Truck', 'trophytruck', 60000, 'offroad'),
       ('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
       ('Tropos', 'tropos', 40000, 'sports'),
       ('Turismo R', 'turismor', 350000, 'super'),
       ('Tyrus', 'tyrus', 600000, 'super'),
       ('Vacca', 'vacca', 120000, 'super'),
       ('Vader', 'vader', 7200, 'motorcycles'),
       ('Verlierer', 'verlierer2', 70000, 'sports'),
       ('Vigero', 'vigero', 12500, 'muscle'),
       ('Virgo', 'virgo', 14000, 'muscle'),
       ('Viseris', 'viseris', 875000, 'sportsclassics'),
       ('Visione', 'visione', 2250000, 'super'),
       ('Voltic', 'voltic', 90000, 'super'),
       ('Voltic 2', 'voltic2', 3830400, 'super'),
       ('Voodoo', 'voodoo', 7200, 'muscle'),
       ('Vortex', 'vortex', 9800, 'motorcycles'),
       ('Warrener', 'warrener', 4000, 'sedans'),
       ('Washington', 'washington', 9000, 'sedans'),
       ('Windsor', 'windsor', 95000, 'coupes'),
       ('Windsor Drop', 'windsor2', 125000, 'coupes'),
       ('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
       ('XLS', 'xls', 32000, 'suvs'),
       ('Yosemite', 'yosemite', 485000, 'muscle'),
       ('Youga', 'youga', 10800, 'vans'),
       ('Youga Luxuary', 'youga2', 14500, 'vans'),
       ('Z190', 'z190', 900000, 'sportsclassics'),
       ('Zentorno', 'zentorno', 1500000, 'super'),
       ('Zion', 'zion', 36000, 'coupes'),
       ('Zion Cabrio', 'zion2', 45000, 'coupes'),
       ('Zombie', 'zombiea', 9500, 'motorcycles'),
       ('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
       ('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'essentialmode'
--

--
-- Dumping routines for database 'essentialmode'
--
/*!40103 SET TIME_ZONE = @`OLD_TIME_ZONE` */;

/*!40101 SET SQL_MODE = @`OLD_SQL_MODE` */;
/*!40014 SET FOREIGN_KEY_CHECKS = @`OLD_FOREIGN_KEY_CHECKS` */;
/*!40014 SET UNIQUE_CHECKS = @`OLD_UNIQUE_CHECKS` */;
/*!40101 SET CHARACTER_SET_CLIENT = @`OLD_CHARACTER_SET_CLIENT` */;
/*!40101 SET CHARACTER_SET_RESULTS = @`OLD_CHARACTER_SET_RESULTS` */;
/*!40101 SET COLLATION_CONNECTION = @`OLD_COLLATION_CONNECTION` */;
/*!40111 SET SQL_NOTES = @`OLD_SQL_NOTES` */;

-- Dump completed on 2019-08-24 21:23:43
