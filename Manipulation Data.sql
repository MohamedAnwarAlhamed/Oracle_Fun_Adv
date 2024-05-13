INSERT INTO (
    SELECT DEPARTMENT_ID, DEPARTMENT_NAME
    WHERE DEPARTMENT_ID=10
    FROM DEPARTMENTS)
    VALUES(106,'test D')
 --=================================================
INSERT INTO(
    SELECT DEPARTMENT_ID DEPARTMENT_NAME
    FROM DEPARTMENTS
    WHERE DEPARTMENT_NAME LIKE 'Tests' WITH CHECK OPTION)
    VALUES(107,'OP')
 --=================================================
UPDATE (
    SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID=20
) SET SALARY=SALARY+100;

--=================================================
CREATE TABLE EMP_COPY AS
    SELECT *
    FROM EMPLOYEES;