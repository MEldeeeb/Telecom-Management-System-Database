insert into Department (department_name, manager_id, contact_email, contact_phone) values ('Billing', 8, 'qa@tele.com', '(516) 6155131');
insert into Department (department_name, manager_id, contact_email, contact_phone) values ('Technical Support', 10, 'techsupport@tele.com', '(330) 6361171');
insert into Department (department_name, manager_id, contact_email, contact_phone) values ('Network Operations', 50, 'techsupport@tele.com', '(865) 7585000');
insert into Department (department_name, manager_id, contact_email, contact_phone) values ('IT', 39, 'billing@tele.com', '(860) 8722863');
insert into Department (department_name, manager_id, contact_email, contact_phone) values ('Quality Assurance', 95, 'networkops@tele.com', '(326) 5254808');
insert into Department (department_name, manager_id, contact_email, contact_phone) values ('Sales', 72, 'billing@tele.com', '(766) 6264615');
insert into Department (department_name, manager_id, contact_email, contact_phone) values ('Customer Service', 92, 'techsupport@tele.com', '(599) 4773891');

select * from Employee
select * from Department
delete from Employee
DBCC CHECKIDENT ('Employee', RESEED, 0);
SET IDENTITY_INSERT Employee ON;


UPDATE Employee 
SET department_id = 1
WHERE employee_id = 8;

UPDATE Employee 
SET role = 'Technical Support Manager'
WHERE employee_id = 10 AND department_id = 2;


-- Insert new managers for IDs beyond current range (45+)
-- Billing Manager (ID 8)
IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = 8)
INSERT INTO Employee (employee_id, department_id, f_name, m_name, L_name, role, hire_date, salary)
VALUES (8, 1, 'Mahmoud', 'Adel', 'Fawzy', 'Billing Manager', '2018-05-15', 15000);

-- Technical Support Manager (ID 10)
IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = 10)
INSERT INTO Employee (employee_id, department_id, f_name, m_name, L_name, role, hire_date, salary)
VALUES (10, 2, 'Amir', 'Hossam', 'Naguib', 'Technical Support Manager', '2017-11-22', 16000);

-- Network Operations Manager (ID 50)
IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = 50)
INSERT INTO Employee (employee_id, department_id, f_name, m_name, L_name, role, hire_date, salary)
VALUES (50, 3, 'Wael', 'Emad', 'Nasser', 'Network Operations Manager', '2016-05-30', 18000);

-- IT Manager (ID 39)
IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = 39)
INSERT INTO Employee (employee_id, department_id, f_name, m_name, L_name, role, hire_date, salary)
VALUES (39, 4, 'Sherif', 'Tamer', 'Adel', 'IT Manager', '2017-08-14', 17000);

-- Quality Assurance Manager (ID 95)
IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = 95)
INSERT INTO Employee (employee_id, department_id, f_name, m_name, L_name, role, hire_date, salary)
VALUES (95, 5, 'Kamal', 'Sherif', 'Ezzat', 'Quality Assurance Manager', '2017-02-09', 16500);

-- Sales Manager (ID 72)
IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = 72)
INSERT INTO Employee (employee_id, department_id, f_name, m_name, L_name, role, hire_date, salary)
VALUES (72, 6, 'Gamal', 'Nabil', 'Attia', 'Sales Manager', '2018-04-15', 17500);

-- Customer Service Manager (ID 92)
IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = 92)
INSERT INTO Employee (employee_id, department_id, f_name, m_name, L_name, role, hire_date, salary)
VALUES (92, 7, 'Khaled', 'Hamdi', 'Abdelrahman', 'Customer Service Manager', '2018-08-19', 15500);

UPDATE Employee 
SET department_id = 4
WHERE employee_id = 39;
select * from Employee

-- Department IDs reference:
-- 1=Billing, 2=Technical Support, 3=Network Operations, 4=IT, 5=Quality Assurance, 6=Sales, 7=Customer Service

-- Employees for Billing department (department_id = 1)
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Ahmed', 'Mohamed', 'Ali', 'Billing Specialist', '2020-03-15', 8500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Fatima', 'Mahmoud', 'Hassan', 'Billing Clerk', '2021-07-22', 7500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Youssef', 'Ibrahim', 'Kamel', 'Billing Analyst', '2019-11-05', 9500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Amina', 'Osama', 'Farouk', 'Billing Coordinator', '2022-01-18', 8000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Karim', 'Adel', 'Rashad', 'Billing Supervisor', '2018-09-30', 12000);

-- Employees for Technical Support department (department_id = 2)
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Mohamed', 'Ahmed', 'Saleh', 'Technical Support Engineer', '2020-05-12', 9000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Nour', 'Samir', 'Elsayed', 'Support Technician', '2021-02-28', 8000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Omar', 'Hany', 'Mahmoud', 'IT Support Specialist', '2019-08-15', 9500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Hana', 'Waleed', 'Abdullah', 'Help Desk Analyst', '2022-03-10', 8500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Tarek', 'Khaled', 'Mohsen', 'Technical Support Manager', '2017-11-22', 15000);

-- Employees for Network Operations department (department_id = 3)
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (3, 'Ali', 'Mostafa', 'Hamdy', 'Network Engineer', '2019-04-17', 11000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (3, 'Dalia', 'Ashraf', 'Zaki', 'Network Administrator', '2020-09-05', 10000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (3, 'Hassan', 'Raafat', 'Sabry', 'Network Technician', '2021-12-14', 9000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (3, 'Samira', 'Fathy', 'Gamal', 'NOC Engineer', '2018-07-23', 12000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (3, 'Wael', 'Emad', 'Naguib', 'Network Operations Manager', '2016-05-30', 18000);

-- Employees for IT department (department_id = 4)
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (4, 'Mona', 'Sameh', 'Fawzy', 'Software Developer', '2020-06-19', 12000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (4, 'Amir', 'Hesham', 'Salem', 'Systems Analyst', '2019-10-11', 11000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (4, 'Rania', 'Ayman', 'Lotfy', 'Database Administrator', '2018-03-25', 13000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (4, 'Sherif', 'Tamer', 'Adel', 'IT Project Manager', '2017-08-14', 16000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (4, 'Laila', 'Naser', 'Hakim', 'IT Director', '2015-12-05', 20000);

-- Employees for Quality Assurance department (department_id = 5)
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (5, 'Hany', 'Kamal', 'Bakry', 'QA Engineer', '2020-08-07', 9500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (5, 'Salma', 'Magdy', 'Saad', 'Test Analyst', '2021-04-16', 8500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (5, 'Adel', 'Ramy', 'Fahmy', 'QA Specialist', '2019-11-28', 10000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (5, 'Farida', 'Hossam', 'Mansour', 'QA Lead', '2018-06-13', 12000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (5, 'Kamal', 'Sherif', 'Ezzat', 'QA Manager', '2017-02-09', 15000);

-- Employees for Sales department (department_id = 6)
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (6, 'Nadia', 'Fouad', 'Metwally', 'Sales Representative', '2021-01-25', 9000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (6, 'Ibrahim', 'Samih', 'Rizk', 'Account Executive', '2020-05-18', 10000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (6, 'Soha', 'Medhat', 'Shawky', 'Sales Consultant', '2019-09-22', 9500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (6, 'Gamal', 'Nabil', 'Attia', 'Sales Manager', '2018-04-15', 14000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (6, 'Faten', 'Wagdy', 'Hegazy', 'VP of Sales', '2016-11-30', 19000);

-- Employees for Customer Service department (department_id = 7)
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (7, 'Marwa', 'Essam', 'Khalil', 'Customer Service Representative', '2021-03-08', 8000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (7, 'Ziad', 'Atef', 'Sobhy', 'Client Support Specialist', '2020-07-14', 8500);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (7, 'Heba', 'Moataz', 'Darwish', 'Customer Success Manager', '2019-12-05', 11000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (7, 'Khaled', 'Hamdi', 'Abdelrahman', 'Call Center Supervisor', '2018-08-19', 10000);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (7, 'Yasmin', 'Ashraf', 'Mohamed', 'Customer Service Director', '2017-05-22', 15000);

-- Additional employees (repeating pattern to reach 100)
-- Billing department
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Mahmoud', 'Adel', 'Fouad', 'Billing Specialist', '2021-09-12', 8700);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Aya', 'Hany', 'Zakaria', 'Billing Clerk', '2022-02-28', 7600);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Hussein', 'Karim', 'Nassar', 'Billing Analyst', '2020-06-15', 9800);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Reem', 'Tarek', 'Bassem', 'Billing Coordinator', '2021-11-08', 8200);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (1, 'Nermin', 'Wael', 'Hisham', 'Billing Supervisor', '2019-04-22', 12500);

-- Technical Support department
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Bassem', 'Hassan', 'Fahmy', 'Technical Support Engineer', '2021-08-17', 9200);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Dina', 'Omar', 'Sherif', 'Support Technician', '2022-01-05', 8200);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Essam', 'Amir', 'Lotfy', 'IT Support Specialist', '2020-10-30', 9700);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Ghada', 'Ali', 'Hamza', 'Help Desk Analyst', '2021-05-14', 8800);
INSERT INTO Employee (department_id, f_name, m_name, L_name, role, hire_date, salary) VALUES (2, 'Kareem', 'Hossam', 'Adel', 'Technical Support Manager', '2018-12-19', 15500);

-- [Continues with more inserts following the same pattern until 100 employees...]