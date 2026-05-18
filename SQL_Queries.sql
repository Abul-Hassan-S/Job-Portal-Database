-- Create Tables
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Recruiters (
    recruiter_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    contact VARCHAR(15)
);

CREATE TABLE Jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    recruiter_id INT,
    title VARCHAR(100),
    location VARCHAR(100),
    salary VARCHAR(50),
    posted_date DATE,
    FOREIGN KEY (recruiter_id) REFERENCES Recruiters(recruiter_id)
);

CREATE TABLE Applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    job_id INT,
    applied_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

-- Insert Data
INSERT INTO Users VALUES (1, 'Abul Hassan', 'abul@gmail.com', 'pass123', 'Chennai');
INSERT INTO Recruiters VALUES (1, 'Agilysys', 'hr@agilysys.com', '9876543210');
INSERT INTO Jobs VALUES (1, 1, 'QA Manual Testing', 'Chennai', '3-5 LPA', '2025-01-01');
INSERT INTO Applications VALUES (1, 1, 1, '2025-01-10', 'Applied');

-- Select Queries
SELECT * FROM Users;
SELECT * FROM Jobs WHERE location = 'Chennai';
SELECT u.name, j.title, a.status
FROM Applications a
JOIN Users u ON a.user_id = u.user_id
JOIN Jobs j ON a.job_id = j.job_id;

-- Update & Delete
UPDATE Applications SET status = 'Interview Scheduled' WHERE application_id = 1;
DELETE FROM Applications WHERE status = 'Rejected';

-- TCL
COMMIT;
ROLLBACK;

-- DCL
GRANT SELECT ON Jobs TO 'user1';
REVOKE SELECT ON Jobs FROM 'user1';
