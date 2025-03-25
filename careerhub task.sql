-- 5. Count applications per job (including jobs with no applications)
SELECT j.JobTitle, COUNT(a.ApplicationID) AS ApplicationCount
FROM Jobs j
LEFT JOIN Applications a 
ON j.JobID = a.JobID
GROUP BY j.JobID, j.JobTitle
ORDER BY ApplicationCount DESC;

-- 6. Jobs within a specified salary range (parameterized)
SET @min_salary = 800000;
SET @max_salary = 1100000;

SELECT j.JobTitle, c.CompanyName, j.JobLocation, j.Salary
FROM Jobs j
JOIN Companies c 
ON j.CompanyID = c.CompanyID
WHERE j.Salary BETWEEN @min_salary AND @max_salary
ORDER BY j.Salary DESC;

-- 7. Job application history for a specific applicant
SET @applicant_id = 1;

SELECT j.JobTitle, c.CompanyName, a.ApplicationDate
FROM Applications a
JOIN Jobs j 
ON a.JobID = j.JobID
JOIN Companies c 
ON j.CompanyID = c.CompanyID
WHERE a.ApplicantID = @applicant_id
ORDER BY a.ApplicationDate DESC;

-- 8. Average salary (excluding zero)
SELECT ROUND(AVG(Salary), 2) AS AverageSalary
FROM Jobs
WHERE Salary > 0;

-- 9. Company with most job postings (handles ties)
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

-- 10. Applicants in 'Mumbai' with 3+ years experience
SET @city = 'Mumbai';

SELECT a.FirstName, a.LastName, a.Email, a.ExperienceYears
FROM Applicants a
JOIN Applications app ON a.ApplicantID = app.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
WHERE c.Location = @city AND a.ExperienceYears >= 3;

-- 11. Find job titles in salary range
SELECT DISTINCT JobTitle
FROM Jobs
WHERE Salary BETWEEN 600000 AND 800000;

-- 12. Find jobs with no applications
SELECT j.JobTitle, c.CompanyName
FROM Jobs j
JOIN Companies c ON j.CompanyID = c.CompanyID
LEFT JOIN Applications a ON j.JobID = a.JobID
WHERE a.ApplicationID IS NULL;

-- 13. Show all applicants and their applications
SELECT CONCAT(a.FirstName, ' ', a.LastName) AS ApplicantName, c.CompanyName, j.JobTitle
FROM Applicants a
JOIN Applications app ON a.ApplicantID = app.ApplicantID
JOIN Jobs j ON app.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
ORDER BY ApplicantName;

-- 14. Count jobs per company
SELECT c.CompanyName, COUNT(j.JobID) AS NumberOfJobs
FROM Companies c
LEFT JOIN Jobs j ON c.CompanyID = j.CompanyID
GROUP BY c.CompanyName
ORDER BY NumberOfJobs DESC;

-- 15. Show all applicants (even without applications)
SELECT CONCAT(a.FirstName, ' ', a.LastName) AS ApplicantName, c.CompanyName, j.JobTitle
FROM Applicants a
LEFT JOIN Applications app ON a.ApplicantID = app.ApplicantID
LEFT JOIN Jobs j ON app.JobID = j.JobID
LEFT JOIN Companies c ON j.CompanyID = c.CompanyID
ORDER BY ApplicantName;

-- 16. Companies paying above average
SELECT DISTINCT c.CompanyName
FROM Companies c
JOIN Jobs j ON c.CompanyID = j.CompanyID
WHERE j.Salary > (SELECT AVG(Salary) FROM Jobs WHERE Salary > 0);

-- 17. Applicant locations
SELECT 
    CONCAT(FirstName, ' ', LastName) AS ApplicantName,
    CONCAT(City, ', ', State) AS Location
FROM Applicants;

-- 18 Find Developer/Engineer jobs
SELECT JobTitle, CompanyID
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

-- 19 Complete application overview
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

-- 20 Match applicants to companies by city
SET @city = 'Chennai';

SELECT 
    CONCAT(a.FirstName, ' ', a.LastName) AS ApplicantName,
    c.CompanyName,
    a.ExperienceYears
FROM Applicants a
CROSS JOIN Companies c
WHERE c.Location = @city AND a.ExperienceYears > 2;