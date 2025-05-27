CREATE TABLE Customers(
	customer_id INT PRIMARY KEY IDENTITY (1,1),
	f_name VARCHAR(50),
	m_name VARCHAR(50),
	L_name VARCHAR(50),
	gender VARCHAR(2) CHECK (gender IN ('M','F')),
	national_id VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(50) UNIQUE,
	city VARCHAR(50),
	street VARCHAR(50),
	door_num INT, 
	registration_date DATE , 
	birth_date DATE , 
	Balance  FLOAT, 
	Card_num VARCHAR(20),
);
GO
CREATE TABLE SIM_Card(
	sim_iccid VARCHAR(22) PRIMARY KEY , 
	phone_number VARCHAR(20) UNIQUE,
	imsi CHAR(15) CHECK (LEN(imsi) = 15),
	status VARCHAR(20) ,
	customer_id INT ,
	CONSTRAINT C1 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
	);
GO
CREATE TABLE Department (
    department_id INT PRIMARY KEY IDENTITY(1,1),
    department_name VARCHAR(50) NOT NULL UNIQUE,
	manager_id INT,
	contact_email VARCHAR(100),
    contact_phone VARCHAR(20),  
);
GO 
CREATE TABLE Employee(
	employee_id INT PRIMARY KEY IDENTITY (1,1),
	department_id INT,
	f_name VARCHAR(50),
	m_name VARCHAR(50),
	L_name VARCHAR(50),
	role VARCHAR(50),
	hire_date DATE,
	salary FLOAT,
	CONSTRAINT C7 FOREIGN KEY (department_id) REFERENCES Department(department_id)
	);

GO 
CREATE TABLE Support_Ticket(
	ticket_id INT PRIMARY KEY IDENTITY (1,10),
	customer_id INT NOT NULL,
	created_at DATE ,
	resolved_at DATE,
	issue_type VARCHAR(30),
	priority VARCHAR(20) CHECK(priority IN ('H','M','L')),
	status VARCHAR(20),
	assigned_employee INT,
	CONSTRAINT C2 FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
	CONSTRAINT C3 FOREIGN KEY(assigned_employee) REFERENCES Employee(employee_id)
);
GO

CREATE TABLE ServicePlan(
	plan_id INT PRIMARY KEY IDENTITY (1,1),
	plan_name VARCHAR(50),
	monthly_fee float,
	data_limit 	INT,
	sms_limit INT,
	minutes_limit INT

);

CREATE TABLE Subscription(
	subscription_id INT PRIMARY KEY IDENTITY (1,1),
	customer_id INT NOT NULL,
	start_date DATE,
	end_date DATE,
	Sub_status VARCHAR(30) CHECK (Sub_status IN ('active', 'suspended', 'terminated')),
	plan_id INT NOT NULL,
	sms_remained INT,
	minutes_remained INT,
	data_remained INT, 
	CONSTRAINT C4 FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
	CONSTRAINT C5 FOREIGN KEY(Plan_id) REFERENCES ServicePlan(plan_id)
);

CREATE TABLE Usage_Records(
	usage_id INT PRIMARY KEY IDENTITY (1,1),
	subscription_id INT,
	record_date DATETIME,
	data_used INT,
	sms_used INT,
	minutes_used INT
	CONSTRAINT C6 FOREIGN KEY(subscription_id) REFERENCES Subscription(subscription_id)
);
