CREATE TABLE PIZZA_SALES (
pizza_id int,
order_id int,
pizza_name_id varchar,
quantity int,
order_date date,
order_time	time,
unit_price	float,
total_price	float,
pizza_size varchar,
pizza_category	varchar,
pizza_ingredients	varchar,
pizza_name varchar

)

SELECT * FROM PIZZA_SALES


--1 Total Revenue:

SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales


--817860.0499999928


--2  Average Order Value

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) 
AS Avg_order_Value
FROM pizza_sales

--38.307262295081635


--3  Total Pizzas Sold

SELECT SUM(quantity) 
AS Total_pizza_sold
FROM pizza_sales

--49574


-- 4 Total Orders

SELECT COUNT(DISTINCT order_id)
AS Total_Orders 
FROM pizza_sales


--21350


--5  Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

--2.32



--6 B. Daily Trend for Total Orders


SELECT 
    TO_CHAR(order_date, 'Day') AS order_day,
    COUNT(DISTINCT order_id) AS total_orders,
    EXTRACT(DOW FROM order_date) AS day_num
FROM pizza_sales
GROUP BY order_day, day_num
ORDER BY day_num

--"order_day"	"total_orders"	"day_num"
"Sunday   "          	2624	0
"Monday   "         	2794	1
"Tuesday  "	            2973	2
"Wednesday"	            3024	3
"Thursday "	            3239	4
"Friday   "	            3538	5
"Saturday "	            3158	6



--7 C. Monthly Trend for Orders


SELECT 
    TO_CHAR(order_date, 'month') AS Month_name,
    COUNT(DISTINCT order_id) AS total_orders,
    EXTRACT(DOW FROM order_date) AS day_num
FROM pizza_sales
GROUP BY Month_name, day_num
ORDER BY day_num



--8 D. % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

------
"pizza_category"	"total_revenue"	"pct"
"Supreme"	           208197.00	25.46
"Chicken"	           195919.50	23.96
"Veggie"	           193690.45	23.68
"Classic"	           220053.10	26.91




--E. % of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size 

------
"pizza_size"	"total_revenue"	"pct"
"L"	375318.70	45.89
"M"	249382.25	30.49
"S"	178076.50	21.77
"XL"	14076.00	1.72
"XXL"	1006.60	0.12


--F. Total Pizzas Sold by Pizza Category


SELECT 
    pizza_category, 
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
WHERE TO_CHAR(order_date, 'MM') = '02'
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC

-------
"pizza_category"	"total_quantity_sold"
"Classic"	         1178
"Supreme"	         964
"Veggie"           	 944
"Chicken"            875



--G. Top 5 Pizzas by Revenue


SELECT 
    pizza_name, 
    SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5

----
"pizza_name"	            "total_revenue"
"The Thai Chicken Pizza"	    43434.25
"The Barbecue Chicken Pizza"	42768
"The California Chicken Pizza"	41409.5
"The Classic Deluxe Pizza"	    38180.5
"The Spicy Italian Pizza"	    34831.25




--H. Bottom 5 Pizzas by Revenue


SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5

---
"pizza_name"	                  "total_revenue"
"The Brie Carre Pizza"          	11588.4999999999
"The Green Garden Pizza"	        13955.75
"The Spinach Supreme Pizza"	        15277.75
"The Mediterranean Pizza"	        15360.5
"The Spinach Pesto Pizza"        	15596


--I. Top 5 Pizzas by Quantity

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5

--
"pizza_name"	               "total_pizza_sold"
"The Classic Deluxe Pizza"   	2453
"The Barbecue Chicken Pizza"	2432
"The Hawaiian Pizza"	        2422
"The Pepperoni Pizza"	        2418
"The Thai Chicken Pizza"	    2371


--J. Bottom 5 Pizzas by Quantity


SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5


--
"pizza_name"	         "total_pizza_sold"
"The Brie Carre Pizza"	        490
"The Mediterranean Pizza"   	934
"The Calabrese Pizza"	        937
"The Spinach Supreme Pizza"	    950
"The Soppressata Pizza"	        961


--K. Top 5 Pizzas by Total Orders


SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5

--
"pizza_name"            	"total_orders"
"The Classic Deluxe Pizza"	   2329
"The Hawaiian Pizza"	       2280
"The Pepperoni Pizza"	       2278
"The Barbecue Chicken Pizza"   2273
"The Thai Chicken Pizza"	    2225

--L. Borrom 5 Pizzas by Total Orders


SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5 

--
"pizza_name"	        "total_orders"
"The Brie Carre Pizza"  	  480
"The Mediterranean Pizza"	  912
"The Calabrese Pizza"	      918
"The Spinach Supreme Pizza"	  918
"The Chicken Pesto Pizza"	  938



















