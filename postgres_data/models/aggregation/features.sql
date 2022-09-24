with source as (
    select *
    from {{ source('traffic_db', 'traffic_table') }}
),
destination as (
    select id,
        track_id,
        vehicle_type,
        cast(traveled_d as float) as traveled_d,
        avg_speed,
        lat,
        lon,
        speed,
        loan_acc,
        lat_acc,
        record_time
    from source
)
SELECT *
FROM destination