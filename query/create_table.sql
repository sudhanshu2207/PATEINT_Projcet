create database healthcare;
use healthcare;

create table Diagnosis(
DiagnosisID Int primary key,
DiagnosisName VARCHAR(255),
);

create table Outcomes(
OutcomeID int primary key,
OutcomeName VARCHAR(255)
);

create table Patients(
PatientID int primary key,
Name varchar(255),
Age int,
Gender char(1),
DiagnosisId int,
AdmissionDate Date,
DischargeDate date,
OutcomeID int,
TreatmentCosr decimal(10,2),
foreign key (DiagnosisID) references Diagnosis(DiagnosisID),
foreign key (OutcomeID) references Outcomes(OutcomeID)
);

create table Labs(
LabID int primary key,
PatientID int,
TestName VARCHAR(255),
Result Decimal(10,2),
NormalRange Varchar(255),
foreign key(PatientID) references Patients(PatientID)
);