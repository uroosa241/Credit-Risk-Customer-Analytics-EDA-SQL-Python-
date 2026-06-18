--	Which customer occupations receive the highest loan amounts?

select * from customers--occupation
select * from loans
select
		c.occupation,
		sum(loanamount) as total_loan
		from loans as l
		join customers as c
		on c.customerid=l.customerid
		group by c.occupation
		order by total_loan desc
		limit 1;


--	Which age group borrows the most money?
select
	case
			when c.age between 18 and 25  then '18-25'
			when c.age between 18 and 25  then '26-35'
			when c.age between 18 and 25  then '36-45'
			when c.age between 18 and 25  then '46-55'

			ELSE '60+'
			end as age_group,

	sum(loanamount) as total_loan
	from loans as l
	join customers as c
	on c.customerid=l.customerid
	group by age_group
	order by total_loan desc;
	


--	Do male or female customers contribute more to the loan portfolio?

SELECT
    c.gender,
    SUM(l.loanamount) AS total_loan_value
FROM loans l
JOIN customers c
ON l.customerid = c.customerid
GROUP BY c.gender
ORDER BY total_loan_value DESC;



--	Which income groups have the highest loan uptake?

select * from customers --income,occuptation
select * from loans

select

	 case
	when  c.income<30000 then 'low income'
		when  c.income between 30000 and 70000 then 'Middle income'
			when  c.income> 70000 then 'High income'
			end as income_group,
	sum(loanamount) as highest_loan
	FROM loans l
JOIN customers c
ON l.customerid = c.customerid
GROUP BY income_group
ORDER BY highest_loan DESC;



--Which states have the highest number of borrowers?

select
	c.state,
	sum(loanamount) as highest_borrower
	from loans as l
	join customers as c
	on c.customerid=l.customerid
	group by c.state
	order  by highest_borrower desc;

--Which customer segments are associated with higher default rates?
select
	c.occupation,
	count(case when loanstatus = 'Defaulted' then  1 end )*100/
	count(*) as default_percentage_rate,
	sum(loanamount)as total_loans
	from loans as l
		join customers as c
	on c.customerid=l.customerid
	group by c.occupation
	order by default_percentage_rate desc

select * from loans

--	What is the average loan amount by occupation?

select
	c.occupation,
	avg(loanamount) as avg_loan_amount
	FROM loans l
JOIN customers c
ON l.customerid = c.customerid
group by c.occupation
order by avg_loan_amount
	
