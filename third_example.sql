

  explain plan FOR SELECT owner, OBJECT_name, object_id, OBJECT_type FROM INDEX_DEMO;
  SELECT * FROM table(dbms_xplan.DISPLAY);
  
 --create new colomn data_object_id in index_demo table 
 --ALTER TABLE INDEX_DEMO ADD data_object_id varchar2(20);
 
  explain plan FOR SELECT owner, OBJECT_name, object_id, OBJECT_type, DATA_OBJECT_ID  FROM INDEX_DEMO;
  SELECT * FROM table(dbms_xplan.DISPLAY);
 --the search of data_object_id require the use of the full table scan rather than index primary key table

------------------------------------------------------------------------------------------------------------------------
 
 
explain plan FOR SELECT owner, OBJECT_name, OBJECT_type, object_id  FROM INDEX_DEMO ORDER BY OBJECT_ID  ;
SELECT * FROM table(dbms_xplan.DISPLAY);


SELECT *  FROM ALL_INDEXES WHERE owner = 'ILYES';