INSERT INTO Transportation (transportation_mode, transportation_details, transportation_average_price, transportation_website_url)
SELECT transportation_mode, transportation_details, transportation_average_price, transportation_website_url FROM Unnormalized;

INSERT INTO Restaurant (restaurant_name, restaurant_address, restaurant_cuisine_type, restaurant_rating, restaurant_website_url)
SELECT restaurant_name, restaurant_address, restaurant_cuisine_type, restaurant_rating, restaurant_website_url FROM Unnormalized;

INSERT INTO Safety_Tip (safety_tip)
SELECT safety_tip FROM Unnormalized;

INSERT INTO Accommodation (accommodation_name, accommodation_address, accommodation_rating, accommodation_average_price, accommodation_website_url)
SELECT accommodation_name, accommodation_address, accommodation_rating, accommodation_average_price, accommodation_website_url FROM Unnormalized;

INSERT INTO Attraction (attraction_name, attraction_description, attraction_rating, attraction_photo_url)
SELECT attraction_name, attraction_description, attraction_rating, attraction_photo_url FROM Unnormalized;

INSERT INTO City (city_name, city_region, city_population, city_description)
SELECT city_name, city_region, city_population, city_description FROM Unnormalized;

INSERT INTO Country (country_code, country_name, country_population, country_currency, country_description)
SELECT country_code, country_name, country_population, country_currency, country_description FROM Unnormalized;

INSERT INTO User (user_name, user_password, user_email, user_profile_image_url)
SELECT user_name, user_password, user_email, user_profile_image_url FROM Unnormalized;

INSERT INTO Review (review_rating, review_text)
SELECT review_rating, review_text FROM Unnormalized;