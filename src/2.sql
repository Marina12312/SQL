CREATE TABLE
skypro=# CREATE TABLE city(
skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,,
skypro(# city_name VARCHAR(50) NOT NULL
    skypro(# );
    CREATE TABLE
2.
skypro=# ALTER TABLE employee
skypro-# ADD city_id INT;
    ALTER TABLE
 3.
 skypro=# ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city(city_id);
    ALTER TABLE
    skypro=# UPDATE employee SET city_id = 1 WHERE id = 2;
    UPDATE 1
    skypro=# UPDATE employee SET city_id = 2 WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employee SET city_id = 3 WHERE id = 6;
    UPDATE 1
    skypro=# UPDATE employee SET city_id = 4 WHERE id = 7;
    UPDATE 1
    skypro=# UPDATE employee SET city_id = 5 WHERE id = 8;
    UPDATE 1
    skypro=# SELECT * FROM employee;
    id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
    2 | Peter      | Pupkin    | Man    |  20 |       1
    3 | Karina     | Probkina  | women  |  20 |       2
    6 | Marina     | Mimkina   | women  |  26 |       3
    7 | Petr       | Petrov    | men    |  30 |       4
    8 | Katya      | Virova    | women  |  40 |       5
4.
skypro=# INSERT INTO city(
skypro(# city_id, city_name)
skypro-# VALUES (1,'Москва'),
skypro-# (2,'Симферополь'),
skypro-# (3,'Ялта'),
skypro-# (4,'Сочи'),
skypro-# (5,'Краснодар');

 5.
    skypro=# SELECT first_name, last_name, city_name
    skypro-# FROM employee
    skypro-# INNER JOIN city
    skypro-# ON employee.city_id=city.city_id;
    first_name | last_name |  city_name
------------+-----------+-------------
    Peter      | Pupkin    | Москва
    Karina     | Probkina  | Симферополь
    Marina     | Mimkina   | Ялта
    Petr       | Petrov    | Сочи
    Katya      | Virova    | Краснодар

6.
    skypro=# SELECT city_name, first_name, last_name
    skypro-# FROM employee
    skypro-# FULL JOIN city
    skypro-# ON employee.city_id=city.city_id;
    city_name  | first_name | last_name
-------------+------------+-----------
    Москва      | Peter      | Pupkin
    Симферополь | Karina     | Probkina
    Ялта        | Marina     | Mimkina
    Сочи        | Petr       | Petrov
    Краснодар   | Katya      | Virova

7.
    skypro=# SELECT first_name, city_name
    skypro-# FROM employee FULL OUTER JOIN city
    skypro-# ON employee.city_id = city.city_id
    skypro-# ORDER BY first_name;
    first_name |  city_name
------------+-------------
    Karina     | Симферополь
    Katya      | Краснодар
    Marina     | Ялта
    Peter      | Москва
    Petr       | Сочи
8.
    skypro=# SELECT first_name, city_name
    skypro-# FROM employee
    skypro-# CROSS JOIN city;
    first_name |  city_name
------------+-------------
    Peter      | Москва
    Karina     | Москва
    Marina     | Москва
    Petr       | Москва
    Katya      | Москва
    Peter      | Симферополь
    Karina     | Симферополь
    Marina     | Симферополь
    Petr       | Симферополь
    Katya      | Симферополь
    Peter      | Ялта
    Karina     | Ялта
    Marina     | Ялта
    Petr       | Ялта
    Katya      | Ялта
    Peter      | Сочи
    Karina     | Сочи
    Marina     | Сочи
    Petr       | Сочи
    Katya      | Сочи
    Peter      | Краснодар
    Karina     | Краснодар
    Marina     | Краснодар
    Petr       | Краснодар
    Katya      | Краснодар

9.
    skypro=# SELECT city.city_name
    skypro-# FROM city
    skypro-# LEFT JOIN employee
    skypro-# ON city.city_id = employee.city_id
    skypro-# WHERE employee.first_name is NULL;


