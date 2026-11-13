#-----------------------------------------------------------------------------------------------------
lyhyt:
    a) SELECT DISTINCT dept_name FROM departments;
    
    b) SELECT DISTINCT title FROM titles;   
    
    c) SELECT min(salary) AS min_salary, MAX(salary) AS max_salary FROM salaries;
    
    d) SELECT AVG(salary) AS avg_current_salary FROM salaries WHERE to_date = '9999-01-01'; 
    tai -> SELECT avg(salary) FROM salaries;
    
    e) SELECT DISTINCT first_name, last_name FROM employees WHERE last_name="facello";
    tai -> SELECT DISTINCT first_name FROM employees WHERE last_name="facello";
    tai -> SELECT DISTINCT * FROM employees WHERE last_name="facello";

    f) SELECT COUNT(*) AS 's1950-1959' FROM employees WHERE birth_date BETWEEN '1950-01-01' AND '1960-01-01';
    
    g) SELECT gender, COUNT(*) AS total_count FROM employees GROUP BY gender;

#-----------------------------------------------------------------------------------------------------

Tulosteilla:
a) Minkä nimisiä osastoja (Departments) Employees-tietokannassa on ?
    
    SELECT DISTINCT dept_name FROM departments;

+--------------------+
| dept_name          |
+--------------------+
| Customer Service   |
| Development        |
| Finance            |
| Human Resources    |
| Marketing          |
| Production         |
| Quality Management |
| Research           |
| Sales              |
+--------------------+


b) Tulosta, (yhden kerran kukin) mitä nimikkeitä (title) tietokannassa on.
    
    SELECT DISTINCT title FROM titles;

+--------------------+
| title              |
+--------------------+
| Senior Engineer    |
| Staff              |
| Engineer           |
| Senior Staff       |
| Assistant Engineer |
| Technique Leader   |
| Manager            |
+--------------------+

c) Mikä on suurin ja pienin palkka (salary) ? VIHJE: MIN, MAX. Voi olla kaksi erillistä kyselyä.

    SELECT min(salary) AS min_salary, MAX(salary) AS max_salary FROM salaries;

+------------+------------+
| min_salary | max_salary |
+------------+------------+
|      38623 |     158220 |
+------------+------------+



d) Mikä on keskimääräinen palkka ? VIHJE: AVG
    
    SELECT AVG(salary) AS avg_current_salary FROM salaries WHERE to_date = '9999-01-01';

+--------------------+
| avg_current_salary |
+--------------------+
|         72012.2359 |
+--------------------+


tai jos haluttiin jo lopettaneidenkin palkat jostain syystä ottaa mukaan:
    
    SELECT avg(salary) FROM salaries;
    
+-------------+
| avg(salary) |
+-------------+
|  63810.7448 |
+-------------+

    

e) Tulosta kaikki työntekijät, joiden sukunimi on Facello.
    
    SELECT DISTINCT first_name, last_name FROM employees WHERE last_name="facello";

+-------------+-----------+
| first_name  | last_name |
+-------------+-----------+
| Georgi      | Facello   |
| Roded       | Facello   |
| Nahum       | Facello   |
| Kirk        | Facello   |
| Kasturi     | Facello   |

...

    Tai jos ei tarvi sukunimeä: 

    SELECT DISTINCT first_name FROM employees WHERE last_name="facello";

+-------------+
| first_name  |
+-------------+
| Georgi      |
| Roded       |
| Nahum       |
| Kirk        |
| Kasturi     |
...

    Tai jos haluaa kaikki tiedot: 

    SELECT DISTINCT * FROM employees WHERE last_name="facello";

+--------+------------+-------------+-----------+--------+------------+
| emp_no | birth_date | first_name  | last_name | gender | hire_date  |
+--------+------------+-------------+-----------+--------+------------+
|  10001 | 1953-09-02 | Georgi      | Facello   | M      | 1986-06-26 |
|  10327 | 1954-04-01 | Roded       | Facello   | M      | 1987-09-18 |
|  12751 | 1964-07-06 | Nahum       | Facello   | M      | 1995-01-09 |
|  15346 | 1959-09-26 | Kirk        | Facello   | F      | 1991-12-07 |
|  15685 | 1958-07-12 | Kasturi     | Facello   | M      | 1992-03-13 |
...

f) Kuinka moni työntekijä on syntynyt 1950-luvulla ?

    SELECT COUNT(*) AS 's1950-1959' FROM employees WHERE birth_date BETWEEN '1950-01-01' AND '1960-01-01';

+------------+
| s1950-1959 |
+------------+
|     182949 |
+------------+

g) Montako miestä ja montako naista työntekijöissä on ?

    SELECT gender, COUNT(*) AS total_count FROM employees GROUP BY gender;

+--------+-------------+
| gender | total_count |
+--------+-------------+
| M      |      179973 |
| F      |      120051 |
+--------+-------------+
