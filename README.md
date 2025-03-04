# SQL_Walmart_Sales_Data_Analysis
   

       
<h2>Project Overview</h2>
<p>I analyzed Walmart sales data using MySQL, performed data transformations, and extracted business insights.</p>

<h2>Technologies Used</h2>
<ul>
   <li><strong>Database:</strong> MySQL</li>
   <li><strong>Query Language:</strong> SQL</li>
   <li><strong>Data Analysis:</strong> SQL queries</li>
</ul>

<h2>Database & Schema</h2>
<pre><code>
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
</code></pre>

<h2>Database Schema Diagram</h2>

<br/>
<div style="text-align: center;">
    <img src="https://github.com/Sumeettt27/SQL_Walmart_Sales_Data_Analysis/blob/main/ER%20Diagram.png" alt="Schema Diagram" style="max-width:70%;box-shadow:0 2.8px 2.2px rgba(0, 0, 0, 0.12)" />
</div>
<br/>


<h2>Key Analysis Areas</h2>
 <h3>General Insights</h3>
 <ol>
     <li>Count of unique cities and their corresponding branches.</li>
     <li>Unique product lines and payment methods available.</li>
 </ol>
 
 <h3>Sales Performance</h3>
 <ul>
     <li>Total revenue by month and product line.</li>
     <li>Revenue breakdown by branch and city.</li>
     <li>Most popular product lines based on sales volume.</li>
     <li>Average VAT percentage per product line.</li>
 </ul>
 
 <h3>Customer Behavior</h3>
 <ul>
     <li>Most frequent customer types and their total revenue contributions.</li>
     <li>Gender distribution across all branches.</li>
     <li>Time of day and weekday preferences for purchases.</li>
     <li>Highest average customer ratings by day and time.</li>
 </ul>
 
 <h3>Advanced Insights</h3>
 <ul>
     <li>Identifying ‘Good’ or ‘Bad’ product lines based on sales volume.</li>
     <li>Comparison of branch-wise sales performance against the overall average.</li>
     <li>Customer types with the highest VAT percentage contributions.</li>
     <li>Identifying the most popular product lines among different genders.</li>
 </ul>
 
 <h2>Business Questions To Answer</h2>
 
 <h3>General Questions</h3>
 <ul>
     <li>How many unique cities does the data have?</li>
     <li>In which city is each branch?</li>
 </ul>
 
 <h3>Product-Related Questions</h3>
 <ol>
     <li>What unique product lines does the data have?</li>
     <li>What is the total quantity sold for each product line?</li>
     <li>What is the total revenue by month?</li>
     <li>What is the total COGS for each month?</li>
     <li>What is the total revenue for each product line?</li>
     <li>What is the total revenue for each city and branch?</li>
     <li>What is the average VAT percentage for each product line?</li>
     <li>How is each product line classified based on the overall average quantity sold?</li>
     <li>Which branches have sold more products than the overall average?</li>
     <li>Which product line is the most popular among each gender?</li>
     <li>What is the average rating of each product line?</li>
 </ol>
 
 <h3>Customer-Related Questions</h3>
 <ol>
     <li>What unique customer types exist in the data?</li>
     <li>What unique payment methods exist in the data?</li>
     <li>Which customer type appears most frequently in the sales data?</li>
     <li>Which customer type has made the most purchases?</li>
     <li>Which gender represents the majority of customers?</li>
     <li>What is the gender distribution for each branch?</li>
     <li>At what time of the day do customers give the highest average ratings?</li>
     <li>At what time of the day do customers give the highest average ratings for each branch?</li>
     <li>On which day of the week do customers give the highest average ratings?</li>
     <li>Which day of the week has the best average ratings for each branch?</li>
 </ol>
 
 <h3>Sales-Related Questions</h3>
 <ol>
     <li>How many sales were made during each time of the day for every weekday?</li>
     <li>Which customer type generates the highest total revenue?</li>
     <li>Which city has the highest average tax/VAT percentage?</li>
     <li>Which customer type has the highest average VAT percentage?</li>
 </ol>

<h3>Product-Related Questions</h3>
<ol>
   <li>What unique product lines exist in the data?</li>
   <li>What is the total quantity sold for each product line?</li>
   <li>What is the total revenue by month?</li>
   <li>What is the total COGS for each month?</li>
</ol>

<h3>Example SQL Queries</h3>
<pre><code>SELECT customer_type, SUM(total) AS total_revenue 
FROM sales 
GROUP BY customer_type 
ORDER BY total_revenue DESC;</code></pre>

For more SQL queries and insights, refer to the <a href="https://github.com/Sumeettt27/SQL_Walmart_Sales_Data_Analysis/blob/main/walmart_sales_query.sql" download>walmart_sales_query</a>
 file.

