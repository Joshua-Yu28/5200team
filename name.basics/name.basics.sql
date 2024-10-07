CREATE SCHEMA IF NOT EXISTS CineMatch;
USE CineMatch;

DROP TABLE IF EXISTS PeopleTitles;
DROP TABLE IF EXISTS People;

CREATE TABLE People (
	personId VARCHAR(10),
    name VARCHAR(100) NOT NULL,
    birthYear INT,
    deathYear INT,
    primaryProfession VARCHAR(255),
    
    CONSTRAINT pk_People_personId PRIMARY KEY (personId)
);

CREATE TABLE PeopleTitles (
	personId VARCHAR(10),
    titleId VARCHAR(10),
    
    CONSTRAINT pk_PeopleTitles PRIMARY KEY (personId, titleId),
    CONSTRAINT fk_PeopleTitles_personId FOREIGN KEY (personId)
		REFERENCES People(personId)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_PeopleTitles_titleId FOREIGN KEY (titleId)
		REFERENCES Titles(titleId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);




LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/name.basics/name_basics_no_knownForTitles.tsv' 
INTO TABLE People 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(personId, name, birthYear, deathYear, primaryProfession);



LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/name.basics/split_files/people_titles_mapping_part_1.tsv' 
INTO TABLE PeopleTitles 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(personId, titleId);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/name.basics/split_files/people_titles_mapping_part_2.tsv' 
INTO TABLE PeopleTitles 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(personId, titleId);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/name.basics/split_files/people_titles_mapping_part_3.tsv' 
INTO TABLE PeopleTitles 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(personId, titleId);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/name.basics/split_files/people_titles_mapping_part_4.tsv' 
INTO TABLE PeopleTitles 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(personId, titleId);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/name.basics/split_files/people_titles_mapping_part_5.tsv' 
INTO TABLE PeopleTitles 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(personId, titleId);


