

SELECT * FROM customer_detail_idx WHERE customer_id = 1 

--this will be converted to this sql request
SELECT * FROM customer_detail_idx WHERE customer_id = 1 AND regin = 'AP'
UNION 
SELECT * FROM customer_detail_idx WHERE customer_id = 1 AND region = 'EMEA';
-- so oracle can use skip index scan insteat of full table scan 


-- its been like we use tow of unique index scan like this sql request 
--this sql request use a unique index scan 
explain plan FOR SELECT * FROM customer_detail_idx WHERE  customer_id = 1 AND region = 'AP';
SELECT * FROM table(dbms_xplan.display)




