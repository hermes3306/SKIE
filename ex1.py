#Import the python driver for PostgreSQL
import psycopg2


#Create a connection credentials to the PostgreSQL database
try:
    connection = psycopg2.connect(
        user = "skie",
        password = "skie",
        host = "192.168.1.102",
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
