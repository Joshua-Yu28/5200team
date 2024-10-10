USE CineMatch;


DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Users;


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


