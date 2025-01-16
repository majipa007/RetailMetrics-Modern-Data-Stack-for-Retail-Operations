FROM apache/airflow:latest

USER root

RUN apt-get update && \
    apt-get -y install git && \
    apt-get clean

USER airflow

RUN pip install --no-cache-dir \
    dbt-core \
    dbt-postgres \
    pandas \
    psycopg2-binary \
    apache-airflow-providers-postgres
