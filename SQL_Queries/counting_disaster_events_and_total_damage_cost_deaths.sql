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
(SELECT SUM(total_cost_million_of_dollar) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year) as Total_damage_cost,
(SELECT SUM(deaths) from da_climate.disaster_events_us where date_part('year', begin_date) = year_type.year) as Total_deaths
from year_type;
