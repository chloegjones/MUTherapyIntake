//Query to find which doctor sees which patient + patient ssn
//Joins two tables
SELECT sees_a.doctor_name, Patient.first, Patient.last, Patient.ssn
FROM sees_a
INNER JOIN Patient ON sees_a.ssn=Patient.ssn;

//Uses an aggregation function
//Query to find number of doctors
SELECT COUNT(UPIN) FROM `doctor`;
//Query to find number of Patients
SELECT COUNT(ssn) FROM Patient;

//Query to find what medication each patient is on
//Joins 2 tables
SELECT medical_record.medications,has_a.p_first, has_a.p_last 
FROM has_a 
INNER JOIN medical_record ON has_a.RID=medical_record.RID;
