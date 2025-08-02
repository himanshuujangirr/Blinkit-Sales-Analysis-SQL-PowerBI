# Blinkit-Sales-Analysis-SQL-PowerBI
A data analysis project on Blinkit grocery sales using SQL for data cleaning and statistical analysis, and Power BI for building an interactive dashboard with key business insights.

-> Blinkit Sales Analysis – SQL + Power BI
This project analyzes Blinkit's grocery sales data using SQL for data cleaning and statistical analysis and Power BI for dashboard creation and visualization.

-> Project Objective
The goal of this project is to perform data analysis on Blinkit grocery sales data to generate key business insights, such as total sales, average sales, ratings, and performance by outlet type, size, and location.

⚙ Steps Followed
 1. Data Cleaning & Preparation (SQL)

Fixed inconsistent values in Item Fat Content.

Aggregated data for total sales, average sales, and item counts.

Generated outlet-wise, location-wise, and item-wise summaries.

 2. Data Analysis (SQL)

Used SUM, AVG, COUNT, GROUP BY, ORDER BY, CASE statements.

Performed year-wise, outlet-wise, and fat content-wise analysis.

 3. Dashboard Creation (Power BI)

Built an interactive dashboard with filters for outlet size, location, and item type.

Visualized KPIs using cards, donut charts, bar charts, and line charts.

🔹 Key Features
✅ Data Cleaning & Transformation (SQL)

Fixed inconsistent categorical values (LF, low fat → Low Fat; reg → Regular).

Performed aggregations using SUM, AVG, COUNT, and GROUP BY.

✅ Advanced KPI Calculations (DAX)

Created custom measures for Total Sales, Average Sales, Sales % Contribution, and Average Ratings.

✅ Interactive Slicers (Cross-Filtering)

Added slicers for Outlet Size, Outlet Location Type, and Item Type.

Selecting any option dynamically updates all visuals (KPIs, charts, and tables) to reflect filtered insights.

✅ Dashboard Visuals

Bar, Line, and KPI cards for real-time insights.

Year-wise, category-wise, and outlet-wise performance breakdown.



-> Key Insights
 -Total Sales: $1.20M
 -Average Sales: $141
 -Average Rating: 3.9
 -Tier 3 outlets generate the highest sales ($472K)
 -Medium-sized outlets contribute the highest revenue ($507K, 42.27%)
 
-> Tools & Technologies
Category	Tools Used
Data Cleaning	MySQL
Dashboard & Reporting	Power BI
Calculations	DAX Measures
Visualization	Bar Charts, Line Charts, KPI Cards, Tables

-> Repository Files
File Name	Description
blinkit analysis.pbix	Power BI dashboard file
BlinkIT Grocery Data (1).xlsx	Dataset used for the analysis
sql_blinkit.sql	All SQL queries used in the project
blinkkit analysis pdf.pdf containing dashboard screens

-> How to Use
1 Download the repository or clone it.
2 Open blinkit analysis.pbix in Power BI Desktop.
3 Check sql_blinkit.sql for all SQL queries used.
4 Explore or modify the dashboard as needed.


