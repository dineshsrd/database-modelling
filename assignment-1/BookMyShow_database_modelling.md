# Movie Ticketing System

This document outlines the database structure for a movie ticketing system similar to BookMyShow. The entities follow 1NF, 2NF, 3NF, and BCNF normalization rules.

## Entities and Attributes

### Theatre
- `theatre_id`: INT, Primary Key
- `name`: VARCHAR(100), Name of the theatre
- `location`: VARCHAR(100), Location of the theatre

### Movie
- `movie_id`: INT, Primary Key
- `title`: VARCHAR(100), Movie title
- `duration`: INT, Duration of the movie (in minutes)
- `genre`: VARCHAR(50), Movie genre

### Show
- `show_id`: INT, Primary Key
- `theatre_id`: INT, Foreign Key, References Theatre
- `movie_id`: INT, Foreign Key, References Movie
- `date`: DATE, Show date
- `time`: TIME, Show timing

### Ticket
- `ticket_id`: INT, Primary Key
- `show_id`: INT, Foreign Key, References Show
- `seat_number`: VARCHAR(10), Seat number
- `price`: DECIMAL(5,2), Ticket price

### User
- `user_id`: INT, Primary Key
- `name`: VARCHAR(100), User's name
- `email`: VARCHAR(100), User's email
- `phone`: VARCHAR(15), User's phone number

### Booking
- `booking_id`: INT, Primary Key
- `user_id`: INT, Foreign Key, References User
- `ticket_id`: INT, Foreign Key, References Ticket
- `booking_date`: DATETIME, Date and time of booking

## SQL Queries

All SQL queries for creating the tables and inserting sample data can be found in the `movie_ticketing_system.sql` file.

