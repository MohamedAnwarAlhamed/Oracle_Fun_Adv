BEGIN
    FOR I IN 1..30000 LOOP
        DBMS_OUTPUT.ENABLE (1000000); --MAX 1, 000, 000
        DBMS_OUTPUT.PUT_LINE (LPAD (I, 7, 0));
    END LOOP;
END;
 --==============================================
 --messages not sent untill the PLSQL completed
BEGIN
    DBMS_OUTPUT.PUT_LINE('test');
    DBMS_OUTPUT.DISABLE;
    DBMS_OUTPUT.PUT_LINE('test2');
    DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE('test3');
END;
 --==============================================
BEGIN
    DBMS_OUTPUT.PUT_LINE('welcome');
    DBMS_OUTPUT.PUT('my');
    DBMS_OUTPUT.PUT('name');
    DBMS_OUTPUT.PUT('is');
    DBMS_OUTPUT.PUT('khaled');
    DBMS_OUTPUT.NEW_LINE;
    --YOU SHOULD USE THIS AFTER PUT 
    DBMS_OUTPUT.PUT_LINE('my name is khaled');
END;
 --==============================================
DECLARE
    BUFFER VARCHAR2(100) STATUS INTEGER;
BEGIN
 --After calling GET_LINE or GET_LINES,
 --any lines not retrieved before the next call to PUT, PUT_LINE,
 --or NEW LINE are discarded to avoid confusing them with the next message.*/
    DBMS_OUTPUT.PUT_LINE('line 1');
    DBMS_OUTPUT.PUT_LINE('line 2');
    DBMS_OUTPUT.PUT_LINE('line 3');
 --This procedure retrieves a single line of buffered information.
    DBMS_OUTPUT.GET_LINE(BUFFER, STATUS);
    DBMS_OUTPUT.PUT_LINE('Buffer:' || BUFFER);
    DBMS_OUTPUT.PUT_LINE('Status: ' || TO_CHAR(STATUS));
 --If the call completes successfully,
 --then the status returns as 0. If there are no more*/
END;
 --==============================================
DECLARE
    BUFFER VARCHAR2(100);
    STATUS INTEGER;
    V VARCHAR2(3000);
BEGIN
    DBMS_OUTPUT.PUT_LINE('line 1');
    DBMS_OUTPUT.PUT_LINE('line 2');
    DBMS_OUTPUT.PUT_INE('line 3');
    FOR I IN 1..3 LOOP
        DBMS_OUTPUT.GET_LINE(BUFFER, STATUS);
        V:=V ||BUFFER ||CHR(10);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(V);
END;
 --==============================================
DECLARE
    BUFFER DBMS_OUTPUT.CHARARR;
    V_LINE INTEGER;
BEGIN
    V_LINE:=10;
    DBMS_OUTPUT.PUT_LINE('line 1');
    DBMS_OUTPUT.PUT_LINE('line 2');
    DBMS_OUTPUT.PUT_LINE('line 3');
    DBMS_OUTPUT.GET_LINES (BUFFER, V_LINE);
    DBMS_OUTPUT.PUT_LINE(BUFFER(3));
    DBMS_OUTPUT.PUT_LINE(BUFFER(2));
    DBMS_OUTPUT.PUT_LINE(BUFFER(1));
END;
 --==============================================
 --==============================================
 --==============================================
 --Now because theses 2 functions are logically grouped,
 --it is better to use package
 --The code will be more organized
CREATE OR REPLACE PACKAGE AREA 
IS 
FUNCTION SQUARE_AREA( P_SIDE NUMBER ) RETURN NUMBER;
FUNCTION RECTANGLE_AREA ( P_1 NUMBER, P_W NUMBER ) RETURN NUMBER;
END;
 --==============================================
CREATE OR REPLACE PACKAGE BODY AREA 
IS 
    FUNCTION SQUARE_AREA ( P_SIDE NUMBER ) 
    RETURN NUMBER 
    IS
    BEGIN
            RETURN P_SIDE*P_SIDE;
    END;

    FUNCTION RECTANGLE_AREA ( P_1 NUMBER, P_W NUMBER ) 
    RETURN NUMBER 
    IS
    BEGIN
        RETURN P_1*P_W;
    END;
END;

SELECT AREA.SQUARE_AREA(4)
FROM DUAL
    SELECT AREA.RECTANGLE_AREA (4, 10)
    FROM DUAL;
 --so now no need for square_area, rectangle_area which created in step 1,2
 --==============================================
 --1 we create the package spec.
CREATE OR REPLACE PACKAGE GENERAL_STUDENT 
IS 
PROCEDURE INSERT STUDENT (P_FIRST_NAME VARCHAR2, P_BIRTHDAY DATE);
PROCEDURE DELETE_STUDENT ( P_STUDENT_ID NUMBER );
FUNCTION GET_NAME ( P_STUDENT_ID NUMBER ) RETURN VARCHAR2;
END;
 --==============================================
CREATE OR REPLACE PACKAGE BODY GENERAL_STUDENT 
IS 
    PROCEDURE INSERT_STUDENT ( P_FIRST_NAME VARCHAR2, P_BIRTHDAY DATE ) IS
        BEGIN
            INSERT INTO STUDENT VALUES (STUDENT_SEQ.NEXTVAL,P_FIRST_NAME, P_BIRTHDAY);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
 --==============================================
PROCEDURE DELETE_STUDENT (P_STUDENT_ID NUMBER) 
IS
    BEGIN
        DELETE FROM STUDENT
        WHERE STUDENT_ID =P_STUDENT_ID;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
 --==============================================
FUNCTION GET_NAME (P_STUDENT_ID NUMBER) RETURN VARCHAR2 
IS 
    V_NAME STUDENT.FIRST_NAME&TYPE;
BEGIN
    SELECTFIRST_NAME INTO V_NAME
    FROM STUDENT
    WHERE STUDENT_ID=P_STUDENT_ID;
    RETURN V_NAME;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END;
 --==============================================
EXECUTE GENERA_STUDENT.INSERT_STUDENT ('khaled ahmed', '10-may-81');
EXECUTE GENERAL_STUDENT.INSERT_STUDENT ('samer ahmed', '10-may-82');
SELECT *
FROM STUDENT;
EXECUTE GENERAL_STUDENT.DELETE_STUDENT(1);
SELECT *
FROM STUDENT;
 --==============================================
EXECUTE GENERAL_STUDENT.INSERT_STUDENT ('samer ahmed', '10-may-82');

SELECT *
FROM STUDENT;

EXECUTE GENERAL_STUDENT.DELETE_STUDENT (1);
SELECT
FROM STUDENT;

SELECT GENERAL_STUDENT.GET_NAME(2)
FROM DUAL;
 --==============================================
 --we can create package specification without body
 --this used when we want to define global variable
CREATE OR REPLACE PACKAGE GLOBAL_MEASUREMENT 
IS 
    C_MILE TO KM CONSTANT NUMBER:=1.6093;
    C_KILO_TO_MILE CONSTANT NUMBER:=0.6214;
END;
EXECUTE DBMS_OUTPUT.PUT_LINE('60 mile:=' ||60* GLOBAL_MEASUREMENT.C_MILE_TO_KM || 'KM');
EXECUTE DBMS_OUTPUT.PUT_LINE('100 KM:=' ||100* GLOBAL_MEASUREMENT.C_KILO_TO_MILE ||' MILE' )
 -- now i can create function that read form this package
CREATE OR REPLACE FUNDTION GET_MILE_TO_KM (P_VALUE NUMBER) 
RETURN NUMBER 
IS
BEGIN
    RETURN P_VALUE* GLOBAL_MEASUREMENT.C_MILE_TO_KM;
END;

SELECT GET_MILE_TO_KM(100)
FROM DUAL;
 --==============================================
DECLARE

    FUNCTION GET_SYSDATE RETURN DATE IS
    BEGIN
        RETURN SYSDATE;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(GET_SYSDATE);
END;
 --==============================================
 --note that we can update the package body without compile the spec.
CREATE OR REPLACE PACKAGE BODY P_TEST 
IS 
    C C_VA VAR3 VARCHAR2(100):='hi there';
    PROCEDURE PRINT IS C_VAR4 VARCHAR2(100):='hi';
BEGIN
    DBMS_OUTPUT.PUT_LINE('this variable came from package spec. ' ||C_VARL);
    DBMS_OUTPUT.PUT_LINE('this variable came from package spec. '||C_VAR2);
    DBMS_OUTPUT.PUT_LINE('this variable came from package body. '||C_VAR3);
    DBMS_OUTPUT.PUT_LINE('this variable came from print Proc. ' ||C_VAR4);
END;

BEGIN
    DBMS_OUTPUT.PUT_LINE('this is optional');
END;
 --==============================================
 --now let us try to change the package spec again --a major change/ add new subprogram
CREATE OR REPLACE PACKAGE P_TEST 
IS C_VARL CONSTANT NUMBER:=10;
    C_VAR2 VARCHAR2(100):='welcome';
    P_N NUMBER;
    PROCEDURE PRINT;
    FUNCTION GET_NAME ( P NUMBER ) RETURN VARCHAR2;
END;
EXECUTE P_TEST.PRINT;
SELECT *
FROM USER_OBJECTS;
 --==============================================
 --case 1 (2 procedure differ in number of parameters
CREATE OR REPLACE PACKAGE OVERLOAD_PROC 
IS 
    PROCEDURE ADD_CUST ( P_ID NUMBER, P_NAME VARCHAR2, P_BD DATE );
    PROCEDURE ADD_CUST ( P_ID NUMBER, P_NAME VARCHAR2 );
END;
 --====
CREATE OR REPLACE PACKAGE BODY OVERLOAD_PROC 
IS 
    PROCEDURE ADD_CUST( P_ID NUMBER, P_NAME VARCHAR2, P_BD DATE ) IS
    BEGIN
        INSERT INTO CUSTOMER (CUST ID,NAME,BIRTHDAY)
        VALUES (P_ID,P_NAME,P_BD);
    COMMIT;
END;
 --====
CREATE OR REPLACE PACKAGE BODY OVERLOAD_PROC 
IS 
    PROCEDURE ADD_CUST ( P_ID NUMBER, P_NAME VARCHAR2, P_BD DATE ) IS
    BEGIN
        INSERT INTO CUSTOMER (CUST_ID,NAME,BIRTHDAY) 
        VALUES (P_ID,P_NAME,P_BD);
    COMMIT;
END;
 --=====
PROCEDURE ADD_CUST ( P_ID NUMBER, P_NAME VARCHAR2 )
IS
BEGIN
    INSERT INTO CUSTOMER ( CUST_ID,NAME)
    VALUES (P_ID, P_NAME,);
    COMMIT;
END;

EXECUTE OVERLOAD_PROC.ADD_CUST(2, 'ford');
 --==============================================
 --case 2 (2 procedure same number of parameters, differ in type)
CREATE OR REPLACE PACKAGE OVERLOAD_PROC 
IS 
    PROCEDURE ADD_CUST ( P_ID NUMBER, P_NAME VARCHAR2, P_BD DATE );
    PROCEDURE ADD_CUST ( P_ID NUMBER, P_NAME VARCHAR2 ); 
    PROCEDURE ADD_CUST( P_NAME VARCHAR2, P_ID NUMBER ); 
END;
 --==============================================
 --CASE 3 (2 PROCEDURE SAME NUMBER OF PARAMETERS, SAME FAMILY)
CREATE OR REPLACE PACKAGE OVERLOAD_PROC 
IS 
    PROCEDURE ADD_CUST( P_ID NUMBER, P_NAME VARCHAR2, P_BD DATE );
    PROCEDURE ADD_CUST ( P_ID INTEGER, P_NAME VARCHAR2, P_BD DATE ); 
END;
 --==============================================
CREATE OR REPLACE PACKAGE OVERLOAD_FUNCION IS 
    FUNCTION FL ( PL NUMBER ) RETURN NUMBER;
    FUNCTION FL ( PL VARCHAR2 ) RETURN VARCHAR2; 
END;
 --======
CREATE OR REPLACE PACKAGE BODY OVERLOAD FUNCION 
IS 
    FUNCTION FL ( PL NUMBER ) RETURN NUMBER IS
    BEGIN
        RETURN P1;
END;
 --==============================================
 --overloading the standard package
CREATE OR REPLACE PACKAGE OVERRIDE 
IS
 --we defined to char function and this function already exist as oracle bulit-in function
    FUNCTION TO CHAR PL NUMBER, P2 DATE RETURN VARCHAR2;
    PROCEDURE PRINT; --معرو�?
END;
 --========
CREATE OR REPLACE PACKAGE BODY OVERRIDE 
IS 
    FUNCTION TO THAR( PL NUMBER, P2 DATE ) 
    RETURN VARCHAR2 
    IS
    BEGIN
        RETURN PL|P2;
END;

PROCEDURE PRINT 
IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE (TO_CHAR(1, '1-jan-81'));
        DBMS_OUTPUT.PUT_LINE(STANDARD.TO_CHAR(10));
    END;
 --==============================================
CREATE OR REPLACE PACKAGE PROC_RULES_CALLING IS 
    PROCEDURE PRINT_EMP_DETAILS ( P_EMP_ID NUMBER );
END;
 --=============
CREATE OR REPLACE PACKAGE BODY PROC_RULES_CALLING 
IS 
    FUNCTION GET_NO_WORK_DAYS ( PEMPLID NUMBER ) RETURN NUMBER;
 --WE PUT THE FUNCTION SPECIFICATION ONLY
    PROCEDURE PRINT_EMP_DETAILS ( P_EMP_ID NUMBER ) -- complate video
 --==============================================
 --using PRAGMA SERIALLY_REUSABLE;
CREATE OR REPLACE PACKAGE PERSISTENT_STATE 
IS 
    PRAGMA SERIALLY_REUSABLE;
    G_VAR NUMBER:=10;
    PROCEDURE UPDATE_G_VAR ( P_NO NUMBER );
END;
 --==============================================
 --==============================================
 --==============================================
 --TO READ/WRITE FILE, WE NEED TO CREATE DIRECTORY CREATE DIRECTORY ONLY FOR SYS AND SYSTEM USER
 --1- open sqlplus
 --2-con as sysdba
 --3- alter session set container=pdborel 4- Ireate directory mydir as 'F: TEST'; 6- CREATE THE DIRECTORY ON your computer (the server) 7-put empty file sample.txt
 --5- grant READ, WRITE on DIRECTORY MYDIR to public;
 --take the output for this select and put it in sample.txt
SELECT
FROM EMPLOYEES;
DECLARE L_FILE UTL_FILE .FILE_TYPE;
    L_LOCATION VARCHAR2 (100) := 'MYDIR';
    -CAPITAL    VARCHAR2(100) := 'sample.txt';
    L_FILENAME L_TEXT VARCHAR2 (32767);
BEGIN
    OPEN FILE. 1 FILE := UTL_FILE.FOPEN(L_LOCATION, L_FILENAME, 'r');
 --Read and output first line.
    UTL_FILE.GET_LINE(L_FILE, L_TEXT);
    DBMS_OUTPUT.PUT_LINE('First Line:' || L_TEXT);
    UTL_FILE.GET_LINE(L_FILE, L_TEXT);
    DBMS_OUTPUT.PUT_LINE('second Line:' || L_TEXT );
 --close the file
    UTL_FILE.FCLOSE(L_FILE);
END;
 --========
DECLARE
    L_FILE     UTL_FILE .FILE_TYPE;
    L_LOCATION VARCHAR2 (100) := 'MYDIR';
    -CAPITAL    VARCHAR2(100) := 'sample.txt';
    L_FILENAME L_TEXT VARCHAR2 (32767);
BEGIN
    OPEN FILE. L_FILE := UTL_FILE.FOPEN(L_LOCATION, L_FILENAME, 'r');
 --Read and output first line.
    L_FILE: UTL_FILE.FOPEN(L_LOCATION, L_FILENAME, 'r');
    BEGIN
        LOOP
            UTL_FILE.GET_LINE(L_FILE, L_TEXT);
            DBMS_OUTPUT.PUT_LINE('First Line:' || L_text);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('end file');
    END;
 --close the file
    UTL_FILE.FCLOSE(L_FILE);
END;
 --==============================================
DECLARE
    L_FILE     UTL_FILE .FILE_TYPE;
    L_LOCATION VARCHAR2 (100) := 'MYDIR'; --CAPITAL
    L_FILENAME VARCHAR2 (100) := 'sample2.txt';
BEGIN
 --OPEN FILE.
    L_FILE: UTL_FILE.FOPEN(L_LOCATION, L_FILENAME, 'w');
    FOR I IN (
        SELECT *
        FROM DEPARTMENTS
    ) LOOP
        UTL_FILE.PUT_LINE (L_FILE, I.DEPARTMENT_NAME);
    END LOOP;
 --close the file
    UTL_FILE.FCLOSE(L_FILE);
    L_FILE := UTL_FILE.FOPEN(L_LOCATION, L_FILENAME, 'A');
    UTL_FILE.PUT_LINE(L_FILE, 'ADDITIONAL LINES');
    UTL_FILE.FCLOSE(L_FILE);
END;
 --==============================================
CREATE OR REPLACE PROCEDURE READ_ANY_FILE ( P_DIR IN VARCHAR2, P_FILE_NAME IN VARCHAR2 ) 
IS L_FILE UTL_FILE .FILE_TYPE;
L_TEXT VARCHAR2 (32767);
BEGIN
    L_FILE: UTL_FILE.FOPEN(P_DIR, P_FILE_NAME, 'r');
    LOOP
        UTL_FILE.GET_LINE (L_FILE, L_TEXT);
        DBMS_OUTPUT.PUT_LINE('First Line:'|| L_TEXT);
    END LOOP;

    UTL_FILE.FCLOSE(L_FILE);
EXCEPTION
    WHEN UTL_FILE.INVALID_OPERATION THEN
        DBMS OUTPUT.PUT_LINE ('can not open the file, invalid file name');
    WHEN UTL_FILE.READ_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('can not be read');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('end file');
        UTL_FILE.FCLOSE(L_FILE);
END;

EXECUTE READ_ANY_FILE('MYDIR', 'sample2.txt');
EXECUTE READ_ANY_FILE('MYDIR', 'sampdddle.txt');
 --TO SEE ALL DIRECTORIES
SELECT *
FROM ALL_DIRECTORIES;
 --==============================================
BEGIN
    UTL_MAIL.SEND (
        SENDER => 'khaled.khudari@ankabut.ae',
        RECIPIENTS => 'khaled_alkhudari@hotmail.com',
        SUBJECT => 'Test Mail',
        MESSAGE => 'Hello World',
        MIME_TYPE => 'text; charset=us-ascii'
    );
END;
 --==============================================
 --create directory KHTEST as '/u01';
DECLARE

    FUNCTION GET IMAGE ( P_DIR VARCHAR2, P_FILE_NAME VARCHAR2) 
    RETURN RAW 
    IS
        IMAGE RAW (32767);
        F     BFILE :=BFILENAME (P_DIR, P_FILE_NAME);
 --BFILENAME returns a BFILE locator that is associated
 --with a physical LOB binary file on the server file system
    BEGIN
 --This procedure opens a BFILE for read-only access.
        DBMS_LOB.FILEOPEN(F, DBMS_LOB.FILE_READONLY);
        IMAGE: DBMS_LOB.SUBSTR(F);
        DBMS_LOB.CLOSE(F);
        RETURN IMAGE;
    END;
BEGIN
    UTL_MAIL.SEND_ATTACH_RAW(SENDER => 'khaled.khudari@ankabut.ae', RECIPIENTS => 'khaled_alkhudari@hotmail.com', SUBJECT => 'Test Mail with Attachment', MESSAGE => 'kindly find the attachment', MIME_TYPE => 'text; charset=us-ascii', ATTACHMENT=> GET_IMAGE('KHTEST', 'jordan.jpg'), ATT_INLINE=>TRUE, ATT_MIME_TYPE=>'image/jpg', ATT_FILENAME=>'jordan.jpg' );
END;
 --==============================================
DECLARE

    FUNCTION GET_FILE (PDIR VARCHAR2, P_FILE_NAME VARCHAR2)
    RETURN VARCHAR2 
    IS
        V_CONT VARCHAR2 (32767);
        F BFILE :=BFILENAME (P_DIR, P_FILE_NAME);
 --BFILENAME returns a BFILE locator that is associated
 --with a physical LOB binary file on the server file system
    BEGIN
 --This procedure opens a BFILE for read-only access.
        DBMS_LOB.FILEOPEN(F, DBMS_LOB.FILE_READONLY);
        V_CONT:= UTL_RAW.CAST_TO_VARCHAR2 (DBMS_LOB.SUBSTR(F));
        DBMS_LOB.CLOSE(F);
        RETURN V CONT;
    END;
BEGIN
    UTL_MAIL.SEND_ATTACH_VARCHAR2(SENDER => 'khaled.khudari@ankabut.ae', RECIPIENTS => 'khaled_alkhudari@hotmail.com', SUBJECT => 'Test Mail with text Attachment', MESSAGE => 'kindly find the attachment', MIME TYPE => 'text; charset-us-ascii', ATTACHMENT=> GET_FILE('KHTEST', 'notes.txt'), ATT_INLINE=>FALSE, ATT_MIME_TYPE=>'text/Plain', ATT_FILENAME=>'notes.txt' );
END;