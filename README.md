# Cathering for Kings

### Case Study

Carol and Annette King run a catering service company called ‘Catering for Kings’. They prepare meals and deliver them to an event location. The company offers a limited menu; a selection of starters, main courses, desserts and drinks. They also hire out resources, such as delph, cutlery, glasses, table cloths and even tables and chairs. . They have a brochure that they use to advertise their business and this includes a price list. The information on it includes:
For each menu item, the menu item number, the course to which it belongs (starter, main course, dessert, drink, extra), its name, a description of it (e.g. “lightly poached quail eggs on a bed of rocket drizzled with our special dressing”) and its price per person.
For each resource type, its resource type code, the resource type description (e.g. Sterling silver steak knife, or 2m x 1.5m white linen table cloth), and the cost of hire per unit.
As well as the information on the brochure, the company has recorded, for each menu item, the exact list of ingredients, the recipe and the length of time it takes to prepare. For resource types, they also record the number of each the company owns.
Often a client will use the catering service a lot, and may have booked several for several events with Carol. Carol keeps names, addresses and phone numbers for clients, but also requires specific information about each booking. She needs to know the date and location of the event. She needs to know, for each menu item ordered, the quantity of that menu item that is required. She also needs to know the quantity of each resource type required for the event.
Once the client has requested the booking, Carol calculates the total cost of the booking and quotes a price. Clients may make an advance payment for a booking. All payments are recorded against the booking.
Annette is the chef and menu designer. She designs and produces the brochures and the menus. She adds new menu items or changes current ones very season. When a booking comes in, Annette reads it, to find out what ingredients she must buy, and looks after the production of the food. When the food is produced, she changes the status of the booking to ‘R’ for ready.
Carol is the business manager and sales person. She takes bookings from customers. Before the booking has been confirmed, she records it and gives it a status of ‘P’ for provisional. When it is confirmed, she changes it to ‘C’ for confirmed. Carol also processes payments. When full payment has been received and the booking is finished, she changes the status to ‘F’.
Charlie helps out the business by looking after resources. He stocks new resources and checks them when they come back from a booking, to make sure that everything is there and undamaged. He replaces anything that needs replacing and adds seasonal resources such as garden heaters or Halloween lights. He does not handle bookings at all.

### ERD Introduction and details

For this assignment we had to create a database for Catering for Kings. Reading the case study in details the group decided to start the ERD(Entity-Relational Diagram) by creating the Customer table and adding all the attributes necessary to store client information into the database, then moving forward we created a Booking table which serve as a confirmation when the customer wants to create an event, then it has to pay a deposit amount in order to proceed with the event. Furthermore we procced by normalising the data to avoid redundancy using 1st NF, 2nd NF and 3rd NF then reading the case study again, we have created new entities and adding the relationship between one or more entities based on the case study. When deciding to add the suitable attributes for our entities we focused on our database trying to avoid repeating unnecessary columns, which could it lead to redundant data when having to insert new records into our schema. 

### ERD Diagram for Cathering for Kings

<img width="1090" alt="erd_diagram" src="https://user-images.githubusercontent.com/22156333/48663237-19d8f900-ea85-11e8-9ad4-9cdd59c48486.png">
