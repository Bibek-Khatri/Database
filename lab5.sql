-- Create database and use it
CREATE DATABASE hello;
USE hello;

-- Create movie table
CREATE TABLE movie (
    mid INT PRIMARY KEY,
    title VARCHAR(100),
    year INT,
    director VARCHAR(100)
);

-- Insert movie data
INSERT INTO movie (mid, title, year, director) VALUES
(101, 'Top Gun', 1986, 'Tony Scott'),
(102, 'Inception', 2010, 'Christopher Nolan'),
(103, 'The Matrix', 1999, 'Lana Wachowski, Lilly Wachowski'),
(104, 'Jurassic Park', 1993, 'Steven Spielberg'),
(105, 'The Godfather', 1972, 'Francis Ford Coppola'),
(106, 'Pulp Fiction', 1994, 'Quentin Tarantino'),
(107, 'The Dark Knight', 2008, 'Christopher Nolan'),
(108, 'Titanic', 1997, 'James Cameron'),
(109, 'Avatar', 2009, 'James Cameron'),
(110, 'Interstellar', 2014, 'Christopher Nolan');

-- Create rating table
CREATE TABLE rating (
    rid INT PRIMARY KEY AUTO_INCREMENT,
    mid INT,
    rating INT,
    FOREIGN KEY (mid) REFERENCES movie(mid)
);

-- Insert sample ratings
INSERT INTO rating (mid, rating) VALUES
(101, 4),
(102, 5),
(103, 5),
(104, 4),
(105, 5),
(106, 5),
(107, 5),
(108, 4),
(109, 4),
(110, 5);

-- Queries


SELECT * FROM movie;

SELECT title, year FROM movie WHERE year > 2000;


SELECT M.title, M.mid, R.rating
FROM movie M
JOIN rating R ON M.mid = R.mid
WHERE M.year < 2000 AND R.rating > 2;


SELECT M.title, M.mid, R.rating
FROM movie M
JOIN rating R ON M.mid = R.mid
ORDER BY R.rating DESC;

select mID, rating, count(*) as total
from rating group by mID, rating
having count(*) >1;
