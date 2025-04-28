import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="customer_shop"
)

cursor = conn.cursor()
cursor.execute("SELECT * FROM customer_list")
for row in cursor.fetchall():
    print(row)

conn.close()
