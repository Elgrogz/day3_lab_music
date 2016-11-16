DROP TABLE IF EXISTS albums;
DROP TABLE IF EXITS artists;

CREATE TABLE artists (
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL,
  nationality VARCHAR(255)
);

CREATE TABLE albums (
  title VARCHAR(255) NOT NULL,
  genre VARCHAR(255) NOT NULL,
  artist_id INT8 references artists(id)
);
