#-----------------------------------------------------------------------------------------------------
lyhyt:

1. CREATE TABLE owner (first_name varchar(255), last_name varchar(255), address varchar(255), ownerID int PRIMARY KEY AUTO_INCREMENT);

2. ALTER TABLE pet DROP COLUMN owner;
   ALTER TABLE pet ADD COLUMN petID INT PRIMARY KEY AUTO_INCREMENT; 
   ALTER TABLE pet ADD COLUMN ownerID INT;
   ALTER TABLE pet ADD CONSTRAINT FOREIGN KEY(ownerID) REFERENCES owner(ownerID)

3.INSERT INTO owner (first_name, last_name, address, ownerID) VALUES
    ('Harold', "Lloyd", "address1", NULL),
    ('Gwen', "Stefani", "address2", NULL),
    ('Benny', "Hill", "address3",  NULL),
    ('Diane', "Keaton", "address4", NULL);

4. UPDATE pet SET ownerID=1 WHERE name='Buffy' OR name="Fluffy";
   UPDATE pet SET ownerID=2 WHERE name='Claws' OR name="Chirpy" OR name="Whistler";
   UPDATE pet SET ownerID=3 WHERE name='Fang' OR name="Slim";
   UPDATE pet SET ownerID=4 WHERE name='Bowser';

#-----------------------------------------------------------------------------------------------------


Pitkä:

1. Alkuperäinen pet taulu:

    SELECT * FROM pet;

+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | NULL       |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | NULL       |
| Buffy    | Harold | dog     | f    | 1989-05-13 | NULL       |
| Fang     | Benny  | dog     | m    | 1990-08-27 | NULL       |
| Bowser   | Diane  | dog     | m    | 1998-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | 2000-09-15 |
| Whistler | Gwen   | bird    | NULL | 1997-12-09 | NULL       |
| Slim     | Benny  | snake   | m    | 1996-04-29 | NULL       |
+----------+--------+---------+------+------------+------------+


2. Luodaan owner

    CREATE TABLE owner (first_name varchar(255), last_name varchar(255), address varchar(255), ownerID int PRIMARY KEY AUTO_INCREMENT);

    DESCRIBE owner;
    
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| first_name | varchar(255) | YES  |     | NULL    |                |
| last_name  | varchar(255) | YES  |     | NULL    |                |
| address    | varchar(255) | YES  |     | NULL    |                |
| ownerID    | int(11)      | NO   | PRI | NULL    | auto_increment |
+------------+--------------+------+-----+---------+----------------


3. Muutetaan alkuperäistä pet taulua

    ALTER TABLE pet DROP COLUMN owner;
    ALTER TABLE pet ADD COLUMN petID INT PRIMARY KEY AUTO_INCREMENT;
    ALTER TABLE pet ADD COLUMN ownerID INT;
    ALTER TABLE pet ADD CONSTRAINT FOREIGN KEY(ownerID) REFERENCES owner(ownerID)
    
    DESCRIBE pet;

+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| name    | varchar(20) | YES  |     | NULL    |                |
| species | varchar(20) | YES  |     | NULL    |                |
| sex     | char(1)     | YES  |     | NULL    |                |
| birth   | date        | YES  |     | NULL    |                |
| death   | date        | YES  |     | NULL    |                |
| petID   | int(11)     | NO   | PRI | NULL    | auto_increment |
| ownerID | int(11)     | YES  | MUL | NULL    |                |
+---------+-------------+------+-----+---------+----------------+


4. Lisätään omistajien tiedot

    INSERT INTO owner (first_name, last_name, address, ownerID) VALUES
    ('Harold', "Lloyd", "address1", NULL),
    ('Gwen', "Stefani", "address2", NULL),
    ('Benny', "Hill", "address3",  NULL),
    ('Diane', "Keaton", "address4", NULL);

    SELECT * FROM owner;

+------------+-----------+----------+---------+
| first_name | last_name | address  | ownerID |
+------------+-----------+----------+---------+
| Harold     | Lloyd     | address1 |       1 |
| Gwen       | Stefani   | address2 |       2 |
| Benny      | Hill      | address3 |       3 |
| Diane      | Keaton    | address4 |       4 |
+------------+-----------+----------+---------+


5. Päivitetään pet

    UPDATE pet SET ownerID=1 WHERE name='Buffy' OR name="Fluffy";
    UPDATE pet SET ownerID=2 WHERE name='Claws' OR name="Chirpy" OR name="Whistler";
    UPDATE pet SET ownerID=3 WHERE name='Fang' OR name="Slim";
    UPDATE pet SET ownerID=4 WHERE name='Bowser';

    SELECT * FROM pet;

+----------+---------+------+------------+------------+-------+---------+
| name     | species | sex  | birth      | death      | petID | ownerID |
+----------+---------+------+------------+------------+-------+---------+
| Fluffy   | cat     | f    | 1993-02-04 | NULL       |     1 |       1 |
| Claws    | cat     | m    | 1994-03-17 | NULL       |     2 |       2 |
| Buffy    | dog     | f    | 1989-05-13 | NULL       |     3 |       1 |
| Fang     | dog     | m    | 1990-08-27 | NULL       |     4 |       3 |
| Bowser   | dog     | m    | 1998-08-31 | 1995-07-29 |     5 |       4 |
| Chirpy   | bird    | f    | 1998-09-11 | 2000-09-15 |     6 |       2 |
| Whistler | bird    | NULL | 1997-12-09 | NULL       |     7 |       2 |
| Slim     | snake   | m    | 1996-04-29 | NULL       |     8 |       3 |
+----------+---------+------+------------+------------+-------+---------+


    SELECT first_name,name FROM pet JOIN owner ON pet.ownerID = owner.ownerID;

+------------+----------+
| first_name | name     |
+------------+----------+
| Harold     | Fluffy   |
| Gwen       | Claws    |
| Harold     | Buffy    |
| Benny      | Fang     |
| Diane      | Bowser   |
| Gwen       | Chirpy   |
| Gwen       | Whistler |
| Benny      | Slim     |
+------------+----------+
