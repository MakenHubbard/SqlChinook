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

--brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

select 
	[Full Name] = FirstName + ' ' + LastName,
	invoiceId,
	invoiceDate = convert(date, invoiceDate),
	billingCountry
from Customer c
join Invoice i
on i.CustomerID = c.CustomerId
where country = 'brazil'

--sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

select *
from Employee
where title = 'Sales support agent'

