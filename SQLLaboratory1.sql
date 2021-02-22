USE master
GO
CREATE DATABASE MYCOMPANY
GO
USE MYCOMPANY
GO

CREATE TABLE Object(
    ID_Object INT NOT NULL PRIMARY KEY,
    FullName varchar(25) NOT NULL
)

CREATE TABLE Manager(
    ID_Manager INT NOT NULL PRIMARY KEY,
    FullName varchar(25) NOT NULL,
    QTY_Builders INT NOT NULL,
    ID_Object INT NOT NULL,
    FOREIGN KEY (ID_Object) REFERENCES Object
)

CREATE TABLE Supplier(
    ID_Supplier INT NOT NULL PRIMARY KEY,
    FullName varchar(25) NOT NULL
)

CREATE TABLE Material(
    ID_Material INT NOT NULL PRIMARY KEY,
    FullName varchar(25) NOT NULL,
    QTY INT NOT NULL,
)

CREATE TABLE OrderMaterials(
    ID_Order INT NOT NULL PRIMARY KEY,
    CODE_ORDER VARCHAR(10) NOT NULL,
    ID_Supplier INT NOT NULL,
    ID_Manager INT NOT NULL,
    ID_Material INT NOT NULL,
    QTY_Material INT NOT NULL,
    FOREIGN KEY (ID_Supplier) REFERENCES Supplier,
    FOREIGN KEY (ID_Manager) REFERENCES Manager,
    FOREIGN KEY (ID_Material) REFERENCES Material
)

CREATE TABLE WareHouse(
    ID_WareHouse INT NOT NULL PRIMARY KEY,
    Address VARCHAR(15) NOT NULL
)

CREATE TABLE MaterialWareHouse(
    ID_MaterialWareHouse INT NOT NULL PRIMARY KEY,
    ID_WareHouse INT NOT NULL,
    ID_Material INT NOT NULL,
    FOREIGN KEY (ID_WareHouse) REFERENCES WareHouse,
    FOREIGN KEY (ID_Material) REFERENCES Material,
)

CREATE TABLE TruckDriver(
    ID_TruckDriver INT NOT NULL PRIMARY KEY,
    ID_WareHouse INT NOT NULL,
    ID_Object INT NOT NULL,
    Tonnage INT NOT NULL,
    FOREIGN KEY (ID_WareHouse) REFERENCES WareHouse,
    FOREIGN KEY (ID_Object) REFERENCES Object
)

CREATE TABLE Builder(
    ID_Builder INT NOT NULL PRIMARY KEY,
    ID_Manager INT NOT NULL,
    ID_Object INT NOT NULL,
    Hours INT NOT NULL,
    FOREIGN KEY (ID_Manager) REFERENCES Manager,
    FOREIGN KEY (ID_Object) REFERENCES Object
)

CREATE TABLE Accountant(
    ID_Accountant INT NOT NULL PRIMARY KEY,
    Casing INT NOT NULL
)

CREATE TABLE Salary(
    ID_Salary INT NOT NULL PRIMARY KEY,
    ID_Accountant INT NOT NULL,
    ID_Object INT NOT NULL,
    FOREIGN KEY (ID_Object) REFERENCES Object,
    FOREIGN KEY (ID_Accountant) REFERENCES Accountant
)

