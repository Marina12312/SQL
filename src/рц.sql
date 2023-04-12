skypro=# SELECT * FROM employree;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 |  Petr      | Pypkin    | men    |  30
  3 | Katerina   | Vylina    | women  |  20

    skypro=# INSERT INTO employree(
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Marina', 'Mimkina', 'women', 26),
skypro-# ('Petr', 'Petrov', 'men',30),
skypro-# ('Katya','Virova','women',40);
INSERT 0 3

skypro=# ALTER TABLE employree
skypro-# RENAME COLUMN first_name TO имя;
skypro=# ALTER TABLE employree
skypro-# RENAME COLUMN last_name TO фамилия;

skypro=# SELECT * FROM employree
skypro-# WHERE age<30 OR age>50;
 id |   имя    | фамилия | gender | age
----+----------+---------+--------+-----
  3 | Katerina | Vylina  | women  |  20
  4 | Marina   | Mimkina | women  |  26

 skypro=#  SELECT * FROM employree
skypro-#  WHERE age>30 AND age<50;
 id |  имя  | фамилия | gender | age
----+-------+---------+--------+-----
  6 | Katya | Virova  | women  |  40

skypro=# SELECT фамилия
skypro-# FROM employree
skypro-# ORDER BY фамилия DESC;
 фамилия
---------
 Vylina
 Virova
 Pypkin
 Petrov

 skypro=# SELECT * FROM employree
skypro-# WHERE имя LIKE '%____%';
 id |   имя    | фамилия | gender | age
----+----------+---------+--------+-----
  2 |  Petr    | Pypkin  | men    |  30
  3 | Katerina | Vylina  | women  |  20
  4 | Marina   | Mimkina | women  |  26
  5 | Petr     | Petrov  | men    |  30
  6 | Katya    | Virova  | women  |  40

UPDATE SET имя='' WHERE id=1;
UPDATE SET имя='' WHERE id=1;

skypro=# SELECT имя,
skypro-# SUM(age) AS сумарный_возраст
skypro-# FROM employree GROUP BY имя;
   имя    | сумарный_возраст
----------+------------------
  Petr    |               30
 Petr     |               30
 Katerina |               20
 Marina   |               26
 Katya    |               40

skypro=# SELECT имя,
skypro-# age FROM employree WHERE age=( SELECT MIN(age) FROM employree);
   имя    | age
----------+-----
 Katerina |  20

skypro=# SELECT имя,
skypro-# age FROM employree WHERE age IN(SELECT MAX(age) FROM employree GROUP BY имя HAVING COUNT(имя)>1)
skypro-# ORDER BY 2;

skypro=# SELECT имя, MAX(age) FROM employree
skypro-# GROUP BY имя HAVING count(*) > 1
skypro-# ORDER BY MAX(age);