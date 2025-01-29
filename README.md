# SQL Practice Project

### 📌 Project Overview

This project contains a series of 20 SQL queries that cover basic to intermediate SQL concepts. The dataset used for this practice represents retail sales transactions, including customer details, product categories, pricing, and sales information.

### 📊 Dataset Information

The dataset consists of the following columns:

transactions_id: Unique identifier for each transaction
sale_date: Date of the transaction

sale_time: Time of the transaction

customer_id: Unique identifier for each customer

gender: Gender of the customer (Male/Female)

age: Age of the customer

category: Product category (e.g., Clothing, Beauty, Electronics)

quantity: Number of units purchased

price_per_unit: Price per unit of the product

cogs: Cost of Goods Sold (COGS)

total_sale: Total revenue from the transaction

### 📝 SQL Queries Covered

This project includes solutions to 20 SQL practice questions, covering the following topics:

### Basic Queries

1.  Retrieve all transactions.
        
        select * from retail_sales; 
 


2. Find the maximum price_per_unit in the dataset.
    
        select * from retail_sales

       where price_per_unit = (select max(price_per_unit) from retail_sales)

       order by total_sale DESC
    
       limit 1;

3. Find the transaction with the highest total_sale.
     
        SELECT * FROM retail_sales

        WHERE total_sale = (SELECT MAX(total_sale) FROM retail_sales);


4. -- Find transactions from a specific date: Retrieve all transactions that occurred on "2022-11-05".

        select * from retail_sales 
        where sale_date in ("2022-11-05") ;



5. Retrieve customers who made purchases more than once.
       
        SELECT customer_id
        FROM retail_sales
        GROUP BY customer_id
        HAVING COUNT(*) > 1;

6. Calculate the total sales for each customer.
        
        select customer_id, sum(total_sale) from retail_sales 
        group by customer_id;

7. Find transactions where COGS is greater than 100.

        select * from retail_sales 
        where cogs > 100 ; 

8. Retrieve the most expensive product in each category.
       
        select * from retail_sales 
        where price_per_unit = (select max(price_per_unit) from retail_sales);

      
### Intermediate Queries:

1.Find total sales by category:


      select sum(total_sale), category from retail_sales 
      group by category
      order by category desc;

2. Find sales greater than a specific amount: Retrieve all transactions where the total_sale is greater than 1000.

        select * from retail_sales 
        where total_sale > 1000
        order by total_sale;

3. Find the maximum price per unit: Find the transaction with the highest price_per_unit.

        select * from retail_sales
        where price_per_unit = (select max(price_per_unit) from retail_sales)
        order by total_sale DESC
        limit 1;

4. Calculate the total quantity sold by category: Retrieve the total quantity sold for each product category.

        select category, count(quantiy) as quantity_count from retail_sales
        group by category;


5.Find average price per unit by gender: Calculate the average price_per_unit for each gender.

      select gender, avg(price_per_unit) from retail_sales
      group by gender;

6. Find the transaction with the highest total sale: Retrieve the transaction with the highest total_sale.

        select * from retail_sales 
        where total_sale = (select max(total_sale) from retail_sales);


7. List the number of transactions per month: Count the number of transactions that happened each month (based on sale_date).

        SELECT MONTH(sale_date) AS month, COUNT(*) AS transaction_count
        FROM retail_sales
        GROUP BY MONTH(sale_date)
        ORDER BY month;


8. Find customers who made purchases more than once: Retrieve the customer_id of customers who made multiple purchases.

        select customer_id, count(transactions_id) from retail_sales
        group by customer_id
        HAVING COUNT(*) > 1;

9. Find the percentage contribution of each category to total sales:

        SELECT category,
        SUM(total_sale) AS category_sales,
        (SUM(total_sale) / (SELECT SUM(total_sale) FROM retail_sales) * 100) AS percentage_contribution
        FROM retail_sales
        GROUP BY category
        ORDER BY percentage_contribution DESC;

10. Find the total cost of goods sold (COGS) per gender: Calculate the total COGS for each gender.

        select gender ,sum(cogs) as total_COGS from retail_sales
        group by gender;

11. Find the most expensive product by category: Retrieve the transaction with the highest price_per_unit for each product category.

        select * from retail_sales 
        where price_per_unit = (select max(price_per_unit) from retail_sales);


12. Find total sales for each customer: Calculate the total total_sale for each customer_id.

        select customer_id, sum(total_sale) from retail_sales
        group by customer_id;

13. Find transactions where the COGS is greater than 100:

        select * from retail_sales 
        where cogs > 100;


### 📚 Technologies Used

SQL (Structured Query Language)

MySQL / PostgreSQL (Tested on both)

GitHub for version control

### 🤝 Contributing

If you’d like to improve or add more SQL queries, feel free to fork the repository and submit a pull request. Any contributions are welcome!


Happy SQL Practicing! 🎯

