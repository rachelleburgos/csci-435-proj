-- Team 2: Rachelle Burgos, Bahi Berk Gulay
-- Attributions: ChatGPT

-- Country Table
CREATE TABLE Country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code VARCHAR(4),
    country_name VARCHAR(32)
);

-- CountryDetails Table
CREATE TABLE CountryDetails (
    country_details_id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id),
    country_population INT,
    country_currency VARCHAR(10),
    country_description VARCHAR(500)
);

-- City Table
CREATE TABLE City (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id),
    city_name VARCHAR(32)
);

-- CityDetails Table
CREATE TABLE CityDetails (
    city_details_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id),
    city_region VARCHAR(32),
    city_population INT,
    city_description VARCHAR(500)
);

-- Attraction Table
CREATE TABLE Attraction (
    attraction_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id),
    attraction_name VARCHAR(32)
);

-- AttractionDetails Table
CREATE TABLE AttractionDetails (
    attraction_details_id INT AUTO_INCREMENT PRIMARY KEY,
    attraction_id INT,
    FOREIGN KEY (attraction_id) REFERENCES Attraction(attraction_id),
    attraction_description VARCHAR(500),
    attraction_rating SMALLINT,
    attraction_photo_url VARCHAR(500)
);

-- Accommodation Table
CREATE TABLE Accommodation (
    accommodation_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id),
    accommodation_name VARCHAR(32)
);

-- AccommodationDetails Table
CREATE TABLE AccommodationDetails (
    accommodation_details_id INT AUTO_INCREMENT PRIMARY KEY,
    accommodation_id INT,
    FOREIGN KEY (accommodation_id) REFERENCES Accommodation(accommodation_id),
    accommodation_address VARCHAR(500),
    accommodation_rating SMALLINT,
    accommodation_average_price DECIMAL(10,2),
    accommodation_website_url VARCHAR(500)
);

-- Restaurant Table
CREATE TABLE Restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id),
    restaurant_name VARCHAR(32)
);

-- RestaurantDetails Table
CREATE TABLE RestaurantDetails (
    restaurant_details_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id),
    restaurant_address VARCHAR(500),
    restaurant_cuisine_type VARCHAR(32),
    restaurant_rating SMALLINT,
    restaurant_website_url VARCHAR(500)
);

-- Transportation Table
CREATE TABLE Transportation (
    transportation_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id),
    transportation_mode VARCHAR(32)
);

-- TransportationDetails Table
CREATE TABLE TransportationDetails (
    transportation_details_id INT AUTO_INCREMENT PRIMARY KEY,
    transportation_id INT,
    FOREIGN KEY (transportation_id) REFERENCES Transportation(transportation_id),
    transportation_details VARCHAR(500),
    transportation_average_price DECIMAL(10,2),
    transportation_website_url VARCHAR(500)
);

-- SafetyTip Table
CREATE TABLE SafetyTip (
    safety_tip_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id),
    safety_tip VARCHAR(500)
);

-- User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(32),
    user_password VARCHAR(256),
    user_email VARCHAR(32),
    user_profile_image_url VARCHAR(500)
);

-- Review Table
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_fk INT,
    restaurant_fk INT,
    accommodation_fk INT,
    attraction_fk INT,
    review_rating SMALLINT,
    review_title VARCHAR(32),
    review_text VARCHAR(500),
    review_type VARCHAR(32),
    FOREIGN KEY (user_fk) REFERENCES User(user_id),
    FOREIGN KEY (restaurant_fk) REFERENCES Restaurant(restaurant_id),
    FOREIGN KEY (accommodation_fk) REFERENCES Accommodation(accommodation_id),
    FOREIGN KEY (attraction_fk) REFERENCES Attraction(attraction_id)
);