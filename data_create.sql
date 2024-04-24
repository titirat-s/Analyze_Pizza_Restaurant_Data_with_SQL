----------------------------------------------------------
-- Create and insert data into the tables
----------------------------------------------------------
-- Menus table (data table)
create table if not exists menu_tbl (
  menuid varchar(5) unique primary key not null,
  menu varchar(50) not null,
  price int not null);

-- Customers table (data table)
create table if not exists customers_tbl (
  cusid varchar(5) unique primary key not null,
  lastname varchar(10),
  firstname varchar(10) not null,
  tell varchar(15) unique not null,
  email varchar);

-- Orders table (transaction table)
create table if not exists orders_tbl (
  orderid varchar(8) not null,
  orderdate date not null,
  cusid varchar(5), -- customer w/o membership will nulled
  menuid varchar(5) not null,
  amount int not null,
  foreign key (menuid) references menu_tbl(menuid));

-- The 2nd data contain transaction from another source
create table if not exists orders_2nd (
  orderid varchar(8) not null,
  orderdate date not null,
  cusid varchar(5), -- customer w/o membership will nulled
  menuid varchar(5) not null,
  amount int not null,
  foreign key (menuid) references menu(menuid));


-- add menu data
insert into menu_tbl
values
("MP001", 'Supreme pizza 16"'                , "20.6"),
("MP002", 'Super Supreme pizza 16"'          , "23.4"),
("MP003", 'Cheese lover pizza 16"'           , "16.5"),
("MP004", 'Veggie lover pizza 16"'           , "20.6"),
("MP005", 'Meat lover pizza 16"'             , "23.4"),
("MP006", 'Pepperoni lover pizza 16"'        , "19.1"),
("MP007", 'Hawaiian pizza 16"'               , "17.0"),
("MP008", 'Garlic chicken pizza 16"'         , "18.6"),
("MP009", 'Spanish mushroom & ham pizza 16"' , "20.4"),
("MA001", 'Cream chicken soup'               , "18.6"),
("MA002", 'Potato bacon soup'                , "16.0"),
("MA003", 'Cream of mushroom soup'           , "16.3"),
("MA004", 'Gralic bread'                     , "14.0"),
("MA005", 'BBQ chicken'                      , "18.2"),
("MT001", 'Pineapple topping'                , "2.5"),
("MT002", 'Pepperoni topping'                , "2.5"),
("MT003", 'Peacon topping'                   , "2.5"),
("MT004", 'Extra cheese'                     , "2.5"),
("MD001", 'Drinking water'                   , "2.0"),
("MD002", 'Soft drink soda'                  , "3.5");

-- add customer data
insert into customers_tbl
values
("C0001", "Milgrom","Patricia", "000-01-0000", null),
("C0002", "Adams","Caesar", "000-02-2222", "sandy@gmail.com"),
("C0003", "Smith", "Jane", "222-52-5555", null),
("C0004", "Bronson", "Mathew", "432-19-8765", "Paul_br@gmail.com"),
("C0005", "Raynor", "David", "464-64-4466", null),
("C0006", "He", "Tian", "767-74-7373", "Martin.U@mar.com"),
("C0007", "Lockwoods", "James", "106-36-2248", "James.L@lockwoods.com"),
("C0008", "Gillan", "Jake", "264-88-5849", "aston.l@gmail.com"),
("C0009", "Kylot", "Hugo", "694-58-7846", null),
("C0010", "Suh", "Leehan", "005-54-6659", null),
("C0011", "Zheng", "Weiyun", "461-55-4875", null),
("C0012", "Suwakhawadee", "Suwadee", "854-75-7842", null),
("C0013", "Han", "Leeseo", "061-54-0606", null),
("C0014", "Riegrow", "Jason", "260-26-2626", "Park_Jason@yahoo.com"),
("C0015", "Fauvel", "Maxenxe Danet", "648-57-2345", "iammaxfaulvel@gmail.com"),
("C0016", "Johnson", "James", "111-12-1111", "Johnny.J@yahoo.com");

-- add transaction data source 1
insert into orders_tbl
(orderid, cusid, menuid, orderdate, amount)
values
("OO220001", "C0001", "MP001", "2022-01-09", 1),
("OO220001", "C0001", "MA004", "2022-01-09", 2),
("OO220001", "C0001", "MD002", "2022-01-09", 2),
("OT220001", "C0002", "MP003", "2022-01-09", 2),
("OT220001", "C0002", "MT003", "2022-01-09", 1),
("OO220002", null  , "MP002", "2022-01-09", 1),
("OO220002", null  , "MA002", "2022-01-09", 2),
("OO220002", null  , "MD002", "2022-01-09", 1),
("OT220002", "C0004", "MP004", "2022-01-09", 3),
("OT220002", "C0004", "MT004", "2022-01-09", 3),
("OO220003", "C0005", "MP001", "2022-01-09", 1),
("OO220003", "C0005", "MP005", "2022-01-09", 1),
("OO220003", "C0005", "MP006", "2022-01-09", 1),
("OO220003", "C0005", "MD006", "2022-01-09", 3),
("OO220003", "C0005", "MA001", "2022-01-09", 1),
("OO220003", "C0005", "MP006", "2022-01-09", 1),
("OO220003", "C0005", "MA004", "2022-01-09", 1),
("OO220003", "C0005", "MA005", "2022-01-09", 1),
("OO220003", "C0004", "MP001", "2022-01-10", 2),
("OO220003", "C0004", "MA005", "2022-01-10", 1),
("OT220003", "C0006", "MP003", "2022-01-10", 2),
("OT220003", "C0006", "MT003", "2022-01-10", 2),
("OT220003", "C0006", "MT004", "2022-01-10", 2),
("OT220004", "C0007", "MP003", "2022-01-10", 1),
("OT220004", "C0007", "MP007", "2022-01-10", 1),
("OO220004", "C0008", "MA005", "2022-01-10", 2),
("OO220004", "C0008", "MA002", "2022-01-10", 1),
("OO220004", "C0008", "MD002", "2022-01-10", 1),
("OO220004", "C0008", "MD001", "2022-01-10", 1),
("OT220005", "C0002", "MT002", "2022-01-15", 4),
("OT220005", "C0002", "MA004", "2022-01-15", 6),
("OT220006", "C0009", "MP002", "2022-01-15", 2),
("OT220006", "C0009", "MP003", "2022-01-15", 2),
("OT220006", "C0009", "MP004", "2022-01-15", 2),
("OT220007", "C0011", "MP005", "2022-01-15", 2),
("OT220007", "C0011", "MP001", "2022-01-15", 2),
("OT220007", "C0011", "MP008", "2022-01-15", 2),
("OT220007", "C0011", "MT003", "2022-01-15", 6),
("OO220006", "C0012", "MP002", "2022-01-15", 1),
("OO220006", "C0012", "MA001", "2022-01-15", 1),
("OO220006", "C0012", "MD001", "2022-01-15", 1),
("OO220007", null   , "MP001", "2022-01-15", 1),
("OO220007", null   , "MT004", "2022-01-15", 1),
("OO220007", null   , "MT002", "2022-01-15", 1),
("OO220007", null   , "MA001", "2022-01-15", 1),
("OO220007", null   , "MD002", "2022-01-15", 1),
("OT220008", null   , "MP006", "2022-01-16", 1),
("OT220008", null   , "MP003", "2022-01-16", 1),
("OO220008", "C0003", "MD002", "2022-01-16", 2),
("OO220009", "C0005", "MP005", "2022-01-16", 1),
("OO220009", "C0005", "MT004", "2022-01-16", 1),
("OO220009", "C0005", "MA005", "2022-01-16", 1),
("OO220009", "C0005", "MD006", "2022-01-16", 2),
("OT220009", "C0008", "MP006", "2022-01-16", 1),
("OT220009", "C0008", "MT002", "2022-01-16", 1),
("OO220010", null   , "MA001", "2022-01-16", 1),
("OO220010", null   , "MA004", "2022-01-16", 1),
("OO220010", null   , "MA005", "2022-01-16", 1),
("OO220010", null   , "MD002", "2022-01-16", 1),
("OT220010", "C0010", "MP008", "2022-01-16", 1),
("OT220010", "C0010", "MP003", "2022-01-16", 1),
("OT220010", "C0010", "MT002", "2022-01-16", 1),
("OT220010", "C0010", "MT003", "2022-01-16", 1),
("OO220010", "C0011", "MP004", "2022-01-17", 1),
("OO220010", "C0011", "MD001", "2022-01-17", 1),
("OO220011", null   , "MP005", "2022-01-17", 1),
("OO220011", null   , "MA004", "2022-01-17", 1),
("OO220011", null   , "MD002", "2022-01-17", 1),
("OO220012", "C0006", "MP003", "2022-01-17", 1),
("OO220012", "C0006", "MA005", "2022-01-17", 1),
("OO220012", "C0006", "MD002", "2022-01-17", 2),
("OO220013", "C0012", "MP005", "2022-01-17", 1),
("OO220013", "C0012", "MP007", "2022-01-17", 1),
("OO220013", "C0012", "MA003", "2022-01-17", 1),
("OO220013", "C0012", "MA002", "2022-01-17", 1),
("OO220013", "C0012", "MD002", "2022-01-17", 2),
("OO220014", null   , "MP007", "2022-01-17", 1),
("OO220014", null   , "MT004", "2022-01-17", 1),
("OO220014", null   , "MD001", "2022-01-17", 1),
("OT220011", "C0013", "MP006", "2022-01-17", 2),
("OT220011", "C0013", "MP007", "2022-01-17", 2),
("OT220011", "C0013", "MA005", "2022-01-17", 2),
("OT220011", "C0013", "MP006", "2022-01-17", 2),
("OT220012", "C0003", "MP008", "2022-01-17", 1),
("OT220012", "C0003", "MP002", "2022-01-17", 1),
("OT220012", "C0003", "MT004", "2022-01-17", 2),
("OO220015", null   , "MP002", "2022-01-22", 1),
("OO220015", null   , "MT004", "2022-01-22", 1),
("OO220015", null   , "MD002", "2022-01-22", 1),
("OO220016", "C0006", "MP004", "2022-01-22", 1),
("OO220016", "C0006", "MT004", "2022-01-22", 1),
("OO220016", "C0006", "MD002", "2022-01-22", 1),
("OT220013", "C0004", "MP004", "2022-01-22", 2),
("OT220013", "C0004", "MT004", "2022-01-22", 2),
("OT220013", "C0004", "MP008", "2022-01-22", 2),
("OT220013", "C0004", "MP005", "2022-01-22", 1),
("OT220013", "C0004", "MT003", "2022-01-22", 1),
("OT220013", "C0004", "MA005", "2022-01-22", 4),
("OT220014", "C0007", "MP001", "2022-01-22", 3),
("OT220014", "C0007", "MP002", "2022-01-22", 3),
("OT220015", "C0011", "MP006", "2022-01-22", 1),
("OT220015", "C0011", "MA002", "2022-01-22", 1),
("OT220015", "C0011", "MT002", "2022-01-22", 1),
("OT220016", "C0010", "MP008", "2022-01-22", 2),
("OT220016", "C0010", "MD006", "2022-01-22", 2),
("OT220017", "C0001", "MA003", "2022-01-22", 2),
("OT220017", "C0001", "MP006", "2022-01-22", 2),
("OT220017", "C0001", "MA005", "2022-01-22", 1),
("OO220017", "C0013", "MP005", "2022-01-22", 1),
("OO220017", "C0013", "MP002", "2022-01-22", 1),
("OO220017", "C0013", "MD006", "2022-01-22", 3),
("OO220017", "C0013", "MD003", "2022-01-22", 2),
("OO220017", "C0013", "MA002", "2022-01-22", 2),
("OO220017", "C0013", "MP001", "2022-01-22", 1),
("OO220017", "C0013", "MA004", "2022-01-22", 2),
("OO220018", "C0014", "MP001", "2022-01-22", 1),
("OO220018", "C0014", "MP006", "2022-01-22", 1),
("OO220018", "C0014", "MA003", "2022-01-22", 1),
("OO220018", "C0014", "MA004", "2022-01-22", 2),
("OO220019", "C0015", "MP001", "2022-01-22", 1),
("OO220019", "C0015", "MP004", "2022-01-22", 1),
("OO220019", null   , "MA004", "2022-01-22", 1),
("OO220019", null   , "MD001", "2022-01-22", 2),
("OO220020", "C0015", "MP008", "2022-01-23", 1),
("OO220020", "C0015", "MA002", "2022-01-23", 1),
("OO220020", "C0015", "MD002", "2022-01-23", 1),
("OT220018", "C0004", "MP007", "2022-01-22", 1),
("OT220018", "C0004", "MP003", "2022-01-22", 2),
("OO220021", "C0005", "MP002", "2022-01-23", 1),
("OO220021", "C0005", "MT002", "2022-01-23", 1),
("OO220021", "C0005", "MD002", "2022-01-23", 1),
("OO220022", "C0012", "MP005", "2022-01-23", 1),
("OO220022", "C0012", "MP008", "2022-01-23", 1),
("OO220022", "C0012", "MD002", "2022-01-23", 4),
("OO220022", "C0012", "MA002", "2022-01-23", 1),
("OO220022", "C0012", "MA001", "2022-01-23", 1),
("OO220022", "C0012", "MA003", "2022-01-23", 2),
("OO220023", "C0014", "MP008", "2022-01-23", 1),
("OO220023", "C0014", "MP002", "2022-01-23", 1),
("OO220023", "C0014", "MD002", "2022-01-23", 5),
("OT220019", "C0003", "MP006", "2022-01-24", 1),
("OT220019", "C0003", "MP003", "2022-01-24", 1),
("OT220019", "C0003", "MD003", "2022-01-24", 2),
("OO220024", "C0009", "MP002", "2022-01-24", 1),
("OO220024", "C0009", "MD002", "2022-01-24", 2),
("OO220024", "C0009", "MA002", "2022-01-24", 1),
("OT220020", "C0004", "MA005", "2022-01-24", 2),
("OT220020", "C0004", "MA003", "2022-01-24", 1),
("OT220020", "C0004", "MA004", "2022-01-24", 1),
("OT220020", "C0004", "MA005", "2022-01-24", 1),
("OT220021", null   , "MP005", "2022-01-24", 3),
("OT220021", null   , "MA005", "2022-01-24", 4),
("OT220022", "C0004", "MP007", "2022-01-24", 1),
("OT220022", "C0004", "MP008", "2022-01-24", 1),
("OT220022", "C0004", "MA005", "2022-01-24", 3),
("OO220025", "C0011", "MP002", "2022-01-29", 1),
("OO220025", "C0011", "MA002", "2022-01-29", 1),
("OO220025", "C0011", "MA001", "2022-01-29", 1),
("OO220025", "C0011", "MP005", "2022-01-29", 2),
("OO220025", "C0011", "MD003", "2022-01-29", 2),
("OT220023", "C0006", "MP008", "2022-01-29", 3),
("OT220023", "C0006", "MP006", "2022-01-29", 3),
("OT220023", "C0006", "MP005", "2022-01-29", 8),
("OT220024", "C0004", "MP003", "2022-01-29", 1),
("OT220024", "C0004", "MA004", "2022-01-29", 1),
("OT220024", "C0004", "MP004", "2022-01-29", 1),
("OT220025", "C0009", "MP007", "2022-01-29", 2),
("OT220025", "C0009", "MT002", "2022-01-29", 2),
("OO220026", null   , "MP005", "2022-01-29", 1),
("OO220026", null   , "MP003", "2022-01-29", 1),
("OO220026", null   , "MA001", "2022-01-29", 2),
("OO220026", null   , "MA003", "2022-01-29", 2),
("OO220026", null   , "MA002", "2022-01-29", 1),
("OO220027", "C0010", "MP005", "2022-01-29", 1),
("OO220027", "C0010", "MT004", "2022-01-29", 1),
("OO220027", "C0010", "MP003", "2022-01-29", 1),
("OO220027", "C0010", "MD002", "2022-01-29", 1),
("OO220027", "C0010", "MD001", "2022-01-29", 2),
("OT220026", "C0015", "MP001", "2022-01-30", 1),
("OT220026", "C0015", "MP002", "2022-01-30", 1),
("OT220026", "C0015", "MD002", "2022-01-30", 2),
("OT220026", "C0015", "MA005", "2022-01-30", 2),
("OT220027", "C0004", "MP008", "2022-01-30", 2),
("OT220027", "C0004", "MA001", "2022-01-30", 3),
("OT220027", "C0004", "MD005", "2022-01-30", 3),
("OO220028", "C0008", "MP002", "2022-01-30", 1),
("OO220028", "C0008", "MA002", "2022-01-30", 1),
("OO220028", "C0008", "MP006", "2022-01-30", 1),
("OO220028", "C0008", "MD006", "2022-01-30", 2),
("OT220028", null   , "MP007", "2022-01-30", 2),
("OO220029", null   , "MP002", "2022-01-31", 1),
("OO220029", null   , "MP005", "2022-01-31", 1),
("OO220029", null   , "MD002", "2022-01-31", 3),
("OO220029", null   , "MD003", "2022-01-31", 1),
("OO220029", null   , "MA004", "2022-01-31", 1),
("OO220029", null   , "MA005", "2022-01-31", 1),
("OT220029", "C0006", "MP006", "2022-01-31", 1),
("OT220029", "C0006", "MP007", "2022-01-31", 1),
("OT220029", "C0006", "MP008", "2022-01-31", 2),
("OO220030", "C0010", "MP007", "2022-01-31", 2),
("OO220030", "C0010", "MA003", "2022-01-31", 2),
("OO220030", "C0010", "MD002", "2022-01-31", 3),
("OT220030", "C0004", "MP005", "2022-01-31", 1),
("OT220030", "C0004", "MP003", "2022-01-31", 1),
("OT220030", "C0004", "MT003", "2022-01-31", 1);

-- add transaction data source 2
insert into orders_2nd 
(orderid, cusid, menuid, orderdate, amount)
values
("OO220031", "C0003", "MP002", "2022-02-01", 1),
("OO220031", "C0003", "MA002", "2022-02-01", 3),
("OO220031", "C0003", "MD002", "2022-02-01", 1),
("OO220031", "C0003", "MD005", "2022-02-01", 2),
("OO220032", null  , "MP006", "2022-01-31", 2),
("OO220032", null  , "MT003", "2022-01-31", 1),
("OO220032", null  , "MD002", "2022-01-31", 2),
("OO220032", null  , "MD003", "2022-01-31", 3),
("OO220005", "C0010", "MP005", "2022-01-15", 1),
("OO220005", "C0010", "MP006", "2022-01-15", 1),
("OO220005", "C0010", "MA003", "2022-01-15", 1),
("OO220005", "C0010", "MA004", "2022-01-15", 1);