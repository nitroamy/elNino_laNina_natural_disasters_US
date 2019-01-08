SELECT DATE_PART('year', year_month) AS year,
DATE_PART('month', year_month) AS month,
oni, CASE
	WHEN oni >= 0.5 THEN 'el Nino'
	WHEN oni <= -0.5 THEN 'la Nina'
	ELSE 'neutral'
END AS month_type
FROM da_climate.edited_set
ORDER BY year_month;
