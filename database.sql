
-- ҚОНАҚҮЙДІ БРОНДАУ АҚПАРАТТЫҚ ЖҮЙЕСІ

-- Деректер қорын құру
CREATE DATABASE HotelBookingProjectDB;
GO
USE HotelBookingProjectDB;
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
    klient_id INT REFERENCES Klientter(klient_id),
    buryngy_tandau NVARCHAR(100),
    qalaular NVARCHAR(200)
);


CREATE TABLE QonaqSuranysy (
    suranys_id INT PRIMARY KEY,
    klient_id INT REFERENCES Klientter(klient_id),
    suranys_matini NVARCHAR(200)
);


CREATE TABLE Brondau (
    bron_id INT PRIMARY KEY,
    klient_id INT REFERENCES Klientter(klient_id),
    bolme_id INT REFERENCES Bolmeler(bolme_id),
    kiru_kuni DATE,
    shygu_kuni DATE,
    kui NVARCHAR(30)
);


CREATE TABLE Tolemder (
    tolem_id INT PRIMARY KEY,
    bron_id INT REFERENCES Brondau(bron_id),
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
    qyzmetker_id INT REFERENCES Qyzmetkerler(qyzmetker_id),
    role NVARCHAR(50)
);


INSERT INTO Klientter VALUES
(1, N'Аружан', N'87011234567', N'aruzhan@gmail.com'),
(2, N'Данияр', N'87077654321', N'daniyar@gmail.com'),
(3, N'Айдана', N'87771234567', N'aidana@gmail.com'),
(4, N'Мадина', N'87010001001', N'madina@gmail.com'),
(5, N'Әлихан', N'87010001002', N'alikhan@gmail.com'),
(6, N'Аяулым', N'87010001003', N'ayaulym@gmail.com'),
(7, N'Ерасыл', N'87010001004', N'erassyl@gmail.com'),
(8, N'Ақбота', N'87010001007', N'akbota@gmail.com'),
(9, N'Іңкәр', N'87010001009', N'inkar@gmail.com'),
(10, N'Эльдана', N'87010001010', N'eldana@gmail.com');


INSERT INTO Bolmeler VALUES
(1,101,N'Стандарт',15000,N'Wi-Fi, бір адамға',N'Бос'),
(2,102,N'Стандарт',18000,N'Екі адамға арналған',N'Бос'),
(3,103,N'Стандарт',20000,N'Тыныш, терезесі бар',N'Бос'),
(4,104,N'Стандарт',17000,N'Терезесіз бөлме',N'Бос'),
(5,105,N'Стандарт',22000,N'Балкон, Wi-Fi',N'Бос'),
(6,201,N'Комфорт',25000,N'Кең бөлме, Wi-Fi',N'Бос'),
(7,202,N'Комфорт',28000,N'Тыныш, лифтіден алыс',N'Бос'),
(8,203,N'Комфорт',30000,N'Тау көрінісі',N'Бос'),
(9,204,N'Комфорт',32000,N'Жоғары қабат',N'Бос'),
(10,205,N'Комфорт',27000,N'Терезесіз, тыныш',N'Бос'),
(11,301,N'Люкс',40000,N'Балкон, үлкен төсек',N'Бос'),
(12,302,N'Люкс',45000,N'Джакузи',N'Бос'),
(13,303,N'Люкс',50000,N'Панорамалық терезе',N'Бос'),
(14,304,N'Люкс',48000,N'Қала көрінісі',N'Бос'),
(15,305,N'Люкс',55000,N'Тау көрінісі',N'Бос'),
(16,401,N'Отбасылық',35000,N'Төрт адамға',N'Бос'),
(17,402,N'Отбасылық',38000,N'Балкон, кондиционер',N'Бос'),
(18,403,N'Отбасылық',42000,N'Бес адамға',N'Бос'),
(19,404,N'Отбасылық',40000,N'Балаларға ыңғайлы',N'Бос'),
(20,405,N'Отбасылық',45000,N'Екі бөлмелі',N'Бос'),
(21,501,N'Премиум',60000,N'Джакузи',N'Бос'),
(22,502,N'Премиум',65000,N'Жеке терраса',N'Бос'),
(23,503,N'Премиум',70000,N'VIP бөлме',N'Бос'),
(24,504,N'Премиум',75000,N'Президенттік бөлме',N'Бос'),
(25,505,N'Премиум',80000,N'Үлкен терраса',N'Бос');


INSERT INTO QonaqProfili VALUES
(1,1,N'301 Люкс',N'Тыныш, балкон'),
(2,2,N'201 Комфорт',N'Wi-Fi'),
(3,3,N'203 Комфорт',N'Тау көрінісі'),
(4,4,N'104 Стандарт',N'Терезесіз'),
(5,5,N'302 Люкс',N'Джакузи'),
(6,6,N'501 Премиум',N'Джакузи'),
(7,7,N'403 Отбасылық',N'Бес адамға'),
(8,8,N'505 Премиум',N'Үлкен терраса'),
(9,9,N'205 Комфорт',N'Терезесіз'),
(10,10,N'305 Люкс',N'Тау көрінісі');



INSERT INTO QonaqSuranysy VALUES
(1,1,N'15 мың теңгеге Wi-Fi бар бөлме керек'),
(2,2,N'18 мың теңгеге екі адамдық бөлме керек'),
(3,3,N'20 мың теңгеге тыныш бөлме керек'),
(4,4,N'17 мың теңгеге терезесіз бөлме керек'),
(5,5,N'22 мың теңгеге балконы бар бөлме керек'),
(6,6,N'25 мың теңгеге кең бөлме керек'),
(7,7,N'28 мың теңгеге тыныш бөлме керек'),
(8,8,N'30 мың теңгеге тау көрінісі керек'),
(9,9,N'40 мың теңгеге люкс бөлме керек'),
(10,10,N'45 мың теңгеге джакузи бар бөлме керек');



INSERT INTO Brondau VALUES
(1,1,11,'2026-10-15','2026-10-18',N'Расталды'),
(2,2,6,'2026-10-16','2026-10-19',N'Расталды'),
(3,3,8,'2026-10-17','2026-10-20',N'Расталды'),
(4,4,4,'2026-10-18','2026-10-21',N'Күтілуде'),
(5,5,12,'2026-10-19','2026-10-22',N'Расталды'),
(6,6,16,'2026-10-20','2026-10-24',N'Расталды'),
(7,7,9,'2026-10-21','2026-10-23',N'Күтілуде'),
(8,8,7,'2026-10-22','2026-10-25',N'Расталды'),
(9,9,15,'2026-10-23','2026-10-26',N'Күтілуде'),
(10,10,10,'2026-10-24','2026-10-27',N'Расталды');


INSERT INTO Tolemder VALUES
(1,1,120000,N'Карта',N'Төленді'),
(2,2,75000,N'Карта',N'Төленді'),
(3,3,90000,N'Қолма-қол',N'Төленді'),
(4,4,51000,N'Карта',N'Күтілуде'),
(5,5,135000,N'Карта',N'Төленді'),
(6,6,140000,N'Қолма-қол',N'Төленді'),
(7,7,64000,N'Карта',N'Күтілуде'),
(8,8,84000,N'Карта',N'Төленді'),
(9,9,165000,N'Қолма-қол',N'Күтілуде'),
(10,10,81000,N'Карта',N'Төленді');


INSERT INTO Qyzmetkerler VALUES
(1,N'Айгерім',N'87010002001',N'aigerim@gmail.com',N'Ресепшн',N'aigerim'),
(2,N'Нұржан',N'87010002002',N'nurzhan@gmail.com',N'Ресепшн',N'nurzhan'),
(3,N'Дана',N'87010002003',N'dana@gmail.com',N'Менеджер',N'dana'),
(4,N'Әлихан',N'87010002004',N'alikhan@gmail.com',N'Әкімші',N'alikhan'),
(5,N'Мадина',N'87010002005',N'madina@gmail.com',N'Әкімші',N'madina'),
(6,N'Арман',N'87010002006',N'arman@gmail.com',N'Ресепшн',N'arman'),
(7,N'Аружан',N'87010002007',N'aruzhan@gmail.com',N'Менеджер',N'aruzhan'),
(8,N'Ерасыл',N'87010002008',N'erassyl@gmail.com',N'Ресепшн',N'erassyl'),
(9,N'Алина',N'87010002009',N'alina@gmail.com',N'Брондау қызметкері',N'alina'),
(10,N'Тимур',N'87010002010',N'timur@gmail.com',N'Брондау қызметкері',N'timur');


INSERT INTO Admin VALUES
(1,4,N'Әкімші'),
(2,5,N'Әкімші');


SELECT * FROM Klientter;
SELECT * FROM Bolmeler;
SELECT * FROM QonaqProfili;
SELECT * FROM QonaqSuranysy;
SELECT * FROM Brondau;
SELECT * FROM Tolemder;
SELECT * FROM Qyzmetkerler;
SELECT * FROM Admin;
