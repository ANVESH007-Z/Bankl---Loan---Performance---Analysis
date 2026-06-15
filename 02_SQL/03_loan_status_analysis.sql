
/*
====================================================================================================
BANK LOAN ANALYSIS - LOAN STATUS ANALYSIS
====================================================================================================

PURPOSE:
This SQL script analyzes loan portfolio performance based on loan status. It provides
a summary of applications, funded amounts, repayments, interest rates, and debt-to-income
ratios for each loan status category.

KEY METRICS:

Loan Status Summary:
1. Total Loan Applications
2. Total Funded Amount
3. Total Amount Received
4. Average Interest Rate
5. Average Debt-to-Income Ratio (DTI)

Month-to-Date (MTD) Analysis:
6. MTD Funded Amount by Loan Status
7. MTD Amount Received by Loan Status

LOAN STATUS CATEGORIES:
- Fully Paid
- Current
- Charged Off

DATABASE:
- PostgreSQL

TABLE:
- financial_loan

BUSINESS OBJECTIVE:
To monitor loan performance across different loan statuses, evaluate repayment behavior,
identify portfolio risks, and support business decisions through detailed loan status reporting.

====================================================================================================
*/

SELECT loan_status,
       COUNT(id) AS total_applications,
	   SUM(loan_amount) AS total_funded_amount,
	   SUM(total_payment) AS total_amount_recieved,
	 ROUND(AVG(int_rate) *100,2) AS Avg_Intrest_rate,
	 ROUND(AVG(dti) *100,2) AS Avg_dti
	 FROM financial_loan
	 GROUP BY loan_status
	 ORDER BY loan_status DESC

--MONTH_TO_DATE
SELECT loan_status,
       SUM(loan_amount) AS MTD_Total_loan_Amount,
	   SUM(total_payment) AS MTD_total_amount_recieved
	   FROM financial_loan

	   WHERE EXTRACT(MONTH from issue_date) = 12
	   GROUP BY loan_status


       
      
