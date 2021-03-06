﻿--Kimberly Tobias
--Due 9/22/14
--Lab 3

--1. List the name and city of agents named Bond
select name, city
from agents
where name = 'Bond';

--2. List pid, name, and quantity of products costing more than US $.99
select pid, name, quantity
from products
where priceusd > .99;

--3. List the ordno and qty of all orders
select ordno, qty
from orders;

--4. List the names and cities of customers in Duluth
select name, city
from customers
where city = 'Duluth';

--5. List the names of agents not in NY and not in London
select name
from agents
where city != 'New York' and city != 'London';

--6. List all data for products not in Dallas or Duluth that cost US$1 or less
select *
from products
where city != 'Dallas' and city != 'Duluth' and priceusd < 1;

--7. List all data for orders in January or April
select *
from orders
where mon = 'jan' or mon = 'apr';

--8. List all data for orders in February more than US$200
select *
from orders
where mon = 'feb' and dollars > 200;

--9. List all orders from the customer whose cid is C005
select *
from orders
where cid = 'C005';