import streamlit as st
import pandas as pd
import plotly.express as px
import psycopg2

# Database connection
DB_CONFIG = {
    "host": "localhost",
    "port": "5000",
    "database": "database",
    "user": "database",
    "password": "secret"
}

# Fetch data
query = ("SELECT * FROM sales_data_mart_visualization_schema.rollup where customer is not null;")
try:
    conn = psycopg2.connect(**DB_CONFIG)
    df = pd.read_sql_query(query, conn)
    print("Data loaded successfully!")
except Exception as e:
    print(f"Error executing query: {e}")
finally:
    conn.close()
    print("Database connection closed.")

# 🔄 Handle missing values
df.fillna("Total", inplace=True)

# 🎨 Streamlit App
st.title("Sales Data Insights")

# 🎛 Sidebar Filters
st.sidebar.header("Filters")
selected_store = st.sidebar.selectbox("Select a Store", df['store'].unique())
selected_month = st.sidebar.selectbox("Select a Month", df['month'].unique())

# 📌 Filtered Data
filtered_data = df[(df['store'] == selected_store) & (df['month'] == selected_month)]
st.subheader("Filtered Data")
st.dataframe(filtered_data)

# 1️⃣ **📊 Pie Chart: Sales Distribution by Store**
st.subheader("Total Sales Distribution by Store")
fig1 = px.pie(df, values='total_sales', names='store', title="Sales Share by Store")
st.plotly_chart(fig1)

# 2️⃣ **📈 Line Chart: Sales Trend Over Time**
st.subheader("Sales Trend Over Time")
sales_trend = df.groupby('month')['total_sales'].sum().reset_index()
fig2 = px.line(sales_trend, x='month', y='total_sales', title="Sales Trend Over Time")
st.plotly_chart(fig2)

# 3️⃣ **🍩 Donut Chart: Sales Contribution by Employee**
st.subheader("Sales Contribution by Employee")
fig3 = px.pie(df, values='total_sales', names='employee', hole=0.4, title="Sales by Employee")
st.plotly_chart(fig3)

# 4️⃣ **🏆 Horizontal Bar Chart: Top Customers**
st.subheader("Top Spending Customers")
top_customers = df.groupby('customer')['total_sales'].sum().nlargest(10).reset_index()
fig4 = px.bar(top_customers, x='total_sales', y='customer', orientation='h', title="Top 10 Customers")
st.plotly_chart(fig4)

# 5️⃣ **🔥 Heatmap: Sales by Store & Month**
st.subheader("Sales Heatmap: Store vs Month")
heatmap_data = df.pivot_table(index='store', columns='month', values='total_sales', aggfunc='sum')
fig5 = px.imshow(heatmap_data, labels={'x': 'Month', 'y': 'Store', 'color': 'Total Sales'})
st.plotly_chart(fig5)
