


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


       
      
