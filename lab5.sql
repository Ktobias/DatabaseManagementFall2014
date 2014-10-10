-- Kimberly Tobias
-- Lab 5
-- Due October 10

-- 1. Get the cities of agents booking an order for customer "Tiptop". This time use joins; no sub-queries.
select distinct agents.city 
from customers, agents, orders
where customers.cid = orders.cid
  AND agents.aid = orders.aid
  AND customers.name = 'Tiptop'
order by city asc;


-- 2. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.
-- Use joins this time; no sub-queries.
select distinct products.pid 
from orders, agents, customers, products
where customers.cid = orders.cid
  AND orders.pid = products.pid
  AND customers.city = 'Kyoto'
order by pid asc;

-- 3. Get the names of customers who have never placed an order. Use a subquery.
select name
from customers
where cid not in (select cid
	          from orders)
order by cid asc;

-- 4. Get the names of customers who have never placed an order. Use an outer join. 
select customers.name 
from customers 
left outer join orders
	on customers.cid = orders.cid
where orders.cid is null
order by name asc;

-- 5. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.
select distinct customers.name, agents.name
from customers, agents, orders
where customers.cid = orders.cid
  AND agents.aid = orders.aid
  AND agents.city = customers.city;
  
-- 6. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the
-- the customer has ever placed an order with that agent. 
select distinct agents.name, customers.name, agents.city, customers.city
from customers, agents, orders
where agents.city = customers.city;

-- 7. Get the name and city of customers who live in the city that makes the fewest different kinds of products.
-- (Hint: Use count and group by on the Products table.)
select customers.name, customers.city
from customers
where customers.city = (select city
		        from products
		        group by city
			limit 1	)