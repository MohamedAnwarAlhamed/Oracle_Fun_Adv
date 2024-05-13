SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID=10 FOR UPDATE;

--try to open another session and do this, it will be locked for the rows that match
--one or more condition
/*UPDATE EMPLOYEES
SET
    SALARY=4400 I
WHERE
    DEPARTMENT_ID=10;

*/

COMMIT:
 --=============================================================
 --open another session and do this update (dont do anyu comit or rollback in that session)
UPDATE EMPLOYEES
SET SALARY-4400
WHERE DEPARTMENT_ID=10;

--if someone else trying to update theses records, then you will not wait, --you will see error tell you that.
--so coninue your work, then try again later
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT ID=10 FOR UPDATE NOWAIT;
WAIT

--=============================================================
/*UPDATE EMPLOYEES
SET
    SALARY=4400
WHERE
    DEPARTMENT ID=10;*/

--here if someone esle locked theses records, then the server will wait 10 seconds
--if the other user make commit or rollback with the 10 second,
--then my select will wotk and lock the records
--if the user didnt make commit or rollback within the 10 seconds, then i will receive the error
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID=10 FOR UPDATE WAIT 10;

COMMIT;

--=============================================================
--to make lock only for the rows in EMPLOYEES use (FOR UPDATE of column_name) --this will lock all the rows that have this column which match the where condition
SELECT EMPLOYEE_ID, FIRST_NAME,EMP.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES EMP, DEPARTMENTS DEPT
WHERE EMP.DEPARTMENT ID-DEPT.DEPARTMENT ID TMENT_ID AND EMP.DEPARTMENT ID=10 FOR UPDATE OF SALARY;