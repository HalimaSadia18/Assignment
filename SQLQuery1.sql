USE healthcare_management;

-- Patients table
CREATE TABLE PatientsTable(
  id INT PRIMARY KEY IDENTITY(1,1),
  FirstName VARCHAR(30),
  LastName VARCHAR(30),
  DOB DATE,
  Gender VARCHAR(10),
  Contact VARCHAR(15),
  Address TEXT
);

-- Insert records into the Patients table
INSERT INTO PatientsTable (FirstName, LastName, DOB, Gender, Contact, Address) VALUES
('John', 'Doe', '1985-05-15', 'Male', '1234567890', '123 Elm St, Springfield'),
('Jane', 'Smith', '1990-07-20', 'Female', '0987654321', '456 Oak St, Springfield'),
('Alice', 'Johnson', '1975-03-12', 'Female', '5551234567', '789 Pine St, Springfield'),
('Bob', 'Brown', '1982-11-30', 'Male', '5559876543', '321 Maple St, Springfield'),
('Charlie', 'Davis', '1995-01-01', 'Male', '5554567890', '654 Cedar St, Springfield'),
('Diana', 'Wilson', '1988-09-09', 'Female', '5553216549', '987 Birch St, Springfield'),
('Ethan', 'Miller', '1992-04-22', 'Male', '5556543210', '159 Spruce St, Springfield'),
('Fiona', 'Moore', '1980-12-25', 'Female', '5557891234', '753 Willow St, Springfield'),
('George', 'Taylor', '1983-06-15', 'Male', '5554567891', '852 Fir St, Springfield'),
('Hannah', 'Anderson', '1998-08-30', 'Female', '5553219876', '963 Walnut St, Springfield');

--Doctors table
CREATE TABLE DoctorsTable(
  id INT PRIMARY KEY IDENTITY(1,1),
  DoctorName VARCHAR(50),
  Speciality VARCHAR(50),
  Contact VARCHAR(15)
);
-- Insert records into the Doctors table
INSERT INTO DoctorsTable (DoctorName, Speciality, Contact) VALUES
('Dr. John Smith', 'Cardiology', '1234567890'),
('Dr. Jane Doe', 'Neurology', '0987654321'),
('Dr. Alice Johnson', 'Pediatrics', '5551234567'),
('Dr. Bob Brown', 'Orthopedics', '5559876543'),
('Dr. Charlie Davis', 'Dermatology', '5554567890'),
('Dr. Diana Wilson', 'General Practice', '5553216549'),
('Dr. Ethan Miller', 'Psychiatry', '5556543210'),
('Dr. Fiona Moore', 'Oncology', '5557891234'),
('Dr. George Taylor', 'Endocrinology', '5554567891'),
('Dr. Hannah Anderson', 'Gastroenterology', '5553219876');

-- Appointments table
CREATE TABLE AppointmentsTable(
  id INT PRIMARY KEY IDENTITY(1,1),
  PatientID INT ,
  DoctorID INT,
  ArrivalTime TIME,
  AppointmentDate DATE,
  AppointmentTime TIME,
  Status VARCHAR(15),
  FOREIGN KEY (PatientID) REFERENCES PatientsTable(id),
  FOREIGN KEY (DoctorID) REFERENCES DoctorsTable(id)
);
-- Insert records into the Appointments table
INSERT INTO AppointmentsTable (PatientID, DoctorID, ArrivalTime, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '09:00', '2024-01-10', '09:30', 'Completed'),
(2, 2, '10:00', '2024-01-10', '10:30', 'Cancelled'),
(3, 3, '11:00', '2024-01-10', '11:30', 'Completed'),
(4, 4, '12:00', '2024-11-27', '12:30', 'Scheduled'),  
(5, 5, '13:00', '2024-11-28', '13:30', 'Missed'),
(6, 6, '14:00', '2024-11-29', '14:30', 'Scheduled'),  
(7, 7, '15:00', '2024-11-30', '15:30', 'Cancelled'),
(8, 8, '09:00', '2024-12-01', '09:30', 'Completed'),  
(9, 9, '10:00', '2024-12-02', '10:30', 'Scheduled'), 
(10, 10, '11:00', '2024-12-03', '11:30', 'Missed'), 
(1, 2, '12:00', '2024-12-04', '12:30', 'Scheduled'),  
(2, 3, '13:00', '2024-12-05', '13:30', 'Cancelled'),
(3, 4, '14:00', '2024-12-06', '14:30', 'Completed'),  
(4, 5, '15:00', '2024-12-07', '15:30', 'Scheduled'),  
(5, 6, '09:00', '2024-12-08', '09:30', 'Completed');

-- treatments table
CREATE TABLE TreatmentsTable(
  id INT PRIMARY KEY IDENTITY(1,1),
  TreatmentName VARCHAR(50),
  Description TEXT,
  Cost DECIMAL(10,2)
);

INSERT INTO TreatmentsTable (TreatmentName, Description, Cost) VALUES
('Physical Therapy', 'Rehabilitation treatment to improve physical function.', 150.00),
('Dental Cleaning', 'Professional cleaning of teeth to remove plaque and tartar.', 75.00),
('X-Ray', 'Diagnostic imaging to view internal structures of the body.', 100.00),
('Blood Test', 'Laboratory test to analyze blood samples.', 50.00),
('MRI Scan', 'Magnetic resonance imaging for detailed body scans.', 800.00),
('Vaccination', 'Immunization to prevent diseases.', 25.00),
('Chemotherapy', 'Cancer treatment using chemical substances.', 2000.00),
('Surgery', 'Invasive procedure to treat medical conditions.', 5000.00),
('Acupuncture', 'Traditional Chinese medicine treatment using needles.', 120.00),
('Chiropractic Adjustment', 'Manual manipulation of the spine.', 90.00),
('Counseling', 'Therapeutic conversation to address mental health issues.', 100.00),
('Dermatology Treatment', 'Skin care treatments for various skin conditions.', 200.00),
('Nutrition Consultation', 'Assessment and advice on dietary habits.', 80.00),
('Podiatry Treatment', 'Foot care and treatment for foot-related issues.', 110.00),
('Vision Exam', 'Comprehensive eye examination.', 60.00);

-- patient history 

CREATE TABLE AppointmentTreatment(
  id INT PRIMARY KEY IDENTITY(1,1),
  AppointmentID INT,
  TreatmentID INT,
  FOREIGN KEY (AppointmentID) REFERENCES AppointmentsTable(id),
  FOREIGN KEY (TreatmentID) REFERENCES TreatmentsTable(id),
);
INSERT INTO AppointmentTreatment (AppointmentID, TreatmentID) VALUES
(1, 3),
(2, 5),
(3, 1),
(4, 4),
(5, 2),
(6, 6),
(7, 8),
(8, 7),
(9, 10),
(10, 9),
(11, 12),
(12, 11),
(13, 14),
(14, 13),
(15, 15),
(7, 12),
(8, 11),
(9, 14),
(10, 13),
(11, 15);

--Conditions table
CREATE TABLE Conditions(
  id INT PRIMARY KEY IDENTITY(1,1),
  ConditionName VARCHAR(60),
);
INSERT INTO Conditions (ConditionName) VALUES ('Diabetes'),('Hypertension'),('Asthma'),('Arthritis'),('Heart Disease'),
('Chronic Obstructive Pulmonary Disease'),('Depression'),('Anxiety'),('Obesity'),('Allergies');

-- condition treatment table
CREATE TABLE CondTreat(
  id INT PRIMARY KEY IDENTITY(1,1),
  ConditionID INT,
  TreatmentID INT,
  FOREIGN KEY (ConditionID) REFERENCES Conditions(id),
  FOREIGN KEY (TreatmentID) REFERENCES TreatmentsTable(id),
);

INSERT INTO CondTreat(ConditionID , TreatmentID)VALUES(1,4) , (1,13) , (2,11) , (2,5) , (3,9) , (3,5) , (4,1) , (4,8) , (5,5) , (5,3) , 
(6,6) ,  (6,8) , (7,11) , (7 ,13) , (8,11) , (8,1) , (9,11) , (9,13) , (10,4) , (10,12);

-- SQL Queries: 
-- Retrieve appointment details for a specific patient. 
SELECT p.id AS PatientID , p.FirstName , p.LastName , p.Gender , d.DoctorName , a.AppointmentDate , a.AppointmentTime , a.Status 
FROM AppointmentsTable a INNER JOIN PatientsTable p ON a.PatientID = p.id INNER JOIN DoctorsTable d ON a.DoctorID = d.id WHERE p.id = 5;

-- List all patients treated by a specific doctor.
SELECT d.id AS DoctorID , d.DoctorName , CONCAT(p.FirstName , '' , p.LastName) AS PatientName , a.Status 
FROM AppointmentsTable a INNER JOIN PatientsTable p ON a.PatientID = p.id INNER JOIN DoctorsTable d ON a.DoctorID = d.id WHERE d.id = 5;

-- Get the treatment history for a specific patient. 
SELECT p.id AS PatientID , CONCAT(p.FirstName , ' ' , p.LastName) AS PatientName , d.DoctorName , t.TreatmentName ,
t.Description , a.AppointmentDate , a.AppointmentTime , a.Status , t.Cost FROM AppointmentTreatment ap 
INNER JOIN AppointmentsTable a ON ap.AppointmentID = a.id 
INNER JOIN TreatmentsTable t ON ap.TreatmentID = t.id 
INNER JOIN PatientsTable p ON a.PatientID = p.id 
INNER JOIN DoctorsTable d ON a.DoctorID = d.id WHERE p.id = 9;

-- Calculate the average wait time for appointments. 
SELECT 
    AVG(DATEDIFF(MINUTE, a.ArrivalTime, a.AppointmentTime)) AS AverageWaitTimeInMinutes
FROM 
    AppointmentsTable a
JOIN 
    PatientsTable p ON a.PatientID = p.id
JOIN 
    DoctorsTable d ON a.DoctorID = d.id;

-- Identify patients with upcoming appointments. 
SELECT p.id AS PatientID , p.FirstName , p.LastName , p.Contact , d.DoctorName , a.AppointmentDate , a.AppointmentTime 
FROM AppointmentsTable a INNER JOIN PatientsTable p ON a.PatientID = p.id INNER JOIN DoctorsTable d ON a.DoctorID = d.id
WHERE 
    (a.AppointmentDate > CAST(GETDATE() AS DATE)) OR 
    (a.AppointmentDate = CAST(GETDATE() AS DATE) AND a.AppointmentTime > CAST(GETDATE() AS TIME));

-- Retrieve doctors based on specialty. 
SELECT * FROM DoctorsTable WHERE Speciality = 'Neurology';

-- Count the number of appointments per doctor. 
SELECT 
    d.id AS DoctorID, 
    d.DoctorName, 
    COUNT(a.id) AS NumberOfAppointments
FROM 
    AppointmentsTable a 
INNER JOIN 
    DoctorsTable d ON a.DoctorID = d.id 
GROUP BY 
    d.id, d.DoctorName
ORDER BY NumberOfAppointments DESC;

-- Get the total number of patients registered. 
SELECT COUNT(id) AS TotalPatients FROM PatientsTable;

-- Retrieve patients who have missed appointments. 
SELECT p.id AS PatientID , p.FirstName , p.LastName , d.DoctorName , a.AppointmentDate , a.AppointmentTime , a.Status 
FROM AppointmentsTable a INNER JOIN PatientsTable p ON a.PatientID = p.id INNER JOIN DoctorsTable d ON a.DoctorID = d.id WHERE a.Status = 'Missed';

-- List treatments available for a specific condition. 
SELECT c.id AS ConditionID , c.ConditionName , t.TreatmentName , t.Description , t.Cost FROM CondTreat cd 
INNER JOIN Conditions c ON cd.ConditionID = c.id INNER JOIN TreatmentsTable t ON cd.TreatmentID = t.id WHERE c.ConditionName = 'Asthma';

-- Advanced Features: 

-- Create views for patient summaries and treatment history. 
CREATE VIEW PatientSummary AS
SELECT 
    p.id AS PatientID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    p.DOB,
    d.DoctorName,
    t.TreatmentName,
    a.AppointmentDate,
    a.AppointmentTime,
    a.Status,
    t.Cost
FROM 
    AppointmentTreatment ap 
INNER JOIN 
    AppointmentsTable a ON ap.AppointmentID = a.id 
INNER JOIN 
    TreatmentsTable t ON ap.TreatmentID = t.id 
INNER JOIN 
    PatientsTable p ON a.PatientID = p.id 
INNER JOIN 
    DoctorsTable d ON a.DoctorID = d.id WHERE p.id = 3;
SELECT * FROM PatientSummary;

CREATE VIEW TreatmentHistory AS
SELECT 
    p.id AS PatientID,
    CONCAT(p.FirstName, ' ', p.LastName) AS PatientName,
    d.DoctorName,
    t.TreatmentName,
    t.Description,
    a.AppointmentDate,
    a.AppointmentTime,
    a.Status,
    t.Cost
FROM 
    AppointmentTreatment ap 
INNER JOIN 
    AppointmentsTable a ON ap.AppointmentID = a.id 
INNER JOIN 
    TreatmentsTable t ON ap.TreatmentID = t.id 
INNER JOIN 
    PatientsTable p ON a.PatientID = p.id 
INNER JOIN 
    DoctorsTable d ON a.DoctorID = d.id WHERE p.id = 3;
SELECT * FROM TreatmentHistory;

-- Develop stored procedures for appointment scheduling. 
DROP PROCEDURE Appointment_Scheduled;
CREATE PROCEDURE Appointment_Scheduled
AS 
BEGIN
SELECT p.id AS PatientID , p.FirstName , p.LastName , p.Contact , d.DoctorName , a.AppointmentDate , a.AppointmentTime , a.Status 
FROM AppointmentsTable a INNER JOIN PatientsTable p ON a.PatientID = p.id INNER JOIN DoctorsTable d ON a.DoctorID = d.id
WHERE 
    a.Status = 'Scheduled'
END;
EXEC Appointment_Scheduled;

-- Implement functions to calculate patient treatment costs. 

CREATE FUNCTION GetPatientTreatmentCost (@patient_id INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @total_cost DECIMAL(10, 2);

    SELECT @total_cost = SUM(t.Cost)
    FROM AppointmentTreatment ap
    INNER JOIN AppointmentsTable a ON ap.AppointmentID = a.id
    INNER JOIN TreatmentsTable t ON ap.TreatmentID = t.id
    INNER JOIN PatientsTable p ON a.PatientID = p.id
    WHERE p.id = @patient_id;

    RETURN ISNULL(@total_cost, 0.00);
END;
SELECT dbo.GetPatientTreatmentCost(9)

-- Create triggers for appointment reminders. 

CREATE TRIGGER TR_Appointment_Reminder
ON Appointments
AFTER INSERT
AS
BEGIN
    DECLARE @AppointmentDate DATETIME;

    SELECT @AppointmentDate = AppointmentDate
    FROM inserted;

    PRINT 'Your Appointment is on ' + CONVERT(VARCHAR, @AppointmentDate, 120);
END;

-- Design inline table-valued functions for patient referral tracking.

CREATE FUNCTION dbo.GetPatientReferrals(@PatientID INT)
RETURNS TABLE
AS
RETURN
(
   SELECT p.id AS PatientID , CONCAT(p.FirstName , ' ' , p.LastName) AS PatientName , d.DoctorName , t.TreatmentName ,
t.Description , a.AppointmentDate , a.AppointmentTime , a.Status , t.Cost FROM AppointmentTreatment ap 
INNER JOIN AppointmentsTable a ON ap.AppointmentID = a.id 
INNER JOIN TreatmentsTable t ON ap.TreatmentID = t.id 
INNER JOIN PatientsTable p ON a.PatientID = p.id 
INNER JOIN DoctorsTable d ON a.DoctorID = d.id WHERE p.id = @PatientID
);
SELECT * 
FROM dbo.GetPatientReferrals(5);  