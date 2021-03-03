/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
select title from film 
    where film_id in (
        select inventory.film_id from inventory 
            left join rental on inventory.inventory_id=rental.inventory_id 
                where customer_id=1 group by inventory.film_id 
                                        having count(inventory.film_id) > 1
    );
