drop table L�n;
drop table Prioritet;
drop table Transaktion;
drop table Konto;
drop table KundeHarKonto;
drop table Kunde;
drop table Medarbejder;
drop table Afdeling;
drop table Bank;
drop table PostDistrikt;


create table PostDistrikt (
   postNr int,
   bynavn char(20),
   primary key (postNr) );

create table Bank (
   navn char(30),
   adresse char(30),
   postNr int,
   foreign key (postNr) references PostDistrikt (postNr) );

create table Afdeling (
   regNr int,
   navn char(20),
   adresse char(30),
   postNr int,
   tlfNr char(11),
   primary key (regNr),
   foreign key (postNr) references PostDistrikt (postNr));

create table Medarbejder (
   cprNr char(10),
   afdeling int,
   titel char(20),
   navn char(30),
   adresse char(30),
   postNr int,
   primary key (cprNr),
   foreign key (postNr) references PostDistrikt (postNr),
   foreign key (afdeling) references Afdeling (regNr) );

create table Kunde (
   cprNr char(10),
   navn char(30),
   adresse char(30),
   postNr int,
   primary key (cprNr),
   foreign key (postNr) references PostDistrikt (postNr) );

create table KundeHarKonto (
  cprNr char(10),
  regNr int,
  ktonr BigInt );

create table Konto (
   regNr int,
   ktoNr BigInt,
   tekst char(20),
   saldo real,
   renteIndl�n real,
   renteUdl�n real,
   primary key (regNr, ktoNr),
   foreign key (regNr) references Afdeling (regNr) );

create table Transaktion (
   regNr int,
   ktoNr BigInt,
   dato char(10),
   tekst char(20),
   bel�b real,
   foreign key (regNr, ktoNr) references Konto  (regNr, ktoNr));

create table L�n (
   regNr int,
   ktoNr BigInt,
   l�neret real,
   primary key (regNr, ktoNr),
   foreign key (regNr, ktoNr) references Konto (regNr, ktoNr) );

create table Prioritet (
   regNr int,
   ktoNr BigInt,
   hovedstol real,
   primary key (regNr, ktoNr),
   foreign key (regNr, ktoNr) references Konto (regNr, ktoNr) );





insert into PostDistrikt (postNr, bynavn)
  values ( 1313, 'Andeby');
insert into PostDistrikt (postNr, bynavn)
  values ( 9191, 'G�ser�d');
insert into PostDistrikt (postNr, bynavn)
  values ( 3456, 'Grisel�se');

insert into Bank (navn, adresse, postNr)
  values ( 'Andeby Bank A/S', 'Joakim von And Boulevarden 4', 1313);

insert into Afdeling (regNr, navn, adresse, postNr, tlfNr)
  values ( 1234, 'Andeby Nygade', 'Andeby Nygade 21', 1313, '+4589135689');
insert into Afdeling (regNr, navn, adresse, postNr, tlfNr)
  values ( 1216, 'G�ser�d', 'G�ser�d Bygade 14', 9191, '+4589121241');
insert into Afdeling (regNr, navn, adresse, postNr, tlfNr)
  values ( 1220, 'Grisel�se', 'Gammel Torv 2', 3456, '+4589421212');

insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
  values ( '1209631223', 1234, 'Afdelingsdirekt�r', 'Mickie Mouse', 'Spidsmusehegnet 1', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
  values ( '2210711443', 1234, 'Erhvervsr�dgiver', 'Fedtmule', 'Spidsmusehegnet 3', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
  values ( '3112692132', 1234, 'Erhvervsr�dgiver', 'Minnie Mouse', 'Andeby Nygade 11', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
  values ( '1504788775', 1234, 'Privatr�dgiver', 'Sorteper', 'Forbryderv�nget 9', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
  values ( '2712598753', 1216, 'Privatr�dgiver', 'F�tter Guf', 'Bondeg�rden 3', 9191);

insert into Kunde (cprNr, navn, adresse, postNr)
  values ( '1209631223', 'Store Stygge Ulv', 'Skovkanten 1', 3456);
insert into Kunde (cprNr, navn, adresse, postNr)
  values ( '2210711443', 'Lille Stygge Ulv', 'Skovkanten 1', 3456);
insert into Kunde (cprNr, navn, adresse, postNr)
  values ( '3112692132', 'De tre sm� grise', 'Skovkanten 7', 3456);
insert into Kunde (cprNr, navn, adresse, postNr)
  values ( '1504788758', 'Andersine', 'Andeby Nygade 57', 1313);
insert into Kunde (cprNr, navn, adresse, postNr)
  values ( '2712598723', 'Anders And', 'Paradis�blevej 13', 1313);

insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
  values ( 1234, 1234567, 'L�nkonto', 10000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
  values ( 1234, 1231236, 'L�nkonto', 5000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
  values ( 1234, 1357967, 'L�nkonto', 12000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
  values ( 1216, 1256788, 'L�nkonto', 15000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
  values ( 1216, 2234567, 'Boligl�n', 2550000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
  values ( 1234, 2231236, 'Boligl�n', 3175000.00, 1.2, 5.2);

insert into KundeHarKonto (cprNr, regNr, ktonr) 
  values ( '1209631223', 1234, 2231236 );
insert into KundeHarKonto (cprNr, regNr, ktonr) 
  values ( '2210711443', 1234, 2231236 );
insert into KundeHarKonto (cprNr, regNr, ktonr) 
  values ( '3112692132', 1216, 1256788 );
insert into KundeHarKonto (cprNr, regNr, ktonr) 
  values ( '3112692132', 1234, 1357967 );

insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 2231236, '2008-01-02', 'Indbetaling', 5000.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 2231236, '2008-04-01', 'Indbetaling', 25000.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 2231236, '2008-08-03', 'Udbetaling', 500.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-04', 'Uddbetaling', 1000.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-05', 'Uddbetaling', 50.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-06', 'Uddbetaling', 250.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-07', 'Uddbetaling', 1250.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-08', 'Uddbetaling', 255.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-10', 'Uddbetaling', 300.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-11', 'Uddbetaling', 410.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
  values ( 1234, 1357967, '2008-08-12', 'Udbetaling', 50.00);

insert into L�n (regNr, ktoNr, l�neret)
  values ( 1234, 1234567, 10000.00);
insert into L�n (regNr, ktoNr, l�neret)
  values ( 1234, 1231236, 5000.00);
insert into L�n (regNr, ktoNr, l�neret)
  values ( 1234, 1357967, 12000.00);
insert into L�n (regNr, ktoNr, l�neret)
  values ( 1216, 1256788, 15000.00);

insert into Prioritet (regNr, ktoNr, hovedstol)
  values ( 1216, 2234567, 5550000.00);
insert into Prioritet (regNr, ktoNr, hovedstol)
  values ( 1234, 2231236, 4500000.00);
