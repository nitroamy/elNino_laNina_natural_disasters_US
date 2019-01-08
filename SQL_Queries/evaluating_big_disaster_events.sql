WITH big_disaster_events AS (
SELECT DATE_PART('year', begin_date) AS year,
DATE_PART('month', begin_date) AS month,
disaster_type, name, total_cost_million_of_dollar, deaths,
FROM da_climate.disaster_events_us
ORDER BY year, month
),
calculation AS (
SELECT DISTINCT DATE_PART('year', begin_date) AS year,
(SELECT COUNT(*) from da_climate.disaster_events_us where disaster_type like 'Drought') as Drought_count,
(SELECT COUNT(*) from da_climate.disaster_events_us where disaster_type like 'Flooding') as flooding_count,
(SELECT COUNT(disaster_type) from da_climate.disaster_events_us where disaster_type like 'Freeze') as freeze_count,
(SELECT COUNT(disaster_type) from da_climate.disaster_events_us where disaster_type like 'Severe%') as severe_storm_count,
(SELECT COUNT(disaster_type) from da_climate.disaster_events_us where disaster_type like 'Tropical%') as tropical_cyclone_count,
(SELECT COUNT(disaster_type) from da_climate.disaster_events_us where disaster_type like 'Wildfire') as wildfire_count,
(SELECT COUNT(disaster_type) from da_climate.disaster_events_us where disaster_type like 'Winter%') as winter_storm_count
FROM da_climate.disaster_events_us
GROUP BY 1
)
