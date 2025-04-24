from flask import Flask, render_template
import pymysql

app = Flask(__name__)

@app.route('/')
def home():
    try:
        conn = pymysql.connect(
            host="localhost",
            user="root",
            password="root",
            database="customer_shop"
        )
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM customer_list")
        rows = cursor.fetchall()
        columns = [col[0] for col in cursor.description]
        conn.close()
        return render_template('Home.html', rows=rows, columns=columns)
    except Exception as e:
        return f"Error: {str(e)}"

@app.route('/monthly-sales')
def monthly_sales():
    try:
        conn = pymysql.connect(
            host="localhost",
            user="root",
            password="root",
            database="customer_shop"
        )
        cursor = conn.cursor()
        query = """
            SELECT 
                DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m') AS month,
                SUM(price) AS monthly_total,
                SUM(SUM(price)) OVER (ORDER BY DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m')) AS cumulative_total
            FROM customer_list
            WHERE invoice_date IS NOT NULL
                AND YEAR(STR_TO_DATE(invoice_date, '%d-%m-%Y')) BETWEEN 2022 AND 2025  -- Filter by year
            GROUP BY DATE_FORMAT(STR_TO_DATE(invoice_date, '%d-%m-%Y'), '%Y-%m');


        """
        cursor.execute(query)
        rows = cursor.fetchall()
        columns = [col[0] for col in cursor.description]
        conn.close()
        return render_template('monthly_sales.html', rows=rows, columns=columns)
    except Exception as e:
        return f"Error: {str(e)}"

if __name__ == '__main__':
    app.run(debug=True)
