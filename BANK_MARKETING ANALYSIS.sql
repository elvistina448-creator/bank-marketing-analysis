--customers that are in the dataset

SELECT COUNT(*) AS total_customers
FROM bank_marketing

--coustomers subscribed

SELECT y, COUNT(*) AS Customers
FROM bank_marketing
GROUP BY y;

--average customer age

SELECT AVG (age) AS average_age
From bank_marketing

--average account balance
SELECT AVG (balance) AS average_balance
FROM bank_marketing

--youngest customer
SELECT MIN (age) AS youngest_customer
FROM bank_marketing

--oldest customer
SELECT MAX (age) AS oldest_customer
FROM bank_marketing

--Job Categories that are there

SELECT COUNT(DISTINCT job) AS total_job_categories
FROM bank_marketing;

--Distinct job categories
SELECT DISTINCT job
FROM bank_marketing;

--Number of customers in each job category
SELECT job, COUNT (*) AS Total_customers
FROM bank_marketing
GROUP BY job
Order by total_customers DESC 

-- Jobs that have the highest number of subscribers
SELECT job, COUNT (*) AS subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY job 
ORDER BY subscribers DESC;

-- marital status with the most subscribes 

SELECT marital, COUNT(* ) AS subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY marital  
ORDER BY subscribers DESC 

-- education level with the most subscribes
SELECT education, COUNT (*) AS Subscribers
FROM bank_marketing
WHERE y= 'yes'
GROUP BY education
ORDER BY Subscribers DESC

-- Checking if older customers subscribe more than younger customers
SELECT
CASE
WHEN age < 30 THEN 'Young'
WHEN age >= 30 AND age < 50 THEN 'Middle-aged'
ELSE 'Older'
END AS age_group,
COUNT(*) AS subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY age_group
ORDER BY subscribers DESC;

-- How many subscribers fall into each balance category 
SELECT
CASE 
WHEN balance < 10000 THEN 'low_balance'
ELSE 'High_balance'
END AS account,
COUNT(*) AS subscribers
FROM bank_marketing
WHERE y= 'yes'
GROUP BY account
ORDER BY subscribers DESC;

--Contact method that resulted in the most subscriptions

SELECT contact, COUNT (*) AS subscriptions
FROM bank_marketing
WHERE y = 'yes'
GROUP BY contact
ORDER BY subscriptions DESC;

--IF customers with housing loans subscribe more
SELECT housing, COUNT (*) AS Subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY housing
ORDER BY Subscribers DESC;

SELECT housing, COUNT(*) AS total_customers
FROM bank_marketing
GROUP BY housing
ORDER BY total_customers DESC;

-- If customers with personal loans subscribe more
SELECT loan,COUNT (y) AS Subscribers
FROM bank_marketing
GROUP BY loan

-- If customers with personal loans subscribe more
SELECT loan, COUNT(*) AS subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY loan
ORDER BY subscribers DESC;

---If customers who had credit in default subscribe more
SELECT default_status,Count(*) AS subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY default_status
ORDER BY subscribers DESC;

-- Average account balance of subscribers vs non-subscribers. 
SELECT y AS subscription_status, AVG(balance) AS avg_balance
FROM bank_marketing
GROUP BY y;

--Month that recorded the highest number of subscriptions? 

SELECT month, COUNT (*) Subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY month  
ORDER BY subscribers DESC

--Average call duration for subscribers and non-subscribers? 

SELECT y AS subscription_status, AVG(duration) avg_duration
FROM bank_marketing
GROUP BY y

-- Previous campaign outcome (poutcome) resulted in the most subscriptions 
SELECT poutcome , COUNT (*) AS subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY poutcome
ORDER BY subscribers DESC;

-- The numnber of contacts (campaign) were made for customers who subscribed 
SELECT campaign, COUNT (*) AS subscribers 
FROM bank_marketing
WHERE y = 'yes'
Group by campaign
ORDER BY subscribers DESC
-- Previous Campaign Outcome with the Highest Number of Subscriptions
SELECT poutcome, COUNT(*) AS subscribers
FROM bank_marketing
WHERE y = 'yes'
GROUP BY poutcome
ORDER BY subscribers DESC;

-- Job category with the highest subscription rate
SELECT job, COUNT(*) AS total_customers,
SUM( CASE
WHEN y = 'yes' THEN 1
ELSE 0
END) AS subscribers,
ROUND(SUM(CASE
WHEN y = 'yes' THEN 1
ELSE 0
END) * 100.0 / COUNT(*), 2) AS subscription_rate
FROM bank_marketing
GROUP BY job
ORDER BY subscription_rate DESC
LIMIT 5;

-- Education level with the highest subscription rate 

SELECT education, Count (*) total_customers,
SUM(CASE 
WHEN y = 'yes'then 1
ELSE 0 END)AS subscribers,
ROUND(SUM(CASE 
WHEN y = 'yes'then 1
ELSE 0 END)*100.0/Count (*),2) AS subscription_rate
FROM bank_marketing
GROUP BY education
ORDER BY subscription_rate DESC;

-- Marital status with the highest subscription rate
SELECT marital, COUNT (*) AS total_customers,
SUM(CASE
WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribers,ROUND(
SUM(CASE
WHEN y = 'yes' THEN 1 ELSE 0 END) *100.0/COUNT (*),2) AS subscription_rate
FROM bank_marketing
GROUP BY marital
ORDER BY subscription_rate DESC;

-- Housing loan subscription rate 
SELECT housing , COUNT (*) AS total_customers,
SUM(CASE
WHEN y='yes' then 1 ELSE 0 END) AS subscribers,
ROUND(SUM(CASE
WHEN y='yes' then 1 ELSE 0 END)*100.0/COUNT(*)) AS subscription_rate
FROM bank_marketing
GROUP BY housing
ORDER BY subscription_rate DESC ;

-- Personal loan subscription rate
SELECT loan, COUNT (*) AS total_customers,
SUM(CASE 
WHEN y ='yes'then 1 ELSE 0 END) AS subscribers,
ROUND(SUM(CASE 
WHEN y ='yes'then 1 ELSE 0 END)*100.0/COUNT(*))AS subscription_rate
FROM bank_marketing
GROUP BY loan
ORDER BY subscription_rate DESC;

-- Contact method conversion rate
SELECT contact, COUNT (*) AS total_customers,
SUM(Case
WHEN y ='yes'then 1 ELSE 0 END)AS subscribers,
ROUND(SUM(Case
WHEN y ='yes'then 1 ELSE 0 END)*100.0/COUNT(*),2) AS subscription_rate
FROM bank_marketing
GROUP BY contact
ORDER BY subscription_rate DESC;

--Age group Conversion Rate
SELECT
(CASE
WHEN age < 30 THEN 'young'WHEN age < 50 THEN 'middle age'ELSE 'old'
END)AS age_group,COUNT(*) AS total_customers,SUM(CASE
WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribers,
ROUND( SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2
) AS subscription_rate
FROM bank_marketing
GROUP BY age_group
ORDER BY subscription_rate DESC


-- Day of the month with the highest subscription rate
SELECT day,COUNT(*) AS total_customers,
SUM(CASE
WHEN y='yes'then 1 ELSE 0 END) AS subscribers,
ROUND(SUM(CASE
WHEN y='yes'then 1 ELSE 0 END)*100.0/COUNT(*),2) AS subscription_rate
FROM bank_marketing
GROUP BY day
ORDER BY subscription_rate DESC
LIMIT 5;

--Month with the highest subscription rate
SELECT month,COUNT(*) AS total_customers,SUM(CASE
WHEN y='yes'then 1 ELSE 0 END) AS subscribers,Round(SUM(CASE
WHEN y='yes'then 1 ELSE 0 END)*100.0/COUNT(*),2)AS subscription_rate
FROM bank_marketing
GROUP BY month
ORDER BY subscription_rate DESC
Limit 5;


