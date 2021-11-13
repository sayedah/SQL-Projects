/*Sayeda Hussain 215427214 3421B Project 2*/

/*CREATE DATABASE ContactTracing;*/

CREATE TABLE Person (
  sin DECIMAL(9) PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(100),
  phone VARCHAR(12) NOT NULL );


CREATE TABLE Method (
  method VARCHAR(50) PRIMARY KEY );


CREATE TABLE Place (
  name VARCHAR(100) PRIMARY KEY,
  gps VARCHAR(100),
  description VARCHAR(300),
  address VARCHAR(300) NOT NULL );


CREATE TABLE TestType (
  testtype VARCHAR(100) PRIMARY KEY );


CREATE TABLE TimeSlot (
  time TIMESTAMP PRIMARY KEY );


CREATE TABLE Action (
  action VARCHAR(100) PRIMARY KEY );


CREATE TABLE TestCentre (
  centre VARCHAR(100) PRIMARY KEY,
  FOREIGN KEY (centre) REFERENCES Place );


CREATE TABLE Test (
  sin DECIMAL(9),
  time TIMESTAMP,
  testcentre VARCHAR(100),
  testtype VARCHAR(100),
  action VARCHAR(100),
  FOREIGN KEY (sin) REFERENCES Person,
  FOREIGN KEY (time) REFERENCES TimeSlot,
  FOREIGN KEY (testcentre) REFERENCES TestCentre,
  FOREIGN KEY (testtype) REFERENCES TestType,
  FOREIGN KEY (action) REFERENCES Action,
  PRIMARY KEY (sin, time) );


CREATE TABLE Offer (
  testtype VARCHAR(100),
  testcentre VARCHAR(100),
  FOREIGN KEY (testtype) REFERENCES TestType,
  FOREIGN KEY (testcentre) REFERENCES TestCentre,
  PRIMARY KEY (testtype, testcentre) );



CREATE TABLE Bubble (
  idOne DECIMAL(9),
  idTwo DECIMAL(9),
  FOREIGN KEY (idOne) REFERENCES Person,
  FOREIGN KEY (idTwo) REFERENCES Person,
  PRIMARY KEY(idOne, idTwo) );


CREATE TABLE Recon (
  sin DECIMAL(9),
  placename VARCHAR(100),
  time TIMESTAMP,
  method VARCHAR(50),
  FOREIGN KEY (sin) REFERENCES Person,
  FOREIGN KEY (placename) REFERENCES Place,
  FOREIGN KEY (time) REFERENCES TimeSlot,
  FOREIGN KEY (method) REFERENCES Method,
  PRIMARY KEY (sin, placename, time, method) );
