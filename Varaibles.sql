DECLARE
    TYPE TAB_NO IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    V_TAB_NO TAB_NO;
BEGIN
    V_TAB_NO (1):='khaled';
    V_TAB_NO(6):='ahmed';
    V_TAB_NO (4):='jad';
    DBMS_OUTPUT.PUT_LINE (V_TAB_NO (1));
    DBMS_OUTPUT.PUT_LINE (V_TAB_NO (6));
    DBMS_OUTPUT.PUT_LINE (V_TAB_NO (4));
END;
 --==============================================
DECLARE
    TYPE TAB NO IS TABLE OF NUMBER INDEX BY VARCHAR2(100);
    V_TAB_NO TAB_NO;
BEGIN
    V_TAB_NO('khaled'):=1;
    V_TAB_NO ('ahmed'):=6;
    1 V_TAB_NO('jad'):=4;
    DBMS_OUTPUT.PUT_LINE(V_TAB_NO('khaled'));
    DBMS_OUTPUT.PUT_LINE (V_TAB_NO('ahmed'));
    DBMS_OUTPUT.PUT_LINE (V_TAB_NO('jad'));
END;
 --==============================================
DECLARE
    TYPE TAB NO IS TABLE OF VARCHAR2 (100) INDEX BY PLS_INTEGER;
    V_TAB_NO TAB_NO;
    V_TOTAL  NUMBER;
BEGIN
    V_TAB_NO (1):='khaled';
    V_TAB_NO (2):='ahmed';
    V_TAB_NO (3):='jad';
    V_TAB_NO (6):='nader';
    FOR I IN 1..10 LOOP
        IF V_TAB_NO.EXISTS(I) THEN
            DBMS_OUTPUT.PUT_LINE('the element ' ||I ||' is exist in the array and=' ||V_TAB_NO(I));
        ELSE
            DBMS_OUTPUT.PUT_LINE('the element '  ||I ||' is not exist in the array');
        END IF;
    END LOOP;

    V_TOTAL:=V_TAB_NO.COUNT DBMS_OUTPUT.PUT_LINE('the total elements in the array=' ||V_TOTAL);
    DBMS_OUTPUT.PUT_LINE('the first element INDEX in the array=' ||V_TAB_NO.FIRST);
    DBMS_OUTPUT.PUT_LINE('the NEXT element INDEX AFTER INDEX 3=' ||V_TAB_NO.NEXT(3));
END;
 --==============================================
DECLARE
    TYPE TAB_NO IS TABLE OF EMPLOYEES&ROWTYPE INDEX BY PLS_INTEGE;
    V_TAB_NO TAB_NO;
    V_TOTAL  NUMBER;
BEGIN
    V_TAB_NO (1).EMPLOYEE_ID:=1;
    V_TAB_NO (1).FIRST_NAME:='ahmed';
    V_TAB_NO (1).LAST_NAME:='jad';
    V_TAB_NO(2).EMPLOYEE_ID:=2;
    V_TAB_NO (2).FIRST_NAME:='khaled';
    V_TAB_NO (2).LAST_NAME:='yaser';
    DBMS_OUTPUT.PUT_LINE (V_TAB_NO(1).EMPLOYEE_ID ||V_TAB_NO(1).FIRST_NAME ||V_TAB_NO(1).LAST_NAME);
    DBMS_OUTPUT.PUT_LINE(V_TAB_NO(2).EMPLOYEE_ID ||V_TAB_NO(2).FIRST_NAME ||V_TAB_NO(2).LAST_NAME);
END;
 --==============================================
DECLARE
    TYPE TAB_NO IS TABLE OF EMPLOY INDEX BY PLS_INTEGER;
    V_TAB_NO TAB_NO;
BEGIN
    FOR I IN 100..104 LOOP
        SELECT INTO V_TAB_NO(I)
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID=I;
        DBMS_OUTPUT.PUT_LINE(V_TAB_NO(I).EMPLOYEE_ID ||V_TAB_NO(I).FIRST_NAME ||V_TAB_NO(I).LAST_NAME);
    END LOOP;
END;
 --==============================================
BEGIN
    FOR I IN 100..104 LOOP
        SELECT * INTO V_TAB_NO (I)
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID=I;
    END LOOP;

    FOR I IN V TAB NO.FIRST..V TAB NO.LAST LOOP
        DBMS_OUTPUT.PUT_LINE (V_TAB_NO(I).EMPLOYEE_ID);
        DBMS_OUTPUT.PUT_LINE (V_TAB_NO(I).FIRST_NAME);
        DBMS_OUTPUT.PUT_LINE(V_TAB_NO(I).LAST_NAME);
        DBMS_OUTPUT.PUT_LINE (V_TAB_NO(I).SALARY);
    END LOOP;
END;
 --==============================================
 --==============================================
 --==============================================
DECLARE
    TYPE T_LOCATIONS IS TABLE OF VARCHAR2(100);
    LOC T_LOCATIONS;
BEGIN
    LOC:=T_LOCATIONS('jordan', 'uae', 'Syria');
    DBMS_OUTPUT.PUT_LINE(LOC(1));
    DBMS_OUTPUT.PUT_LINE(LOC(2) );
    DBMS_OUTPUT.PUT_LINE(LOC(3));
END;
 --==============================================
DECLARE
    TYPE T_LOCATIONS IS TABLE OF VARCHAR2(100);
    LOC T_LOCATIONS;
BEGIN
    LOC:=T_LOCATIONS('jordan', 'uae', 'Sycia');
    LOC.EXTEND;
    LOC(4):='Lebanon';
    DBMS_OUTPUT.PUT_LINE(LOC(1));
    DBMS_OUTPUT.PUT_LINE (LOC (2));
    DBMS_OUTPUT.PUT_LINE (LOC(3));
    DBMS_OUTPUT.PUT_LINE(LOC(4));
END;
 --==============================================
DECLARE
    TYPE T LOCATIONS IS TABLE OF VARCHAR2(100);
    LOC T_LOCATIONS;
BEGIN
    LOC:=T_LOCATIONS('jordan', 'uae', 'Syria');
    LOC.DELETE(2);
    LOC(2):='Iraq';
    DBMS_OUTPUT.PUT_LINE(LOC(1));
    DBMS_OUTPUT.PUT_LINE(LOC(2) );
    DBMS_OUTPUT.PUT_LINE(LOC(3));
END;
 --==============================================
 --how to use is in SQL
DROP TABLE X CUSTOMER;
DROP TYPE T_TEL;
CREATE OR REPLACE TYPE T TEL AS TABLE OF NUMBER;
CREATE TABLE X_CUSTOMER I (CUST ID NUMBER, CUST NAME VARCHAR2(100), TEL T_TEL );
NESTED TABLE TEL STORE AS T_TEL_TBL;
INSERT INTO X_CUSTOMER ( CUST_ID, CUST_NAME, TEL) 
VALUES (1,'khaled',T_TEL (050121, 0501245, 0589877));
 --==============================================
 --==============================================
 --==============================================
DECLARE
    TYPE T EMP IS RECORD (
        V_EMP_ID EMPLOYEES.EMPLOYEE_IDSTYPE,
        V_FIRST_NAME EMPLOYEES.FIRST_NAME&TYPE,
        V_LAST_NAME EMPLOYEES.LAST_NAME&TYPE
    );
    V_EMP T_EMP;
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME INTO V_EMP
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=100;
    DBMS_OUTPUT.PUT_LINE(V_EMP.V_EMP_ID ||' ' ||V_EMP.V_FIRST_NAME ||''||V_EMP.V_LAST_NAME);
END;
 --==============================================
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID=10;
CREATE TABLE COPY_DEPARTMENTS AS
SELECT *
FROM DEPARTMENTS
WHERE 1=2;
SELECT *
FROM COPY_DEPARTMENTS;
 --==============================================
DECLARE
    TYPE T_DEPT IS RECORD (
        V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID&TYPE,
        V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME&TYPE,
        V_DEPT_MANAGER DEPARTMENTS.MANAGER_IDSTYPE,
        V_DEPT_LOC DEPARTMENTS.LOCATION_ID&TYPE
    );
    V_DEPT T_DEPT;
BEGIN
    SELECT  DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID INTO V_DEPT
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID=10;
    INSERT INTO COPY_DEPARTMENTS VALUES V DEPT;
 /* INSERT INTO COPY_DEPARTMENTS VALUES (
        V_DEPT.V_DEPT_ID,
        V_DEPT.V_DEPT_NAME,
        ....*/
END;
 --==============================================
 --using the $rowtype
DECLARE
    V_DEPT DEPARTMENTS&ROWTYPE;
BEGIN
    SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID INTO V_DEPT
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID=10;
    INSERT INTO COPY_DEPARTMENTS VALUES V_DEPT;
 /* INSERT INTO COPY_DEPARTMENTS VALUES (
        V_DEPT.DEPARTMENT_ID,
        V_DEPT.DEPARTMENT_NAME........*/
END;
 --==============================================
 --using the $rowtype in update
DECLARE
    ADEPT DEPARTMENTS&ROWTYPE;
BEGIN
    V_DEPT.DEPARTMENT_ID:=10;
    V_DEPT.DEPARTMENT_NAME:='test';
    UPDATE COPY_DEPARTMENTS
    SET ROW=V_DEPT;
END;
 --==============================================
 --==============================================
 --==============================================
 --1-
DECLARE
    V_DATE DATE;
    V_NO NUMBER:=10;
    V_NAME VARCHAR2 (100) NOT NULL:='khaled'; --when you use not null then you should give value
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_DATE);
    DBMS_OUTPUT.PUT_LINE(V_NO);
    DBMS_OUTPUT.PUT_LINE(V_NAME);
    V_NO:=V_NO+10;
    V_NAME:='ahmed';
    DBMS_OUTPUT.PUT_LINE(V_NAME);
    V_DATE:='10-May-2012';
    DBMS_OUTPUT.PUT_LINE(V_DATE);
END;
 --==============================================
DECLARE
    V_DATE DATE:=SYSDATE;
    V_NO   NUMBER:=10*2;
    V_PI   CONSTANT NUMBER:= 3.14;
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_DATE);
    DBMS_OUTPUT.PUT_LINE(V_NO);
    DBMS_OUTPUT.PUT_LINE(V_PI);
    V_DATE:=V_DATE+10;
    DBMS_OUTPUT.PUT_LINE(V_DATE);
 --v_pi:=10; if you try to do this then you will get error;
END;
 --==============================================
 --when your string contains an apstrophe it is recomnded to use the q' notation
SELECT 'today is the father''s day'
FROM DUAL;
SELECT q'(today is the father's day)'
FROM DUAL;
SELECT q'[today is the father's day not the mother's day]'
FROM DUAL;
 --==============================================
BEGIN
    DBMS_OUTPUT.PUT_LINE('Father''s day');
    DBMS_OUTPUT.PUT_LINE(q'(Father'S DAY)');
END;
 --==============================================
DECLARE
    V_LEMPNO      NUMBER:=10;
    V_ENAME       VARCHAR2(100):='khaled';
    V_SALARY      EMPLOYEES.SALARY&TYPE;
    V_HIRE_PERIOD INTERVAL YEAR TO ΜΟ�?ΤΗ;
    V_EMPNOL      V_EMPNOSTYPE;
 --IT WILL NOT BE INITILIZED LIKE V EMPNO
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_EMPNO);
    DBMS_OUTPUT .PUT_LINE(V_ENAME);
    V_SALARY :=5000;
    DBMS_OUTPUT .PUT_LINE(V_SALARY);
    V HIRE PERIOD:= '1-3';
    DBMS_OUTPUT.PUT_LINE (V_HIRE_PERIOD);
    DBMS_OUTPUT.PUT_LINE(V_EMPNOL);
END;
 --==============================================
DECLARE
    FLAG    BOOLEAN;
    V_NOL   NUMBER:=20;
    V_NO2   NUMBER:=20;
    V_PRINT VARCHAR2(100);
BEGIN
    FLAG:=FALSE;
    IF V_NOL=V_NO2 THEN
        FLAG:= TRUE;
        V_PRINT:='numbers are equal';
    END IF;

    IF FLAG=TRUE THEN
        DBMS_OUTPUT.PUT_LINE(V_PRINT);
    END IF;
END;
 --==============================================
 --define a bind variable v sal to be a number
 --create a bolck to store the salary for employee_id=100 in this variable
 --print the variable
VARIABLE V_SAL NUMBER;
BEGIN
    SELECT SALARY INTO :V_SAL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=100;
END;

PRINT V_SAL
 --==============================================
SET AUTOPRINT_ON
BEGIN
    SELECT SALARY INTO :V_SAL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=100;
END;
 --==============================================
 --==============================================
 --==============================================
DECLARE
    TYPE T LOCATIONS IS VARRAY (3) OF VARCHAR2 (100);
    LOC T_LOCATIONS;
BEGIN
    LOC:=T_LOCATIONS('jordan', 'uae', 'Syria');
    DBMS OUTPUT.PUT_LINE(LOC(1));
    DBMS_OUTPUT.PUT_LINE(LOC(2));
    DBMS_OUTPUT.PUT_LINE(LOC(3));
END;
 --==============================================
DECLARE
    TYPE T_LOCATIONS IS VARRAY (3) OF VARCHAR2(100);
    LOC T_LOCATIONS;
BEGIN
    LOC:=T_LOCATIONS ('jordan', 'uae', 'Syria'); --this delete one element from last
    LOC.TRIM(1);
 --
    DBMS_OUTPUT.PUT_LINE (LOC(1));
    DBMS_OUTPUT.PUT_LINE(LOC(2));
 ---dbms_output.put line (loc (3));
END;
 --==============================================
 --how to use is in SQL
DROP TABLE X CUSTOMER;
DROP TYPE T_TEL;
CREATE OR REPLACE TYPET TEL AS VARRAY(10) OF NUMBER;
CREATE TABLE X_CUSTOMER ( CUST ID NUMBER, CUST NAME VARCHAR2(100), TEL T_TEL);
INSERT INTO X_CUSTOMER (CUST_ID,CUST_NAME,TEL)
VALUES ( 1,'khaled',T_TEL (050121, 0501245, 0589877));
END;