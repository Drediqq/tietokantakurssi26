#-----------------------------------------------------------------------------------------------------
lyhyt: 
    a) SELECT DISTINCT * from employees ORDER BY last_name LIMIT 10;

    b) SELECT DISTINCT * from employees ORDER BY last_name, first_name LIMIT 10;
    
    c) SELECT *  FROM employees ORDER BY hire_date DESC LIMIT 5;
    
    d) SELECT DISTINCT first_name, last_name, salary FROM employees 
       INNER JOIN salaries ON employees.emp_no = salaries.emp_no 
       WHERE salaries.to_date = '9999-01-01' ORDER BY salary 
       DESC LIMIT 1;
    
    e) SELECT DISTINCT first_name, last_name, salary FROM employees 
       INNER JOIN salaries ON employees.emp_no = salaries.emp_no 
       WHERE salaries.to_date = '9999-01-01' ORDER BY salary 
       ASC LIMIT 1;
    
    f) SELECT DISTINCT first_name, last_name, salary FROM employees 
       INNER JOIN salaries ON employees.emp_no = salaries.emp_no 
       WHERE salaries.to_date = '9999-01-01' AND salary > 150000
       ORDER BY salary DESC;

    g) SELECT departments.dept_name, COUNT(dept_emp.emp_no) AS total_emps FROM dept_emp 
       INNER JOIN departments ON dept_emp.dept_no = departments.dept_no 
       WHERE departments.dept_name IN('Sales', 'Marketing') 
       GROUP BY departments.dept_name;
    
    h) SELECT DISTINCT first_name, last_name, departments.dept_name FROM employees
       INNER JOIN titles ON employees.emp_no = titles.emp_no     
       INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no     
       INNER JOIN departments ON dept_emp.dept_no = departments.dept_no      
       WHERE titles.title="manager" AND dept_emp.to_date="9999-01-01";

    i) SELECT departments.dept_name, avg(salary) FROM salaries     
       INNER JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no     
       INNER JOIN departments ON dept_emp.dept_no = departments.dept_no      
       WHERE salaries.to_date="9999-01-01" AND departments.dept_name IN ("Sales", "Marketing") 
       GROUP BY departments.dept_name;

#-----------------------------------------------------------------------------------------------------


Tulosteilla:
a) Tulosta kymmenen aakkosjärjestyksessä ensimmäisen työntekijän tiedot sukunimen mukaan lajiteltuna. 
Vihje: LIMIT rajoittaa tulostettavien tietojen määrän.

    SELECT DISTINCT * from employees ORDER BY last_name LIMIT 10;

+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  17885 | 1954-02-01 | Takanari   | Aamodt    | M      | 1996-08-19 |
|  19898 | 1957-03-09 | Vidar      | Aamodt    | M      | 1988-08-06 |
|  17400 | 1962-03-22 | Basim      | Aamodt    | F      | 1991-09-15 |
|  12982 | 1952-12-08 | Sachem     | Aamodt    | F      | 1992-01-11 |
|  12516 | 1958-06-25 | Sreenivas  | Aamodt    | F      | 1990-03-06 |
|  12791 | 1960-06-16 | Mokhtar    | Aamodt    | M      | 1994-08-14 |
|  16572 | 1956-11-26 | Matt       | Aamodt    | M      | 1987-06-16 |
|  18182 | 1963-02-23 | Dekang     | Aamodt    | F      | 1988-05-25 |
|  15427 | 1959-03-06 | Aluzio     | Aamodt    | M      | 1985-03-03 |
|  11761 | 1964-07-17 | Bartek     | Aamodt    | M      | 1991-06-12 |
+--------+------------+------------+-----------+--------+------------+

b) Sama kuten edellä, mutta sukunimen JA etunimen mukaan lajiteltuna.
    
    SELECT DISTINCT * from employees ORDER BY last_name, first_name LIMIT 10;

+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
| 258641 | 1961-05-23 | Abdelkader | Aamodt    | M      | 1994-12-02 |
| 258005 | 1953-02-17 | Adhemar    | Aamodt    | F      | 1991-01-21 |
| 455773 | 1960-05-04 | Aemilian   | Aamodt    | M      | 1988-04-21 |
| 436560 | 1959-03-16 | Alagu      | Aamodt    | F      | 1991-10-17 |
| 266651 | 1959-05-28 | Aleksander | Aamodt    | F      | 1989-03-29 |
| 487598 | 1962-03-03 | Alexius    | Aamodt    | M      | 1994-12-30 |
| 216963 | 1960-07-16 | Alois      | Aamodt    | M      | 1995-08-24 |
|  15427 | 1959-03-06 | Aluzio     | Aamodt    | M      | 1985-03-03 |
| 100860 | 1964-06-20 | Amabile    | Aamodt    | F      | 1993-02-06 |
| 107070 | 1954-04-24 | Anestis    | Aamodt    | M      | 1990-10-30 |
+--------+------------+------------+-----------+--------+------------+


c) Tulosta viiden viimeksi palkatun työntekijän tiedot.

    SELECT *  FROM employees ORDER BY hire_date DESC LIMIT 5;

+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
| 463807 | 1964-06-12 | Bikash     | Covnot    | M      | 2000-01-28 |
| 428377 | 1957-05-09 | Yucai      | Gerlach   | M      | 2000-01-23 |
| 499553 | 1954-05-06 | Hideyuki   | Delgrande | F      | 2000-01-22 |
| 222965 | 1959-08-07 | Volkmar    | Perko     | F      | 2000-01-13 |
|  47291 | 1960-09-09 | Ulf        | Flexer    | M      | 2000-01-12 |
+--------+------------+------------+-----------+--------+------------+


Seuraavissa tehtävissä tarvitaan tietoja useammasta kuin yhdestä taulusta (JOIN).
d) Kenellä on suurin palkka ? Tulosta etunimi, sukunimi ja palkka.
    
    SELECT DISTINCT first_name, last_name, salary FROM employees 
    INNER JOIN salaries ON employees.emp_no = salaries.emp_no 
    WHERE salaries.to_date = '9999-01-01' ORDER BY salary 
    DESC LIMIT 1;

+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Tokuyasu   | Pesch     | 158220 |
+------------+-----------+--------+

e) Kenellä on pienin palkka ? Tulosta etunimi, sukunimi ja palkka.

    SELECT DISTINCT first_name, last_name, salary FROM employees 
    INNER JOIN salaries ON employees.emp_no = salaries.emp_no 
    WHERE salaries.to_date = '9999-01-01' ORDER BY salary 
    ASC LIMIT 1;

+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Olivera    | Baek      |  38623 |
+------------+-----------+--------+

f) Tulosta työntekijät (etunimi, sukunimi, palkka), jotka ansaitsevat yli 150000. 

    SELECT DISTINCT first_name, last_name, salary FROM employees 
    INNER JOIN salaries ON employees.emp_no = salaries.emp_no 
    WHERE salaries.to_date = '9999-01-01' AND salary > 150000
    ORDER BY salary DESC;


+------------+-----------+--------+
| first_name | last_name | salary |
+------------+-----------+--------+
| Tokuyasu   | Pesch     | 158220 |
| Honesty    | Mukaidono | 156286 |
| Xiahua     | Whitcomb  | 155709 |
| Sanjai     | Luders    | 155513 |
| Tsutomu    | Alameldin | 155190 |
| Willard    | Baca      | 154459 |
| Lidong     | Meriste   | 154376 |
| Charmane   | Griswold  | 153715 |
| Weijing    | Chenoweth | 152710 |
| Weicheng   | Hatcliff  | 152687 |
| Shin       | Birdsall  | 152412 |
| Mitsuyuki  | Stanfel   | 152220 |
| Mohammed   | Moehrke   | 150740 |
| Ibibia     | Junet     | 150345 |
| Lansing    | Kambil    | 150052 |
+------------+-----------+--------+


g) Kuinka monta työntekijää työskentelee myynnissä (Sales) ? Entä markkinoinnissa (Marketing) ?

    SELECT departments.dept_name, COUNT(dept_emp.emp_no) AS total_emps FROM dept_emp 
    INNER JOIN departments ON dept_emp.dept_no = departments.dept_no 
    WHERE departments.dept_name IN('Sales', 'Marketing') 
    GROUP BY departments.dept_name;

+-----------+------------+
| dept_name | total_emps |
+-----------+------------+
| Marketing |      20211 |
| Sales     |      52245 |


h) Tulosta kaikkien osastonjohtajien (Department Managers) etunimi, sukunimi ja osasto, jolla työskentelee.

    SELECT DISTINCT first_name, last_name, departments.dept_name FROM employees
    INNER JOIN titles ON employees.emp_no = titles.emp_no     
    INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no     
    INNER JOIN departments ON dept_emp.dept_no = departments.dept_no      
    WHERE titles.title="manager" AND dept_emp.to_date="9999-01-01";

+-------------+--------------+--------------------+
| first_name  | last_name    | dept_name          |
+-------------+--------------+--------------------+
| Tonny       | Butterworth  | Customer Service   |
| Marjo       | Giarratana   | Customer Service   |
| Xiaobin     | Spinelli     | Customer Service   |
| Yuchang     | Weedman      | Customer Service   |
| DeForest    | Hagimont     | Development        |
| Leon        | DasSarma     | Development        |
| Ebru        | Alpin        | Finance            |
| Isamu       | Legleitner   | Finance            |
| Shirish     | Ossenbruggen | Human Resources    |
| Karsten     | Sigstam      | Human Resources    |
| Margareta   | Markovitch   | Marketing          |
| Vishwani    | Minakawa     | Marketing          |
| Krassimir   | Wegerle      | Production         |
| Rosine      | Cools        | Production         |
| Shem        | Kieras       | Production         |
| Oscar       | Ghazalie     | Production         |
| Peternela   | Onuegbe      | Quality Management |
| Rutger      | Hofmeyr      | Quality Management |
| Sanjoy      | Quadeer      | Quality Management |
| Dung        | Pesch        | Quality Management |
| Arie        | Staelin      | Research           |
| Hilary      | Kambil       | Research           |
| Przemyslawa | Kaelbling    | Sales              |
| Hauke       | Zhang        | Sales              |
+-------------+--------------+--------------------+



i) Mikä on myynnissä työskentelevien keskipalkka ? Entä markkinoinnissa ?

    SELECT departments.dept_name, avg(salary) FROM salaries     
    INNER JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no     
    INNER JOIN departments ON dept_emp.dept_no = departments.dept_no      
    WHERE salaries.to_date="9999-01-01" AND departments.dept_name IN ("Sales", "Marketing") 
    GROUP BY departments.dept_name;

+-----------+-------------+
| dept_name | avg(salary) |
+-----------+-------------+
| Marketing |  80014.6861 |
| Sales     |  88842.1590 |
+-----------+-------------+
