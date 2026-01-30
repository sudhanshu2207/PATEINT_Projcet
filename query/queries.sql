select * from Diagnosis;
select * from Patients;
select * from Outcomes;
select * from Labs;

--Retrieve Detailed Patient Lab History
select p.patientID, p.name, d.diagnosisname, o.outcomename, l.testname, l.result, l.Normalrange
from patients p
join diagnosis d on p.DiagnosisId = d.DiagnosisID
join outcomes o on p.OutcomeID = o.OutcomeID
join labs l on p.PatientID = l.PatientID
order by p.PatientID, l.TestName;

--Average Lab Results by Diagnosis
select d.diagnosisname,l.testname, avg(l.result) as AvgResult
from Patients p
join Diagnosis d on p.DiagnosisId = d.DiagnosisID
join labs l on p.PatientID = l.PatientID
group by d.DiagnosisName, l.TestName;

--find those patients which have abnormal lab result 
select p.patientid, p.name, count(*) as AbnormalCount
from patients p
join labs l on p.PatientID = l.PatientID
where(l.TestName = 'Blood Sugar' and l.Result>120)or
(l.TestName = 'Cholestrol' and l.Result>200)or
(l.TestName = 'Hemoglobin' and l.Result<13)
group by p.PatientID , p.name
order by AbnormalCount desc;

--Diagnoses with highest Treatment cost
 select d.diagnosisname, sum(p.TreatmentCosr)as TotalCost
 from patients p 
 join diagnosis d on p.diagnosisid = d.diagnosisid
 group by d.DiagnosisName
 order by TotalCost Desc

 --patients at Risk by age and gender
 select p.patientid , p.name, p.age,d.diagnosisname,o.outcomename
 from patients p
 join diagnosis d on p.DiagnosisId = d.DiagnosisID
 join Outcomes o on p.OutcomeID = o.OutcomeID
 where p.age>65 and o.OutcomeName != 'Recovered';

 -- lab trends over time for a specific patient
 select l.testname, l.result, p.admissiondate,p.PatientID
 from labs l
 join patients p on l.patientid = p.PatientID
 where p.PatientID in (2,4,6,8,10,12)
 order by p.AdmissionDate;

 --Distribution of Outcomes by dignosis\
 select d.diagnosisname,o.outcomename,count(*) as OutcomeCount
 from Patients p
 join Diagnosis d on p.DiagnosisId = d.DiagnosisID
 join Outcomes o on p.OutcomeID= o.OutcomeID
 group by d.DiagnosisName,o.OutcomeName
 order by d.DiagnosisName,o.OutcomeName