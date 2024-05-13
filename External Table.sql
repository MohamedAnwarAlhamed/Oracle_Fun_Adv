--now we will learn how to create external tables
-- -- external table is read only table whose metadata is stored in the Db, but whose data is stored outside the db.
--NO DML ALLOWED, NO INDEXES CAN BE CREATED ON EXTERNAL TABLES
--YOU CAN ACCESS THE DATA WITH METHODS (ORACLE_LOADER OR ORACLE_DATAPUMP)

/* to create DIRECTORY you need create any DIRECTORY priv, the dba should give you this
conn sqlplus sys as sysdba
alter session set container=pdborel;
--to read external data, first you need to create directory in the database grant create any DIRECTORY to hr;*/
CREATE OR REPLACE DIRECTORY EMP_DIR
AS 'E: external';

SELECT *
FROM ALL_DIRECTORIES
WHERE DIRECTORY_NAME='EMP_DIR';

DROP TABLE EMP_LOAD_EXT;

CREATE TABLE EMP LOAD EXT (
    EMPLOYEE_NUMBER NUMBER,
    FNAME VARCHAR2 (100),
    LNAME VARCHAR2 (100)
) ORGANIZATION EXTERNAL (
    TYPE ORACLE LOADER DEFAULT DIRECTORY EMP DIR ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE FIELDS TERMINATED BY ',' ) LOCATION ('old_emp_data.csv')
) REJECT LIMIT UNLIMITED;

SELECT *
FROM EMP LOAD EXT;

DELETE EMP LOAD EXT;

--operation not supported on external organized table DAD_EX
DROP TABLE EMP_PUMP;

--=================
CREATE TABLE EMP_PUMP (
    EMPLOYEE_NUMBER,
    FNAME,
    LNAME
) ORGANIZATION EXTERNAL (
    TYPE ORACLE DATAPUMP DEFAULT DIRECTORY EMP DIR LOCATION ('EMP.dmp')
) AS
    SELECT  EMPLOYEE_ID, FIRST_NAME, LAST_NAME
    FROM EMPLOYEES;

SELECT *
FROM EMP PUMP;

--===============================
CREATE TABLE EME PUMP_READ (
    EMPLOYEE NUMBER NUMBER,
    FNAME VARCHAR2 (100),
    LNAME VARCHAR2(100)
) ORGANIZATION EXTERNAL (
    TYPE ORACLE_DATAPUMP DEFAULT DIRECTORY EMP_DIR LOCATION ('EMP.dmp')
);