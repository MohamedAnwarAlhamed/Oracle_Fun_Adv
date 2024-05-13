--with clause
WITH EMP AS (
    SELECT EMPLOYEE_ID, FIRST_NAME
    FROM EMPLOYEES
)
SELECT FIRST_NAME
FROM EMP;

--=============================================================
WITH EMP AS (
    SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, SALARY
    FROM EMPLOYEES
), DEPT_SUM_SAL AS (
    SELECT DEPARTMENT_ID, SUM(SALARY)   SUM_SAL
    FROM EMP
    GROUP BY DEPARTMENT_ID
)
SELECT *
FROM DEPT_SUM_SAL;

--=============================================================
--display each department_name, and count for the employees
SELECT DEPARTMENT_ID, COUNT (1)
GROUP BY DEPARTMENT_ID) DEPT_COUNT
WHERE DEPT.DEPARTMENT_ID=DEPT_COUNT.DEPARTMENT_ID;

WITH DEPT_COUNT AS (
    SELECT DEPARTMENT_ID, COUNT (1) CNT
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
SELECT DEPARTMENT_NAME, ENT
FROM DEPARTMENTS, DEPT_COUNT
WHERE DEPARTMENTS.DEPARTMENT_ID=DEPT_COUNT.DEPARTMENT_ID
--=============================================================
SELECT SUM(TOT_SALARIES)/COUNT(*)
FROM(
        SELECT DEPARTMENT_NAME, SUM(SALARY) TOT_SALARIES
        FROM EMPLOYEES E JOIN DEPARTMENTS D
            ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)
        GROUP BY DEPARTMENT_NAME
    )
--=============================================================
WITH DEPT_COSTS AS (
    SELECT DEPARTMENT_NAME, SUM(SALARY) SUM_SAL
    FROM EMPLOYEES E JOIN DEPARTMENTS D
        ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)
    GROUP BY DEPARTMENT_NAME AVG_COST AS (
            SELECT SUM(SUM_SAL)/COUNT(*) DEPT_AVG
            FROM DEPT COSTS
                SELECT *
                FROM DEPT_COSTS
                WHERESUM_SAL> (
                        SELECT DEPT_AVG
                        FROM AVG_COST
                    )