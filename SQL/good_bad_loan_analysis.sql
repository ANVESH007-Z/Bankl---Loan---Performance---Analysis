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
	
