#-----------------------------------------------------------------------------------------------------
Lyhyt:
a) SELECT DISTINCT language.name FROM language 
   INNER JOIN film ON language.language_id = film.language_id;

b) SELECT DISTINCT film.title FROM actor 
   INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
   INNER JOIN film ON film_actor.film_id = film.film_id
   WHERE actor.last_name="temple";

c) SELECT DISTINCT first_name, last_name FROM actor 
   INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
   INNER JOIN film ON film_actor.film_id = film.film_id
   WHERE film.title="Ghost Groundhog";


d) SELECT COUNT(*) FROM film      
   INNER JOIN film_list ON film.film_id = film_list.FID     
   WHERE film_list.category="horror";

e) SELECT DISTINCT film.title, film_list.category FROM film      
   INNER JOIN film_list ON film.film_id = film_list.FID     
   WHERE film_list.category="horror";

#-----------------------------------------------------------------------------------------------------


Tulosteilla:
a) Tulosta DVD-elokuvien kielet (language) aakkosjärjestyksessä
    
    SELECT DISTINCT language.name FROM language 
    INNER JOIN film ON language.language_id = film.language_id;

+---------+
| name    |
+---------+
| English |
+---------+

b) Tulosta kaikkien niiden näyttelijöiden elokuvat, joiden sukunimi on Temple.
    
    SELECT DISTINCT film.title FROM actor 
    INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
    INNER JOIN film ON film_actor.film_id = film.film_id
    WHERE actor.last_name="temple";
+-------------------------+
| title                   |
+-------------------------+
| ACADEMY DINOSAUR        |
| ALABAMA DEVIL           |
| BALLOON HOMEWARD        |
| BEACH HEARTBREAKERS     |
| BUTTERFLY CHOCOLAT      |
| CARRIE BUNCH            |
| CASUALTIES ENCINO       |
| CONTACT ANONYMOUS       |
...


c) Tulosta elokuvassa "Ghost Groundhog" näytelleet näyttelijät.
    
    SELECT DISTINCT first_name, last_name FROM actor 
    INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
    INNER JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title="Ghost Groundhog";

+------------+-----------+
| first_name | last_name |
+------------+-----------+
| DAN        | HARRIS    |
| KENNETH    | TORN      |
| KEVIN      | GARLAND   |
| RUSSELL    | TEMPLE    |
| RENEE      | BALL      |
+------------+-----------+

d) Montako kauhuelokuvaa ("Horror") tietokannassa on ?

    SELECT COUNT(*) FROM film      
    INNER JOIN film_list ON film.film_id = film_list.FID     
    WHERE film_list.category="horror";

+----------+
| COUNT(*) |
+----------+
|       56 |
+----------+

e) Tulosta kaikki kauhuelokuvat.

    SELECT DISTINCT film.title, film_list.category FROM film      
    INNER JOIN film_list ON film.film_id = film_list.FID     
    WHERE film_list.category="horror";

+-----------------------------+----------+
| title                       | category |
+-----------------------------+----------+
| ACE GOLDFINGER              | Horror   |
| AFFAIR PREJUDICE            | Horror   |
| AIRPORT POLLOCK             | Horror   |
| ALABAMA DEVIL               | Horror   |
| ALI FOREVER                 | Horror   |
| ANALYZE HOOSIERS            | Horror   |
| ANYTHING SAVANNAH           | Horror   |
...