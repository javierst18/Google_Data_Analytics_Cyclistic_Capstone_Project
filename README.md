# Google Data Analytics Case Study: Cyclistic - How Does a Bike-Share Navigate Speedy Success

**Date:** 05/13/2025

**Author:** Javier Salazar Tuchez

## 1. INTRODUCTION

The Cyclistic bike share case analysis is my capstone project from the Google Data Analytics Certificate. Throughout this project I perform my job as a junior data analyst for a fictional company called Cyclistic to answer questions from different stakeholders. I followed the data analysis process steps: ask, prepare, analyze, share and act.

## Links and Soucers

**Data Source:** [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 05/05/25]

**Project Source:** Google Data Analytics Certificate Program. Coursera. Course 8. Module 2. Capstone Project. “How Does a Bike-Share Navigate Speedy Success”. 2025. [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

**SQL Queries:**

1. [Data Combining](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/1.%20Data%20Combining.sql)
2. [Data Pre-Cleaning](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/2.%20Data%20Pre-Cleaning.sql)
3. [Data Cleaning](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/3.%20Data%20Cleaning.sql)
4. [Data Analysis](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/4.%20Data%20Analysis.sql)

**Data Visualization:** [Tableau](https://public.tableau.com/app/profile/javier.salazar.tuchez/viz/GoogleDataAnalyticsCertificate-AnalysisCyclistic2024-CapstoneProject/1_BikeTypes#1)

## 2. BACKGROUND

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. 

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## 3. SCENARIO

I am a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. My team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my data analyst team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## 4. ASK PHASE

### 4.1. What is the problem I am trying to solve?

Cyclistic has established its brand in Chicago's bike users through the past years and wants to follow a path for the future success of the company. The director of marketing believes a good strategy for the company's growth will be designing a marketing strategy to convert casual riders into annual members.

### 4.2. How can your insights drive business decisions?

I will collect and analyze the bike usage from the previous 12 months (January 2024 - December 2024) to analyze and identify trends that determine insights related to the bikes usage and the difference between casual riders and annual members to better determine how to make an efficient campaign to convert the first ones into the second ones.

### 4.3. Identify the business task

Deliver recommendations for the growth of Cyclistic related to the efficiency of the marketing strategy backed up with compelling data insights obtained from the analysis of the 12 previous months of bike usage of the casual riders and annual members in Chicago city.

### 4.4. Consider key stakeholders

Lily Moreno - Director of Marketing: my manager and the responsible for the development of campaigns and initiatives to promote the bike-share program. Including email, social media, and other channels.
Cyclistic Marketing Analytics Team: team of data analysts responsible for collecting, analyzing and reporting data that helps the Cyclistic marketing strategy.
Cyclistic Executive Team: responsibles for deciding whether to approve recommended marketing programs.

### 4.5. A clear statement of the business task

Determine how we can convert casual riders into annual members analyzing how they use Cyclistic bikes differently.

Three questions will guide the future marketing program:
 + How do annual members and casual riders use Cyclistic bikes differently?
 + Why would casual riders buy Cyclistic annual memberships?
+ How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

## 5. PREPARE PHASE

### 5.1. Where is your data located?

I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2024 to Dec 2024. The data is publicly available at [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).

### 5.2. How is the data organized?

I downloaded 12 CSV files from the year 2024 and named them with the following nomenclature: 0X_divy-tripdata_0Y-2024 being the first X a variable for the number of the file and Y the number of the month of the year. Each file includes information for one month of 2024, such as the ride id (our primary key), bike type, start time, end time, start station, end station, start location, end location, and if the rider is a member or casual rider.

### 5.3. Are there issues with bias or credibility in this data? Does your data ROCCC?

The data is reliable (unbiased), original and comprehensive, current (2024) and cited (good source).

### 5.4. How are you addressing licensing, privacy, security, and accessibility?

I have confirmed the validity of this source and it is reliable. I also cited the source where I got the information of Cyclistic and the data I used.

### 5.5. How did you verify the data’s integrity?

The data’s integrity has been verified by analyzing the source and the veracity of the data through observation and exploration.

### 5.6. How does it help you answer your question?

This data will help me establish how riders purchase the service and observe relevant differences between all of them to obtain conclusions.

### 5.7. Are there any problems with the data?

Some categories like the start station name and end station name have null values in different months. 

## 6. PROCESS PHASE

I downloaded the bike trips data sets from January, 2024 to December, 2024 and pre cleaned for analysis. I chose to work with BigQuery’s SQL to process the data because it is a large dataset with more than 5 million rows and I needed to combine it into one single table and the spreadsheet software can not run this size of information.

### 6.1. DATA COMBINING 

**SQL Query:** [Data Combining](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/1.%20Data%20Combining.sql)

The first step was uploading the 2024 bike trips data to BigQuery. I combined the 12 months tables into one table named combined_table_2024 that contains 5,860,568 rows of data.

### 6.2. DATA PRE-CLEANING

**SQL Query:** [Data Pre-Cleaning](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/2.%20Data%20Pre-Cleaning.sql)

Before doing the cleaning in the process phase I explored the data to check for general inconsistencies to see what needs to be cleaned (pre-cleaning process)

#### 6.2.1. Check if ride_id has the same length in all the tables as it is the primary key.

<img width="247" alt="1" src="https://github.com/user-attachments/assets/7b73027b-a1ae-4b39-b000-9170b99e62f1" />

RESULT = In the 5,860,568 rows ride_id has 16 characters.

#### 6.2.2. Check if ride_id is a unique value with the DISTINCT function in SQL.

<img width="166" alt="2" src="https://github.com/user-attachments/assets/7f7a72d6-f81d-4af5-9ce7-a50ca0721d55" />

RESULT = Of the 5,860,568 rows in the ride_id column just 5,860,357 are unique values. Leaving a total of 211 repeated values.

#### 6.2.3. Checking the 211 repeated values for ride_id.

<img width="221" alt="3" src="https://github.com/user-attachments/assets/2ada3b9d-361c-4029-a2c2-4a02bde8d3bb" />

RESULT = The query showed there are 211 repeated values for ride_id. These values will need to be cleaned to work with a primary ID and avoid bias.

#### 6.2.4. Check the types of bikes in the column rideable_types.

<img width="197" alt="4" src="https://github.com/user-attachments/assets/011cb638-8a3c-4a95-9952-4ebb445d4c10" />

RESULT = The query showed there are three types of bikes in the table combined_table_2024: electric bike, electric scooter and classic bike.

#### 6.2.5. Check NULL values in start station name & id, end station name & id, latitude and longitude.

<img width="158" alt="5" src="https://github.com/user-attachments/assets/ec494e0a-a60a-4e35-9644-ff6e6a8bc39b" />

RESULT = There are 1,652,259 rows with NULL values in the above mentioned columns. These rows will be cleaned because starting and ending stations are required for the analysis, also latitude and longitude as they specify a geographic location for the rides. 

#### 6.2.6. Confirm there are only two types of members in the members column (casual rider and annual member)

<img width="230" alt="6" src="https://github.com/user-attachments/assets/61221934-62ef-43d9-8bc3-8309b6d4ce4a" />

RESULT = The hypothesis is confirmed by the query. The only values in this column are 'member' or 'casual'.

#### 6.2.7. Check the start and end station name columns for inconsistencies within the names.

RESULT = 

The top five start station names are the following with null having 1,073,951 values.

<img width="316" alt="7 1" src="https://github.com/user-attachments/assets/76011d80-fc19-41e0-943c-0b73f1b7d3d6" />

The top five end station names are the following with null having 1,104,653 values.

<img width="307" alt="7 2" src="https://github.com/user-attachments/assets/6f367f69-a0e5-4c1c-88cd-047528aae523" />

#### 6.2.8. The timestamps in started_at and ended_at are in different time formats because some are in UTC with 6 microseconds and other ones are in UTC without microseconds. 

<img width="243" alt="8" src="https://github.com/user-attachments/assets/38376ce1-1d94-44fd-9cb9-b4d71f33a9e0" />

#### 6.2.9. Check the columns started_at and ended_at to see how many trips are shorter than 1 minute and how many are longer than 1 day so I can delete them in the cleaning process.

<img width="221" alt="9" src="https://github.com/user-attachments/assets/d768648d-ae41-4c70-8546-01bee1cfbe7d" />

RESULT = There are 250,270 trips shorter than 1 min and longer than 1 day. These will have to be deleted in the cleaning phase.

### 6.3. DATA CLEANING

**SQL Query:** [Data Cleaning](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/3.%20Data%20Cleaning.sql)

Once I pre cleaned and understood the data I proceeded to the cleaning phase where I ensured the data was cleaned and ready to be analyzed and visualized.

#### 6.3.1. Remove the rows with the repeated 211 values of ride_id as it is the primary key by creating a new table with just the row where ride_id appears 1 time.

RESULT = 211 rows with repeated primary keys (ride_id) were removed when a new table was created that excluded the duplicate values. The name of the new table is nv_combined_table_2024.

#### 6.3.2. Remove rows with NULL values in the columns start station name/id and end station name/id that represented 28% of all the data. (1,652,169 / 5,860,357 = 0.28 x 100% = 28%)

<img width="477" alt="2" src="https://github.com/user-attachments/assets/022f9ff0-1d8f-43e0-b688-cb1cfb053b56" />

RESULT = We can see that 1,652,169 values were deleted leaving the table with just 4,208,188 rows. I used another query to verify that there are no more nulls in the columns mentioned in this section.

#### 6.3.3. The rows with NULL values in the columns start lat/lng and end lat/lng were automatically eliminated when the rows with NULL values in the step 3.2 were deleted from the table nv_combined_table_2024.

<img width="165" alt="3" src="https://github.com/user-attachments/assets/40ac5645-112c-432f-a2c5-40013db83d16" />

RESULT = I used a query to verify that there are no more empty rows for these columns.

#### 6.3.4. Convert timestamps in started_at and ended_at to the same datetime format without 6 microseconds.

<img width="470" alt="4" src="https://github.com/user-attachments/assets/0b627890-4d9e-409e-b631-961b8bc39746" />

RESULT = The 6 microseconds in each date time format in the columns started_at and ended_at were deleted and a new table called nv2_combined_table_2024 was created with updated started_at and ended_at columns.

#### 6.3.5. Remove rows that have trips when ride time is less than 1 min and longer than 1 day.

<img width="477" alt="5" src="https://github.com/user-attachments/assets/54c0ebaa-0f7a-4004-9794-4f52cbad994c" />

RESULT = 112,383 rows from nv2_combined_table_2024 were deleted as they had ride times less than 1 minute and longer than 1 day.

#### 6.3.6. Create a column in the table for ride duration (ride_length), day of the week that each ride started (day_of_week) and month that each bike was ridden (month).

<img width="472" alt="6" src="https://github.com/user-attachments/assets/0931da08-d5d9-451b-8a6b-498fac29d1b1" />

RESULT = The query created three new columns in the table nv3_combined_table_2024 that show the ride duration in minutes (ride_length), the day of the week that each ride started and the month each bike was ridden (month).

The original table had 5,860,568 rows of data. The table now has 4,095,805 clean rows of data to analyze. 1,764,763 rows were deleted for better analysis and to avoid bias.

## 7. ANALYSIS PHASE

**SQL Query:** [Data Analysis](https://github.com/javierst18/Google_Data_Analytics_Cyclistic_Capstone_Project/blob/main/4.%20Data%20Analysis.sql)

I started analyzing the previously cleaned data to see how annual members differentiate from casual riders. 

I created many tables to calculate the percentages of different bikes usage per user, the mean and max of the ride_length column for each type of rider, the average ride length for users by day of the week and month, the number of rides per user by day of week and month, and others.

### 7.1. Bike types used by each type of rider

<img width="333" alt="1" src="https://github.com/user-attachments/assets/74388056-ea6c-4a93-aba3-5cfc2266dd53" />

### 7.2. The number of rides per month by each type of user

<img width="362" alt="2" src="https://github.com/user-attachments/assets/f739cc35-8d03-4901-b544-de26820efc3f" />

### 7.3. The number of rides per day by each type of user

<img width="314" alt="3" src="https://github.com/user-attachments/assets/b42b2bf7-cbad-4170-9545-f2a0c7f3f11a" />

### 7.4. Number of trips per rider and average ride_length (min) by each type of user 

<img width="442" alt="4" src="https://github.com/user-attachments/assets/6fcae8c6-357d-414a-b294-e9436f11a7eb" />

### 7.5. Average ride_length per month by each type of user

<img width="404" alt="5" src="https://github.com/user-attachments/assets/f1cc222b-edfe-42fb-86e3-6e04ce1e8c86" />

### 7.6. Average ride_length per day of the week by each type of user

<img width="327" alt="6" src="https://github.com/user-attachments/assets/e26dee98-32df-4ea3-98f3-d44ac6d45f62" />

### 7.7. The maximum ride length per month for each type of user

<img width="308" alt="7" src="https://github.com/user-attachments/assets/e3376c09-2980-47b7-a683-502539e50391" />

### 7.8. The maximum ride length per day for each type of user

<img width="353" alt="8" src="https://github.com/user-attachments/assets/22120ff9-e91a-4c2a-a9c0-19fc67f2a672" />

### 7.9. Starting locations for each type of user

<img width="473" alt="9" src="https://github.com/user-attachments/assets/4b25f561-446a-4f50-8358-969191bd83ad" />

### 7.10. Ending locations for each type of user

<img width="472" alt="10" src="https://github.com/user-attachments/assets/6787c837-b53b-4257-8dd6-2b87aa1a3961" />

## 8. SHARE PHASE

**Data Visualization:** [Tableau](https://public.tableau.com/app/profile/javier.salazar.tuchez/viz/GoogleDataAnalyticsCertificate-AnalysisCyclistic2024-CapstoneProject/1_BikeTypes#1).

In this phase I created visualizations with Tableau to present the analysis to the stakeholders. After each visualization is a short summary of the analysis made to better understand each graph or chart.

If you want to check all the visualizations and interact with them you can check my Tableau Profile clicking [here](https://public.tableau.com/app/profile/javier.salazar.tuchez/viz/GoogleDataAnalyticsCertificate-AnalysisCyclistic2024-CapstoneProject/1_BikeTypes#1).

### 8.1. Comparison of casual riders and annual members by the type of bike they use in 2024.

![1  Bike Types](https://github.com/user-attachments/assets/878a023d-a749-4fa0-8ec3-bbad9e8fbc67)

First of all, I compared the two types of users by the kind of bikes they ride, with the number of rides per bike type. We can observe that the most used bike is the classic bike with 2,667,514 rides, which represents 65% of the total 4,095,805 trips during 2024. In second place, we have the rides with an electric bike with 1,382,398 rides, which represents 34% of the total trips, and in last place, the electric scooter with just 1% of the rides (45,893 rides).

Members often take more rides than casual riders with classic and electric bikes, but casual riders prefer electric scooters approximately 17% more times compared to annual members.
We can also infer that the most used bike by both types of users is the classic bike. This could be due to the familiarity with the bike or that they prefer this type of bike for exercise when they ride it. Also, scooters are probably not used that much because they are a new type, recently introduced, and people may tend to feel safer on a bike.

### 8.2. Total bike trips in 2024 per type of user.

![2  Total Bike Rides](https://github.com/user-attachments/assets/e271be11-343d-4d2f-84dd-5bd9767a3e50)

Annual members made up 63.63% of all trips during 2024, whereas casual riders made up 36.37% of all the rides. Members tend to use Cyclistic bikes more, and there is potential for a lot of casual riders to get a subscription.

### 8.3. Total bike trips in 2024 per month and type of user.

![3  Rides Per Month](https://github.com/user-attachments/assets/36e597db-c490-48f6-90c2-2508a3fa1757)

We can observe in the above chart that both annual members and casual riders show a similar behavior during the whole year. Members tend to make more rides each month compared to casual riders, but both users have more rides during the warm months (spring and summer) and fewer rides in cold months. We can see the most similar number of rides for both users during July.

The maximum number of rides, 312,989, is accounted to the members in September. The minimum number of rides is 17,108 in January for the casual riders. The chart reflects that Cyclistic has more member rides than casual and despite the weather in colder months they still ride more because they probably live in the city and use the service to commute to work.

### 8.4. Total bike trips in 2024 per day of the week and type of user.

![4  Rides Per Day](https://github.com/user-attachments/assets/2b0ed199-0d05-48c8-88cd-65be07128d0d)

During the week, members use the Cyclistic service more times than casual riders. Interestingly, the number of rides for annual members decreases over the weekend in comparison to the rides for casual users that increase at the same time. Another observation is that the gap between the two types of rides becomes smaller during the weekends, especially on Saturdays. 

We can conclude from this analysis that members may be using the Cyclistic service for commuting to work on the weekdays, while casual users may be using bikes more over the weekends for recreational activities, and that some of them are probably tourists.

### 8.5. Average bike ride duration in minutes for each type of user in 2024.

![5  Avg Ride Length Per User](https://github.com/user-attachments/assets/a5f86bc2-39b9-4b22-8dba-98d22f919e2a)

We can determine that the average ride duration for members, 12 minutes, is smaller compared to the casual riders average, 24 minutes. This data reflects that casual riders buy the service less but use it for more time probably because they are riding for leisure and to discover and explore Chicago, while the member’s average reflects that they probably use the service just for errands or to commute to work because they are residents.

### 8.6. Average bike ride duration in minutes per month for each type of user in 2024.

![6  Avg Ride Length Per Month](https://github.com/user-attachments/assets/f5f7438c-2d2c-4bfc-a22b-d8666a539e9b)

In the above chart we can see how casual riders average longer bike trips during 2024 in comparison to members. Take note that the average ride length for members slightly changes during the whole year. While the average for casual riders is smaller on cold months and has its peak during the warmer months, spring and summer season.

This also confirms the hypothesis that casual riders are using Cyclistic bikes for leisure and that they prefer warmer months to discover the city and its touristic attractions while members use the service the same way during the whole year because they use it to go to work.

### 8.7. Average bike ride duration in minutes per day of the week for each type of user in 2024.

![7  Avg Ride Length Per Day](https://github.com/user-attachments/assets/496d3559-0a9a-4088-8d2c-04c821f1c6f1)

We can observe how, during the weekdays, the casual riders are still riding for a longer period and they average more minutes on weekends, probably due to the possibility that they are using the service for fun and exploring. The average for members behaves like in the month average chart, it is similar all the days of the week because they are probably using the service just to commute.

### 8.8. Maximum ride length per month for each type of user

![8  Max Ride Length Per Month](https://github.com/user-attachments/assets/8f7aa207-5589-419d-8963-473d4cd13882)

In the above chart we conclude that the casual riders have longer ride length values during the whole year except in the winter months where members have longer rides. During summer the maximum ride length is similar for both users. This reflects how casual riders may use the service just for leisure and members usually to commute to work.

### 8.9. Maximum ride length per day of the week for each type of user

![9  Max Ride Length Per Day](https://github.com/user-attachments/assets/6a7b0716-9988-4588-9304-0e1bc1f43843)

Throughout the week casual riders have the maximum number of ride length except on Thursdays but just for a small amount of minutes. This demonstrates how casual riders still use the bikes for more time than members, confirming the hypothesis that they use the bikes for fun and members to get to their jobs.

### 8.10. Starting locations for each type of user

![10  Starting Locations](https://github.com/user-attachments/assets/380bde88-ec01-4fcb-ad33-ec37cb0a65d5)

The most used starting stations for casual riders are generally near Chicago’s tourist attractions and parks, usually concentrated in the same places on the left side of the map. In comparison, the starting stations where annual members undock their bikes are located near Chicago’s financial district, apartments and office buildings, spread throughout the whole downtown as seen on the right side of the map.

### 8.11. Ending locations for each type of user

![11  Ending Locations](https://github.com/user-attachments/assets/67c52159-1321-4dfb-a763-715983f788f1)

The above map reveals a similar trend to the most used starting stations. Casual riders are preferring to leave their bikes near tourist attractions while members are depending on Cyclistic to get to work or move around the city where they live.

### 8.12. SUMMARY

Casual Riders  | Annual Members
------------- | -------------
Use classic bikes more than electric bikes but still they made half of the trips made by members during 2024.  | Use classic bikes and electric bikes more frequently than casual riders. For both types of users electric scooters are not very popular.
Prefer riding bikes in summer and spring months and specially during weekends.  | Prefer riding bikes during weekdays and also during summer and spring.
Average a ride length (24 vs 12 minutes) two times longer than members but with less trips (36% compared to 63%) during the year.   | Travel more frequently during the year (63% of the 100% of rides) but they ride for half the time casual riders use the bikes (12 vs 24 minutes).
Begin and end their rides near parks, museums, tourist attractions and usually in the same stations. | Begin and end their rides in spreaded locations throughout the living and work districts of Chicago’s Downtown. 

## 9. ACT PHASE

### 9.1. Conclusions

Based on the analysis and the information gathered I can conclude that the annual members and the casual riders use the bikes offered by Cyclistic in many different ways but also in similar forms. The differences demonstrate how casual riders use the bikes for recreational and fun activities in Chicago and probably a good percentage of them are tourists. In comparison to annual members that we can infer use the bikes for more job related activities or to visit friends or do errands throughout the city. It is very probable that members live in Chicago and see the service as part of their daily life.

### 9.2. Recommendations

We know that Cyclistic’s marketing strategy relied on building general awareness and appealing until now but we also know that members are more profitable and that a new marketing strategy to gain more members is crucial for Cyclistic’s growth in the future. My top three recommendations for the Marketing Director and the Marketing Team are the following:

1. Promote the marketing campaign to win casual riders as members with more intensity in summer and spring months because casual riders tend to use the bikes more in this season. This could be made through social media and closer to the most used starting and ending station for casual riders.
   
2. Offer one time promotions or discounts for first rides to still attract new customers but also create new membership plans that try to gain new members. This could be made by making subscriptions for just the weekends or for spring and summer, because casual riders like to ride more during these days and months.
   
3. Create a loyalty points club that gives rewards each time a member reaches a certain amount of ridden time. The benefits could include offers, free days, promotions with restaurants or other brands, opportunities to win prizes in a raffle or tickets to popular tourist attractions in Chicago. This will incentivize casual riders to create an account and purchase a membership because they like to ride the bikes for more time.
