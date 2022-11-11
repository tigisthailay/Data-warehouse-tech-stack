/* this query retrives the
top three fastest track-id 
and its average speed from each vehicle_type.
*/
with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select TOP(3) track_id, vehicle_type,
        MAX(avg_speed)
    from source
    group by vehicle_type order by avg_speed desc
)
SELECT *
FROM destination