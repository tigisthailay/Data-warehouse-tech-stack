## Data Engineering: Data warehouse tech stack with MySQL, DBT, Airflow

**Table of content**

- [Overview](Project overview)
- [Requirement](#requirement)
- [Install](#install)
- [Data](#data)
- [Notebooks](#notebooks)

#### Project Overview

A city traffic department wants to collect traffic data using swarm UAVs (drones) from a number of locations in the city and use the data collected for improving traffic flow in the city and for a number of other undisclosed projects. Our AI start-up is responsible for creating a scalable data warehouse that will host the vehicle trajectory data extracted by analyzing footage taken by swarm drones and static roadside cameras. 
The data warehouse should take into account future needs, organize data such that a number of downstream projects query the data efficiently. We should use the Extract Load Transform (ELT) framework using DBT.  Unlike the Extract, Transform, Load (ETL), the ELT framework helps analytic engineers in the city traffic department set-up transformation work flows on a need basis.  

#### Objective:

The objective of this project is to create a scalable data warehouse that will host the vehicle trajectory data extracted by analysing footage taken by swarm drones and static roadside cameras.


#### Requirement

```
mlflow
dvc
panda
dbt-postgres==1.0.0
dbt-rpc==0.1.1
markupsafe==2.0.1
Docker
Git

```

#### Installation

```
git clone github.com/tigisthailay/Data-warehouse-tech-stack
cd Data-warehouse-tech-stack
pip install -r requerements.txt
```
#### Data
In Downloads – pNEUMA | open-traffic (epfl.ch) you can find a pNEUMA data: pNEUMA is an open large-scale dataset of naturalistic trajectories of half a million vehicles that have been collected by a one-of-a-kind experiment by a swarm of drones in the congested downtown area of Athens, Greece. Each file for a single (area, date, time) is ~87MB data. 


##### Flow Diagram

![](screenshots/1.png)

#####  Generated Job Entity 
##### #1
![](images/tg.png)



![](images/opp.png)

#### Document Score


![](images/eda.png)

...
