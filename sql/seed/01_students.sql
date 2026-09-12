insert into student (
   student_id,
   name,
   age,
   city,
   email,
   enroll_date
) values
   ( 1,
     'Aditya Jagtap',
     18,
     'Panvel',
     'adityaexample@gmail.com',
     date '2025-09-16' );
insert into student (
   student_id,
   name,
   age,
   city,
   email,
   enroll_date
) values
   ( 2,
     'Mainak Koley',
     18,
     'Dombivali',
     'mainakexample@gmail.com',
     date '2025-07-28' );
insert into student (
   student_id,
   name,
   age,
   city,
   email,
   enroll_date
) values
   ( 3,
     'Rishon Mathai',
     18,
     'Kalyan',
     'Rishonexample@gmail.com',
     date '2025-12-31' );
insert into student (
   student_id,
   name,
   age,
   city,
   email,
   enroll_date
) values
   ( 4,
     'Omkar Mane',
     18,
     'Mansarover',
     'omkarexample@gmail.com',
     date '2025-03-05' );
insert into student (
   student_id,
   name,
   age,
   city,
   email,
   enroll_date
) values
   ( 5,
     'Parikshit Pandey',
     18,
     'Thane',
     'parikshitexample@gmail.com',
     date '2025-06-17' );
insert into student (
   student_id,
   name,
   age,
   city,
   email,
   enroll_date
) values
   ( 6,
     'Manthan Maurya',
     18,
     'Kalamboli',
     'manthanexample@gmail.com',
     date '2025-02-14' );
insert into student (
   student_id,
   name,
   age,
   city,
   email,
   enroll_date
) values
   ( 7,
     'Laxman Choudhary',
     18,
     'Vashi',
     'laxmanexample@gmail.com',
     date '2025-05-06' );

alter table student add sgpa number(3,2);

update student
   set
   sgpa =
      case student_id
         when 1 then
            3.90
         when 2 then
            3.16
         when 3 then
            2.15
         when 4 then
            3.25
         when 5 then
            3.54
         when 6 then
            2.64
         when 7 then
            1.68
      end
 where student_id in ( 1,
                       2,
                       3,
                       4,
                       5,
                       6,
                       7 );
select count(*) as total_students,
       avg(sgpa) as average_sgpa,
       min(sgpa) as lowest_sgpa,
       max(sgpa) as highest_sgpa
  from student;