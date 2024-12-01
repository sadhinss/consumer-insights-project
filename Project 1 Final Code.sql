/* This query identifies top 5 customers with highest cumulative purchase amount. It also shows
pattern in terms of age, gender and location */

select *
from 
	"PROJECT".customer_insights;

-- Step 1: validate if there is multiple transaction for a customer

select 
	distinct count(customer_id)
from 
	"PROJECT".customer_insights;

-- There are no multiple customer_id

-- Step 2: Find top 5 customers 

select 
	customer_id, 
	purchase_amount_usd, 
	age, 
	gender, 
	location
from 
	"PROJECT".customer_insights
order by 
	purchase_amount_usd desc
limit 5;

/* Summary: Top 5 customers have all paid 100$. Age ranges from 20 to 37 and gender is all male. 
Location varies */

--

/* This query explores which age group has highest purchase amount and sub categorizes by gender */

-- Step 1: find max and min age
select 
	min(age),
	max(age)
from 
	"PROJECT".customer_insights;

--Step 2: form different age groups

select 
	case
		when age between 18 and 24 then '18-24'
		when age between 24 and 34 then '25-34'
		when age between 35 and 44 then '35-44'
		when age between 45 and 54 then '45-54'
		when age between 55 and 64 then '55-64'
		else '65+'
	end as age_group
from 
	"PROJECT".customer_insights;

-- Step 3: find which age group sub-cateogrized by gender has the highest purchasing amount

select 
	age_group, 
	gender,
	round(avg(purchase_amount_usd),2) as avg_amount
from 
	(select 
	*,
	case
		when age between 18 and 24 then '18-24'
		when age between 25 and 34 then '25-34'
		when age between 35 and 44 then '35-44'
		when age between 45 and 54 then '45-54'
		when age between 55 and 64 then '55-64'
		else '65+'
	end as age_group
	from "PROJECT".customer_insights)
group by 
	age_group,
	gender
order by 
	avg_amount desc;

	
/* This query finds the top 5 items purchased and how their popularity changes from season */

-- Step 1: create a temporary table of the top 5 items purchased
with top_items as
	(select item_purchased, 
	count(item_purchased) as c
	from "PROJECT".customer_insights
	group by item_purchased 
	order by c desc
	limit 5)

--Step 2: Find the count of item purchased each season for top 5 items purchased

select 
	t.item_purchased,
	ci.season,
	count(ci.item_purchased) as season_purchased
from 
	"PROJECT".customer_insights as ci
join
	top_items as t on ci.item_purchased = t.item_purchased
group by 
	t.item_purchased,
	ci.season
order by 
	t.item_purchased,
	ci.season;


/* This query finds the average purchase amount per category. It further shows best performing 
and worst performing categories */

select 
	category, 
	round(avg(purchase_amount_usd),2) as avg
from 
	"PROJECT".customer_insights
group by 
	category
order by 
	avg desc;

/* Top cateogry is Footwear with average purchase payment of $60.26 and worst performing category
is Outwear with $57.17 */


/* Identify the season with the highest number of purchase. Find the most purchased items in that 
season */

-- Step 1: Find the season with highest number of purchase

select 
	season,
	count(*)
from 
	"PROJECT".customer_insights
group by 
	season
order by 
	count(*) desc;

-- Step 2: Find the top 10 most purchased items in Spring

select 
	item_purchased,
	count (*) as  quantity
from 
	"PROJECT".customer_insights
where 
	season = 'Spring'
group by
	item_purchased 
limit 10;
		

/* This query determines the percentage of purchase where a promo code was used. It also compares 
average purchase amount with and without promo code */

/* Step 1: To find the percentage I used a case function to find the count when 'Yes' and divided
by total count */

select 
	round(sum
	(case
		when promo_code_used = 'Yes' then 1
		else 0 
	end) * 100 / count(*), 2) as C
from 
	"PROJECT".customer_insights;

-- Step 2: found the average purchase amount after grouping them by Yes and No
select 
	promo_code_used, 
	round(avg(purchase_amount_usd),2)
from "PROJECT".customer_insights
group by
	promo_code_used;

/* This query finds the top 3 locations where a discount was used */

select 
	location, 
	count(location) as c
from 
	(select *
	from 
		"PROJECT".customer_insights
	where 
		discount_applied = 'Yes')
group by 
	location
order by 
	c desc
limit 3;

/* We find the top 3 locations which are Indiana, Nevada and West Virginia in descending order */


/* Find what percentage of customers are recurring buyers who used a promo code */

select 
	round(sum
	(case 
		when promo_code_used = 'Yes' and previous_purchases > 1 then 1
		else 0
	end) * 100 / count(*), 2)
from 
	"PROJECT".customer_insights
where 
	promo_code_used = 'Yes'



/* This query is used to analyze the different payment_method */

select 
	payment_method,
	count(payment_method) as c
from 
	"PROJECT".customer_insights
group by 
	payment_method
order by 
	c desc;

/* This query is used to analyze the different payment_methods for high value customers 
(top 10% by purchase amount) */

-- Step 1: Find the data of high value customers
select * 
from
	(select *, 
	percent_rank() over (order by purchase_amount_usd desc) as rank
from 
	"PROJECT".customer_insights) as ranked_sale
where 
	rank <= .10;

-- Step 2: Analyze the different payment methods using subquery

select 
	payment_method,
	count(payment_method) as c
from 
	(select *, 
		percent_rank() over (order by purchase_amount_usd desc) as rank
	from 
		"PROJECT".customer_insights) as ranked_sale
where 
	rank <= .10
group by 
	payment_method
order by 
	c desc;

/* This query will find the percentage of consumer who chose free shipping */

select
	round (100 *sum 
	(case
		when shipping_type = 'Free Shipping' then 1
		else 0
	end) / count(*),2) as free_shipping
from 
	"PROJECT".customer_insights;

/* This query will find the average purchase amount of consumer with free
and express shipping*/

select 
	shipping_type, 
	round(avg(purchase_amount_usd),2)
from 
	"PROJECT".customer_insights
group by 
	shipping_type
having 
	shipping_type = 'Express' or shipping_type = 'Free Shipping';

/* This query will be used to find customers with more than 5 previous purchases. We will also find
what percentage of these customer has an active status*/

-- find customers with more than 5 previous purchases
select *
from 
	"PROJECT".customer_insights
where 
	previous_purchases > 5;

-- find cutomers with more than 5 purchases who also has active status
select * 
from 
	(select *
	from 
		"PROJECT".customer_insights
	where 
		previous_purchases > 5)
where 
	subscription_status = 'Yes';

--find percentage of cutomers with more than 5 purchases who also has active status

select 
	round(sum
	(case
		when subscription_status = 'Yes' then 1 
		else 0
	end) *100 / count(*),2) as perc
from 
	"PROJECT".customer_insights
where  
	previous_purchases > 5;

-- find number of consumers who buy monthly and anually

select * 
from 
	"PROJECT".customer_insights;

select 
	sum
	(case
		when frequency_of_purchases = 'Monthly' then 1
		else 0
	end) as monthly_purchase,
	sum(
	case
		when frequency_of_purchases = 'Annually' then 1
		else 0
	end) as annual_purchase
from 
	"PROJECT".customer_insights;

-- find items purchased with highest review rating and pattern in terms of category, color and season

/* Step 1: calculate the top 10 rated item purchased */

select 
	item_purchased, 
	round(avg(review_rating),2)
from 
	"PROJECT".customer_insights
group by 
	item_purchased
order by avg
	(review_rating) desc
limit 10;

/* Step 2: find highest rated items and group them by category, color and season */

select 
	item_purchased, 
	round(avg(review_rating),2),
	color,
	category,
	season
from 
	"PROJECT".customer_insights
group by 
	item_purchased, 
	color,
	category,
	season
order by 
	avg(review_rating) desc
limit 20;

-- Find average review rating by category 

select 
	category,
	round(avg(review_rating),2) as review_rating
from 
	"PROJECT".customer_insights
group by
	category;

-- Find which category has the most variation in review ratings

select 
	category,
	round(avg(review_rating),2) as review_rating,
	round(stddev_samp (review_rating),3) as stddev_rating

from 
	"PROJECT".customer_insights
group by
	category
order by 
	stddev_rating desc
limit 1;




