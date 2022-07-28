-- Exercício 1

SELECT COUNT(experiences."endDate") 
AS "currentExperinces" 
FROM experiences;

-- Exercício 2

SELECT educations."userId" AS "id",
COUNT(educations."userId") AS "educations" 
FROM educations 
GROUP BY educations."userId";

-- Exercício 3

SELECT users.name AS writer,
COUNT(testimonials."writerId") as "testimonialCount"
FROM testimonials
JOIN users
ON testimonials."writerId" = users.id
GROUP BY users.name
ORDER BY "testimonialCount" DESC;

-- Exercício 4

SELECT MAX(jobs.salary) AS "maximumSalary",
roles.name AS "role"
FROM jobs
JOIN roles
ON roles.id = jobs."roleId"
WHERE jobs.active = true
GROUP BY "role"
ORDER BY "maximumSalary" ASC;


-- Bonus

SELECT schools.name AS school,
courses.name AS course,
COUNT(educations."userId") AS "studentsCount",
educations.status AS "role"
FROM educations
JOIN schools
ON schools.id = educations."schoolId"
JOIN courses
ON courses.id = educations."courseId"
WHERE educations.status = 'ongoing' OR educations.status = 'finished'
GROUP BY educations."userId", educations.status, schools.name, courses.name
ORDER BY "studentsCount"
LIMIT 3

