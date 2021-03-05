/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * HINT:
 * This can be solved using either a LEFT JOIN or the NOT IN operator.
 */
select last_name, first_name from actor 
    where (first_name, last_name) not in (
        select first_name, last_name from actor 
            join customer using (first_name, last_name)
        )
order by last_name, first_name;
