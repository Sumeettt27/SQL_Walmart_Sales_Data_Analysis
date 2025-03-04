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
 <ul>
     <li>Count of unique cities and their corresponding branches.</li>
     <li>Unique product lines and payment methods available.</li>
 </ul>
 
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
 <ol>
     <li>How many unique cities does the data have?</li>
     <li>In which city is each branch?</li>
 </ol>
 
<h3>Product-Related Questions</h3>
<ol>
    <li>What unique product lines does the data have?</li>
    <li>What is the total quantity sold for each product line, sorted in descending order?</li>
    <li>What is the total revenue by month?</li>
    <li>What is the total COGS for each month, sorted in ascending order?</li>
    <li>What is the total revenue for each product line, sorted in descending order?</li>
    <li>What is the total revenue for each city and branch, sorted in ascending order?</li>
    <li>What is the average VAT percentage for each product line, sorted in descending order?</li>
    <li>Classify each product line as 'Good' or 'Bad' based on whether its average quantity sold is above or below the overall average quantity sold.</li>
    <li>Which branches have sold more products than the overall average quantity sold across all branches?</li>
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


<h3>Example SQL Queries</h3>
<pre><code>SELECT customer_type, SUM(total) AS total_revenue 
FROM sales 
GROUP BY customer_type 
ORDER BY total_revenue DESC;</code></pre>

For more SQL queries and insights, refer to the <a href="https://github.com/Sumeettt27/SQL_Walmart_Sales_Data_Analysis/blob/main/walmart_sales_query.sql" download>walmart_sales_query</a>
 file.


<h2>Key Insights</h2>
<ul>
    <li>Members contribute the highest revenue ($164,223.40), and Naypyitaw generates the most revenue ($110,568.70).</li>
    <li>Electronic Accessories are the most sold product line (971 units), while Food & Beverages generate the most revenue ($56,144.84).</li>
    <li>Afternoon sales receive the best customer ratings (7.03), and Monday has the highest overall customer satisfaction (7.15).</li>
    <li>Branch A has sold more products than the overall average, making it the best-performing branch.</li>
    <li>Peak Sales Time: Evening & Afternoon, particularly on Saturdays (81 evening sales).</li>
</ul>

<hr>

<h2>General Insights</h2>
<ul>
    <li>The dataset covers three unique cities: Yangon, Naypyitaw, and Mandalay.</li>
    <li>Each city has a corresponding branch:</li>
    <ul>
        <li><strong>Branch A:</strong> Yangon</li>
        <li><strong>Branch B:</strong> Mandalay</li>
        <li><strong>Branch C:</strong> Naypyitaw</li>
    </ul>
</ul>

<h2>Product-Related Insights</h2>
<ul>
    <li><strong>Best-Selling Product Line:</strong> Electronic Accessories (971 units sold).</li>
    <li><strong>Highest Revenue Product Line:</strong> Food and Beverages ($56,144.84).</li>
    <li><strong>Most Popular Product Line by Gender:</strong></li>
    <ul>
        <li><strong>Female:</strong> Fashion Accessories (96 purchases).</li>
        <li><strong>Male:</strong> Health and Beauty (88 purchases).</li>
    </ul>
    <li><strong>Product Line Ratings:</strong></li>
    <ul>
        <li><strong>Highest-rated:</strong> Food and Beverages (7.11).</li>
        <li><strong>Lowest-rated:</strong> Home and Lifestyle (6.84).</li>
    </ul>
    <li><strong>Product Line Performance ('Good' vs. 'Bad')</strong></li>
    <ul>
        <li><strong>"Good" (above-average sales):</strong> Health & Beauty, Sports & Travel, Home & Lifestyle, Electronic Accessories.</li>
        <li><strong>"Bad" (below-average sales):</strong> Food & Beverages, Fashion Accessories.</li>
    </ul>
</ul>

<h2>Sales Performance Insights</h2>
<ul>
    <li><strong>Highest Revenue Month:</strong> January ($116,291.90).</li>
    <li><strong>Branch with Highest Revenue:</strong> Naypyitaw ($110,568.70).</li>
    <li><strong>City with the Highest VAT Percentage:</strong> Naypyitaw (16.05%).</li>
    <li><strong>Customer Type with Highest Revenue:</strong> Members ($164,223.40).</li>
    <li><strong>Branch with Highest Total Sales:</strong> Branch A (1,859 units sold).</li>
</ul>

<h2>Customer Behavior Insights</h2>
<ul>
    <li><strong>Most Frequent Customer Type:</strong> Members (501 purchases).</li>
    <li><strong>Gender Distribution:</strong></li>
    <ul>
        <li><strong>Majority Gender:</strong> Female (501 customers).</li>
        <li><strong>Most Male-Dominant Branch:</strong> Branch A.</li>
        <li><strong>Most Female-Dominant Branch:</strong> Branch C.</li>
    </ul>
    <li><strong>Peak Purchase Hours:</strong> Afternoon (highest average rating of 7.03).</li>
    <li><strong>Best Days for Customer Satisfaction:</strong></li>
    <ul>
        <li><strong>Overall:</strong> Monday (7.15 average rating).</li>
        <li><strong>By Branch:</strong></li>
        <ul>
            <li><strong>Branch A:</strong> Best on Friday (7.31).</li>
            <li><strong>Branch B:</strong> Best on Monday (7.34).</li>
            <li><strong>Branch C:</strong> Best on Friday (7.28).</li>
        </ul>
    </ul>
</ul>

