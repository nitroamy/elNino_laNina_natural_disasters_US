-- The original source of the data are http://origin.cpc.ncep.noaa.gov/products/analysis_monitoring/ensostuff/ONI_v5.php,
-- https://www.ncdc.noaa.gov/billions/events/US/1980-2018,
-- https://www.ncdc.noaa.gov/billions/time-series,
-- https://www.ncdc.noaa.gov/societal-impacts/wildfires/ytd/0?params[]=acres&params[]=fires

BEGIN;

-- add a statement to drop the da_climate.cold_warm_episodes table or delete all data from it if it exists
CREATE SCHEMA IF NOT EXISTS da_climate;

CREATE TABLE IF NOT EXISTS da_climate.cold_warm_episodes(
	year DATE,
	january DECIMAL,
	february DECIMAL,
	march DECIMAL,
	april DECIMAL,
	may DECIMAL,
	june DECIMAL,
	july DECIMAL,
	august DECIMAL,
	september DECIMAL,
	october DECIMAL,
	november DECIMAL,
	december DECIMAL);

CREATE TABLE IF NOT EXISTS da_climate.disaster_events_us(
	name TEXT,
	disaster_type TEXT,
	begin_date DATE,
	end_date DATE,
	total_cost_million_of_dollar DECIMAL,
	deaths INT);

CREATE TABLE IF NOT EXISTS da_climate.disaster_time_series(
	Year DATE,
	drought_count INT,
	drought_cost DECIMAL,
	drought_lower_75 DECIMAL,
	drought_upper_75 DECIMAL,
	drought_lower_90 DECIMAL,
	drought_upper_90 DECIMAL,
	drought_lower_95 DECIMAL,
	drought_upper_95 DECIMAL,
	flooding_count INT,
	flooding_cost DECIMAL,
	flooding_lower_75 DECIMAL,
	flooding_upper_75 DECIMAL,
	flooding_lower_90 DECIMAL,
	flooding_upper_90 DECIMAL,
	flooding_lower_95 DECIMAL,
	flooding_upper_95 DECIMAL,
	freeze_count INT,
	freeze_cost DECIMAL,
	freeze_lower_75 DECIMAL,
	freeze_upper_75 DECIMAL,
	freeze_lower_90 DECIMAL,
	freeze_upper_90 DECIMAL,
	freeze_lower_95 DECIMAL,
	freeze_upper_95 DECIMAL,
	severe_storm_count INT,
	severe_storm_cost DECIMAL,
	severe_storm_lower_75 DECIMAL,
	severe_storm_upper_75 DECIMAL,
	severe_storm_lower_90 DECIMAL,
	severe_storm_upper_90 DECIMAL,
	severe_storm_lower_95 DECIMAL,
	severe_storm_upper_95 DECIMAL,
	tropical_cyclone_count INT,
	tropical_cyclone_cost DECIMAL,
	tropical_cyclone_lower_75 DECIMAL,
	tropical_cyclone_upper_75 DECIMAL,
	tropical_cyclone_lower_90 DECIMAL,
	tropical_cyclone_upper_90 DECIMAL,
	tropical_cyclone_lower_95 DECIMAL,
	tropical_cyclone_upper_95 DECIMAL,
	wildfire_count INT,
	wildfire_cost DECIMAL,
	wildfire_lower_75 DECIMAL,
	wildfire_upper_75 DECIMAL,
	wildfire_lower_90 DECIMAL,
	wildfire_upper_90 DECIMAL,
	wildfire_lower_95 DECIMAL,
	wildfire_upper_95 DECIMAL,
	winter_storm_count INT,
	winter_storm_cost DECIMAL,
	winter_storm_lower_75 DECIMAL,
	winter_storm_upper_75 DECIMAL,
	winter_storm_lower_90 DECIMAL,
	winter_storm_upper_90 DECIMAL,
	winter_storm_lower_95 DECIMAL,
	winter_storm_upper_95 DECIMAL);

CREATE TABLE IF NOT EXISTS da_climate.wildfire(
	year_month DATE,
	number_of_fire INT,
	acres_burned INT,
	acres_burned_per_fire DECIMAL);

CREATE TABLE IF NOT EXISTS da_climate.edited_set(
	date_year_month DATE,
	oni DECIMAL);

-- Add a copy statement to load the csv data file into table statement
DELETE FROM da_climate.cold_warm_episodes;
DELETE FROM da_climate.disaster_time_series;
DELETE FROM da_climate.disaster_events_us;
DELETE FROM da_climate.wildfire;
DELETE FROM da_climate.edited_set;

COPY da_climate.cold_warm_episodes FROM '/Users/amyami/Desktop/DA_Galvanize/climateProject/cold_warm_episodes_1980-2018.csv'
WITH HEADER DELIMITER ',' CSV;

COPY da_climate.disaster_events_us FROM '/Users/amyami/Desktop/DA_Galvanize/climateProject/events-US-1980-2018.csv'
WITH HEADER DELIMITER ',' CSV;

COPY da_climate.disaster_time_series FROM '/Users/amyami/Desktop/DA_Galvanize/climateProject/disaster_time_series.csv'
WITH HEADER DELIMITER ',' CSV;

COPY da_climate.wildfire FROM '/Users/amyami/Desktop/DA_Galvanize/climateProject/wildfire_2000_2018.csv'
WITH HEADER DELIMITER ',' CSV;

COPY da_climate.edited_set FROM '/Users/amyami/Desktop/DA_Galvanize/climateProject/edited_set.csv'
WITH HEADER DELIMITER ',' CSV;

COMMIT;
