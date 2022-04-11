.mode csv
.import reviews.csv reviews_data_raw
.import listings.csv listings_data_raw

CREATE TABLE listings (
  id INTEGER PRIMARY KEY,
  url TEXT,
  name TEXT,
  body TEXT,
  host_name TEXT,
  host_since TEXT,
  neighborhood TEXT,
  property_type TEXT,
  accommodates INTEGER,
  bathrooms INTEGER,
  bedrooms INTEGER,
  price TEXT,
  minimum_nights INTEGER,
  maximum_nights INTEGER,
  available INTEGER
);

INSERT INTO listings (id, url, name, body, host_name, host_since, 
                      neighborhood, property_type, accommodates, bathrooms, bedrooms, 
                      price, minimum_nights, maximum_nights, available)
SELECT id, listing_url, name, description, host_name, host_since,
       neighbourhood_cleansed, property_type, accommodates, bathrooms, bedrooms,
       price, minimum_nights, maximum_nights, has_availability
FROM listings_data_raw;

DROP TABLE listings_data_raw;

CREATE TABLE reviews (
  id INTEGER PRIMARY KEY,
  listing_id INTEGER,
  date_reviewed TEXT,
  reviewer_name TEXT,
  comments TEXT
);

INSERT INTO reviews (id, listing_id, date_reviewed, reviewer_name, comments)
SELECT id, listing_id, date, reviewer_name, comments
FROM reviews_data_raw;

DROP TABLE reviews_data_raw;
