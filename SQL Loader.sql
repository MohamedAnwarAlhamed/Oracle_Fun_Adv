--we will learn the sql loader
--SQL Loader is a bulk loader utility used for moving data from exter I
--files into the Oracle database
DROP TABLE EMP
LOAD;

CREATE TABLE EMP LOAD (
    EMPNO NUMBER FNAME VARCHAR2 (100),
    LNAME VARCHAR2 (100)
);

SELECT *
FROM EMP_LOAD;

--we have file emp.csv in E:\load
--we want to move the data from this file to the table EMP_LOAD
--we use SQL*Loader
--we need to do a file called conrol file .ctl (example emp.ctl)
/*LOAD DATA
INFILE 'E: load emp.csv'

APPEND

INTO TABLE EMP LOAD
FIELDS TERMINATED BY ' ,'
(EMPNO,
FNAME,
INAME ) */
--THEN AFTER THIS WE EXECUTE THIS COMMNAD SQLLDR CONTROL-E: LOAD EMP.CTL LOG-E: LOAD EMP.LOG
--sqlldr control=E: load emp.ctl log-E: load emp.log
SELECT *
FROM EMP LOAD;

--go to the E: load and see the log file, it will give you details about the loaded data
TRUNCATE TABLE EMP_LOAD;

--now update the file emp.csv, make some ids to be characters
--we want to know the bad file, the records that not inserted