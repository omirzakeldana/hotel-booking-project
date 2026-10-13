
CREATE DATABASE HotelBookingDB;
GO

USE HotelBookingDB;
GO


CREATE TABLE Klientter (
    klient_id INT PRIMARY KEY,
    aty_zhoni NVARCHAR(100),
    telefon NVARCHAR(20),
    email NVARCHAR(100)
);


CREATE TABLE Bolmeler (
    bolme_id INT PRIMARY KEY,
    bolme_nomeri INT,
    bolme_turi NVARCHAR(50),
    bagasy INT,
    sipattama NVARCHAR(200),
    kui NVARCHAR(30)
);


CREATE TABLE QonaqProfili (
    profil_id INT PRIMARY KEY,
    klient_id INT FOREIGN KEY REFERENCES Klientter(klient_id),
    buryngy_tandau NVARCHAR(100),
    qalaular NVARCHAR(200)
);


CREATE TABLE QonaqSuranysy (
    suranys_id INT PRIMARY KEY,
    klient_id INT FOREIGN KEY REFERENCES Klientter(klient_id),
    suranys_matini NVARCHAR(200)
);


CREATE TABLE Brondau (
    bron_id INT PRIMARY KEY,
    klient_id INT FOREIGN KEY REFERENCES Klientter(klient_id),
    bolme_id INT FOREIGN KEY REFERENCES Bolmeler(bolme_id),
    kiru_kuni DATE,
    shygu_kuni DATE,
    kui NVARCHAR(30)
);


CREATE TABLE Tolemder (
    tolem_id INT PRIMARY KEY,
    bron_id INT FOREIGN KEY REFERENCES Brondau(bron_id),
    soma INT,
    tolem_tasili NVARCHAR(50),
    kui NVARCHAR(30)
);


CREATE TABLE Qyzmetkerler (
    qyzmetker_id INT PRIMARY KEY,
    aty_zhoni NVARCHAR(100),
    telefon NVARCHAR(20),
    email NVARCHAR(100),
    lauazymy NVARCHAR(50),
    login NVARCHAR(50)
);


CREATE TABLE Admin (
    admin_id INT PRIMARY KEY,
    qyzmetker_id INT FOREIGN KEY REFERENCES Qyzmetkerler(qyzmetker_id),
    role NVARCHAR(50)
);


SELECT * FROM Klientter;
SELECT * FROM Bolmeler;
SELECT * FROM QonaqProfili;
SELECT * FROM QonaqSuranysy;
SELECT * FROM Brondau;
SELECT * FROM Tolemder;
SELECT * FROM Qyzmetkerler;
SELECT * FROM Admin;
