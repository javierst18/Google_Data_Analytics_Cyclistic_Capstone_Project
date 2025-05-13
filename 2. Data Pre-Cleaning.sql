--6.2. DATA PRE-CLEANING

--6.2.1.Check if ride_id has the same length in all the tables as it is the primary key.

SELECT 
  COUNT(*) AS number_of_rows, LENGTH(ride_id) AS lentgh_ride_id,
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024` 
GROUP BY 
  LENGTH(ride_id);

-- RESULT = In the 5,860,568 row ride_id has 16 characters.

--6.2.2. Check if ride_id is a unique value with the DISTINCT function in SQL.

SELECT
  COUNT(DISTINCT ride_id) as ride_id_count
FROM
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`; 

-- RESULT = Of the 5,860,568 rows in the ride_id column just 5,860,357 are unique. Leaving a total of 211 repeated values.

--6.2.3. Checking the 211 repeated values for ride_id. These values will need to be cleaned.

SELECT
  ride_id, COUNT(*) AS number_of_rides
FROM
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024` 
GROUP BY
  ride_id
HAVING
  COUNT(*) > 1;

-- RESULT = The query showed there are 211 repeated values for ride_id. These values will need to be cleaned for better results.

--6.2.4. Check the types of bikes in the column rideable_types.

SELECT
  DISTINCT(rideable_type)
FROM
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`;

-- RESULT = The query showed there are three types of bikes in the table combined_table_2024: electric bike, electric scooter and classic bike.

--6.2.5. Check NULL values in start station name & id, end station name & id, latitude and longitude.

SELECT
  COUNT(*) AS number_of_nulls
FROM
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`
WHERE
  start_station_name IS NULL OR
  start_station_id IS NULL OR
  end_station_name IS NULL OR
  end_station_id IS NULL OR
  start_lat IS NULL OR
  start_lng IS NULL OR
  end_lat IS NULL OR
  end_lng IS NULL;

-- RESULT = There are 1,652,259 rows with NULL values in the above mentioned columns. These rows will be cleaned because starting and ending stations are required for the analysis and latitude and longitude as they specify a geographic location for the rides. 

--6.2.6. Confirm there are only two types of members in the members column (casual rider and annual member)

SELECT
  DISTINCT(member_casual)
FROM
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`;

-- RESULT = The hypothesis is confirmed by the query. The only values in this column are 'member' or 'casual'.

--6.2.7. Check the start and end station name columns for inconsistencies within the names.

SELECT 
  COUNT(*) as start_station_cnt,
  start_station_name
FROM
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`
GROUP BY 
  start_station_name
ORDER BY 
  start_station_cnt DESC;

SELECT 
  COUNT(*) as end_station_cnt,
  end_station_name
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`
GROUP BY 
  end_station_name
ORDER BY 
  end_station_cnt DESC;

-- RESULT = There are 1,073,951 null values in the start station name column. There are 1,104,653 null values in the end station names column.

--6.2.8. The timestamps in started_at and ended_at are in different time formats because some are in UTC with 6 microseconds and other ones are in UTC without microseconds.

--6.2.9. Check the columns started_at and ended_at to see how many trips are shorter than 1 minute and how many are longer than 1 day so I can delete them in the cleaning process.

SELECT 
  COUNT(*) AS trips_less1min_long1day
FROM  
  `marine-access-459018-s8.2024_cyclistic_data.combined_table_2024`
WHERE 
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

-- RESULT = There are 250,270 trips shorter than 1 min and longer than 1 day. These will have to be deleted in the cleaning phase.
