-- Using the IMDB table 
SELECT * FROM imdb_top_1000_;
--Determining the oldest and most recent movie from the table
SELECT series_title, MIN(released_year) AS oldest_year,  MAX(released_year) AS recent_year
FROM imdb_top_1000_;
-- Determining the Top 5 most rated movie by IMDB ratings
SELECT series_title, imdb_rating
FROM imdb_top_1000_
ORDER BY imdb_rating DESC
LIMIT 5;
-- Determining the Top 5 most rated movie by number of votes
SELECT series_title, no_of_votes 
FROM imdb_top_1000_
ORDER BY no_of_votes DESC
LIMIT 5;
-- What top 3 genre are the most rated by IMDB?
SELECT genre, imdb_rating
FROM imdb_top_1000_
ORDER BY imdb_rating DESC
LIMIT 3;
-- What top 5 movies and genre had high IMDB ratings over the decade?
SELECT series_title, imdb_rating, genre, released_year
FROM imdb_top_1000_
WHERE released_year 
BETWEEN 2010 AND 2020
ORDER BY imdb_rating DESC
LIMIT 5;
-- What genre combination had the highest imdb ratings
SELECT series_title, imdb_rating, genre
FROM imdb_top_1000_
    WHERE imdb_rating > 8.0
    AND genre LIKE ('%_%,%_%')
   GROUP BY series_title, imdb_rating
ORDER BY imdb_rating DESC
LIMIT 3;
-- What directors had the highest imdb ratings?
SELECT director, imdb_rating
FROM imdb_top_1000_
ORDER BY imdb_rating DESC
LIMIT 5;
-- How many movies with 'A' certification has a rating more than 8.0?
SELECT COUNT(*) AS MovieCount
FROM imdb_top_1000_
WHERE certificate = 'A' AND imdb_rating> 8.0;
-- What movie had the highest gross revenue?
SELECT series_title, released_year, MAX(gross)
FROM imdb_top_1000_