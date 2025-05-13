-- 6.3. DATA CLEANING

-- 6.3.1. Remove the rows with the repeated 211 values of ride_id as it is the primary key by creating a new table with just the row where ride_id appears 1 time.

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.nv_combined_table_2024`
AS
SELECT  
 * EXCEPT(row_nmb)
FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY ride_id) AS row_nmb,
  FROM `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`
)
WHERE row_nmb = 1;

-- RESULT = 211 rows with repeated primary keys (ride_id) were removed when a new table was created that excluded the duplicate values. The name of the new table is nv_combined_table_2024.

-- 6.3.2. Remove rows with NULL values in the columns start station name/id and end station name/id that represented 28% of all the data. (1,652,169 / 5,860,357 = 0.28 x 100% = 28%)

DELETE
FROM
  `marine-access-459018-s8.2024_cyclistic_data.nv_combined_table_2024`
WHERE
  start_station_name IS NULL OR
  start_station_id IS NULL OR
  end_station_name IS NULL OR
  end_station_id IS NULL;

-- RESULT = We can see that 1,652,169 values were deleted leaving the table with just 4,208,188 rows. Then I used the query showed below to verify that there are no more nulls in the columns mentioned in the above query.

SELECT
  COUNT(*) AS number_of_nulls
FROM
  `marine-access-459018-s8.2024_cyclistic_data.nv_combined_table_2024`
WHERE
  start_station_name IS NULL OR
  start_station_id IS NULL OR
  end_station_name IS NULL OR
  end_station_id IS NULL;

-- 6.3.3. The rows with NULL values in the columns start lat/lng and end lat/lng were automatically eliminated when the rows with NULL values in the step 3.2 were deleted from the table nv_combined_table_2024.

--RESULT = I used the following query to verify that there are no more empty rows for these columns:

SELECT
  COUNT(*) AS number_of_nulls
FROM
  `marine-access-459018-s8.2024_cyclistic_data.nv_combined_table_2024`
WHERE
  start_lat IS NULL OR
  start_lng IS NULL OR
  end_lat IS NULL OR
  end_lng IS NULL;

-- 6.3.4. Convert timestamps in started_at and ended_at to the same datetime format without 6 microseconds.

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.nv2_combined_table_2024`
AS
SELECT
  ride_id,
  TIMESTAMP_TRUNC(started_at, SECOND) AS started_at,
  TIMESTAMP_TRUNC(ended_at, SECOND) AS ended_at,
  rideable_type,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM `marine-access-459018-s8.2024_cyclistic_data.nv_combined_table_2024`;

-- RESULT = The 6 microseconds in each date time format in the columns started_at and ended_at were deleted and a new table called nv2_combined_table_2024 was created with the new columns started_at_new and ended_at_new.

-- 6.3.5. Remove rows that have trips when ride time is less than 1 min and longer than 1 day.

DELETE
FROM `marine-access-459018-s8.2024_cyclistic_data.nv2_combined_table_2024`
WHERE 
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

-- RESULT = 112,383 rows from nv2_combined_table_2024 were deleted as they had ride times less than 1 minute and longer than 1 day.

-- 6.3.6. Create a column in the table for ride duration (ride_length), day of the week that each ride started (day_of_week) and month that each bike was ridden (month).

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
AS
SELECT
*,
TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes,
FORMAT_DATE('%A', started_at) AS day_of_week_trip_started, --A% formats the date to show the full weekday name (english).
FORMAT_DATE('%B', started_at) AS month_of_trip, --B% formats the date to show the full month name (english)
FROM `marine-access-459018-s8.2024_cyclistic_data.nv2_combined_table_2024`

-- RESULT = The query created three new columns in the table nv3_combined_table_2024 that show the ride duration in minutes (ride_length), the day of the week that each ride started and the month each bike was ridden (month).

-- The original table had 5,860,568 rows of data. The table now has 4,095,805 clean rows of data to analyze. 1,764,763 rows were deleted for better analysis.
