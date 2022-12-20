
    %pip install psycopg2
Requirement already satisfied: psycopg2 in c:\anaconda\anaconda3\lib\site-packages (2.9.4)
Note: you may need to restart the kernel to use updated packages.
import psycopg2 as pg_driver

db = pg_driver.connect(
    database="postgres", 
    user='postgres',
    password='waltyru01', 
    host='localhost', 
    port='5432'
)


cur = db.cursor()
cur.execute("select * from pg_database")
rs = cur.fetchall()
for row, values in enumerate(rs):
    print(row, values)
0 (5, 'postgres', 10, 6, 'c', False, True, -1, '717', '1', 1663, 'Russian_Russia.1251', 'Russian_Russia.1251', None, None, None)
1 (16398, 'HOMEWORK', 10, 6, 'c', False, True, -1, '717', '1', 1663, 'Russian_Russia.1251', 'Russian_Russia.1251', None, None, None)
2 (1, 'template1', 10, 6, 'c', True, True, -1, '717', '1', 1663, 'Russian_Russia.1251', 'Russian_Russia.1251', None, None, '{=c/postgres,postgres=CTc/postgres}')
3 (4, 'template0', 10, 6, 'c', True, False, -1, '717', '1', 1663, 'Russian_Russia.1251', 'Russian_Russia.1251', None, None, '{=c/postgres,postgres=CTc/postgres}')
import psycopg2 as pg_driver

db = pg_driver.connect(user="postgres",
                       password="waltyru01",
                       host='localhost',
                       port='5432')


def execute_queries(db, sql_commands):
    db.autocommit = True
    with db.cursor() as cursor:
        for sql_command in sql_commands:
            print(sql_command)
            cursor.execute(sql_command)

sql_commands = ["CREATE DATABASE kino_database;",
                "CREATE USER projectuser with encrypted password 'waltyru01';",
                "GRANT ALL PRIVILEGES ON DATABASE kino_database TO projectuser;"]

execute_queries(db, sql_commands)
CREATE DATABASE kino_database;
CREATE USER projectuser with encrypted password 'waltyru01';
GRANT ALL PRIVILEGES ON DATABASE kino_database TO projectuser;
import psycopg2 as pg_driver

db = pg_driver.connect(
                        database="kino_database", 
                        user='postgres',
                        password='waltyru01', 
                        host='localhost', 
                        port='5432'
                    )



def execute_queries(db, sql_commands):
    db.autocommit = True
    with db.cursor() as cursor:
        for sql_command in sql_commands:
            print(sql_command)
            cursor.execute(sql_command)


sql_commands = ["
                """CREATE TABLE users (
                         user_id    INT       NOT NULL PRIMARY KEY,
                         name    TEXT       NOT NULL,
                         email   TEXT        NOT NULL,
                         nickname   TEXT        NOT NULL,
                         password   TEXT        NOT NULL,
                         age   TEXT        NOT NULL,
                         gender   TEXT        NOT NULL,
                         favorite_genre   TEXT        NOT NULL 
                );
                """,
                 """CREATE TABLE pictures (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_name    TEXT       NOT NULL
                  );
                """,
                """CREATE TABLE genre (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_genre    TEXT       NOT NULL
                );
                """,
                """CREATE TABLE form (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_form    TEXT       NOT NULL
                );
                """,
                """CREATE TABLE production (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_country    TEXT       NOT NULL,
                         film_year    TEXT       NOT NULL,
                         film_company    TEXT       NOT NULL    
                );
                """,
                """CREATE TABLE rating (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_rating    FLOAT       NOT NULL
                );
                """,
                """CREATE TABLE age_limit (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_age_limit    INT       NOT NULL          
                );
                """]


execute_queries(db, sql_commands)
CREATE TABLE users (
                         user_id    INT       NOT NULL PRIMARY KEY,
                         name    TEXT       NOT NULL,
                         email   TEXT        NOT NULL,
                         nickname   TEXT        NOT NULL,
                         password   TEXT        NOT NULL,
                         age   TEXT        NOT NULL,
                         gender   TEXT        NOT NULL,
                         favorite_genre   TEXT        NOT NULL
                         
                         
                );
                
CREATE TABLE pictures (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_name    TEXT       NOT NULL
                         
                  );
                
CREATE TABLE genre (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_genre    TEXT       NOT NULL
                         
                );
                
CREATE TABLE form (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_form    TEXT       NOT NULL
                         
                );
                
CREATE TABLE production (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_country    TEXT       NOT NULL,
                         film_year    TEXT       NOT NULL,
                         film_company    TEXT       NOT NULL
                        
                );
                
CREATE TABLE rating (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_rating    FLOAT       NOT NULL,
                         film_genre    TEXT       NOT NULL
                         
                );
                
CREATE TABLE age_limit (
                         film_id    INT       NOT NULL PRIMARY KEY,
                         film_age_limit    INT       NOT NULL
                         
                );
                
import psycopg2
from psycopg2 import Error
from psycopg2.extras import NamedTupleCursor

def execute_query(query, fetch_result=False):
    try:
        connection = pg_driver.connect(
                        database="kino_database", 
                        user='postgres',
                        password='waltyru01', 
                        host='localhost', 
                        port='5432'
                    );
        
        connection.autocommit = True
        cursor = connection.cursor(cursor_factory=NamedTupleCursor)
        cursor.execute(query)
        if fetch_result:
            return cursor.fetchall()
    except (Exception, Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        if (connection):
            cursor.close()
            connection.close()
row_count_hist = execute_query("select count(*) from users", fetch_result=True)

print(row_count_hist)
[Record(count=0)]
query = """ INSERT INTO users (user_id, name, email, nickname, password, age, gender, favorite_genre) 
            VALUES 
                 (1, 'Danil', 'danil@gmail.com', 'DanilE', '123456', 21, 'male', 'drama'),
                 (2, 'Artem', 'artem@gmail.com', 'ArtLife', '654321', 23, 'male', 'fantasy'),
                 (3, 'Kristina', 'kristina@gmail.com', 'KrissLip', 'qwerty', 19, 'female', 'cartoon'),
                 (4, 'Andrey', 'andrey@gmail.com', 'AndreySup', 'zxcasd123', 20, 'male', 'drama'),
                 (5, 'Anna', 'anna@gmail.com', 'Annaegorova', '66666', 27, 'female', 'fantasy'),
                 (6, 'Svetlana', 'svetlana@gmail.com', 'SvetlanaDem', '111345', 21, 'female', 'fantasy')
            
        """
execute_query(query)

query = """ INSERT INTO pictures (film_id, film_name) 
            VALUES 
                 (1, 'The Lion King'),
                 (2, 'Fight Club'),
                 (3, 'The Gentlemen'),
                 (4, 'Intouchables'),
                 (5, 'Zootopia'),
                 (6, 'Breaking Bad'),
                 (7, 'Friends'),
                 (8, 'Game of Thrones'),
                 (9, 'Chernobyl'),
                 (10, 'Ratatouille'),
                 (11, 'Ice Age'),
                 (12, 'Hasksaw Ridge')
                 
        """
execute_query(query)

query = """ INSERT INTO genre (film_id, film_genre) 
            VALUES 
                 (1, 'drama'),
                 (2, 'thriller'),
                 (3, 'action'),
                 (4, 'drama'),
                 (5, 'comedy'),
                 (6, 'thriller'),
                 (7, 'comedy'),
                 (8, 'fantasy'),
                 (9, 'drama'),
                 (10, 'comedy'),
                 (11, 'comedy'),
                 (12, 'biography')
                 
        """
execute_query(query)

query = """ INSERT INTO form (film_id, film_form) 
            VALUES 
                 (1, 'cartoon'),
                 (2, 'film'),
                 (3, 'film'),
                 (4, 'film'),
                 (5, 'cartoon'),
                 (6, 'serial'),
                 (7, 'serial'),
                 (8, 'serial'),
                 (9, 'serial'),
                 (10, 'cartoon'),
                 (11, 'cartoon'),
                 (12, 'film')
                 
        """
execute_query(query)

query = """ INSERT INTO production (film_id, film_country, film_year, film_company) 
            VALUES 
                 (1, 'USA', 1994, 'Walt Disney Pictures'),
                 (2, 'USA', 1999, '20th Century Studios'),
                 (3, 'UK', 2019, 'Miramax'),
                 (4, 'France', 2011, 'Gaumont'),
                 (5, 'USA', 2016, 'Walt Disney Pictures'),
                 (6, 'USA', 2008, 'Sony Pictures Television'),
                 (7, 'USA', 1994, 'Warner Bros. Television Studios'),
                 (8, 'USA', 2011, 'Warner Bros. Television Studios'),
                 (9, 'USA', 2019, 'Warner Bros. Television Studios'),
                 (10, 'USA', 2007, 'Pixar'),
                 (11, 'USA', 2002, 'Blue Sky Studios'),
                 (12, 'Australia', 2016, 'Cross Creek Pictures')
                 
        """
execute_query(query)

query = """ INSERT INTO rating (film_id, film_rating) 
            VALUES 
                 (1, 8.8),
                 (2, 8.6),
                 (3, 8.5),
                 (4, 8.8),
                 (5, 8.3),
                 (6, 8.9),
                 (7, 9.2),
                 (8, 9.1),
                 (9, 8.8),
                 (10, 8.1),
                 (11, 8.1),
                 (12, 8.2)
                 
        """
execute_query(query)

query = """ INSERT INTO age_limit (film_id, film_age_limit) 
            VALUES 
                 (1, 0),
                 (2, 18),
                 (3, 18),
                 (4, 16),
                 (5, 6),
                 (6, 18),
                 (7, 16),
                 (8, 18),
                 (9, 18),
                 (10, 0),
                 (11, 0),
                 (12, 18)
                 
        """
execute_query(query)

#Вывести фильмы 18+

query = """SELECT film_name FROM pictures
           LEFT JOIN age_limit ON age_limit.film_id = pictures.film_id
           WHERE film_age_limit = 18;
                
        """
all_rows = execute_query(query, fetch_result=True)
for row, value in enumerate(all_rows):
    print(row, value)
0 Record(film_name='Fight Club')
1 Record(film_name='The Gentlemen')
2 Record(film_name='Breaking Bad')
3 Record(film_name='Game of Thrones')
4 Record(film_name='Chernobyl')
5 Record(film_name='Hasksaw Ridge')

#Вывести сериалы жанра "фэнтези"

query = """SELECT film_name FROM pictures
           LEFT JOIN form ON form.film_id = pictures.film_id
           JOIN genre ON genre.film_id = pictures.film_id
           WHERE (film_genre = 'fantasy' and film_form = 'serial');
                
        """
all_rows = execute_query(query, fetch_result=True)
for row, value in enumerate(all_rows):
    print(row, value)
0 Record(film_name='Game of Thrones')

#вывести средний возраст пользователя

query = """ 
            SELECT AVG(age)
            FROM users;
        """
execute_query(query)
result = execute_query(query, fetch_result=True)
for row, value in enumerate(result):
    print(row, value)
0 Record(avg=Decimal('21.8333333333333333'))

#Вывести самый новый фильм

query = """ SELECT film_name
            FROM pictures
            RIGHT JOIN production ON production.film_id = pictures.film_id
            ORDER BY film_year DESC
            LIMIT 1;
        """
execute_query(query)
result = execute_query(query, fetch_result=True)
for row, value in enumerate(result):
    print(row, value)
0 Record(film_name='The Gentlemen')

#Вывести фильм с самым низким рейтингом

query = """ SELECT film_name FROM pictures
            RIGHT JOIN rating ON rating.film_id = pictures.film_id
            ORDER by film_rating ASC
            LIMIT 1;   
        """
execute_query(query)
result = execute_query(query, fetch_result=True)
print(result)
[Record(film_name='Ratatouille')]

#Вывести компании, выпустившие по меньшей мере два фильма

query = """ SELECT film_company
            FROM production
            FULL JOIN pictures ON production.film_id = pictures.film_id
            GROUP BY film_company
            HAVING count(film_name) >= 2;
        """
execute_query(query)
result = execute_query(query, fetch_result=True)
print(result)
[Record(film_company='Walt Disney Pictures'), Record(film_company='Warner Bros. Television Studios')]

#К какому жанру относится фильм "Friends"?

query = """SELECT film_genre FROM genre
           LEFT JOIN pictures ON pictures.film_id = genre.film_id
           WHERE film_name = 'Friends';     
        """
all_rows = execute_query(query, fetch_result=True)
for row, value in enumerate(all_rows):
    print(row, value)
0 Record(film_genre='comedy')

#Вывести все мультфильмы

query = """SELECT film_name FROM pictures
           LEFT JOIN form ON form.film_id = pictures.film_id
           JOIN genre ON genre.film_id = pictures.film_id
           WHERE (film_form = 'cartoon');       
        """
all_rows = execute_query(query, fetch_result=True)
for row, value in enumerate(all_rows):
    print(row, value)
0 Record(film_name='The Lion King')
1 Record(film_name='Zootopia')
2 Record(film_name='Ratatouille')
3 Record(film_name='Ice Age')


    SELECT film_name FROM pictures
           LEFT JOIN age_limit ON age_limit.film_id = pictures.film_id
           WHERE (film_age_limit >= 16);

    SELECT film_name FROM pictures
           LEFT JOIN age_limit ON age_limit.film_id = pictures.film_id
           WHERE (film_age_limit = 16 OR film_age_limit = 17 OR  film_age_limit = 18);

