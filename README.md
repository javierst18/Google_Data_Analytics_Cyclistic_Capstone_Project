# Google Data Analytics Case Study: Cyclistic - How Does a Bike-Share Navigate Speedy Success

**Date:** 05/13/2025

**Author:** Javier Salazar Tuchez

## 1. INTRODUCTION

The Cyclistic bike share case analysis is my capstone project from the Google Data Analytics Certificate. Through this project I perform my job as a junior data analyst for a fictional company called Cyclistic to answer questions from different stakeholders. I followed the data analysis process steps: ask, prepare, analyze, share and act.

## Links and Soucers

**Data Source:** [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 05/05/25]

**Project Source:** Google Data Analytics Certificate Program. Coursera. Course 8. Module 2. Capstone Project. “How Does a Bike-Share Navigate Speedy Success”. 2025. [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

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

I will collect and analyze the bike usage from the previous 12 months (january 2024 - december 2024) to analyze and identify trends that determine insights related to the bikes usage and the difference between casual riders and annual members to better determine how to make an efficient campaign to convert the first ones into the second ones.

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

**SQL Query:** [Data Combining](1. Data Combining.sql)

The first step was uploading the 2024 bike trips data to BigQuery. I combined the 12 months tables into one table named combined_table_2024 that contains 5,860,568 rows of data.

### 6.2. DATA PRE-CLEANING

**SQL Query:** Data Pre-Cleaning

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

SQL Query: Data Cleaning
