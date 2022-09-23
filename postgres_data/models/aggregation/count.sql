with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select vehicle_type,
        COUNT(*)
    from source
    group by vehicle_type
)
SELECT *
FROM destination