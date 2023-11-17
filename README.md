# SQL Project: Credit Card Transactions Analysis

## Overview
Welcome to my SQL project! This repository contains SQL queries and solutions for analyzing a credit card transactions dataset. The project focuses on exploring spending patterns, transaction details, and growth metrics.

## SQL Techniques Used

In this project, I employed various SQL techniques to analyze the credit card transactions dataset:

### 1. Aggregation Functions:

- **Question 1: Top 5 Cities with Highest Spends and Percentage Contribution**
  - Utilized `SUM` to calculate total spending.
  - Employed `ROUND` to calculate the percentage contribution.

- **Question 4: City with Lowest Percentage Spend for Gold Card Type**
  - Used `SUM` and `ROUND` in conjunction with `CASE` to calculate the lowest percentage spend for Gold card type.

- **Question 5: City, Highest Expense Type, Lowest Expense Type**
  - Applied `SUM` for aggregation.
  - Used `CASE` for conditional aggregation.

- **Question 6: Percentage Contribution of Spends by Females for Each Expense Type**
  - Utilized `SUM` and `ROUND` in conjunction with `CASE` to calculate the percentage contribution of spends by females.

### 2. Window Functions:

- **Question 2: Highest Spend Month and Amount for Each Card Type**
  - Leveraged `DATEPART` to extract month information.
  - Used `MAX` to find the highest amount spent.
  
- **Question 7: Card and Expense Type with Highest Month over Month Growth in Jan-2014**
  - Applied `LAG` to calculate month-over-month growth.

- **Question 8: City with Highest Total Spend to Total Number of Transactions Ratio During Weekends**
  - Used `SUM` and `COUNT` for aggregation.
  - Filtered results based on the day of the week using `DATEPART`.

### 3. Subqueries:

- **Question 3: Transaction Details for Each Card Type with Cumulative Spends of 1000000**
  - Implemented a subquery to calculate cumulative spending.
  - Used `RANK` to identify the first occurrence of reaching 1000000 total spends.

### 4. Date and Time Functions:

- **Question 9: City that Took Least Number of Days to Reach its 500th Transaction**
  - Utilized `DATEDIFF` to calculate the number of days.
  - Used `ROW_NUMBER` to identify the first and 500th transactions.

## How to Run Queries
1. Ensure you have a SQL Server database set up.
2. Open [solutions.sql](solutions.sql) in your SQL Server Management Studio (SSMS) or any SQL query tool.
3. Execute the queries to analyze the credit card transactions data.

## Conclusion
Summarize the key findings obtained from the analysis, highlighting any interesting patterns or trends discovered in the credit card transactions data.

## Acknowledgments
-  I would like to express my gratitude to Ankit Bansal, a SQL expert from [Namaste SQL](https://www.namastesql.com/), for his valuable guidance and support throughout the development of this project.

## Certifications

### 1. Namaste SQL Certification
- **Organization:** Namaste SQL
- **Completion Date:** [November 2023]
- **Certification Link:** [Namaste SQL Certification](https://github.com/asparmar14/SQL-project/blob/main/SQL-certification.png)
- **Description:** This certification was obtained from Namaste SQL, providing expertise in SQL.

### 2. SQL HackerRank Golden Badge
- **Organization:** HackerRank
- **Completion Date:** [October 2023]
- **Description:** Achieved the HackerRank Golden Badge in SQL, demonstrating proficiency in various SQL challenges on HackerRank.

### 3. SQL HackerRank Intermediate Certificate
- **Organization:** HackerRank
- **Completion Date:** [March 2023]
- **Certificate Link:** [SQL HackerRank Intermediate Certificate](https://www.hackerrank.com/certificates/0bbfe0b9a410)
- **Description:** Earned the HackerRank Intermediate Certificate in SQL by successfully solving 53 out of 58 SQL challenges.
