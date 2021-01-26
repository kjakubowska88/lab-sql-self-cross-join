-- Instructions
-- Get all pairs of actors that worked together.
-- Get all pairs of customers that have rented the same film more than 3 times.
-- Get all possible pairs of actors and films.

-- 1 Get all pairs of actors that worked together

select f.title, sub1.actor_id, sub2.actor_id
from film_actor as sub1
cross join film_actor as sub2
on sub1.film_id = sub2.film_id
and sub1.actor_id <> sub2.actor_id
join film f
on f.film_id = sub1.film_id;


-- 2 Get all pairs of customers that have rented the same film more than 3 times.
-- rental - rental_id, customer_id, inventory_id
-- inventory- inventory_id, film_id

select c1.customer_id as Customer1, c1.first_name As first_name, 
c2.customer_id as Customer2, c2.first_name as first_name, c2.last_name as last_name, 
count(*) as movies
from customer c1
inner join rental as r1 on r1.customer_id = c1.customer_id
inner join inventory as i1 on r1.inventory_id = i1.inventory_id
inner join film as f on i1.film_id = f.film_id
inner join inventory as i2 on i2.film_id = f.film_id
inner join rental as r2 on r2.inventory_id = i2.inventory_id
inner join customer as c2 on r2.customer_id = c2.customer_id
where c1.customer_id > c2.customer_id
group by c1.customer_id, c2.customer_id
having count(*) > 3
order by movies desc;

-- 3 Get all possible pairs of actors and films.

select
a.last_name, f.film_id, f.title
from actor as  a
cross join film as f;