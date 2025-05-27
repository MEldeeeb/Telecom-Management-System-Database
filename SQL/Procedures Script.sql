-- Creating a proc to add record to Usage_Records table when a customer make a call, send sms or use data
CREATE OR ALTER PROC SP_AddUsageRecord 
	@subscription_id INT,
	@data_used INT,
	@sms_used INT,
	@minutes_used INT
AS 
BEGIN
	DECLARE @minutes_remaind INT;
	DECLARE @sms_remaind INT;
	DECLARE @data_remaind INT

	SELECT 
		@minutes_remaind = minutes_remained,
		@sms_remaind = sms_remained,
		@data_remaind = data_remained
	FROM Subscription
	WHERE subscription_id = @subscription_id
	IF (@minutes_remaind >= @minutes_used AND @data_remaind >= @data_used AND @sms_remaind >= @sms_used)
	BEGIN
		INSERT INTO Usage_Records VALUES(@subscription_id,GETDATE(),@data_used,@sms_remaind,@minutes_remaind)
	END
	ELSE 
	BEGIN
		SELECT 'Insufficient remaining quota in subscription.'
	END

	END
GO

------------------------------------------------------------------------------------------------------------------
-- Get remaining quota for each active plan subscribed by a specific customer_id at any time.

CREATE PROC SP_getRemainingQuota
	@customer_id INT
AS 
BEGIN 
	SELECT 
		p.plan_name,
		s.minutes_remained,
		s.sms_remained,
		s.data_remained,
		s.start_date,
		s.end_date
		
	FROM Subscription s
	JOIN ServicePlan p
	ON s.plan_id = p.plan_id
	
	WHERE s.customer_id = @customer_id
	AND s.Sub_status = 'active'
END

GO
------------------------------------------------------------------------------------------------------------------

create proc subscripe(@customer_id int, @plan_id int)
as 
	Begin
		
		if exists(select customer_id from dbo.Customers where customer_id = @customer_id) and exists(select plan_id from dbo.ServicePlan where plan_id = @plan_id)
		Begin

			declare @plan_price float 
			select 
				@plan_price = monthly_fee 
			from ServicePlan s
			where s.plan_id = @plan_id;

			declare @customer_balance float
			select @customer_balance = Balance
			from dbo.Customers
			where customer_id = @customer_id ;
		
			declare @sms_remained int, @minutes_remained int , @data_remained int ,@start_date date ,@end_date date
			select 
				@sms_remained = s.sms_limit,
				@minutes_remained = s.minutes_limit ,
				@data_remained = s.data_limit,
				@start_date = GETDATE() ,
				@end_date = DATEADD(day, 30, GETDATE()) 
			from dbo.ServicePlan s
			where 
				[plan_id] = @plan_id;


			if @customer_balance >= @plan_price
				insert into dbo.Subscription values(@customer_id,@start_date,@end_date,'Active',@plan_id,@sms_remained , @minutes_remained  , @data_remained)
			else
				select 'insufficient balance'
		end
		else 
		Begin
			select 'User with id ' + @customer_id + ' or plan with id ' + @plan_id +' is not found' 
			select 'please Try Again' 
		end
	end
----------------------------------------------------------------------------------------------------------------------------------------------------
go
create proc close_support_ticket(@ticket_id int)
as
	begin 
		update dbo.Support_Ticket set status = 'Closed' where ticket_id = @ticket_id
	end 
----------------------------------------------------------------------------------------------------------------------------------------------------
go
create proc get_customer_usage(@customer_id int)
as 
	Begin 
		select 
			s.customer_id,
			sum(u.data_used) as total_used_data ,
			sum(u.sms_used) as total_used_sms ,
			sum(u.minutes_used) as total_used_minutes 
		from  dbo.Subscription s
		join dbo.Usage_Records u on s.subscription_id = u.subscription_id
		where customer_id = @customer_id
		group by s.customer_id
	end 
----------------------------------------------------------------------------------------------------------------------------------------------------
go