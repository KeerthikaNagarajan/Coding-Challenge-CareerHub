-- Task 1-4: Database initialization with error handling
DROP DATABASE IF EXISTS CareerHub;
CREATE DATABASE CareerHub;
USE CareerHub;

-- Create Companies table
CREATE TABLE IF NOT EXISTS Companies (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

-- Create Jobs table
CREATE TABLE IF NOT EXISTS Jobs (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyID INT NOT NULL,
    JobTitle VARCHAR(100) NOT NULL,
    JobDescription TEXT,
    JobLocation VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),
    JobType ENUM('Full-time', 'Part-time', 'Contract', 'Internship') NOT NULL,
    PostedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID) ON DELETE CASCADE
);

-- Create Applicants table
CREATE TABLE IF NOT EXISTS Applicants (
    ApplicantID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Resume TEXT,
    ExperienceYears INT DEFAULT 0,
    City VARCHAR(50),
    State VARCHAR(50)
);

-- Create Applications table
CREATE TABLE IF NOT EXISTS Applications (
    ApplicationID INT AUTO_INCREMENT PRIMARY KEY,
    JobID INT NOT NULL,
    ApplicantID INT NOT NULL,
    ApplicationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID) ON DELETE CASCADE,
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID) ON DELETE CASCADE
);

-- Insert Indian companies
INSERT INTO Companies (CompanyName, Location) VALUES
('Hexaware Technologies', 'Mumbai'),
('Infosys', 'Bangalore'),
('TCS', 'Chennai'),
('Wipro', 'Pune'),
('Tech Mahindra', 'Hyderabad'),
('HCL Technologies', 'Noida'),
('LTI Mindtree', 'Mumbai'),
('Mphasis', 'Bangalore'),
('Capgemini', 'Gurgaon'),
('Accenture', 'Pune');

-- Insert job postings 
INSERT INTO Jobs (CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType) VALUES
(1, 'Java Developer', 'Spring Boot development for banking solutions', 'Mumbai', 900000.00, 'Full-time'),
(1, 'Automation Tester', 'Selenium with Java testing framework', 'Mumbai', 750000.00, 'Full-time'),
(2, 'Data Scientist', 'Build ML models for predictive analytics', 'Bangalore', 1200000.00, 'Full-time'),
(3, '.NET Developer', 'ASP.NET Core development', 'Chennai', 850000.00, 'Full-time'),
(4, 'DevOps Engineer', 'AWS, Docker and Kubernetes implementation', 'Pune', 1100000.00, 'Full-time'),
(5, 'SAP Consultant', 'SAP FICO module implementation', 'Hyderabad', 1000000.00, 'Contract'),
(6, 'Python Developer', 'Django and Flask development', 'Noida', 800000.00, 'Full-time'),
(7, 'UI/UX Designer', 'Figma and Adobe XD prototyping', 'Mumbai', 700000.00, 'Full-time'),
(8, 'Business Analyst', 'Requirement gathering and analysis', 'Bangalore', 950000.00, 'Full-time'),
(9, 'Cloud Architect', 'Azure cloud solutions design', 'Gurgaon', 1300000.00, 'Full-time'),
(10, 'HR Recruiter', 'Tech recruitment for IT positions', 'Pune', 600000.00, 'Full-time');

-- Insert applicants
INSERT INTO Applicants (FirstName, LastName, Email, Phone, Resume, ExperienceYears, City, State) VALUES
('Rahul', 'Sharma', 'rahul.sharma@email.com', '9876543210', 'Java developer with 5 years experience', 5, 'Mumbai', 'Maharashtra'),
('Priya', 'Patel', 'priya.patel@email.com', '8765432109', 'Automation tester with 3 years experience', 3, 'Bangalore', 'Karnataka'),
('Amit', 'Singh', 'amit.singh@email.com', '7654321098', 'Data scientist with ML specialization', 4, 'Chennai', 'Tamil Nadu'),
('Neha', 'Gupta', 'neha.gupta@email.com', '6543210987', '.NET developer with 4 years experience', 4, 'Pune', 'Maharashtra'),
('Raj', 'Verma', 'raj.verma@email.com', '9432109876', 'DevOps engineer certified in AWS', 2, 'Hyderabad', 'Telangana'),
('Ananya', 'Joshi', 'ananya.joshi@email.com', '8321098765', 'SAP consultant with FICO experience', 6, 'Noida', 'Uttar Pradesh'),
('Vikram', 'Reddy', 'vikram.reddy@email.com', '7210987654', 'Python developer with Django skills', 3, 'Mumbai', 'Maharashtra'),
('Divya', 'Malhotra', 'divya.malhotra@email.com', '6109876543', 'UI/UX designer with portfolio', 1, 'Bangalore', 'Karnataka'),
('Arjun', 'Kapoor', 'arjun.kapoor@email.com', '5098765432', 'Business analyst with banking domain', 5, 'Gurgaon', 'Haryana'),
('Pooja', 'Mehta', 'pooja.mehta@email.com', '4987654321', 'Cloud architect with Azure certification', 7, 'Pune', 'Maharashtra');

-- Insert applications
INSERT INTO Applications (JobID, ApplicantID, CoverLetter) VALUES
(1, 1, 'Dear Hiring Manager, I am excited to apply for the Java Developer position...'),
(2, 2, 'I have extensive experience in test automation using Selenium...'),
(3, 3, 'My machine learning skills would be valuable for your data science team...'),
(4, 4, 'I have been working with .NET Core for several years...'),
(5, 5, 'My DevOps experience aligns perfectly with your requirements...'),
(6, 6, 'I have implemented SAP FICO for multiple clients...'),
(7, 7, 'I specialize in Python web development using Django...'),
(8, 8, 'Attached is my portfolio of UI/UX design work...'),
(9, 9, 'My business analysis experience includes banking projects...'),
(10, 10, 'I am certified in Azure cloud architecture...');

SHOW TABLES;
SELECT * FROM Companies;
SELECT * FROM Jobs;
SELECT * FROM Applicants;
SELECT * FROM Applications;
