create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

create table dogs as
  select "abraham" as name, "long" as fur, 26 as height union
  select "barack"         , "short"      , 52           union
  select "clinton"        , "long"       , 47           union
  select "delano"         , "long"       , 46           union
  select "eisenhower"     , "short"      , 35           union
  select "fillmore"       , "curly"      , 32           union
  select "grover"         , "short"      , 28           union
  select "herbert"        , "curly"      , 31;

create table sizes as
  select "toy" as size, 24 as min, 28 as max union
  select "mini",        28,        35        union
  select "medium",      35,        45        union
  select "standard",    45,        60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
create table size_of_dogs as
  select d.name as name, s.size as size from dogs as d, sizes as s
    where s.min < d.height and d.height <= s.max;

-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
  with
    gene(child, parents, height) as (
    select p.child, d.name, d.height from dogs as d, parents as p
      where d.name = p.parent
    )
  select child from gene order by gene.height DESC;

-- Sentences about siblings that are the same size
create table sentences as
  with
    chart(name, parent, size) as (
      select p.child, p.parent, s.size from dogs as d, parents as p, size_of_dogs as s
        where d.name = p.child and d.name = s.name order by s.size
    )
  select s1.name || " and " || s2.name || " are " || s1.size || " siblings"
    from chart as s1, chart as s2
      where s1.name < s2.name and s1.parent = s2.parent and s1.size = s2.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
  with
    chart(num, total, height, name) as (
      select 1, d.height, d.height, d.name from dogs as d union
      select c.num + 1, c.total + d.height, d.height, c.name || ", " || d.name
       from chart as c, dogs as d
        where c.height < d.height
    )
  select c.name, c.total from chart as c where c.num = 4 and c.total > 170 order by c.total;

-- non_parents is an optional, but recommended question
-- All non-parent relations ordered by height difference
create table non_parents as
  select "REPLACE THIS LINE WITH YOUR SOLUTION";

create table ints as
    with i(n) as (
        select 1 union
        select n+1 from i limit 100
    )
    select n from i;

create table divisors as
  with chart(x, y, z) as (
    select a.n, b.n, a.n * b.n from ints as a, ints as b where a.n * b.n <= 100
  )
  select c.z as n, count(*) as k from chart as c group by c.z
;

create table primes as
    select n from divisors where k = 2
    ;
