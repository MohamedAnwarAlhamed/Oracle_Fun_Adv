SELECT TEXT
FROM ALL SOURCE
WHERE LOWER (NAME)='dbms_db_version'
ORDER BY LINE BEGIN DBMS_OUTPUT.PUT_LINE (DBMS_DB_VERSION.DBMS_DB_VERSION);

DBMS_OUTPUT.PUT_LINE(DBMS_DB_VERSION.RELEASE);

IF DBMS_DB_VERSION.VER_LE_12 OR DBMS_DB_VERSION.VER_LE_12_1 THEN
DBMS_OUTPUT.PUT_LINE('it is 12c :)');

END IF;

END;
--==============================================
CREATE OR REPLACE FUNCTION GET_SAL (P_EMP_ID NUMBER)
RETURN NUMBER IF DBMS_DB_VERSION.VERSION>=11 THEN RESULT_CACHE END
IS
    V_SAL NUMBER;
BEGIN
    SELECT SALARY INTO V SAL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=P_EMP_ID;
    RETURN V SAL;
END;
--==============================================
SELECT NAME, VALUE
FROM V$PARAMETER
WHERE NAME ='plsql_optimize_level';
BEGIN
    DBMS_OUTPUT.PUT_LINE($$PLSQL_CODE_TYPE);
    DBMS_OUTPUT.PUT_LINE($$PLSQL_OPTIMIZE_LEVEL);
    DBMS_OUTPUT.PUT_LINE($$PLSQL_WARNINGS);
END;
--==============================================
CREATE OR REPLACE PROCEDURE G_TEST 
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('test');
END;

CREATE OR REPLACE PROCEDURE G_TEST IS
BEGIN
    IF $$PLSQL_OPTIMIZE_LEVEL <>2 THEN
        ERROR 'it should be compiled with plsql_optimize_level=2' ŞEND ŞEND DBMS_OUTPUT.PUT_LINE('TEST');
END;
--==============================================
SELECT NAME, VALUE
FROM V$PARAMETER
WHERE NAME='plsql-ccflags';

ALTER SESSION SET PLSQL_CCFLAGS='LANGUAGE:1';
    
SELECT NAME, VALUE
FROM V$PARAMETER 
WHERE NAME ='PLSQL CEFLAGS';
--to print this directive
BEGIN
    DBMS_OUTPUT.PUT_LINE($$LANGUAGE);
    DBMS_OUTPUT.PUT_LINE($$PLSQL_CCFLAGS);
END;
 --==============================================
 --to use it in PLSQL code
CREATE OR REPLACE FUNCTION GET_CURR_LANG 
RETURN VARCHAR2 
IS 
V_LANG VARCHAR2(100);
BEGIN
        V_LANG:='the curr language in system is '|| 
        IF $$LANGUAGE=1 THEN
            'English' 
            ELSE 'Arabic' 
            END; 
        RETURN V_LANG;
END;

SELECT GET_CURR_LANG
FROM DUAL;
        
SELECT  *
FROM USER_PLSQL_OBJECT_SETTINGS
WHERE LOWER(NAME)='get curr lang';
--==============================================
--note: you should know when to use Sif and normal if
DECLARE
BEGIN
    IF $$LANGUAGE=1 THEN
        DBMS_OUTPUT.PUT_LINE('the curr language in system is English');
    ELSE
        DBMS_OUTPUT.PUT_LINE('the curr language in system is Arabic' );
    END IF;
END;
--==============================================
--from left to right
ALTER SESSION SET PLSQL_CCFLAGS='plsql_ccflags:true,debug:true, Gebug:0';

SELECT NAME, VALUE
FROM V$PARAMETER
WHERE NAME ='plsql_ccflags';

BEGIN
    if $$PLSQL_CCFLAGS THEN
        DBMS_OUTPUT.PUT_LINE('plsql_ccflags value is true');
    END IF;
    IF $$DEBUG=0 THEN
        DBMS_OUTPUT.PUT_LINE('debug value is 0');
    END IF;

    DBMS OUTPUT.PUT_LINE ($$DDFDFGF);
    BEGIN
    IF $$PLSQL CCFLAGS THEN
        DBMS_OUTPUT.PUT_LINE('plsql_ccflags value is true');
    END IF;

    IF $$DEBUG=0 THEN
        DBMS_OUTPUT.PUT_LINE('debug value is 0');
    END IF;

    DBMS_OUTPUT.PUT_LINE($$DDFDFGF);
END;
 --now
ALTER SESSION SET PLSQL_WARNINGS='enable: all';
--now it should give warning, but it will not --the warning only in subprograms
BEGIN
    IF $$PLSQL_CCFLAGS THEN
        DBMS_OUTPUT.PUT_LINE('plsql_ccflags value is true');
    END IF;

    IF $$DEBUG=0 THEN
        DBMS_OUTPUT.PUT_LINE('debug value is 0');
    END IF;

    DBMS OUTPUT.PUT LINE ($$DDFDFGF);
END;
END;
--==============================================
CREATE OR REPLACE PROCEDURE cc
BEGIN
    IF $$PLSQL_CCFLAGS THEN
        DBMS_OUTPUT.PUT_LINE('plsql_ccflags value is true');
    END IF;

    IF $$DEBUG=0 THEN
        DBMS_OUTPUT.PUT_LINE('debug value is 0');
    END IF;

    DBMS_OUTPUT.PUT_LINE($$DDFDFGF);
END;
--==============================================
--some other examples on plsql_ccflags
SELECT NAME, VALUE
FROM V$PARAMETER
WHERE NAME='plsql_ccflags';

ALTER SESSION SET PLSQL_CCFLAGS='trace_time:true, maxsizev 2000';

SELECT NAME, VALUE
FROM V$PARAMETER
WHERE NAME ='plsql_ccflags';
--==============================================
CREATE OR REPLACE PROCEDURE TEST_ONLY 
IS
    V VARCHAR2($$MAXSIZEV);
BEGIN
    IF $$TRACE TIME THEN
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE, 'hh:mi:ss') );
    END IF;

    FOR I IN 1..1000
    LOOP
         dbms_output.put_line ($$maxsizev); end loop;
         IF $$TRACE_TIME THEN
         dbms_output.put_line(to_char (sysdate, 'hh:mi:ss')); 
         end if;
END;

exec test only;

ALTER SESSION SET PLSQL_CCFLAGS='trace_time:false, maxsizev: 2000';

exec test only;
--==============================================

--you should compile again
CREATE OR REPLACE PROCEDURE TEST_ONLY 
IS
    V VARCHAR2($$MAXSIZEV);
BEGIN
    dbms_output.put_line($$maxsizev); end loop;
    IF 
        $$TRACE TIME THEN DBMS_OUTPUT.PUT_LINE(TO_CHAR (SYSDATE, 'hh:mi:ss'));
    END IF;
END;
SELECT *
FROM USER_PLSQL_OBJECT_SETTINGS 
WHERE LOWER(NAME)='test_only';

EXEC TEST_ONLY;

CALL DBMS_PREPROCESSOR.PRINT_POST_PROCESSED_SOURCE('procedure', 'hr', 'test_only');
