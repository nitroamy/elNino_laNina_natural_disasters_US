WITH year_type AS(
  SELECT DISTINCT DATE_PART('year', year_month) AS year,
  	round(avg(oni),1) as avrg_oni
  	FROM da_climate.edited_set
  	GROUP BY 1
  	ORDER BY year
)
select year_type.year,year_type.avrg_oni,
CASE
	WHEN year_type.avrg_oni >= 0.5 THEN 'el Nino'
	WHEN year_type.avrg_oni <= -0.5 THEN 'la Nina'
	ELSE 'neutral'
END AS type_of_year,
(SELECT count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year) as Total_disaster_count,
(select count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year and disaster_type like 'Drought%') as Drought_count,
(SELECT count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year and disaster_type like 'Flooding') as flooding_count,
(SELECT count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year and disaster_type like 'Freeze') as freeze_count,
(SELECT count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year and disaster_type like 'Severe%') as severe_storm_count,
(SELECT count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year and disaster_type like 'Tropical%') as tropical_cyclone_count,
(SELECT count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year and disaster_type like 'Wildfire') as wildfire_count,
(SELECT count(disaster_type) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year and disaster_type like 'Winter%') as winter_storm_count
from year_type;
