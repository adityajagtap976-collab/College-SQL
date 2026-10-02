select name,
       ascii(name) as first_char_ascii
  from student;


select student_id,
       chr(65) as sample_char
  from student;


select name,
       city,
       concat(
          concat(
             name,
             ' - '
          ),
          city
       ) as student_location
  from student;


select lower(email) as raw_email,
       initcap(city) as formatted_city
  from student;

-- 5. INSTR: Find the character position of the '@' symbol in each email
select email,
       instr(
          email,
          '@'
       ) as at_symbol_position
  from student;

-- 6. LENGTH: Calculate the total length of student names and emails
select name,
       length(name) as name_length,
       email,
       length(email) as email_length
  from student;

-- 7. LOWER: Convert all email addresses to lowercase
select email,
       lower(email) as lower_email
  from student;

-- 8. UPPER: Convert student names and cities to uppercase
select upper(name) as upper_name,
       upper(city) as upper_city
  from student;

-- 9. LPAD: Format student_id with leading zeros to make it a fixed 5-digit string
select student_id,
       lpad(
          student_id,
          5,
          '0'
       ) as formatted_student_id
  from student;

-- 10. RPAD: Append trailing asterisks to student names up to 20 characters
select name,
       rpad(
          name,
          20,
          '*'
       ) as padded_name
  from student;

-- 11. TRIM: Remove leading and trailing whitespace from strings
select trim('   ' from city) as clean_city
  from student;

-- 12. REPLACE: Mask domain names in student emails
select email,
       replace(
          email,
          'gmail.com',
          'university.edu'
       ) as updated_email
  from student;

-- 13. SUBSTR: Extract the first name (characters before space) or first 3 characters of city
select name,
       substr(
          name,
          1,
          instr(
             name,
             ' '
          ) - 1
       ) as first_name,
       substr(
          city,
          1,
          3
       ) as city_code
  from student;

select *
  from student;

-- 13. INNER JOIN: Display students together with their enrolled courses
select s.student_id,
       s.name,
       e.course_name
  from student s
 inner join enrollments e
on s.student_id = e.student_id;

-- 14. LEFT OUTER JOIN: Display all students, including those without a course
select s.student_id,
       s.name,
       e.course_name
  from student s
  left outer join enrollments e
on s.student_id = e.student_id;

-- 15. SUBQUERIES

-- Simple subquery with IN: Find students enrolled in Database Systems
select student_id,
       name,
       sgpa
  from student
 where student_id in (
   select student_id
     from enrollments
    where course_name = 'Database Systems'
);

-- Simple subquery with ALL: Find students whose SGPA is higher than every
-- student enrolled in Data Structure Algorithms Using Python
select student_id,
       name,
       sgpa
  from student
 where sgpa > all (
   select s.sgpa
     from student s
     join enrollments e
   on s.student_id = e.student_id
    where e.course_name = 'Data Structure Algorithms Using Python'
);

-- Simple subquery with EXISTS: Find students who have at least one enrollment
select s.student_id,
       s.name
  from student s
 where exists (
   select 1
     from enrollments e
    where e.student_id = s.student_id
);

-- Nested subquery: Find students with the highest SGPA in the city of the
-- student who has the highest SGPA overall
select student_id,
       name,
       city,
       sgpa
  from student
 where city = (
   select city
     from student
    where sgpa = (
      select max(sgpa)
        from student
   )
)
 order by sgpa desc;

-- Correlated subquery: Find students whose SGPA is above the average SGPA
-- of students enrolled in the same course
select s.student_id,
       s.name,
       e.course_name,
       s.sgpa
  from student s
  join enrollments e
on s.student_id = e.student_id
 where s.sgpa > (
   select avg(same_course.sgpa)
     from student same_course
     join enrollments same_enrollment
   on same_course.student_id = same_enrollment.student_id
    where same_enrollment.course_name = e.course_name
);

select name,
       city
  from student
 where city in (
   select city
     from student
    where city = 'Panvel'
);

select name,
       age
  from student
 where age in (
   select age
     from student
    where age = 18
);

-- 16. VIEWS

-- Create a view without the WITH CHECK OPTION
create or replace view student_contact_v as
   select student_id,
          name,
          city,
          email
     from student;

-- Create a view with the WITH CHECK OPTION
create or replace view high_sgpa_student_v as
   select student_id,
          name,
          sgpa
     from student
    where sgpa >= 3.00
with check option;

-- Select data from the views
select *
  from student_contact_v;

select *
  from high_sgpa_student_v;

-- Drop the views after use
drop view student_contact_v;
drop view high_sgpa_student_v;