-- Create database
CREATE DATABASE IF NOT EXISTS walmartsales_db;


-- Create table
CREATE TABLE IF NOT EXISTS sales(
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT NOT NULL, 
    total DECIMAL(12,4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT, 
    gross_income DECIMAL(12,4),
    rating FLOAT 
);


-- Add the time_of_day column 
SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;


ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);


UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);


-- Add day_name column
SELECT
	date,
	DAYNAME(date)
FROM sales;


ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);


UPDATE sales
SET day_name = DAYNAME(date);


-- Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;


ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);


UPDATE sales
SET month_name = MONTHNAME(date);


-- Generic Questions
-- 1. How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM sales;


-- 2. In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM sales;


-- Product Questions 
-- 1. What unique product lines does the data have?
SELECT
	DISTINCT product_line
FROM sales;


-- 2. What is the total quantity sold for each product line, 
-- sorted in descending order?
SELECT
	SUM(quantity) as qty,
    product_line
FROM sales
GROUP BY product_line
ORDER BY qty DESC;


-- 3. What is the total revenue by month?
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue;


-- 4. What is the total COGS for each month, sorted in ascending order?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs;


-- 5. What is the total revenue for each product line, 
-- sorted in descending order?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;


-- 6. What is the total revenue for each city and branch, 
-- sorted in ascending order?
SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue;


-- 7. What is the average VAT percentage for each product line, 
-- sorted in descending order?
SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;


-- 8. Classify each product line as 'Good' or 'Bad' based on 
-- whether its average quantity sold is above or below the overall average quantity sold.
WITH overall_avg AS (
    SELECT AVG(quantity) AS avg_quantity_all FROM sales
)
SELECT 
    product_line,
    CASE 
        WHEN AVG(quantity) > (SELECT avg_quantity_all FROM overall_avg) THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM sales
GROUP BY product_line;


-- 9. Which branches have sold more products than the 
-- overall average quantity sold across all branches?

WITH overall_avg AS (
    SELECT AVG(total_quantity) AS avg_quantity_all 
    FROM (
        SELECT SUM(quantity) AS total_quantity 
        FROM sales 
        GROUP BY branch
    ) branch_sales
)
SELECT 
    branch, 
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT avg_quantity_all FROM overall_avg);


-- 10. Which product line is the most popular among each gender?

WITH gender_product_counts AS (
    SELECT 
        gender, 
        product_line, 
        COUNT(*) AS total_cnt,
        RANK() OVER (PARTITION BY gender ORDER BY COUNT(*) DESC) AS rnk
    FROM sales
    GROUP BY gender, product_line
)
SELECT gender, product_line, total_cnt
FROM gender_product_counts
WHERE rnk = 1;


-- 11. What is the average rating of each product line?
SELECT
    product_line,
    ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;


-- Customers Questions
-- 1. What unique customer types does the data have?
SELECT
	DISTINCT customer_type
FROM sales;


-- 2. What unique payment methods does the data have?
SELECT
	DISTINCT payment
FROM sales;


-- 3. Which customer type appears most frequently in the sales data?
SELECT
    customer_type,
    COUNT(*) AS count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;


-- 4. Which customer type has made the most purchases?
SELECT
    customer_type,
    COUNT(*) AS total_purchases
FROM sales
GROUP BY customer_type
ORDER BY total_purchases DESC;


-- 5. Which gender represents the majority of customers?
SELECT
    gender,
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;


-- 6. What is the gender distribution for each branch?
SELECT
    branch,
    gender,
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY branch, gender
ORDER BY branch, gender_cnt DESC;


-- 7. At what time of the day do customers give the highest average ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;


-- 8. At what time of the day do customers give 
-- the highest average ratings for each branch? 
SELECT
    branch,
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY branch, time_of_day
ORDER BY branch, avg_rating DESC;


-- 9. On which day of the week do customers give the highest average ratings?
SELECT
    day_name,
    ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;


-- 10. Which day of the week has the best average ratings for each branch?
SELECT 
    branch,
    day_name,
    ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY branch, day_name
ORDER BY branch, avg_rating DESC;


-- Sales Questions
-- 1. How many sales were made during each time of the day for every weekday?
SELECT
day_name,
time_of_day,
COUNT(*) AS total_sales
FROM sales
GROUP BY day_name, time_of_day
ORDER BY 
FIELD(day_name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
total_sales DESC;


-- 2.  Which customer type generates the highest total revenue?
SELECT
    customer_type,
    SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;


-- 3. Which city has the highest average tax/VAT percentage?
SELECT
    city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;


-- 4. Which customer type has the highest average VAT percentage?
SELECT
    customer_type,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY customer_type
ORDER BY avg_tax_pct DESC;
