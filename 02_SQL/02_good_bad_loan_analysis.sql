/*
====================================================================================================
BANK LOAN ANALYSIS - GOOD LOAN VS BAD LOAN ANALYSIS
====================================================================================================

PURPOSE:
This SQL script evaluates the quality of the loan portfolio by categorizing loans into
Good Loans and Bad Loans based on their loan status.

LOAN CLASSIFICATION:

Good Loans:
- Fully Paid
- Current

Bad Loans:
- Charged Off

KEY METRICS:

Good Loan Analysis:
1. Good Loan Percentage
2. Good Loan Applications
3. Good Loan Funded Amount
4. Good Loan Total Amount Received

Bad Loan Analysis:
5. Bad Loan Percentage
6. Bad Loan Applications
7. Bad Loan Funded Amount
8. Bad Loan Total Amount Received

DATABASE:
- PostgreSQL

TABLE:
- financial_loan

BUSINESS OBJECTIVE:
To assess portfolio health, measure credit risk, compare performing and non-performing
loans, and support lending decisions through data-driven insights.

====================================================================================================
*/
-- GOOD LOAN Vs BAD LOAN --
-- Good Loan Application Percentage
SELECT ROUND
            (COUNT
			      (CASE WHEN loan_status IN ('Fully Paid','Current') 
				  THEN id END) * 100.0
			 /COUNT(id),2
			 ) || '%'
			 AS Good_loan_percentage
			 FROM 
			 financial_loan

-- Good Loan Applications
SELECT COUNT(CASE WHEN loan_status IN('Fully Paid','Current') THEN id END)
             AS Good_loan_Applications
			 FROM financial_loan
			 --OR

SELECT COUNT(id)
FROM financial_loan
       WHERE loan_status IN ('Fully Paid','Current'); 
	   -- PostgreSQL string comparisons are case-sensitive. Strings - 'Fully Paid','Current')

--Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_loan_funded_amount
FROM financial_loan
WHERE loan_status IN ('Fully Paid','Current')

-- Good_loan_Total_Recieved_Amount
SELECT SUM(total_payment) AS Good_loan_Total_Recieved_Amount
FROM financial_loan 
WHERE loan_status IN ('Fully Paid','Current')

--Bad loan Application Percentage
SELECT ROUND(
             COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END )
			 * 100.0
			 /COUNT(id),2
			 )
			 AS Bad_loan_apllication_percentage
			 FROM financial_loan

-- Bad loan Application
SELECT COUNT(id) AS bad_loan_applications FROM financial_loan 
WHERE loan_status = 'Charged Off'

--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_loan_funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off'

--Bad loan Recieved Amount
SELECT SUM(total_payment) AS Bad_loan_recieved_amount FROM financial_loan
WHERE loan_status = 'Charged Off'
	
