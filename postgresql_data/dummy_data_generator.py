import csv
import random
from datetime import datetime, timedelta

# Parameters
num_rows = 4000  # You can adjust this to your desired range (3000-5000)
start_date = datetime(2024, 1, 1)
end_date = datetime(2024, 12, 31)

# ID ranges based on your existing tables
store_id_range = range(1, 36)  # 1 to 35 (inclusive)
customer_id_range = range(1, 11)  # 1 to 10 (inclusive)
employee_id_range = range(1, 11)  # 1 to 10 (inclusive)

# Generate dummy data
data = []
current_date = start_date

for i in range(num_rows):
    sale_id = i + 1
    store_id = random.choice(store_id_range)
    customer_id = random.choice(customer_id_range)
    employee_id = random.choice(employee_id_range)
    sale_date = current_date.strftime('%Y-%m-%d')
    total_amount = round(random.uniform(50, 5000), 2)  # Random amount between 50 and 5000

    # Append the row
    data.append([sale_id, store_id, customer_id, employee_id, sale_date, total_amount])

    # Increment date sequentially
    current_date += timedelta(days=1)
    if current_date > end_date:
        current_date = start_date

# Write to a CSV file
output_file = 'sales_data.csv'

with open(output_file, mode='w', newline='') as file:
    writer = csv.writer(file)
    # Write header
    writer.writerow(['sale_id', 'store_id', 'customer_id', 'employee_id', 'sale_date', 'total_amount'])
    # Write rows
    writer.writerows(data)

print(f"Dummy sales data generated in '{output_file}'.")
