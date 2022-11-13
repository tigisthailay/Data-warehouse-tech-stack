/* this query retrives the
average of verage speed traveled by tracks 
under each vehicle_type.
*/
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