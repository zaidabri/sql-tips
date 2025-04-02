
-- 🔹 Level 1 – Basic Queries

-- 1. Show all account names and websites:
SELECT name, website
FROM accounts;

-- 2. Show orders with total_amt_usd greater than 1000:
SELECT *
FROM orders
WHERE total_amt_usd > 1000;

-- 3. Show account names containing the word "tech" (case-insensitive):
SELECT name
FROM accounts
WHERE name ILIKE '%tech%';

-- 4. Returns all account names that start with the letter "S":
SELECT name
FROM accounts
WHERE name LIKE 'S%';

-- 5. Show the first 5 records from the sales_reps table:
SELECT *
FROM sales_reps
LIMIT 5;

-- 🔹 JOIN – Basic Joins

-- 1. Show the account name and its sales representative:
SELECT accounts.name, 
       sales_reps.name
FROM accounts
JOIN sales_reps
  ON accounts.sales_rep_id = sales_reps.id;

-- 2. Show the account name and the order's total amount in USD:
SELECT accounts.name, 
       orders.total_amt_usd
FROM orders
JOIN accounts
  ON orders.account_id = accounts.id;

-- 3. Show the name of the sales rep and their region:
SELECT sales_reps.name, 
       region.name
FROM sales_reps
JOIN region
  ON sales_reps.region_id = region.id;

-- 🔹 GROUP BY – Intermediate Level

-- 1. Total number of orders per account:
SELECT accounts.name, 
       COUNT(*) AS num_orders
FROM orders
JOIN accounts 
  ON orders.account_id = accounts.id
GROUP BY accounts.name;

-- 2. Total money spent by each account:
SELECT accounts.name,
       SUM(orders.total_amt_usd) AS total_spent
FROM orders
JOIN accounts
  ON orders.account_id = accounts.id
GROUP BY accounts.name;

-- 3. Average total amount per sales representative:
SELECT sales_reps.name,
       AVG(orders.total_amt_usd) AS avg_order_value
FROM orders
JOIN accounts 
  ON orders.account_id = accounts.id
JOIN sales_reps
  ON accounts.sales_rep_id = sales_reps.id
GROUP BY sales_reps.name;

