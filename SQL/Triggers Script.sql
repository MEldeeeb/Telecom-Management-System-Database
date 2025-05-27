create trigger T1 
on Subscription 
after insert 
as 
	declare @plan_price int 

	select 
		@plan_price = monthly_fee 
	from ServicePlan s
	where s.plan_id = plan_id;

	update dbo.Customers set Balance -=  @plan_price

----------------------------------------------------------------------------------------------------------------------------------------------------
go

--Create a TRIGGER on Usage_Records to update Subscription quotas after insert. 

CREATE TRIGGER TR_updateRemainingQuota
ON Usage_Records
AFTER INSERT
AS
BEGIN
	
	UPDATE s
	SET 
		s.minutes_remained = s.minutes_remained - i.minutes_used,
		s.sms_remained = s.sms_remained - i.sms_used,
		s.data_remained = s.data_remained -i.data_used

	FROM 
		Subscription s JOIN inserted i 
		ON s.subscription_id = i.subscription_id
END

------------------------------------------------------------------------------------------------------------------
GO

CREATE OR ALTER TRIGGER TR_NotifyEmployeeOnNewTicket
ON support_ticket
AFTER INSERT
AS
BEGIN
	DECLARE @Emp_id INT
	DECLARE @Ticket_id INT

	SELECT @Emp_id = assigned_employee,
		   @Ticket_id = ticket_id

	FROM inserted
	WHERE assigned_employee IS NOT NULL

	SELECT concat(f_name,' ',m_name, ' ', L_name) + ' Is Assigned To Ticket Number ' + CAST(@Ticket_id AS varchar )
	FROM Employee
	WHERE employee_id = @Emp_id

END
------------------------------------------------------------------------------------------------------------------
GO