# elNino_laNina_natural_disasters_US
Galvanize Data Analytics class: final project

This is a final project to demonstrate my SQL skills using datasets related to el Nino, la Nina, and natural disasters in US from 1980 to 2017. These datasets are publicly available: [link 1](http://origin.cpc.ncep.noaa.gov/products/analysis_monitoring/ensostuff/ONI_v5.php), [link 2](https://www.ncdc.noaa.gov/billions/events/US/1980-2018), [link 3](https://www.ncdc.noaa.gov/billions/time-series), [link 4](https://www.ncdc.noaa.gov/societal-impacts/wildfires/ytd/0?params[]=acres&params[]=fires).

### Create Table and Data Import
* [Loading in Data](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/tree/master/create_table_load_data)
* [CSV files](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/tree/master/create_table_load_data/CSV%20Files)

### SQL Queries
* [Identifying year type as el Nino, la Nina, or Neutral](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/blob/master/SQL_Queries/identifiying_year_type.sql): SELECT, DISTINCT, WITH, CASE, DATE_PART, ROUND, AVG, GROUP BY, ORDER BY
* [Identifying month type as el Nino, la Nina, or Neutral](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/blob/master/SQL_Queries/identifiying_month_type.sql): SELECT, DATE_PART, CASE, ORDER BY
* [Joining Month type and wildfire tables](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/blob/master/SQL_Queries/joining_monthtype_and_wildfire_tables.sql): SELECT, DATE_PART, CASE, LEFT OUTER JOIN, WHERE, IS NOT NULL, ORDER BY
* [Joining year type and disaster time series tables](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/blob/master/SQL_Queries/joining_monthtype_and_wildfire_tables.sql): SELECT, CASE, AVG, ROUND, GROUP BY, WITH, INNER JOIN, GROUP BY, ORDER BY
* [Counting disaster event](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/blob/master/SQL_Queries/counting_severe_disaster_events_each_year.sql): WITH, SELECT, DISTINCT, AVG, ROUND, GROUP BY, CASE, SUBQUERIES, WHERE
* [Counting disaster event with the display of total damage cost and deaths](): SELECT, WITH, ROUND, AVG, GROUP BY, ORDER BY, CASE, SUBQUERIES, COUNT, SUM, WHERE
* SQL skills that were not used in this project: LIKE, HAVING, UNION

### Excel Data Presentation
* LOOKUP
* [Pivot Table](https://github.com/nitroamy/elNino_laNina_natural_disasters_US/blob/master/Excel/pivot%20table.xlsx)

### Visualizations

### A note on the data
I did need to make a few changes to the downloaded dataset in order to properly load
