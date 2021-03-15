--
-- Database: `usermaster`
--
CREATE DATABASE IF NOT EXISTS `usermaster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `usermaster`;

-- --------------------------------------------------------

--
-- Table structure for table `agencymaster`
--

CREATE TABLE `agencymaster` (
  `agency_id` int(11) NOT NULL,
  `agency_name` varchar(50) NOT NULL,
  `agency_mail` varchar(30) NOT NULL,
  `agency_contact` bigint(20) NOT NULL,
  `agency_address` varchar(50) NOT NULL,
  `agency_state` varchar(30) NOT NULL,
  `agency_city` varchar(30) NOT NULL,
  `agency_price` decimal(10,0) NOT NULL,
  `agency_available` tinyint(1) NOT NULL,
  `driver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookingmaster`
--

CREATE TABLE `bookingmaster` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `date_checkin` date NOT NULL,
  `date_checkout` date NOT NULL,
  `city_name` varchar(30) NOT NULL,
  `state_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingmaster`
--

INSERT INTO `bookingmaster` (`booking_id`, `user_id`, `hotel_id`, `agency_id`, `package_id`, `date_checkin`, `date_checkout`, `city_name`, `state_name`) VALUES
(301, 201, 501, 601, 1001, '2021-03-13', '2021-03-18', 'Manali', 'Himachal Pradesh '),
(302, 202, 502, 602, 1002, '2021-04-01', '2021-04-05', 'Udaipur', 'Rajasthan');

-- --------------------------------------------------------

--
-- Table structure for table `citymaster`
--

CREATE TABLE `citymaster` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(25) NOT NULL,
  `city_pin` int(11) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complaintmaster`
--

CREATE TABLE `complaintmaster` (
  `complaint_id` int(11) NOT NULL,
  `complaint_details` longtext NOT NULL,
  `complaint_status` tinyint(1) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `driver_agency`
--

CREATE TABLE `driver_agency` (
  `driver_id` int(11) NOT NULL,
  `driver_name` varchar(30) NOT NULL,
  `driver_contact` bigint(20) NOT NULL,
  `driver_gender` enum('male','female') NOT NULL,
  `driver_age` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedbackmaster`
--

CREATE TABLE `feedbackmaster` (
  `feedback_id` int(11) NOT NULL,
  `feedback_detail` mediumtext NOT NULL,
  `travel_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotelmaster`
--

CREATE TABLE `hotelmaster` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(40) NOT NULL,
  `hotel_mail` varchar(30) NOT NULL,
  `hotel_contact` bigint(20) NOT NULL,
  `hotel_address` varchar(60) NOT NULL,
  `hotel_state` varchar(25) NOT NULL,
  `hotel_city` varchar(20) NOT NULL,
  `hotel_price` decimal(10,0) NOT NULL,
  `hotel_rooms` blob NOT NULL,
  `room_id` int(11) NOT NULL,
  `hotel_room_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotelroom`
--

CREATE TABLE `hotelroom` (
  `room_id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `room_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `packagemaster`
--

CREATE TABLE `packagemaster` (
  `package_id` int(11) NOT NULL,
  `package_price` double NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paymentmaster`
--

CREATE TABLE `paymentmaster` (
  `payment_id` int(11) NOT NULL,
  `payment_price` double NOT NULL,
  `payment_mode` enum('UPI','WALLET','Net Banking') NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `travel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `statemaster`
--

CREATE TABLE `statemaster` (
  `state_id` int(11) NOT NULL,
  `state_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `travelermaster`
--

CREATE TABLE `travelermaster` (
  `user_id` int(11) NOT NULL,
  `user_type` enum('admin','traveler') NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_mail` varchar(30) NOT NULL,
  `user_contact` bigint(20) NOT NULL,
  `user_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `travelermaster`
--

INSERT INTO `travelermaster` (`user_id`, `user_type`, `user_name`, `user_mail`, `user_contact`, `user_password`) VALUES
(101, 'admin', 'traveldunia', 'mycomp@traveldunia.com', 8890779943, 'travel123456'),
(201, 'traveler', 'Yash Kain', 'yashkain05@gmail.com', 9450123456, 'yash@kain'),
(202, 'traveler', 'Srishti Burnani', 'srishtiburnani@gmail.com', 8975642135, 'srishti@user'),
(203, 'traveler', 'Vinay Vincent', 'vinayvincent15@gmail.com', 8003335421, 'vv151999'),
(205, 'traveler', 'Bijesh Thomas', ' bijesht4@gmail.com', 8890779943, 'bijesh@user'),
(206, 'traveler', 'Vineeta Gurnani', 'vineetagurnani@gmail.com', 9630124578, 'vineeta@user'),
(207, 'traveler', 'Aakanksha Chouhan', 'aakankshachouhan@gmail.com', 8511546781, 'aakanksha@user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencymaster`
--
ALTER TABLE `agencymaster`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `bookingmaster`
--
ALTER TABLE `bookingmaster`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `citymaster`
--
ALTER TABLE `citymaster`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `complaintmaster`
--
ALTER TABLE `complaintmaster`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `driver_agency`
--
ALTER TABLE `driver_agency`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `feedbackmaster`
--
ALTER TABLE `feedbackmaster`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `hotelmaster`
--
ALTER TABLE `hotelmaster`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `room_id_2` (`room_id`);

--
-- Indexes for table `hotelroom`
--
ALTER TABLE `hotelroom`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `packagemaster`
--
ALTER TABLE `packagemaster`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `paymentmaster`
--
ALTER TABLE `paymentmaster`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `statemaster`
--
ALTER TABLE `statemaster`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `travelermaster`
--
ALTER TABLE `travelermaster`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencymaster`
--
ALTER TABLE `agencymaster`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookingmaster`
--
ALTER TABLE `bookingmaster`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `citymaster`
--
ALTER TABLE `citymaster`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaintmaster`
--
ALTER TABLE `complaintmaster`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_agency`
--
ALTER TABLE `driver_agency`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbackmaster`
--
ALTER TABLE `feedbackmaster`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotelmaster`
--
ALTER TABLE `hotelmaster`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packagemaster`
--
ALTER TABLE `packagemaster`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentmaster`
--
ALTER TABLE `paymentmaster`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statemaster`
--
ALTER TABLE `statemaster`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travelermaster`
--
ALTER TABLE `travelermaster`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
