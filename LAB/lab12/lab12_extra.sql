.read lab12.sql

CREATE TABLE sp16favnum AS
  select number, count(*) as count from sp16students group by number order by desc limit 1;


CREATE TABLE sp16favpets AS
  select pet, count(*) as count from sp16students group by pet order by desc limit 10;


CREATE TABLE fa16favpets AS
  select "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE fa16dragon AS
  select pet, count(*) from students where pet = 'dragon';


CREATE TABLE fa16alldragons AS
  select "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE obedienceimage AS
  select "REPLACE THIS LINE WITH YOUR SOLUTION";

CREATE TABLE smallest_int_count AS
  select "REPLACE THIS LINE WITH YOUR SOLUTION";
