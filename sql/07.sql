/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */
select distinct title
from film
join inventory using (film_id)
where inventory_id is not null and film_id not in (
    select film_id
    from inventory
    join rental using (inventory_id)
    join customer using (customer_id)
    join address using (address_id)
    join city using (city_id)
    join country using (country_id)
    where country='United States'
)
order by title;
