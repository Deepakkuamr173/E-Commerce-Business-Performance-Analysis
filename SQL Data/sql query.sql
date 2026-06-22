Create database Business_Performance_Analyst;
use Business_Performance_Analyst;

create table sample_Data(
Row_ID int primary key,
Order_ID varchar(25),
Order_Date date,
Ship_Date date,
Ship_Mode varchar(20),
Customer_ID varchar(25),
Customer_Name varchar(20),
Segment varchar(20),
Country varchar(20),
City varchar(20),
State varchar(20),
Postal_Code varchar(20),
Region varchar(20),
Product_ID varchar(20),
Category varchar(30),
Sub_Category varchar(30),
Product_Name text,
Sales decimal(10,2),
Quantity int,
Discount decimal(10,2),
Profit decimal(10,4)

);
drop table sample_data;

select * from sample_data; 

describe 	sample_data;

select count(*) from sample_data;


-- 1 total profit

SELECT 
    SUM(Sales) AS total_sles
FROM
    sample_data;

-- 2 Total Profit
SELECT 
    SUM(Profit) AS Total_profit
FROM
    sample_data;

-- 3 Sales by Category

SELECT 
    Category, SUM(Sales) AS sales_by_category
FROM
    sample_data
GROUP BY Category
ORDER BY sales_by_category desc;

-- 4. Profit by Category

SELECT 
    Category, SUM(Profit) AS profit_by_category
FROM
    sample_data
GROUP BY Category
ORDER BY profit_by_category DESC;


--  5. Top 10 Customers

SELECT 
    Customer_Name, SUM(Sales) AS top_Customer
FROM
    sample_data
GROUP BY Customer_Name
ORDER BY top_Customer DESC
LIMIT 10;


-- 6. Top 10 Products

SELECT 
    Product_Name, SUM(Sales) AS top_product_sales
FROM
    sample_data
GROUP BY Product_Name
ORDER BY top_product_sales DESC
LIMIT 10;

-- 7. Sales by Region

SELECT 
    Region, SUM(Sales) AS Sales_by_Region
FROM
    sample_data
GROUP BY Region
ORDER BY Sales_by_Region DESC;


-- 8. Average Shipping Days

SELECT 
    ROUND(AVG(DATEDIFF(Ship_Date, Order_Date)), 2) AS avg_day
FROM
    sample_data;
    
    
                                    -- Sales Analysis

-- Monthly Sales Trend

SELECT year(Order_Date) as Year_y
,month(Ship_Date) as Month_m,
sum(Sales) as Total_sales
from sample_data
group by year(Order_Date),month(Ship_Date)
order by Year_y,Month_m;


SELECT YEAR(Order_Date) AS Year_y,
       SUM(Sales) AS Total_Sales
FROM sample_data
GROUP BY Year_y;


                                   -- Profit Analysis

-- Loss Making Products

SELECT 
    Product_Name, SUM(Profit) AS total_profit
FROM
    sample_data
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY total_profit asc;

-- Most top 10 profitable product

SELECT 
    Product_Name, SUM(profit) AS most_profitable_product
FROM
    sample_data
GROUP BY Product_Name
ORDER BY most_profitable_product DESC
LIMIT 10;

                                -- Customer Analysis

-- Top Customers by Profit

SELECT 
    Customer_Name, SUM(profit) AS top_profitable_customer
FROM
    sample_data
GROUP BY Customer_Name
ORDER BY top_profitable_customer DESC;


-- Customer Count by Segment

SELECT 
    Segment, COUNT(DISTINCT (Customer_ID)) AS total_customer
FROM
    sample_Data
GROUP BY Segment;

                                      -- Regional Analysis

-- State-wise Sales

SELECT 
    state, SUM(sales) AS total_sales
FROM
    sample_Data
GROUP BY state
ORDER BY total_sales DESC;

-- State-wise Profit

SELECT 
    state, SUM(profit) AS total_profit
FROM
    sample_Data
GROUP BY state
ORDER BY total_profit DESC;

                                  -- Discount Analysis

-- Discount Impact on Profit

SELECT 
    discount, AVG(profit) AS impact_on_profit
FROM
    sample_data
GROUP BY discount
ORDER BY discount;

--  Highest Discount Products

SELECT 
    product_name, MAX(discount) AS max_discount
FROM
    sample_data
GROUP BY product_name
HAVING max_discount > 0.20
ORDER BY max_discount DESC;

                            -- Shipping Analysis

-- Ship Mode Performance

SELECT 
    ship_mode,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM
    sample_data
GROUP BY ship_mode;


-- Average Delivery Time

SELECT 
    ship_mode,
    avg(DATEDIFF(ship_date, order_date)) AS avg_dilivery_time
FROM
    sample_data
GROUP BY ship_mode
ORDER BY avg_dilivery_time DESC;


                  -- Category Analysis

-- Category & Sub-Category Performance

SELECT 
    category,
    sub_category,
    SUM(sales) AS sales,
    SUM(profit) AS profit
FROM
    sample_data
GROUP BY category , sub_category;





