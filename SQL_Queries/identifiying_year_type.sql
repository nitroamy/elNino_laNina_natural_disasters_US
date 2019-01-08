WITH type_year AS (
	SELECT DISTINCT DATE_PART('year', year_month) AS year,
	round(avg(oni),1) as avrg_oni
	FROM da_climate.edited_set
	GROUP BY 1
	ORDER BY year
)
SELECT type_year.year, type_year.avrg_oni,
CASE
	WHEN type_year.avrg_oni >= 0.5 THEN 'el Nino'
	WHEN type_year.avrg_oni <= -0.5 THEN 'la Nina'
	ELSE 'neutral'
END AS year_type
FROM type_year;
