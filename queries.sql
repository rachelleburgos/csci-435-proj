-- CSCI 495 Summer 2023
-- Team 2: Rachelle Burgos, Bahi Berk Gulay
-- Attributions: ChatGPT

-- Country Table
INSERT INTO Country (country_code, country_name)
SELECT DISTINCT 
    country_code, 
    country_name
FROM Unnormalized
WHERE country_code IS NOT NULL 
AND country_name IS NOT NULL;

-- CountryDetails Table
INSERT INTO CountryDetails (country_id, country_population, country_currency, country_description)
SELECT 
    c.country_id,
    u.country_population, 
    u.country_currency, 
    u.country_description
FROM Unnormalized u
JOIN Country c ON u.country_code = c.country_code
WHERE u.country_code IS NOT NULL 
AND u.country_name IS NOT NULL;

-- City Table
INSERT INTO City (country_id, city_name)
SELECT DISTINCT 
    c.country_id,
    u.city_name
FROM Unnormalized u
JOIN Country c ON u.country_code = c.country_code
WHERE u.city_name IS NOT NULL 
AND u.country_code IS NOT NULL;

-- CityDetails Table
INSERT INTO CityDetails (city_id, city_region, city_population, city_description)
SELECT 
    ci.city_id,
    u.city_region,
    u.city_population,
    u.city_description
FROM Unnormalized u
JOIN City ci ON u.city_name = ci.city_name
WHERE u.city_name IS NOT NULL;

-- Attraction Table
INSERT INTO Attraction (city_id, attraction_name)
SELECT DISTINCT 
    c.city_id,
    u.attraction_name
FROM Unnormalized u
JOIN City c ON u.city_name = c.city_name
WHERE u.attraction_name IS NOT NULL 
AND u.city_name IS NOT NULL;

-- AttractionDetails Table
INSERT INTO AttractionDetails (attraction_id, attraction_description, attraction_rating, attraction_photo_url)
SELECT 
    a.attraction_id,
    u.attraction_description, 
    u.attraction_rating, 
    u.attraction_photo_url
FROM Unnormalized u
JOIN Attraction a ON u.attraction_name = a.attraction_name
WHERE u.attraction_name IS NOT NULL;

-- Accommodation Table
INSERT INTO Accommodation (city_id, accommodation_name)
SELECT DISTINCT 
    c.city_id,
    u.accommodation_name
FROM Unnormalized u
JOIN City c ON u.city_name = c.city_name
WHERE u.accommodation_name IS NOT NULL 
AND u.city_name IS NOT NULL;

-- AccommodationDetails Table
INSERT INTO AccommodationDetails (accommodation_id, accommodation_address, accommodation_rating, accommodation_average_price, accommodation_website_url)
SELECT 
    a.accommodation_id,
    u.accommodation_address, 
    u.accommodation_rating, 
    u.accommodation_average_price, 
    u.accommodation_website_url
FROM Unnormalized u
JOIN Accommodation a ON u.accommodation_name = a.accommodation_name
WHERE u.accommodation_name IS NOT NULL;

-- Restaurant Table
INSERT INTO Restaurant (city_id, restaurant_name)
SELECT DISTINCT 
    c.city_id,
    u.restaurant_name
FROM Unnormalized u
JOIN City c ON u.city_name = c.city_name
WHERE u.restaurant_name IS NOT NULL 
AND u.city_name IS NOT NULL;

-- RestaurantDetails Table
INSERT INTO RestaurantDetails (restaurant_id, restaurant_address, restaurant_cuisine_type, restaurant_rating, restaurant_website_url)
SELECT 
    r.restaurant_id,
    u.restaurant_address, 
    u.restaurant_cuisine_type, 
    u.restaurant_rating, 
    u.restaurant_website_url
FROM Unnormalized u
JOIN Restaurant r ON u.restaurant_name = r.restaurant_name
WHERE u.restaurant_name IS NOT NULL;

-- Transportation Table
INSERT INTO Transportation (city_id, transportation_mode)
SELECT DISTINCT 
    c.city_id,
    u.transportation_mode
FROM Unnormalized u
JOIN City c ON u.city_name = c.city_name
WHERE u.transportation_mode IS NOT NULL 
AND u.city_name IS NOT NULL;

-- TransportationDetails Table
INSERT INTO TransportationDetails (transportation_id, transportation_details, transportation_average_price, transportation_website_url)
SELECT 
    t.transportation_id,
    u.transportation_details, 
    u.transportation_average_price, 
    u.transportation_website_url
FROM Unnormalized u
JOIN Transportation t ON u.transportation_mode = t.transportation_mode
WHERE u.transportation_mode IS NOT NULL;

-- SafetyTip Table
INSERT INTO SafetyTip (city_id, safety_tip)
SELECT DISTINCT 
    c.city_id,
    u.safety_tip
FROM Unnormalized u
JOIN City c ON u.city_name = c.city_name
WHERE u.safety_tip IS NOT NULL 
AND u.city_name IS NOT NULL;


-- Inserting Restaurant Reviews
INSERT INTO Review (user_fk, restaurant_fk, review_rating, review_title, review_text, review_type)
SELECT 
    u.user_id,
    r.restaurant_id,
    un.review_rating,
    un.review_title,
    un.review_text,
    'Restaurant'
FROM Unnormalized un
LEFT JOIN User u ON un.user_name = u.user_name
LEFT JOIN Restaurant r ON un.restaurant_name = r.restaurant_name
WHERE un.review_type = 'Restaurant'
AND un.review_text IS NOT NULL 
AND un.review_title IS NOT NULL;

-- Inserting Accommodation Reviews
INSERT INTO Review (user_fk, accommodation_fk, review_rating, review_title, review_text, review_type)
SELECT 
    u.user_id,
    ac.accommodation_id,
    un.review_rating,
    un.review_title,
    un.review_text,
    'Accommodation'
FROM Unnormalized un
LEFT JOIN User u ON un.user_name = u.user_name
LEFT JOIN Accommodation ac ON un.accommodation_name = ac.accommodation_name
WHERE un.review_type = 'Accommodation'
AND un.review_text IS NOT NULL 
AND un.review_title IS NOT NULL;

-- Inserting Attraction Reviews
INSERT INTO Review (user_fk, attraction_fk, review_rating, review_title, review_text, review_type)
SELECT 
    u.user_id,
    a.attraction_id,
    un.review_rating,
    un.review_title,
    un.review_text,
    'Attraction'
FROM Unnormalized un
LEFT JOIN User u ON un.user_name = u.user_name
LEFT JOIN Attraction a ON un.attraction_name = a.attraction_name
WHERE un.review_type = 'Attraction'
AND un.review_text IS NOT NULL 
AND un.review_title IS NOT NULL;

-- User Table
INSERT INTO User (user_name, user_password, user_email, user_profile_image_url)
SELECT DISTINCT 
    user_name, 
    user_password, 
    user_email, 
    user_profile_image_url 
FROM Unnormalized
WHERE user_name IS NOT NULL 
    AND user_password IS NOT NULL 
    AND user_email IS NOT NULL
    AND NOT EXISTS (
        SELECT 1 
        FROM User 
        WHERE user_name = Unnormalized.user_name 
              AND user_email = Unnormalized.user_email 
              AND user_password = Unnormalized.user_password
); 