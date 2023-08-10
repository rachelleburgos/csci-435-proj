-- Team 2: Rachelle Burgos, Bahi Berk Gulay
-- Attributions: ChatGPT

CREATE TABLE Country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code VARCHAR(4),
    country_name VARCHAR(32),
    country_population INT,
    country_currency VARCHAR(10),
    country_description VARCHAR(500)
);

CREATE TABLE City (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    country_fk INT,
    FOREIGN KEY (country_fk) REFERENCES Country(country_id),
    city_name VARCHAR(32),
    city_region VARCHAR(32),
    city_population INT,
    city_description VARCHAR(500)
);

CREATE TABLE Attraction (
    attraction_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    attraction_name VARCHAR(32),
    attraction_description VARCHAR(500),
    attraction_rating SMALLINT,
    attraction_photo_url VARCHAR(500)
);

CREATE TABLE Accommodation (
    accommodation_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    accommodation_name VARCHAR(32),
    accommodation_address VARCHAR(500),
    accommodation_rating SMALLINT,
    accommodation_average_price DECIMAL(10,2),
    accommodation_website_url VARCHAR(500)
);

CREATE TABLE Restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    restaurant_name VARCHAR(32),
    restaurant_address VARCHAR(500),
    restaurant_cuisine_type VARCHAR(32),
    restaurant_rating SMALLINT,
    restaurant_website_url VARCHAR(500)
);

CREATE TABLE Transportation (
    transportation_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    transportation_mode VARCHAR(32),
    transportation_details VARCHAR(500),
    transportation_average_price DECIMAL(10,2),
    transportation_website_url VARCHAR(500)
);

CREATE TABLE Safety_Tip (
    safety_tip_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    safety_tip VARCHAR(500)
);

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(32),
    user_password VARCHAR(256),
    user_email VARCHAR(32),
    user_profile_image_url VARCHAR(500)
);

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_fk INT,
    attraction_fk INT,
    restaurant_fk INT,
    accommodation_fk INT,
    FOREIGN KEY (user_fk) REFERENCES User(user_id),
    FOREIGN KEY (attraction_fk) REFERENCES Attraction(attraction_id),
    review_rating SMALLINT,
    review_title VARCHAR(32),
    review_text VARCHAR(500),
    review_type VARCHAR(32)
);