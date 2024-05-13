CREATE OR REPLACE PROCEDURE DELETE_ANY_TABLE ( P_TABLE NAME VARCHAR2) 
IS
    V_NO_REC NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'delete from ' ||P_TABLE_NAME;
    V_NO_REC: =SQL&ROWCOUNT;
    COMMIT;
 --same rules for commit and rollback
    DBMS_OUTPUT.PUT_LINE (V_NO_REC || RECORD (S) DELETED FORM ||'p_table_name');
END;
 --==============================================
BEGIN
    CREATE TABLE EMP3 (EMP_ID NUMBER)
END;

BEGIN
 --no need for at end of the statement
    EXECUTE IMMEDIATE 'create table emp3 (emp_id number)';
END;
 --==============================================
CREATE OR REPLACE PROCEDURE CREATE_ANY_TABLE ( P_TABLE_NAME VARCHAR2, P_DETAILS VARCHAR2 )
IS
    V_DETAILS VARCHAR2 (30000);
BEGIN
    JV_DETAILS:='create table '||P_TABLE_NAME||' ('LLP_DETAILS||')';
    DBMS_OUTPUT.PUT_LINE(V_DETAILS);
    EXECUTE IMMEDIATE V_DETAILS;
END;

EXECUTE CREATE_ANY_TABLE ('emp4', 'emp_id number', 'name varchar2(100)');
 --==============================================
CREATE OR REPLACE PROCEDURE ADD_ROWS ( P_TABLE_NAME VARCHAR2, P_VALUE NUMBER )
IS
BEGIN
 --EXECUTE IMMEDIATE 'insert into 'llp_table_name || values('llp_value]|') ';
   EXECUTE IMMEDIATE 'insert into '||P_TABLE_NAME ||' values(:1) using p_value';
END;

EXECUTE ADD_ROWS ('emp1', 10);
 --==============================================
CREATE OR REPLACE PROCEDURE ADD_ROWS ( P_TABLE_NAME VARCHAR2, P_VALUE NUMBER ) 
IS
    VAL1 NUMBER:=20;
    VAL2 NUMBER:=30;
BEGIN
    EXECUTE IMMEDIATE 'insert into ' ||P_TABLE_NAME || VALUES(:1) USING P_VALUE;
    EXECUTE IMMEDIATE 'insert into '||P_TABLE_NAME ||' values(:yy)' USING VAL1;
    EXECUTE IMMEDIATE 'INSERT INTO ' ||P_TABLE_NAME ||' VALUES(:UUU)' USING VAL2;
END;

EXECUTE ADD_ROWS ('empl', 10);
 --==============================================
CREATE OR REPLACE FUNCTION GET_EMP ( PID NUMBER ) RETURN EMPLOYEES&ROWTYPE 
IS
    EMP_REC EMPLOYEES&ROWTYPE;
BEGIN
    SELECT INTO EMP_REC
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=P_ID;
    RETURN EMP_REC;
    
END;
 --you can not use this function in select, ez i retrive Srowtype
SELECT GET_EMP(100)
FROM DUAL;
DECLARE EMP_REC EMPLOYEESTROWTYPE;
BEGIN
    EMP_REC:=GET_EMP(100);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.EMPLOYEE_ID ||' ' ||EMP_REC.FIRST_NAME);
END;
 --==============================================
 --dynamic sql with single row query
CREATE OR REPLACE FUNCTION GET_EMP2 ( P_ID NUMBER ) 
RETURN EMPLOYEES&ROWTYPE
IS
    EMP_REC EMPLOYEES&ROWTYPE;
    V_QUERY VARCHAR2(1000);
BEGIN
    V_QUERY:='select * from employees where employee_id=:1';
    EXECUTE IMMEDIATE V_QUERY INTO EMP_REC USING P_ID;
    RETURN EMP_REC;
END;
 --==============================================
 --1 let us review the normal cursor
DECLARE
    CURSOR C_EMP_DEPT30 IS
    SELECT EMPLOYEE_ID, FIRST_NAME
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID=30;
    V_EMPNO EMPLOYEES.EMPLOYEE_ID&TYPE;
    V_FIRST_NAME EMPLOYEES.FIRST_NAME$TYPE;
BEGIN
    OPEN C_EMP_DEPT30;
    LOOP
        FETCH C_EMPL_DEPT30 INTO V_EMPNO, V_FIRST_NAME;
        WHEN C_EMP_DEPT30%NOTFOUND;
        EXIT DBMS_OUTPUT.PUT_LINE (V_EMPNO ||' '||V_FIRST_NAME);
    END LOOP;

    CLOSE C_EMP_DEPT30;
END;
 --==============================================
 --THE REF CURSOR CAN BE OPEND MANY TIMES WITH DIF QUERY
DECLARE
    TYPE C_EMP_DEPT IS
        REF CURSOR;
    D_CURSOR C_EMP_DEPT;
    V_EMPNO EMPLOYEES.EMPLOYEE_ID&TYPE;
    V_FIRST_NAME EMPLOYEES.FIRST_NAME&TYPE;
BEGIN
    OPEN D CURSOR FOR
        SELECT EMPLOYEE_ID, FIRST_NAME
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID=10;
    LOOP
        FETCH D_CURSOR CURSOR INTO V_EMPNO, V_FIRST_NAME;
        EXIT WHEN D_CURSOR NOT FOUND;
        DBMS_OUTPUT.PUT_LINE(V_EMPNO ||' ' ||V_FIRST_NAME);
    END LOOP;

    CLOSE D_CURSOR;
    OPEN D CURSOR FOR
        SELECT EMPLOYEE_ID, FIRST_NAME
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID=10;
    LOOP
        FETCH D_CURSOR INTO V_EMPNO, V_FIRST_NAME;
        EXIT WHEN D_CURSOR NOT FOUND;
        DBMS_OUTPUT.PUT_LINE(V_EMPNO ||'' ||V_FIRST_NAME);
    END LOOP;

    CLOSE D CURSOR;
    OPEN D_CURSOR FOR
        SELECT EMPLOYEE_ID, FIRST_NAME
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID=30;
    LOOP
        FETCHD_CURSOR INTO V_EMPNO, V_FIRST_NAME;
        EXIT WHEN D_CURSOR NOT FOUND;
        DBMS_OUTPUT.PUT_LINE(V_EMPNO ||'' ||V_FIRST_NAME);
    END LOOP;

    CLOSE D_CURSOR;
END;
 --==============================================
CREATE OR REPLACE PROCEDURE EMP_LIST ( P_DEPT_ID NUMBER DEFAULT NULL ) 
IS
    TYPE C_EMP_DEPT IS
        REF CURSOR;
    D_CURSOR     C_EMP_DEPT;
    V_EMPNO EMPLOYEES.EMPLOYEE_ID&TYPE;
    V_FIRST_NAME EMPLOYEES.FIRST_NAME&TYPE;
    V_SQL VARCHAR2(1000):='select employee_id, first_name from employees';
BEGIN
    IF P_DEPT_ID IS NULL THEN
        OPEN D_CURSOR FOR V_SQL;
    ELSE
        V_SQL:=V_SQL ||' where department_id=:id';
        OPEN D_CURSOR FOR V_SQL
            USING P_DEPT_ID;
    END IF;

    LOOP
        FETCH D_CURSOR INTO V_EMPNO, V_FIRST_NAME;
        EXIT WHEN D_CURSOR&NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_EMPNO ||' ' ||V_FIRST_NAME);
    END LOOP;

    CLOSE D_CURSOR;
END;
 --==============================================
DECLARE
    V_CODE VARCHAR2(100):= 'begin
dbms_output.put_line(''welcome'');
end;';
BEGIN
    EXECUTE IMMEDIATE V_CODE;
END;
 --==============================================
 --WE CAN DO THIS STATEMENT TO COMPILE A PROCEDURE
 --ALTER PROCEDURE ADD_ROWS COMPILE;
 --we can do this statement to compile a function alter function GET SAL compile;
 --WE CAN DO THIS STATEMENT TO COMPILE A PACKAGE SPECIFICATION
 --ALTER PACKAGE AREA COMPILE SPECIFICATION;
 --WE CAN DO THIS STATEMENT TO COMPILE A PACKAGE BODY
 --ALTER PACKAGE AREA COMPILE BODY;
 --==============================================
CREATE OR REPLACE PROCEDURE COMPILE_ANY_PLSQL ( P_NAME VARCHAR2, P_TYPE VARCHAR2, P_OPTION VARCHAR2 DEFAULT NULL ) 
IS
BEGIN
    V_COMP_CODE VARCHAR2(1000):= 'alter ' ||P_TYPE ||' ' ||P_NAME || 'COMPILE' ||P_OPTION;
END;

BEGIN
    EXECUTE IMMEDIATE V_COMP_CODE;
END;
 --==============================================
CREATE OR REPLACE PROCEDURE DELETE_ANY_TABLE2 ( P_TABLE_NAME VARCHAR2 ) 
IS
    VNO REf NUMBER;
    V_CUR_ID NUMBER;
BEGIN
    V_CUR_ID:=DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE (V_CUR_ID, 'delete from ' ||P_TABLE_NAME, DBMS_SQL.NATIVE);
    V_NO_REC:=DBMS_SQL.EXECUTE(V_CUR_ID);
    DBMS_OUTPUT.PUT_LINE (V_NO_REC ||' record(s) deleted form 'ILP_TABLE_NAME);
    COMMIT;
END;
 --==============================================
CREATE OR REPLACE PROCEDURE ADD_ROWS2 (P_TABLE_NAME VARCHAR2, P_VALUE NUMBER) 
IS
    V_NO_REC NUMBER;
    V_CUR_ID NUMBER;
    V_INSERT VARCHAR2(1000):='INSERT INTO '||P_TABLE_NAME ||' VALUES (:ID)';
BEGIN
    V_CUR_ID:=DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE (V_CUR_ID, V_INSERT, DBMS_SQL.NATIVE);
    DBMS_SQL.BIND_VARIABLE (V_CUR_ID, ': ID', P_VALUE);
    V_NO_REC:=DBMS_SQL.EXECUTE (V_CUR_ID);
    DBMS_OUTPUT.PUT_LINE(V_NO_REC ||' record(s) INSERTED TO 'ILP_TABLE_NAME);
    COMMIT;
END;

EXECUTE ADD_ROWS('empl', 90);
--==============================================