-- Kimberly Tobias
-- Assignment 6
-- Due October 17

--1. Get the name and city of customers who live in A city that makes the MOST different kinds of products.
--(There are two cities that make the most different products. Return the name and city of customers from EITHER ONE)
select cust.name, p.city
from customers cust right outer join products p
on cust.city = p.city
group by p.city, cust.name
order by count(p.name) DESC
limit 2;

--2. Get the name and city of customers who live in ANY city that makes the MOST different knds of products. (There are two cities
--that make the most different products. Return the name and city of customers from BOTH)
select name, city
from customers c
where city in (select city
	       from (select city, sum(quantity)
	             from products
	             group by city
		      )
	       as sameCity)
			
--3. List the products who priceUSD is above the average priceUSD. $1.03 is average
select name, priceUSD
from products
where priceUSD > 
	(select avg(priceUSD)
	 from products);

--4. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from low to high.
select c.name, o.pid, o.dollars
from customers c, orders o
where c.cid = o.cid
order by o.dollars ASC;

--5. Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.
select c.name, (coalesce (sum(o.qty), 0))
from orders o RIGHT OUTER JOIN customers c
on o.cid = c.cid
group by c.name;

--6. Show the names of all customers who bought products from agents based in New York along with the names of the products they
--ordered, and the names of the agents who sold it to them.
select c.name, p.name, a.name
from customers c, agents a, orders o, products p
where a.aid = o.aid
and c.cid = o.cid
and o.pid = p.pid
and a.city = 'New York'
order by c.name ASC;

--7. Write a query to check the accuracy of the dollars column in the Orders table. This means calculating Orders.dollars from 
--data in other tables and comparing those values to the values in Orders.dollars. Return all rows in Orders where Orders.dollars
--is incorrect, if any.
