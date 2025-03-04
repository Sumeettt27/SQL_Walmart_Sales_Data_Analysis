<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Walmart Sales Data Analysis</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2, h3 {
            color: #333;
        }
        code {
            background: #eee;
            padding: 2px 5px;
            border-radius: 4px;
        }
        pre {
            background: #333;
            color: white;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Walmart Sales Data Analysis</h1>
        <h2>Project Overview</h2>
        <p>I analyzed Walmart sales data using MySQL, performed data transformations, and extracted business insights.</p>
        
        <h2>Technologies Used</h2>
        <ul>
            <li><strong>Database:</strong> MySQL</li>
            <li><strong>Query Language:</strong> SQL</li>
            <li><strong>Data Analysis:</strong> SQL queries</li>
        </ul>
        
        <h2>Database & Schema</h2>
        <pre><code>CREATE TABLE IF NOT EXISTS sales(
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
);</code></pre>
        
        <h2>Key Analysis Areas</h2>
        <h3>1. General Insights</h3>
        <ul>
            <li>Count of unique cities and branches.</li>
            <li>Unique product lines and payment methods.</li>
        </ul>
        
        <h3>2. Sales Performance</h3>
        <ul>
            <li>Total revenue by month and product line.</li>
            <li>Revenue breakdown by branch and city.</li>
            <li>Most popular product lines based on sales volume.</li>
        </ul>
        
        <h3>3. Customer Behavior</h3>
        <ul>
            <li>Most frequent customer types and revenue contributions.</li>
            <li>Gender distribution across branches.</li>
            <li>Time and weekday purchase preferences.</li>
        </ul>
        
        <h2>Business Questions Answered</h2>
        <h3>General Questions</h3>
        <ol>
            <li>How many unique cities does the data have?</li>
            <li>In which city is each branch located?</li>
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
        
        <h2>Final Thoughts</h2>
        <p>This analysis helps Walmart understand sales trends, customer behavior, and product performance.</p>
    </div>
</body>
</html>
