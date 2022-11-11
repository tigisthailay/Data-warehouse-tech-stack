/* this query retrives the
top three fastest and long distance travler track-id 
and its average speed and its distance from each vehicle_type.
*/

with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select TOP(3) track_id, vehicle_type, avg_speed, traveled_d as Traveled_Distance,
    from source
    group by vehicle_type order by avg_speed and traveled_d desc HAVING MAX(avg_speed) and MAX(traveled_d)
)
SELECT *
FROM destination