-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2024 at 08:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mayar_sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'Chemistry Department'),
(2, 'Microbiology Department'),
(3, 'Immunology Department'),
(4, 'Hematology Department'),
(5, 'Pathology Department');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_name`) VALUES
(1, 'Main Laboratory'),
(2, 'Secondary Laboratory'),
(3, 'Immunology Lab'),
(4, 'Microbiology Lab'),
(5, 'Chemistry Lab');

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

CREATE TABLE `recipients` (
  `recipient_id` int(11) NOT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`recipient_id`, `recipient_name`, `phone_number`) VALUES
(101, 'Ahmed', '0501234567'),
(102, 'Mohamed', '0502345678'),
(103, 'Ali', '0503456789'),
(104, 'Fatima', '0504567890'),
(105, 'Sara', '0505678901');

-- --------------------------------------------------------

--
-- Table structure for table `samples`
--

CREATE TABLE `samples` (
  `sample_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `samples`
--

INSERT INTO `samples` (`sample_id`, `description`) VALUES
(111, 'Blood Sample'),
(112, 'Urine Sample'),
(113, 'Saliva Sample'),
(114, 'Tissue Sample'),
(115, 'Sputum Sample');

-- --------------------------------------------------------

--
-- Table structure for table `sample_tracking2`
--

CREATE TABLE `sample_tracking2` (
  `tracking_id` int(11) NOT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `process_date` datetime DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sample_tracking2`
--

INSERT INTO `sample_tracking2` (`tracking_id`, `sample_id`, `recipient_id`, `department_id`, `location_id`, `status_id`, `process_date`, `department_name`, `location_name`, `status_name`) VALUES
(1, 111, 101, 1, 1, 1, '2024-10-31 08:30:00', 'Chemistry Department', 'Main Laboratory', 'Pending'),
(2, 111, 102, 2, 2, 2, '2024-10-31 11:00:00', 'Microbiology Department', 'Secondary Laboratory', 'In Progress'),
(3, 111, 103, 1, 1, 1, '2024-10-31 12:30:00', 'Chemistry Department', 'Main Laboratory', 'Pending'),
(4, 111, 104, 2, 2, 3, '2024-10-31 14:00:00', 'Microbiology Department', 'Secondary Laboratory', 'Complete'),
(5, 111, 105, 1, 1, 3, '2024-10-31 15:30:00', 'Chemistry Department', 'Main Laboratory', 'Complete'),
(6, 20, 102, 3, 2, 2, '2024-11-03 09:37:00', NULL, NULL, NULL),
(7, 14, 104, 2, 3, 2, '2024-11-03 09:38:00', NULL, NULL, NULL),
(8, 14, 103, 3, 3, 2, '2024-11-03 09:39:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`status_id`, `status_name`) VALUES
(1, 'Pending'),
(2, 'In Progress'),
(3, 'Complete');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `samples`
--
ALTER TABLE `samples`
  ADD PRIMARY KEY (`sample_id`);

--
-- Indexes for table `sample_tracking2`
--
ALTER TABLE `sample_tracking2`
  ADD PRIMARY KEY (`tracking_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sample_tracking2`
--
ALTER TABLE `sample_tracking2`
  MODIFY `tracking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sample_tracking2`
--
ALTER TABLE `sample_tracking2`
  ADD CONSTRAINT `sample_tracking2_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `recipients` (`recipient_id`),
  ADD CONSTRAINT `sample_tracking2_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `sample_tracking2_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `sample_tracking2_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
