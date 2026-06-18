
alter table loans
add column default_rate int;


alter table loans
alter column default_rate type varchar(20);

update loans
set default_rate=
CASE
	when loanstatus = 'Defaulted' then 'High Risk'
	WHEN loanstatus = 'Late' then 	'Medium Risk'
	else 'Lower Risk'
	end;

--1.	Which states have the highest loan default rates?

select * from loans
select * from customers
select * from  payments

select
 c.state
 l.default_risk



2.	Which occupations have the highest default rates?
