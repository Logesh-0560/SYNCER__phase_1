INSERT INTO Admin (name, email, phone, username, password) VALUES
('John Smith', 'john@hospital.com', '9876543210', 'john_admin', 'pass123'),
('Alice Brown', 'alice@hospital.com', '9876543211', 'alice_admin', 'pass456');

INSERT INTO Doctor (name, specialization, phone, email, admin_id) VALUES
('Dr. Rajesh Khanna', 'Cardiologist', '9988776655', 'rajesh@hospital.com', 1),
('Dr. Meena Patel', 'Dermatologist', '9988776644', 'meena@hospital.com', 1),
('Dr. Vivek Rao', 'Orthopedic', '9988776633', 'vivek@hospital.com', 2);

INSERT INTO Staff (name, role, phone, email, admin_id) VALUES
('Ravi Kumar', 'Nurse', '9876512345', 'ravi@hospital.com', 1),
('Sneha Jain', 'Receptionist', '9876512346', 'sneha@hospital.com', 2);

INSERT INTO Room (room_number, room_type, status) VALUES
('101A', 'General', 'occupied'),
('102B', 'ICU', 'available'),
('103C', 'Private', 'occupied');

INSERT INTO Patient (name, gender, age, phone, address, admit_date, room_id) VALUES
('Anil Kapoor', 'Male', 60, '9876500001', 'Mumbai', '2025-04-01', 1),
('Priya Singh', 'Female', 30, '9876500002', 'Delhi', '2025-04-03', 3);

INSERT INTO Cashier (name, phone, email) VALUES
('Manoj Tiwari', '9876500111', 'manoj@hospital.com'),
('Seema Verma', '9876500222', 'seema@hospital.com');

INSERT INTO Bill (patient_id, cashier_id, amount, payment_date, payment_mode) VALUES
(1, 1, 15000.00, '2025-04-02', 'cash'),
(2, 2, 22000.00, '2025-04-04', 'card');

INSERT INTO Appointment (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2025-04-01', 'completed'),
(2, 2, '2025-04-05', 'scheduled'),
(2, 3, '2025-04-07', 'cancelled');

