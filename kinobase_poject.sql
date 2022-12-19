
    SELECT film_name FROM pictures
           LEFT JOIN age_limit ON age_limit.film_id = pictures.film_id
           WHERE film_age_limit = 18;

    SELECT film_name FROM pictures
           LEFT JOIN form ON form.film_id = pictures.film_id
           JOIN genre ON genre.film_id = pictures.film_id
           WHERE (film_genre = 'fantasy' and film_form = 'serial');

    SELECT AVG(age)
            FROM users;

    SELECT film_name
            FROM pictures
            RIGHT JOIN production ON production.film_id = pictures.film_id
            ORDER BY film_year DESC
            LIMIT 1;

    SELECT film_name FROM pictures
            RIGHT JOIN rating ON rating.film_id = pictures.film_id
            ORDER by film_rating ASC
            LIMIT 1;

    SELECT film_company
            FROM production
            FULL JOIN pictures ON production.film_id = pictures.film_id
            GROUP BY film_company
            HAVING count(film_name) >= 2;

    SELECT film_genre FROM genre
           LEFT JOIN pictures ON pictures.film_id = genre.film_id
           WHERE film_name = 'Friends';

    SELECT film_name FROM pictures
           LEFT JOIN form ON form.film_id = pictures.film_id
           JOIN genre ON genre.film_id = pictures.film_id
           WHERE (film_form = 'cartoon');





