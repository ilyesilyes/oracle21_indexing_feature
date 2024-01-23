CREATE TABLE trans_demo 
(id int,
salary int,
dept_no int );

INSERT INTO trans_demo 
SELECT rownum, TRUNC(dbms_random.value(100, 9000)), TRUNC(dbms_random.value(1,10))
FROM DUAL 
CONNECT BY LEVEL <= 100000;


CREATE UNIQUE INDEX idx_tran_demo ON trans_demo(id);

explain plan FOR SELECT * FROM trans_demo WHERE id = 1000;
SELECT * FROM TABLE(dbms_xplan.display);

explain plan FOR SELECT COUNT(*)  FROM trans_demo;
SELECT * FROM TABLE(dbms_xplan.display);


-------------------------------------------------------------------------------------------------
CREATE TABLE trans_demo_with_primary
(id int NOT null,  -- oracle gonna CREATE a PRIMARY KEY INDEX 
salary int,
dept_no int );

INSERT INTO trans_demo_with_primary 
SELECT rownum, TRUNC(dbms_random.value(100, 9000)), TRUNC(dbms_random.value(1,10))
FROM DUAL 
CONNECT BY LEVEL <= 100000;

CREATE UNIQUE INDEX idx_tran_demo_with_primary ON trans_demo_with_primary(id);

explain plan FOR SELECT * FROM trans_demo_with_primary WHERE id = 1000;
SELECT * FROM TABLE(dbms_xplan.display);

explain plan FOR SELECT COUNT(*)  FROM trans_demo_with_primary;
SELECT * FROM TABLE(dbms_xplan.display);





--------some select ----- :)
SELECT * FROM  TRANS_DEMO;
SELECT trunc(10.0001) FROM DUAL ;


