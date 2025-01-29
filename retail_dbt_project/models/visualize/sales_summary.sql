{{ config(
    materialized = "view",
    schema = "visualization_schema"
) }}

SELECT
    sales.sale_id,
    	to_date(date.year || '-' || date.month || '-' || date.day, 'YYYY-MM-DD') as sale_date,
    store.store_name AS store,
    customer.first_name || ' ' || customer.last_name AS customer,
    employee.first_name || ' ' || employee.last_name AS employee,
    sales.total_amount
FROM {{ ref('fact_sales') }} AS sales
LEFT JOIN {{ ref('dim_stores') }} AS store
    ON sales.store_id = store.store_id
LEFT JOIN {{ ref('dim_employee') }} AS employee
    ON sales.employee_id = employee.employee_id
LEFT JOIN {{ ref('dim_customers') }} AS customer
    ON sales.customer_id = customer.customer_id
LEFT JOIN {{ ref('dim_date') }} AS date
    ON sales.date_id = date.date_id
ORDER BY sales.sale_id
