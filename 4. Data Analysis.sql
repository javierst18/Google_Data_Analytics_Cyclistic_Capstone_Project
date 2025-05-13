-- 7. DATA ANALYSIS

-- 7.1. Bike types used by each type of rider

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.1_type_of_ride` AS
SELECT
  COUNT(rideable_type) AS number_of_rides,
  rideable_type AS type_of_bike,
  member_casual as type_of_user
FROM  
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  rideable_type,
  member_casual
ORDER BY
  type_of_user ASC,
  number_of_rides DESC;

-- 4.2. The number of rides per month by each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.2_rides_per_month` AS
SELECT
  COUNT(*) AS num_of_rides,
  member_casual AS type_of_user,
  month_of_trip
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  member_casual,
  month_of_trip
ORDER BY
  type_of_user DESC,
  num_of_rides DESC;

-- 4.3. The number of rides per day by each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.3_rides_per_day` AS
SELECT
  COUNT(*) AS num_of_rides,
  member_casual AS type_of_user,
  day_of_week_trip_started,
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  type_of_user,
  day_of_week_trip_started
ORDER BY
  type_of_user DESC,
  num_of_rides DESC;

-- 4.4. Number of trips per rider and average ride_length (min) by each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.4_num_rides_and_avg_ride_length` AS
SELECT
  COUNT(*) AS num_of_rides,
  ROUND(AVG(ride_length_minutes)) AS avg_ride_length,
  member_casual AS type_of_user
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  type_of_user;

-- 4.5. Average ride_length per month by each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.5_avg_ride_length_per_month` AS
SELECT
  member_casual AS type_of_user,
  month_of_trip,
  ROUND(AVG(ride_length_minutes)) AS avg_ride_length
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  type_of_user,
  month_of_trip
ORDER BY
  type_of_user DESC,
  avg_ride_length DESC;

-- 4.6. Average ride_length per day of the week by each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.6_avg_ride_length_per_day` AS
SELECT
  member_casual AS type_of_user,
  day_of_week_trip_started AS day_of_week,
  ROUND(AVG(ride_length_minutes)) AS avg_ride_length
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  type_of_user,
  day_of_week_trip_started
ORDER BY
  type_of_user DESC,
  avg_ride_length DESC;

-- 4.7. The maximum ride length per month for each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.7_max_ride_length_per_month` AS
SELECT
    member_casual AS type_of_user,
  MAX(ride_length_minutes) AS max_ride_length_per_month,
  month_of_trip
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  type_of_user,
  month_of_trip
ORDER BY
  type_of_user DESC,
  max_ride_length_per_month DESC;

-- 4.8. The maximum ride length per day for each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.8_max_ride_length_per_day` AS
SELECT
  member_casual AS type_of_user,
  MAX(ride_length_minutes) AS max_ride_length_per_day,
  day_of_week_trip_started
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY
  type_of_user,
  day_of_week_trip_started
ORDER BY
  type_of_user DESC,
  max_ride_length_per_day DESC;
  
-- 4.9. Starting locations for each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.9_starting_locations_per_user` AS
SELECT 
  start_station_name, 
  member_casual AS type_of_user,
  ROUND(AVG(start_lat),6) AS start_lat, 
  ROUND(AVG(start_lng),6) AS start_lng,
  COUNT(*) AS total_trips
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY 
  start_station_name, 
  type_of_user
ORDER BY
  type_of_user DESC,
  total_trips DESC;

-- 4.10. Ending locations for each type of user

CREATE TABLE `marine-access-459018-s8.2024_cyclistic_data.10_ending_locations_per_user` AS
SELECT 
  end_station_name, 
  member_casual AS type_of_user,
  ROUND(AVG(end_lat),6) AS end_lat, 
  ROUND(AVG(end_lng),6) AS end_lng,
  COUNT(*) AS total_trips
FROM 
  `marine-access-459018-s8.2024_cyclistic_data.nv3_combined_table_2024`
GROUP BY 
  end_station_name, 
  type_of_user
HAVING
  type_of_user = 'casual'
ORDER BY
  type_of_user DESC,
  total_trips DESC
