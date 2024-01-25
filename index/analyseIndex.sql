
CREATE TABLE idx_split (
id int,
name varchar2(90)
);

INSERT INTO idx_split 
SELECT rownum, 'vivek' 
FROM DUAL 
CONNECT BY LEVEL <= 100;


CREATE TABLE idx_split_fake (
id int,
name varchar2(90)
);

CREATE UNIQUE INDEX idx_idx_split ON idx_split(id);

--analyse an index, get leaf block and branch block statistics
analyze INDEX idx_idx_split VALIDATE STRUCTURE;
SELECT height, name, lf_blks, br_blks FROM INDEX_STATS ;
---------------------------------------------------------------------------------------------

INSERT INTO idx_split
SELECT 100 + rownum, 'vivek'
FROM DUAL 
CONNECT BY LEVEL <= 1000

analyze INDEX idx_idx_split VALIDATE STRUCTURE;
SELECT height, name, lf_blks, br_blks FROM INDEX_STATS ;
-- here we have an index spanning because the height is incresing to 2 

---------------------------------------------------------------------------------------------

INSERT INTO idx_split
SELECT 1100 + rownum, 'vivek'
FROM DUAL 
CONNECT BY LEVEL <= 2000;

analyze INDEX idx_idx_split VALIDATE STRUCTURE;
SELECT height, name, lf_blks, br_blks FROM INDEX_STATS ;
-- here we have an index spliting because the number of leaf block is growing to 6 and the height is the same 


---------------------------------------------------------------------------------------------

INSERT INTO idx_split
SELECT 3100 + rownum, 'vivek'
FROM DUAL 
CONNECT BY LEVEL <= 200000;

analyze INDEX idx_idx_split VALIDATE STRUCTURE;
SELECT height, name, lf_blks, br_blks FROM INDEX_STATS ;
-- here we have an index spliting because the number of leaf block is growing to 6 and the height is the same 