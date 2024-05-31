CREATE DATABASE dbsminorproject;

USE dbsminorproject;

-- TABLE 1
CREATE TABLE user (
	uid INT PRIMARY KEY,
    username VARCHAR(100),
    password VARCHAR(100),
    type VARCHAR(15)  -- (UserType : Pharmacist, Receptionist, Doctor)
);

-- TABLE 2
CREATE TABLE patient(
	patientno INT PRIMARY KEY,
    name VARCHAR(255),
    phone INT, -- can update this to 12 to add conutry code
    adress VARCHAR(255)
);

-- TABLE 3
CREATE TABLE doctor(
	doctorid VARCHAR(255) PRIMARY KEY, 
    dname VARCHAR(255),
    speciallization VARCHAR(255),
    qualification VARCHAR(255),
    channelfee INT,
    phone INT,
    roomno INT
);

-- TABLE 4
CREATE TABLE channel(
	channelno VARCHAR(10) PRIMARY KEY,
	doctorname VARCHAR(255),
    -- Foreign keys cannot exist without being linked to a primary key
    -- FOREIGN KEY (doctorname) REFERENCES doctor(dname),
    patientname VARCHAR(255),
    -- FOREIGN KEY (patientname) REFERENCES patient(name),
    roomno INT,
    date DATE
);

-- TABLE 5 : Pharmacist
CREATE TABLE item(
	itemid VARCHAR(255) PRIMARY KEY, -- Medicine ID
	itemname VARCHAR(255), -- Medicine Name 
	description VARCHAR(255),
    sellprice INT,
    buyprice INT,
    quantity INT
);

-- TABLE 6
CREATE TABLE prescription(
	prid VARCHAR(10) PRIMARY KEY,
	channelid VARCHAR(255),
    FOREIGN KEY (channelid) REFERENCES channel(channelno),
	doctorname VARCHAR(255),
	dstype VARCHAR(255),
	description VARCHAR(255)
);

-- TABLE 7
CREATE TABLE inventory(
	id INT PRIMARY KEY AUTO_INCREMENT,
	date DATE,
	subtotal INT,
	payamount INT,
	balance INT
);

-- TABLE 8
CREATE TABLE inventoryproduct(
	id INT PRIMARY KEY AUTO_INCREMENT,
    iid INT,
    FOREIGN KEY (iid) REFERENCES inventory(id),
    productid VARCHAR(11),
    sellprice INT,
    qty INT, 
    total INT
);


