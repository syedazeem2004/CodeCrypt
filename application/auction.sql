-- create database auction;
use  auction;
CREATE TABLE user (
    uid   int AUTO_INCREMENT  PRIMARY KEY not null,
    uname varchar(255),
    email  varchar(255),
    dob varchar(255),
    pass varchar(255),
    address varchar(255),
    role varchar(255)
);

create table category (
    uid int AUTO_INCREMENT  PRIMARY KEY not null,
    cname varchar(255),
    description varchar(255)

);
CREATE INDEX idx_cname
ON category (cname);

create table product (
    pid int AUTO_INCREMENT  PRIMARY KEY ,
    name varchar(255),
    cname varchar(255),
    FOREIGN KEY (cname)  REFERENCES category(cname),
    description varchar(255),
    price double,
    quant int,
    image TEXT,
    uid int,
	FOREIGN KEY (uid)  REFERENCES user(uid)

);
create table auction (
	pid int PRIMARY KEY ,
    uid int,
    bid double,
    sdate date,
    edate date,
    status varchar(255)
   
	
);

create table bid (
   uid  int AUTO_INCREMENT  PRIMARY KEY,
   userid int,
   pid int,
   bidvalue double,
   status varchar(255)

);

select * from auction;
select * from bid;
select * from user;
select * from product;
SELECT product.name,product.image,product.uid,product.pid,auction.bid,auction.sdate,auction.edate 
FROM auction
INNER JOIN product ON auction.pid = product.pid; 
SELECT product.name,product.image,product.uid,product.pid,bid.bidvalue,bid.status
from bid
INNER JOIN product ON product.uid = 7;
 

select cname from category;
select * from bid where bidvalue=(select max(bidvalue) from bid where pid=2);
SELECT product.name,product.image,product.uid,product.pid,bid.bidvalue,bid.status from bid LEFT JOIN product ON bid.userid = 2;

