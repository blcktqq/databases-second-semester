-- Select all students
SELECT g.name, P.name, P.last_name from [Group] g
LEFT OUTER JOIN  StudentsInGroup sg on sg.groupId = g.id
INNER JOIN dbo.Person P on sg.studentId = P.id


-- Script 1
SELECT * from [Group] g
LEFT JOIN StudentsInGroup sg on sg.groupId = g.id;


-- Script 2

SELECT * from [Group] g
LEFT JOIN StudentsInGroup sg on sg.groupId = g.id
WHERE sg.studentId is NULL;

-- Script 2.1
-- Знайти групи без студентів
SELECT * from [Group] g
FULL OUTER JOIN StudentsInGroup sg on sg.groupId = g.id
WHERE sg.studentId is NULL;


SELECT * from [Group] g
RIGHT JOIN StudentsInGroup sg on sg.groupId = g.id

SELECT * from [Group] g
LEFT JOIN StudentsInGroup sg on sg.groupId = g.id
WHERE sg.studentId is NOT NULL;
-- Script 3
-- Знайти людей які не належать жодній групі

SELECT * from [StudentsInGroup] sg
RIGHT JOIN Person p on sg.groupId = p.id
where sg.groupId is null


SELECT p.*, sg.* from [StudentsInGroup] sg
RIGHT JOIN Person p on sg.studentId = p.id;


SELECT p.*, sg.* from [Person] p
LEFT JOIN [StudentsInGroup] sg on sg.studentId = p.id;


-- Script 4
-- Поверне все перетини
SELECT * from [Group] g
LEFT JOIN StudentsInGroup sg on sg.groupId = g.id
FULL OUTER JOIN dbo.Person P on sg.studentId = P.id

-- Поверне все групи без студентів АБО людей які не є студентами
SELECT * from [Group] g
LEFT JOIN StudentsInGroup sg on sg.groupId = g.id
FULL OUTER JOIN dbo.Person P on sg.studentId = P.id
where P.id is null or g.id is null



Select * from StudentsInGroup sg
FULL OUTER JOIN dbo.Person P on P.id = sg.studentId




Select * from StudentsInGroup sg
LEFT JOIN dbo.Person P on P.id = sg.studentId


-- Script 5
-- Outer join
SELECT g.name, P.name, P.last_name from [Group] g
LEFT OUTER JOIN  StudentsInGroup sg on sg.groupId = g.id
INNER JOIN dbo.Person P on sg.studentId = P.id
where p.name = 'Amery'




--- Script 6
SELECT g.name from [Group] g
LEFT OUTER JOIN  StudentsInGroup sg on sg.groupId = g.id
where studentId IN (SELECT id from Person where name like 'Amery')


SELECT g.name from [Group] g
where id in (SELECT sg.groupId from [StudentsInGroup] sg
LEFT JOIN dbo.Person P on sg.studentId = P.id
where P.name like 'A%')


--- Script

SELECT g.name, count(SIG.studentId) as count from [Group] g
JOIN dbo.StudentsInGroup SIG on g.id = SIG.groupId
GROUP BY g.name
HAVING count(SIG.studentId) > 6
