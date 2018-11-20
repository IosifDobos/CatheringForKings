/*	Each student should write individual queries that show the following:
	Selection, Projection, Aggregation with filters on aggregates, Union, Minus, Difference, Inner Join, Outer Join, Semi-join, Anti-join and Correlated sub-query.
	Each query should be tested to ensure that there is data there to satisfy it and to show that it works – i.e. a query that shows the power of the technique being used (e.g. a left join that would return the same as an inner join will not get full marks). You may create views as required but show your code if you do.
*/

-- part 3 select statement
-- display all customers which booking event status is steady or provisional
SELECT bookingNo, location, bookingInformation, bookingStatus, bookingCost, customerNo, firstName, lastName
from Booking
join Customer using(customerNo)
WHERE bookingStatus = 'S'
group by bookingNo, location, bookingInformation, bookingStatus, bookingCost,customerNo, firstName, lastName; 

-- create view to display customers booking information, the event they booked, location, date and the brochure menu they had
create or replace view Cust as
select firstName, lastName, bookingInformation, bookingStatus, bookingCost, eventName,eventLocation, eventDate, menuName
from Customer
join Booking on Customer.customerNo = Booking.customerNo
join Event on Event.eventID = Booking.eventID
join Brochures on Brochures.brochuresNo = Event.brochuresNo;

select * from Cust;

-- using union and intersect to find which booking is steady and where the event is held and the price for the event
select * from Cust where bookingStatus = 'S'
union
select * from Cust where eventName = 'Birthday party'
intersect
select * from Cust where bookingCost = 5500;

-- select the resources type and resource stock 
select * from ResourcesType 
where exists
    (select * from ResourceStock where ResourcesType.resourceID = ResourceStock.resourceID);
    
-- using minus and semi-join
select menuName, menuDescription from Brochures
where brochuresNo in 
    (select menuNo from Brochures 
    minus 
    select brochuresNo from Event);
 
-- get all event detailes which are using glasses resources using inner join   
select eventName, resourceType, resourceDescription, resourceCost from ResourcesType
inner join Event on Event.eventID = Event.EVENTID
where resourceType = 'glasses';

--get the menu details which are not in the menuItemOrder using left outer join
select menuType, menuDescription, menuCost 
from Menu
left outer join MenuItemOrder on Menu.menuNo = MenuItemOrder.menuNo;

--using semi join to find a menu order placed
select menuNo, menuType, menuDescription from Menu
where menuNo in 
    (select menuNo from MenuItemOrder);


select menuNo, menuType, menuDescription, menuCost, menuReciept, menuDuration from Menu
where menuNo not in 
    (select menuNo from MenuItemOrder);
  
  
    
-- using semi joing to find customers who havent't place a order
select firstName, lastName from Customer
where customerNo not in 
    (select customerNo from Booking);
    
-- using  a corelated subquerry to find which event is not added to booking
select eventID,eventName, eventLocation, eventDate from Event
where eventID not in
    (select eventID from Booking);

-- select Booking Payment Using outer join
select bookingNo, bookingInformation, amountPaid 
from Payments 
outer join Booking on Payments.bookingNo = Booking.bookingNo;