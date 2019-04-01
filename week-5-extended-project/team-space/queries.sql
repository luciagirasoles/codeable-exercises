--Show the total amount of sales in January 2009
select sum(t.price) from tours  as t 
inner join sales as s on t.id = s.tour_id
where s.date <'2009-01-31 00:00:00' and  s.date >'2009-01-01 23:59:59';

--Build a report of number of sales and total amount by each B2B customer
--(contact name) A[ 6] Contact: Business contact from our customer
select a.contact_name , count(s.id) , sum(t.price)total from agencies as a
inner join sales as s on s.agency_id = a.id
inner join tours as t on s.tour_id = t.id
group by a.contact_name;


--What is your best product?
select t.name count(s.id), from sales as s
inner join tour as t on s.tour_id = t.id
group by t.name desc limit 1;


--What's the preferred payment type?
select t.name, count(s.id)total from sales as s
inner join tours as t on s.tour_id = t.id
group by t.name 
order by total desc limit 1;


--What are the number and amount of sales per POS? Is there a clear channel where we should focus our efforts?
SELECT s.pos, count(s.id), sum(t.price) as SALES from sales as s
inner join tours as t on s.tour_id = t.id
group by pos
order by SALES desc;

--Per each tour, where do customers come from? Show the top 5 locations
(In-Progress)
