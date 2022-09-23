from datetime import datetime, timedelta
from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.utils.dates import 

default_args = {
    "owner": "tegisty",
    "email": ["tigisthay13@gmail.com"],
    "email_on_failaure": True,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

dag_exec = DAG(
    dag_id="create_t_and_load_data",
    default_args=default_args,
    schedule_interval="@daily",
    start_date=days_ago(1),
    dagrun_timeout=timedelta(minutes=60),
    description="executing the sql scripts",
)

create_table = PostgresOperator(
    sql="sql/table_create.sql",
    task_id="createtable_task",
    postgres_conn_id="dwh",
    dag=dag_exec,
)

load_data = PostgresOperator(
    sql="sql/table_load_data.sql",
    task_id="load_data_task",
    postgres_conn_id="dwh",
    dag=dag_exec,

create_table >> load_data