--* Write a query to get the number of copies of a film 
--title that exist in the inventory. 
--The results should look like those shown in the following image.
--Your challenge is to use a subquery 
--(a query embedded within another query) instead of a join.

SELECT f.title, 
       (SELECT COUNT(i.film_id) 
		FROM inventory i 
		WHERE i.film_id = f.film_id)as num_of_copy
  FROM film f 
  order by f.title;
  

 --Create a view named `title_count` from the above query.
 CREATE VIEW title_count AS
	SELECT f.title, 
       (SELECT COUNT(i.film_id) FROM inventory i WHERE i.film_id = f.film_id)as num_of_copy
  	FROM film f 
  	ORDER BY f.title;
select * from title_count;


--* Query the newly created view to find all the titles that have 7 copies.
select * from title_count where num_of_copy = 7;