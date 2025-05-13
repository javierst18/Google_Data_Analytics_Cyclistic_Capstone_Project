-- 6.1. DATA COMBINING

-- Combine data into one table

CREATE TABLE `2024_cyclistic_data.combined_table_2024` AS (
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.01_divy-tripdata_01-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.02_divy-tripdata-02-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.03_divy-tripdata-03-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.04_divy-tripdata-04-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.05_divy-tripdata-05-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.06_divy-tripdata-06-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.07_divy-tripdata-07-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.08_divy-tripdata-08-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.09_divy-tripdata-09-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.10_divy-tripdata-10-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.11_divy-tripdata-11-2024` UNION ALL
  SELECT * FROM `marine-access-459018-s8.2024_cyclistic_data.12_divy-tripdata-12-2024` );
