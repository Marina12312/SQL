skypro=# CREATE TABLE employree (
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# first_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
skypro=# INSERT INTO employree(
skypro(# first_name,last_name,gender,age)
skypro-# VALUES( '  Marina', 'Mimkina',' women',25);
INSERT 0 1
skypro=# INSERT INTO employree(
skypro(# first_name,last_name,gender,age)
skypro-# VALUES( ' Petr', 'Pypkin','men',30);
INSERT 0 1
skypro=# INSERT INTO employree(
skypro(# first_name,last_name,gender,age)
skypro-# VALUES ('Katerina','Vylina', 'women', 20);
INSERT 0 1
    skypro=# SELECT * FROM employree;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Marina     | Mimkina   |  women |  25
  2 |  Petr      | Pypkin    | men    |  30
  3 | Katerina   | Vylina    | women  |  20

    skypro=# UPDATE employree SET first_name = 'Katya', last_name = 'Petinskay', gender = 'women',age = 21 WHERE id=1;
UPDATE 1
    skypro=# SELECT * FROM employree;

    skypro=# DELETE FROM employree WHERE id = 1;
DELETE 1
skypro=#  SELECT * FROM employree;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  2 |  Petr      | Pypkin    | men    |  30
  3 | Katerina   | Vylina    | women  |  20

