--1. Output all fields and all rows.
select * from students;
-- 2. Output all students in the table.
select name from students;
-- 3. Output only Id users.
select id from students;
-- 4. Output only users name.
select name from students;
-- 5. Output only students' email.
select email from students;
-- 6. Output student names and emails. 
select name, email from students;
-- 7. Output students id, name, email and creation date.
select id, name, email, created_on from students;
-- 8. Output users with password 12333.
select name, password from students
where password = '12333';
-- 9. Output the users that were created 2021-03-26 00:00:00.
select name, created_on from students
where created_on = '2021-03-26 00:00:00';
-- 10. Output the users which have the word Anna in their name.
select name from students
where name LIKE 'Anna%';
-- 11. Output the user names with 8 at the end.
select name from students
where name LIKE '%8';
-- 12. Output users with the letter "a" in their name.
select name from students
where name LIKE '%a%';
-- 13. Output users who were created 2021-07-12 00:00:00.
select name, created_on from students
where created_on = '2021-07-12 00:00:00';
-- 14. Output the users that were created 2021-07-12 00:00:00 and have the password 1m313.
select name, password, created_on from students
where created_on = '2021-07-12 00:00:00'and password = '1m313';
-- 15. Output users who were created 2021-07-12 00:00:00 who have the word Andrey in their name.
select name, created_on from students
where created_on = '2021-07-12 00:00:00' and name like '%Andrey%';
-- 16. Output the users that were created 2021-07-12 00:00:00 and have the number 8 in their name.
select name, created_on from students
where created_on = '2021-07-12 00:00:00' and name like '%8%' or name like '%8';
-- 17. Output the users whose id is 10.
select name from students
where id = 10;
-- 18. Output the user whose id is 53.
select id, name from students
where id = 53;
-- 19. Output users who have an id greater than 40.
select id, name from students
where id > 40;
-- 20. Output users which id is less than 30.
select id, name from students
where id < 30;
-- 21. Output users who have id less than 27 or more than 88.
select id, name from students
where id < 27 OR id > 88;
-- 22. Output users which id is less or equal 37.
select id, name from students
where id <= 37;
-- 23. Output users which id is higher or equal to 37.
select id, name from students
where id >= 37;
-- 24. Output students which id is more than 80 but less than 90.
select id, name from students
where id > 80 and id < 90;
-- 25. Output the student which id is between 80 and 90.
select id, name from students
where id between 80 and 90;
-- 26.Output students with password equal to 12333, 1m313, 123313.
select id, name, password from students
where password like '12333' or password like '1m313' or password like '123313';
-- 27. Output students where created_on is equal to 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00.
select id, name, created_on from students
where created_on = '2020-10-03 00:00:00' or password = '2021-05-19 00:00:00' or password = '2021-03-26 00:00:00';
-- 28. Output the minimum id.
select MIN(id) as min_id from students;
-- 29. Output the maximum id.
select max(id) as max_id from students;
-- 30. Output number of students.
select COUNT(id) as amount from students;
-- 31. Output student id, name, user creation date. Sort in ascending order of student adding date.
select id, name, created_on from students
order by created_on ASC;
-- 32. Output student id, name, user creation date. Sort in descending order of the date the student was added.
select id, name, created_on from students
order by created_on desc;