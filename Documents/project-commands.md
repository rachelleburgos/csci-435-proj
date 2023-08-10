CSCI 495 Summer 2023
Team 2: Rachelle Burgos, Bahi Berk Gulay

```bash
mysql --local-infile=1 -u root -p presentation
SET GLOBAL local_infile=1;
```

```SQL

source unnormalized_table.sql
source 3NF_tables.sql

-- Populate unnormalized table
LOAD DATA LOCAL INFILE 'dummy_data.tsv'
INTO TABLE unnormalized
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- Source queries, which inserts data from unnormalized table into all normalized tables
source queries.sql;

-- Reviews for Accommodations
SELECT 
    u.user_name, 
    ac.accommodation_name, 
    r.review_rating, 
    r.review_title, 
    r.review_text,
    'Accommodation' AS review_type
FROM Review r
JOIN User u ON r.user_fk = u.user_id
JOIN Accommodation ac ON r.accommodation_fk = ac.accommodation_id
WHERE r.review_type = 'Accommodation';


-- Top-Rated Attractions
SELECT 
    a.attraction_name,
    ad.attraction_rating,
    c.city_name
FROM Attraction a
JOIN AttractionDetails ad ON a.attraction_id = ad.attraction_id
JOIN City c ON a.city_id = c.city_id
ORDER BY ad.attraction_rating DESC
LIMIT 10;

-- Restaurants by Cuisine Type
SELECT 
    r.restaurant_name,
    c.city_name,
    rd.restaurant_cuisine_type
FROM Restaurant r
JOIN RestaurantDetails rd ON r.restaurant_id = rd.restaurant_id
JOIN City c ON r.city_id = c.city_id
WHERE rd.restaurant_cuisine_type = 'Italian';

-- Safety Tips for a City
SELECT 
    s.safety_tip
FROM SafetyTip s
JOIN City c ON s.city_id = c.city_id
WHERE c.city_name = 'New York';

-- Average Ratings per City (Sorted)
SELECT 
    c.city_name, 
    AVG(ad.attraction_rating) AS average_rating
FROM City c
JOIN Attraction a ON c.city_id = a.city_id
JOIN AttractionDetails ad ON a.attraction_id = ad.attraction_id
GROUP BY c.city_name
ORDER BY average_rating DESC;



```