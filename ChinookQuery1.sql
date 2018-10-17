use Chinook

/*non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.*/

select  
	[Full Name] = FirstName + ' ' + LastName,
	[Customer Id] = CustomerId,
	Country
from Customer 
where Country != 'USA'

--brazil_customers.sql: Provide a query only showing the Customers from Brazil.

select *
from Customer
where Country = 'brazil'
