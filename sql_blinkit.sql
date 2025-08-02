select * from `blinkit grocery data`;
select count(*) from `blinkit grocery data`;

describe `blinkit grocery data`;

UPDATE `blinkit grocery data`
SET `Item Fat Content` = CASE 
    WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN `Item Fat Content` = 'reg' THEN 'Regular'
    ELSE `Item Fat Content`  
END;

select distinct(`Item Fat Content`) from `blinkit grocery data`;
-- so now its fixed 

select sum(Sales) as `Total Sales` from `blinkit grocery data`;

select concat(cast(sum(Sales)/ 1000000 as decimal (10,2)), 'M') as `Total_Sales_Millions` from `blinkit grocery data`;

-- here's our total sales in Million 

select cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales` from `blinkit grocery data`;

select count(*) as `No. Of Items` from `blinkit grocery data`;


-- sales only for Low fat content items 
select concat(cast(sum(Sales)/ 1000000 as decimal (10,2)), 'M') as `Total_Sales_Millions` 
from `blinkit grocery data`
WHERE `Item Fat Content` = 'Low Fat';


-- Now lets see the year vise analysis of total sales/avg sales/ number of items (filter condition)
select concat(cast(sum(Sales)/ 1000000 as decimal (10,2)), 'M') as `Total_Sales_Millions` 
from `blinkit grocery data`
WHERE `Outlet Establishment Year` = 2022;

select cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`
 from `blinkit grocery data`
 where `Outlet Establishment Year`=2022;
 
 select count(*) as `No. Of Items`
 from `blinkit grocery data`
 where `Outlet Establishment Year` = 2022;
 
 
 -- next is Rating analysis
 select cast(avg(`Rating`) as decimal(10,2)) as `avg_rating` from `blinkit grocery data`;
 -- we can even access the avg data of a particular eastablishment year of an outlet using filter conditions 
 
 select `Item Fat Content`, cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`
 from `blinkit grocery data`
 group by `Item Fat Content`
 order by `Total Sales`  desc;
 -- total sales of item fat content of distinct types of values using group by function 
 
 -- using all the aggregation function  we can see all avg total sales and avg ratings with total item counts of each distinct value of item fat content using groupby function  
 select `Item Fat Content`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`,
        cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`,
        count(*) as `No. Of Items`,
        cast(avg(`Rating`) as decimal(10,2)) as `avg_rating`
 from `blinkit grocery data`
 group by `Item Fat Content`
 order by `Total Sales`  desc;
 
 -- we can even add filter condition for outlet eastablishment year
  select `Item Fat Content`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`,
        cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`,
        count(*) as `No. Of Items`,
        cast(avg(`Rating`) as decimal(10,2)) as `avg_rating`
 from `blinkit grocery data`
 where `Outlet Establishment Year` = 2022
 group by `Item Fat Content`
 order by `Total Sales`  desc;

-- we will run the same query for item_type
 select `Item Type`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`,
        cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`,
        count(*) as `No. Of Items`,
        cast(avg(`Rating`) as decimal(10,2)) as `avg_rating`
 from `blinkit grocery data`
 group by `Item Type`
 order by `Total Sales`  asc
 limit 5; 
-- limit is 5 we will only see top 5 rows 


-- here we are grouping outlet location and item fat content both and using aggregation function for statistical analysis
 select `Outlet Location Type`,`Item Type`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`,
        cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`,
        count(*) as `No. Of Items`,
        cast(avg(`Rating`) as decimal(10,2)) as `avg_rating`
 from `blinkit grocery data`
 group by `Outlet Location Type`,`Item Type`
 order by `Total Sales`  asc; 
 
 -- for only total sales for outlet location type and item fat content here's the query
  select `Outlet Location Type`,`Item Fat Content`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`
 from `blinkit grocery data`
 group by `Outlet Location Type`,`Item Fat Content`
 order by `Total Sales`  asc; 
 
 
-- Ye query outlet location type ke hisaab se low fat aur regular ka total sales 2 decimal ke saath dikhane k liye h
SELECT 
    `Outlet Location Type`,
    ROUND(IFNULL(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN `Sales` END), 0), 2) AS `Low Fat`,
    ROUND(IFNULL(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN `Sales` END), 0), 2) AS `Regular`
FROM `blinkit grocery data`
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;


-- year vise total sales
  select `Outlet Establishment Year`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`
 from `blinkit grocery data`
 group by `Outlet Establishment Year`
 order by `Total Sales`  asc; 
 
 -- year vise statistical analysis 
  select `Outlet Establishment Year`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`,
        cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`,
        count(*) as `No. Of Items`,
        cast(avg(`Rating`) as decimal(10,2)) as `avg_rating`
 from `blinkit grocery data`
 group by `Outlet Establishment Year`
 order by `Outlet Establishment Year`  asc; 



-- Ye query Outlet Size ke hisaab se total sales aur uska percentage 2 decimal places ke saath dikhati hai
SELECT 
    `Outlet Size`,
    CAST(SUM(`Sales`) AS DECIMAL(10,2)) AS `Total Sales`,
    CAST(SUM(`Sales`) * 100 / SUM(SUM(`Sales`)) OVER () AS DECIMAL(10,2)) AS `Sales%`
FROM `blinkit grocery data`
GROUP BY `Outlet Size`
ORDER BY `Total Sales` DESC;


-- TOTAL SALES BY OUTLET LOCATION TYPE AND STATISTICAL ANALYSIS

  select `Outlet Location Type`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`,
        CAST(SUM(`Sales`) * 100 / SUM(SUM(`Sales`)) OVER () AS DECIMAL(10,2)) AS `Sales%`,
        cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`,
        count(*) as `No. Of Items`,
        cast(avg(`Rating`) as decimal(10,2)) as `avg_rating`
 from `blinkit grocery data`
 group by `Outlet Location Type`
 order by `Total Sales`  asc; 
 
 
 -- total sales by outlet type
 
  select `Outlet Type`,
        cast(sum(`Sales`) as decimal(10,2)) as `Total Sales`,
        CAST(SUM(`Sales`) * 100 / SUM(SUM(`Sales`)) OVER () AS DECIMAL(10,2)) AS `Sales%`,
        cast(avg(`Sales`) as decimal(10,2)) `Avg_Sales`,
        count(*) as `No. Of Items`,
        cast(avg(`Rating`) as decimal(10,2)) as `avg_rating`
 from `blinkit grocery data`
 group by `Outlet Type`
 order by `Total Sales`  asc; 
 