/* Create tables without relations */ 

CREATE TABLE Animes (
  idAnime serial PRIMARY KEY,
  EnglishName varchar(60) NOT NULL,
  Score float DEFAULT NULL,
  AiredDebut date NOT NULL,
  AiredEnd date DEFAULT NULL,
  Premiered date NOT NULL,
  AverageDuration int NOT NULL,
  Rank int DEFAULT NULL,
  Popularity int DEFAULT NULL,
  genresAnime varchar(60) DEFAULT NULL,
  typesAnime varchar(60) DEFAULT NULL,
  episodesAnime int DEFAULT NULL,
  producersAnime varchar(60) DEFAULT NULL,
  studiosAnime varchar(60) DEFAULT NULL,
  sourcesAnime varchar(60) DEFAULT NULL,
  ratingAnime varchar(60) DEFAULT NULL;
);

CREATE TABLE Genres (
  idGenre serial PRIMARY KEY,
  genreName varchar(60) NOT NULL,
  idAnime int DEFAULT NULL
);

CREATE TABLE Types (
  idType serial PRIMARY KEY,
  typeName varchar(60) NOT NULL,
  idAnime int DEFAULT NULL
);

CREATE TABLE Sources (
  idSource serial PRIMARY KEY,
  sourceName varchar(60) NOT NULL,
  idAnime int DEFAULT NULL
);

CREATE TABLE Studios (
  idStudio serial PRIMARY KEY,
  studioName varchar(60) NOT NULL,
  idAnime int DEFAULT NULL,
  idProducer int DEFAULT NULL
);

CREATE TABLE Producers (
  idProducer serial PRIMARY KEY,
  producerName varchar(60) NOT NULL,
  idAnime int DEFAULT NULL,
  idStudio int DEFAULT NULL
);

CREATE TABLE Ratings (
  idRating serial PRIMARY KEY,
  ratingName varchar(60) NOT NULL,
  idAnime int DEFAULT NULL
);

CREATE TABLE Episodes (
  idEpisode serial PRIMARY KEY,
  episodeName varchar(60) NOT NULL,
  duration varchar(60) NOT NULL,
  idAnime int DEFAULT NULL
);


/* Add relations to tables */ 

ALTER TABLE Genres
ADD FOREIGN KEY (idAnime) REFERENCES Animes (idAnime);

ALTER TABLE Types
ADD FOREIGN KEY (idAnime) REFERENCES Animes (idAnime);

ALTER TABLE Sources
ADD FOREIGN KEY (idAnime) REFERENCES Animes (idAnime);

ALTER TABLE Studios
ADD FOREIGN KEY (idAnime) REFERENCES Animes (idAnime),
ADD FOREIGN KEY (idProducer) REFERENCES Producers (idProducer);

ALTER TABLE Producers
ADD FOREIGN KEY (idAnime) REFERENCES Animes (idAnime),
ADD FOREIGN KEY (idStudio) REFERENCES Studios (idStudio);

ALTER TABLE Ratings
ADD FOREIGN KEY (idAnime) REFERENCES Animes (idAnime);

ALTER TABLE Episodes
ADD FOREIGN KEY (idAnime) REFERENCES Animes (idAnime);

/* Add relations to table Anime */

ALTER TABLE Animes
ADD FOREIGN KEY (idGenre) REFERENCES Genres (idGenre),
ADD FOREIGN KEY (idType) REFERENCES Types (idType),
ADD FOREIGN KEY (idSource) REFERENCES Sources (idSource),
ADD FOREIGN KEY (idStudio) REFERENCES Studios (idStudio),
ADD FOREIGN KEY (idProducer) REFERENCES Producers (idProducer),
ADD FOREIGN KEY (idRating) REFERENCES Ratings (idRating),
ADD FOREIGN KEY (idEpisode) REFERENCES Episodes (idEpisode);

/* Insert data into tables */

INSERT INTO Genres (idGenre, genreName) VALUES (1, 'Action');
INSERT INTO Genres (idGenre, genreName) VALUES (2, 'Adventure');
INSERT INTO Genres (idGenre, genreName) VALUES (3, 'Drama');
INSERT INTO Genres (idGenre, genreName) VALUES (4, 'Sci-Fi');
INSERT INTO Genres (idGenre, genreName) VALUES (5, 'Space');
INSERT INTO Genres (idGenre, genreName) VALUES (6, 'Shounen');
INSERT INTO Genres (idGenre, genreName) VALUES (7, 'Military');
INSERT INTO Genres (idGenre, genreName) VALUES (8, 'Military');

INSERT INTO Types (idType, typeName) VALUES (1, 'TV');
INSERT INTO Types (idType, typeName) VALUES (2, 'Movie');

INSERT INTO Sources (idSource, sourceName) VALUES (1, 'Original');
INSERT INTO Sources (idSource, sourceName) VALUES (2, 'Manga');

INSERT INTO Studios (idStudio, studioName) VALUES (1, 'Sunrise');
INSERT INTO Studios (idStudio, studioName) VALUES (2, 'Studio Pierrot');
INSERT INTO Studios (idStudio, studioName) VALUES (3, 'Toei Animation');
INSERT INTO Studios (idStudio, studioName) VALUES (4, 'Bones');

INSERT INTO Producers (idProducer, producerName) VALUES (1, 'Bandai Visual');
INSERT INTO Producers (idProducer, producerName) VALUES (2, 'Sunrise');
INSERT INTO Producers (idProducer, producerName) VALUES (3, 'TV Tokyo');
INSERT INTO Producers (idProducer, producerName) VALUES (4, 'Fuji TV');
INSERT INTO Producers (idProducer, producerName) VALUES (5, 'Sotsu');
INSERT INTO Producers (idProducer, producerName) VALUES (6, 'Sony Music Entertainment');
INSERT INTO Producers (idProducer, producerName) VALUES (7, 'Shueisha');


INSERT INTO Ratings (idRating, ratingName) VALUES (1, 'R - 17+ (violence & profanity)');
INSERT INTO Ratings (idRating, ratingName) VALUES (2, 'PG-13 - Teens 13 or older');

/* Insert data into Animes table  */


INSERT INTO Animes (idAnime, englishName, score, genresAnime, typesAnime, episodesAnime, airedDebut, airedEnd, premiered, producersAnime, studiosAnime, sourcesAnime, averageDuration, ratingAnime, rank, popularity)
VALUES (1, 'Cowboy Bebop', 8.78, 'Action, Adventure, Drama, Sci-Fi, Space', 'TV', 26, '1998-04-03', '1999-04-24', '1998-04-03', 'Bandai Visual', 'Sunrise', 'Original', 24, 'R - 17+ (violence & profanity)', 28.0, 39);

INSERT INTO Animes (idAnime, englishName, score, genresAnime, typesAnime, episodesAnime, airedDebut, airedEnd, premiered, producersAnime, studiosAnime, sourcesAnime, averageDuration, ratingAnime, rank, popularity)
VALUES (2, 'Cowboy Bebop:The Movie', 8.39, 'Action, Drama, Sci-Fi, Space', 'Movie', 1, '2001-09-1','2001-09-1', '2001-09-1', 'Sunrise, Bandai Visual', 'Bones', 'Original', 60, 'R - 17+ (violence & profanity)', 159.0, 518);

INSERT INTO Animes (idAnime, englishName, score, genresAnime, typesAnime, episodesAnime, airedDebut, airedEnd, premiered, producersAnime, studiosAnime, sourcesAnime, averageDuration, ratingAnime, rank, popularity)
VALUES (3, 'Naruto', 7.91, 'Action, Adventure, Shounen', 'TV', '220', '2002-10-3', '2007-02-08',  '2002-10-3', 'TV Tokyo, Shueisha', 'Studio Pierrot', 'Manga', 23, 'PG-13 - Teens 13 or older', 660.0, 8);

INSERT INTO Animes (idAnime, englishName, score, genresAnime, typesAnime, episodesAnime, airedDebut, airedEnd, premiered, producersAnime, studiosAnime, sourcesAnime, averageDuration, ratingAnime, rank, popularity)
VALUES (4, 'One Piece', 8.52, 'Action, Adventure, Shounen', 'TV', 0, '1999-10-20', '1999-09-01', '1999-10-20', 'Fuji TV, Shueisha', 'Toei Animation', 'Manga', 24, 'PG-13 - Teens 13 or older', 95.0, 31);

INSERT INTO Animes (idAnime, englishName, score, genresAnime, typesAnime, episodesAnime, airedDebut, airedEnd, premiered, producersAnime, studiosAnime, sourcesAnime, averageDuration, ratingAnime, rank, popularity)
VALUES (5, 'Mobile Suit Gundam SEED', 7.79, 'Action, Drama, Military, Sci-Fi, Space', 'TV', 50, '2002-10-05', '2023-09-23', '2002-10-05', 'Sotsu, Sony Music Entertainment', 'Sunrise', 'Original', 24, 'R - 17+ (violence & profanity)', 850.0, 1057);

INSERT INTO Animes (idAnime, englishName, score, genresAnime, typesAnime, episodesAnime, airedDebut, airedEnd, premiered, producersAnime, studiosAnime, sourcesAnime, averageDuration, ratingAnime, rank, popularity)
VALUES (6, 'Mobile Suit Gundam SEED Destiny', 7.22, 'Action, Drama, Military, Sci-Fi, Space', 'TV', 50, '2004-10-4', '2005-10-09', '2004-10-4', 'Sotsu, Sony Music Entertainment', 'Sunrise', 'Original', 24, 'R - 17+ (violence & profanity)', 2687.0, 1530);






