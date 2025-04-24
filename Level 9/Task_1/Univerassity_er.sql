use er_diagram;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Office_Location VARCHAR(100)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Credits INT,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE TABLE Instructor (
    Instructor_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Office VARCHAR(100)
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    DOB DATE,
    Major VARCHAR(100)
);

CREATE TABLE Classroom (
    Room_ID INT PRIMARY KEY,
    Building VARCHAR(100),
    Capacity INT
);

CREATE TABLE Section (
    Section_ID INT PRIMARY KEY,
    Course_ID INT,
    Instructor_ID INT,
    Semester VARCHAR(20),
    Year INT,
    Room_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID),
    FOREIGN KEY (Room_ID) REFERENCES Classroom(Room_ID)
);

CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Section_ID INT,
    Grade VARCHAR(5),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Section_ID) REFERENCES Section(Section_ID)
);
