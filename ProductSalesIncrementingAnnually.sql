/* Product Sales data */

CREATE TABLE tblProductSalesAmount (
    product_brand varchar(50)
    , sales_amount integer
    , year_of_sales character varying(10)
)
;

INSERT INTO tblProductSalesAmount VALUES
    ('Barfi', 450, 2019)
  , ('Barfi', 475, 2020)
  , ('Barfi', 462, 2021)
  , ('Barfi', 445, 2022)
  , ('Peda', 400, 2019)
  , ('Peda', 505, 2020)
  , ('Peda', 356, 2021)
  , ('Peda', 278, 2022)
  , ('Sheera', 305, 2019)
  , ('Sheera', 389, 2020)
  , ('Sheera', 520, 2021)
  , ('Sheera', 572, 2022)
  , ('Sheera', 594, 2023)
  ;


with cte_tblProductSalesAmount as
	(SELECT *, (case when sales_amount < lead(sales_amount, 1, sales_amount+1) over(partition by product_brand order by year_of_sales)
			          /*'lead' function second parameter [i.e. offset-value, meaning that how many next records do we want to compare it 
				        with [by default is 1]
				        Third parameter is the default value that gets returned if there is no next record
				        In this case, we do "sales_amount+1" so that the lead func-expression always returns TRUE
			          [thus final output becomes always 1] because while comparison "sales_amount+1" will always be
				        greater than "sales_amount" */
		          then 1
              else 0
             end) AS "Flag"
	FROM tblProductSalesAmount)
SELECT *
FROM tblProductSalesAmount
WHERE product_brand NOT IN (SELECT product_brand
			    FROM cte_tblProductSalesAmount
			    WHERE "Flag"=0)	
;
