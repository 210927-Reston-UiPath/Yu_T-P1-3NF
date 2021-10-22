create table clients (
    clientID serial,
    clientName varchar(255) not null,
    clientEmail varchar(255) not null,
    primary key (clientID)
);

create table shoppinglist (
    itemID serial,
    clientID int not null,
    ordernumber int not null,
    clientorder varchar(255) not null,
    clientquantity int not null,
    primary key (itemID),
    foreign key(clientID) references clients(clientID)
);

create table orders (
    ordernumber int not null,
    clientID int not null,
    totalexpenses DECIMAL(13, 2) not null,
    primary key (ordernumber)
    -- foreign key (clientID) references clients(clientID)
);


create table shoppingexpense (
    lineitemID serial,
    ordernumber int not null,
    itemID int not null,
    price DECIMAL(13, 2) not null,
    subtotal DECIMAL(13, 2) not null,
    primary key (lineitemID),
    foreign key (itemID) references shoppinglist(itemID)
    -- foreign key (orderID) references orders(orderID)
);


create table notFound (
    clientID int not null,
    ordernumber int not null,
    vendoritem varchar(255) not null,
    foreign key(clientID) references clients(clientID)
);

create table vendors (
    vendorID serial,
    vendorName varchar(255) unique,
    primary key (vendorID)
);

create table vendorinventory (
    vendorName varchar(255) not null,
    vendoritem varchar(255) not null,
    vendorcost DECIMAL(13, 2) not null,
    foreign key (vendorName) references vendors(vendorName)
);

-- required for table creation
Insert into vendors (vendorname)
Values ('pega');
Insert into vendors (vendorname)
Values ('stationeryshop');
Insert into vendors (vendorname)
Values ('foodshop');
Insert into vendors (vendorname)
Values ('beverageshop');
--
--view total expenses
select orders.ordernumber, clients.clientName, orders.totalexpenses
from orders
inner join clients on orders.clientID = clients.clientID

-- view subtotals
select orders.ordernumber,clients.clientname, shoppinglist.clientorder,shoppingexpense.price,shoppinglist.clientquantity,shoppingexpense.subtotal
from orders
inner join clients on orders.clientid = clients.clientid
inner join shoppingexpense on shoppingexpense.ordernumber = orders.ordernumber
inner join shoppinglist on shoppinglist.itemID = shoppingexpense.itemID
order by ordernumber asc;

-- view client info
select orders.ordernumber,clients.clientName,clients.clientEmail,shoppinglist.clientorder, shoppinglist.clientquantity
from orders
inner join clients on orders.clientid = clients.clientid
inner join shoppinglist on orders.clientID = shoppinglist.clientID;

-- view client info + client id
select orders.ordernumber, orders.clientID,clients.clientName,clients.clientEmail,shoppinglist.clientorder, shoppinglist.clientquantity
from orders
inner join clients on orders.clientid = clients.clientid
inner join shoppinglist on orders.clientID = shoppinglist.clientID;

--view vendors
select vendors.vendorName,vendorinventory.vendoritem,vendorinventory.vendorcost
From vendors
Inner join vendorinventory 
On vendors.vendorName = vendorinventory.vendorName;

--view client shopping list with order numbers for NotFound
select shoppinglist.ordernumber,clients.clientName,shoppinglist.clientorder
from clients
inner join shoppinglist on clients.clientid = shoppinglist.clientid



drop table clients cascade;
drop table shoppinglist cascade;
drop table notFound;

drop table orders cascade;
drop table shoppingexpense cascade;

drop table vendors cascade;
drop table vendorinventory cascade;

delete from clients cascade;
delete from shoppinglist cascade;

delete from shoppingexpense cascade;
delete from orders cascade;

select * from orders;
select * from shoppingexpense;

select * from shoppinglist;
select * from clients;

select * from vendors;
select * from vendorinventory;



