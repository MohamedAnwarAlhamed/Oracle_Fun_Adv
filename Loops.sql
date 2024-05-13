DECLARE
    V_COUNTER NUMBER: =0;
BEGIN
    LOOP
        V_COUNTER: =V_COUNTER+1;
        DBMS_OUTPUT.PUT_LINE ('welcome' ||V_COUNTER);
        EXIT WHEN V_COUNTER=3;
    END LOOP;
END;
 --==============================================
DECLARE
    V_COUNTER NUMBER := 8 
BEGIN 
    LOOP
        V_COUNTER:=V_COUNTER+1;
        DBMS_OUTPUT.PUT_LINE('welcome'||V_COUNTER);
        IF V_COUNTER=3 THEN
            EXIT;
        END IF;
    END LOOP;
END;
 --==============================================
DECLARE V_EMPNO NUMBER:=100;
V_FIRST_NAME EMPLOYEES.FIRST_NAME&TYPE;
BEGIN
    LOOP
        SELECT FIRST_NAME INTO V_FIRST_NAME
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID = V_EMPNO;
        DBMS_OUTPUT.PUT_LINE(V_EMPNO || ' ' || V_FIRST_NAME);
        V_EMPNO:=V_EMPNO+1;
        EXIT WHEN V_EMPNO>102;
    END LOOP;
END;
 --==============================================
DECLARE
    V_SYM VARCHAR2 (100);
BEGIN
    FOR I IN 1..10 LOOP
        IF I BETWEEN 1 AND 5 THEN
            V_SYM:=I ||CHR(10) ||':)';
        ELSE
            V_SYM:=1;
        END IF;
        DBMS_OUTPUT.PUT_LINE (V_SYM);
    END LOOP;
END;
 --==============================================
BEGIN
    FOR I IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE (I);
        CONTINUE WHEN I>5;
        THIS MEAN STOP EXEC DBMS_OUTPUT.PUT_LINE (':)');
    END LOOP;
END;
 --==============================================
BEGIN
    FOR I IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('welcome ' ||I);
    END LOOP;
END;

BEGIN
    FOR I IN 1..1 LOOP
        BMS_OUTPUT.PUT_LINE('welcome ' ||I);
    END LOOP;
END;
 --==============================================
BEGIN
    FOR I IN 3..5 LOOP
        DBMS_OUTPUT.PUT_LINE('welcome' ||I);
    END LOOP;
END;
 --==============================================
BEGIN
    FOR I IN REVERSE 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('welcome ' ||I);
    END LOOP;
END;
 --==============================================
BEGIN
    FOR I IN 1..9/2 LOOP
        DBMS_OUTPUT.PUT_LINE('welcome ' ||I);
    END LOOP;
END;
 --==============================================
DECLARE
    V_STAR VARCHAR2(100);
BEGIN
    FOR I IN 1..5 LOOP
        FOR J IN 1..I LOOP
            V_STAR:=V_STAR ||'*';
        END LOOP;

        DBMS_OUTPUT.PUT_LINE(V_STAR);
        V_STAR:=NULL;
    END LOOP;
END;
 --==============================================
V_STAR VARCHAR2(100);
BEGIN
    <<OUTER_LOOP>>
    FOR I IN 1..5 LOOP
        <<INNER_LOOP>>
        FOR J IN 1..I LOOP
            V_STAR:=V_STAR ||'*';
            EXIT OUTER_LOOP WHEN I=3;
        END LOOP INNER_LOOP;
        DBMS_OUTPUT.PUT_LINE(V_STAR) V_STAR:=NULL;
    END LOOP OUTER_LOOP;
END;
 --==============================================
DECLARE
    V_COUNTER NUMBER:=1;
BEGIN
    WHILE V_COUNTER<=3 LOOP
        DBMS_OUTPUT.PUT_LINE('welcome');
        V_COUNTER:=V_COUNTER+1;
    END LOOP;
END;
 --==============================================
DECLARE
    V_EMPNO NUMBER:=100;
    V_FIRST_NAME EMPLOYEES.FIRST_NAME&TYPE;
BEGIN
    WHILE V_EMPNO<=102 I LOOP
        SELECT FIRST_NAME INTO V_FIRST_NAME
        FROM EMPLOYEES
        WHERE EMPLOYEE_ID = V_EMPNO;
        DBMS_OUTPUT.PUT_LINE (V_EMPNO ||' ' || V_FIRST_NAME);
        V_EMPNO:=V_EMPNO+1;
    END LOOP;
END;
--==============================================
