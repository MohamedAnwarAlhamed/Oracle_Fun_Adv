DECLARE
    V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO V_FIRST_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=1;
    --THERE IS NOT EMP_ID=1 
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('The query does not retrieve any record');
END;
 --==============================================
DECLARE
    V_EMP_ID EMPLOYEES.EMPLOYEE_ID&TYPE;
BEGIN
    SELECT EMPLOYEE_ID INTO V_EMP_ID
    FROM EMPLOYEES
    WHERE FIRST_NAME='John';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('The query doesnoT RETRIEVE ANY RECORD');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('THE QUERY RETRIEVE MORE THAN ONE RECORD');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('OTHER ERROR');
END;
 --==============================================
DECLARE
    V_FIRST_NAME EMPLOYEES.FIRST_NAME&TYPE;
BEGIN
    FOR I IN 99..102 LOOP
        SELECT FIRST_NAME INTO V_FIRST_NAME
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID=I;
        DBMS_OUTPUT.PUT_LINE(I ||' ' ||V_FIRST_NAME);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
END;
 --==============================================
DECLARE
    V_FIRST_NAME EMPLOYEES.FIRST_NAME&TYPE;
BEGIN
    FOR I IN 99..102 LOOP
        BEGIN
            SELECT FIRST_NAME INTO V_FIRST_NAME
            FROM EMPLOYEES
            WHERE EMPLOYEE_ID=I;
            DBMS_OUTPUT.PUT_LINE(I ||' ' ||V_FIRST_NAME);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
        END;
    END LOOP;
END;
 --==============================================
DECLARE
    E_INSERT EXCEPTION;
    PRAGMA EXCEPTION_INIT(E_INSERT, -01400);
BEGIN
    INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME)
    VALUES ( 1,NULL);
EXCEPTION
    WHEN E_INSERT THEN
        DBMS_OUTPUT.PUT_LINE('insert failed');
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
    WHEN OTHERS THEN
        NULL;
END;
 --==============================================
DECLARE
    V_EMPLOYEE_ID NUMBER:=1;
    E_INVALID_NO EXCEPTION;
BEGIN
    UPDATE EMPLOYEES
    SET SALARY=20000
    WHERE EMPLOYEE_ID=V_EMPLOYEE_ID;
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    IF SQL%SNOTFOUND THEN
        RAISE E_INVALID_NO;
    END IF;

    COMMIT;
EXCEPTION
    WHEN E_INVALID_NO THEN
        DBMS_OUTPUT.PUT_LINE('invalid emp ID');
        DBMS_OUTPUT.PUT_LINE(SQLCODE DBMS_OUTPUT.PUT_LINE(SQLERRM));
        END;
END:
 --==============================================
DECLARE 
    V_EMPLOYEE_ID NUMBER:=1;
BEGIN 
    UPDATE EMPLOYEES 
    SET SALARY=20000 
    WHERE EMPLOYEE_ID=V_EMPLOYEE_ID;
        IF SQL NOTFOUND THEN RAISE_APPLICATION_ERROR(-20000, 'invalid emp ID');
        END IF;
        COMMIT;
END;
 --==============================================