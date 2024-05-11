-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bioscoop
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_casttofilms`
--

DROP TABLE IF EXISTS `_casttofilms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_casttofilms` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_CastToFilms_AB_unique` (`A`,`B`),
  KEY `_CastToFilms_B_index` (`B`),
  CONSTRAINT `_CastToFilms_A_fkey` FOREIGN KEY (`A`) REFERENCES `cast` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_CastToFilms_B_fkey` FOREIGN KEY (`B`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_casttofilms`
--

LOCK TABLES `_casttofilms` WRITE;
/*!40000 ALTER TABLE `_casttofilms` DISABLE KEYS */;
INSERT INTO `_casttofilms` VALUES (1,1),(2,1),(3,1),(4,1),(6,1),(7,1),(5,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,3),(20,3),(21,3),(22,3),(23,3),(24,4),(25,4),(26,4),(27,4),(28,5),(29,5),(30,5),(31,5),(32,5),(33,6),(34,6),(35,6),(36,6),(37,7),(38,7),(39,7),(40,8),(41,8),(42,8),(43,8),(44,8),(45,8),(46,8),(47,8),(48,8),(49,9),(50,9),(51,9),(52,9),(53,9),(54,9),(55,9),(56,9),(57,9),(58,9),(59,9),(60,9),(61,9),(62,10),(63,10),(64,10),(65,10),(66,10),(67,10),(68,11),(69,11),(70,11),(71,11),(72,11),(73,11),(74,11),(75,11),(76,12),(77,12),(78,12),(79,12),(27,13),(80,13),(81,13),(82,13),(83,13),(85,13),(86,13),(87,13),(88,13),(89,13),(90,13),(228,13),(58,14),(120,14),(121,14),(122,14),(105,15),(106,15),(91,16),(92,16),(93,16),(94,16),(95,16),(96,16),(134,17),(135,17),(136,17),(137,17),(138,17),(139,17),(140,17),(129,18),(130,18),(131,18),(132,18),(133,18),(123,19),(124,19),(125,19),(126,19),(127,19),(128,19),(100,20),(101,20),(102,20),(103,20),(104,20),(115,21),(116,21),(117,21),(118,21),(119,21),(97,22),(98,22),(99,22),(107,23),(108,23),(109,23),(110,23),(111,23),(112,23),(113,23),(114,23),(141,24),(142,24),(143,24),(144,24),(145,24),(146,24),(147,24),(148,24),(149,25),(150,25),(151,25),(152,25),(153,25),(154,26),(155,26),(156,26),(157,26),(158,26),(159,27),(160,27),(161,27),(162,27),(163,27),(164,27),(1,28),(165,28),(166,28),(167,28),(168,28),(169,28),(27,29),(170,29),(171,29),(172,29),(173,29),(174,29),(167,30),(175,30),(176,30),(177,30),(178,30),(179,30),(180,30),(110,31),(181,31),(182,31),(183,31),(184,31),(185,31),(186,31),(187,32),(188,32),(189,32),(190,32),(191,33),(192,33),(193,33),(194,33),(195,34),(196,34),(197,34),(198,34),(199,34),(200,35),(201,35),(202,35),(203,35),(204,35),(205,35),(213,36),(214,36),(215,36),(211,37),(212,37),(182,38),(204,38),(267,38),(268,38),(269,38),(206,39),(207,39),(208,39),(209,39),(210,39),(56,40),(57,40),(154,40),(216,40),(218,41),(219,41),(220,41),(221,41),(222,41),(223,41),(224,41),(225,42),(226,42),(227,42),(228,42),(229,43),(230,43),(231,43),(232,43),(144,44),(233,44),(235,44),(236,44),(237,44),(238,45),(239,45),(240,45),(241,46),(242,46),(243,46),(244,46),(245,46),(246,46),(6,47),(89,47),(247,47),(248,47),(249,47),(250,47),(251,48),(252,48),(253,48),(254,48),(255,49),(256,49),(257,49),(258,49),(259,49),(260,49),(261,49),(262,49),(263,49),(264,50),(265,50),(266,50);
/*!40000 ALTER TABLE `_casttofilms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_filmstogenres`
--

DROP TABLE IF EXISTS `_filmstogenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_filmstogenres` (
  `A` int NOT NULL,
  `B` int NOT NULL,
  UNIQUE KEY `_FilmsToGenres_AB_unique` (`A`,`B`),
  KEY `_FilmsToGenres_B_index` (`B`),
  CONSTRAINT `_FilmsToGenres_A_fkey` FOREIGN KEY (`A`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_FilmsToGenres_B_fkey` FOREIGN KEY (`B`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_filmstogenres`
--

LOCK TABLES `_filmstogenres` WRITE;
/*!40000 ALTER TABLE `_filmstogenres` DISABLE KEYS */;
INSERT INTO `_filmstogenres` VALUES (1,1),(2,1),(7,1),(12,1),(20,1),(21,1),(24,1),(32,1),(35,1),(47,1),(9,3),(14,3),(17,3),(29,3),(40,3),(2,8),(8,8),(11,8),(17,8),(22,8),(27,8),(36,8),(41,8),(3,9),(8,9),(11,9),(14,9),(17,9),(18,9),(26,9),(27,9),(30,9),(34,9),(36,9),(41,9),(27,10),(2,11),(35,11),(6,12),(10,12),(16,12),(22,12),(31,12),(43,12),(44,12),(47,12),(40,13),(9,14),(14,14),(20,14),(37,14),(40,14),(4,15),(5,15),(13,15),(14,15),(15,15),(16,15),(19,15),(25,15),(26,15),(28,15),(33,15),(37,15),(38,15),(39,15),(42,15),(45,15),(48,15),(49,15),(14,16),(30,17),(42,17),(18,18),(25,18),(30,18),(39,18),(48,18),(50,18),(18,19),(39,19),(5,20),(7,20),(33,20),(43,20),(6,21),(49,21),(38,22),(13,23),(1,24),(12,24),(24,24),(32,24),(50,25),(31,26),(23,27),(46,27);
/*!40000 ALTER TABLE `_filmstogenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('059ff87a-17f8-458e-9964-f426d90e656f','9b34e4ce6c151ceda3f04fca96806ee34b2a39f36a95bc202cf8bfa6102ac540','2024-01-06 13:42:07.673','20240106134207_init',NULL,NULL,'2024-01-06 13:42:07.617',1),('35c68cb3-f9a0-4cff-893b-9d7ff12d12b1','89435e7b65f75db3df14a9cc902f5314dbf64e787d19e45596f08ea79351d3da','2024-01-14 17:53:43.613','20240114175343_init',NULL,NULL,'2024-01-14 17:53:43.591',1),('58a08d42-c9f2-4b84-aac7-9da86aed0071','406615bb7cc28ced83ff09bc349f6b6320c7f272197318d89a4cc2d5175a0638','2023-12-20 12:35:45.058','20231220123544_init',NULL,NULL,'2023-12-20 12:35:44.619',1),('862b2f6c-4eb3-4a02-abfa-9307c6f43ae7','a0e1079d02b2658b9914e4a163af7b87921c24098b35bd9da010fbadf6bc17d1','2024-01-14 17:52:49.241','20240114175249_init',NULL,NULL,'2024-01-14 17:52:49.233',1),('9e9f1f92-01f9-4086-8725-926650db7eed','a261da4c6f2c41d9230abc74b7dc63ec73028664ccc30a398bd21952e167eeab','2024-01-14 17:52:26.247','20240114175226_init',NULL,NULL,'2024-01-14 17:52:26.205',1),('c11ef812-c68f-4301-94db-658944ce0058','768b776971bbe983dac2d9c33ef2eaca32496d68e43b637028fc9f4b3cc6e585','2024-01-12 12:23:24.229','20240112122324_init',NULL,NULL,'2024-01-12 12:23:24.185',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `achternaam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` VALUES (1,'Andrea','Riseborough'),(2,'Demián','Bichir'),(3,'John','Cho'),(4,'Lin','Shaye'),(5,'Kristen','Stewart'),(6,'Betty','Gilpin'),(7,'Jacki','Weaver'),(14,'Vincent','Cassel'),(15,'Jessica','Henwick'),(16,'John','Gallagher Jr.'),(17,'Mamoudou','Athie'),(18,'T.J.','Miller'),(19,'Tiffany','Haddish'),(20,'Rose','Byrne'),(21,'Salma','Hayek'),(22,'Jennifer','Coolidge'),(23,'Billy','Porter'),(24,'Richard','Gere'),(25,'Peter','Dinklage'),(26,'Walton','Goggins'),(27,'Bradley','Whitford'),(28,'Josh','Hartnett'),(29,'Margarita','Levieva'),(30,'Chandler','Riggs'),(31,'Bruce','Dern'),(32,'Owen','Teague'),(33,'Freya','Tingley'),(34,'Simon','Abkarian'),(35,'Rutger','Hauer'),(36,'James','Faulkner'),(37,'Mena','Suvari'),(38,'Nick','Stahl'),(39,'Taryn','Manning'),(40,'Will','Smith'),(41,'Martin','Lawrence'),(42,'Vanessa','Hudgens'),(43,'Alexander','Ludwig'),(44,'Charles','Melton'),(45,'Paola','Núñez'),(46,'Kate','del Castillo'),(47,'Nicky','Jam'),(48,'Joe','Pantoliano'),(49,'Robert','Downey Jr.'),(50,'Antonio','Banderas'),(51,'Michael','Sheen'),(52,'Emma','Thompson'),(53,'Rami','Malek'),(54,'John','Cena'),(55,'Kumail','Nanjiani'),(56,'Octavia','Spencer'),(57,'Tom','Holland'),(58,'Craig','Robinson'),(59,'Ralph','Fiennes'),(60,'Selena','Gomez'),(61,'Marion','Cotillard'),(62,'Crystal','R. Fox'),(63,'Phylicia','Rashad'),(64,'Bresha','Webb'),(65,'Mehcad','Brooks'),(66,'Cicely','Tyson'),(67,'Tyler','Perry'),(68,'Matthew','McConaughey'),(69,'Charlie','Hunnam'),(70,'Henry','Golding'),(71,'Michelle','Dockery'),(72,'Jeremy','Strong'),(73,'Eddie','Marsan'),(74,'Colin','Farrell'),(75,'Hugh','Grant'),(76,'Mackenzie','Davis'),(77,'Finn','Wolfhard'),(78,'Brooklynn','Prince'),(79,'Joely','Richardson'),(80,'Sebastian','Stan'),(81,'Christopher','Plummer'),(82,'William','Hurt'),(83,'Ed','Harris'),(85,'Peter','Fonda'),(86,'LisaGay','Hamilton'),(87,'Jeremy','Irvine'),(88,'Diane','Ladd'),(89,'Amy','Madigan'),(90,'John','Savage'),(91,'Terry','Crews'),(92,'Ludacris',''),(93,'Jamila','Velazquez'),(94,'Ken','Foree'),(95,'Tyler','Alvarez'),(96,'Joseph','Julian Soria'),(97,'Blake','Lively'),(98,'Jude','Law'),(99,'Sterling','K. Brown'),(100,'Sophia','Lillis'),(101,'Sammy','Leakey'),(102,'Charles','Babalola'),(103,'Jessica','De Gouw'),(104,'Alice','Krige'),(105,'Julia','Garner'),(106,'Matthew','Macfadyen'),(107,'Margot','Robbie'),(108,'Mary','Elizabeth Winstead'),(109,'Jurnee','Smollett-Bell'),(110,'Rosie','Perez'),(111,'Chris','Messina'),(112,'Ella','Jay Basco'),(113,'Ali','Wong'),(114,'Ewan','McGregor'),(115,'Riley','Keough'),(116,'Jaeden','Martell'),(117,'Lia','McHugh'),(118,'Richard','Armitage'),(119,'Alicia','Silverstone'),(120,'Winslow','Fegley'),(121,'Ophelia','Lovibond'),(122,'Wallace','Shawn'),(123,'Alison','Brie'),(124,'Debby','Ryan'),(125,'John','Paul Reynolds'),(126,'Molly','Shannon'),(127,'John','Ortiz'),(128,'Paul','Reiser'),(129,'Lana','Condor'),(130,'Noah','Centineo'),(131,'Jordan','Fisher'),(132,'Anna','Cathcart'),(133,'John','Corbett'),(134,'James','Marsden'),(135,'Ben','Schwartz'),(136,'Tika','Sumpter'),(137,'Natasha','Rothwell'),(138,'Adam','Pally'),(139,'Neal','McDonough'),(140,'Jim','Carrey'),(141,'Michael','Peña'),(142,'Maggie','Q'),(143,'Lucy','Hale'),(144,'Austin','Stowell'),(145,'Portia','Doubleday'),(146,'Jimmy','O. Yang'),(147,'Ryan','Hansen'),(148,'Michael','Rooker'),(149,'Issa','Rae'),(150,'Lakeith','Stanfield'),(151,'Chelsea','Peretti'),(152,'Lil','Rel Howery'),(153,'Courtney','B. Vance'),(154,'Julia','Louis-Dreyfus'),(155,'Will','Ferrell'),(156,'Miranda','Otto'),(157,'Zoë','Chao'),(158,'Zach','Woods'),(159,'Drew','Van Acker'),(160,'Poppy','Delevingne'),(161,'Natasha','Bassett'),(162,'Max','Silvestri'),(163,'Brittany','Furlan'),(164,'Blake','Anderson'),(165,'Tahar','Rahim'),(166,'Zoe','Kazan'),(167,'Bill','Nighy'),(168,'Caleb','Landry Jones'),(169,'Jay','Baruchel'),(170,'Harrison','Ford'),(171,'Omar','Sy'),(172,'Cara','Gee'),(173,'Dan','Stevens'),(174,'Karen','Gillan'),(175,'Anya','Taylor-Joy'),(176,'Johnny','Flynn'),(177,'Josh','O\'Connor'),(178,'Callum','Turner'),(179,'Mia','Goth'),(180,'Miranda','Hart'),(181,'Anne','Hathaway'),(182,'Ben','Affleck'),(183,'Edi','Gathegi'),(184,'Mel','Rodriguez'),(185,'Toby','Jones'),(186,'Willem','Dafoe'),(187,'Katie','Holmes'),(188,'Owain','Yeoman'),(189,'Christopher','Convery'),(190,'Ralph','Ineson'),(191,'Tye','Sheridan'),(192,'Ana','de Armas'),(193,'Helen','Hunt'),(194,'John','Leguizamo'),(195,'Brian','Quinn'),(196,'Joe','Gatto'),(197,'Sal','Vulcano'),(198,'James','Murray'),(199,'Paula','Abdul'),(200,'Elisabeth','Moss'),(201,'Aldis','Hodge'),(202,'Storm','Reid'),(203,'Harriet','Dyer'),(204,'Michael','Dorman'),(205,'Oliver','Jackson-Cohen'),(206,'Elle','Fanning'),(207,'Justice','Smith'),(208,'Alexandra','Shipp'),(209,'Keegan-Michael','Key'),(210,'Luke','Wilson'),(211,'Tommie Lynn','Milazzo'),(212,'Shay','Walker'),(213,'Daniel','Radcliffe'),(214,'Samara','Weaving'),(215,'Natasha','Liu Bordizzo'),(216,'Chris','Pratt'),(218,'Mark','Wahlberg'),(219,'Winston','Duke'),(220,'Alan','Arkin'),(221,'Iliza','Shlesinger'),(222,'Bokeem','Woodbine'),(223,'Marc','Maron'),(224,'Austin','Post'),(225,'Anthony','Mackie'),(226,'Nicholas','Hoult'),(227,'Nia','Long'),(228,'Samuel L.','Jackson'),(229,'Claes','Bang'),(230,'Elizabeth','Debicki'),(231,'Mick','Jagger'),(232,'Donald','Sutherland'),(233,'Haley','Bennett'),(235,'Elizabeth','Marvel'),(236,'David','Rasche'),(237,'Denis','O\'Hare'),(238,'John','Magaro'),(239,'Orion','Hall'),(240,'René','Auberjonois'),(241,'Vin','Diesel'),(242,'Eiza','González'),(243,'Sam','Heughan'),(244,'Toby','Kebbell'),(245,'Lamorne','Morris'),(246,'Guy','Pearce'),(247,'Ike','Barinholtz'),(248,'Emma','Roberts'),(249,'Ethan','Suplee'),(250,'Hilary','Swank'),(251,'KJ','Apa'),(252,'Britt','Robertson'),(253,'Shania','Twain'),(254,'Gary','Sinise'),(255,'Amy','Ryan'),(256,'Thomasin','McKenzie'),(257,'Lola','Kirke'),(258,'Oona','Laurence'),(259,'Dean','Winters'),(260,'Miriam','Shor'),(261,'Reed','Birney'),(262,'Kevin','Corrigan'),(263,'Gabriel','Byrne'),(264,'Grace','VanderWaal'),(265,'Graham','Verchere'),(266,'Giancarlo','Esposito'),(267,'Al','Madrigal'),(268,'Janina','Gavankar'),(269,'Glynn','Turman');
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speelDuur` int NOT NULL,
  `beschrijving` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `releaseDatum` datetime(3) NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Films_thumbnail_key` (`thumbnail`),
  UNIQUE KEY `Films_titel_key` (`titel`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'The Grudge',91,'The Grudge is a 2020 American psychological supernatural horror film written and directed by Nicolas Pesce. Originally announced as a reboot of the 2004 American remake and the original 2002 Japanese horror film Ju-On: The Grudge, the film ended up taking place before and during the events of the 2004 film and its two direct sequels, and is the fourth installment in the American The Grudge film series. The film stars Andrea Riseborough, Demián Bichir, John Cho, Betty Gilpin, Lin Shaye, and Jacki Weaver, and follows a police officer who investigates several murders that are seemingly connected to a single house.','2005-02-02 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/3/34/The_Grudge_2020_Poster.jpeg'),(2,'Underwater',95,'Underwater is a 2020 American science fiction action horror film directed by William Eubank. The film stars Kristen Stewart, Vincent Cassel, Jessica Henwick, John Gallagher Jr., Mamoudou Athie, and T.J. Miller.','2020-01-10 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/4/4a/Underwater_poster.jpeg'),(3,'Like a Boss',83,'Like a Boss is a 2020 American comedy film directed by Miguel Arteta, written by Sam Pitman and Adam Cole-Kelly, and starring Tiffany Haddish, Rose Byrne, and Salma Hayek. The plot follows two friends who attempt to take back control of their cosmetics company from an industry titan.','2020-01-10 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/9/9a/LikeaBossPoster.jpg'),(4,'Three Christs',117,'Three Christs, also known as State of Mind, is a 2017 American drama film directed, co-produced, and co-written by Jon Avnet and based on Milton Rokeach\'s nonfiction book The Three Christs of Ypsilanti. It screened in the Gala Presentations section at the 2017 Toronto International Film Festival. The film is also known as: Three Christs of Ypsilanti, The Three Christs of Ypsilanti, Three Christs of Santa Monica, and The Three Christs of Santa Monica.','2020-01-03 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/a/a1/Three_Christs_poster.jpg'),(5,'Inherit the Viper',90,'Inherit the Viper is a 2019 American crime drama film directed by Anthony Jerjen, in his feature directorial debut, from a screenplay by Andrew Crabtree. It stars Josh Hartnett, Margarita Levieva, Chandler Riggs, Bruce Dern, Valorie Curry, Owen Teague, and Dash Mihok.','2020-01-10 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/1/1c/Inherit_the_Viper_%282019%29_Film_Poster.jpg'),(6,'The Sonata',90,'The Sonata is a 2018 mystery thriller film, directed by Andrew Desmond, from a screenplay by Desmond and Arthur Morin. It stars Freya Tingley, Simon Abkarian, James Faulkner, Rutger Hauer, Matt Barber and James Kermack. It was released in the United States on January 10, 2020, by Screen Media Films. It grossed $146,595 at the box office and received mixed reviews from critics.','2018-11-15 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/1/13/The_Sonata_%282018%29_Film_Poster.jpg'),(7,'The Murder of Nicole Brown Simpson',82,'The Murder of Nicole Brown Simpson is a 2019 American crime horror film directed by Daniel Farrands. The film is loosely based on the murder of Nicole Brown Simpson, presenting a version of events in which Brown Simpson is murdered by serial killer Glen Edward Rogers, and not by O. J. Simpson, her ex-husband and the primary suspect in the case. Though Mena Suvari\'s performance as Nicole Brown was praised, the film was panned by critics.','2019-12-09 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/e/ed/The_Murder_of_Nicole_Brown_Simpson_poster.jpg'),(8,'Bad Boys for Life',124,'Bad Boys for Life is a 2020 American buddy cop action comedy film directed by Adil & Bilall. It is the sequel to Bad Boys II (2003) and the third installment in the Bad Boys franchise. Will Smith, Martin Lawrence, Joe Pantoliano and Theresa Randle reprise their roles in the film and are joined by Paola Núñez, Vanessa Hudgens, Jacob Scipio, Alexander Ludwig, Charles Melton, Kate del Castillo and Nicky Jam. The film was produced by Smith, Jerry Bruckheimer, and Doug Belgrad, with a screenplay written by Chris Bremner, Peter Craig and Joe Carnahan. In Bad Boys for Life, Miami detectives Mike Lowrey and Marcus Burnett investigate a string of murders tied to Lowrey\'s troubled past.','2020-01-17 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/9/90/Bad_Boys_for_Life_poster.jpg'),(9,'Dolittle',101,'Dolittle is a 2020 American fantasy adventure film directed by Stephen Gaghan from a screenplay by Gaghan, Dan Gregor, and Doug Mand, based on a story by Thomas Shepherd. Dolittle is based on the titel character created by Hugh Lofting and is primarily inspired by the author\'s second Doctor Dolittle book, The Voyages of Doctor Dolittle (1922). Robert Downey Jr. stars as the titel character, alongside Antonio Banderas and Michael Sheen in live-action roles, with Emma Thompson, Rami Malek, John Cena, Kumail Nanjiani, Octavia Spencer, Tom Holland, Craig Robinson, Ralph Fiennes, Selena Gomez, and Marion Cotillard voicing an array of creatures.','2020-01-17 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/1/1f/Dolittle_%282020_film_poster%29.png'),(10,'A Fall from Grace',120,'A Fall from Grace is a 2020 American thriller film produced, written, and directed by Tyler Perry and his first to be released by Netflix. The film follows a woman who finds a dangerous new love and the novice attorney who defends her in a sensational court case. This was the final film of actor Cicely Tyson before her death in January 2021.','2020-01-17 23:00:00.000','https://upload.wikimedia.org/wikipedia/en/4/4e/AFallFromGrace.png'),(11,'The Gentlemen',113,'The Gentlemen is a 2019 action comedy film written, directed and produced by Guy Ritchie, who developed the story along with Ivan Atkinson and Marn Davies. The film stars Matthew McConaughey, Charlie Hunnam, Henry Golding, Michelle Dockery, Jeremy Strong, Eddie Marsan, Colin Farrell, and Hugh Grant. It follows an American cannabis wholesaler in England who is looking to sell his business, setting off a chain of blackmail and schemes to undermine him.','2019-12-03 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/0/06/The_Gentlemen_poster.jpg'),(12,'The Turning',94,'The Turning is a 2020 American gothic supernatural horror film directed by Floria Sigismondi and written by Carey W. Hayes and Chad Hayes. It is a modern adaptation of the 1898 ghost story The Turn of the Screw by Henry James. It stars Mackenzie Davis, Finn Wolfhard, Brooklynn Prince, and Joely Richardson, and follows a young governess in 1994 who is hired to watch over two children after their parents are killed.','2020-01-24 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/a/a2/The_Turning_poster_2020.jpg'),(13,'The Last Full Measure',116,'The Last Full Measure is a 2019 American war drama film written and directed by Todd Robinson. It follows the efforts of fictional Pentagon staffer Scott Huffman and many veterans to see the Medal of Honor awarded to William H. Pitsenbarger, a United States Air Force Pararescueman who flew in helicopter rescue missions during the Vietnam War to aid downed soldiers and pilots. Based on true events, the film stars Sebastian Stan, Christopher Plummer, William Hurt, Ed Harris, Samuel L. Jackson, Jeremy Irvine, and Peter Fonda. It was the final film appearance of Fonda, who died before the film’s release; and Plummer\'s final on screen appearance before his death in 2021, though it had filmed prior to Knives Out which was released before it.','2020-01-24 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/9/9d/The_Last_Full_Measure_2019_poster.jpg'),(14,'Timmy Failure: Mistakes Were Made',99,'Timmy Failure: Mistakes Were Made is a 2020 American adventure fantasy comedy-drama family film based on the book series of the same name by Stephan Pastis that debuted on Disney+ on February 7, 2020. The film is directed by Tom McCarthy, produced by Alexander Dostal, McCarthy and Jim Whitaker from a screenplay written by McCarthy and Pastis and stars Winslow Fegley, Ophelia Lovibond, Craig Robinson and Wallace Shawn.','2020-01-25 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/c/c8/Timmy_Failure_Mistakes_Were_Made_Poster.jpeg'),(15,'The Assistant',91,'The Assistant is a 2019 American drama film written, directed, produced, and edited by Kitty Green. The film stars Julia Garner as a junior assistant at a film production company. Matthew Macfadyen, Makenzie Leigh, Kristine Froseth, Jon Orsini, and Noah Robbins also star.','2020-01-31 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/9/9b/The_Assistant_poster.jpeg'),(16,'John Henry',91,'John Henry is a 2020 American thriller drama film starring Terry Crews and Ludacris, and directed by Will Forbes. Inspired by the folk lore of John Henry, the plot follows an ex-gang member from Los Angeles who must help two immigrant children who are on the run from his former crime boss. The film had a limited release on January 24, 2020, and received negative reviews from critics.','2020-01-24 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/b/b8/JohnHenryPoster.jpeg'),(17,'Sonic the Hedgehog',99,'Sonic the Hedgehog is a 2020 action-adventure comedy film based on the video game series published by Sega. Directed by Jeff Fowler and written by Pat Casey and Josh Miller, it stars Ben Schwartz as the voice of Sonic the Hedgehog, alongside Jim Carrey and James Marsden, with supporting roles by Tika Sumpter, Natasha Rothwell, Adam Pally, Lee Majdoub and Neal McDonough. The film follows Sonic, a blue anthropomorphic hedgehog who can run at supersonic speeds. He teams up with a town sheriff, Tom Wachowski (Marsden), to stop the mad scientist Dr. Robotnik (Carrey).','2020-06-26 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/4/45/Sonic_the_Hedgehog_film_poster.jpg'),(18,'To All the Boys: P.S. I Still Love You',102,'To All the Boys: P.S. I Still Love You is a 2020 American teen romantic comedy film directed by Michael Fimognari and written by Sofia Alvarez and J. Mills Goodloe. The film stars Lana Condor, Noah Centineo, Janel Parrish, Anna Cathcart, Trezzo Mahoro, Madeleine Arthur, Emilija Baranac, Kelcey Mawema, Jordan Fisher, Ross Butler, Julie Tao, Sarayu Blue, John Corbett, and Holland Taylor. The film is based on Jenny Han\'s 2015 novel P.S. I Still Love You.','2020-02-12 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/b/bc/To_All_the_Boys_-_P.S._I_Still_Love_You_official_release_poster.jpg'),(19,'Horse Girl',104,'Horse Girl is a 2020 American psychological drama film directed and produced by Jeff Baena, from a screenplay written by Baena and Alison Brie. It stars Brie, Debby Ryan, John Reynolds, Molly Shannon, John Ortiz, and Paul Reiser.','2020-01-27 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/3/37/Horse_Girl_poster.jpg'),(20,'Gretel & Hansel',87,'Gretel & Hansel is a 2020 dark fantasy horror film based on the German folklore tale \\\"Hansel and Gretel\\\" by the Brothers Grimm. The film is directed by Oz Perkins, and produced by Fred Berger, Brian Kavanaugh-Jones, and Dan Kagan, with a screenplay by Rob Hayes. Sophia Lillis and Sam Leakey portray the titular characters, alongside Alice Krige and Jessica De Gouw. The story follows Gretel and Hansel as they enter the dark woods in order to find work and food, and then stumble upon the home of a witch.','2020-01-31 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/d/de/Gretel_%26_Hansel_-_A_Grim_Fairy_Tale_theatrical_poster.jpeg'),(21,'The Lodge',100,'The Lodge is a 2019 psychological horror film directed by Veronika Franz and Severin Fiala, written by Franz, Fiala, and Sergio Casci, and starring Riley Keough, Jaeden Martell, Lia McHugh, Alicia Silverstone, and Richard Armitage. Its plot follows a soon-to-be stepmother who, alone with her fiancé\'s two children, becomes stranded at their rural lodge during Christmas. There, she and the children experience a number of unexplained events that seem to be connected to her past.','2019-01-25 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/c/cf/The_Lodge_poster.jpg'),(22,'The Rhythm Section',110,'The Rhythm Section is a 2020 action thriller film directed by Reed Morano and with a screenplay by Mark Burnell based on his novel of the same name. Starring Blake Lively, Jude Law and Sterling K. Brown, and follows a grieving woman who seeks revenge after discovering that the plane crash that killed her family was a terrorist attack.','2020-01-31 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/9/98/The_Rhythm_Section_poster.jpg'),(23,'Birds of Prey',109,'Birds of Prey (and the Fantabulous Emancipation of One Harley Quinn), also known as Harley Quinn: Birds of Prey or simply Birds of Prey, is a 2020 American superhero film directed by Cathy Yan and written by Christina Hodson, based on the DC Comics team, the Birds of Prey. Produced by Warner Bros., DC Films, LuckyChap Entertainment, Clubhouse Pictures, and Kroll & Co. Entertainment, it is the eighth installment in the DC Extended Universe (DCEU), and serves as a spin-off and sequel to Suicide Squad (2016). It stars Margot Robbie as Harley Quinn alongside Mary Elizabeth Winstead, Jurnee Smollett-Bell, Rosie Perez, Chris Messina, Ella Jay Basco, Ali Wong, and Ewan McGregor. The film follows Harley Quinn, who, after breaking up with the Joker, is threatened by Gotham City crime lord Roman Sionis, and joins forces with Helena Bertinelli, Dinah Lance and Renee Montoya (who go on to form the Birds of Prey) to save Cassandra Cain.','2020-02-07 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/1/1c/Birds_of_Prey_%282020_film%29_poster.jpg'),(24,'Fantasy Island',109,'Fantasy Island, also known as Blumhouse\'s Fantasy Island, is a 2020 American supernatural horror film directed and co-written by Jeff Wadlow. Serving both as a horror reimagining and a prequel to ABC\'s 1977 television series of the same name, it stars Michael Peña, Maggie Q, Lucy Hale, Austin Stowell, Jimmy O. Yang, Ryan Hansen, Portia Doubleday, and Michael Rooker and follows a group of people who, while visiting the eponymous island, discover that their dream-like fantasies brought to life begin to turn into horrific living nightmares and they must try to survive.','2020-02-14 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/7/7e/Fantasy_Island_poster.jpg'),(25,'The Photograph',106,'The Photograph is a 2020 American romantic drama film written and directed by Stella Meghie. It follows the estranged daughter of a famous photographer who falls in love with the journalist who is investigating her late mother\'s life. Chelsea Peretti, Lil Rel Howery and Courtney B. Vance also star.','2020-02-14 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/c/c4/The_Photograph_poster.jpg'),(26,'Downhill',86,'Downhill is a 2020 American black comedy-drama film directed by Nat Faxon and Jim Rash, who also co-wrote the script with Jesse Armstrong. The film is a remake of Force Majeure (2014) by Swedish director Ruben Östlund. It stars Julia Louis-Dreyfus and Will Ferrell as a married couple going through a rough patch after a near-death encounter during a family ski outing.\",','2020-02-14 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/6/6a/Downhill_poster.jpeg'),(27,'Spy Intervention',93,'Spy Intervention is a 2020 American action comedy spy film directed by Drew Mylrea and written by Mark Famiglietti and Lane Garrison. The film stars Drew Van Acker, Poppy Delevingne and Blake Anderson.','2020-02-14 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/c/cf/Spy_Intervention_%282020%29_Film_Poster.jpg'),(28,'The Kindness of Strangers',112,'The Kindness of Strangers is a 2019 internationally co-produced drama film, written and directed by Lone Scherfig. It stars Zoe Kazan, Tahar Rahim, Esben Smed, Andrea Riseborough, and Caleb Landry Jones.','2019-12-06 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/8/8d/The_Kindness_of_Strangers_poster.jpg'),(29,'The Call of the Wild',100,'The Call of the Wild is a 2020 American adventure film based on Jack London\'s 1903 novel of the same name. Directed by Chris Sanders, in his live-action directorial debut, and his first film without a co-director, the film was written by Michael Green, and stars Harrison Ford, Omar Sy, Cara Gee, Dan Stevens, Karen Gillan, and Bradley Whitford. Set during the 1890s Klondike Gold Rush, the film follows a dog named Buck as he is stolen from his home in California and sent to the Yukon, where he befriends an old outdoorsman and begins a life-altering adventure.','2020-02-21 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/4/43/The_Call_of_the_Wild_poster.jpg'),(30,'Emma',124,'Emma is a 2020 period romantic comedy film directed by Autumn de Wilde, from a screenplay by Eleanor Catton, based on Jane Austen\'s 1815 novel of the same name. It stars Anya Taylor-Joy as Miss Emma Woodhouse, a wealthy and elegant young woman living with her father in Regency-era England who amuses herself with matchmaking and meddles in the romantic lives of those closest to her. The film also stars Johnny Flynn, Josh O\'Connor, Callum Turner, Mia Goth, Miranda Hart, and Bill Nighy.','2020-02-14 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/5/53/Emma_poster.jpeg'),(31,'The Last Thing He Wanted',120,'The Last Thing He Wanted is a 2020 political thriller film directed by Dee Rees, based on the 1996 novel of the same name by Joan Didion, from a screenplay by Rees and Marco Villalobos. The film stars Anne Hathaway, Ben Affleck, Rosie Perez, Edi Gathegi, Mel Rodriguez, Toby Jones, and Willem Dafoe.','2020-02-14 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/4/4e/The_Last_Thing_He_Wanted.jpg'),(32,'Brahms: The Boy II',86,'Brahms: The Boy II is a 2020 American supernatural horror film starring Katie Holmes, Ralph Ineson, Christopher Convery and Owain Yeoman. A sequel to the 2016 film The Boy, it is directed by William Brent Bell and written by Stacey Menear, the respective director and writer of the original film.','2020-02-21 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/5/51/Brahms_The_Boy_Poster.jpg'),(33,'The Night Clerk',90,'The Night Clerk is a 2020 American crime drama film, written and directed by Michael Cristofer. It stars Tye Sheridan, Ana de Armas, John Leguizamo and Helen Hunt, and follows a hotel night clerk who becomes the center of a murder investigation. The film was released on February 21, 2020, by Saban Films. On June 6, 2020, Netflix released the film on its platform. The film has received negative reviews from critics who criticized it for its lackluster story, deriative, and undeveloped characters; however, Sheridan\'s performance did receive praise.','2020-02-21 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/9/9f/The_Night_Clerk_poster.jpeg'),(34,'Impractical Jokers: The Movie',93,'Impractical Jokers: The Movie is a 2020 American reality comedy film directed by Chris Henchy, based on the truTV television series Impractical Jokers. The film stars Brian Quinn, James Murray, Sal Vulcano, and Joe Gatto, also known as The Tenderloins. It was theatrically released on February 21, 2020. The film received generally mixed reviews and was a box office success, grossing $10 million against a budget of $3 million.','2020-02-21 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/6/6a/Impractical_Jokers_The_Movie_poster.png'),(35,'The Invisible Man',125,'The Invisible Man is a 2020 science fiction horror film written and directed by Leigh Whannell. Inspired by H. G. Wells\' novel of the same name, it stars Elisabeth Moss as a woman who believes she is being stalked and gaslit by her seemingly deceased ex-boyfriend after he acquires the ability to become invisible. Aldis Hodge, Storm Reid, Harriet Dyer, and Michael Dorman appear in supporting roles.','2020-02-25 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/3/3a/The_Invisible_Man_%282020_film%29_-_release_poster.jpg'),(36,'Guns Akimbo',95,'Guns Akimbo is a 2019 action comedy film written and directed by Jason Lei Howden. It stars Daniel Radcliffe, Samara Weaving, Ned Dennehy, Natasha Liu Bordizzo, Grant Bowler, Edwin Wright, Rhys Darby, Milo Cawthorne, Richard Knowles, and Mark Rowley.','2020-03-05 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/1/1f/Guns_Akimbo_poster.jpg'),(37,'Wendy',112,'Wendy is a 2020 American fantasy drama film directed by Benh Zeitlin, from a screenplay by Zeitlin and Eliza Zeitlin. The film stars Devin France, Yashua Mack, Gage Naquin, Gavin Naquin, Ahmad Cage, Krzysztof Meyn, and Romyri Ross. It is intended to be a re-imagining of J. M. Barrie\'s Peter Pan.','2020-01-26 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/a/ac/Wendy_poster.jpg'),(38,'The Way Back',133,'The Way Back is a 2020 American sports drama film directed by Gavin O\'Connor and written by Brad Ingelsby. It stars Ben Affleck, Al Madrigal, Michaela Watkins, and Janina Gavankar, and follows an alcoholic construction worker who is recruited to become head coach of the basketball team at the high school where he was a star.','2020-03-06 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/c/c3/The_Way_Back_poster.jpeg'),(39,'All the Bright Places',108,'All the Bright Places is a 2020 American teen romantic drama film, directed by Brett Haley, from a screenplay by Jennifer Niven and Liz Hannah, adapted from the novel of the same name by Niven. It stars Elle Fanning, Justice Smith, Alexandra Shipp, Kelli O\'Hara, Lamar Johnson, Virginia Gardner, Felix Mallard, Sofia Hasmik, Keegan-Michael Key, and Luke Wilson.','2020-02-28 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/8/8c/All_the_Bright_Places.jpeg'),(40,'Onward',102,'Onward is a 2020 American computer-animated urban fantasy adventure film produced by Pixar Animation Studios and distributed by Walt Disney Studios Motion Pictures. The film was directed by Dan Scanlon, produced by Kori Rae, and written by Scanlon, Jason Headley, and Keith Bunin. The film stars the voices of Tom Holland, Chris Pratt, Julia Louis-Dreyfus, and Octavia Spencer. Set in a suburban fantasy world for the modern day, the film follows two elf brothers named Ian and Barley Lightfoot who set out on a quest to find an artifact that will temporarily bring back their deceased father named Wilden (Bornheimer) for twenty-four hours before the time is up. Along the way, their journey is filled with cryptic maps, impossible obstacles and unimaginable discoveries.','2020-03-06 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/0/03/Onward_poster.jpg'),(41,'Spenser Confidential',111,'Spenser Confidential is a 2020 American action comedy film directed by Peter Berg and with a screenplay written by Sean O\'Keefe and Brian Helgeland. The film stars Mark Wahlberg, Winston Duke, Alan Arkin, Iliza Shlesinger, Bokeem Woodbine, Donald Cerrone, Marc Maron, and Post Malone and marks the fifth collaboration between Wahlberg and Berg after Lone Survivor, Deepwater Horizon, Patriots Day, and Mile 22.','2020-03-06 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/c/c6/Spenser_Confidential_poster.jpg'),(42,'The Banker',121,'The Banker is a 2020 American period drama film directed, co-written and produced by George Nolfi. The film stars Anthony Mackie, Nicholas Hoult, Nia Long, Jessie T. Usher and Samuel L. Jackson. The story follows Joe Morris (Jackson) and Bernard Garrett (Mackie), two of the first African-American bankers in the United States.','2020-03-06 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/7/72/The_Banker_poster.jpeg'),(43,'The Burnt Orange Heresy',99,'The Burnt Orange Heresy is a 2019 crime thriller film directed by Giuseppe Capotondi and with a screenplay by Scott Smith. The film is based on the book of the same name by Charles Willeford and stars Claes Bang, Elizabeth Debicki, Mick Jagger, and Donald Sutherland.','2020-03-06 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/2/26/The_Burnt_Orange_Heresey.jpeg'),(44,'Swallow',95,'Swallow is a 2019 psychological thriller film written and directed by Carlo Mirabella-Davis and starring Haley Bennett, Austin Stowell, Elizabeth Marvel, David Rasche, and Denis O\'Hare. Its plot follows a young woman who, emotionally stifled in her marriage and domestic life, develops an impulse to consume inedible objects.','2020-01-15 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/7/7f/Swallow_film_poster.png'),(45,'First Cow',121,'First Cow is a 2019 American drama film directed by Kelly Reichardt, from a screenplay by Reichardt and Jonathan Raymond based on Raymond\'s 2004 novel The Half-Life. It stars John Magaro, Orion Lee, Toby Jones, Ewen Bremner, Scott Shepherd, Gary Farmer, Stephen Malkmus, Alia Shawkat, and Lily Gladstone. It also features René Auberjonois in one of his final film roles.','2020-08-31 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/4/43/First_Cow_poster.jpeg'),(46,'Bloodshot',109,'Bloodshot is a 2020 American superhero film based on the Valiant Comics character of the same name. It is intended to be the first installment in a series of films set within a Valiant Comics shared cinematic universe. Directed by David S. F. Wilson from a screenplay by Jeff Wadlow and Eric Heisserer and a story by Wadlow, the film stars Vin Diesel in the main role, Eiza González, Sam Heughan, Toby Kebbell, and Guy Pearce. It follows a soldier who was killed in action, only to be brought back to life with superpowers by an organization that wants to use him as a weapon.','2020-03-30 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/4/45/Bloodshot_-_official_film_poster.jpeg'),(47,'The Hunt',115,'The Hunt is a 2020 American horror thriller film directed by Craig Zobel and written by Nick Cuse and Damon Lindelof. The film stars Betty Gilpin, Hilary Swank, Ike Barinholtz, and Emma Roberts. Jason Blum was a producer under his Blumhouse Productions banner, along with Lindelof. Zobel and Lindelof have said that the film is intended as a satire on the profound political divide between the American left and right. It is about a group of elites who kidnap working class people to hunt them.','2020-05-01 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/a/a9/The_Hunt_2020_poster.png'),(48,'I Still Believe',115,'I Still Believe is a 2020 American Christian romantic drama film directed by the Erwin brothers and starring KJ Apa, Britt Robertson, Shania Twain, Melissa Roxburgh, and Gary Sinise. It is based on the life of American contemporary Christian music singer-songwriter Jeremy Camp and his first wife, Melissa Lynn Henning-Camp, who was diagnosed with ovarian cancer shortly before they married. Camp\'s song \\\"I Still Believe\\\" is the film\'s namesake.','2020-03-13 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/1/18/I_Still_Believe_promotional_poster.jpg'),(49,'Lost Girls',95,'Lost Girls is a 2020 American mystery drama film. Lost Girls was directed by Liz Garbus, from a screenplay by Michael Werwie, and based on the book Lost Girls: An Unsolved American Mystery by Robert Kolker. The film revolves around the murders of young female sex workers on the South Shore barrier islands of Long Island, committed by the Long Island serial killer, who remains unidentified.','2020-01-28 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/3/37/Lost_Girls_poster.jpeg'),(50,'Stargirl',107,'Stargirl is a 2020 American jukebox musical romance film based on the 2000 novel of the same name by Jerry Spinelli that debuted on Disney+. The film explores the tense emotions, non-conformity and self-expression of teenagers in high school, and the exuberance of first love.','2020-03-13 00:00:00.000','https://upload.wikimedia.org/wikipedia/en/1/1f/Star_girl_Movie_Poster.jpeg');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gebruikers`
--

DROP TABLE IF EXISTS `gebruikers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gebruikers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `achternaam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wachtwoord` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Gebruikers_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebruikers`
--

LOCK TABLES `gebruikers` WRITE;
/*!40000 ALTER TABLE `gebruikers` DISABLE KEYS */;
INSERT INTO `gebruikers` VALUES (4,'Jorn','De Zutter','jorn.dezutter1@gmail.com','$2b$12$2Uai/UExHmCbWZuFpoCR5uJc7bpSsD1I2Z05QGvGP30acx.XbCuVC'),(32,'Jorn','tester4','admin@fm.com','$2b$12$Haws9aSGg6dsitG5qGXe/.zezapYFEcK97EVE.l0XeuKD5YTDuyTG'),(33,'test','test','test@test.com','$2b$12$bNhTPnejCIuHwrclVt4lWuG60bc6Bxc0MMmNj6X0U2/4Rdnmdw.QO');
/*!40000 ALTER TABLE `gebruikers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Genres_naam_key` (`naam`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (8,'Action'),(3,'Adventure'),(13,'Animated'),(9,'Comedy'),(20,'Crime'),(15,'Drama'),(16,'Family'),(14,'Fantasy'),(17,'Historical'),(1,'Horror'),(25,'Musical'),(21,'Mystery'),(26,'Political'),(18,'Romance'),(11,'Science Fiction'),(22,'Sports'),(10,'Spy'),(27,'Superhero'),(24,'Supernatural'),(19,'Teen'),(12,'Thriller'),(23,'War');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voorstellingenId` int NOT NULL,
  `gebruikersId` int NOT NULL,
  `zitplaatsen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalePrijs` decimal(65,30) NOT NULL,
  `aankoopdatum` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Tickets_voorstellingenId_fkey` (`voorstellingenId`),
  KEY `Tickets_gebruikersId_fkey` (`gebruikersId`),
  CONSTRAINT `Tickets_gebruikersId_fkey` FOREIGN KEY (`gebruikersId`) REFERENCES `gebruikers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Tickets_voorstellingenId_fkey` FOREIGN KEY (`voorstellingenId`) REFERENCES `voorstellingen` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,4,'4, 5',22.000000000000000000000000000000,'2024-01-13 11:54:44.812'),(3,13,4,'7',11.000000000000000000000000000000,'1970-01-01 00:00:00.000'),(4,7,4,'8, 9',22.000000000000000000000000000000,'2024-01-14 15:09:51.614'),(5,6,4,'2, 3',22.000000000000000000000000000000,'2024-01-14 16:49:31.857');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voorstellingen`
--

DROP TABLE IF EXISTS `voorstellingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voorstellingen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filmsId` int NOT NULL,
  `datum` datetime(3) NOT NULL,
  `tijd` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zalenId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Voorstellingen_filmsId_fkey` (`filmsId`),
  KEY `Voorstellingen_zalenId_fkey` (`zalenId`),
  CONSTRAINT `Voorstellingen_filmsId_fkey` FOREIGN KEY (`filmsId`) REFERENCES `films` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Voorstellingen_zalenId_fkey` FOREIGN KEY (`zalenId`) REFERENCES `zalen` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voorstellingen`
--

LOCK TABLES `voorstellingen` WRITE;
/*!40000 ALTER TABLE `voorstellingen` DISABLE KEYS */;
INSERT INTO `voorstellingen` VALUES (1,1,'2024-01-25 00:00:00.000','19:30',76),(2,1,'2024-01-25 00:00:00.000','20:30',77),(3,1,'2024-01-25 00:00:00.000','22:00',78),(4,2,'2024-01-25 00:00:00.000','19:30',77),(5,2,'2024-01-25 00:00:00.000','20:30',78),(6,2,'2024-01-25 00:00:00.000','22:00',76),(7,3,'2024-01-25 00:00:00.000','19:30',78),(8,3,'2024-01-25 00:00:00.000','20:30',76),(9,3,'2024-01-25 00:00:00.000','22:00',77),(10,4,'2024-01-25 00:00:00.000','19:30',79),(11,4,'2024-01-25 00:00:00.000','20:30',80),(12,4,'2024-01-25 00:00:00.000','22:00',81),(13,5,'2024-01-25 00:00:00.000','19:30',80),(14,5,'2024-01-25 00:00:00.000','20:30',81),(15,5,'2024-01-25 00:00:00.000','22:00',79),(16,6,'2024-01-25 00:00:00.000','19:30',81),(17,6,'2024-01-25 00:00:00.000','20:30',79),(18,6,'2024-01-25 00:00:00.000','22:00',80),(19,7,'2024-01-25 00:00:00.000','19:30',82),(20,7,'2024-01-25 00:00:00.000','20:30',83),(21,7,'2024-01-25 00:00:00.000','22:00',84),(22,8,'2024-01-01 00:00:00.000','19:30',83),(23,8,'2024-01-25 00:00:00.000','20:30',84),(24,8,'2024-01-25 00:00:00.000','22:00',82),(25,9,'2024-01-25 00:00:00.000','19:30',84),(26,9,'2024-01-25 00:00:00.000','20:30',82),(27,9,'2024-01-25 00:00:00.000','22:00',83),(28,10,'2024-01-25 00:00:00.000','19:30',85),(29,10,'2024-01-25 00:00:00.000','20:30',86),(30,10,'2024-01-25 00:00:00.000','22:00',87),(31,11,'2024-01-25 00:00:00.000','19:30',86),(32,11,'2024-01-25 00:00:00.000','20:30',87),(33,11,'2024-01-25 00:00:00.000','22:00',85),(34,12,'2024-01-25 00:00:00.000','19:30',87),(35,12,'2024-01-25 00:00:00.000','20:30',85),(36,12,'2024-01-25 00:00:00.000','22:00',86),(37,13,'2024-01-25 00:00:00.000','19:30',88),(38,13,'2024-01-25 00:00:00.000','20:30',89),(39,13,'2024-01-25 00:00:00.000','22:00',90),(40,14,'2024-01-25 00:00:00.000','19:30',89),(41,14,'2024-01-25 00:00:00.000','20:30',90),(42,14,'2024-01-25 00:00:00.000','22:00',88),(43,15,'2024-01-25 00:00:00.000','19:30',90),(44,15,'2024-01-25 00:00:00.000','20:30',88),(45,15,'2024-01-25 00:00:00.000','22:00',89),(46,16,'2024-01-26 00:00:00.000','19:30',76),(47,16,'2024-01-26 00:00:00.000','20:30',77),(48,16,'2024-01-26 00:00:00.000','22:00',78),(49,17,'2024-01-26 00:00:00.000','19:30',77),(50,17,'2024-01-26 00:00:00.000','20:30',78),(51,17,'2024-01-26 00:00:00.000','22:00',76),(52,18,'2024-01-26 00:00:00.000','19:30',78),(53,18,'2024-01-26 00:00:00.000','20:30',76),(54,18,'2024-01-26 00:00:00.000','22:00',77),(55,19,'2024-01-26 00:00:00.000','19:30',79),(56,19,'2024-01-26 00:00:00.000','20:30',80),(57,19,'2024-01-26 00:00:00.000','22:00',81),(58,20,'2024-01-26 00:00:00.000','19:30',80),(59,20,'2024-01-26 00:00:00.000','20:30',81),(60,20,'2024-01-26 00:00:00.000','22:00',79),(61,21,'2024-01-26 00:00:00.000','19:30',81),(62,21,'2024-01-26 00:00:00.000','20:30',79),(63,21,'2024-01-26 00:00:00.000','22:00',80),(64,22,'2024-01-26 00:00:00.000','19:30',82),(65,22,'2024-01-26 00:00:00.000','20:30',83),(66,22,'2024-01-26 00:00:00.000','22:00',84),(67,23,'2024-01-26 00:00:00.000','19:30',83),(68,23,'2024-01-26 00:00:00.000','20:30',84),(69,23,'2024-01-26 00:00:00.000','22:00',82),(70,24,'2024-01-26 00:00:00.000','19:30',84),(71,24,'2024-01-26 00:00:00.000','20:30',82),(72,24,'2024-01-26 00:00:00.000','22:00',83),(73,25,'2024-01-26 00:00:00.000','19:30',85),(74,25,'2024-01-26 00:00:00.000','20:30',86),(75,25,'2024-01-26 00:00:00.000','22:00',87),(76,26,'2024-01-26 00:00:00.000','19:30',86),(77,26,'2024-01-26 00:00:00.000','20:30',87),(78,26,'2024-01-26 00:00:00.000','22:00',85),(79,27,'2024-01-26 00:00:00.000','19:30',87),(80,27,'2024-01-26 00:00:00.000','20:30',85),(81,27,'2024-01-26 00:00:00.000','22:00',86),(82,28,'2024-01-26 00:00:00.000','19:30',88),(83,28,'2024-01-26 00:00:00.000','20:30',89),(84,28,'2024-01-26 00:00:00.000','22:00',90),(85,29,'2024-01-26 00:00:00.000','19:30',89),(86,29,'2024-01-26 00:00:00.000','20:30',90),(87,29,'2024-01-26 00:00:00.000','22:00',88),(88,30,'2024-01-26 00:00:00.000','19:30',90),(89,30,'2024-01-26 00:00:00.000','20:30',88),(90,30,'2024-01-26 00:00:00.000','22:00',89),(91,31,'2024-01-27 00:00:00.000','19:30',76),(92,31,'2024-01-27 00:00:00.000','20:30',77),(93,31,'2024-01-27 00:00:00.000','22:00',78),(94,32,'2024-01-27 00:00:00.000','19:30',77),(95,32,'2024-01-27 00:00:00.000','20:30',78),(96,32,'2024-01-27 00:00:00.000','22:00',76),(97,33,'2024-01-27 00:00:00.000','19:30',78),(98,33,'2024-01-27 00:00:00.000','20:30',76),(99,33,'2024-01-27 00:00:00.000','22:00',77),(100,34,'2024-01-27 00:00:00.000','19:30',79),(101,34,'2024-01-27 00:00:00.000','20:30',80),(102,34,'2024-01-27 00:00:00.000','22:00',81),(103,35,'2024-01-27 00:00:00.000','19:30',80),(104,35,'2024-01-27 00:00:00.000','20:30',81),(105,35,'2024-01-27 00:00:00.000','22:00',79),(106,36,'2024-01-27 00:00:00.000','19:30',81),(107,36,'2024-01-27 00:00:00.000','20:30',79),(108,36,'2024-01-27 00:00:00.000','22:00',80),(109,37,'2024-01-27 00:00:00.000','19:30',82),(110,37,'2024-01-27 00:00:00.000','20:30',83),(111,37,'2024-01-27 00:00:00.000','22:00',84),(112,38,'2024-01-27 00:00:00.000','19:30',83),(113,38,'2024-01-27 00:00:00.000','20:30',84),(114,38,'2024-01-27 00:00:00.000','22:00',82),(115,39,'2024-01-27 00:00:00.000','19:30',84),(116,39,'2024-01-27 00:00:00.000','20:30',82),(117,39,'2024-01-27 00:00:00.000','22:00',83),(118,40,'2024-01-27 00:00:00.000','19:30',85),(119,40,'2024-01-27 00:00:00.000','20:30',86),(120,40,'2024-01-27 00:00:00.000','22:00',87),(121,41,'2024-01-27 00:00:00.000','19:30',86),(122,41,'2024-01-27 00:00:00.000','20:30',87),(123,41,'2024-01-27 00:00:00.000','22:00',85),(124,42,'2024-01-27 00:00:00.000','19:30',87),(125,42,'2024-01-27 00:00:00.000','20:30',85),(126,42,'2024-01-27 00:00:00.000','22:00',86),(127,43,'2024-01-27 00:00:00.000','19:30',88),(128,43,'2024-01-27 00:00:00.000','20:30',89),(129,43,'2024-01-27 00:00:00.000','22:00',90),(130,44,'2024-01-27 00:00:00.000','19:30',89),(131,44,'2024-01-27 00:00:00.000','20:30',90),(132,44,'2024-01-27 00:00:00.000','22:00',88),(133,45,'2024-01-27 00:00:00.000','19:30',90),(134,45,'2024-01-27 00:00:00.000','20:30',88),(135,45,'2024-01-27 00:00:00.000','22:00',89),(136,46,'2024-01-28 00:00:00.000','19:30',76),(137,46,'2024-01-28 00:00:00.000','20:30',77),(138,46,'2024-01-28 00:00:00.000','22:00',78),(139,47,'2024-01-28 00:00:00.000','19:30',79),(140,47,'2024-01-28 00:00:00.000','20:30',80),(141,47,'2024-01-28 00:00:00.000','22:00',81),(142,48,'2024-01-28 00:00:00.000','19:30',82),(143,48,'2024-01-28 00:00:00.000','20:30',83),(144,48,'2024-01-28 00:00:00.000','22:00',84),(145,49,'2024-01-28 00:00:00.000','19:30',85),(146,49,'2024-01-28 00:00:00.000','20:30',86),(147,49,'2024-01-28 00:00:00.000','22:00',87),(148,50,'2024-01-28 00:00:00.000','19:30',88),(149,50,'2024-01-28 00:00:00.000','20:30',89),(150,50,'2024-01-28 00:00:00.000','22:00',90);
/*!40000 ALTER TABLE `voorstellingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zalen`
--

DROP TABLE IF EXISTS `zalen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zalen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capaciteit` int NOT NULL,
  `schermType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zalen`
--

LOCK TABLES `zalen` WRITE;
/*!40000 ALTER TABLE `zalen` DISABLE KEYS */;
INSERT INTO `zalen` VALUES (76,'Zaal 1',120,'IMAX'),(77,'Zaal 2',80,'3D'),(78,'Zaal 3',150,'Dolby Atmos'),(79,'Zaal 4',90,'2D'),(80,'Zaal 5',200,'UltraWide'),(81,'Zaal 6',110,'4DX'),(82,'Zaal 7',75,'HDR'),(83,'Zaal 8',180,'ScreenX'),(84,'Zaal 9',95,'Cinerama'),(85,'Zaal 10',160,'8K'),(86,'Zaal 11',85,'D-Box'),(87,'Zaal 12',130,'Platinum'),(88,'Zaal 13',70,'Standard'),(89,'Zaal 14',190,'THX'),(90,'Zaal 15',100,'VIP');
/*!40000 ALTER TABLE `zalen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 19:18:01
