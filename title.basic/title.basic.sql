CREATE SCHEMA IF NOT EXISTS CineMatch;
USE CineMatch;



DROP TABLE IF EXISTS TitleGenres;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Titles;

CREATE TABLE Genres (  
	genreId INT AUTO_INCREMENT,     
	genreName VARCHAR(100) UNIQUE,          
	CONSTRAINT pk_genres_genreId PRIMARY KEY (genreId) 
);


CREATE TABLE Titles (  
	titleId VARCHAR(10),     
    titleType ENUM('short', 'movie', 'tvEpisode', 'tvMovie', 'tvSeries', 'tvSpecial', 'video', 'videoGame'),     
    primaryTitle VARCHAR(255),     
    originalTitle VARCHAR(255),     
    isAdult BOOLEAN,     
    startYear INT,     
    endYear INT,     
    runtimeMinutes INT,          
    CONSTRAINT pk_Titles_titleId PRIMARY KEY (titleId) 
);



CREATE TABLE TitleGenres (  
	titleId VARCHAR(10),     
    genreId INT,          
    CONSTRAINT pk_titleGenres PRIMARY KEY (titleId, genreId),     
    CONSTRAINT fk_titleGenres_tconst FOREIGN KEY (titleId) 
		REFERENCES Titles(titleId)   
        ON DELETE CASCADE         
        ON UPDATE CASCADE,  
	CONSTRAINT fk_genreId FOREIGN KEY (genreId) 
		REFERENCES Genres(genreId)   
        ON DELETE CASCADE         
        ON UPDATE CASCADE 
);



LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.basic/cleaned_title_basics_no_genres.tsv' 
INTO TABLE Titles 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(titleId, titleType, primaryTitle, originalTitle, isAdult, startYear, endYear, runtimeMinutes);


LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.basic/genres_list.csv' 
INTO TABLE Genres 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(genreId, genreName);


LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.basic/title_to_genre_mapping.csv' 
INTO TABLE TitleGenres 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(titleId, genreId);












