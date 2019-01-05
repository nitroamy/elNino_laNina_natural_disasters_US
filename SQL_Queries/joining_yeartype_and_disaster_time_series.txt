WITH year_type AS(
  SELECT DISTINCT DATE_PART('year', year_month) AS year,
  	round(avg(oni),1) as avrg_oni
  	FROM da_climate.edited_set
  	GROUP BY 1
  	ORDER BY year
),
disaster_time_series AS(
  SELECT DATE_PART('year', year) as year, drought_count, drought_cost, flooding_count, flooding_cost,
  freeze_count, freeze_cost, severe_storm_count, severe_storm_cost,
  tropical_cyclone_count, tropical_cyclone_cost,
  winter_storm_count, winter_storm_cost, wildfire_count, wildfire_cost
  FROM da_climate.disaster_time_series
)
SELECT year_type.year, year_type.avrg_oni,
CASE
	WHEN year_type.avrg_oni >= 0.5 THEN 'el Nino'
	WHEN year_type.avrg_oni <= -0.5 THEN 'la Nina'
	ELSE 'neutral'
END AS type_of_year, disaster_time_series.drought_count, disaster_time_series.drought_cost,
disaster_time_series.flooding_count, disaster_time_series.flooding_cost,
disaster_time_series.freeze_count, disaster_time_series.freeze_cost,
disaster_time_series.severe_storm_count, disaster_time_series.severe_storm_cost,
disaster_time_series.tropical_cyclone_count, disaster_time_series.tropical_cyclone_cost,
disaster_time_series.winter_storm_count, disaster_time_series.winter_storm_cost,
disaster_time_series.wildfire_count, disaster_time_series.wildfire_cost
FROM year_type
JOIN disaster_time_series ON year_type.year = disaster_time_series.year
ORDER BY year_type.year;
