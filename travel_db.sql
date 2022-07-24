-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 04:43 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_db`
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

--
-- Dumping data for table `tbl_booking_mst`
--

INSERT INTO `tbl_booking_mst` (`booking_id`, `user_id`, `hotel_id`, `agency_id`, `package_id`, `booking_date`, `state_id`, `city_id`) VALUES
(1, 2, 1, 1, 1, '2021-02-10', 1, 1),
(2, 3, 2, 2, 2, '2021-03-24', 2, 2),
(3, 4, 3, 3, 3, '2021-03-01', 3, 3),
(4, 5, 4, 4, 4, '2021-02-08', 4, 4),
(5, 2, 5, 5, 5, '2021-03-11', 5, 5);

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

--
-- Dumping data for table `tbl_complaint_mst`
--

INSERT INTO `tbl_complaint_mst` (`complaint_id`, `complaint_detail`, `complaint_status`, `booking_id`, `user_id`) VALUES
(1, 'No complaint.', 1, 1, 2),
(2, 'Hotel not up to the mark.', 1, 2, 2),
(3, 'Hotel was not as good as expected. Bed was shown as a double bed but there was just a single bed. Bathroom was also not well sanitized.', 0, 3, 3),
(4, 'Not happy with payment gateway.', 0, 4, 4),
(5, 'No complaint.', 1, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback_mst`
--

CREATE TABLE `tbl_feedback_mst` (
  `feedback_id` int(5) NOT NULL,
  `feedback_detail` text NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedback_mst`
--

INSERT INTO `tbl_feedback_mst` (`feedback_id`, `feedback_detail`, `user_id`) VALUES
(1, 'Very interesting and unique way to travel through this website.', 2),
(2, 'Great experience.', 2),
(3, 'No feedback.', 3),
(4, 'Happy with the service.', 4),
(5, 'Amazing. Just what i wanted form a travel destination booking system.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel_booking`
--

CREATE TABLE `tbl_hotel_booking` (
  `hotel_booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_name` varchar(50) NOT NULL,
  `booking_mobile` bigint(20) NOT NULL,
  `no_person` int(11) NOT NULL,
  `checkin_date` varchar(50) NOT NULL,
  `checkin_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_hotel_booking`
--

INSERT INTO `tbl_hotel_booking` (`hotel_booking_id`, `room_id`, `user_id`, `booking_name`, `booking_mobile`, `no_person`, `checkin_date`, `checkin_time`) VALUES
(1, 4, 0, 'A', 123456, 10, '0001-01-01', '01:01');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel_mst`
--

CREATE TABLE `tbl_hotel_mst` (
  `hotel_id` int(5) NOT NULL,
  `hotel_name` varchar(40) NOT NULL,
  `hotel_password` varchar(15) NOT NULL,
  `hotel_email` varchar(30) NOT NULL,
  `hotel_contact` varchar(15) NOT NULL,
  `hotel_address` varchar(100) NOT NULL,
  `hotel_rooms_avail` varchar(4) NOT NULL,
  `state_id` int(5) NOT NULL,
  `city_id` int(5) NOT NULL,
  `hotel_img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_hotel_mst`
--

INSERT INTO `tbl_hotel_mst` (`hotel_id`, `hotel_name`, `hotel_password`, `hotel_email`, `hotel_contact`, `hotel_address`, `hotel_rooms_avail`, `state_id`, `city_id`, `hotel_img`) VALUES
(1, 'Hotel Bharat', 'bharat123', 'hotelbharat@gmail.com', '07442391583', '17-D, Gumanpura, Kota, Rajasthan 324007', '1', 1, 1, '1.jpg'),
(2, 'Capital O 11626 B Square', 'capital123', 'caitalbsquare@gmail.com', '07482391383', 'Hotel BSquare Beside Maddilapalem Petrol Bunk Beside Maddilapalem Petrol Bunk, Andhra Pradesh 530013', '0', 2, 2, '2.jpg'),
(3, 'Hotel Galaxy Inn', 'galaxy123', 'hotelgalaxy@gmail.com', '09435015925', 'Sainik Bhawan, Opp, Rajgarh Rd, Guwahati, Assam 781007', '1', 3, 3, '3.jpg'),
(4, 'Campal Beach Resort', 'champal123', 'champal@gmail.com', '08322463027', 'D.B.Bandodkar Marg, Opposite Swimming Pool, Near Bal Bhavan, Campal, Panaji, Goa 403001', '1', 4, 4, '4.jpg'),
(5, 'HOTEL HILLTOP COURTYARD', 'hilltop123', 'hotelhilltop@gmail.com', '07042828303', 'Apple Garden, near SSb Gate &, Basant Vihar, Kasumpti, Shimla, Himachal Pradesh 171009', '1', 5, 5, '5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package_booking`
--

CREATE TABLE `tbl_package_booking` (
  `package_booking_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_name` varchar(50) NOT NULL,
  `booking_mobile` bigint(20) NOT NULL,
  `booking_address` varchar(200) NOT NULL,
  `no_person` int(11) NOT NULL,
  `travel_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_package_booking`
--

INSERT INTO `tbl_package_booking` (`package_booking_id`, `package_id`, `user_id`, `booking_name`, `booking_mobile`, `booking_address`, `no_person`, `travel_date`) VALUES
(1, 3, 1, 'Akash', 9898123456, 'Paldi', 5, '2021-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package_mst`
--

CREATE TABLE `tbl_package_mst` (
  `package_id` int(5) NOT NULL,
  `packgae_name` text NOT NULL,
  `pacakge_price` decimal(15,2) NOT NULL,
  `hotel_id` int(5) NOT NULL,
  `agency_id` int(5) NOT NULL,
  `packgae_details` text NOT NULL,
  `packgae_image` varchar(50) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_package_mst`
--

INSERT INTO `tbl_package_mst` (`package_id`, `packgae_name`, `pacakge_price`, `hotel_id`, `agency_id`, `packgae_details`, `packgae_image`, `state_id`) VALUES
(1, 'Goa - South Goa Sightseeing', '51583.00', 1, 1, 'For several hundred years, Hindu dynasties held power over Goa including the Satavahanas of Kolhapur (a city in one of modern Goa’s neighbouring states, Maharashtra) and the Chalukyas of Badami (in Karnataka, another one of modern Goa’s neighbours).  In 1312 the Muslims took over but their reign was brief and was superseded by the Vijayanagar in 1370, who used Goa, with its natural harbours, as an important landing site for ships bringing Arabian horses for their cavalry.', 'goa.jpg', 4),
(2, 'DEHRADUN TRIP', '72035.00', 2, 2, '', 'deharadun.jpg', 10),
(3, 'Goa - 4N/5D', '36960.00', 3, 3, 'For several hundred years, Hindu dynasties held power over Goa including the Satavahanas of Kolhapur (a city in one of modern Goa’s neighbouring states, Maharashtra) and the Chalukyas of Badami (in Karnataka, another one of modern Goa’s neighbours).  In 1312 the Muslims took over but their reign was brief and was superseded by the Vijayanagar in 1370, who used Goa, with its natural harbours, as an important landing site for ships bringing Arabian horses for their cavalry.', 'goa.jpg', 4),
(4, 'Soulful Rajasthan', '14344.00', 4, 4, '', 'rajsthan.jpg', 1),
(5, 'Scenic Himachal', '48999.00', 5, 5, '', 'himachal.jpeg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_mst`
--

CREATE TABLE `tbl_payment_mst` (
  `payment_id` int(5) NOT NULL,
  `payment_amount` double(15,2) NOT NULL,
  `payment_mode` varchar(12) NOT NULL,
  `booking_id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payment_mst`
--

INSERT INTO `tbl_payment_mst` (`payment_id`, `payment_amount`, `payment_mode`, `booking_id`, `user_id`) VALUES
(1, 51583.00, 'debit card', 1, 2),
(2, 72035.00, 'debit card', 2, 3),
(3, 36960.00, 'UPI', 3, 4),
(4, 14344.00, 'credit card', 4, 5),
(5, 48999.00, 'debit card', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rooms`
--

CREATE TABLE `tbl_rooms` (
  `room_id` int(5) NOT NULL,
  `room_type` varchar(15) NOT NULL,
  `hotel_id` int(5) NOT NULL,
  `room_price` decimal(15,2) NOT NULL,
  `room_img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rooms`
--

INSERT INTO `tbl_rooms` (`room_id`, `room_type`, `hotel_id`, `room_price`, `room_img`) VALUES
(1, 'Deluxe', 1, '1589.00', '1.jpg'),
(2, 'Suite', 1, '1193.00', '2.jpg'),
(3, 'Classic', 1, '1189.00', '3.jpg'),
(4, 'Classic', 2, '2035.00', '4.jpg'),
(5, 'Deluxe', 2, '2595.00', '5.jpg');

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
-- Indexes for table `tbl_hotel_booking`
--
ALTER TABLE `tbl_hotel_booking`
  ADD PRIMARY KEY (`hotel_booking_id`);

--
-- Indexes for table `tbl_hotel_mst`
--
ALTER TABLE `tbl_hotel_mst`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `tbl_package_booking`
--
ALTER TABLE `tbl_package_booking`
  ADD PRIMARY KEY (`package_booking_id`);

--
-- Indexes for table `tbl_package_mst`
--
ALTER TABLE `tbl_package_mst`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_rooms`
--
ALTER TABLE `tbl_rooms`
  ADD PRIMARY KEY (`room_id`);

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
  MODIFY `booking_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `city_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_complaint_mst`
--
ALTER TABLE `tbl_complaint_mst`
  MODIFY `complaint_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_feedback_mst`
--
ALTER TABLE `tbl_feedback_mst`
  MODIFY `feedback_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_hotel_booking`
--
ALTER TABLE `tbl_hotel_booking`
  MODIFY `hotel_booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_hotel_mst`
--
ALTER TABLE `tbl_hotel_mst`
  MODIFY `hotel_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_package_booking`
--
ALTER TABLE `tbl_package_booking`
  MODIFY `package_booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_package_mst`
--
ALTER TABLE `tbl_package_mst`
  MODIFY `package_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_payment_mst`
--
ALTER TABLE `tbl_payment_mst`
  MODIFY `payment_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_rooms`
--
ALTER TABLE `tbl_rooms`
  MODIFY `room_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
