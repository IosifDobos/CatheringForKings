-- droping tables
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

-- creating tables
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
    menuType VARCHAR(50) NOT NULL,
    menuDescription VARCHAR(50) NOT NULL,
    menuCost NUMBER(5,2) NOT NULL,
    menuReciept NUMBER(5,2) NOT NULL,
    menuDuration TIMESTAMP NOT NULL,
    menuOrderNo NUMBER(5) NOT NULL,
    
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
    bookingInformation VARCHAR2(255) NOT NULL,
    bookingStatus VARCHAR2(1) NOT NULL ,
    bookingDate DATE NOT NULL,
    bookingCost Number(8,2) NOT NULL,
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

-- Inserting data into tables
INSERT INTO Customer (customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12341 , 'john','smith','24 clontarf Blvd, Dublin 3','0854553322','Jsmith@gmail.com');

INSERT INTO Customer( customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12342 , 'SARA','ALLON','18 grand canal, Dublin 2','0874536329','SALLON@gmail.com');

INSERT INTO Customer(customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12343 , 'marry','gordan','02 sandyford, Dublib 18','0836995258','Mgordan@gmail.com');

INSERT INTO Customer(customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12344 , 'Ellie','Maribel','04 merrllyn road, Dublin 13','0836995008','elliem12@gmail.com');

INSERT INTO Customer(customerNo,firstName,lastName,Address,PhoneNo,email) 
VALUES(12345 , 'Therry','McAtamey','122 patrol field, Dublin 24','08912331212','therry_m@gmail.com');

-- adding data into Menu table
INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12221 , 'starter', 'Breaded mushrooms', 8.00, 50.00, TIMESTAMP '2018-11-16 00:35:20', 13331);

INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12222 , 'main course','Pistachio chicken with pomegranate sauce', 20.00, 50.00, TIMESTAMP '2018-11-16 1:55:39',13331);

INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12223 , 'dessert','Apple pie', 12.00, 50.00, TIMESTAMP '2018-11-16 2:10:00' ,13331);

INSERT INTO Menu (menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration, menuOrderNo) 
VALUES(12224 , 'drinks','Wine + Water', 10.00, 50.00, TIMESTAMP '2018-11-16 00:00:00' ,13331);

INSERT INTO Menu (menuNo,menuType,menuDescription,menuCost,menuReciept,menuDuration,menuOrderNo) 
VALUES(12225 , 'extra','Vegetarian Caprese Pasta Salad', 18.00,' 50.00',TIMESTAMP '2018-11-16 45:00:00', 133331);


 -- adding values into brochures table
 INSERT INTO Brochures( brochuresNo, menuName, menuItemNo, menuDescription, noOfPerson, pricePerPerson, menuNo)
    VALUES( 10101, 'Menu of the day', 4, 'starter, main course, dessert, drinks +', 100, 50.00, 12221); 

INSERT INTO Brochures( brochuresNo, menuName, menuItemNo, menuDescription, noOfPerson, pricePerPerson, menuNo)
    VALUES( 10102, 'The special menu', 4, 'starter, main course, dessert, drinks', 200, 80.00, 12222); 
    
INSERT INTO Brochures( brochuresNo, menuName, menuItemNo, menuDescription, noOfPerson, pricePerPerson, menuNo)
    VALUES( 10103, 'The kings menu', 4, 'starter, main course, dessert, drinks', 150, 90.00, 12223); 
    
INSERT INTO Brochures( brochuresNo, menuName, menuItemNo, menuDescription, noOfPerson, pricePerPerson, menuNo)
    VALUES( 10104, 'The vip menu', 4, 'starter, main course, dessert, drinks', 180, 70.00, 12224);

 
-- adding events into the database 
INSERT INTO Event( eventID, eventName, eventLocation, eventDate, brochuresNo)
    VALUES( 11221, 'Company meeting', 'central park dublin 18', TO_DATE('2018-11-14', 'yyyy-mm-dd'), 10101);

INSERT INTO Event( eventID, eventName, eventLocation, eventDate, brochuresNo)
    VALUES( 11222, 'Birthday party', 'miltown dublin 16', TO_DATE('2018-10-11', 'yyyy-mm-dd'), 10102);
    
INSERT INTO Event( eventID, eventName, eventLocation, eventDate, brochuresNo)
    VALUES( 11223, 'Christmas party', 'astle court, Dublin 3', TO_DATE('2018-08-11', 'yyyy-mm-dd'), 10103);

INSERT INTO Event( eventID, eventName, eventLocation, eventDate, brochuresNo)
    VALUES( 11224, 'Birthday party', 'copper dublin 12', TO_DATE('2018-10-11', 'yyyy-mm-dd'), 10104);

INSERT INTO Event( eventID, eventName, eventLocation, eventDate, brochuresNo)
    VALUES( 11225, 'Family reunion', 'blancharstown road dublin 15', TO_DATE('2018-11-16', 'yyyy-mm-dd'), 10104);


-- adding booking into database
INSERT INTO Booking (bookingNo ,location, bookingInformation, bookingStatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11111, 'central park Dublin 18','company meeting','R', TO_DATE('2018-10-12', 'yyyy-mm-dd'), 1500.00, 11221, 12341);
INSERT INTO Booking (bookingNo ,location, bookingInformation, bookingStatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11112 , 'miltown dublin 16','Birthday party','S', TO_DATE('2018-11-14', 'yyyy-mm-dd'), 2200.50, 11222, 12342);
INSERT INTO Booking (bookingNo ,location, bookingInformation, bookingStatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11113 , 'castle court, Dublin 3','Christmas party','S', TO_DATE('2018-11-01', 'yyyy-mm-dd'), 1250.50, 11223, 12343);
INSERT INTO Booking (bookingNo ,location, bookingInformation, bookingStatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11114 , 'copper dublin 12','Birthday party','P', TO_DATE('2018-11-11', 'yyyy-mm-dd'), 5500.00, 11224, 12344);
INSERT INTO Booking (bookingNo ,location, bookingInformation, bookingStatus, bookingDate, bookingCost, eventID, customerNo) 
    VALUES(11115, 'blancharstown road dublin 15', 'Family reunion + party','P', TO_DATE('2018-11-16', 'yyyy-mm-dd'), 3543.59, 11225, 12345);

-- adding Payments into database
INSERT INTO Payments (paymentNo ,amountPaid, bookingNo) 
    VALUES(22221, 90.00,11111);
INSERT INTO Payments (paymentNo ,amountPaid, bookingNo) 
    VALUES(22222, 75.30,11112);
INSERT INTO Payments (paymentNo ,amountPaid, bookingNo) 
    VALUES(22223, 54.25,11113);
INSERT INTO Payments (paymentNo ,amountPaid, bookingNo) 
    VALUES(22224, 28.61,11114);
INSERT INTO Payments (paymentNo, amountPaid, bookingNo)
    VALUES(22225, 1200.00, 11115);

-- adding MenuItemOrder into database
INSERT INTO MenuItemOrder (menuOrderNO ,numberOfPerson, menuOrderCost,menuNo,bookingNo) 
    VALUES(61111,122,50.00,12221,11111);

INSERT INTO MenuItemOrder (menuOrderNO ,numberOfPerson, menuOrderCost,menuNo,bookingNo) 
    VALUES(61112,150,80.00,12222,11112);

INSERT INTO MenuItemOrder (menuOrderNO ,numberOfPerson, menuOrderCost,menuNo,bookingNo) 
    VALUES(61113,265,90.00,12223,11113);

INSERT INTO MenuItemOrder (menuOrderNO ,numberOfPerson, menuOrderCost,menuNo,bookingNo) 
    VALUES(61114,300,56.00,12224,11114);

INSERT INTO MenuItemOrder (menuOrderNO ,numberOfPerson, menuOrderCost,menuNo,bookingNo) 
    VALUES(61115,300,56.00,12224,11115);


-- adding Ingredients into database
INSERT INTO Ingredients (ingredientsID ,detailsIngredients, menuNo) 
    VALUES(51111, 'bread, mushrooms, oil, salt, tomatoes, carrots, red pepper',12221);
INSERT INTO Ingredients (ingredientsID ,detailsIngredients, menuNo) 
    VALUES(51112, 'pistachio, chicken, pomegranate juice, vinegar, ginger, black pepper ',12222);
INSERT INTO Ingredients (ingredientsID ,detailsIngredients, menuNo) 
    VALUES(51113, 'apple, sugar, flours, cinnamon, salt, nutmeg, lemon juice',12223);
INSERT INTO Ingredients (ingredientsID ,detailsIngredients, menuNo) 
    VALUES(51114, 'more to mome',12224);
INSERT INTO Ingredients (ingredientsID ,detailsIngredients, menuNo) 
    VALUES(51115, 'more to come',12225);


-- adding ResourcesType into database
INSERT INTO ResourcesType (resourceID ,resourcestype, resourcedescription,resourceCost,eventID) 
    VALUES(71111,'glasses','cristal wine glasses',4.20, 11221); 
 
 INSERT INTO ResourcesType (resourceID ,resourcestype, resourcedescription,resourceCost,eventID) 
    VALUES(71112,'delph','delph resturant',80.60, 11222); 
    
INSERT INTO ResourcesType (resourceID ,resourcestype, resourcedescription,resourceCost,eventID) 
    VALUES(71113,'table cloths','soft white coloured cloths',20.00, 11221); 
    
INSERT INTO ResourcesType (resourceID ,resourcestype, resourcedescription,resourceCost,eventID) 
    VALUES(71114,'table and chairs','luxury table and chairs',90.00, 11221);


 -- adding ResourceStock into database
INSERT INTO ResourceStock ( resourceStockID ,resourceStockQty, resourceID) 
    VALUES(81111,1250, 71111); 
    
  INSERT INTO ResourceStock ( resourceStockID ,resourceStockQty, resourceID) 
    VALUES(81112,750, 71112);
    
  INSERT INTO ResourceStock ( resourceStockID ,resourceStockQty, resourceID) 
    VALUES(81113,1000, 71113); 
    
  INSERT INTO ResourceStock ( resourceStockID ,resourceStockQty, resourceID) 
    VALUES(81114,2250, 71114); 


--adding SeasonalResources into database
 INSERT INTO SeasonalResources ( seasonalResourcesNO ,seasonalDescription, seasonalCost,resourceID) 
    VALUES(91111,'garden heaters',52.10, 81111); 

INSERT INTO SeasonalResources ( seasonalResourcesNO ,seasonalDescription, seasonalCost,resourceID) 
    VALUES(91112,'Halloween lights',60.50, 81112); 

INSERT INTO SeasonalResources ( seasonalResourcesNO ,seasonalDescription, seasonalCost,resourceID) 
    VALUES(91113,'chrismas lights',20.10, 81113); 

INSERT INTO SeasonalResources ( seasonalResourcesNO ,seasonalDescription, seasonalCost,resourceID) 
    VALUES(91114,'Fans',15.00, 81114); 



--adding SeasonalStock into database
INSERT INTO SeasonalStock ( seasonalStockID ,stockQuantity, seasonalResourcesNO) 
    VALUES(10111,2000,91111); 

INSERT INTO SeasonalStock ( seasonalStockID ,stockQuantity, seasonalResourcesNO) 
    VALUES(10112,1000,91112); 
    
INSERT INTO SeasonalStock ( seasonalStockID ,stockQuantity, seasonalResourcesNO) 
    VALUES(10113,5000,91113); 
    
INSERT INTO SeasonalStock ( seasonalStockID ,stockQuantity, seasonalResourcesNO) 
    VALUES(10114,2000,91114); 
 

commit;

grant select on dt2283m13.Customer to idobos;
grant select on dt2283m13.Menu to idobos;
grant select on dt2283m13.Brochures to idobos;
grant select on dt2283m13.Event to idobos;
grant select on dt2283m13.Booking to idobos;
grant select on dt2283m13.Payments to idobos;
grant select on dt2283m13.Ingredients to idobos;
grant select on dt2283m13.MenuItemOrder to idobos;
grant select on dt2283m13.ResourcesType to idobos;
grant select on dt2283m13.ResourceStock to idobos;
grant select on dt2283m13.SeasonalResources to idobos;
grant select on dt2283m13.SeasonalStock to idobos;

grant select on dt2283m13.Customer to idobos;
grant select on dt2283m13.Menu to idobos;
grant select on dt2283m13.Brochures to idobos;
grant select on dt2283m13.Event to idobos;
grant select on dt2283m13.Booking to idobos;
grant select on dt2283m13.Payments to idobos;
grant select on dt2283m13.Ingredients to idobos;
grant select on dt2283m13.MenuItemOrder to idobos;
grant select on dt2283m13.ResourcesType to idobos;
grant select on dt2283m13.ResourceStock to idobos;
grant select on dt2283m13.SeasonalResources to idobos;
grant select on dt2283m13.SeasonalStock to idobos;

grant select on dt2283m13.Customer to falgahtani;
grant select on dt2283m13.Menu to falgahtani;
grant select on dt2283m13.Brochures to falgahtani;
grant select on dt2283m13.Event to falgahtani;
grant select on dt2283m13.Booking to falgahtani;
grant select on dt2283m13.Payments to falgahtani;
grant select on dt2283m13.Ingredients to falgahtani;
grant select on dt2283m13.MenuItemOrder to falgahtani;
grant select on dt2283m13.ResourcesType to falgahtani;
grant select on dt2283m13.ResourceStock to falgahtani;
grant select on dt2283m13.SeasonalResources to falgahtani;
grant select on dt2283m13.SeasonalStock to falgahtani;

grant select on dt2283m3.Customer to aaljabri;
grant select on dt2283m3.Menu to aaljabri;
grant select on dt2283m3.Brochures to aaljabri;
grant select on dt2283m3.Event to aaljabri;
grant select on dt2283m3.Booking to aaljabri;
grant select on dt2283m3.Payments to aaljabri;
grant select on dt2283m3.Ingredients to aaljabri;
grant select on dt2283m3.MenuItemOrder to aaljabri;
grant select on dt2283m3.ResourcesType to aaljabri;
grant select on dt2283m3.ResourceStock to aaljabri;
grant select on dt2283m3.SeasonalResources to aaljabri;
grant select on dt2283m3.SeasonalStock to aaljabri;

-- grant priveledge access to each member of the group
grant create to idobos;

grant insert on dt2283m13.Customer to idobos; -- as manager
grant update on dt2283m13.Customer to idobos; -- as manager
grant delete on dt2283m13.Customer to idobos; -- as manager

grant insert on dt2283m13.Booking to idobos; -- as manager
grant update on dt2283m13.Booking to idobos; -- as manager
grant delete on dt2283m13.Booking to idobos; -- as manager

grant insert on dt2283m13.Brochures to falgahtani; -- as designer
grant update on dt2283m13.Brochures to falgahtani; -- as desinger
grant delete on dt2283m13.Brochures to falgahtani; -- as desinger

grant insert on dt2283m13.ResourcesType to aaljabri; -- as caretacker
grant update on dt2283m13.ResourcesType to aaljabri; -- as caretacker
grant delete on dt2283m13.ResourcesType to aaljabri; -- as caretacker
*/