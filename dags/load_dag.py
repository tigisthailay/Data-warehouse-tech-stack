#Importing modules

from datetime import datetime, timedelta
from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.utils.dates import 

#Define default and DAG-specific arguments

default_args = {
    "owner": "tegisty",
    "email": ["tigisthay13@gmail.com"],
    "email_on_failaure": True,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

# Instantiate a DAG
# Give the DAG name, configure the schedule, and set the DAG settings
dag_exec = DAG(
    dag_id="postgresoperator_demo",
    default_args=default_args,
    schedule_interval="@daily",
    start_date=days_ago(1),
    dagrun_timeout=timedelta(minutes=60),
    description="use case of psql operator in airflow",
)

# Set the Tasks
create = PostgresOperator(
    sql="sql/create.sql",
    task_id="createtable_task",
    postgres_conssn_id="dwh",
    dag=dag_exec,
)

insert = PostgresOperator(
    sql="sql/insert.sql",
    task_id="insert_data_task",
    postgres_conn_id="dwh",
    dag=dag_exec,
# Setting up Dependencies
create >> insert

if __name__ == "__main__":
    dag_exec.cli()