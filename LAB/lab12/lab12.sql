.read sp16data.sql
.read fa16data.sql

CREATE TABLE obedience AS
  select seven, denero from students;

CREATE TABLE smallest_int AS
  select time, smallest from students where smallest > 8 order by smallest limit 20;

CREATE TABLE greatstudents AS
  select f.date, f.number, f.pet, f.color, s.color from students as f, sp16students as s
    where f.date = s.date and f.number = s.number and f.pet = s.pet;

CREATE TABLE sevens AS
  select s.seven from students as s, checkboxes as c
    where s.time = c.time and s.number = 7 and c."7" = "True";

CREATE TABLE matchmaker AS
  select a.pet, a.song, a.color, b.color from students as a, students as b
    where a.pet = b.pet and a.song = b.song and a.time < b.time;
