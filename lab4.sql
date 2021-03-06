﻿--Kimberly Tobias
--Lab 4
--Due October 3

-- 1. Get the cities of agents booking an order for customer "TipTop"
select city
from agents
where aid in (select aid
	      from orders
	      where cid in (select cid
			    from customers 
			    where name = 'Tiptop'
			    )
	     )
order by city ASC;
     
-- 2. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.
--    (This is not the same as asking for pids of products ordered by a customer in Kyoto.)
select pid
from orders
where aid in (select aid
	      from orders
	      where cid in (select cid
			    from customers 
			    where city = 'Kyoto'
			    )
	     )
order by pid DESC;
	
-- 3. Find the cids and names of customers who never placed an order through agent a04. 
select cid, name
from customers
where cid != (select cid
	      from orders
	      where aid = 'a04'
	     )
order by name ASC;
	     
-- 4. Get the cids and names of customers who ordered both product p01 and p07. 
select cid, name
from customers
where cid in (select cid
	      from orders
	      where pid = 'p01'
	     )
  AND cid in (select cid
	      from orders
	      where pid = 'p07'
	     )
order by name ASC;
		
-- 5. Get the pids of products ordered by any customers whoever placed an order through agent a04.
select pid
from orders
where cid in (select cid
	      from orders
	      where aid = 'a04'
	     )
order by pid ASC;
	     
-- 6. Get the names and discounts of all customers who place orders through agents in Dallas or Newark.
select name, discount
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid
		      from agents
		      where city = 'Dallas'
			OR city = 'Newark'
			    )
	      )
order by name ASC;
	      
-- 7. Find all customers who have the same discount as that of any customers in Dallas or Kyoto.
select *
from customers
where discount in (select discount
	           from customers 
	           where city = 'Dallas' or city = 'Kyoto'
	          )
order by name ASC;
	          