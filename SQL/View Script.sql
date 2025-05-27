create view get_active_Subscriptions
as	
	select *
	from dbo.Subscription s
	where s.Sub_status = 'Active' ;

----------------------------------------------------------------------------------------------------------------------------------------------------
go
create view get_num_of_active_Subscriptions_per_plan
as 
	select s.plan_id, count(s.subscription_id) num_of_active_Subscriptions_per_plan
	from dbo.Subscription s
	where s.Sub_status = 'Active'
	group by s.plan_id ;

------------------------------------------------------------------------------------------------------------------
GO


CREATE VIEW V_active_customers
AS 
SELECT c.*
FROM Customers c
JOIN Subscription s
ON s.customer_id = c.customer_id
where s.Sub_status = 'active'

------------------------------------------------------------------------------------------------------------------
GO

CREATE OR ALTER VIEW v_get_num_of_tickets_per_employee
AS 
SELECT e.f_name, COUNT(ticket_id) [Number of Tickets]
FROM Support_Ticket s
JOIN Employee e
ON e.employee_id = s.assigned_employee
group by e.f_name

------------------------------------------------------------------------------------------------------------------
GO 

CREATE VIEW v_active_support_tickets 
AS 
SELECT *
FROM Support_Ticket
WHERE status = 'open'


insert into Support_Ticket values(10,GETDATE(),NULL,'Network','H','open',10)

select * from Support_Ticket