CREATE DATABASE sql2_inclass_2;
use sql2_inclass_2;


-- --------------------------------------------------------------
# Dataset Used: wine.csv
-- --------------------------------------------------------------



# Q1. Rank the winery according to the quality of the wine (points).



# Q2. Give a dense rank to the wine varities on the basis of the price.


# Q3. Use aggregate window functions to find the average of points for each row within its partition (country). 
-- -- Also arrange the result in the descending order by country.


-----------------------------------------------------------------
# Dataset Used: students.csv
-- --------------------------------------------------------------


# Q4. Rank the students on the basis of highest marks each subjectwise.



# Q5. Provide the new roll numbers to the students on the basis of their names alphabetically.




# Q6. Use the aggregate window functions to display the sum of marks in each row 
-- within its partition (Subject).




# Q7. Display the records from the students table where partition should be done 
-- on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.



/*select*,sum(marks) over(partition by subject) from students; -- by default it will give unbounded precceding and unbounded following*

/*
-- SELECT *,
-- SUM(marks) Over(PARTITION BY subject ORDER BY marks
-- ROWS BETWEEN UNBOUNDED PRECEDING   AND CURRENT ROW)  AS 'Subject_wise_total_marks'
-- FROM students; -- */



# Q8. Find the dense rank of the students on the basis of their marks subjectwise.
--  Store the result in a new table 'Students_Ranked'




-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------


# Q9. Show day, number of users and the number of users the next day 
-- (for all days when the website was used) and website id is 1;



# Q10. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus'



# Q11. Write a query that displays the statistics for website_id = 3 such that for each row, show the day, the number of users and the smallest number of users ever.




# Q12. Write a query that displays name of the website and it's launch date. The query should also display the date of recently launched website in the third column.



-----------------------------------------------------------------
# Dataset Used: play_store.csv and sale.csv
-----------------------------------------------------------------
# Q13. Write a query thats orders games in the play store into three buckets as per editor ratings received  




# Q14. Write a query that displays the name of the game, the price, the sale date and the 4th column should display 
# the sales consecutive number i.e. ranking of game as per the sale took place, 
-- so that the latest game sold gets number 1. Order the result by editor's rating of the game




# Q15. Write a query to display games which were both recently released and recently updated. For each game, show name, 
#date of release and last update date, as well as their rank
#Hint: use ROW_NUMBER(), sort by release date and then by update date, both in the descending order




# Dataset Used: movies.csv, customers.csv, ratings.csv, rent.csv
-----------------------------------------------------------------




# Q16. Write a query that displays basic movie informations as well as the previous rating provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.


# Q17. For each movie, show the following information: title, genre, average user rating for that movie 
# and its rank in the respective genre based on that average rating in descending order (so that the best movies will be shown first).




# Q18. For each rental date, show the rental_date, the sum of payment amounts (column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between these two values.



