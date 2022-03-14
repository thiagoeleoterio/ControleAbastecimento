--
-- File generated with SQLiteStudio v3.3.3 on sáb mar 12 17:14:37 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Abastecimento
DROP TABLE IF EXISTS Abastecimento;
CREATE TABLE Abastecimento (IdAbastecimento INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, IdBomba INTEGER CONSTRAINT FK_Abastecimento_Bomba REFERENCES Bomba (IdBomba), Data DATETIME, QtdLitros DECIMAL (18, 3), Valor DECIMAL (18, 2), ImpostoPercentual DECIMAL (18, 2), ImpostoValor DECIMAL (18, 2), ValorTotal DECIMAL (18, 2));

-- Table: Bomba
DROP TABLE IF EXISTS Bomba;
CREATE TABLE Bomba (IdBomba INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, IdTanque INTEGER CONSTRAINT FK_Bomba_Tanque REFERENCES Tanque (IdTanque), Descricao VARCHAR (100));

-- Table: Tanque
DROP TABLE IF EXISTS Tanque;
CREATE TABLE Tanque (IdTanque INTEGER PRIMARY KEY AUTOINCREMENT, Descricao VARCHAR (100));

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
