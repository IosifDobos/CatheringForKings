DROP TABLE SeasonalStock;
DROP TABLE SeasonalResources;
DROP TABLE ResourceStock;  
DROP TABLE ResourcesType;
DROP TABLE MenuItemOrder;
DROP TABLE Ingredients;
DROP TABLE Payments;
DROP TABLE Booking;
DROP TABLE Event;
DROP TABLE Brochures;
DROP TABLE Menu;
DROP TABLE Customer;

CREATE TABLE Customer(
    customerNo NUMBER(5),
    firstName VARCHAR2(50) not null,
    lastName VARCHAR2(50) not null,
    address VARCHAR2(255) not null,
    phoneNo NUMBER(10) not null,
    email VARCHAR2(100),
    
    PRIMARY KEY (customerNo),
    CONSTRAINT email_chk CHECK (email Like '%@%')
);

CREATE TABLE Menu(
    menuNo NUMBER(5) NOT NULL,
    menuType VARCHAR(50) not null,
    menuDescription VARCHAR(50) not null,
    menuCost NUMBER(5,2) not null,
    menuReciept NUMBER(5,2) not null,
    menuDuration TIMESTAMP not null,
    menuOrderNo NUMBER(5) not null,
    
    PRIMARY KEY (menuNo)
);

CREATE TABLE Brochures(
    brochuresNo NUMBER(5),
    menuName VARCHAR2(255) NOT NULL ,
    menuItemNo NUMBER(3) NOT NULL ,
    menuDescription VARCHAR2(255) NOT NULL ,
    noOfPerson  NUMBER(10) NOT NULL ,
    pricePerPerson NUMBER (5,2) NOT NULL,
    menuNo NUMBER(5) NOT NULL,
    
    PRIMARY KEY (brochuresNo),
    CONSTRAINT Brochures_Menu_fk FOREIGN KEY (menuNo) REFERENCES Menu(menuNo)
);

CREATE TABLE Event(
    eventID NUMBER(5) NOT NULL,
    eventName VARCHAR(255) NOT NULL,
    eventLocation VARCHAR(255) NOT NULL,
    eventDate DATE NOT NULL,
    brochuresNo NUMBER(5) NOT NULL, 
    
    PRIMARY KEY (eventID),
    CONSTRAINT Brochures_Event_fk FOREIGN KEY (brochuresNo) REFERENCES Brochures(brochuresNo)
);

CREATE TABLE Booking(
    bookingNo NUMBER(5),
    location VARCHAR2(255) NOT NULL,
    bookingInfo VARCHAR2(255) NOT NULL,
    bookingstatus VARCHAR2(1) NOT NULL ,
    bookingDate DATE NOT NULL,
    bookingcost Number(8,2) NOT NULL,
    eventID NUMBER(5) NOT NULL,
    customerNo NUMBER(5) NOT NULL,
    
    PRIMARY KEY (bookingNo),
    CONSTRAINT Booking_Event_fp FOREIGN KEY (eventID) REFERENCES Event(eventID),
    CONSTRAINT Booking_Customer_fk FOREIGN KEY (customerNo) REFERENCES Customer(customerNo)

);

CREATE TABLE Payments(
    paymentNo NUMBER(5) NOT NULL,
    amountPaid NUMBER(10,2) NOT NULL,
    bookingNo NUMBER(5) NOT NULL,
    
    PRIMARY KEY (paymentNo),
    CONSTRAINT Payment_Booking_fk FOREIGN KEY (bookingNo) REFERENCES Booking(bookingNo)
);

CREATE TABLE Ingredients(
    ingredientsID NUMBER(5) NOT NULL,
    detailsIngredients VARCHAR (255) NOT NULL,
    menuNo NUMBER(5) NOT NULL,
    
    
    PRIMARY KEY (ingredientsID),
    CONSTRAINT Ingredients_Menu_fk FOREIGN KEY (menuNo) REFERENCES Menu(menuNo)
);

CREATE TABLE MenuItemOrder(
    menuOrderNO NUMBER(5) NOT NULL,
    numberOfPerson NUMBER(3) NOT NULL,
    menuOrderCost NUMBER(5,2) NOT NULL,
    menuNo NUMBER(5),
    bookingNo NUMBER(5) NOT NULL,
    
    CONSTRAINT menuOrderNO_PK PRIMARY KEY (menuOrderNO),
    CONSTRAINT MenuItemOrder_Menu_fk FOREIGN KEY (menuNo) REFERENCES Menu(menuNo),
    CONSTRAINT MenuItemOrder_Booking_fk FOREIGN KEY (bookingNo) REFERENCES Booking(bookingNo)
);

CREATE TABLE ResourcesType(
    resourceID NUMBER(5) NOT NULL ,
    resourcestype VARCHAR2(10) NOT NULL ,
    resourcedescription VARCHAR2(255) NOT NULL ,
    resourceCost NUMBER(5,2) NOT NULL ,
    eventID NUMBER(5) NOT NULL ,
    
    CONSTRAINT resourceID_PK PRIMARY KEY (resourceID),
    CONSTRAINT Resourcestype_Event_fk FOREIGN KEY (eventID) REFERENCES Event(eventID)
);

CREATE TABLE ResourceStock(
    resourceStockID NUMBER(5) NOT NULL,
    resourceStockQty VARCHAR2(5) NOT NULL,
    resourceID NUMBER(5) NOT NULL,
    
    CONSTRAINT ResourceStockID_PK PRIMARY KEY (resourceStockID),
    CONSTRAINT ResourceStock_Resourcestype_fk FOREIGN KEY (resourceID) REFERENCES ResourcesType(resourceID)
);

CREATE TABLE SeasonalResources(
    seasonalResourcesNO NUMBER(5) NOT NULL,
    seasonalDescription VARCHAR2(255) NOT NULL,
    seasonalCost NUMBER(5,2) NOT NULL,
    resourceID NUMBER(5) NOT NULL,
    
    CONSTRAINT SeasonalResourcesNO_PK PRIMARY KEY (seasonalResourcesNO),
    CONSTRAINT SeasonalResc_ResourceType_fk FOREIGN KEY (resourceID) REFERENCES ResourcesType(resourceID)
);

CREATE TABLE SeasonalStock(
    seasonalStockID NUMBER(5) NOT NULL ,
    stockQuantity NUMBER(4) NOT NULL ,
    seasonalResourcesNO NUMBER(5) NOT NULL ,
    
    CONSTRAINT seasonalStockID_PK PRIMARY KEY (seasonalStockID),
    CONSTRAINT SeasonalStock_SeasonalResc_fk FOREIGN KEY (seasonalResourcesNO) REFERENCES SeasonalResources(seasonalResourcesNO)

);


INSERT INTO Customer (customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12341 , 'john','smith','24 clontarf Blvd, Dublin 3','0854553322','Jsmith@mail.com');

INSERT INTO Customer( customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12342 , 'SARA','ALLON','18 grand canal, Dublin 2','0874536329','SALLON@mail.com');

INSERT INTO Customer(customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12343 , 'marry','gordan','02 sandyford, Dublib 18','0836995258','Mgordan@mail.com');

INSERT INTO Customer(customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12344 , 'Ellie','Maribel','04 merrllyn road, Dublin 13','0836995008','elliem12@mail.com');

INSERT INTO Customer(customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12345 , 'Therry','McAtamey','122 patrol field, Dublin 24','08912331212','therry_m@mail.com');

-- adding data into table
INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12221 , 'starter', 'Breaded mushrooms', 8.00, 50.00, TIMESTAMP '2018-11-16 00:35:20', 13331);

INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12222 , 'main course','Pistachio chicken with pomegranate sauce', 20.00, 50.00, TIMESTAMP '2018-11-16 1:55:39',13331);

INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12223 , 'dessert','Apple pie', 12.00, 50.00, TIMESTAMP '2018-11-16 2:10:00' ,13331);

INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12224 , 'drinks','Wine + Water', 10.00, 50.00, TIMESTAMP '2018-11-16 00:00:00' ,13331);
/*
INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(5 , 'starter','melon and parma ham','5.00','___','___','___');

INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(5 , 'starter','melon and parma ham','5.00','___','___','___');

INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(11 , 'maincourse','fillet of steak and chips','20.00','___','___','___');

INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(16 , 'maincourse','vegtibles','15.00','___','___','___');

INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(51 , 'desserts','pavlova with fruits','7.00','___','___','___');

INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(53 , 'desserts','apple tart and cream','5.00','___','___','___');

INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(54 , 'desserts','banoffi','7.00','___','___','___');
*/


 -- adding values into brochures table
 INSERT INTO Brochures( brochuresNo, menuName, menuItemNo, menuDescription, noOfPerson, pricePerPerson, menuNo)
    VALUES( 10101, 'Menu of the day', 3, 'starter, main course, dessert, drinks', 100, 50.00, 12221); 
 
-- adding events into the database 
INSERT INTO Event( eventID, eventName, eventLocation, eventDate, brochuresNo)
    VALUES( 11221, 'company meeting', 'central park dublin 18', TO_DATE('2018-11-14', 'yyyy-mm-dd'), 10101);

-- adding booking into database
INSERT INTO Booking (bookingNo ,location, bookingInfo, bookingstatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11111, 'central park Dublin 18','company meeting','R', TO_DATE('2018-10-12', 'yyyy-mm-dd'), 1500.00, 11221, 12341);
/*
INSERT INTO Booking (bookingNo ,location, bookingInfo, bookingstatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11112 , 'miltown dublin 16','Birthday party','S', TO_DATE('2018-11-14', 'yyyy-mm-dd'), 2200.50, 11222, 12342);
INSERT INTO Booking (bookingNo ,location, bookingInfo, bookingstatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11113 , 'castle court, Dublin 3','Christmas party','S', TO_DATE('2018-11-01', 'yyyy-mm-dd'), 1250.50, 11223, 12343);
INSERT INTO Booking (bookingNo ,location, bookingInfo, bookingstatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11114 , 'talaght road dublin 16','Special meeting','P', TO_DATE('2018-11-11', 'yyyy-mm-dd'), 5500.00, 11224, 12344);
INSERT INTO Booking (bookingNo ,location, bookingInfo, bookingstatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11115, 'blancharstown road dublin 15', 'Ocasional meeting + party','P', TO_DATE('2018-11-11', 'yyyy-mm-dd'), 3543.59, 11225, 12345);
*/   

commit;
/*
grant select on Customer to idobos;
grant select on Menu to idobos;
grant select on Brochures to idobos;
grant select on Event to idobos;
grant select on Booking to idobos;
grant select on Payments to idobos;
grant select on Ingredients to idobos;
grant select on MenuItemOrder to idobos;
grant select on ResourcesType to idobos;
grant select on ResourceStock to idobos;
grant select on SeasonalResources to idobos;
grant select on SeasonalStock to idobos;

grant select on Customer to idobos;
grant select on Menu to idobos;
grant select on Brochures to idobos;
grant select on Event to idobos;
grant select on Booking to idobos;
grant select on Payments to idobos;
grant select on Ingredients to idobos;
grant select on MenuItemOrder to idobos;
grant select on ResourcesType to idobos;
grant select on ResourceStock to idobos;
grant select on SeasonalResources to idobos;
grant select on SeasonalStock to idobos;

grant select on Customer to falgahtani;
grant select on Menu to falgahtani;
grant select on Brochures to falgahtani;
grant select on Event to falgahtani;
grant select on Booking to falgahtani;
grant select on Payments to falgahtani;
grant select on Ingredients to falgahtani;
grant select on MenuItemOrder to falgahtani;
grant select on ResourcesType to falgahtani;
grant select on ResourceStock to falgahtani;
grant select on SeasonalResources to falgahtani;
grant select on SeasonalStock to falgahtani;

grant select on Customer to aaljabri;
grant select on Menu to aaljabri;
grant select on Brochures to aaljabri;
grant select on Event to aaljabri;
grant select on Booking to aaljabri;
grant select on Payments to aaljabri;
grant select on Ingredients to aaljabri;
grant select on MenuItemOrder to aaljabri;
grant select on ResourcesType to aaljabri;
grant select on ResourceStock to aaljabri;
grant select on SeasonalResources to aaljabri;
grant select on SeasonalStock to aaljabri;

-- grant priveledge access to each member of the group
grant insert on Customer to idobos; -- as manager
grant update on Customer to idobos; -- as manager
grant delete on Customer to idobos; -- as manager

grant insert on Brochures to falgahtani; -- as designer
grant update on Brochures to falgahtani; -- as desinger
grant delete on Brochures to falgahtani; -- as desinger

grant insert on ResourcesType to aaljabri; -- as caretacker
grant update on ResourcesType to aaljabri; -- as caretacker
grant delete on ResourcesType to aaljabri; -- as caretacker
*/