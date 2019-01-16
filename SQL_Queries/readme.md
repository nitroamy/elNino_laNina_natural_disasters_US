### Identifying type of year/month as el Nino, la Nina, or neutral
In order to identifying type of year/month, I used 'oni', which is the abbreviation of the term "Oceanic Nino Index." ONI is one of the primary indices used to monitor the El Nino-Southern Oscillation (ENSO). The ONI is calculated by averaging sea surface temperature anomalies in an area of the east-central equatorial Pacific Ocean, which is called the Nino-3.4 region (5S to 5N; 170W to 120W). Also, a 3-month time average (running mean) is calculated in order to better isolate variability closely related to the ENSO phenomenon. [source](https://catalog.data.gov/dataset/climate-prediction-center-cpcoceanic-nino-index)
* oni value greater than 0.4 is considered as el Nino
* oni value between -0.4 and 0.4 is considered as neutral
* oni value less than -0.4 is considered as la Nina

CASE statement evaluate oni values to show the type of year/month of each year (if it was in table with year only) or month (if it was in table with both month and year)


### Joining tables
* Type of year and natural disaster time series from 1980 to 2018: To calculate average "oni" for each year, I created a common table expression. Initial trial of using AVG and CASE together gave me error, so instead of using them together within one SELECT query, I created two temporary table handling all the calculation, then simply pulling the calculated values (average oni) for CASE statement and joining tables. For this joining, I used INNER JOIN.
* Type of month and wildfire time series from 2000 to 2018: I used LEFT OUTER JOIN to join two table together. I eliminated rows with null by using WHERE clause with IS NOT NULL
