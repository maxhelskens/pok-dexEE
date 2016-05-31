-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: affablebean
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `weight` int(10) unsigned NOT NULL,
  `hp` int(10) unsigned NOT NULL,
  `attack` int(10) unsigned NOT NULL,
  `defense` int(10) unsigned NOT NULL,
  `specialAttack` int(10) unsigned NOT NULL,
  `specialDefense` int(10) unsigned NOT NULL,
  `speed` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `abilityI` varchar(45) NOT NULL,
  `abilityII` varchar(45) DEFAULT NULL,
  `gender` varchar(45) NOT NULL,
  `evolvesBy` varchar(45) DEFAULT NULL,
  `evolvesFrom` int(10) unsigned DEFAULT NULL,
  `evolvesTo` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'Bulbasaur',7,69,45,49,49,65,65,45,318,'Overgrow',NULL,'M (87.5%)','Lv. 16',NULL,2),(2,'Ivysaur',10,130,60,62,63,80,80,60,405,'Overgrow',NULL,'M (87.5%)','Lv. 32,Venusaur',1,3),(3,'Venusaur',20,1000,80,82,83,100,100,80,525,'Overgrow',NULL,'M (87.5%)','--',2,NULL),(4,'Charmander',6,85,39,52,43,60,50,65,309,'Blaze',NULL,'M (87.5%)','Lv. 16',NULL,5),(5,'Charmeleon',11,190,58,64,58,80,65,80,405,'Blaze',NULL,'M (87.5%)','Lv. 36',4,6),(6,'Charizard',17,905,78,84,78,109,85,100,534,'Blaze',NULL,'M (87.5%)','--',5,NULL),(7,'Squirtle',5,90,44,48,65,60,54,43,314,'Torrent',NULL,'M (87.5%)','Lv. 16',NULL,8),(8,'Wartortle',10,225,59,63,80,65,80,58,405,'Torrent',NULL,'M (87.5%)','Lv. 36',7,9),(9,'Blastoise',16,855,79,83,100,85,105,78,530,'Torrent',NULL,'M (87.5%)','--',8,NULL),(10,'Caterpie',3,29,45,30,35,20,20,45,195,'Shield Dust',NULL,'50/50','Lv. 7',NULL,11),(11,'Metapod',7,99,50,20,55,25,25,30,205,'Shed Skin',NULL,'50/50','Lv. 10',10,12),(12,'Butterfree',11,320,60,45,50,80,80,70,385,'Compoundeyes',NULL,'50/50','--',11,NULL),(13,'Weedle',3,32,40,35,30,20,20,50,195,'Shield Dust',NULL,'50/50','Lv. 7',NULL,12),(14,'Kakuna',6,100,45,25,50,25,25,35,205,'Shed Skin',NULL,'50/50','Lv. 10',13,15),(15,'Beedrill',10,295,65,80,40,40,80,75,380,'Swarm',NULL,'50/50','--',14,NULL),(16,'Pidgey',3,18,40,45,40,35,35,56,251,'Keen Eye','Tangled Feet','50/50','Lv. 18',NULL,17),(17,'Pidgeotto',11,300,63,60,55,50,50,71,349,'Keen Eye','Tangled Feet','50/50','Lv. 36',16,18),(18,'Pidgeot',15,395,83,80,75,70,70,91,469,'Keen Eye','Tangled Feet','50/50','--',17,NULL),(19,'Rattata',3,35,30,56,35,25,35,72,253,'Run Away','Guts','50/50','Lv. 20',NULL,20),(20,'Raticate',7,185,55,81,60,50,70,97,413,'Run Away','Guts','50/50','--',19,NULL),(21,'Spearow',3,20,40,60,30,31,31,70,262,'Keen Eye',NULL,'50/50','Lv. 20',NULL,22),(22,'Fearow',12,380,65,90,65,61,61,100,442,'Keen Eye',NULL,'50/50','--',21,NULL),(23,'Ekans',20,69,30,60,44,40,54,55,283,'Intimidate','Shed Skin','50/50','Lv. 22',NULL,24),(24,'Arbok',35,650,60,85,69,65,79,80,438,'Intimidate','Shed Skin','50/50','--',23,NULL),(25,'Pikachu',4,60,35,55,30,50,40,90,300,'Static',NULL,'50/50','Thunderstone',NULL,26),(26,'Raichu',8,300,60,90,55,90,80,100,475,'Static',NULL,'50/50','--',25,NULL),(27,'Sandshrew',6,120,50,75,85,20,30,40,300,'Sand Veil',NULL,'50/50','Lv. 22',NULL,28),(28,'Sandslash',10,295,75,100,110,45,55,65,450,'Sand Veil',NULL,'50/50','--',27,NULL),(29,'Nidoran',4,70,55,47,52,40,40,41,275,'Poison Point','Rivalry','F (100%)','Lv. 16',NULL,30),(30,'Nidorina',8,200,70,62,67,55,55,56,365,'Poison Point','Rivalry','F (100%)','Moon Stone',29,31),(31,'Nidoqueen',13,600,90,82,87,75,85,76,495,'Poison Point','Rivalry','F (100%)','--',30,NULL),(32,'Nidoran',5,90,46,57,40,40,40,50,273,'Poison Point','Rivalry','M (100%)','Lv. 16',NULL,33),(33,'Nidorino',9,195,61,72,57,55,55,65,365,'Poison Point','Rivalry','M (100%)','Moon Stone',32,34),(34,'Nidoking',14,620,81,92,77,85,75,85,495,'Poison Point','Rivalry','M (100%)','--',33,NULL),(35,'Clefairy',6,75,70,45,48,60,65,35,323,'Cute Charm','Magic Guard','F (75%)','Moon Stone',NULL,36),(36,'Clefable',13,400,95,70,73,85,90,60,473,'Cute Charm','Magic Guard','F (75%)','--',35,NULL),(37,'Vulpix',6,99,38,41,40,50,65,65,299,'Flash Fire',NULL,'F (75%)','Fire Stone',NULL,38),(38,'Ninetales',11,199,73,76,75,81,100,100,505,'Flash Fire',NULL,'F (75%)','--',37,NULL),(39,'Jigglypuff',5,55,115,45,20,45,25,20,270,'Cute Charm',NULL,'F (75%)','Moon Stone',NULL,40),(40,'Wigglytuff',10,120,140,70,45,75,50,45,425,'Cute Charm',NULL,'F (75%)','--',39,NULL),(41,'Zubat',8,75,40,45,35,30,40,55,245,'Inner Focus',NULL,'50/50','Lv. 22',NULL,42),(42,'Golbat',16,550,75,80,70,65,75,90,455,'Inner Focus',NULL,'50/50','Friendship',41,NULL),(43,'Oddish',5,54,45,50,55,75,65,30,320,'Chlorophyll',NULL,'50/50','Lv. 21',NULL,44),(44,'Gloom',8,86,60,65,70,85,75,40,395,'Chlorophyll',NULL,'50/50','Leaf Stone',43,45),(45,'Vileplume',12,186,75,80,85,100,90,50,480,'Chlorophyll',NULL,'50/50','--',44,NULL),(46,'Paras',3,54,35,70,55,45,55,25,285,'Effect Spore','Dry Skin','50/50','Lv. 24',NULL,47),(47,'Parasect',10,295,60,95,80,60,80,30,405,'Effect Spore','Dry Skin','50/50','--',46,NULL),(48,'Venonat',10,300,60,55,50,40,55,45,305,'Compoundeyes','Tinted Lens','50/50','Lv. 31',NULL,49),(49,'Venomoth',15,125,70,65,60,90,75,90,450,'Shield Dust','Tinted Lens','50/50','--',48,NULL),(50,'Diglett',2,8,10,55,25,35,45,95,265,'Sand Veil','Arena Trap','50/50','Lv. 26',NULL,51),(51,'Dugtrio',7,333,35,80,50,50,70,120,405,'Sand Veil','Arena Trap','50/50','--',50,NULL),(52,'Meowth',4,42,40,45,35,40,40,90,290,'Pickup','Technician','50/50','Lv. 28',NULL,53),(53,'Persian',10,320,65,70,60,65,65,115,440,'Limber','Technician','50/50','--',52,NULL),(54,'Psyduck',8,196,50,52,48,65,50,55,320,'Damp','Cloud Nine','50/50','Lv. 33',NULL,55),(55,'Golduck',17,766,80,82,78,95,80,85,500,'Damp','Cloud Nine','50/50','--',54,NULL),(56,'Mankey',5,280,40,80,35,35,45,70,305,'Vital Spirit','Anger Point','50/50','Lv. 28',NULL,57),(57,'Primeape',10,320,65,105,60,60,70,95,455,'Vital Spirit','Anger Point','50/50','--',56,NULL),(58,'Growlithe',7,190,55,70,45,70,50,60,350,'Intimidate','Flash Fire','M (75%)','Fire Stone',NULL,59),(59,'Arcanine',19,1550,90,110,80,100,80,95,555,'Intimidate','Flash Fire','M (75%)','--',58,NULL),(60,'Poliwag',6,124,40,50,40,40,40,90,300,'Water Absorb','Damp','50/50','Lv. 25',NULL,61),(61,'Poliwhirl',10,200,65,65,65,50,50,90,385,'Water Absorb','Damp','50/50','Water Stone',60,62),(62,'Poliwrath',13,540,90,85,95,70,90,70,500,'Water Absorb','Damp','50/50','--',61,NULL),(63,'Abra',9,195,25,20,15,105,55,90,310,'Synchronize','Inner Focus','M (75%)','Lv. 16',NULL,64),(64,'Kadabra',13,565,40,35,30,120,70,105,400,'Synchronize','Inner Focus','M (75%)','Trade',63,65),(65,'Alakazam',15,480,55,50,45,135,85,120,490,'Synchronize','Inner Focus','M (75%)','--',64,NULL),(66,'Machop',8,195,70,80,50,35,35,35,305,'Guts','No Guard','M (75%)','Lv. 28',NULL,67),(67,'Machoke',15,705,80,100,70,50,60,45,405,'Guts','No Guard','M (75%)','Trade',66,68),(68,'Machamp',16,1300,90,130,80,65,85,55,505,'Guts','No Guard','M (75%)','--',69,NULL),(69,'Bellsprout',7,40,50,75,35,70,30,40,300,'Chlorophyll',NULL,'50/50','Lv. 21',NULL,70),(70,'Weepinbell',10,64,65,90,50,85,45,55,390,'Chlorophyll',NULL,'50/50','Leaf Stone',69,71),(71,'Victreebel',17,155,80,105,65,100,60,70,480,'Chlorophyll',NULL,'50/50','--',70,NULL),(72,'Tentacool',9,455,40,40,35,50,100,70,335,'Clear Body','Liquid Ooze','50/50','Lv. 30',NULL,73),(73,'Tentacruel',16,550,80,70,65,80,120,100,515,'Clear Body','Liquid Ooze','50/50','--',72,NULL),(74,'Geodude',4,200,40,80,100,30,30,20,300,'Rock Head','Sturdy','50/50','Lv. 25',NULL,75),(75,'Graveler',10,1050,55,95,115,45,45,35,390,'Rock Head','Sturdy','50/50','Trade',74,76),(76,'Golem',14,3000,80,110,130,55,65,45,485,'Rock Head','Sturdy','50/50','--',75,NULL),(77,'Ponyta',10,300,50,85,55,65,65,90,410,'Run Away','Flash Fire','50/50','Lv. 40',NULL,78),(78,'Rapidash',17,950,65,100,70,80,80,105,500,'Run Away','Flash Fire','50/50','--',77,NULL),(79,'Slowpoke',12,360,90,65,65,40,40,15,315,'Oblivious','Own Tempo','50/50','Lv. 37',NULL,80),(80,'Slowbro',16,785,95,75,110,100,80,30,490,'Oblivious','Own Tempo','50/50','--',79,NULL),(81,'Magnemite',3,60,25,35,70,95,55,45,325,'Magnet Pull','Sturdy','None','Lv. 30',NULL,82),(82,'Magneton',10,600,50,60,95,120,70,70,465,'Magnet Pull','Sturdy','None','Level up in Mt. Coronet',81,NULL),(83,'Farfetch\'d',8,150,52,65,55,58,62,60,352,'Keen Eye','Inner Focus','50/50','--',NULL,NULL),(84,'Doduo',14,392,35,85,45,35,35,75,310,'Run Away','Early Bird','50/50','Lv. 31',NULL,85),(85,'Dodrio',18,852,60,110,70,60,60,100,460,'Run Away','Early Bird','50/50','--',84,NULL),(86,'Seel',11,900,65,45,55,45,70,45,325,'Thick Fat','Hydration','50/50','Lv. 34',NULL,87),(87,'Dewgong',17,1200,90,70,80,70,95,70,475,'Thick Fat','Hydration','50/50','--',86,NULL),(88,'Grimer',9,300,80,80,50,40,50,25,325,'Stench','Sticky Hold','50/50','Lv. 38',NULL,89),(89,'Muk',12,300,105,105,75,65,100,50,500,'Stench','Sticky Hold','50/50','--',88,NULL),(90,'Shellder',3,40,30,65,100,45,25,40,305,'Shell Armor','Skill Link','50/50','Water Stone',NULL,91),(91,'Cloyster',15,1325,50,90,180,85,45,70,520,'Shell Armor','Skill Link','50/50','--',90,NULL),(92,'Gastly',13,1,30,35,30,100,35,80,310,'Levitate',NULL,'50/50','Lv. 25',NULL,93),(93,'Haunter',16,1,45,50,45,115,55,95,405,'Levitate',NULL,'50/50','Trade',92,94),(94,'Gengar',15,405,60,65,60,130,75,110,500,'Levitate',NULL,'50/50','--',93,NULL),(95,'Onix',88,2100,35,45,160,30,45,70,385,'Rock Head','Sturdy','50/50','--',NULL,NULL),(96,'Drowzee',10,324,60,48,45,43,90,42,328,'Insomnia','Forewarn','50/50','Lv. 26',NULL,97),(97,'Hypno',16,756,85,73,70,73,115,67,483,'Insomnia','Forewarn','50/50','--',NULL,98),(98,'Krabby',4,65,30,105,90,25,25,50,325,'Hyper Cutter','Shell Armor','50/50','Lv. 28',NULL,99),(99,'Kingler',13,600,55,130,115,50,50,75,475,'Hyper Cutter','Shell Armor','50/50','--',98,NULL),(100,'Voltorb',5,104,40,30,50,55,55,100,330,'Soundproof','Static','None','Lv. 30',NULL,101),(101,'Electrode',12,666,60,50,70,80,80,140,480,'Soundproof','Static','None','--',100,NULL),(102,'Exeggcute',4,25,60,40,80,60,45,40,325,'Chlorophyll',NULL,'50/50','Leaf Stone',NULL,103),(103,'Exeggutor',20,1200,95,95,85,125,65,55,520,'Chlorophyll',NULL,'50/50','--',102,NULL),(104,'Cubone',4,65,50,50,95,40,50,35,320,'Rock Head','Lightningrod','50/50','Lv. 28',NULL,105),(105,'Marowak',10,450,60,80,110,50,80,45,425,'Rock Head','Lightningrod','50/50','--',104,NULL),(106,'Hitmonlee',15,498,50,120,53,35,110,87,455,'Limber','Reckless','M (100%)','--',NULL,NULL),(107,'Hitmonchan',14,502,50,105,79,35,110,76,455,'Keen Eye','Iron Fist','M (100%)','--',NULL,NULL),(108,'Lickitung',12,655,90,55,75,60,75,30,385,'Own Tempo','Oblivious','50/50','--',NULL,NULL),(109,'Koffing',6,10,40,65,95,60,45,35,340,'Levitate',NULL,'50/50','Lv. 35',NULL,110),(110,'Weezing',12,95,65,90,120,85,70,60,490,'Levitate',NULL,'50/50','--',109,NULL),(111,'Rhyhorn',10,1150,80,85,95,30,30,25,345,'Lightningrod','Rock Head','50/50','Lv. 42',NULL,112),(112,'Rhydon',19,1200,105,130,120,45,45,40,485,'Lightningrod','Rock Head','50/50','--',111,NULL),(113,'Chansey',11,346,250,5,5,35,105,50,450,'Natural Cure','Serene Grace','F (100%)','Friendship',NULL,NULL),(114,'Tangela',10,350,65,55,115,100,40,60,435,'Chlorophyll','Leaf Guard','50/50','--',NULL,NULL),(115,'Kangaskhan',22,800,105,95,80,40,80,90,490,'Early Bird','Scrappy','F (100%)','--',NULL,NULL),(116,'Horsea',4,80,30,40,70,70,25,60,295,'Swift Swim','Sniper','50/50','Lv. 32',NULL,117),(117,'Seadra',12,250,55,65,95,95,45,85,440,'Poison Point','Sniper','50/50','--',116,NULL),(118,'Goldeen',6,150,45,67,60,35,50,63,320,'Swift Swim','Water Veil','50/50','Lv. 33',NULL,119),(119,'Seaking',13,390,80,92,65,65,80,68,450,'Swift Swim','Water Veil','50/50','--',118,NULL),(120,'Staryu',8,345,30,45,55,70,55,85,340,'Illuminate','Natural Cure','None','Water Stone',NULL,121),(121,'Starmie',11,800,60,75,85,100,85,115,520,'Illuminate','Natural Cure','None','--',120,NULL),(122,'Mr. Mime',13,545,40,45,65,100,120,90,460,'Soundproof','Filter','50/50','--',NULL,NULL),(123,'Scyther',15,560,70,110,80,55,80,105,500,'Swarm','Technician','50/50','--',NULL,NULL),(124,'Jynx',14,406,65,50,35,115,95,95,455,'Oblivious','Forewarn','F (100%)','--',NULL,NULL),(125,'Electabuzz',11,300,65,83,57,95,85,105,490,'Static',NULL,'M (75%)','--',NULL,NULL),(126,'Magmar',13,445,65,95,57,100,85,93,495,'Flame Body',NULL,'M (75%)','--',NULL,NULL),(127,'Pinsir',15,550,65,125,100,55,70,85,500,'Hyper Cutter','Mold Breaker','50/50','--',NULL,NULL),(128,'Tauros',14,884,75,100,95,40,70,110,490,'Intimidate','Anger Point','M (100%)','--',NULL,NULL),(129,'Magikarp',9,100,20,10,55,15,20,80,200,'Swift Swim',NULL,'50/50','Lv. 20',NULL,130),(130,'Gyarados',65,2350,95,125,79,60,100,81,540,'Intimidate',NULL,'50/50','--',129,NULL),(131,'Lapras',25,2200,130,85,80,85,95,60,535,'Water Absorb','Shell Armor','50/50','--',NULL,NULL),(132,'Ditto',3,40,48,48,48,48,48,48,288,'Limber',NULL,'None','--',NULL,NULL),(133,'Eevee',3,65,55,55,50,45,65,55,325,'Run Away','Adaptability','M (87.5%)','Water Stone, Thunder Stone, Fire Stone',NULL,134),(134,'Vaporeon',10,290,130,65,60,110,95,65,525,'Water Absorb',NULL,'M (87.5%)','--',133,NULL),(135,'Jolteon',8,245,65,65,60,110,95,130,525,'Volt Absorb',NULL,'M (87.5%)','--',133,NULL),(136,'Flareon',9,250,65,130,60,95,110,65,525,'Flash Fire',NULL,'M (87.5%)','--',133,NULL),(137,'Porygon',8,365,65,60,70,85,75,40,395,'Trace','Download','None','--',NULL,NULL),(138,'Omanyte',4,75,35,40,100,90,55,35,355,'Swift Swim','Shell Armor','M (87.5%)','Lv. 40',NULL,139),(139,'Omastar',10,350,70,60,125,115,70,55,495,'Swift Swim','Shell Armor','M (87.5%)','--',138,NULL),(140,'Kabuto',5,115,30,80,90,55,45,55,355,'Swift Swim','Battle Armor','M (87.5%)','Lv. 40',NULL,141),(141,'Kabutops',13,405,60,115,105,65,70,80,495,'Swift Swim','Battle Armor','M (87.5%)','--',140,NULL),(142,'Aerodactyl',18,590,80,105,65,60,75,130,515,'Rock Head','Pressure','M (87.5%)','--',NULL,NULL),(143,'Snorlax',21,4600,160,110,65,65,110,30,540,'Immunity','Thick Fat','M (87.5%)','--',NULL,NULL),(144,'Articuno',17,554,90,85,100,95,125,85,580,'Pressure',NULL,'None','--',NULL,NULL),(145,'Zapdos',16,526,90,90,85,125,90,100,580,'Pressure',NULL,'None','--',NULL,NULL),(146,'Moltres',20,600,90,100,90,125,85,90,580,'Pressure',NULL,'None','--',NULL,NULL),(147,'Dratini',18,33,41,64,45,50,50,50,300,'Shed Skin',NULL,'50/50','Lv. 30',NULL,148),(148,'Dragonair',40,165,61,84,65,70,70,70,420,'Shed Skin',NULL,'50/50','Lv. 55',147,149),(149,'Dragonite',22,2100,91,134,95,100,100,80,600,'Inner Focus',NULL,'50/50','--',148,NULL),(150,'Mewtwo',20,1220,106,110,90,154,90,130,680,'Pressure',NULL,'None','--',NULL,NULL),(151,'Mew',4,40,100,100,100,100,100,100,600,'Synchronize',NULL,'None','--',NULL,NULL);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_has_type`
--

DROP TABLE IF EXISTS `pokemon_has_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_has_type` (
  `pokemon_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pokemon_id`,`type_id`),
  KEY `fk_pokemon_has_type_type1_idx` (`type_id`),
  KEY `fk_pokemon_has_type_pokemon1_idx` (`pokemon_id`),
  CONSTRAINT `fk_pokemon_has_type_pokemon1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_has_type_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_has_type`
--

LOCK TABLES `pokemon_has_type` WRITE;
/*!40000 ALTER TABLE `pokemon_has_type` DISABLE KEYS */;
INSERT INTO `pokemon_has_type` VALUES (1,1),(2,1),(3,1),(43,1),(44,1),(45,1),(46,1),(47,1),(69,1),(70,1),(71,1),(102,1),(103,1),(114,1),(4,2),(5,2),(6,2),(37,2),(38,2),(58,2),(59,2),(77,2),(78,2),(126,2),(136,2),(146,2),(7,3),(8,3),(9,3),(54,3),(55,3),(60,3),(61,3),(62,3),(72,3),(73,3),(79,3),(80,3),(86,3),(87,3),(90,3),(91,3),(98,3),(99,3),(116,3),(117,3),(118,3),(119,3),(120,3),(121,3),(129,3),(130,3),(131,3),(134,3),(138,3),(139,3),(140,3),(141,3),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(46,4),(47,4),(48,4),(49,4),(123,4),(127,4),(16,5),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(35,5),(36,5),(39,5),(40,5),(52,5),(53,5),(83,5),(84,5),(85,5),(108,5),(113,5),(115,5),(128,5),(132,5),(133,5),(137,5),(143,5),(1,6),(2,6),(3,6),(13,6),(14,6),(15,6),(23,6),(24,6),(29,6),(30,6),(31,6),(32,6),(33,6),(34,6),(41,6),(42,6),(43,6),(44,6),(45,6),(48,6),(49,6),(69,6),(70,6),(71,6),(72,6),(73,6),(88,6),(89,6),(92,6),(93,6),(94,6),(109,6),(110,6),(25,7),(26,7),(81,7),(82,7),(100,7),(101,7),(125,7),(135,7),(145,7),(27,8),(28,8),(31,8),(34,8),(50,8),(51,8),(74,8),(75,8),(76,8),(95,8),(104,8),(105,8),(111,8),(112,8),(56,9),(57,9),(62,9),(66,9),(67,9),(68,9),(106,9),(107,9),(63,10),(64,10),(65,10),(79,10),(80,10),(96,10),(97,10),(102,10),(103,10),(121,10),(122,10),(124,10),(150,10),(151,10),(74,11),(75,11),(76,11),(95,11),(111,11),(112,11),(138,11),(139,11),(140,11),(141,11),(142,11),(92,12),(93,12),(94,12),(87,13),(91,13),(124,13),(131,13),(144,13),(147,14),(148,14),(149,14),(6,15),(12,15),(16,15),(17,15),(18,15),(21,15),(22,15),(41,15),(42,15),(83,15),(84,15),(85,15),(123,15),(130,15),(142,15),(144,15),(145,15),(146,15),(149,15),(81,16),(82,16);
/*!40000 ALTER TABLE `pokemon_has_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Grass'),(2,'Fire'),(3,'Water'),(4,'Bug'),(5,'Normal'),(6,'Poison'),(7,'Electric'),(8,'Ground'),(9,'Fighting'),(10,'Psychic'),(11,'Rock'),(12,'Ghost'),(13,'Ice'),(14,'Dragon'),(15,'Flying'),(16,'Steel');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-31 14:41:55
