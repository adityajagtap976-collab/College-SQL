insert into enrollments (
   student_id,
   course_name
) values
   ( 1,
     'Database Systems' );
insert into enrollments (
   student_id,
   course_name
) values
   ( 2,
     'Data Structure Algorithms Using Python' );
insert into enrollments (
   student_id,
   course_name
) values
   ( 3,
     'Database Systems' );
insert into enrollments (
   student_id,
   course_name
) values
   ( 4,
     'E-Commerce' );
insert into enrollments (
   student_id,
   course_name
) values
   ( 5,
     'E-Commerce' );
insert into enrollments (
   student_id,
   course_name
) values
   ( 6,
     'Data Structure Algorithms Using Python' );
insert into enrollments (
   student_id,
   course_name
) values
   ( 7,
     'Technical Writing' );

select course_name,
       count(student_id) as total_enrolled
  from enrollments
 group by course_name;

select course_name,
       count(student_id) as total_enrolled
  from enrollments
 group by course_name
having count(student_id) > 1;

select e.course_name,
       count(s.student_id) as total_students,
       sum(s.sgpa) as total_sgpa,
       round(
          avg(s.sgpa),
          2
       ) as average_sgpa,
       min(s.sgpa) as lowest_sgpa,
       max(s.sgpa) as highest_sgpa
  from enrollments e
  join student s
on e.student_id = s.student_id
 group by e.course_name
having count(s.student_id) >= 2;

select e.course_name,
       count(s.student_id) as passing_student_count,
       round(
          avg(s.sgpa),
          2
       ) as avg_passing_sgpa
  from enrollments e
  join student s
on e.student_id = s.student_id
 where s.sgpa > 2.0
 group by e.course_name
having count(s.student_id) >= 2;