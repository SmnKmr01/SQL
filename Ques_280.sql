CREATE TABLE product_reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    category_id INT,
    rating DECIMAL(2,1)
);

INSERT INTO product_reviews VALUES
(1, 201, 1, 4.5),
(2, 201, 1, 3.5),
(3, 202, 1, 2.0),
(4, 202, 1, 2.5),
(5, 203, 2, 5.0),
(6, 203, 2, 4.5),
(7, 204, 2, 3.0);

select * from product_reviews


--Find products with the lowest average rating per category



with cte as(
select 
	product_id, category_id,
	AVG(rating) as avg_rating,
	ROW_NUMBER() over (partition by category_id order by AVG(rating)) as rn
	from product_reviews
	group by product_id, category_id
)
select product_id, category_id,avg_rating
from cte 
where rn = 1