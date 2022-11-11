/* this query retrives the
number of track(track_id) under each vehicle_type.
*/
with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select vehicle_type,
        COUNT(track_id)
    from source
    group by vehicle_type
)
SELECT *
FROM destination


