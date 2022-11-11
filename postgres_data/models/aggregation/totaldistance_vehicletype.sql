with source as (
    select *
    from {{ref('vehicles_cast_feature')}}
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