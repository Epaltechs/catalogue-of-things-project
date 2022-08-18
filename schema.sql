-- Add database schema files for game and author

CREATE TABLE authors (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
first_name VARCHAR(200) NOT NULL,
last_name VARCHAR(200) NOT NULL,
)

CREATE TABLE games (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
author_id INT NOT NULL,
 multiplayer VARCHAR(200) NOT NULL,
 last_played_at DATE,
 FOREIGN KEY (author_id) REFERENCES authors(id)
)
