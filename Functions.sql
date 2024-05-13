CREATE OR REPLACE FUNCTION GET_SAL (P_EMP_ID NUMBER)
RETURN NUMBER IS
    V_SAL NUMBER;
BEGIN
    SELECT SALARY INTO V_SAL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=P_EMP_ID;
    RETURN V_SAL;
END;
 --==============================================
DECLARE
    V_SAL NUMBER;
BEGIN
    V_SAL:=GET_SAL(100);
    DBMS_OUTPUT.PUT_LINE (V_SAL);
END;
 --==============================================
BEGIN
    DBMS_OUTPUT.PUT_LINE (GET_SAL(100));
END;
 --also we do this
EXECUTE DBMS_OUTPUT.PUT_LIME (GET_SAL(100));
 --==============================================
 --3 using host variable
VARIABLE B_SALARY NUMBER;
EXECUTE : B_SALARY:=GET_SAL(100)
 --==============================================
SELECT GET_SAL(100)
FROM DUAL;

SELECT EMPLOYEE_ID, FIRST_NAME, GET_SAL (EMPLOYEE_ID)
FROM EMPLOYEES
WHERE DEPARTMENT_ID=20;

SELECT *
FROM USER_OBJECTS
WHERE OBJECT_NAME='GET_SAL';

SELECT LINE, TEXT
FROM USER_SOURCE
WHERE NAME='GET_SAL';
 --==============================================
CREATE OR REPLACE FUNCTION GET_SAL ( P_EMP_ID NUMBER ) 
RETURN NUMBER 
IS
    V_SAL NUMBER;
BEGIN
    SELECT SALARY INTO V_SAL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=P_EMP_ID;
    RETURN V_SAL;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN -1;
END;
 --==============================================
CREATE OR REPLACE FUNCTION GET_SAL_TAX ( P_SAL NUMBER ) 
RETURN NUMBER 
IS
BEGIN
    IF P_SAL<5000 THEN
        RETURN P_SAL* (10/100);
        RETURN P_SAL* (15/100);
    END IF;
    END;
    SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, GET_SAL_TAX(PSALL=>EMPLOYEE_ID)
    FROM EMPLOYEES;
END;
--==============================================

