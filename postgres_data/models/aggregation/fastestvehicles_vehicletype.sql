with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select TOP(3) vehicle_type,
        MAX(avg_speed)
    from source
    group by vehicle_type order by avg_speed desc
)
SELECT *
FROM destination