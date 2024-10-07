CREATE SCHEMA IF NOT EXISTS CineMatch;
USE CineMatch;

DROP TABLE IF EXISTS TitleEpisodes;

CREATE TABLE TitleEpisodes (
	episodeId VARCHAR(10),
    parentTitleId VARCHAR(10),
    seasonNumber INT,
    episodeNumber INT,
    
    CONSTRAINT pk_TitleEpisodes_episodeId PRIMARY KEY (episodeId),
    CONSTRAINT fk_TitleEpisodes_parentTitleId FOREIGN KEY (parentTitleId)
		REFERENCES Titles(titleId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.episodes/title.episode.tsv' 
INTO TABLE TitleEpisodes 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(episodeId, parentTitleId, seasonNumber, episodeNumber);



