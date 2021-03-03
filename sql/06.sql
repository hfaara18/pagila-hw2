/*
 * Management wants to purchase new films that they don't already have.
 * Select a list of all films in the film table that are not in the inventory table.
 *
 * HINT:
 * This can be done by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 */
select distinct title from film 
    where film_id not in (
        select film_id from film 
            inner join inventory using (film_id) 
    ) 
order by title;
