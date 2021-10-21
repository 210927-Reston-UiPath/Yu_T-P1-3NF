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


Insert into vendors (vendorname)
Values ('pega');
Insert into vendors (vendorname)
Values ('stationeryshop');
Insert into vendors (vendorname)
Values ('foodshop');
Insert into vendors (vendorname)
Values ('beverageshop');

select vendors.vendorID,vendors.vendorName,vendorinventory.vendoritem,vendorinventory.vendorcost
From vendors
Inner join vendorinventory 
On vendors.vendorName = vendorinventory.vendorName;

drop table clients cascade;
drop table shoppinglist cascade;
drop table orders cascade;
drop table shoppingexpense cascade;
drop table vendors cascade;
drop table vendorinventory cascade;

delete from clients;
delete from shoppinglist;

delete from shoppingexpense;


select * from orders;
select * from shoppingexpense;
select * from clients;
select * from shoppinglist;
select * from vendors;
select * from vendorinventory;

