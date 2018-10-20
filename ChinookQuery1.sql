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

--unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.

select distinct billingCountry
from invoice

--sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

select 
	e.employeeid,
	[Full Name] = e.[FirstName] + ' ' + e.[LastName],
	i.*
from customer c
join employee e
	on e.EmployeeId = c.SupportRepId
join invoice i 
	on i.customerId = c.customerId

-- invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

select 
	[Invoice Total] = i.Total,
	[Full Customer Name] = c.[FirstName] + ' ' + c.[LastName],
	Country = i.BillingCountry,
	[Sales Rep] = e.[FirstName] + ' ' + e.[LastName]
from customer c
join employee e
	on e.EmployeeId = c.SupportRepId
join invoice i 
	on i.customerId = c.customerId

--total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

select 
[number of Invoices in 2009 and 2011] = count(*)
from Invoice
	where InvoiceDate like '%2009%' or InvoiceDate like '%2011%'
	
--total_sales_{year}.sql: What are the respective total sales for each of those years?

select
	[total sales] = sum(Total),
	[year] = year(invoiceDate)
from Invoice
	where InvoiceDate like '%2009%' or InvoiceDate like '%2011%'
	group by year(invoiceDate)
	
		