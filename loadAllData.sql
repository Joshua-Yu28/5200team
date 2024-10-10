-- title.basic 
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

-- title.ratings
LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.ratings/title.ratings.tsv'
INTO TABLE Ratings
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, averageRating, numVotes);


-- name.basics
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


-- title.episodes
LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.episodes/title.episode.tsv' 
INTO TABLE TitleEpisodes 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES  
(episodeId, parentTitleId, seasonNumber, episodeNumber);


-- title.crew
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


-- title.principals
LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_1.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_2.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_3.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_4.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_5.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_6.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_7.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_8.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);

LOAD DATA LOCAL INFILE '/Users/jiangtianhan/Desktop/5200/project/pm2/title.principals/split_files/title.principals_part_9.tsv'
INTO TABLE Principals
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(titleId, ordering, personId, category, job, characters);


