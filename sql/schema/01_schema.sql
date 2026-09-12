create table student (
   student_id  number primary key,
   name        varchar2(50 char),
   age         number,
   city        varchar2(20 char),
   email       varchar2(70 char),
   enroll_date date
);

create table enrollments (
   enrollment_id number generated always as identity primary key,
   student_id    number,
   course_name   varchar2(50 char) not null,
   constraint fk_student foreign key ( student_id )
      references student ( student_id )
);