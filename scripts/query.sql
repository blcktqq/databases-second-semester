-- Select all students
SELECT g.name, P.name, P.last_name from [Group] g
LEFT JOIN  StudentsInGroup sg on sg.groupId = g.id
INNER JOIN dbo.Person P on sg.studentId = P.id
