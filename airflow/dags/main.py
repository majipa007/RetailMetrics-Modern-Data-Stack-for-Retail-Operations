from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.operators.dummy import DummyOperator


default_args={
    "depends_on_past": False,
    "email": ["sulavstha007@gmail.com"],
    "email_on_failure": True,
    "email_on_retry": False,
    "retries": 0,
    "retry_delay": timedelta(minutes=5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
    # 'wait_for_downstream': False,
    # 'sla': timedelta(hours=2),
    # 'execution_timeout': timedelta(seconds=300),
    # 'on_failure_callback': some_function, # or list of functions
    # 'on_success_callback': some_other_function, # or list of functions
    # 'on_retry_callback': another_function, # or list of functions
    # 'sla_miss_callback': yet_another_function, # or list of functions
    # 'on_skipped_callback': another_function, #or list of functions
    # 'trigger_rule': 'all_success'
}

with DAG(
    dag_id="main",
    default_args = default_args,
    description='full etl to viz pipeline',
    schedule=timedelta(days=1),
    start_date = datetime(2025, 1, 1),
    catchup=False,
    tags = ["main"]
) as dag:
    start = DummyOperator(
        task_id = 'start'
    )

    # DBT debug task
    dbt_debug = BashOperator(
        task_id='dbt_debug',
        bash_command='cd /opt/airflow/retail_dbt_project && dbt debug --config-dir'
    )

    # DBT debug task
    dbt_run_staging = BashOperator(
        task_id='dbt_run_staging',
        bash_command='cd /opt/airflow/retail_dbt_project && dbt run --models staging'
    )

    # DBT debug task
    dbt_test_staging = BashOperator(
        task_id='dbt_test_staging',
        bash_command='cd /opt/airflow/retail_dbt_project && dbt test --models staging'
    )

    end = DummyOperator(
        task_id='end'
    )

    start >> dbt_debug >> dbt_run_staging >> end