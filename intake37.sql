-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2023 at 11:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intake37`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `Dname` varchar(50) DEFAULT NULL,
  `Dnum` int(10) NOT NULL DEFAULT 0,
  `MGRSSN` int(10) DEFAULT NULL,
  `MGRStart Date` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`Dname`, `Dnum`, `MGRSSN`, `MGRStart Date`) VALUES
('DP1', 10, 223344, '2004-12-31 22:00:00.000000'),
('DP2', 20, 555555, '2006-01-02 22:00:00.000000'),
('DP3', 30, 512463, '2006-01-05 22:00:00.000000'),
('DEPT IT', 100, 968574, '2006-12-07 22:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `ESSN` int(10) NOT NULL DEFAULT 0,
  `Dependent_name` varchar(100) NOT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Bdate` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `SSN` int(10) NOT NULL DEFAULT 0,
  `Bdate` timestamp(6) NULL DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `Salary` int(10) DEFAULT NULL,
  `Superssn` int(10) DEFAULT NULL,
  `Dno` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Fname`, `Lname`, `SSN`, `Bdate`, `Address`, `gender`, `Salary`, `Superssn`, `Dno`) VALUES
('Ahmed', 'Ali', 112233, '0000-00-00 00:00:00.000000', '15 Ali fahmy St.Giza', 'M', 1300, 666666, 10),
('Hanaa', 'Sobhy', 123456, '1973-03-17 22:00:00.000000', '38 Abdel Khalik Tharwat St. Downtown.Cairo', 'F', 800, 666666, 10),
('Amr', 'Omran', 321654, '0000-00-00 00:00:00.000000', '44 Hilopolis.Cairo', 'M', 2500, NULL, NULL),
('Edward', 'Hanna', 512463, '1972-08-18 21:00:00.000000', '18 Abaas El 3akaad St. Nasr City.Cairo', 'M', 1500, 321654, 30),
('Maged', 'Raoof', 521634, '1980-06-03 21:00:00.000000', '18 Kholosi st.Shobra.Cairo', 'M', 1000, 968574, 30),
('Osama', 'Mohamed', 555555, '2000-02-29 22:00:00.000000', 'Alexandria - Bab Sharqi', 'M', NULL, 666666, 30),
('Ahmed', 'Mohamed', 666666, '2000-02-29 22:00:00.000000', 'Alexandria - Bab Sharqi', 'M', 4800, NULL, 30),
('Mariam', 'Adel', 669955, '1982-12-05 22:00:00.000000', '269 El-Haram st. Giza', 'F', 750, 512463, 20),
('Noha', 'Mohamed', 968574, '1975-01-01 22:00:00.000000', '55 Orabi St. El Mohandiseen .Cairo', 'F', 1600, 321654, 20);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Pname` varchar(50) DEFAULT NULL,
  `Pnumber` int(10) NOT NULL DEFAULT 0,
  `Plocation` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Dnum` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`Pname`, `Pnumber`, `Plocation`, `City`, `Dnum`) VALUES
('AL Solimaniah', 100, 'Cairo_Alex Road', 'Alex', 10),
('Al Rabwah', 200, '6th of October City', 'Giza', 10),
('Al Rawdah', 300, 'Zaied City', 'Giza', 10),
('Al Rowad', 400, 'Cairo_Faiyom Road', 'Giza', 20),
('Al Rehab', 500, 'Nasr City', 'Cairo', 30),
('Pitcho american', 600, 'Maady', 'Cairo', 30),
('Ebad El Rahman', 700, 'Ring Road', 'Cairo', 20);

-- --------------------------------------------------------

--
-- Table structure for table `works_for`
--

CREATE TABLE `works_for` (
  `ESSn` int(10) NOT NULL DEFAULT 0,
  `Pno` int(10) NOT NULL DEFAULT 0,
  `Hours` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `works_for`
--

INSERT INTO `works_for` (`ESSn`, `Pno`, `Hours`) VALUES
(112233, 100, 40),
(512463, 500, 10),
(512463, 600, 25),
(521634, 300, 6),
(521634, 400, 4),
(521634, 500, 10),
(521634, 600, 20),
(669955, 300, 10),
(669955, 400, 20),
(669955, 700, 7),
(968574, 300, 10),
(968574, 400, 15),
(968574, 700, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Dnum`),
  ADD UNIQUE KEY `EmployeeDepartments` (`MGRSSN`),
  ADD UNIQUE KEY `MGRSSN` (`MGRSSN`),
  ADD KEY `Dnum` (`Dnum`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD KEY `emp_fk` (`ESSN`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `DepartmentsEmployee` (`Dno`),
  ADD KEY `EmployeeEmployee` (`Superssn`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Pnumber`),
  ADD KEY `DepartmentsProject` (`Dnum`),
  ADD KEY `Dnum` (`Dnum`);

--
-- Indexes for table `works_for`
--
ALTER TABLE `works_for`
  ADD PRIMARY KEY (`ESSn`,`Pno`),
  ADD KEY `EmployeeWorks_for` (`ESSn`),
  ADD KEY `ProjectWorks_for` (`Pno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `emp_fk` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `emp_dept_fk` FOREIGN KEY (`Dno`) REFERENCES `departments` (`Dnum`),
  ADD CONSTRAINT `emp_supssn_fk` FOREIGN KEY (`Superssn`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `works_for`
--
ALTER TABLE `works_for`
  ADD CONSTRAINT `emp_proj_essn_fk` FOREIGN KEY (`ESSn`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `emp_proj_pno_fk` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
