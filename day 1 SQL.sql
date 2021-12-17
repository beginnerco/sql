-- the hello world print state of the SQL world: the seslect all command
-- select <colums> from <TABLE>;
-- * means every column
select * from  
actor; 

select first_name, last_name
from actor;

select first_name, Last_name
from actor a where first_name like 'Nick';

select first_name, last_name
from actor 
where first_name = 'Nick';

select first_name, last_name
from actor 
where first_name like 'N%';

select first_name, last_name, actor_id 
from actor 
where first_name like 'T__';

-- comparison operators useful for numerical values
-- greater than (>) and less than(<)

-- Check out whats in the payment table - select everything

select *
from payment;

select customer_id, amount, payment_date
from payment 
where amount <=2;

select customer_id, amount, payment_date
from payment 
where amount  <=2
order by amount asc;

select customer_id, amount, rental_id
from payment 
where amount between 2 and 7.99
order by amount desc;

select count(amount)
from payment;

select sum(amount)
from payment;

select sum(amount), avg(amount)
from payment;

select avg(amount) as average_payment_amount
from payment 


select sum(amount), count(amount), payment.customer_id, first_name, last_name, create_date, active
from payment 
join customer 
on customer.customer_id  = payment.customer_id 
group by payment.customer_id, first_name, last_name, create_date, active
having sum(amount) >= 1000
order by count(amount) desc;


1. --How many actors are there with the last name ‘Wahlberg’? 2
  select last_name 
  from actor 
  where last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99? 5,568
select sum(amount), count(amount) 
from payment 
where amount between 3.99 and 5.99;

--3. What film does the store have the most of? (search in inventory)  Zorro Ark
select inventory_id, film_id, store_id
from inventory 
order by inventory_id  desc;

--4. How many customers have the last name ‘William’? 0  
select first_name, last_name
from dealership_customer 
where last_name = 'William';

--5. What store employee (get the id) sold the most rentals?  2 
select rental_id, staff_id, last_update 
from rental 
order by staff_id desc; 

--6. How many different district names are there? 378

select count(distinct district)
from address;

--7. What film has the most actors in it? (use film_actor table and get film_id) film 508 has the most actors
  select sum(actor_id), count(actor_id), film_id
  from film_actor 
  group by film_id 
  order by count(actor_id) desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 21
 select count(last_name)
 from customer
 where last_name like '%es';


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 
--for customers  with ids between 380 and 430? (use group by and having > 250) 3 payment amounts are more than 250 for customer_id between 380 and 430

select amount, count(amount)
from payment
where customer_id between 380 and 430
group by amount 
having count(amount) > 250;


--10.  Within the film table, how many rating categories are there? And what rating has the most movies total? 5 rating and PG-13 HAS THE MOST TITLES
select count(rating), rating 
from film
group by rating 
order by count desc;