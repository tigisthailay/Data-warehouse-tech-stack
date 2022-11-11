/* this query retrives the
top three long distance traveler track-id 
and its distance from each vehicle_type.

*/
with source as (
    select *
    from {{ref('feature')}}
),
destination as (
    select TOP(3) vehicle_type,
        MAX(traveled_d) as Traveled_Distance
    from source
    group by vehicle_type order by traveled_d desc
)
SELECT *
FROM destination