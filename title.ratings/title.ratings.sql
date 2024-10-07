CREATE SCHEMA IF NOT EXISTS CineMatch;
USE CineMatch;
DROP TABLE IF EXISTS Ratings;

CREATE TABLE Ratings (
	titleId VARCHAR(10),
    averageRating DECIMAL(4, 1),
    numVotes INT,
    
    CONSTRAINT pk_Ratings_titleId PRIMARY KEY (titleId),
    CONSTRAINT fk_Ratings_titleId FOREIGN KEY (titleId)
		REFERENCES Titles(titleId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.ratings/title.ratings.tsv'
INTO TABLE Ratings
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, averageRating, numVotes);

