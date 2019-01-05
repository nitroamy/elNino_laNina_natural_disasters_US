SELECT DATE_PART('year', es.year_month) AS year,
DATE_PART('month', es.year_month) AS month,
es.oni,
CASE
	WHEN oni >= 0.5 THEN 'el Nino'
	WHEN oni <= -0.5 THEN 'la Nina'
	ELSE 'neutral'
END AS month_type,
wf.number_of_fire, wf.acres_burned_per_fire
FROM da_climate.edited_set as es
LEFT OUTER JOIN da_climate.wildfire as wf ON
es.year_month = wf.year_month
WHERE wf.year_month IS NOT NULL
ORDER BY es.year_month;
