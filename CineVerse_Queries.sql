-- SQL Questions and Answers for CineVerse Movie Streaming Platform

-- BASIC 
-- 1. How many users are there in each country?
-- Step to solve: We need to count total users from each country by grouping the user table by country.
SELECT country, COUNT(*) AS total_users
FROM User
GROUP BY country
ORDER BY total_users DESC;
-- 2. Which are the top 5 highest-rated movies?
-- Step to solve: Sort the Movie table based on rating in descending order and limit the result to 5.
SELECT title, rating
FROM Movie
ORDER BY rating DESC
LIMIT 5;
-- 3. Which movie has been watched the highest number of times?
-- Step to solve: Join WatchHistory with Movie, group by movie_id, and count how many times each movie was watched.
SELECT m.title, COUNT(*) AS total_views
FROM WatchHistory w
JOIN Movie m ON w.movie_id = m.movie_id
GROUP BY w.movie_id
ORDER BY total_views DESC
LIMIT 1;
-- 4. List all users who are currently on a "Premium" plan.
-- Step to solve: Join the Subscription and User tables, then filter records where plan is 'Premium'.
SELECT u.first_name, u.last_name, u.email
FROM Subscription s
JOIN User u ON s.user_id = u.user_id
WHERE s.plan = 'Premium';

-- INTERMEDIATE
-- 5. Which country has generated the highest subscription revenue?
-- Step to solve: Join User with Subscription and sum up subscription prices, grouped by country.
SELECT u.country, ROUND(SUM(s.price_usd), 2) AS total_revenue
FROM Subscription s
JOIN User u ON u.user_id = s.user_id
GROUP BY u.country
ORDER BY total_revenue DESC
LIMIT 1;
-- 6. Who are the top 3 most active users based on total watch time?
-- Step to solve: Join User and WatchHistory, group by user, and sum total watch duration in minutes.
SELECT u.first_name, u.last_name, SUM(w.watch_duration_min) AS total_watch_time
FROM WatchHistory w
JOIN User u ON w.user_id = u.user_id
GROUP BY u.user_id
ORDER BY total_watch_time DESC
LIMIT 3;
-- 7. What is the average watch duration for each movie?
-- Step to solve: Join WatchHistory with Movie and compute average duration watched per movie.
SELECT m.title, ROUND(AVG(w.watch_duration_min), 2) AS avg_watch_time
FROM WatchHistory w
JOIN Movie m ON w.movie_id = m.movie_id
GROUP BY w.movie_id
ORDER BY avg_watch_time DESC;
-- 8. Which genre has the most total watch time in hours?
-- Step to solve: Join WatchHistory with Movie, group by genre, and sum total watch duration.
SELECT m.genre, ROUND(SUM(w.watch_duration_min)/60, 2) AS total_hours
FROM WatchHistory w
JOIN Movie m ON w.movie_id = m.movie_id
GROUP BY m.genre
ORDER BY total_hours DESC;
-- 9. What is the trend of monthly subscription revenue?
-- Step to solve: Extract month from start_date and group subscriptions to get monthly revenue trend.
SELECT DATE_FORMAT(start_date, '%Y-%m') AS month, ROUND(SUM(price_usd), 2) AS revenue
FROM Subscription
GROUP BY month
ORDER BY month;

-- ADVANCED
-- 10. What is the most-watched genre in each country?
-- Step to solve: Join WatchHistory → User & Movie, count views per genre per country, and use ROW_NUMBER to get top one per country.
WITH GenreViews AS (
  SELECT u.country, m.genre, COUNT(*) AS views,
         ROW_NUMBER() OVER (PARTITION BY u.country ORDER BY COUNT(*) DESC) AS rn
  FROM WatchHistory w
  JOIN User u ON w.user_id = u.user_id
  JOIN Movie m ON w.movie_id = m.movie_id
  GROUP BY u.country, m.genre
)
SELECT country, genre, views
FROM GenreViews
WHERE rn = 1;
-- 11. Which users rated movies higher than their average ratings?
-- Step to solve: First calculate average rating per movie, then compare each user rating with that movie's average.
WITH AvgRatings AS (
  SELECT movie_id, AVG(rating) AS avg_rating
  FROM Review
  GROUP BY movie_id
)
SELECT r.user_id, r.movie_id, r.rating, a.avg_rating
FROM Review r
JOIN AvgRatings a ON r.movie_id = a.movie_id
WHERE r.rating > a.avg_rating;
-- 12. List movies that have high ratings (avg > 8) but have low views (<10 total).
-- Step to solve: Combine reviews and watch history to find average rating and total views per movie, then filter by conditions.
WITH MovieStats AS (
  SELECT m.movie_id, m.title, AVG(r.rating) AS avg_rating, COUNT(w.history_id) AS view_count
  FROM Movie m
  LEFT JOIN Review r ON m.movie_id = r.movie_id
  LEFT JOIN WatchHistory w ON m.movie_id = w.movie_id
  GROUP BY m.movie_id, m.title
)
SELECT * FROM MovieStats
WHERE avg_rating > 8 AND view_count < 10;