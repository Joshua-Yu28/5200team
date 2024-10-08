USE CineMatch;


DROP TABLE IF EXISTS Principals;

CREATE TABLE Principals (
	titleId VARCHAR(10),
    ordering INT,
    personId VARCHAR(10),
    category ENUM('editor', 'archive_sound', 'cinematographer', 'actress', 'self', 'production_designer', 'casting_director', 'producer', 'director', 'writer', 'archive_footage', 'composer', 'actor'),
    job VARCHAR(100),
    characters VARCHAR(255),
    
    CONSTRAINT pk_Principals PRIMARY KEY (titleId, personId, job),
    CONSTRAINT fk_Principals_titleId FOREIGN KEY (titleId) 
		REFERENCES Titles(titleId)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_Principals_personId FOREIGN KEY (personId)
		REFERENCES People(personId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


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



