/*
SQL inlämningsuppgift "En liten bokhandel".
Joakim Emilsson - YH24
*/
-- Skapa och använda databasen Bokhandel1
CREATE DATABASE Bokhandel1;
USE Bokhandel1;

--  Tabell: Kunder
CREATE TABLE Kunder (
	KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telefon VARCHAR(20) UNIQUE,
    Adress VARCHAR(100) NOT NULL,
    Registreringsdatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
-- Testdata: Kunder
INSERT INTO Kunder (Namn, Email, Telefon, Adress) VALUES
	('Joakim Emilsson', 'emilssonjoakim@gmail.com', '0760178885', 'Alsteråvägen 42'), 
	('Johan Johansson', 'johanssonjohan@gmail.com', '0702222222', 'Parkvägen 5'),
	('Cecilia Holm', 'holmcecilia@gmail.com', '0703333333', 'Havsgatan 12');

-- Visa inserts
SELECT * FROM Kunder;

-- Tabell: Böcker
CREATE TABLE Bocker (
	BokID INT AUTO_INCREMENT PRIMARY KEY,
    Titel VARCHAR(255) NOT NULL,
    ISBN BIGINT UNIQUE NOT NULL,
    Forfattare VARCHAR(255) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL,
    Lagerstatus INT DEFAULT 0
    );
    
-- Testdata: Böcker
INSERT INTO Bocker (Titel, ISBN, Forfattare, Pris, Lagerstatus) VALUES 
	('Pojken och Äventyret', '123124135235132', 
    'Jonsered Backen', 79.90, 200),
	('Tiden som Tickade', '1231352453214', 
    'Temu Toskinen', 12.90, 75),
    ('JionDao och Kranen', '1343453234', 
    'Irma Svensson', 89.00, 31);
    
-- Visa inserts
SELECT * FROM Bocker;

-- Tabell: Beställningar
CREATE TABLE Bestallningar (
	OrderID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Datum DATE NOT NULL,
    Totalbelopp DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
    );
    
-- Testdata: Beställningar
INSERT INTO Bestallningar (KundID, Datum, Totalbelopp) VALUES
    (1, '2025-01-02', 200.00),
    (2, '2025-02-03', 100.00);
    
-- Visa inserts
SELECT * FROM Bestallningar;
    
-- Tabell: Orderrader (JOIN TABLE)
CREATE TABLE Orderrader (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    BokID INT NOT NULL,
    Antal INT NOT NULL,
    Radpris DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Bestallningar(OrderID),
    FOREIGN KEY (BokID) REFERENCES Bocker(BokID)
);

-- Testdata – Orderrader
INSERT INTO Orderrader (OrderID, BokID, Antal, Radpris)
VALUES
	(1, 1, 8, 199.00),
	(2, 2, 4, 149.00);

-- Visa inserts
SELECT * FROM Kunder;
SELECT * FROM Bocker;

SELECT * FROM Bestallningar;
SELECT * FROM Orderrader;

-- Test: visa vilka böcker som ingår i varje order
SELECT 
    Orderrader.OrderID,
    Bocker.Titel,
    Orderrader.Antal
FROM Orderrader
JOIN Bocker ON Orderrader.BokID = Bocker.BokID;



