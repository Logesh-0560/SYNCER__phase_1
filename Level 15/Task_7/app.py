from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

@app.route('/')
def display_table():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="customer_shop"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM customer_list")
    rows = cursor.fetchall()
    column_names = [i[0] for i in cursor.description] 
    conn.close()
    return render_template('table.html', rows=rows, columns=column_names)

if __name__ == '__main__':
    app.run(debug=True)
