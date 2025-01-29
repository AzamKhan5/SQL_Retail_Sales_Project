create database SQL_Project1;
use SQL_Project1;

create table retail_sales(
	transactions_id int primary key,
	sale_date date,
    sale_time time,
    customer_id	int,
    gender char(10),
	age int,	
    category char(15),
    quantiy	int,
    price_per_unit float,
	cogs float,
	total_sale float
);

-- List all transactions:
select * from retail_sales
limit 2000;

-- count of rows
select count(*)
from retail_sales;


-- Find all Male & Female customers
select gender, count(gender) from retail_sales
group by gender; 

-- Find transactions from a specific date: Retrieve all transactions that occurred on "2022-11-05".
select * from retail_sales 
where sale_date in ("2022-11-05") ;

select * from retail_sales 
where sale_date between "2022-11-05" and "2022-12-31";

-- Find total sales by category
select sum(total_sale), category from retail_sales 
group by category
order by category desc;

-- Find sales greater than a specific amount: Retrieve all transactions where the total_sale is greater than 1000
select * from retail_sales 
where total_sale > 1000
order by total_sale;

-- Find transactions with a specific product category: Retrieve all transactions where the category is "Clothing".
select * from retail_sales
where category in ("Clothing");

-- Find the maximum price per unit: Find the transaction with the highest price_per_unit.
select * from retail_sales
where price_per_unit = (select max(price_per_unit) from retail_sales)
order by total_sale DESC
limit 1;

-- Find all transactions from a specific customer: Retrieve all transactions for the customer with customer_id 52.
select * from retail_sales 
where customer_id = 52;

-- Find transactions where quantity is greater than 3: Retrieve all transactions where the quantity is greater than 3.
select * from retail_sales 
where quantiy > 3 ;


-- Calculate the total quantity sold by category: Retrieve the total quantity sold for each product category.
select category, count(quantiy) as quantity_count from retail_sales
group by category; 

-- Find average price per unit by gender: Calculate the average price_per_unit for each gender
select gender, avg(price_per_unit) from retail_sales
group by gender;

-- Find the transaction with the highest total sale: Retrieve the transaction with the highest total_sale.
select * from retail_sales 
where total_sale = ( select max(total_sale) from retail_sales);

-- List the number of transactions per month: Count the number of transactions that happened each month (based on sale_date).
SELECT MONTH(sale_date) AS month, COUNT(*) AS transaction_count
FROM retail_sales
GROUP BY MONTH(sale_date)
ORDER BY month;

-- Find customers who made purchases more than once: Retrieve the customer_id of customers who made multiple purchases.
select customer_id, count(transactions_id) from retail_sales
group by customer_id
HAVING COUNT(*) > 1;

-- Find the percentage contribution of each category to total sales: Calculate what percentage each product category contributes to the total sales.
SELECT 
    category,
    SUM(total_sale) AS category_sales,
    (SUM(total_sale) / (SELECT SUM(total_sale) FROM retail_sales) * 100) AS percentage_contribution
FROM retail_sales
GROUP BY category
ORDER BY percentage_contribution DESC;

-- Find the total cost of goods sold (COGS) per gender: Calculate the total cogs for each gender.
select gender ,sum(cogs) as total_COGS from retail_sales
group by gender; 


-- Find the most expensive product by category: Retrieve the transaction with the highest price_per_unit for each product category.
select * from retail_sales 
where price_per_unit = (select max(price_per_unit) from retail_sales);


-- Find total sales for each customer: Calculate the total total_sale for each customer_id.
select customer_id, sum(total_sale) from retail_sales
group by customer_id;

-- Find transactions where the COGS is greater than 100: Retrieve all transactions where the cogs is greater than 100.
select * from retail_sales 
where cogs > 100 ; 