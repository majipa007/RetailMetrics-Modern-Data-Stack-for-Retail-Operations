import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objs as go
import psycopg2

# Database connection configuration
DB_CONFIG = {
    "host": "postgres",
    "port": "5432",
    "database": "database",
    "user": "database",
    "password": "secret"
}


def load_data():
    """Load data from PostgreSQL database"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        query = "SELECT * FROM sales_data_mart_visualization_schema.rollup where customer is not null;"
        df = pd.read_sql_query(query, conn)
        print("Data loaded successfully!")
        return df
    except Exception as e:
        st.error(f"Error executing query: {e}")
        return None
    finally:
        conn.close()
        print("Database connection closed.")

# Note: This code below is written using Claude AI.

def prepare_data(df):
    """Prepare and clean the data"""
    df.fillna("Total", inplace=True)
    return df


def visualization_1_employee_performance(df):
    """
    Visualization 1: Employee Performance Scatter Plot
    Shows total sales vs number of customers for each employee
    """
    # Aggregate data by employee
    employee_performance = df.groupby('employee').agg({
        'total_sales': 'sum',
        'customer': 'nunique'
    }).reset_index()

    fig = px.scatter(
        employee_performance,
        x='customer',
        y='total_sales',
        size='total_sales',
        color='employee',
        hover_name='employee',
        title='Employee Performance: Sales vs Customer Reach',
        labels={
            'customer': 'Number of Unique Customers',
            'total_sales': 'Total Sales'
        }
    )
    fig.update_layout()
    return fig


def visualization_2_seasonal_trends(df):
    """
    Visualization 2: Seasonal Sales Trends
    Line chart showing sales trends across months
    """
    monthly_sales = df.groupby('month')['total_sales'].sum().reset_index()

    fig = px.line(
        monthly_sales,
        x='month',
        y='total_sales',
        title='Monthly Sales Trends',
        markers=True,
        labels={'total_sales': 'Total Sales', 'month': 'Month'}
    )
    fig.update_layout()
    return fig


def visualization_3_store_customer_diversity(df):
    """
    Visualization 3: Store Customer Diversity
    Radar chart showing customer diversity and sales for each store
    """
    store_metrics = df.groupby('store').agg({
        'total_sales': 'sum',
        'customer': 'nunique',
        'employee': 'nunique'
    }).reset_index()

    fig = go.Figure()

    # Add traces for each metric
    metrics = ['total_sales', 'customer', 'employee']
    for metric in metrics:
        fig.add_trace(go.Scatterpolar(
            r=store_metrics[metric],
            theta=store_metrics['store'],
            fill='toself',
            name=metric.replace('_', ' ').title()
        ))

    fig.update_layout(
        polar=dict(radialaxis=dict(visible=True)),
        title='Store Performance Diversity Radar Chart',
    )
    return fig


def visualization_4_sales_composition(df):
    """
    Visualization 4: Comprehensive Store Sales Comparison
    Horizontal bar chart with additional metrics and annotations
    """
    # Aggregate sales data by store
    store_sales = df.groupby('store').agg({
        'total_sales': 'sum',
        'customer': 'nunique',
        'employee': 'nunique'
    }).reset_index()

    # Calculate percentage of total sales
    total_sales = store_sales['total_sales'].sum()
    store_sales['sales_percentage'] = store_sales['total_sales'] / total_sales * 100

    # Sort by total sales in descending order
    store_sales_sorted = store_sales.sort_values('total_sales', ascending=True)

    # Create horizontal bar chart
    fig = go.Figure()

    # Main sales bars
    fig.add_trace(go.Bar(
        y=store_sales_sorted['store'],
        x=store_sales_sorted['total_sales'],
        orientation='h',
        name='Total Sales',
        marker_color='lightsteelblue',
        text=[f'${val:,.0f}' for val in store_sales_sorted['total_sales']],
        textposition='outside'
    ))

    # Overlay for number of customers
    fig.add_trace(go.Bar(
        y=store_sales_sorted['store'],
        x=store_sales_sorted['customer'],
        orientation='h',
        name='Unique Customers',
        marker_color='green',
        opacity=0.5,
        text=store_sales_sorted['customer'],
        textposition='outside'
    ))

    # Update layout for better visualization
    fig.update_layout(
        title='Store Sales Performance: Sales vs Unique Customers',
        xaxis_title='Value',
        yaxis_title='Store',
        barmode='overlay',
        height=600,
        width=1000,
        bargap=0.2,
        legend_title_text='Metrics'
    )

    # Add annotations for sales percentage
    for i, row in store_sales_sorted.iterrows():
        fig.add_annotation(
            x=row['total_sales'],
            y=row['store'],
            text=f"{row['sales_percentage']:.1f}%",
            showarrow=True,
            arrowhead=1,
            ax=50,
            ay=0,
            font=dict(color='green', size=10)
        )

    return fig


def main():
    st.set_page_config(layout="wide", page_title="Multi-Perspective Sales Insights")

    # Load and prepare data
    df = load_data()
    if df is None:
        st.error("Could not load data. Please check your database connection.")
        return

    df = prepare_data(df)

    # Dashboard Title
    st.title("🔍 Multi-Perspective Sales Insights Dashboard")

    # Create four columns for visualizations
    col1, col2 = st.columns(2)
    col3, col4 = st.columns(2)

    # Visualization 1: Employee Performance
    with col1:
        st.plotly_chart(visualization_1_employee_performance(df), use_container_width=True)

    # Visualization 2: Seasonal Trends
    with col2:
        st.plotly_chart(visualization_2_seasonal_trends(df), use_container_width=True)

    # Visualization 3: Store Customer Diversity
    with col3:
        st.plotly_chart(visualization_3_store_customer_diversity(df), use_container_width=True)

    # Visualization 4: Sales Composition
    with col4:
        st.plotly_chart(visualization_4_sales_composition(df), use_container_width=True)

    # Optional: Display raw data
    if st.checkbox("Show Raw Data"):
        st.subheader("Raw Data")
        st.dataframe(df)


if __name__ == "__main__":
    main()