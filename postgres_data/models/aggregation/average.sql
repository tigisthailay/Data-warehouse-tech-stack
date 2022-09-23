with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select vehicle_type,
        AVG(avg_speed)
    from source
    group by vehicle_type
)
SELECT *
FROM destination