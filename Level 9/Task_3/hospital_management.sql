create database Hospital_Management;

use hospital_management ;

CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    username VARCHAR(50),
    password VARCHAR(100)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    role VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10),
    room_type VARCHAR(50),
    status VARCHAR(20) 
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(20),
    address TEXT,
    admit_date DATE,
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE Cashier (
    cashier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Bill (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    cashier_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(20), -- e.g. cash, card, online
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (cashier_id) REFERENCES Cashier(cashier_id)
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20), -- e.g. scheduled, completed, cancelled
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

show profiles;

