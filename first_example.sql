GRANT ALL PRIVILEGES TO ILYES


CREATE TABLE INDEX_DEMO AS SELECT * FROM all_objects

--create primary key index 
ALTER TABLE INDEX_DEMO ADD CONSTRAINT PRIMARY KEY PK_INDEX_DEMO (owner, object_name, OBJECT_type, object_id);
--create unique index 
CREATE UNIQUE INDEX IDX_OBJECT_ID ON INDEX_DEMO(OBJECT_id);



--show the execution plan on index_demo table 
EXPLAIN plan FOR SELECT * FROM INDEX_DEMO WHERE OBJECT_NAME = 'DUAL';
SELECT * FROM TABLE (dbms_xplan.DISPLAY);
-- here we have a full access to the table because we dont respect the pk_index_demo index order 
--cpu cost is 27 + 27 + 26

--show the excecution plan using pk_index_demo 
explain plan FOR SELECT * FROM INDEX_DEMO WHERE object_name = 'DUAL' AND OWNER = 'SYS';
SELECT * FROM TABLE (dbms_xplan.display);
-- here the cpu cos 1 + 1 + 1



SELECT * FROM ALL_INDEXES WHERE owner = 'ILYES';
SELECT * FROM ALL_TABLES WHERE owner = 'ILYES';

SELECT * FROM INDEX_DEMO

