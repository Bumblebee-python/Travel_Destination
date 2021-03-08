-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 07:34 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelduniyadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agency_mst`
--

CREATE TABLE `tbl_agency_mst` (
  `agency_id` int(5) NOT NULL,
  `agency_name` varchar(40) NOT NULL,
  `agency_password` varchar(15) NOT NULL,
  `agency_price` decimal(15,2) NOT NULL,
  `agency_email` varchar(30) NOT NULL,
  `agency_contact` varchar(15) NOT NULL,
  `agency_address` varchar(100) NOT NULL,
  `agency_guides` int(3) NOT NULL,
  `agency_guides_avail` tinyint(1) NOT NULL,
  `state_id` int(5) NOT NULL,
  `city_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_agency_mst`
--

INSERT INTO `tbl_agency_mst` (`agency_id`, `agency_name`, `agency_password`, `agency_price`, `agency_email`, `agency_contact`, `agency_address`, `agency_guides`, `agency_guides_avail`, `state_id`, `city_id`) VALUES
(1, 'Just4u Tours & Travels Pvt Ltd', 'just4u123', '50000.00', 'just4u@gmail.com', '08440000888', 'Shop No 128, 1st Floor District Centre, Jawahar Nagar Main Road, Jawahar Nagar, Kota, Rajasthan 3240', 32, 1, 1, 1),
(2, 'GET SET GO TRAVELS', 'get123', '70000.00', 'getsetgo@gmail.com', '09246814399', 'Waltair Station Approach Road, Telugu Talli Flyover Opposit to DRM Office,, AT Lobby Level Hotel Aks', 12, 1, 2, 2),
(3, 'Cozy Tour & Travels', 'cozy123', '35000.00', 'cozytour@gmail.com', '08448444094', '31, Tayebullah Campus, Tayabulla Rd, Dighalipukhuri, Guwahati, Assam 781001', 10, 0, 3, 3),
(4, 'Goa Tours & Travels', 'goa123', '13000.00', 'goatours@gmail.com', '08322904223', 'Shop No 5, Crisabol Plaza, Bharat Petrol Pump, Nr. KTC Bus Stand, Panaji, Goa 403001', 14, 1, 4, 4),
(5, 'Shirgul Travels Co Shimla', 'shirgul123', '48000.00', 'shirgultravels@gamil.com', '09816765577', 'Manali, Road, near Hotel Moon Light , Power House, Totu, Shimla, Himachal Pradesh 171011', 50, 1, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_mst`
--

CREATE TABLE `tbl_booking_mst` (
  `booking_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `hotel_id` int(5) NOT NULL,
  `agency_id` int(5) NOT NULL,
  `package_id` int(5) NOT NULL,
  `booking_date` date NOT NULL,
  `state_id` int(5) NOT NULL,
  `city_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `city_id` int(5) NOT NULL,
  `city_name` varchar(20) NOT NULL,
  `state_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`city_id`, `city_name`, `state_id`) VALUES
(1, 'Kota', 1),
(2, 'Visakhapatnam', 2),
(3, 'Guwahati', 3),
(4, 'Panaji', 4),
(5, 'Dehradun', 10),
(6, 'Shimla', 5),
(7, 'Thiruvananthapuram', 6),
(8, 'Shillong', 7),
(9, 'Ludhiana', 8),
(10, 'Chennai', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint_mst`
--

CREATE TABLE `tbl_complaint_mst` (
  `complaint_id` int(5) NOT NULL,
  `complaint_detail` text NOT NULL,
  `complaint_status` tinyint(1) NOT NULL,
  `booking_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback_mst`
--

CREATE TABLE `tbl_feedback_mst` (
  `feedback_id` int(5) NOT NULL,
  `feedback_detail` text NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel_mst`
--

CREATE TABLE `tbl_hotel_mst` (
  `hotel_id` int(5) NOT NULL,
  `hotel_name` varchar(20) NOT NULL,
  `hotel_password` varchar(15) NOT NULL,
  `hotel_price` decimal(15,2) NOT NULL,
  `hotel_email` varchar(30) NOT NULL,
  `hotel_contact` varchar(15) NOT NULL,
  `hotel_address` varchar(50) NOT NULL,
  `hotel_rooms_avail` tinyint(1) NOT NULL,
  `state_id` int(5) NOT NULL,
  `city_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package_mst`
--

CREATE TABLE `tbl_package_mst` (
  `package_id` int(5) NOT NULL,
  `pacakge_price` decimal(15,2) NOT NULL,
  `hotel_id` int(5) NOT NULL,
  `agency_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_mst`
--

CREATE TABLE `tbl_payment_mst` (
  `payment_id` int(5) NOT NULL,
  `payment_amount` double(15,2) NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `booking_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `state_id` int(5) NOT NULL,
  `state_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`state_id`, `state_name`) VALUES
(1, 'Rajasthan'),
(2, 'Andhra Pradesh'),
(3, 'Assam'),
(4, 'Goa'),
(5, 'Himachal Pradesh'),
(6, 'Kerala'),
(7, 'Meghalaya'),
(8, 'Punjab'),
(9, 'Tamil Nadu'),
(10, 'Uttarakhand');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_mst`
--

CREATE TABLE `tbl_user_mst` (
  `user_id` int(5) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_contact` varchar(15) NOT NULL,
  `user_password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user_mst`
--

INSERT INTO `tbl_user_mst` (`user_id`, `user_type`, `user_name`, `user_email`, `user_contact`, `user_password`) VALUES
(1, 'admin', 'TravelduniyaAdmin', 'travelduniya@gmail.com', '9998887776', 'travel123'),
(2, 'traveller', 'Vinay Vincent', 'vinayvincent@gmail.com', '8887776665', 'vinay123'),
(3, 'traveller', 'Yash Kain', 'yashkain@gmail.com', '7776665554', 'yash123'),
(4, 'traveller', 'Stanly Minj', 'stanlyminj@gmail.com', '9997775554', 'stanly123'),
(5, 'traveller', 'Bijesh Thomas', 'bijeshthomas@gmail.com', '8886664442', 'bijesh123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_agency_mst`
--
ALTER TABLE `tbl_agency_mst`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `tbl_booking_mst`
--
ALTER TABLE `tbl_booking_mst`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `traveller_id` (`user_id`,`hotel_id`,`agency_id`,`package_id`,`state_id`,`city_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `tbl_complaint_mst`
--
ALTER TABLE `tbl_complaint_mst`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `booking_id` (`booking_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_feedback_mst`
--
ALTER TABLE `tbl_feedback_mst`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `traveller_id` (`user_id`);

--
-- Indexes for table `tbl_hotel_mst`
--
ALTER TABLE `tbl_hotel_mst`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `tbl_package_mst`
--
ALTER TABLE `tbl_package_mst`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `hotel_id` (`hotel_id`,`agency_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `tbl_user_mst`
--
ALTER TABLE `tbl_user_mst`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_agency_mst`
--
ALTER TABLE `tbl_agency_mst`
  MODIFY `agency_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_booking_mst`
--
ALTER TABLE `tbl_booking_mst`
  MODIFY `booking_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `city_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_complaint_mst`
--
ALTER TABLE `tbl_complaint_mst`
  MODIFY `complaint_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_feedback_mst`
--
ALTER TABLE `tbl_feedback_mst`
  MODIFY `feedback_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_hotel_mst`
--
ALTER TABLE `tbl_hotel_mst`
  MODIFY `hotel_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_package_mst`
--
ALTER TABLE `tbl_package_mst`
  MODIFY `package_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  MODIFY `payment_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `state_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_user_mst`
--
ALTER TABLE `tbl_user_mst`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_agency_mst`
--
ALTER TABLE `tbl_agency_mst`
  ADD CONSTRAINT `tbl_agency_mst_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`state_id`),
  ADD CONSTRAINT `tbl_agency_mst_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `tbl_city` (`city_id`);

--
-- Constraints for table `tbl_booking_mst`
--
ALTER TABLE `tbl_booking_mst`
  ADD CONSTRAINT `tbl_booking_mst_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`),
  ADD CONSTRAINT `tbl_booking_mst_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel_mst` (`hotel_id`),
  ADD CONSTRAINT `tbl_booking_mst_ibfk_3` FOREIGN KEY (`agency_id`) REFERENCES `tbl_agency_mst` (`agency_id`),
  ADD CONSTRAINT `tbl_booking_mst_ibfk_4` FOREIGN KEY (`package_id`) REFERENCES `tbl_package_mst` (`package_id`),
  ADD CONSTRAINT `tbl_booking_mst_ibfk_5` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`state_id`),
  ADD CONSTRAINT `tbl_booking_mst_ibfk_6` FOREIGN KEY (`city_id`) REFERENCES `tbl_city` (`city_id`);

--
-- Constraints for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD CONSTRAINT `tbl_city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`state_id`);

--
-- Constraints for table `tbl_complaint_mst`
--
ALTER TABLE `tbl_complaint_mst`
  ADD CONSTRAINT `tbl_complaint_mst_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `tbl_booking_mst` (`booking_id`),
  ADD CONSTRAINT `tbl_complaint_mst_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`);

--
-- Constraints for table `tbl_feedback_mst`
--
ALTER TABLE `tbl_feedback_mst`
  ADD CONSTRAINT `tbl_feedback_mst_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`);

--
-- Constraints for table `tbl_hotel_mst`
--
ALTER TABLE `tbl_hotel_mst`
  ADD CONSTRAINT `tbl_hotel_mst_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `tbl_state` (`state_id`),
  ADD CONSTRAINT `tbl_hotel_mst_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `tbl_city` (`city_id`);

--
-- Constraints for table `tbl_package_mst`
--
ALTER TABLE `tbl_package_mst`
  ADD CONSTRAINT `tbl_package_mst_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel_mst` (`hotel_id`),
  ADD CONSTRAINT `tbl_package_mst_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `tbl_agency_mst` (`agency_id`);

--
-- Constraints for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  ADD CONSTRAINT `tbl_payment_mst_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `tbl_booking_mst` (`booking_id`),
  ADD CONSTRAINT `tbl_payment_mst_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_mst` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
