Name: Keerthika Nagarajan

Superset ID: 5370583

College: Saveetha Engineering College

<div align="center">

# Centered Heading

</div>

## Task 1-4: Database initialization with error handling
```mysql
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
```
## Tables:
### Companies:
<img width="231" alt="image" src="https://github.com/user-attachments/assets/e2c22565-1eed-4812-926b-536a76fe1c62" />

### Jobs:
<img width="611" alt="image" src="https://github.com/user-attachments/assets/42f3d7fb-9eed-48c8-8a54-32246ad7730b" />

### Applicants:
<img width="700" alt="image" src="https://github.com/user-attachments/assets/f08abb37-36ab-454f-a44e-3d29f3e5bbd5" />

### Applications:
<img width="452" alt="image" src="https://github.com/user-attachments/assets/83e7ea36-1258-4a4e-bfd0-d72145380169" />

## Task 5-20: 
### 5. Count applications per job (including jobs with no applications)
```mysql
SELECT j.JobTitle, COUNT(a.ApplicationID) AS ApplicationCount
FROM Jobs j
LEFT JOIN Applications a 
ON j.JobID = a.JobID
GROUP BY j.JobID, j.JobTitle
ORDER BY ApplicationCount DESC;
```
<img width="177" alt="image" src="https://github.com/user-attachments/assets/4c326b72-bf59-432c-ad83-621416d19023" />

### 6. Jobs within a specified salary range (parameterized)
```mysql
SET @min_salary = 800000;
SET @max_salary = 1100000;

SELECT j.JobTitle, c.CompanyName, j.JobLocation, j.Salary
FROM Jobs j
JOIN Companies c 
ON j.CompanyID = c.CompanyID
WHERE j.Salary BETWEEN @min_salary AND @max_salary
ORDER BY j.Salary DESC;
```
<img width="308" alt="image" src="https://github.com/user-attachments/assets/cdb5d43d-b014-4abe-b44e-a3dc6d0952a5" />

### 7. Job application history for a specific applicant
```mysql
SET @applicant_id = 1;

SELECT j.JobTitle, c.CompanyName, a.ApplicationDate
FROM Applications a
JOIN Jobs j 
ON a.JobID = j.JobID
JOIN Companies c 
ON j.CompanyID = c.CompanyID
WHERE a.ApplicantID = @applicant_id
ORDER BY a.ApplicationDate DESC;
```
<img width="284" alt="image" src="https://github.com/user-attachments/assets/854c4c53-4734-41b7-80f3-b31972426da8" />


### 8. Average salary (excluding zero)
```mysql
SELECT ROUND(AVG(Salary), 2) AS AverageSalary
FROM Jobs
WHERE Salary > 0;
```
<img width="94" alt="image" src="https://github.com/user-attachments/assets/beb07a3a-875d-48c6-9f55-ce74ea6bb9e1" />


### 9. Company with most job postings (handles ties)
```mysql
SELECT c.CompanyName, COUNT(j.JobID) AS JobCount
FROM Companies c
JOIN Jobs j ON c.CompanyID = j.CompanyID
GROUP BY c.CompanyID, c.CompanyName
HAVING COUNT(j.JobID) = (
    SELECT COUNT(JobID) 
    FROM Jobs 
    GROUP BY CompanyID 
    ORDER BY COUNT(JobID) DESC 
    LIMIT 1
);
```
<img width="167" alt="image" src="https://github.com/user-attachments/assets/d9145e6f-bebc-4419-b971-1afc45a10258" />


### 10. Applicants in 'Mumbai' with 3+ years experience
```mysql
SET @city = 'Mumbai';

SELECT a.FirstName, a.LastName, a.Email, a.ExperienceYears
FROM Applicants a
JOIN Applications app ON a.ApplicantID = app.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE c.Location = @city AND a.ExperienceYears >= 3;
```
<img width="298" alt="image" src="https://github.com/user-attachments/assets/08b72677-2d9a-4f05-abc8-bc330a64f94e" />


### 11. Find job titles in salary range
```mysql
SELECT DISTINCT JobTitle
FROM Jobs
WHERE Salary BETWEEN 600000 AND 800000;
```
<img width="102" alt="image" src="https://github.com/user-attachments/assets/c2435363-0e5e-4c44-a2f9-d4e78ce7dacc" />


### 12. Find jobs with no applications
```mysql
SELECT j.JobTitle, c.CompanyName
FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
LEFT JOIN Applications a ON j.JobID = a.JobID
WHERE a.ApplicationID IS NULL;
```
<img width="148" alt="image" src="https://github.com/user-attachments/assets/ae61ebfc-62f2-4c83-a5f3-a95a8746877e" />


### 13. Show all applicants and their applications
```mysql
SELECT CONCAT(a.FirstName, ' ', a.LastName) AS ApplicantName, c.CompanyName, j.JobTitle
FROM Applicants a
JOIN Applications app ON a.ApplicantID = app.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
ORDER BY ApplicantName;
```
<img width="266" alt="image" src="https://github.com/user-attachments/assets/50c5a0fa-56b9-4ac4-9a4f-1b298078c281" />


### 14. Count jobs per company
```mysql
SELECT c.CompanyName, COUNT(j.JobID) AS NumberOfJobs
FROM Companies c
LEFT JOIN Jobs j ON c.CompanyID = j.CompanyID
GROUP BY c.CompanyName
ORDER BY NumberOfJobs DESC;
```
<img width="187" alt="image" src="https://github.com/user-attachments/assets/760fe17c-6d52-4b6b-a9b6-65c842fe3ae5" />


### 15. Show all applicants (even without applications)
```mysql
SELECT CONCAT(a.FirstName, ' ', a.LastName) AS ApplicantName, c.CompanyName, j.JobTitle
FROM Applicants a
LEFT JOIN Applications app ON a.ApplicantID = app.ApplicantID
LEFT JOIN Jobs j ON app.JobID = j.JobID
LEFT JOIN Companies c ON j.CompanyID = c.CompanyID
ORDER BY ApplicantName;
```
<img width="269" alt="image" src="https://github.com/user-attachments/assets/64e45658-87d5-4a02-8b3b-a9c7c02714cf" />


### 16. Companies paying above average
```mysql
SELECT DISTINCT c.CompanyName
FROM Companies c
JOIN Jobs j ON c.CompanyID = j.CompanyID
WHERE j.Salary > (SELECT AVG(Salary) FROM Jobs WHERE Salary > 0);
```
<img width="89" alt="image" src="https://github.com/user-attachments/assets/33e197c1-05b0-4e68-af54-ce586001fdeb" />


### 17. Applicant locations
```mysql
SELECT 
    CONCAT(FirstName, ' ', LastName) AS ApplicantName,
    CONCAT(City, ', ', State) AS Location
FROM Applicants;
```
<img width="186" alt="image" src="https://github.com/user-attachments/assets/0cfe7bf0-537b-4709-a781-b96987f1488a" />


### 18. Find Developer/Engineer jobs
```mysql
SELECT JobTitle, CompanyID
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';
```
<img width="157" alt="image" src="https://github.com/user-attachments/assets/f08434f9-675a-42f8-a02a-1ec212c03b13" />


### 19. Complete application overview
```mysql
(SELECT 
    CONCAT(a.FirstName, ' ', a.LastName) AS ApplicantName,
    j.JobTitle,
    c.CompanyName
FROM Applicants a
LEFT JOIN Applications app ON a.ApplicantID = app.ApplicantID
LEFT JOIN Jobs j ON app.JobID = j.JobID
LEFT JOIN Companies c ON j.CompanyID = c.CompanyID)
UNION
(SELECT 
    NULL AS ApplicantName,
    j.JobTitle,
    c.CompanyName
FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
LEFT JOIN Applications app ON j.JobID = app.JobID
WHERE app.ApplicationID IS NULL)
ORDER BY ApplicantName;
```
<img width="269" alt="image" src="https://github.com/user-attachments/assets/ab5e92e8-3ec5-4595-af67-aa9b33734e4b" />


### 20. Match applicants to companies by city
```mysql
SET @city = 'Chennai';

SELECT 
    CONCAT(a.FirstName, ' ', a.LastName) AS ApplicantName,
    c.CompanyName,
    a.ExperienceYears
FROM Applicants a
CROSS JOIN Companies c
WHERE c.Location = @city AND a.ExperienceYears > 2;
```
<img width="230" alt="image" src="https://github.com/user-attachments/assets/5443c752-4cec-483d-9009-087e4488280a" />
