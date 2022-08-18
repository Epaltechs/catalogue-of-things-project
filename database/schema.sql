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

