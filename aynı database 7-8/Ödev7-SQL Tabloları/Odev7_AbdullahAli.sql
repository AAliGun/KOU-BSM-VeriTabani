create database Odev7_AbdullahAli;

use Odev7_AbdullahAli;

create table BOLUM(
bolno int,
badi varchar(11),
primary key(bolno)
);
create table PERSONEL(
 sno int,
 bno int,
 ucret int,
 primary key(sno)
 );
 create table PROJE(
 pno int,
 projeadi varchar(11),
 bno int,
 primary key(pno)
 );
 create table MALZEME(
 mkodu varchar(5),
 madi varchar(11),
 mevmik int,
 primary key(mkodu)
 );
 create table URETIM(
 mkodu varchar(5),
 bno int,
 miktar int
 );
 create table TUKETIM(
 mkodu varchar(5),
 pno int,
 miktar int
 );
 create table FIRMA(
 firma int,
 adi varchar(8),
 primary key(firma)
 );
 create table ALIM(
 mkodu varchar(5),
 firma int,
 miktar int
 );
 
 insert into BOLUM(bolno, badi) values
(1,'Elektronik'),
(2, 'Satınalma'),
(3,'Ayniyat'),
(4,'Muhasaebe');
 insert into PERSONEL(sno,bno,ucret)
 values
 (1,2,50),
 (10,1,50),
 (11,1,100),
 (2,2,75),
 (3,3,75),
 (4,1,25),
 (5,4,100),
 (6,4,50),
 (7,3,75),
 (8,3,50),
 (9,1,100);
 insert into PROJE(pno,projeadi,bno) values
 (1,'Elpro',1),
 (2,'Bilgi',2),
 (3,'Satbilgi',2),
 (4,'AyniPro',3),
 (5,'Muhpro',4);
 insert into MALZEME(mkodu,madi,mevmik) values
 ('SA11','Harddisk',30),
 ('KF23','Cdrom',50),
 ('A111','Monitor',40),
 ('B31','Ram',100),
 ('ZX3','Anakart',25);
 insert into TUKETIM(mkodu,pno,miktar) values
 ('SA11',1,5),
 ('SA11',3,10),
 ('SA11',4,15),
 ('KF23',1,10),
 ('A111',2,5),
 ('B31',2,10),
 ('ZX3',5,25),
 ('KF23',3,20);
 insert into URETİM(mkodu,bno,miktar) values
 ('SA11',1,10),
 ('SA11',2,20),
 ('SA11',3,15),
 ('KF23',4,5),
 ('A111',2,5),
 ('B31',3,10),
 ('ZX',3,25),
 ('KF23',2,20);
 insert into FIRMA(firma,adi) values
 (1,'KRN'),
 (2,'BATIKAN'),
 (3,'ARENA'),
 (4,'HP');
 insert into ALIM(mkodu,firma,miktar) values
 ('SA11',2,15),
 ('KF23',5,25),
 ('KF28',3,30),
 ('A111',5,20),
 ('A118',2,30),
 ('ZX3',2,20),
 ('KF29',1,30);
 