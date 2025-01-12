-- Health Care Patient Management system

-- Use a star schema for the database

-- Create the database
CREATE DATABASE Vital_Care_Solutions;

USE vital_care_solutions;


-- CREATING Dimension table first


--Creation of Patients_Dim table, DIM = Dimension
CREATE TABLE Patients_Dim (
	PatientID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR(10),
	Age INT NOT NULL,
	PhoneNumber VARCHAR(15),
	Email VARCHAR(50)

);



--Creation of Doctors_Dim table, DIM = Dimension
CREATE TABLE Doctors_Dim (
	DoctorID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Speciality VARCHAR(100),
	PhoneNumber VARCHAR(15),
	Email VARCHAR(50)

);

 --Creation of Treatments_Dim table, DIM = Dimension
 CREATE TABLE Treatments_Dim(
	TreatmentID INT PRIMARY KEY,
	Description TEXT
 );


 --Creation of Medications_Dim table, DIM = Dimension
 CREATE TABLE Medications_Dim (
	MedicationID INT PRIMARY KEY,
	Name VARCHAR(100),
	Dosage VARCHAR(100),
	SideEffects TEXT
 );


 -- CREATED a junction/bridge table for Prescription
 CREATE TABLE Prescription_Bridge (
	PrescriptionID INT PRIMARY KEY,
	TreatmentID INT FOREIGN KEY REFERENCES Treatments_DIM(TreatmentID),
	MedicationID INT FOREIGN KEY REFERENCES Medications_DIM(MedicationID),
	Dosage VARCHAR(100),
	Frequency VARCHAR(100),
	
 
 );



 -- Creation of the Fact Table 'Appointment_Fact'
 CREATE TABLE Appointments_Fact(
	AppointmentID INT PRIMARY KEY,
	PatientID INT FOREIGN KEY REFERENCES Patients_Dim(PatientID),
	DoctorID INT FOREIGN KEY REFERENCES Doctors_Dim(DoctorID),
	TreatmentID INT FOREIGN KEY REFERENCES Treatments_Dim(TreatmentID),
	AppointmentDate DATE,
	Status VARCHAR(50),
	Cost DECIMAL(10,2)

 );


 --- Data Insertion Part- All data is dummy data not real to follow HIPPA

 INSERT INTO Patients_Dim (PatientID, FirstName, LastName, Gender, Age, PhoneNumber, Email)
VALUES
(1, 'John', 'Doe', 'Male', 30, '1234567890', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'Female', 25, '0987654321', 'jane.smith@example.com'),
(3, 'Alice', 'Brown', 'Female', 45, '5678901234', 'alice.brown@example.com'),
(4, 'Bob', 'Johnson', 'Male', 50, '7890123456', 'bob.johnson@example.com'),
(5, 'Chris', 'Evans', 'Male', 32, '1236547890', 'chris.evans@example.com'), 
(6, 'Emma', 'Watson', 'Female', 29, '0987564321', 'emma.watson@example.com'), 
(7, 'Daniel', 'Craig', 'Male', 50, '5678943210', 'daniel.craig@example.com'), 
(8, 'Olivia', 'Brown', 'Female', 40, '2345678901', 'olivia.brown@example.com'), 
(9, 'Liam', 'Johnson', 'Male', 27, '3456789012', 'liam.johnson@example.com'),
(10, 'Sophia', 'Taylor', 'Female', 35, '4567890123', 'sophia.taylor@example.com'),
(11, 'William', 'Davis', 'Male', 60, '6789012345', 'william.davis@example.com'),
(12, 'Ava', 'Miller', 'Female', 22, '7890123456', 'ava.miller@example.com'), 
(13, 'Ethan', 'Wilson', 'Male', 18, '8901234567', 'ethan.wilson@example.com'), 
(14, 'Mia', 'Moore', 'Female', 45, '9012345678', 'mia.moore@example.com'), 
(15, 'James', 'Clark', 'Male', 55, '0123456789', 'james.clark@example.com'),
(16, 'Isabella', 'King', 'Female', 33, '1230987654', 'isabella.king@example.com'), 
(17, 'Benjamin', 'Hill', 'Male', 48, '2345671234', 'benjamin.hill@example.com'), 
(18, 'Charlotte', 'Scott', 'Female', 52, '3456712345', 'charlotte.scott@example.com'), 
(19, 'Lucas', 'Adams', 'Male', 25, '4567123456', 'lucas.adams@example.com'), 
(20, 'Amelia', 'Harris', 'Female', 30, '5671234567', 'amelia.harris@example.com')
;

-- Check if data insert correctly
SELECT *
FROM Patients_Dim
;
-- data inserted correctly

-- Insertion of the Dummy Data for Doctors_Dim
INSERT INTO Doctors_Dim (DoctorID, FirstName, LastName, Speciality, PhoneNumber, Email)
VALUES
(1, 'Emily', 'White', 'Cardiology', '1231231234', 'emily.white@hospital.com'),
(2, 'Michael', 'Green', 'Orthopedics', '3213214321', 'michael.green@hospital.com'),
(3, 'Sarah', 'Blue', 'Pediatrics', '9876543210', 'sarah.blue@hospital.com'),
(4, 'David', 'Black', 'Dermatology', '6543219876', 'david.black@hospital.com'),
(5, 'Andrew', 'Taylor', 'Neurology', '2233445566', 'andrew.taylor@hospital.com'), 
(6, 'Laura', 'Davis', 'General Medicine', '3344556677', 'laura.davis@hospital.com'), 
(7, 'Peter', 'Martinez', 'Ophthalmology', '4455667788', 'peter.martinez@hospital.com'), 
(8, 'Rachel', 'Clark', 'Gastroenterology', '5566778899', 'rachel.clark@hospital.com'), 
(9, 'Henry', 'Lee', 'Oncology', '6677889900', 'henry.lee@hospital.com'), 
(10, 'Sophia', 'Hall', 'Psychiatry', '7788990011', 'sophia.hall@hospital.com'), 
(11, 'Oliver', 'Allen', 'Pulmonology', '8899001122', 'oliver.allen@hospital.com'), 
(12, 'Ella', 'Young', 'Urology', '9900112233', 'ella.young@hospital.com'), 
(13, 'Noah', 'Hernandez', 'Endocrinology', '1112223344', 'noah.hernandez@hospital.com'), 
(14, 'Grace', 'Wright', 'Rheumatology', '2223334455', 'grace.wright@hospital.com')
;

-- Check to ensure data inserted correctly
SELECT *
FROM Doctors_Dim
;
-- Data inserted correctly

-- Inserted Dummy Data into Treatments_Dim
INSERT INTO Treatments_Dim (TreatmentID, Description)
VALUES
(1, 'Cardiac stress test and monitoring'),
(2, 'Bone fracture repair surgery'),
(3, 'Vaccination and general pediatric care'),
(4, 'Skin rash and allergy treatment'),
(5, 'MRI scan and neurological assessment'),
(6, 'Routine physical examination'),
(7, 'Cataract surgery and eye care'),
(8, 'Treatment for gastrointestinal disorders'),
(9, 'Chemotherapy for cancer treatment'),
(10, 'Psychological counseling and therapy'),
(11, 'Lung function tests and respiratory care'),
(12, 'Kidney stone removal'),
(13, 'Hormonal imbalance treatment'),
(14, 'Arthritis and joint pain management')
;

-- Check that the data ensure 
SELECT *
FROM Treatments_Dim
;

-- Insertion of data into the Medications_Dim table
INSERT INTO Medications_Dim (MedicationID, Name, Dosage, SideEffects)
VALUES
(1, 'Aspirin', '500mg', 'Nausea, Dizziness'),
(2, 'Amoxicillin', '250mg', 'Rash, Upset stomach'),
(3, 'Ibuprofen', '200mg', 'Stomach pain, Drowsiness'),
(4, 'Cetirizine', '10mg', 'Dry mouth, Fatigue'),
(5, 'Metformin', '500mg', 'Nausea, Diarrhea'),
(6, 'Losartan', '50mg', 'Dizziness, Fatigue'),
(7, 'Atorvastatin', '20mg', 'Muscle pain, Headache'),
(8, 'Albuterol', '90mcg', 'Tremors, Nervousness'),
(9, 'Omeprazole', '20mg', 'Stomach pain, Constipation'),
(10, 'Sertraline', '50mg', 'Insomnia, Dry mouth'),
(11, 'Levothyroxine', '100mcg', 'Weight loss, Increased appetite'),
(12, 'Insulin', '10 units', 'Low blood sugar, Sweating'),
(13, 'Hydrochlorothiazide', '25mg', 'Increased urination, Dizziness'),
(14, 'Montelukast', '10mg', 'Stomach upset, Sore throat')
;

-- Check that the data ensure 
SELECT *
FROM Medications_Dim
;

-- inserted correctly

INSERT INTO Prescription_Bridge (PrescriptionID, TreatmentID, MedicationID, Dosage, Frequency)
VALUES
(1, 1, 1, '500mg', 'Once daily'),
(2, 2, 2, '250mg', 'Twice daily'),
(3, 3, 3, '200mg', 'Every 6 hours'),
(4, 4, 4, '10mg', 'Once daily'),
(5, 5, 5, '500mg', 'Twice daily'), 
(6, 6, 6, '50mg', 'Once daily'), 
(7, 7, 7, '20mg', 'Before bedtime'), 
(8, 8, 8, '90mcg', 'Every 4 hours as needed'), 
(9, 9, 9, '20mg', 'Twice daily'), 
(10, 10, 10, '50mg', 'Once daily'), 
(11, 11, 11, '100mcg', 'Every morning'), 
(12, 12, 12, '10 units', 'Before meals'), 
(13, 13, 13, '25mg', 'Once daily'), 
(14, 14, 14, '10mg', 'Before bedtime')
;

-- -- Check that the data ensure 
SELECT *
FROM Prescription_Bridge
;

INSERT INTO Appointments_Fact (AppointmentID, PatientID, DoctorID, TreatmentID, AppointmentDate, Status, Cost)
VALUES
(1, 1, 1, 1, '2025-01-01', 'Completed', 150.00),
(2, 2, 2, 2, '2025-01-02', 'Scheduled', 300.00),
(3, 3, 3, 3, '2025-01-03', 'Cancelled', 100.00),
(4, 4, 4, 4, '2025-01-04', 'Completed', 200.00),
(5, 5, 5, 5, '2025-01-05', 'Completed', 250.00), 
(6, 6, 6, 6, '2025-01-06', 'Scheduled', 100.00), 
(7, 7, 7, 7, '2025-01-07', 'Cancelled', 150.00), 
(8, 8, 8, 8, '2025-01-08', 'Completed', 300.00), 
(9, 9, 9, 9, '2025-01-09', 'Scheduled', 500.00), 
(10, 10, 10, 10, '2025-01-10', 'No-show', 200.00), 
(11, 11, 11, 11, '2025-01-11', 'Completed', 350.00), 
(12, 12, 12, 12, '2025-01-12', 'Completed', 400.00), 
(13, 13, 13, 13, '2025-01-13', 'Scheduled', 250.00), 
(14, 14, 14, 14, '2025-01-14', 'Completed', 450.00)
;


-- Check that the data ensure 
SELECT *
FROM Appointments_Fact
;

-- After quality check data insertion are done correctly


-- Creating Store Procedures  improve reusability, performance, and security by encapsulating frequently used SQL logic.


-- Store Procedures to add new patient
CREATE PROCEDURE AddNewPatient
	@PatientID INT,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@Gender VARCHAR(50),
	@Age INT,
	@PhoneNumber VARCHAR(15),
	@Email VARCHAR(50)
AS
BEGIN
	INSERT INTO Patients_Dim(PatientID, FirstName, LastName, Gender, Age, PhoneNumber, Email)
	VALUES( @PatientID, @FirstName, @LastName, @Gender, @Age, @PhoneNumber, @Email)

	PRINT 'Patient added successfully'
END
;

-- Testing store procedures
EXEC AddNewPatient
	@PatientID = 111,
	@FirstName = 'Ralph',
	@LastName = 'Smith',
	@Gender = 'Male',
	@Age = 22,
	@PhoneNumber = '123-555-0987',
	@Email = 'Ralphsmith@noemail.com'
;

-- Patient added successfully, check if data in correctly

SELECT *
FROM Patients_Dim
WHERE PatientID = 111
;

-- Removed  dummy data use for test purposes
DELETE FROM Patients_Dim
WHERE PatientID = 111
;

drop procedure ScheduleAppointments;


-- Creation of Store Procedures to Schedule Appointment(s)
CREATE PROCEDURE ScheduleAppointments
	@AppointmentID int,
	@PatientID INT,
	@DoctorID INT,
	@TreatmentID INT,
	@AppointmentDate DATE,
	@Status VARCHAR(50),
	@Cost DECIMAL(10,2)
AS
BEGIN
	INSERT INTO Appointments_Fact (AppointmentID, PatientID, DoctorID, TreatmentID,AppointmentDate, Status, Cost)
	VALUES(@AppointmentID, @PatientID, @DoctorID, @TreatmentID,@AppointmentDate, @Status, @Cost);

	PRINT 'Appointment Schedule'
END
;


-- testing store procedure 


-- insert dummy data into patients_dim
 INSERT INTO Patients_Dim (PatientID, FirstName, LastName, Gender, Age, PhoneNumber, Email)
VALUES
(111, 'Test', 'Dummy', 'Male', 30, '1234567890', 'test.dummy@example.com')

;



EXEC ScheduleAppointments
    @AppointmentID = 111,
	@PatientID = 111,
	@DoctorID = 5,
	@TreatmentID = 5,
	@AppointmentDate = '2025-01-15',
	@Status = 'Scheduled',
	@Cost = 100.00

;

-- verify if the 
SELECT *
FROM Appointments_Fact
WHERE AppointmentID = 111
;

-- After test works fine
SELECT *
FROM Appointments_Fact
;



-- Created a Store Procedure 'GetPatientHistory' - to retrieve patient history

CREATE PROCEDURE GetPatientHistory
	@PatientID INT
AS
BEGIN
	SELECT
		a.AppointmentDate,
		d.FirstName AS DoctorFirstName,
		d.LastName AS DoctorLastName,
		t.Description AS treatment,
		a.Status,
		a.Cost
	FROM Appointments_Fact AS a
	JOIN Doctors_Dim As d
		ON a.DoctorID = d.DoctorID
	JOIN Treatments_Dim AS t 
		ON a.TreatmentID = t.TreatmentID
	WHERE a.PatientID = @PatientID
	ORDER BY a.AppointmentDate DESC
END
;

-- test GetPatientHistory store procedure

EXECUTE GetPatientHistory
	@PatientID = 1

	;

-- tested works fine


