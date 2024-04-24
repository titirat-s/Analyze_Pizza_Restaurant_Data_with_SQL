---------------------------------------------------------
-- add new data: add data if no exists
insert or ignore into menu_tbl
  (menuid, menu, price)
  values
  ("MD002", 'Soft drink soda', "3.0"),
  ("MD003", "Sparkling water", "2.0"),
  ("MD004", "Punch soda", "2.0"),
  ("MD005", 'Tropical juice', "2.0"),
  ("MD006", 'Beer', "4.0");

----------------------------------------------------------
-- MD002 is already exists, use update command instead insert: set price from 3.5$ to 3.0$

-- backup: backup if case of error
create table if not exists backupmenu (
  menuid varchar(5),
  menu varchar(50),
  price int
);
insert into backupmenu (menuid, menu, price)
select * 
from menu_tbl
where menuid = "MD002";

-- update data in menu_tbl
update menu_tbl
set price = "3.0"
where menuid = "MD002";

---------------------------------------------------------
-- 2 table contain data from difference sources, combine 2 source and separate transaction in January and February into difference table to avoid data overlap before query

-- orders_tbl: contain transactions in January 2022
insert into orders_tbl
select * from orders_2nd
where
  strftime("%Y", orderdate) == "2022" and
  strftime("%m", orderdate) == "01";
delete from orders_2nd
where
  strftime("%Y", orderdate) == "2022" and
  strftime("%m", orderdate) == "01";

-- orders_2nd: contain all transactions in February 2022 and rename table
insert into orders_2nd
select * from orders_tbl
where 
  strftime("%Y", orderdate) == "2022" and
  strftime("%m", orderdate) == "02";
delete from orders_tbl
where 
  strftime("%Y", orderdate) == "2022" and
  strftime("%m", orderdate) == "02";
alter table orders_2nd rename to orders_feb