-- ========================================
-- ECOMMERCE SALES ANALYSIS
-- SQL Portfolio Project
-- ========================================


-- ========================================
-- EXECUTIVE KPIs
-- ========================================

-- Total Revenue
SELECT ROUND(SUM(Sales), 2) AS total_revenue
FROM ecommerce_sales;

-- Total Profit
SELECT ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales;

-- Total Orders
SELECT COUNT(*) AS total_orders
FROM ecommerce_sales;

-- Average Order Value (AOV)
SELECT ROUND(AVG(Sales), 2) AS avg_order_value
FROM ecommerce_sales;

-- Profit Margin (%)
SELECT ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_percent
FROM ecommerce_sales;


-- ========================================
-- CATEGORY PERFORMANCE
-- ========================================

-- Revenue by Category
SELECT Category,
       ROUND(SUM(Sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY Category
ORDER BY revenue DESC;

-- Profit by Category
SELECT Category,
       ROUND(SUM(Profit), 2) AS profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY profit DESC;

-- Revenue & Profit by Category
SELECT Category,
       ROUND(SUM(Sales), 2) AS revenue,
       ROUND(SUM(Profit), 2) AS profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY revenue DESC;

-- Revenue Contribution by Category (%)
SELECT Category,
       ROUND(SUM(Sales) * 100.0 /
            (SELECT SUM(Sales) FROM ecommerce_sales), 2) AS revenue_percent
FROM ecommerce_sales
GROUP BY Category
ORDER BY revenue_percent DESC;


-- ========================================
-- REGIONAL PERFORMANCE
-- ========================================

-- Revenue by Region
SELECT Region,
       ROUND(SUM(Sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY Region
ORDER BY revenue DESC;

-- Profit by Region
SELECT Region,
       ROUND(SUM(Profit), 2) AS profit
FROM ecommerce_sales
GROUP BY Region
ORDER BY profit DESC;

-- Best Performing Region (by Revenue)
SELECT Region,
       ROUND(SUM(Sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY Region
ORDER BY revenue DESC
LIMIT 1;


-- ========================================
-- PRODUCT ANALYSIS
-- ========================================

-- Top 10 Products by Revenue
SELECT Product,
       ROUND(SUM(Sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY Product
ORDER BY revenue DESC
LIMIT 10;

-- Top 10 Products by Profit
SELECT Product,
       ROUND(SUM(Profit), 2) AS profit
FROM ecommerce_sales
GROUP BY Product
ORDER BY profit DESC
LIMIT 10;

-- Loss-Making Products
SELECT Product,
       ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
GROUP BY Product
HAVING total_profit < 0
ORDER BY total_profit ASC;


-- ========================================
-- DISCOUNT IMPACT ANALYSIS
-- ========================================

-- Revenue & Profit by Discount Level
SELECT Discount,
       ROUND(SUM(Sales), 2) AS revenue,
       ROUND(SUM(Profit), 2) AS profit
FROM ecommerce_sales
GROUP BY Discount
ORDER BY Discount DESC;

-- Discount Effect on Profitability
SELECT Discount,
       ROUND(AVG(Profit), 2) AS avg_profit
FROM ecommerce_sales
GROUP BY Discount
ORDER BY Discount DESC;


-- ========================================
-- BUSINESS INSIGHT QUERIES
-- ========================================

-- Most Profitable Category
SELECT Category,
       ROUND(SUM(Profit), 2) AS profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY profit DESC
LIMIT 1;

-- Highest Revenue Category
SELECT Category,
       ROUND(SUM(Sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY Category
ORDER BY revenue DESC
LIMIT 1;