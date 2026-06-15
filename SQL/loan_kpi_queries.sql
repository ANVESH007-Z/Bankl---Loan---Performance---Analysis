/*
====================================================================================================
BANK LOAN ANALYSIS - KPI QUERIES
====================================================================================================

PURPOSE:
This SQL script calculates the key performance indicators (KPIs) used in the Bank Loan Analysis
Dashboard. The analysis provides insights into loan application trends, funding activity,
repayment performance, interest rates, and borrower debt-to-income ratios.

KEY METRICS:
1. Total Loan Applications
2. Month-to-Date (MTD) Loan Applications
3. Previous Month-to-Date (PMTD) Loan Applications
4. Total Funded Amount
5. MTD Funded Amount
6. PMTD Funded Amount
7. Total Amount Received
8. MTD Amount Received
9. PMTD Amount Received
10. Average Interest Rate
11. MTD Average Interest Rate
12. PMTD Average Interest Rate
13. Average Debt-to-Income Ratio (DTI)
14. MTD Average DTI
15. PMTD Average DTI

DATABASE:
- PostgreSQL

TABLE:
- financial_loan

BUSINESS OBJECTIVE:
To monitor lending performance, evaluate borrower characteristics, track loan funding
and repayment trends, and support data-driven decision-making through interactive
Power BI dashboards.

====================================================================================================
*/
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

