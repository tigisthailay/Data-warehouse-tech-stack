from datetime import datetime, timedelta

from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.utils.dates import days_ago

default_args = {
    "owner": "tg13",
    "email": ["tigisthay13@gmail.com"],
    "email_on_failaure": True,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

dag_scripts = DAG(
    dag_id="create_table_and_load_data",
    default_args=default_args,
    schedule_interval="@daily",
    start_date=days_ago(1),
    dagrun_timeout=timedelta(minutes=60),
    description="executing sql scripts",
)

create_table = PostgresOperator(
    sql="sql/table.sql",
    task_id="table_task",
    postgres_conn_id="postgres_id",
    dag=dag_scripts,
)

load_data = PostgresOperator(
    sql="sql/load.sql",
    task_id="load_task",
    postgres_conn_id="postgres_id",
    dag=dag_scripts,
)

create_table >> load
