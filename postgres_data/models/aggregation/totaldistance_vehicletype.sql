with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select 
    vehicle_type,
    SUM(traveled_d)
    from feature
    group by
    vehicle_type 

)
SELECT *
FROM destination