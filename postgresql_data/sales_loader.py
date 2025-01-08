import psycopg2
import pandas as pd

# Database connection details
conn = psycopg2.connect(
    host="localhost",
    database="database",
    user="database",
    password="secret",
    port = 5000
)

# Read the CSV file using pandas
df = pd.read_csv('sales_data.csv')

# Create a cursor object
cursor = conn.cursor()

# Insert each row into the sale table
for index, row in df.iterrows():
    cursor.execute("""
        INSERT INTO retail_shop.sale (sale_id, store_id, customer_id, employee_id, sale_date, total_amount)
        VALUES (%s, %s, %s, %s, %s, %s)
    """, (row['sale_id'], row['store_id'], row['customer_id'], row['employee_id'], row['sale_date'], row['total_amount']))

# Commit the transaction
conn.commit()

# Close the cursor and connection
cursor.close()
conn.close()

print("Data inserted successfully!")
