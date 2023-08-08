-- Team 2: Rachelle Burgos, Bahi Berk Gulay
-- Attributions: ChatGPT

CREATE TABLE Country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code VARCHAR(4),
    country_name VARCHAR(32),
    country_population UNSIGNED INT,
    country_currency VARCHAR(10),
    country_description VARCHAR(500)
);

INSERT INTO Country (country_id, country_code, country_name, country_population, country_currency, country_description)
SELECT country_id, country_code, country_name, country_population, country_currency, country_description FROM Unnormalized;

CREATE TABLE City (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    country_fk INT,
    FOREIGN KEY (country_fk) REFERENCES Country(country_id),
    city_name VARCHAR(32),
    city_region VARCHAR(32),
    city_population UNSIGNED INT,
    city_description VARCHAR(500)
);

INSERT INTO City (city_id, city_name, city_region, city_population, city_description)
SELECT city_id, city_name, city_region, city_population, city_description FROM Unnormalized;

CREATE TABLE Attraction (
    attraction_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    attraction_name VARCHAR(32),
    attraction_description VARCHAR(500),
    attraction_rating UNSIGNED SMALLINT,
    attraction_photo_url VARCHAR(500)
);

INSERT INTO Attraction (attraction_id, attraction_name, attraction_description, attraction_rating, attraction_photo_url)
SELECT attraction_id, attraction_name, attraction_description, attraction_rating, attraction_photo_url FROM Unnormalized;

CREATE TABLE Accommodation (
    accommodation_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    accommodation_name VARCHAR(32),
    accommodation_address VARCHAR(500),
    accommodation_rating UNSIGNED SMALLINT,
    accommodation_average_price DECIMAL(10,2),
    accommodation_website_url VARCHAR(500)
);

INSERT INTO Accommodation (accommodation_id, accommodation_name, accommodation_address, accommodation_rating, accommodation_average_price, accommodation_website_url)
SELECT accommodation_id, accommodation_name, accommodation_address, accommodation_rating, accommodation_average_price, accommodation_website_url FROM Unnormalized;

CREATE TABLE Restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    restaurant_name VARCHAR(32),
    restaurant_address VARCHAR(500),
    restaurant_cuisine_type VARCHAR(32),
    restaurant_rating UNSIGNED SMALLINT,
    restaurant_website_url VARCHAR(500)
);

INSERT INTO Restaurant (restaurant_id, restaurant_name, restaurant_address, restaurant_cuisine_type, restaurant_rating, restaurant_website_url)
SELECT restaurant_id, restaurant_name, restaurant_address, restaurant_cuisine_type, restaurant_rating, restaurant_website_url FROM Unnormalized;

CREATE TABLE Transportation (
    transportation_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    transportation_mode VARCHAR(32),
    transportation_details VARCHAR(500),
    transportation_average_price DECIMAL(10,2),
    transportation_website_url VARCHAR(500)
);

INSERT INTO Transportation (transportation_id, transportation_mode, transportation_details, transportation_average_price, transportation_website_url)
SELECT transportation_id, transportation_mode, transportation_details, transportation_average_price, transportation_website_url FROM Unnormalized;

CREATE TABLE Safety_Tip (
    safety_tip_id INT AUTO_INCREMENT PRIMARY KEY,
    city_fk INT,
    FOREIGN KEY (city_fk) REFERENCES City(city_id),
    safety_tip VARCHAR(500)
);

INSERT INTO Safety_Tip (safety_tip_id, safety_tip)
SELECT safety_tip_id, safety_tip FROM Unnormalized;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(32),
    user_password VARCHAR(256),
    user_email VARCHAR(32),
    user_profile_image_url VARCHAR(500)
);

INSERT INTO User (user_id, user_name, user_password, user_email, user_profile_image_url)
SELECT user_id, user_name, user_password, user_email, user_profile_image_url FROM Unnormalized;

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_fk INT,
    attraction_id INT,
    FOREIGN KEY (user_fk) REFERENCES User(user_id),
    FOREIGN KEY (attraction_fk) REFERENCES Attraction(attraction_id),
    review_rating UNSIGNED SMALLINT,
    review_text VARCHAR(500)
);

INSERT INTO Review (review_id, review_rating, review_text)
SELECT review_id, review_rating, review_text FROM Unnormalized;