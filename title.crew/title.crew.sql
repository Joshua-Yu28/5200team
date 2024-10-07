CREATE SCHEMA IF NOT EXISTS CineMatch;
USE CineMatch;


DROP TABLE IF EXISTS TitleDirectors;
DROP TABLE IF EXISTS TitleWriters;

CREATE TABLE TitleDirectors (
	titleId VARCHAR(10),
	personId VARCHAR(10),
    
    CONSTRAINT pk_TitleDirectors PRIMARY KEY (titleId, personId),
    CONSTRAINT fk_TitleDirectors_titleId FOREIGN KEY (titleId)
		REFERENCES Titles(titleId)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_TitleDirectors_personId FOREIGN KEY (personId)
		REFERENCES People(personId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);




CREATE TABLE TitleWriters (
	titleId VARCHAR(10),
	personId VARCHAR(10),
    
    CONSTRAINT pk_TitleWriters PRIMARY KEY (titleId, personId),
    CONSTRAINT fk_TitleWriters_titleId FOREIGN KEY (titleId)
		REFERENCES Titles(titleId)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_TitleWriters_personId FOREIGN KEY (personId)
		REFERENCES People(personId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.crew/directors/directors_1.tsv'
INTO TABLE TitleDirectors
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, personId);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.crew/directors/directors_2.tsv'
INTO TABLE TitleDirectors
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, personId);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.crew/directors/directors_3.tsv'
INTO TABLE TitleDirectors
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, personId);


LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.crew/writers/writers_1.tsv'
INTO TABLE TitleWriters
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, personId);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.crew/writers/writers_2.tsv'
INTO TABLE TitleWriters
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, personId);




