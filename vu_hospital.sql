-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 03:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vu hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `epidemiological_data`
--

CREATE TABLE `epidemiological_data` (
  `Data_ID` int(11) NOT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Recorded_Date` date DEFAULT NULL,
  `Cases_Per_Thousand_People` int(11) DEFAULT NULL,
  `Aerial_ITN` varchar(50) DEFAULT NULL,
  `Average_Temperature` decimal(5,2) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility_type`
--

CREATE TABLE `facility_type` (
  `Facility_Type_ID` int(11) NOT NULL,
  `Type_Name` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Date_Updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geographical_location`
--

CREATE TABLE `geographical_location` (
  `Location_ID` int(11) NOT NULL,
  `Village` varchar(100) DEFAULT NULL,
  `Parish` varchar(100) DEFAULT NULL,
  `Sub_County` varchar(100) DEFAULT NULL,
  `County` varchar(100) DEFAULT NULL,
  `Region` varchar(100) DEFAULT NULL,
  `Population` int(11) DEFAULT NULL,
  `Coordinates` varchar(100) DEFAULT NULL,
  `Malaria_Risk_Level` varchar(50) DEFAULT NULL,
  `Health_Facilities_Count` int(11) DEFAULT NULL,
  `ITN_Coverage` decimal(5,2) DEFAULT NULL,
  `Reported_Cases` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_facility`
--

CREATE TABLE `health_facility` (
  `Facility_ID` int(11) NOT NULL,
  `Facility_Name` varchar(100) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Facility_Type_ID` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Contact_Details` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_tests`
--

CREATE TABLE `laboratory_tests` (
  `Test_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Test_Type` varchar(50) DEFAULT NULL,
  `Test_Result` varchar(50) DEFAULT NULL,
  `Test_Date` date DEFAULT NULL,
  `Technician_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_cases`
--

CREATE TABLE `malaria_cases` (
  `Case_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Type_of_Malaria` varchar(50) DEFAULT NULL,
  `Treatment_ID` int(11) DEFAULT NULL,
  `Outcome_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `Patient_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Next_of_Kin` varchar(50) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `Resource_ID` int(11) NOT NULL,
  `Resource_Name` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain`
--

CREATE TABLE `supply_chain` (
  `Supply_ID` int(11) NOT NULL,
  `Resource_ID` int(11) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Quantity_Shipped` int(11) DEFAULT NULL,
  `Shipment_Date` date DEFAULT NULL,
  `Expected_Arrival_Date` date DEFAULT NULL,
  `Shipped_By` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Treatment_Name` varchar(50) DEFAULT NULL,
  `Treatment_Description` text DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `Side_Effects` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_outcome`
--

CREATE TABLE `treatment_outcome` (
  `Outcome_ID` int(11) NOT NULL,
  `Outcome_Name` varchar(50) DEFAULT NULL,
  `Outcome_Description` text DEFAULT NULL,
  `Outcome_Date` date DEFAULT NULL,
  `Added_By` int(11) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Preferred_Name` varchar(50) DEFAULT NULL,
  `Role_ID` int(11) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `Role_ID` int(11) NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Role_Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_record`
--

CREATE TABLE `visit_record` (
  `Visit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  ADD PRIMARY KEY (`Data_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `facility_type`
--
ALTER TABLE `facility_type`
  ADD PRIMARY KEY (`Facility_Type_ID`);

--
-- Indexes for table `geographical_location`
--
ALTER TABLE `geographical_location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- Indexes for table `health_facility`
--
ALTER TABLE `health_facility`
  ADD PRIMARY KEY (`Facility_ID`),
  ADD KEY `Location_ID` (`Location_ID`),
  ADD KEY `Facility_Type_ID` (`Facility_Type_ID`);

--
-- Indexes for table `laboratory_tests`
--
ALTER TABLE `laboratory_tests`
  ADD PRIMARY KEY (`Test_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  ADD PRIMARY KEY (`Case_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Treatment_ID` (`Treatment_ID`),
  ADD KEY `Outcome_ID` (`Outcome_ID`);

--
-- Indexes for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`Resource_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `supply_chain`
--
ALTER TABLE `supply_chain`
  ADD PRIMARY KEY (`Supply_ID`),
  ADD KEY `Resource_ID` (`Resource_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`);

--
-- Indexes for table `treatment_outcome`
--
ALTER TABLE `treatment_outcome`
  ADD PRIMARY KEY (`Outcome_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Role_ID` (`Role_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `visit_record`
--
ALTER TABLE `visit_record`
  ADD PRIMARY KEY (`Visit_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  MODIFY `Data_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facility_type`
--
ALTER TABLE `facility_type`
  MODIFY `Facility_Type_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geographical_location`
--
ALTER TABLE `geographical_location`
  MODIFY `Location_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_facility`
--
ALTER TABLE `health_facility`
  MODIFY `Facility_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laboratory_tests`
--
ALTER TABLE `laboratory_tests`
  MODIFY `Test_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  MODIFY `Case_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_data`
--
ALTER TABLE `patient_data`
  MODIFY `Patient_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `Resource_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supply_chain`
--
ALTER TABLE `supply_chain`
  MODIFY `Supply_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `Treatment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatment_outcome`
--
ALTER TABLE `treatment_outcome`
  MODIFY `Outcome_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `Role_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_record`
--
ALTER TABLE `visit_record`
  MODIFY `Visit_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  ADD CONSTRAINT `epidemiological_data_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`);

--
-- Constraints for table `health_facility`
--
ALTER TABLE `health_facility`
  ADD CONSTRAINT `health_facility_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`),
  ADD CONSTRAINT `health_facility_ibfk_2` FOREIGN KEY (`Facility_Type_ID`) REFERENCES `facility_type` (`Facility_Type_ID`);

--
-- Constraints for table `laboratory_tests`
--
ALTER TABLE `laboratory_tests`
  ADD CONSTRAINT `laboratory_tests_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_data` (`Patient_ID`),
  ADD CONSTRAINT `laboratory_tests_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);

--
-- Constraints for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  ADD CONSTRAINT `malaria_cases_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_data` (`Patient_ID`),
  ADD CONSTRAINT `malaria_cases_ibfk_2` FOREIGN KEY (`Treatment_ID`) REFERENCES `treatment` (`Treatment_ID`),
  ADD CONSTRAINT `malaria_cases_ibfk_3` FOREIGN KEY (`Outcome_ID`) REFERENCES `treatment_outcome` (`Outcome_ID`);

--
-- Constraints for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD CONSTRAINT `patient_data_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);

--
-- Constraints for table `supply_chain`
--
ALTER TABLE `supply_chain`
  ADD CONSTRAINT `supply_chain_ibfk_1` FOREIGN KEY (`Resource_ID`) REFERENCES `resource` (`Resource_ID`),
  ADD CONSTRAINT `supply_chain_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `user_role` (`Role_ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);

--
-- Constraints for table `visit_record`
--
ALTER TABLE `visit_record`
  ADD CONSTRAINT `visit_record_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_data` (`Patient_ID`),
  ADD CONSTRAINT `visit_record_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
