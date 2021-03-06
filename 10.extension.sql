
CREATE EXTENSION plpython3u;
create extension plperlu;

create or replace function foo() returns text as $$
return `/usr/bin/echo -n "hello world from perl!"`;
$$ language plperlu;

select foo();

create or replace function pyfoo() returns text as $$
return 'Hello World from Python!';
$$ language plpython3u;

select pyfoo();


create or replace function pydate() returns text as $$
from datetime import date
today = date.today()
return 'Hello World from Python: ' + today.strftime("%d/%m/%Y");
$$language plpython3u;

select pydate();

create or replace function pyversion() returns text as $$
import sys
return 'Python version : ' + sys.version;
$$language plpython3u;


select pyversion();


create or replace function pyex() returns text as $$
import psycopg2 as pg2

#Create a connection credentials to the PostgreSQL database
try:
    connection = psycopg2.connect(
        user = "skie",
        password = "skie",
        host = "localhost",
        port = "5432",
        database = "postgres"
    )

    #Create a cursor connection object to a PostgreSQL instance and print the connection properties.
    cursor = connection.cursor()
    print(connection.get_dsn_parameters(),"\n")

    #Display the PostgreSQL version installed
    cursor.execute("SELECT version();")
    record = cursor.fetchone()
    print("You are connected into the - ", record,"\n")

#Handle the error throws by the command that is useful when using python while working with PostgreSQL
except(Exception, psycopg2.Error) as error:
    print("Error connecting to PostgreSQL database", error)
    connection = None

#Close the database connection
finally:
    if(connection != None):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is now closed")



return 'Python version : ' + sys.version;
$$language plpython3u;

select pyex();



