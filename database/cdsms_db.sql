-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2021 at 08:54 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdsms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `enrollee_list`
--

CREATE TABLE `enrollee_list` (
  `id` int(30) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `package_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `start_date` date NOT NULL,
  `time` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0= pending,1=verified,2=in session, 3=completed,4 = cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollee_list`
--

INSERT INTO `enrollee_list` (`id`, `reg_no`, `package_id`, `cost`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `email`, `contact`, `address`, `start_date`, `time`, `status`, `date_created`, `date_updated`) VALUES
(1, '2021120001', 1, 5200, 'Vikash', 'D', 'Kumar', 'Male', '2002-06-23', 'vikash@gmail.com', '0912456789', 'Coconut Street, Electronic City, Bangalore, 560100', '2024-12-06', '10:00 AM - 11:30 AM', 3, '2024-12-03 13:43:46', '2024-12-03 15:00:39'),
(2, '2021120002', 2, 5200, 'Aashish', 'C', 'Dhamala', 'Female', '2001-10-14', 'aashish@gmail.com', '09123456789', 'kaikondralhi, Bangalore, 560035', '2024-12-08', '08:00 AM - 09:30 AM', 0, '2024-12-03 13:45:25', '2024-12-03 13:45:40'),
(3, '2021120003', 1, 5200, 'Sahil', 'Z', 'Patel', 'Male', '2000-07-15', 'patel@gmail.com', '097894565412', 'shivaji nagar, Bangalore, 560054', '2024-12-06', '10:00 AM - 11:30 AM', 2, '2024-12-03 13:46:32', '2024-12-03 15:32:25'),
(5, '2021120004', 2, 5200, 'Yuraj', 'C', 'Kumar', 'Male', '2002-10-07', 'yuraj@gmail.com', '0987986654', 'RT Nagar, Bangalore, 560023', '2024-12-04', '02:00 PM - 03:30 PM', 1, '2024-12-03 13:53:04', '2024-12-03 15:31:54'),
(6, '2021120005', 2, 5200, 'Derick', 'C', 'Christi', 'Male', '2003-06-23', 'christi@gmail.com', '09123456789', 'Sarajapura, Bangalore, 560034, 2306', '2024-12-06', '12:00 PM - 01:30 PM', 0, '2024-12-09 15:52:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_list`
--

CREATE TABLE `package_list` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `training_duration` varchar(100) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_list`
--

INSERT INTO `package_list` (`id`, `name`, `description`, `training_duration`, `cost`, `status`, `date_created`) VALUES
(1, 'Automatic Car Training', 'This package is a sample car training package for automatic  transmission.', '30 Days', 5200, 1, '2024-12-03 09:37:17'),
(2, 'Manual Car Training', 'This is a sample car driving training package for manual transmission.', '25 Days', 5200, 1, '2024-12-03 09:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `payment_list`
--

CREATE TABLE `payment_list` (
  `id` int(30) NOT NULL,
  `enrollee_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_list`
--

INSERT INTO `payment_list` (`id`, `enrollee_id`, `amount`, `remarks`, `date_created`) VALUES
(1, 1, 1200, 'First Payment', '2024-12-03 14:47:31'),
(3, 1, 1000, 'Sample', '2024-12-03 15:00:33'),
(4, 1, 3000, 'Sample Completed Payment', '2024-12-03 15:00:52'),
(6, 5, 1500, 'Sample', '2024-12-03 15:32:16'),
(7, 3, 1200, 'Learning', '2024-12-03 15:32:32'),
(8, 3, 800, 'Registration', '2024-12-03 15:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Car Driving School Management System - BTI'),
(6, 'short_name', 'CDSMS - BTI'),
(11, 'logo', 'uploads/logo-1638498556.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1638495217.png'),
(15, 'content', 'Array'),
(16, 'email', 'vikash@gmail.com'),
(17, 'contact', '7406028756 / 7829543096'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'Coconut Street, Electronic City, Bangalore, 560100');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Vikash', NULL, 'Kumar', 'vikash', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, 1, '2021-01-20 14:02:37', '2021-11-27 13:39:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enrollee_list`
--
ALTER TABLE `enrollee_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `package_list`
--
ALTER TABLE `package_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_list`
--
ALTER TABLE `payment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enrollee_list`
--
ALTER TABLE `enrollee_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_list`
--
ALTER TABLE `package_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_list`
--
ALTER TABLE `payment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollee_list`
--
ALTER TABLE `enrollee_list`
  ADD CONSTRAINT `enrollee_list_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
