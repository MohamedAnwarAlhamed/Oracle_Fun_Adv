SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH
(FIRST_NAME),
CASE LENGTH ( FIRST_NAME)
    WHEN 4 THEN '4 char'
    WHEN 5 THEN '5 CHAR'
    WHEN 6 THEN '6 CHAR'
    ELSE
        'N/A'
END LEN, LAST_NAME, SALARY
FROM EMPLOYEES;
--==============================================
SELECT EMPLOYEE_ID, FIRST_NAME,
    LENGTH (FIRST_NAME),
    CASE
        WHEN LENGTH (FIRST_NAME)=4 THEN '4 CHAR'
        WHEN LENGTH (FIRST_NAME)=5 THEN '5 CHAR'
        WHEN LENGTH (FIRST_NAME)=6 THEN '6 CHAR'
        ELSE
            'N/A'
    END LEN
FROM
    EMPLOYEES;

--==============================================
--here we use the case as experssion
DECLARE
    V_SAL  NUMBER;
    V_DESC VARCHAR2(100);
BEGIN
    SELECT SALARY INTO V_SAL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=&MP_ID;

    V_DESC:=CASE WHEN V_SAL IS NULL THEN 'no salay for the employee' 
    WHEN V_SAL BETWEEN 1000 AND 3000 THEN 'salay is low' 
    WHEN V_SAL BETWEEN 3001 AND 5000 THEN 'salay is medium' 
    WHEN V_SAL BETWEEN 5001 AND 10000 THEN 'salay is good' 
    ELSE 'salay is High' 
END;  --HERE END NOT END CASE
--==============================================
DECLARE
    V_NO NUMBER:=SV;
BEGIN
    IF V_NO >=10 THEN
        DBMS_OUTPUT.PUT_LINE('the number you enterd is >=10');
    END IF;
END;
--==============================================
--==============================================
---2 simple if statement with else
DECLARE
    V NO NUMBER := &V;
BEGIN
    IF V_NO >=10 THEN
        DBMS_OUTPUT.PUT_LINE('the number you enterd is >=10');
    ELSE
        DBMS_OUTPUT.PUT_LINE('number is is less than 10');
    END IF;
END;
--==============================================
--elsif
DECLARE
    V_GRADE NUMBER := &V;
BEGIN
    IF V_GRADE BETWEEN 90 AND 100 THEN
        DBMS_OUTPUT.PUT_LINE ('the grade is A');
    ELSIF V_GRADE BETWEEN 80 AND 89 THEN
        DBMS_OUTPUT.PUT_LINE('the grade is B');
    ELSIF V_GRADE BETWEEN 70 AND 79 THEN
        DBMS_OUTPUT.PUT_LINE('the grade is C');
    ELSIF V_GRADE BETWEEN 60 AND 69 THEN
        DBMS_OUTPUT.PUT_LINE('the grade is D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('the grade is F');
    END IF;
END;
--==============================================
DECLARE
    V_GRADE NUMBER := &V;
BEGIN
    IF V_GRADE BETWEEN 0 AND 100 THEN   
        IF V_GRADE BETWEEN 90 AND 100 THEN
            DBMS_OUTPUT.PUT_LINE('the grade is A');
        ELSIF V_GRADE BETWEEN 80 AND 89 THEN
            DBMS_OUTPUT.PUT_LINE('the grade is B');
        ELSIF V_GRADE BETWEEN 70 AND 79 THEN
            DBMS_OUTPUT.PUT_LINE('the grade is C');
        ELSIF V_GRADE BETWEEN 60 AND 69 THEN
            DBMS_OUTPUT.PUT_LINE('the grade is D');
        ELSE
            DBMS_OUTPUT.PUT_LINE('the grade is F');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('the grade should be number between 0 and 100');
END:
--==============================================
DECLARE
    X NUMBER:=5;
    Y NUMBER;
BEGIN
    IF X>Y THEN
        DBMS_OUTPUT.PUT_LINE('welcome');
    ELSE
        BMS_OUTPUT.PUT_LINE('Operator with null value always =null');
    END IF;
END;
--==============================================
---solution
DECLARE
    X NUMBER:=5;
    Y NUMBER; 
    BEGIN IF NVL(X, 0) <>NVL(Y, 0) THEN
        DBMS_OUTPUT.PUT_LINE('welcome');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Operator with null value always =null');
    END IF;
END;
--==============================================
DECLARE
    X NUMBER;
    Y NUMBER;
BEGIN
    IF X=Y THEN
        DBMS_OUTPUT.PUT_LINE('welcome');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Operator with null value always null');
    END IF;
END;
--==============================================
--solution
DECLARE
    X NUMBER;
    Y NUMBER;
BEGIN 
    IF X IS NULL AND Y IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('welcome');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Operator with null value always null');
    END IF;
END;