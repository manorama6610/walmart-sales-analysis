SELECT * FROM walmart;
-- DROP TABLE walmart;

-- DROP TABLE walmart;

-- Count total records
SELECT COUNT(*) FROM walmart;

-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments
FROM walmart
GROUP BY payment_method;
-- Count distinct branches
SELECT COUNT(DISTINCT "branch") FROM walmart;
-- Find the minimum quantity sold
SELECT MIN(quantity) FROM walmart;

-- Business Problem Q1: Find different payment methods, number of transactions, and quantity sold by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Project Question #2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating
SELECT branch, category, avg_rating
FROM (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS rank
    FROM walmart
    GROUP BY branch, category
) AS ranked
WHERE rank = 1;

-- Q3: Identify the busiest day for each branch based on the number of transactions
SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        TO_CHAR(TO_DATE(date, 'DD/MM/YYYY'), 'Day') AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(
            PARTITION BY branch 
            ORDER BY COUNT(*) DESC
        ) AS rank
    FROM walmart
    GROUP BY branch, day_name
) AS ranked
WHERE rank = 1;
-- Q4: Calculate the total quantity of items sold per payment method
SELECT 
    payment_method,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;
-- Q5: Determine the average, minimum, and maximum rating of categories for each city
SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM walmart
GROUP BY city, category;
-- Q6: Calculate the total profit for each category
SELECT 
    category,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;
- Q7: Determine the most common payment method for each branch
WITH cte AS (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank
    FROM walmart
    GROUP BY branch, payment_method
)
SELECT branch, payment_method AS preferred_payment_method
FROM cte
WHERE rank = 1;
-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
SELECT
    branch,
    CASE 
        WHEN hour < 12 THEN 'Morning'
        WHEN hour < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM (
    SELECT 
        branch,
        EXTRACT(HOUR FROM time::TIME) AS hour
    FROM walmart
) t
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;
-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
WITH yearly_revenue AS (
    SELECT 
        branch,
        EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YYYY')) % 100 AS year,
        SUM(total) AS revenue
    FROM walmart
    GROUP BY branch, year
)
SELECT 
    y2022.branch,
    y2022.revenue AS last_year_revenue,
    y2023.revenue AS current_year_revenue,
    ROUND(
        ((y2022.revenue - y2023.revenue) / NULLIF(y2022.revenue, 0) * 100)::NUMERIC,
        2
    ) AS revenue_decrease_ratio
FROM yearly_revenue y2022
JOIN yearly_revenue y2023
    ON y2022.branch = y2023.branch
WHERE y2022.year = 22
  AND y2023.year = 23
  AND y2022.revenue > y2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;



