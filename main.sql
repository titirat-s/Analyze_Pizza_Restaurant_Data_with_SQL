-- ########################################################
-- read and sample data

.read data_create.sql
.read data_edit.sql

select "
------------------------------------------------------------------------
  SAMPLE: DATA TABLE
------------------------------------------------------------------------

      Menu table";
.mode box
.header on
select * from menu_tbl order by random() limit 5;

.mode quote 
.header off
select "
      Customer table";
.mode box
.header on
select * from customers_tbl order by random() limit 5;

.mode quote 
.header off
select "
      1st order transaction (January 2022)";
.mode box
.header on
select *, coalesce(cusid, 'non-membership') customer
from orders_tbl
order by orderdate desc limit 10;

.mode quote 
.header off
select "
      2nd order transaction (February 2022)";
.mode box
.header on
select * from orders_feb ;

.mode quote
.header off
select "
----------------------------------------------------------

-- Update menu price of MD002 from 3.5$ to 3.0$ --

      Backup table (old price)";
.mode box
.header on
select * from backupmenu;

.mode quote
.header off
select "
      Menu table updated (new price)";
.mode box
.header on
select * from menu_tbl
where menuid = "MD002";

-- ########################################################
-- Query data and analyze

.mode quote
.header off
select "
------------------------------------------------------------------------
  ANALYSIS
------------------------------------------------------------------------

    1. Number of pizza ordered during 01/01/2022 to 31/01/2022
  
      1.1 Number of pizza ordered by membership customers";

.mode box
.header on

select
  ord.orderdate,
  sum(amount) 'unit sold'
from
  orders_tbl ord
where
  ord.cusid is not null and
  menuid like 'MP%'
group by 1
order by ord.orderdate;

-- sum total pizza sold by member
select
  sum(ord.amount) "Total pizza ordered by membership customer"
from
  orders_tbl ord
where 
  ord.cusid is not null and
  menuid like 'MP%';
----------------------------------------------------------

.mode quote
.header off
select "
      1.2 Number of pizza ordered by non-membership customers";

.mode box
.header on

select
  ord.orderdate,
  sum(amount) 'unit sold'
from
  orders_tbl ord
where
  ord.cusid is null and
  menuid like 'MP%'
group by 1
order by ord.orderdate;
-- sum total pizza sold by non-member
select
  sum(ord.amount) "Total pizza ordered by non-membership customer"
from
  orders_tbl ord
where
  ord.cusid is null and
  menuid like 'MP%';
--------------------------------------------------------------

.mode quote
.header off

 select"-----------------------------------------------------------

    2. Popularity of menu in each category in January 2022 (ranking by number of order)
";
.mode box
.header on

create view product_sales_2022_01 as
  select
    m.category,
    row_number() over (partition by m.category order by count(distinct ord.orderid) desc) as 'category rank',
    m.menuid id,
    m.menu menus,
    m.price price,
    row_number() over (order by count(distinct ord.orderid) desc) as 'overall rank',
    count(distinct ord.orderid) 'order Qty',
    sum(ord.amount) 'unit Qty',
    round(sum(ord.amount) * m.price,2) 'total Revenue'
  from
    orders_tbl ord
  join (
    select *,
      case
        when menuid like 'MP%' then 'pizza'
        when menuid like 'MA%' then 'appetizer'
        when menuid like 'MT%' then 'topping'
        else 'beverage'
      end as 'category'
    from menu_tbl) m -- join price and category
    on m.menuid = ord.menuid
  group by m.menuid
  having count(distinct ord.orderid) > 0;

-- retreive virtual table
select *
from product_sales_2022_01
order by 1, 2 asc;
--------------------------------------------------------------

.mode quote
.header off
select"-----------------------------------------------------------

    3. Menus were not sold in January 2022";

.mode box

create view product_not_sold_2022_01 as
  select
    case
      when mn.menuid like 'MP%' then 'Pizza'
      when mn.menuid like 'MA%' then 'Appetizer'
      when mn.menuid like 'MD%' then 'Drinks'
      else 'Topping'
    end as 'menu type',
    mn.menu,
    mn.price
  from menu_tbl mn
  left join
    (select menuid, sum(amount) total
            from orders_tbl
            group by 1) od
    on od.menuid = mn.menuid
  where od.total is null;

-- retrieve virtual table
select *
from product_not_sold_2022_01;
--------------------------------------------------------------

.mode quote
.header off
select '-----------------------------------------------------------

    4. Top 5 spenders in January 2022';

.mode box
create view member_spends_2022_01 as
  with transpend as (
    select
      o.orderid,
      o.orderdate,
      o.cusid,
      m.menuid,
      o.amount,
      m.price,
      (m.price*o.amount) total
      from orders_tbl o
    left join menu_tbl m on m.menuid = o.menuid) -- calculate -> menu qty * price

  -- ranking customers total spends
  select
    row_number() over (order by round(sum(total_spends),2) desc) as 'rank',
    upper(cus.lastname)|| ' ' ||cus.firstname 'customer Name',
    max(orderdate) 'recent Date',
    count(distinct orderid) orders,
    round(avg(total_spends),2) 'avg Spends',
    max(total_spends) 'maximum Spends',
    round(sum(total_spends),2) 'total Spends'
  from
    (select
      orderid,
      orderdate,
      cusid,
      sum(total) as total_spends                   
    from transpend
    group by 1) tsp -- order's total spends
  join customers_tbl cus on cus.cusid = tsp.cusid
  where cus.cusid is not null
  group by cus.cusid
  order by round(sum(total_spends),2) desc;

select *
from member_spends_2022_01
limit 5;
----------------------------------------------------------