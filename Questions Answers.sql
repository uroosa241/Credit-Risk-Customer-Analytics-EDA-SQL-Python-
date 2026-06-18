
--How much total loan has each customer taken?

SELECT 
    customerid,
    SUM(loanamount) AS total_loan_taken
FROM loans
GROUP BY customerid
ORDER BY total_loan_taken DESC;


--Find customers who have taken more than 1 loan.

SELECT 
    customerid,
    COUNT(loanid) AS total_loans
FROM loans
GROUP BY customerid
HAVING COUNT(loanid) > 1;



--What is the maximum loan given?

SELECT MAX(loanamount) AS highest_loan
FROM loans;


--Show the loan with the highest interest rate.

SELECT *
FROM loans
ORDER BY interestrate DESC
LIMIT 1;

--How many payments are late (Missed or Partial)?

SELECT 
    status,
    COUNT(*) AS total
FROM payments
WHERE status IN ('Missed', 'Partial')
GROUP BY status;



--How much has been paid per loan?

SELECT 
    loanid,
    SUM(amountpaid) AS total_paid
FROM payments
GROUP BY loanid
ORDER BY total_paid DESC;

--Find loans that have no payments recorded.

SELECT l.loanid
FROM loans l
LEFT JOIN payments p
ON l.loanid = p.loanid
WHERE p.loanid IS NULL;


--Compare customer income with loan amount.

SELECT 
    c.customerid,
    c.income,
    l.loanamount
FROM customers c
JOIN loans l
ON c.customerid = l.customerid;



--Find customers where loan > income.

SELECT 
    c.customerid,
    c.income,
    l.loanamount
FROM customers c
JOIN loans l
ON c.customerid = l.customerid
WHERE l.loanamount > c.income;



--What percentage of payments are fully paid?


SELECT 
    (COUNT(CASE WHEN status = 'Paid' THEN 1 END) * 100.0 / COUNT(*)) AS success_rate
FROM payments;


--Which state has the highest loan amount?

SELECT 
    c.state,
    SUM(l.loanamount) AS total_loans
FROM customers c
JOIN loans l
ON c.customerid = l.customerid
GROUP BY c.state
ORDER BY total_loans DESC;


--Compare average loan amount by loan status.

SELECT 
    loanstatus,
    AVG(loanamount) AS avg_loan
FROM loans
GROUP BY loanstatus;




--Which loan type is most popular?

SELECT 
    loantype,
    COUNT(*) AS total
FROM loans
GROUP BY loantype
ORDER BY total DESC;


--Find customers who never took a loan.

SELECT c.customerid
FROM customers c
LEFT JOIN loans l
ON c.customerid = l.customerid
WHERE l.customerid IS NULL;


--How much money has been successfully collected?

SELECT 
    SUM(amountpaid) AS total_revenue
FROM payments
WHERE status = 'Paid';

