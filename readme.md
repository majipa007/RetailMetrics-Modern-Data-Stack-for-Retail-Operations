# Retail Data Pipeline & Visualization

## ✨ Table of Contents
- [📖 Introduction](#-introduction)
- [📊 Architecture Overview](#-architecture-overview)
- [🔗 Frontend (HTML, CSS, JS)](#-frontend-html-css-js)
- [🛠️ Backend (Node.js & Express)](#-backend-nodejs--express)
- [💾 Databases (OLTP & OLAP)](#-databases-oltp--olap)
  - [🔹 OLTP - PostgreSQL](#-oltp---postgresql)
  - [🔹 OLAP - Data Warehouse (PostgreSQL + DBT)](#-olap---data-warehouse-postgresql--dbt)
- [⚡ Data Pipeline (Airflow + DBT)](#-data-pipeline-airflow--dbt)
- [📊 Visualization (Streamlit)](#-visualization-streamlit)
- [🚀 Deployment & Running Locally](#-deployment--running-locally)
- [💡 Future Improvements](#-future-improvements)
- [🤝 Contributing](#-contributing)
- [📱 Contact](#-contact)

---

## 📖 Introduction
This project is a **Retail Data Pipeline & Visualization System** that processes sales and inventory data, transforms it using **DBT**, and visualizes it in **Streamlit**. The system includes **Airflow for automation**, **PostgreSQL for OLTP**, and a **data warehouse for OLAP analytics**.

---

## 📊 Architecture Overview
### **Tech Stack:**
- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Node.js (Express)
- **OLTP Database**: PostgreSQL
- **OLAP Database**: PostgreSQL + DBT
- **Data Pipeline**: Apache Airflow + DBT
- **Visualization**: Streamlit

### **Data Flow:**
1. **Users interact** with the web frontend.
2. **Sales & inventory data** is sent to the Node.js backend.
3. **OLTP Database (PostgreSQL)** stores raw sales & inventory transactions.
4. **Airflow & DBT** transform the data into reports.
5. **OLAP Database (PostgreSQL + DBT)** stores aggregated data.
6. **Streamlit fetches data** & presents dashboards.

---

## 🔗 Frontend (HTML, CSS, JS)
The frontend is a **web-based dashboard** for recording sales and managing inventory.

### **Features:**
- 📈 **Record Sales** (store, customer, employee, products)
- 📅 **Manage Inventory** (add/remove stock)
- 🔄 **Fetch Reports**

### **Running Frontend Locally:**
Just open `index.html` in a browser or serve it via a local HTTP server.
```bash
npx http-server ./frontend -p 8081
```

---

## 🛠️ Backend (Node.js & Express)
The backend **handles API requests** from the frontend and manages database operations.

### **Endpoints:**
- `/sales` → **Records sales transactions**
- `/inventory` → **Updates inventory stock**

### **Running Backend Locally:**
```bash
npm install  # Install dependencies
node server.js  # Start server
```
Server runs on: **http://localhost:3000**

---

## 💾 Databases (OLTP & OLAP)

### 🔹 OLTP - PostgreSQL
- Stores raw transactional sales and inventory data.
- **Schema:** `sales`, `customers`, `employees`, `stores`

### 🔹 OLAP - Data Warehouse (PostgreSQL + DBT)
- Aggregated reports for analysis.
- **DBT models transform OLTP data into sales summaries.**

Example DBT Model:
```sql
SELECT
    month,
    store,
    SUM(total_amount) AS total_sales
FROM {{ ref('sales_summary') }}
GROUP BY month, store
ORDER BY month;
```

---

## ⚡ Data Pipeline (Airflow + DBT)

### **ETL Process:**
1. **Extract:** Airflow pulls data from OLTP.
2. **Transform:** DBT models clean & aggregate sales data.
3. **Load:** Data stored in OLAP for reporting.

---

## 📊 Visualization (Streamlit)
- **Dashboard:** Sales trends, store comparisons, customer insights.
- **Filters:** Month, Store, Employee, Customer.

### **Running Streamlit Locally:**
```bash
streamlit run app.py --server.port=8501 --server.address=0.0.0.0 --server.headless=true
```

---

## 🚀 Deployment & Running Locally

### **🔹 Run with Docker**
```bash
docker-compose up --build
```

### **🔹 Access Services**
- **Frontend:** http://localhost:8081
- **Backend (Node.js):** http://localhost:3000
- **Streamlit:** can be accessed via the airflow logs
- **Airflow UI:** http://localhost:8080

---

## 💡 Future Improvements
- 🔄 **Real-time Processing** with Kafka
- 📊 **ML-based Forecasting** for sales trends
- 🚀 **Kubernetes Deployment** for scalability
- 🔍 **Enhanced Data Visualization**

---

## 🤝 Contributing
We welcome contributions! Please follow these steps:
1. **Fork the repo**
2. **Create a new branch**
3. **Commit changes**
4. **Submit a PR**

---

## 📱 Contact
💌 Email: [sulavstha007@example.com](sulavstha007@example.com)  
💼 LinkedIn: [Sulav Shrestha](https://www.linkedin.com/in/sulav-shrestha-16b1091bb/)  

