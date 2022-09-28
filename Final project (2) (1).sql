select * into food_rev from foods..TruncatedFoodsFine$ where 1 <> 2 

Create table user_details(
Userid varchar(20),
profilename varchar(100))

create table products(
Product_id varchar(20))

create table foodreviews(
Review_id int,
Review_helpfulness varchar(010),
Review_score decimal(4,2),
Review_time varchar(100),
Review_summary varchar(500),
Review_text varchar(6000),
Userid varchar(20),
product_id varchar(20))

create table Foodreviews_sample(
Review_id int,
Review_helpfulness varchar(100),
Review_score decimal(5,3),
Review_time int,
Review_summary varchar(100),
Review_text varchar(200),
Userid varchar(20),
product_id varchar(20))


insert into Foodreviews_sample(review_id)
select SUBSTRIng([Review ID], 1, 5) from food_rev where 1 <> 2

insert into Foodreviews(Review_id, product_id, Userid, Review_helpfulness, Review_score, Review_time, Review_summary, Review_text)
select [Review ID], SUBSTRIng([Review contents], 20, 10), 
SUBSTRIng([Review contents], 46, 14), SUBSTRING([Review contents], CHARINDEX('helpfulness', [Review contents]) + 13, (CHARINDEX('review/score:', [Review contents]) - CHARINDEX('helpfulness', [Review contents]) - 13)),
SUBSTRING([Review contents], CHARINDEX('score', [Review contents]) + 6, (CHARINDEX('review/time:', [Review contents]) - CHARINDEX('score', [Review contents]) - 6)), 
SUBSTRING([Review contents], CHARINDEX('time', [Review contents]) + 6, (CHARINDEX('review/summary:', [Review contents]) - CHARINDEX('time', [Review contents]) - 6)), 
SUBSTRING([Review contents], CHARINDEX('summary', [Review contents]) + 9, (CHARINDEX('review/text:', [Review contents]) - CHARINDEX('summary', [Review contents]) - 9)), 
SUBSTRING([Review contents], CHARINDEX('text', [Review contents]) + 6, DATALENGTH([Review contents])) 
from food_rev as f inner join Foodreviews_sample as fr on fr.[Review_id] = f.[Review ID]
where 1 <> 2

insert into products(product_id)
select SUBSTRING([Review contents], 20, 10)
from food_rev as f inner join Foodreviews_sample as fr on fr.[Review_id] = f.[Review ID]
where 1 <> 2

insert into user_details(Userid, profilename)
select SUBSTRIng([Review contents], 46, 14), SUBSTRING([Review contents], CHARINDEX('PROFILENAME', [Review contents]) + 13, (CHARINDEX('review/helpfulness:', [Review contents]) - 
CHARINDEX('PROFILENAME', [Review contents]) - 13)) from food_rev where 1 <> 2

select * from Foodreviews
select * from products
select * from user_details

select * from food_rev


-- Most reviewed Product
select top 1 product_id, count(*) as Reviews from products group by product_id order by count(*) desc


