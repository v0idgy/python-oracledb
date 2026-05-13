import oracledb ## Importing the Oracle Database driver for Python

# Establishing a connection to the Oracle Database
username = "system"  # Replace with your database username
password = "password"  # Replace with your database password
host = "localhost"  # Replace with your database host
port = 1521  # Replace with your database port
service_name = "free" # Replace with your database service name

## Connection string format: username/password@host:port/service_name

connection_string = f"{username}/{password}@{host}:{port}/{service_name}"
print(connection_string)


oracledb.connect(connection_string)
print("Connection established.") ## Establishing the connection using the connection string


# connection_string = "localhost/free"
# with oracledb.connect(user=username, password=password, dsn=connection_string) as connection:
#     with connection.cursor() as cursor:
#         sql = "select sysdate from dual"
#         for r in cursor.execute(sql):
#             print(r)