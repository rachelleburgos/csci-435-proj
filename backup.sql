Terminal close -- query aborted
.33, for macos13.3 (x86_64)
--
-- Host: localhost    Database: presentation
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Accommodation`
--

DROP TABLE IF EXISTS `Accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accommodation` (
  `accommodation_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int DEFAULT NULL,
  `accommodation_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accommodation`
--

LOCK TABLES `Accommodation` WRITE;
/*!40000 ALTER TABLE `Accommodation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccommodationDetails`
--

DROP TABLE IF EXISTS `AccommodationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AccommodationDetails` (
  `accommodation_details_id` int NOT NULL AUTO_INCREMENT,
  `accommodation_id` int DEFAULT NULL,
  `accommodation_address` varchar(500) DEFAULT NULL,
  `accommodation_rating` smallint DEFAULT NULL,
  `accommodation_average_price` decimal(10,2) DEFAULT NULL,
  `accommodation_website_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`accommodation_details_id`),
  KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `accommodationdetails_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `Accommodation` (`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccommodationDetails`
--

LOCK TABLES `AccommodationDetails` WRITE;
/*!40000 ALTER TABLE `AccommodationDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccommodationDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attraction`
--

DROP TABLE IF EXISTS `Attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attraction` (
  `attraction_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int DEFAULT NULL,
  `attraction_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`attraction_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `attraction_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attraction`
--

LOCK TABLES `Attraction` WRITE;
/*!40000 ALTER TABLE `Attraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AttractionDetails`
--

DROP TABLE IF EXISTS `AttractionDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AttractionDetails` (
  `attraction_details_id` int NOT NULL AUTO_INCREMENT,
  `attraction_id` int DEFAULT NULL,
  `attraction_description` varchar(500) DEFAULT NULL,
  `attraction_rating` smallint DEFAULT NULL,
  `attraction_photo_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`attraction_details_id`),
  KEY `attraction_id` (`attraction_id`),
  CONSTRAINT `attractiondetails_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `Attraction` (`attraction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AttractionDetails`
--

LOCK TABLES `AttractionDetails` WRITE;
/*!40000 ALTER TABLE `AttractionDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `AttractionDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `City` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `city_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `Country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CityDetails`
--

DROP TABLE IF EXISTS `CityDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CityDetails` (
  `city_details_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int DEFAULT NULL,
  `city_region` varchar(32) DEFAULT NULL,
  `city_population` int DEFAULT NULL,
  `city_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`city_details_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `citydetails_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CityDetails`
--

LOCK TABLES `CityDetails` WRITE;
/*!40000 ALTER TABLE `CityDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CityDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(4) DEFAULT NULL,
  `country_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CountryDetails`
--

DROP TABLE IF EXISTS `CountryDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CountryDetails` (
  `country_details_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `country_population` int DEFAULT NULL,
  `country_currency` varchar(10) DEFAULT NULL,
  `country_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`country_details_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `countrydetails_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `Country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CountryDetails`
--

LOCK TABLES `CountryDetails` WRITE;
/*!40000 ALTER TABLE `CountryDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CountryDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int DEFAULT NULL,
  `restaurant_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `Restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestaurantDetails`
--

DROP TABLE IF EXISTS `RestaurantDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RestaurantDetails` (
  `restaurant_details_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int DEFAULT NULL,
  `restaurant_address` varchar(500) DEFAULT NULL,
  `restaurant_cuisine_type` varchar(32) DEFAULT NULL,
  `restaurant_rating` smallint DEFAULT NULL,
  `restaurant_website_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`restaurant_details_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `restaurantdetails_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantDetails`
--

LOCK TABLES `RestaurantDetails` WRITE;
/*!40000 ALTER TABLE `RestaurantDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `RestaurantDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_fk` int DEFAULT NULL,
  `restaurant_fk` int DEFAULT NULL,
  `accommodation_fk` int DEFAULT NULL,
  `attraction_fk` int DEFAULT NULL,
  `review_rating` smallint DEFAULT NULL,
  `review_title` varchar(32) DEFAULT NULL,
  `review_text` varchar(500) DEFAULT NULL,
  `review_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `user_fk` (`user_fk`),
  KEY `restaurant_fk` (`restaurant_fk`),
  KEY `accommodation_fk` (`accommodation_fk`),
  KEY `attraction_fk` (`attraction_fk`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `User` (`user_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`restaurant_fk`) REFERENCES `Restaurant` (`restaurant_id`),
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`accommodation_fk`) REFERENCES `Accommodation` (`accommodation_id`),
  CONSTRAINT `review_ibfk_4` FOREIGN KEY (`attraction_fk`) REFERENCES `Attraction` (`attraction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SafetyTip`
--

DROP TABLE IF EXISTS `SafetyTip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SafetyTip` (
  `safety_tip_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int DEFAULT NULL,
  `safety_tip` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`safety_tip_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `safetytip_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SafetyTip`
--

LOCK TABLES `SafetyTip` WRITE;
/*!40000 ALTER TABLE `SafetyTip` DISABLE KEYS */;
/*!40000 ALTER TABLE `SafetyTip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transportation`
--

DROP TABLE IF EXISTS `Transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transportation` (
  `transportation_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int DEFAULT NULL,
  `transportation_mode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`transportation_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `transportation_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transportation`
--

LOCK TABLES `Transportation` WRITE;
/*!40000 ALTER TABLE `Transportation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransportationDetails`
--

DROP TABLE IF EXISTS `TransportationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransportationDetails` (
  `transportation_details_id` int NOT NULL AUTO_INCREMENT,
  `transportation_id` int DEFAULT NULL,
  `transportation_details` varchar(500) DEFAULT NULL,
  `transportation_average_price` decimal(10,2) DEFAULT NULL,
  `transportation_website_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`transportation_details_id`),
  KEY `transportation_id` (`transportation_id`),
  CONSTRAINT `transportationdetails_ibfk_1` FOREIGN KEY (`transportation_id`) REFERENCES `Transportation` (`transportation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransportationDetails`
--

LOCK TABLES `TransportationDetails` WRITE;
/*!40000 ALTER TABLE `TransportationDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransportationDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unnormalized`
--

DROP TABLE IF EXISTS `Unnormalized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unnormalized` (
  `unnormalized_id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(4) DEFAULT NULL,
  `country_name` varchar(32) DEFAULT NULL,
  `country_population` int DEFAULT NULL,
  `country_currency` varchar(10) DEFAULT NULL,
  `country_description` varchar(500) DEFAULT NULL,
  `city_name` varchar(32) DEFAULT NULL,
  `city_region` varchar(32) DEFAULT NULL,
  `city_population` int DEFAULT NULL,
  `city_description` varchar(500) DEFAULT NULL,
  `attraction_name` varchar(32) DEFAULT NULL,
  `attraction_description` varchar(500) DEFAULT NULL,
  `attraction_rating` smallint DEFAULT NULL,
  `attraction_photo_url` varchar(500) DEFAULT NULL,
  `accommodation_name` varchar(32) DEFAULT NULL,
  `accommodation_address` varchar(500) DEFAULT NULL,
  `accommodation_rating` smallint DEFAULT NULL,
  `accommodation_average_price` decimal(10,2) DEFAULT NULL,
  `accommodation_website_url` varchar(500) DEFAULT NULL,
  `restaurant_name` varchar(32) DEFAULT NULL,
  `restaurant_address` varchar(500) DEFAULT NULL,
  `restaurant_cuisine_type` varchar(32) DEFAULT NULL,
  `restaurant_rating` smallint DEFAULT NULL,
  `restaurant_website_url` varchar(500) DEFAULT NULL,
  `transportation_mode` varchar(32) DEFAULT NULL,
  `transportation_details` varchar(500) DEFAULT NULL,
  `transportation_average_price` decimal(10,2) DEFAULT NULL,
  `transportation_website_url` varchar(500) DEFAULT NULL,
  `safety_tip` varchar(500) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(256) DEFAULT NULL,
  `user_email` varchar(32) DEFAULT NULL,
  `user_profile_image_url` varchar(500) DEFAULT NULL,
  `review_rating` smallint DEFAULT NULL,
  `review_title` varchar(32) DEFAULT NULL,
  `review_text` varchar(500) DEFAULT NULL,
  `review_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`unnormalized_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unnormalized`
--

LOCK TABLES `Unnormalized` WRITE;
/*!40000 ALTER TABLE `Unnormalized` DISABLE KEYS */;
INSERT INTO `Unnormalized` VALUES (1,'US','United States',574971,'USD','A federal republic in North America, known for its diverse culture, technological innovation, and economic prowess.','New York','New York State',652680,'A bustling metropolis known as the \"Big Apple\", famous for its iconic skyline, arts scene, and financial district.','Statue of Liberty','A gift from France to the U.S., this iconic statue symbolizes freedom and democracy.',3,'https://www.fakephotos.com/image1.jpg','Grand Mirage Resort','1234 Broadway St, NY, 10001, USA',4,78.00,'grandmirageresort.com','Gourmet Fusion Bistro','1234 Broadway St, NY, 10001, USA','Fusion',5,'gourmetfusionbistro.com','Bus','Buses are a common mode of public transportation that operates on fixed routes and schedules, providing an economical and accessible way for commuters to travel within and between cities.',12.00,'buscitytransit.com','Be cautious with your belongings in crowded places and keep your personal items secure to avoid potential theft.','SparklingSunshine92','Sparkle123!','sunnyday1234@email.com','https://fakeprofilepics.com/user1.jpg',3,'Amazing Experience!','Visited this attraction last summer and it was beyond my expectations. Highly recommend!','Attraction\r'),(2,'CA','Canada',642144,'CAD','The second-largest country by land area, boasting vast landscapes from forests to Arctic tundras, and known for its friendly populace.','Toronto','Ontario',140852,'A diverse city on the shores of Lake Ontario, celebrated for its cultural institutions and the iconic CN Tower.','CN Tower','A towering communications and observation structure, once the world\'s tallest freestanding structure.',5,'https://www.imaginaryimages.net/picture2.png','Sapphire Sands Hotel','5678 Yonge St, ON, M2M 4K9, Canada',1,1.00,'sapphiresandshotel.com','SpiceLicious Cafe','5678 Yonge St, ON, M2M 4K9, Canada','Indian',2,'spiceliciouscafe.com','Train','Trains are efficient and reliable transportation options for long-distance travel, operating on dedicated tracks and offering various seating classes.',6.00,'fastexpressrail.com','When crossing the streets, always look both ways and use designated pedestrian crossings for your safety.','MidnightMystery21','Mystery@2022','mysteryseeker22@gmail.com','https://fakeprofilepics.com/user2.jpg',1,'Tasty Dishes!','The restaurant offers a wide range of dishes and each one is delicious. Can\'t wait to visit again!','Restaurant\r'),(3,'GB','United Kingdom',475902,'GBP','An island nation off the northwestern coast of mainland Europe, rich in history and global influence, with a constitutional monarchy.','London','Greater London',216526,'A historic city on the River Thames, distinguished by its royal heritage, double-decker buses, and the Big Ben.','Tower of London','A historic castle on the north bank of the River Thames, known for its role in British history and as a place of imprisonment and execution.',5,'https://www.nonexistentgallery.org/photo3.jpeg','Enchanted Haven Inn','987 Oxford Rd, SW1A 1AA, United Kingdom',3,95.00,'enchantedhaveninn.com','The Hungry Fork','987 Oxford Rd, SW1A 1AA, United Kingdom','American',3,'thehungryforkrestaurant.com','Subway','Subways, also known as metros or undergrounds, are fast and efficient urban transit systems that run on dedicated underground tracks within cities.',2.00,'urbanspeedmetro.com','Pay attention to the \"mind the gap\" warning when boarding or exiting trains on the underground to prevent accidents.','ElectricDreamer77','Dreamer#5678','dreamyadventurer77@hotmail.com','https://fakeprofilepics.com/user3.jpg',1,'Comfortable Stay','The room was spacious and the service was top-notch. Felt right at home.','Accommodation\r'),(4,'FR','France',602596,'EUR','A Western European nation renowned for its art, fashion, and culinary traditions, with Paris as its iconic capital.','Paris','Île-de-France',818268,'Often called the \"City of Love\", renowned for the Eiffel Tower, fashion, and art museums like the Louvre.','Notre-Dame Cathedral','A masterpiece of Gothic architecture, recognized for its twin towers, rose windows, and flying buttresses.',4,'https://www.fantasyimages.io/image4.gif','Moonlight Manor','246 Rue de la Seine, 75001, France',4,80.00,'moonlightmanor.com','Moonlit Feast Grill','246 Rue de la Seine, 75001, France','Barbecue',5,'moonlitfeastgrill.com','Tram','Trams, or streetcars, are light rail vehicles that move along tracks embedded in city streets, providing a convenient mode of urban transportation.',4.00,'citystreettrolley.com','Stay vigilant against pickpockets in popular tourist areas and keep your valuables in a secure location.','WhimsicalWanderer','WhimsyPass*99','whimsicalwanderer@gmail.com','https://fakeprofilepics.com/user4.jpg',5,'Breathtaking Views','The scenic beauty from this attraction is something to behold. A must-visit!','Attraction\r'),(5,'DE','Germany',490636,'EUR','Central European powerhouse with a rich history in science, arts, and philosophy, known for its engineering and automotive industries.','Berlin','Berlin',340577,'Once divided by a wall, it\'s now a symbol of reunification and known for its vibrant arts and nightlife.','Brandenburg Gate','An 18th-century neoclassical triumphal arch, symbolizing peace and unity in Germany.',5,'https://www.fakegallerysite.com/picture5.bmp','Paradise Bay Resort','789 Friedrichstraße, 10117, Germany',5,77.00,'paradisebayresort.com','Flavorful Haven Eatery','789 Friedrichstraße, 10117, Germany','Mediterranean',4,'flavorfulhaveneatery.com','Cable Car','Cable cars rely on cables to transport cars or cabins over steep slopes or challenging terrains, offering a unique and scenic transportation experience.',15.00,'scenicviewcablecar.com','Use marked and designated bike lanes while cycling to ensure your safety and avoid accidents with other road users.','EnchantingEagle','Eagle_Star22','eaglestarlighter@gmail.com','https://fakeprofilepics.com/user5.jpg',5,'Friendly Staff','The staff at this restaurant were courteous and made our dining experience memorable.','Restaurant\r'),(6,'AU','Australia',977271,'AUD','A continent-country known for its unique wildlife, natural wonders like the Great Barrier Reef, and its indigenous Aboriginal culture.','Sydney','New South Wales',149346,'A harbor city with the iconic Sydney Opera House, Harbour Bridge, and nearby Bondi Beach.','Sydney Opera House','A multi-venue performing arts center, famous for its distinctive sail-like design.',1,'https://www.unrealphotospace.net/image6.tiff','Whispering Pines Lodge','1010 George St, NSW 2000, Australia',5,19.00,'whisperingpineslodge.com','Tasty Trails Restaurant','1010 George St, NSW 2000, Australia','International',2,'tastytrailsrestaurant.com','Bus','Buses are a common mode of public transportation that operates on fixed routes and schedules, providing an economical and accessible way for commuters to travel within and between cities.',13.00,'cityriderbusline.com','Take necessary precautions against the sun and stay hydrated, especially during hot weather, to prevent heat-related issues.','GalaxyGazer33','Galaxy$$Explorer','galaxyexplorer33@yahoo.com','https://fakeprofilepics.com/user6.jpg',2,'Prime Location','The hotel is located in the heart of the city, making it convenient for sightseeing.','Accommodation\r'),(7,'JP','Japan',599589,'JPY','An East Asian archipelago known for its unique blend of ancient traditions and cutting-edge modernity, with technological advancements and rich cultural heritage.','Tokyo','Tokyo Metropolis',210277,'A bustling metropolis blending modern skyscrapers with traditional temples and the residence of the Emperor.','Tokyo Skytree','A broadcasting and observation tower, recognized as the tallest structure in Japan.',1,'https://www.imaginarypics.com/photo7.webp','Golden Crown Hotel','555 Shibuya Crossing, 150-8010, Japan',3,50.00,'goldencrownhotel.com','Savory Delight Diner','555 Shibuya Crossing, 150-8010, Japan','Comfort Food',1,'savorydelightdiner.com','Train','Trains are efficient and reliable transportation options for long-distance travel, operating on dedicated tracks and offering various seating classes.',2.00,'intercityrailways.com','Familiarize yourself with the train schedules and platforms to avoid getting lost in the extensive subway system.','MagicalMermaid88','Mermaid@88','mysticalmermaid88@hotmail.com','https://fakeprofilepics.com/user7.jpg',1,'Historic Marvel','Loved learning about the history of this place. The guided tour was very informative.','Attraction\r'),(8,'CN','China',436311,'CNY','The world\'s most populous country, with a vast history spanning millennia and being a major global economic player.','Beijing','Beijing Municipality',795935,'The capital city with millennia of history, home to the Forbidden City and near the Great Wall.','Temple of Heaven','A complex of religious buildings, it\'s a place of prayer and ceremonial gatherings in ancient China.',2,'https://www.fakephotolink.org/image8.png','Starlight Oasis Inn','222 Wangfujing St, 100006, China',5,24.00,'starlightoasisinn.com','The Whimsical Plate','222 Wangfujing St, 100006, China','Contemporary',4,'thewhimsicalplaterestaurant.com','Subway','Subways, also known as metros or undergrounds, are fast and efficient urban transit systems that run on dedicated underground tracks within cities.',7.00,'metrolinktransit.com','Be cautious while exploring crowded tourist spots, as these places are often targeted by pickpockets.','DaringAdventurer42','Adventurer%42','daringadventurer42@email.com','https://fakeprofilepics.com/user8.jpg',1,'Exotic Flavors','Tried some dishes that I had never heard of before. Each one was a delightful surprise.','Restaurant\r'),(9,'BR','Brazil',961663,'BRL','South America\'s largest country, known for its Amazon rainforest, vibrant festivals like Carnival, and football passion.','Rio de Janeiro','State of Rio de Janeiro',528617,'Famous for its Carnival, samba, and the statue of Christ the Redeemer atop Corcovado mountain.','Sugarloaf Mountain','A granite peak on a peninsula in Rio de Janeiro, offering panoramic views of the city.',5,'https://www.nonrealpictures.com/picture9.jpeg','Tranquil Waters Retreat','333 Copacabana Beach Rd, 22070-001, Brazil',4,92.00,'tranquilwatersretreat.com','Chef\'s Secret Garden','333 Copacabana Beach Rd, 22070-001, Brazil','French',3,'chefssecretgarden.com','Tram','Trams, or streetcars, are light rail vehicles that move along tracks embedded in city streets, providing a convenient mode of urban transportation.',6.00,'downtownstreettram.com','Avoid displaying expensive jewelry or electronics in public to reduce the risk of theft.','CosmicExplorer55','Explore_55^','cosmicexplorer55@gmail.com','https://fakeprofilepics.com/user9.jpg',2,'Luxury Redefined','From the spa to the pool, everything about this hotel screams luxury.','Accommodation\r'),(10,'IN','India',776801,'INR','A South Asian country with a rich tapestry of history, religions, and cultures, known for its diverse landscapes and culinary traditions.','Mumbai','Maharashtra',992697,'The financial hub of India, home to Bollywood and the historic Gateway of India arch.','Elephanta Caves','A network of sculpted caves located on an island, depicting religious art linked to the cult of Shiva.',5,'https://www.fictionalimages.io/photo10.gif','Crystal Heights Resort','444 Marine Drive, 400020, India',4,47.00,'crystalheightsresort.com','Bistro Breeze','444 Marine Drive, 400020, India','Italian',5,'bistrobreeze.com','Cable Car','Cable cars rely on cables to transport cars or cabins over steep slopes or challenging terrains, offering a unique and scenic transportation experience.',8.00,'mountainadventurecable.com','Be mindful of street traffic while crossing roads and use pedestrian bridges or crossings whenever available.','MysticalMoonbeam','Moonbeam*#22','moonlitdreamer@gmail.com','https://fakeprofilepics.com/user10.jpg',1,'Kids Loved It!','Took my children to this attraction and they had a blast. Great for families.','Attraction\r'),(11,'ZA','South Africa',641943,'ZAR','Located at the southern tip of Africa, known for its diverse ecosystems, history of apartheid, and the iconic leader Nelson Mandela.','Cape Town','Western Cape',493997,'Located at the foot of Table Mountain, it\'s known for its harbor and as a gateway to the wine lands.','Table Mountain','A flat-topped mountain overlooking Cape Town, offering panoramic views of the city and the ocean.',3,'https://www.fakeimageresource.com/image11.bmp','Majestic Dream Hotel','678 Table Mountain Ave, 8001, South Africa',5,50.00,'majesticdreamhotel.com','Culinary Quest Cafe','678 Table Mountain Ave, 8001, South Africa','Global',1,'culinaryquestcafe.com','Bus','Buses are a common mode of public transportation that operates on fixed routes and schedules, providing an economical and accessible way for commuters to travel within and between cities.',4.00,'urbancommuterbus.com','Avoid walking alone in poorly lit or unfamiliar areas, especially during the nighttime, to stay safe.','WanderlustWarrior','Wanderlust!99','wanderlustwarrior99@yahoo.com','https://fakeprofilepics.com/user11.jpg',5,'Vegan Options Available','As a vegan, I was delighted to find a range of options on the menu.','Restaurant\r'),(12,'MX','Mexico',837333,'MXN','A North American country with a rich pre-Columbian history, known for its vibrant culture, food, and festivals.','Mexico City','Federal District',633801,'A vast city with a mix of modern architecture and historic colonial landmarks, known for its vibrant street life.','Palacio de Bellas Artes','A major cultural venue in Mexico City, known for its murals and its blend of art nouveau and art deco styles.',4,'https://www.unrealimagegallery.net/picture12.tiff','Emerald Springs Lodge','777 Zocalo Square, 06010, Mexico',3,83.00,'emeraldspringslodge.com','Zesty Zestaurant','777 Zocalo Square, 06010, Mexico','Mexican',5,'zestyzestaurant.com','Train','Trains are efficient and reliable transportation options for long-distance travel, operating on dedicated tracks and offering various seating classes.',11.00,'expressrailwaysystem.com','Use reputable and registered taxis or rideshare services to ensure your safety during transportation.','MysticMarvels79','Marvels$$$79','mysticmarvels79@hotmail.com','https://fakeprofilepics.com/user12.jpg',1,'Peaceful Retreat','Away from the hustle and bustle, this hotel was the peaceful retreat I needed.','Accommodation\r'),(13,'IT','Italy',208005,'EUR','A Southern European country known for its art, architecture, and culinary delights, with history ranging from Roman ruins to Renaissance art.','Rome','Lazio',267096,'Steeped in history with ancient ruins, the Vatican City, and iconic structures like the Colosseum.','Colosseum','An ancient amphitheater in Rome, known for its gladiatorial contests and public spectacles.',2,'https://www.fantasyphotolinks.com/photo13.webp','Ocean Breeze Retreat','888 Colosseum Square, 00184, Italy',4,3.00,'oceanbreezeretreat.com','Foodie\'s Paradise Bistro','888 Colosseum Square, 00184, Italy','Modern European',1,'foodiesparadisebistro.com','Subway','Subways, also known as metros or undergrounds, are fast and efficient urban transit systems that run on dedicated underground tracks within cities.',6.00,'metrocruiseline.com','Keep an eye on your belongings and be cautious of distractions while visiting popular tourist attractions.','ShimmeringStarlight','Starlight&2023','starlighter2023@yahoo.com','https://fakeprofilepics.com/user13.jpg',1,'Interactive Displays','The attraction had several interactive displays that were both fun and educational.','Attraction\r'),(14,'ES','Spain',485302,'EUR','Located on the Iberian Peninsula, known for its diverse culture, Flamenco music, dance, and festivals like La Tomatina.','Madrid','Community of Madrid',186935,'Spain\'s central capital, known for its elegant boulevards, expansive parks, and rich repositories of European art.','Prado Museum','Spain\'s main national art museum, housing works by European masters from the 12th to the early 20th century.',1,'https://www.imaginaryimagehub.org/image14.png','Royal Orchid Inn','999 Gran Vía Blvd, 28013, Spain',1,58.00,'royalorchidinn.com','Sizzling Savor Grill','999 Gran Vía Blvd, 28013, Spain','Steakhouse',5,'sizzlingsavorgrill.com','Tram','Trams, or streetcars, are light rail vehicles that move along tracks embedded in city streets, providing a convenient mode of urban transportation.',5.00,'citycentertramline.com','Be aware of your surroundings, especially in crowded areas like public transportation or busy streets.','FreeSpiritDreamer','FreeSpirit_12','freespiritdreamer12@gmail.com','https://fakeprofilepics.com/user14.jpg',1,'Best Pizza in Town','If you\'re a pizza lover like me, this restaurant is a must-visit. Simply delicious!','Restaurant\r'),(15,'SE','Sweden',740688,'SEK','A Nordic country known for its welfare state, innovations, and beautiful landscapes ranging from archipelagos to northern lights.','Stockholm','Stockholm County',820347,'Built on islands, known for its modern design, archipelago, and the historic Gamla Stan district.','Vasa Museum','A maritime museum in Stockholm, showcasing the only almost fully intact 17th-century ship that has ever been salvaged.',3,'https://www.nonexistentphotosite.com/picture15.jpeg','Serenity Peaks Hotel','101 Gamla Stan Square, 111 29, Sweden',4,57.00,'serenitypeakshotel.com','Enchanting Eats Eatery','101 Gamla Stan Square, 111 29, Sweden','Asian',2,'enchantingeatseatery.com','Cable Car','Cable cars rely on cables to transport cars or cabins over steep slopes or challenging terrains, offering a unique and scenic transportation experience.',3.00,'skylinecableadventures.com','During winter, be cautious of slippery roads and pavements to prevent slip and fall accidents.','EnigmaticEclipse','Eclipse$Quest','enigmaticeclipse@gmail.com','https://fakeprofilepics.com/user15.jpg',5,'Stellar Service','The staff went out of their way to ensure we had everything we needed during our stay.','Accommodation\r'),(16,'RU','Russia',108667,'RUB','The largest country in the world, spanning Eastern Europe and northern Asia, known for its rich history, literature, and vast Siberian landscapes.','Moscow','Moscow Oblast',741114,'Russia\'s capital, home to the Kremlin, Red Square, and historic cathedrals, known for its intense winters.','Saint Basil\'s Cathedral','A colorful, onion-domed church, representing the peak of Russian Byzantine and architectural style.',2,'https://www.fakepictureportal.io/photo16.gif','Azure Skies Resort','202 Red Square, 103073, Russia',1,50.00,'azureskiesresort.com','Delectable Fusion Kitchen','202 Red Square, 103073, Russia','Asian Fusion',4,'delectablefusionkitchen.com','Bus','Buses are a common mode of public transportation that operates on fixed routes and schedules, providing an economical and accessible way for commuters to travel within and between cities.',8.00,'rapidtransitbus.com','Avoid using unlicensed or unofficial taxis and opt for reputable transportation services to ensure safety.','SereneSerenade44','Serenade44%','sereneserenade44@hotmail.com','https://fakeprofilepics.com/user16.jpg',3,'Nature\'s Beauty','This attraction showcases the beauty of nature. Don\'t forget to bring your camera!','Attraction\r'),(17,'NZ','New Zealand',477553,'NZD','An island nation in the southwestern Pacific, known for its Maori culture, scenic landscapes, and the setting for \"The Lord of the Rings\" films.','Wellington','Wellington Region',631690,'The capital located at the southern tip of the North Island, known for its waterfront promenade and native timber houses.','Te Papa Museum','New Zealand\'s national museum, showcasing the country\'s natural and cultural heritage.',5,'https://www.unrealpics.com/image17.bmp','Velvet Garden Retreat','303 Lambton Quay, 6011, New Zealand',2,37.00,'velvetgardenretreat.com','Aroma Adventures Bistro','303 Lambton Quay, 6011, New Zealand','Middle Eastern',1,'aromaadventuresbistro.com','Train','Trains are efficient and reliable transportation options for long-distance travel, operating on dedicated tracks and offering various seating classes.',12.00,'highspeedrailtravel.com','Follow safety guidelines while hiking or exploring nature areas, and inform others about your plans and expected return time.','NebulaNomad','Nomad*#2021','nebulanomad2021@yahoo.com','https://fakeprofilepics.com/user17.jpg',5,'Desserts to Die For','Make sure you leave room for dessert at this restaurant. You won\'t regret it!','Restaurant\r'),(18,'SG','Singapore',857936,'SGD','A city-state in Southeast Asia, known for its multicultural populace, technological advancements, and as a global financial hub.','Singapore','Singapor',592658,'A city-state and global hub for finance and commerce, famous for its skyline, gardens, and multicultural populace.','Marina Bay Sands','An integrated resort fronting Marina Bay, known for its luxury hotel, rooftop infinity pool, and observation deck.',4,'https://www.fictionalphotolinks.net/picture18.tiff','Sunrise Harbor Inn','404 Orchard Road, 238875, Singapore',4,75.00,'sunriseharborinn.com','Epicurean Palette','404 Orchard Road, 238875, Singapore','Fine Dining',1,'epicureanpalette.com','Subway','Subways, also known as metros or undergrounds, are fast and efficient urban transit systems that run on dedicated underground tracks within cities.',3.00,'metropolitanunderground.com','Be aware of local laws and regulations, including strict penalties for certain offenses, to avoid legal troubles.','TwinklingTales','Twinkling$$$78','twinklingtales78@gmail.com','https://fakeprofilepics.com/user18.jpg',3,'Rooftop Views','The hotel\'s rooftop offered stunning views of the city. Perfect for evening relaxation.','Accommodation\r'),(19,'AE','United Arab Emirates',509563,'AED','A federation of seven emirates in the Middle East, known for its oil wealth, modern architecture, and luxury shopping.','Abu Dhabi','Emirate of Abu Dhabi',63265,'The capital of the UAE, known for its modern skyscrapers, vast deserts, and a rich cultural heritage.','Sheikh Zayed Grand Mosque','A prominent Islamic architectural structure, known for its white marble domes and intricate carvings.',4,'https://www.fakeimagestore.com/photo19.webp','Blissful Meadows Lodge','505 Sheikh Zayed Rd, 114659, United Arab Emirates',5,35.00,'blissfulmeadowslodge.com','Gastronomic Galaxy Cafe','505 Sheikh Zayed Rd, 114659, United Arab Emirates','Sci-Fi Themed',5,'gastronomicgalaxycafe.com','Tram','Trams, or streetcars, are light rail vehicles that move along tracks embedded in city streets, providing a convenient mode of urban transportation.',1.00,'cityscenicservice.com','Respect local customs and traditions while visiting to ensure a safe and positive experience.','EtherealJourneyer','Journeyer^_20','etherealjourneyer20@hotmail.com','https://fakeprofilepics.com/user19.jpg',1,'Cultural Extravaganza','Learned so much about the local culture at this attraction. Highly enlightening!','Attraction\r'),(20,'NG','Nigeria',323089,'NGN','The most populous country in Africa, known for its diverse cultures, languages, and as a major producer of oil in the continent.','Lagos','Lagos State',173102,'A major port and the largest city, it\'s a bustling metropolis known for its markets, music scene, and lagoons.','Nike Art Gallery','A leading contemporary arts center in Lagos, displaying a wide range of traditional and contemporary African artworks.',1,'https://www.imaginaryphotogallery.org/image20.png','Celestial Palace Hotel','606 Victoria Island, 101241, Nigeria',4,15.00,'celestialpalacehotel.com','The Cozy Culinary Corner','606 Victoria Island, 101241, Nigeria','Homestyle',1,'thecozyculinarycorner.com','Cable Car','Cable cars rely on cables to transport cars or cabins over steep slopes or challenging terrains, offering a unique and scenic transportation experience.',6.00,'mountaintopcableway.com','Use official transportation services or trusted drivers to avoid potential risks associated with unofficial transportation options.','LuminousLabyrinth','Luminous!#33','luminous33@yahoo.com','https://fakeprofilepics.com/user20.jpg',3,'Romantic Dinner','Went to this restaurant for an anniversary dinner. The ambiance and food made it a night to remember.','Restaurant');
/*!40000 ALTER TABLE `Unnormalized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(256) DEFAULT NULL,
  `user_email` varchar(32) DEFAULT NULL,
  `user_profile_image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-10 16:55:36
