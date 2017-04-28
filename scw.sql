-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2017 at 05:50 PM
-- Server version: 5.7.15-log
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scw`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `car_name` varchar(250) NOT NULL,
  `car_plate` varchar(10) NOT NULL,
  `car_model` int(10) NOT NULL,
  `car_company` varchar(200) NOT NULL,
  `car_odo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `user_id`, `car_name`, `car_plate`, `car_model`, `car_company`, `car_odo`) VALUES
(1, 1, '1', '1', 1, '1', 1),
(2, 1, '1', '1', 1, '1', 1),
(3, 1, '1', '2', 3, '4', 5),
(4, 1, '1', '1', 1, '1', 1),
(6, 1594025, 'Corola', 'USB3840', 2011, 'Toyota', 200),
(7, 1, 'Corola', 'USB3840', 2011, 'Toyota', 200),
(8, 1, 'Corola', 'USB3840', 2011, 'Toyota', 200),
(9, 1, 'Corola', 'USB3840', 2011, 'Toyota', 200);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL,
  `log_dateandtime` int(11) NOT NULL,
  `log_discription` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `main_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `reserve_date` varchar(100) NOT NULL,
  `main_datestart` int(11) NOT NULL,
  `main_status` int(11) NOT NULL,
  `main_dateend` int(11) NOT NULL,
  `main_timestart` int(11) NOT NULL,
  `main_type` varchar(20) NOT NULL,
  `main_comm` varchar(200) NOT NULL,
  `main_cost` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`main_id`, `user_id`, `car_id`, `reserve_date`, `main_datestart`, `main_status`, `main_dateend`, `main_timestart`, `main_type`, `main_comm`, `main_cost`) VALUES
(1111, 1594025, 1, '', 2017, 0, 2018, 8, 'Fixx', 'machine is damage sholde be changing another new one ... ', '5000$');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `user_nickname` varchar(200) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_type` int(10) NOT NULL,
  `user_mobile` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_nickname`, `user_name`, `user_password`, `user_email`, `user_type`, `user_mobile`) VALUES
(1, 'noon', 'noon', 'noon', '', 0, 0),
(1594025, 'Mr.7usoom', 'Hussam', '123123', 'mr.7usoom@hotmail.com', 123123, 559992215),
(1594026, 'noon', 'Anan', '12345678', 'ananqadi@gmail.com', 1, 502572023);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`main_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `main_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1112;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1594027;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
