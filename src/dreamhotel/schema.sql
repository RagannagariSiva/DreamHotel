
-- Dream-Hotel Database Schema
-- Engine: MySQL 8.0+
-- Run this file once to initialize your database.

CREATE DATABASE IF NOT EXISTS dream_hotel
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE dream_hotel;

-- USERS
-- Stores registered guests and staff accounts.

CREATE TABLE IF NOT EXISTS users (
    id            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    username      VARCHAR(50)     NOT NULL UNIQUE,
    email         VARCHAR(255)    NOT NULL UNIQUE,
    password_hash VARCHAR(255)    NOT NULL,          -- bcrypt hash
    full_name     VARCHAR(100)    NOT NULL DEFAULT '',
    phone         VARCHAR(20)             DEFAULT NULL,
    role          ENUM('guest','admin')   NOT NULL DEFAULT 'guest',
    created_at    TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
                                           ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_email (email)
) ENGINE=InnoDB;


-- ROOMS
-- Master catalogue of hotel rooms.

CREATE TABLE IF NOT EXISTS rooms (
    id            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    room_number   VARCHAR(10)     NOT NULL UNIQUE,
    room_type     ENUM('standard','deluxe','suite','penthouse') NOT NULL,
    description   TEXT                    DEFAULT NULL,
    capacity      TINYINT UNSIGNED NOT NULL DEFAULT 2,
    price_per_night DECIMAL(10,2) NOT NULL,
    is_available  TINYINT(1)      NOT NULL DEFAULT 1,
    created_at    TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Links users to rooms for a given date range.

CREATE TABLE IF NOT EXISTS bookings (
    id            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    user_id       INT UNSIGNED    NOT NULL,
    room_id       INT UNSIGNED    NOT NULL,
    check_in      DATE            NOT NULL,
    check_out     DATE            NOT NULL,
    guests        TINYINT UNSIGNED NOT NULL DEFAULT 1,
    total_price   DECIMAL(10,2)   NOT NULL,
    status        ENUM('pending','confirmed','cancelled','completed')
                                  NOT NULL DEFAULT 'pending',
    special_requests TEXT                  DEFAULT NULL,
    created_at    TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
                                           ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id)
        REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_room FOREIGN KEY (room_id)
        REFERENCES rooms(id) ON DELETE RESTRICT,
    -- Prevent overlapping bookings for the same room
    INDEX idx_room_dates (room_id, check_in, check_out),
    INDEX idx_user_bookings (user_id)
) ENGINE=InnoDB;

-- SEED: Sample rooms

INSERT INTO rooms (room_number, room_type, description, capacity, price_per_night) VALUES
('101', 'standard', 'Cosy room with city view, queen bed, and en-suite bathroom.', 2, 149.00),
('201', 'deluxe',   'Spacious room with king bed, sitting area, and rain shower.', 2, 249.00),
('301', 'suite',    'Two-room suite with panoramic view, jacuzzi, and mini-bar.',  4, 449.00),
('401', 'penthouse','Full-floor penthouse with private terrace and butler service.',6, 999.00);
