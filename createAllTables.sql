
DROP TABLE IF EXISTS TitleGenres;
DROP TABLE IF EXISTS TitleWriters;
DROP TABLE IF EXISTS TitleDirectors;
DROP TABLE IF EXISTS TitleEpisodes;
DROP TABLE IF EXISTS PeopleTitles;
DROP TABLE IF EXISTS Principals;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Users;


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

CREATE TABLE Users (
	username VARCHAR(255),
    password VARCHAR(255),
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    dob DATE,
    MBTI VARCHAR(4),
    Profession ENUM ('Accountant', 'Auditor', 'Financial Analyst', 'Bookkeeper', 'Investment Banker', 'Graphic Designer', 'Illustrator', 'Photographer', 'Fashion Designer', 'Animator', 'Manager', 'Consultant', 'Business Analyst', 'Human Resources Manager', 'Operations Manager', 'Civil Engineer', 'Architect', 'Construction Worker', 'Electrical Engineer', 'Mechanical Engineer', 'Teacher', 'Professor', 'Educational Administrator', 'Tutor', 'School Counselor', 'Doctor', 'Nurse', 'Pharmacist', 'Dentist', 'Physical Therapist', 'Software Developer', 'Data Analyst', 'Systems Administrator', 'Cybersecurity Specialist', 'IT Support Specialist', 'Lawyer', 'Paralegal', 'Judge', 'Legal Assistant', 'Court Clerk', 'Marketing Manager', 'Sales Representative', 'Social Media Manager', 'Brand Manager', 'Advertising Executive', 'Biologist', 'Chemist', 'Physicist', 'Research Scientist', 'Lab Technician', 'Electrician', 'Plumber', 'Carpenter', 'Mechanic', 'Welder', 'Truck Driver', 'Delivery Driver', 'Pilot', 'Train Conductor', 'Logistics Coordinator', 'Chef', 'Waiter', 'Hotel Manager', 'Event Planner', 'Bartender', 'Police Officer', 'Firefighter', 'Postal Worker', 'Social Worker', 'Public Administrator', 'Journalist', 'Editor', 'Public Relations Specialist', 'TV Host', 'Copywriter', 'Store Manager', 'Cashier', 'Merchandiser', 'Sales Associate', 'Inventory Specialist', 'Real Estate Agent', 'Property Manager', 'Appraiser', 'Real Estate Developer', 'Leasing Agent', 'Actor', 'Musician', 'Director', 'Comedian', 'Dancer', 'Athlete', 'Coach', 'Personal Trainer', 'Sports Manager', 'Physical Education Teacher', 'Customer Service Representative', 'Call Center Agent', 'Technical Support Specialist', 'Concierge', 'Help Desk Specialist'),

	CONSTRAINT pk_Users_username PRIMARY KEY (username)
);


CREATE TABLE Reviews (
	reviewId INT AUTO_INCREMENT,
    titleId VARCHAR(10),
    username VARCHAR(255),
    rating DECIMAL(3, 1) NOT NULL,
    content TEXT,
    
    CONSTRAINT pk_Reviews_reviewId PRIMARY KEY (reviewId),
    CONSTRAINT fk_Reviews_titleId FOREIGN KEY (titleId)
		REFERENCES Titles(titleId)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
	CONSTRAINT fk_Reviews_username FOREIGN KEY (username)
		REFERENCES Users(username)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

