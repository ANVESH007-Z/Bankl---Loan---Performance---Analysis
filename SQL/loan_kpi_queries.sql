SELECT * FROM public.financial_loan
Order by id ASC
  
--Total  Loan Applications
SELECT COUNT(id) Total_loan_Applications FROM financial_loan

-- Month Total Loan Applications --MONTH TO DATE
SELECT COUNT(id) as MTD_Total_loan_Application FROM financial_loan
WHERE EXTRACT(Month from issue_date) = 12 AND
EXTRACT(Year from issue_date) = 2021 ;

-- Previous Month Total Loan Applications --MONTH TO DATE
SELECT COUNT(id) as PMTD_Total_loan_Application FROM financial_loan
WHERE EXTRACT(Month from issue_date) = 11 AND
EXTRACT(Year from issue_date) = 2021 ;

--Total Funded Amount
SELECT SUM(loan_amount) AS Total_funded_amount from financial_loan

--MTD_Total_funded_amount
SELECT SUM(loan_amount) AS MTD_Total_funded_amount from financial_loan
WHERE EXTRACT(Month from issue_date)= 12 AND
      EXTRACT(YEAR from issue_date) = 2021

--Previous MTD_Total_funded_amount
SELECT SUM(loan_amount) AS previous_Total_funded_amount from financial_loan
WHERE EXTRACT(Month from issue_date)= 11 AND
      EXTRACT(YEAR from issue_date) = 2021

--Total amount Recieved
SELECT SUM(Total_payment)AS Total_Amount_recieved FROM financial_loan

-- MTD_Total_Amount_Recieved
SELECT SUM(Total_payment)AS MTD_Total_Amount_recieved FROM financial_loan
WHERE EXTRACT(Month FROM Issue_date) = 12 AND 
      EXTRACT(YEAR from issue_date) = 2021

-- PMTD_Total_Amount_Recieved	
SELECT SUM(Total_payment)AS MTD_Total_Amount_recieved FROM financial_loan
WHERE EXTRACT(Month FROM Issue_date) = 11 AND 
      EXTRACT(YEAR from issue_date) = 2021

-- Average_Interest _Rate
SELECT ROUND(AVG(int_rate) * 100,2) AS Avg_Intrest_rate FROM financial_loan

-- MTD_Average_Interest _Rate
SELECT ROUND(AVG(int_rate) * 100,2) AS MTD_Avg_Intrest_rate FROM financial_loan
WHERE EXTRACT(Month FROM issue_date) = 12 AND
      EXTRACT(Year FROM issue_date) = 2021

-- PMTD_Average_Interest _Rate
SELECT ROUND(AVG(int_rate) * 100,2) AS PMTD_Avg_Intrest_rate FROM financial_loan
WHERE EXTRACT(Month FROM issue_date) = 11 AND
      EXTRACT(Year FROM issue_date) = 2021

-- AVerage Debt to income (DTI)
SELECT ROUND(AVG(dti) *100,2) AS Avg_Dti FROM financial_loan

--MTD_Avg_Dti
SELECT ROUND(AVG(dti) *100,2) AS MTD_Avg_Dti FROM financial_loan
WHERE EXTRACT(MOnth FROM issue_date) = 12 AND
      EXTRACT(Year FROM issue_date) = 2021

-- PMTD_Avg_Dti	  
SELECT ROUND(AVG(dti) *100,2) AS PMTD_Avg_Dti FROM financial_loan
WHERE EXTRACT(MOnth FROM issue_date) = 11 AND
      EXTRACT(Year FROM issue_date) = 2021

