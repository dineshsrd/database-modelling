-- Table creation queries

-- Theatre Table
CREATE TABLE Theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Movie Table
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    genre VARCHAR(50) NOT NULL
);

-- Show Table
CREATE TABLE Show (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT,
    movie_id INT,
    date DATE NOT NULL,
    time TIME NOT NULL,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Ticket Table
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT,
    seat_number VARCHAR(10),
    price DECIMAL(5,2),
    FOREIGN KEY (show_id) REFERENCES Show(show_id)
);

-- User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

-- Booking Table
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    ticket_id INT,
    booking_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);

-- Sample Data

-- Inserting into Theatre
INSERT INTO Theatre (name, location) VALUES 
('PVR Cinemas', 'Chennai'),
('Inox', 'Bangalore');

-- Inserting into Movie
INSERT INTO Movie (title, duration, genre) VALUES 
('Inception', 148, 'Sci-Fi'),
('Maharaja', 168, 'Romance'),
('The Dark Knight', 152, 'Action');

-- Inserting into Show
INSERT INTO Show (theatre_id, movie_id, date, time) VALUES 
(1, 1, '2024-04-25', '18:30:00'),
(1, 2, '2024-04-25', '21:00:00'),
(2, 1, '2024-04-26', '20:00:00'),
(2, 2, '2024-04-26', '21:45:00'),
(2, 3, '2024-04-26', '23:15:00');

-- Inserting into Ticket
INSERT INTO Ticket (show_id, seat_number, price) VALUES 
(1, 'A1', 250.00),
(1, 'A2', 250.00),
(2, 'B1', 300.00),
(2, 'B2', 300.00),
(3, 'C1', 300.00),
(3, 'C2', 300.00);

-- Inserting into User
INSERT INTO User (name, email, phone) VALUES 
('Dinesh', 'dinesh@example.com', '9876543210'),
('Somes', 'somes@example.com', '9876543210'),
('Sarvesh', 'sarvesh@example.com', '9876543210'),
('Suvedan', 'suvedan@example.com', '9876543210'),
('Rahul', 'rahul@example.com', '9876543210');

-- Inserting into Booking
INSERT INTO Booking (user_id, ticket_id, booking_date) VALUES 
(1, 1, NOW()),
(2, 2, NOW());

-- Query to List Shows on a Given Date at a Given Theatre
SELECT 
    s.show_id,
    m.title AS movie_title,
    s.time AS show_time
FROM 
    Show s
JOIN 
    Movie m ON s.movie_id = m.movie_id
WHERE 
    s.name = 'PVR Cinemas'
AND 
    s.date = '2024-04-25'
ORDER BY 
    s.time;
