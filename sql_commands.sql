create table clients (
    clientID serial,
    clientName varchar(255) not null,
    clientEmail varchar(255) not null,
    primary key (clientID)
);

create table shoppinglist (
    itemID serial,
    clientID int not null,
    productName varchar(255) not null,
    primary key (itemID),
    foreign key(clientID) references clients(clientID)
);

create table orders (
    orderID serial,
    clientID int not null,
    total DECIMAL(13, 2) not null,
    primary key (orderID),
    foreign key (clientID) references clients(clientID)
);

create table shoppingexpense (
    lineitemID serial,
    orderID int not null,
    itemID int not null,
    subtotal DECIMAL(13, 2) not null,
    price DECIMAL(13, 2) not null,
    primary key (lineitemID),
    foreign key (itemID) references shoppinglist(itemID),
    foreign key (orderID) references orders(orderID)
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

select * from clients;
select * from shoppinglist;
select * from orders;
select * from shoppingexpense;
select * from vendors;
select * from vendorinventory;

