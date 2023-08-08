-- Team 2: Rachelle Burgos, Bahi Berk Gulay

CREATE TABLE Unnormalized (
    unnormalized_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code VARCHAR(4),
    country_name VARCHAR(32),
    country_population UNSIGNED INT,
    country_currency VARCHAR(10),
    country_description VARCHAR(500),
    city_name VARCHAR(32),
    city_region VARCHAR(32),
    city_population UNSIGNED INT,
    city_description VARCHAR(500),
    attraction_name VARCHAR(32),
    attraction_description VARCHAR(500),
    attraction_rating UNSIGNED SMALLINT,
    attraction_photo_url VARCHAR(500),
    accommodation_name VARCHAR(32),
    accommodation_address VARCHAR(500),
    accommodation_rating UNSIGNED SMALLINT,
    accommodation_average_price DECIMAL(10,2),
    accommodation_website_url VARCHAR(500),
    restaurant_name VARCHAR(32),
    restaurant_address VARCHAR(500),
    restaurant_cuisine_type VARCHAR(32),
    restaurant_rating UNSIGNED SMALLINT,
    restaurant_website_url VARCHAR(500),
    transportation_mode VARCHAR(32),
    transportation_details VARCHAR(500),
    transportation_average_price DECIMAL(10,2),
    transportation_website_url VARCHAR(500),
    safety_tip VARCHAR(500),
    user_name VARCHAR(32),
    user_password VARCHAR(256),
    user_email VARCHAR(32),
    user_profile_image_url VARCHAR(500),
    review_rating UNSIGNED SMALLINT,
    review_text VARCHAR(500)
);
