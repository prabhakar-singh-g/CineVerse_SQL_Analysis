-- CineVerse SQL Database Schema
-- This script creates the full database structure for the CineVerse movie streaming platform.
-- Includes: Database, Tables (User, Movie, WatchHistory, Subscription, Review)
-- Author: Prabhakar SIngh | GitHub: prabhakar-singh-g
-- Date Created: 22 June 2025

-- 1. Create Database
CREATE DATABASE CineVerse;

-- Use Database
USE CineVerse;

-- Create Tables
-- 1. User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50) NOT NULL,
    registered_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 2. Movie Table
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year INT CHECK (release_year BETWEEN 1990 AND 2025),
    duration_min INT CHECK (duration_min > 0),
    language VARCHAR(30) DEFAULT 'English',
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 10)
);

-- 3. WatchHistory Table
CREATE TABLE WatchHistory (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    watch_date DATE NOT NULL,
    watch_duration_min INT CHECK (watch_duration_min >= 0),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- 4. Subscription Table
CREATE TABLE Subscription (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    plan ENUM('Basic', 'Standard', 'Premium') NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price_usd DECIMAL(5,2) CHECK (price_usd > 0),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- 5. Review Table
CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 10),
    comment TEXT,
    review_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- ✅ Tables created successfully.

-- 📥 To insert data into the tables:
-- Use the "Table Data Import Wizard" in MySQL Workbench.