-- PL/SQL Customer transaction

drop sequence customerseq;
purge recyclebin;

create sequence customerseq start with 6;
    
set serveroutput on 
DECLARE
C_CUSTOMERNO Customer.customerNo%TYPE;
C_FNAME Customer.firstName%TYPE:='&Enter_First_Name';
C_LNAME Customer.lastName%TYPE:='&Enter_Surname';
C_ADDRESS Customer.address%TYPE:='&Enter_Address';
C_EMAIL Customer.email%TYPE:='%Enter_Email';
C_PHONENO Customer.phoneNo%TYPE:='&Enter_Phone_No';
c_customerNo INTEGER:=0; --current staff member
c_capacity INTEGER:=10; --maxim number om employee the company can hire

BEGIN 
    SELECT COUNT(*) INTO c_customerNo FROM Customer;
    IF c_customerNo < c_capacity THEN
    C_CUSTOMERNO := customerseq.NEXTVAL;
    INSERT INTO Customer(customerNo, firstName, lastName, address, phoneNo, email) 
        VALUES(C_CUSTOMERNO, C_FNAME, C_LNAME, C_ADDRESS,  C_EMAIL);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('customerNo'||C_CUSTOMERNO||'is named'||C_FNAME||' '||'has address'||C_CADDRESS||'and phone no'||
        C_PHONENO||'and email'||C_EMAIL);
    ELSE
        DBMS_OUTPUT.PUT_LINE('We have reached the maximum no of staff members. Sorry');
    ENDIF
EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLCODE||' '||SQLERRM);
            DBMS_OUTPUT.PUT_LINE('Rolling back...!');
            ROLLBACK;
END

--select * from Staff;