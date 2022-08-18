CREATE DATABASE Catalog_of_Things;

CREATE TABLE books (
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(255),
    cover_sate VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN,
    label_id INT 
    PRIMARY KEY(id)
);

ALTER TABLE books ADD FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE;

CREATE INDEX index_label_id ON books (label_id);

/*
- create Genre table
*/

CREATE TABLE Genre(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(60) NOT NULL
);

/*
- create MusicAlbum table
*/

CREATE TABLE MusicAlbum(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY(id) REFERENCES item(id) ON UPDATE CASCADE
);

/* create games authors */

CREATE TABLE authors (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(200) NOT NULL,
  last_name VARCHAR(200) NOT NULL,
)

/* creates games table */

CREATE TABLE games (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  author_id INT NOT NULL,
  multiplayer VARCHAR(200) NOT NULL,
  last_played_at DATE,
  FOREIGN KEY (author_id) REFERENCES authors(id)
)

/* creates labels table */

CREATE TABLE labels (
  id  INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(100),
  PRIMARY KEY(id)
);

