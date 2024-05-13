/*Use substitution
variables
to:
Temporarily store values
with single-ampersand
(&) and double-ampersand
(&&) substitution
Use substitution
variables to supplement the
following:
WHERE conditions
ORDER BY clauses
Column expressions
Table names
Entire
SELECT statements
*/
--1
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &EMPLOYEE_NUM
 --WHEN USING SINGLE & THE VARIABLE WILL BE DISCARE CAREDED AFTER IS USED
 --=============================================================
 --use '' WHEN USING VARCHAR
 --2
    SELECT  EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE FIRST_NAME="ename"
    ORDER BY 2;

--=============================================================
--Specifying Column Names, Expressions, and Text
--&column_name=salary &condition=salary>10000 &ORDER COLUMN=EMPLOYEE_ID

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, &COLUMN_NAME
FROM EMPLOYEES
WHERE &CONDITION
ORDER BY ORDER_COLUMN;

--=============================================================
--5
--USE THE DEFINE COMMAND TO CREATE AND ASSIGN A VALUE TO A VARIABLE.
/*USE THE DEFINE COMMAND TO CREATE AND ASSIGN A VALUE TO A VARIABLE.
USE THE UNDEFINE COMMAND TO REMOVE A VARIABLE

I DEFINE EMPLOYEE NUM= 200; -- this variable is valid for the session only*/

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &EMPLOYEE_NUM: UNDEFINE EMPLOYEE_NUM
 --=============================================================
 --6 you can change the prompt message as follow
 --but it should exected as script
    ACCEPT DEPT_ID PROMPT 'please enter dept id':
    SELECT *
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID=&DEPT_ID;

UNDEFINE DEPT_ID

--=============================================================
--7 Using the Double-Ampersand Substitution Variable
---the && define the variable and assign the value in the same time, then you can re-use it agian

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,&&COLUMN_NAME --THIS DEFINE COLUMN_NAME
FROM EMPLOYEES
ORDER BY COLUMN NAME: UNDEFINE COLUMN_NAME;

--=============================================================
/*8 Use the VERIFY command to toggle the display of the substitution variable, both before and after SQL Developer replaces substitution variables with values:*/

--also should be executed as script
SET VERIFY ON

SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &E_NUM;

--=============================================================
--so we use set define off
SET DEFINE OFF;

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT NAME LIKE '&t'
 --you can use set define on to show again the prompt window when using &
    SET DEFINE
    ON;