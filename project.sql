-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2024 at 10:33 PM
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
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_name` varchar(255) DEFAULT NULL,
  `adminpassword` varchar(255) DEFAULT NULL,
  `adminid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `expires` date DEFAULT NULL,
  `otpstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_name`, `adminpassword`, `adminid`, `name`, `email`, `phone`, `otp`, `expires`, `otpstatus`) VALUES
('admin', '$2y$10$461.roVABrS9kkAEbtVLNegn0u9U7QHn2VapVWkMMsbaju32Dcdby', 1, 'Rohit Shrestha', 'shresthajames08@gmail.com', 9809234720, 392811, '2024-03-03', 0),
('mahima', '$2y$10$gbXLee0zFEXDZRxaZtFaLO9eU0Ou1Wi4E5qGREfSj3z8XLkpRHM96', 2, 'Mahima Shrestha', 'shresthamahima07@gmail.com', 9866959525, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `packages_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `checkin_date` date DEFAULT NULL,
  `checkout_date` date DEFAULT NULL,
  `total_guest` int(11) DEFAULT NULL,
  `totalprice` decimal(10,2) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `stat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `packages_id`, `hotel_id`, `booking_date`, `checkin_date`, `checkout_date`, `total_guest`, `totalprice`, `payment`, `room`, `action`, `stat`) VALUES
(53, 2, NULL, 16, '2024-02-26', '2024-02-28', '2024-03-02', 10, 81000.00, 'esewa', 9, 'booked', 0),
(58, 2, 11, 13, '2024-02-27', '2024-02-28', '2024-03-02', 3, 150000.00, 'esewa', 2, 'booked', 0),
(62, 2, 11, 13, '2024-02-27', '2024-02-29', '2024-03-03', 32, 1600000.00, 'esewa', 16, 'booked', 0),
(71, 1, 8, 5, '2024-02-29', '2024-03-02', '2024-03-08', 2, 20.00, 'esewa', 1, 'booked', 0),
(72, 1, NULL, 16, '2024-02-29', '2024-03-01', '2024-03-08', 2, 21000.00, 'esewa', 1, 'booked', 0),
(73, 1, 8, 5, '2024-02-29', '2024-03-02', '2024-03-08', 1, 10.00, 'cash', 1, 'booked', 0),
(74, 1, NULL, 5, '2024-02-29', '2024-03-04', '2024-03-06', 2, 14000.00, 'cash', 1, 'booked', 0),
(75, 1, 8, 5, '2024-02-29', '2024-03-08', '2024-03-14', 6, 60.00, 'cash', 3, 'booked', 2),
(76, 3, NULL, 17, '2024-03-02', '2024-03-06', '2024-03-09', 7, 36000.00, 'cash', 4, 'booked', 1),
(77, 2, 19, 23, '2024-03-02', '2024-03-05', '2024-03-10', 8, 12000.00, 'cash', 4, 'cancel', 0),
(78, 2, 19, 23, '2024-03-02', '2024-03-08', '2024-03-13', 6, 9000.00, 'cash', 3, 'cancel', 0),
(79, 2, NULL, 23, '2024-03-02', '2024-03-05', '2024-03-06', 2, 1000.00, 'cash', 1, 'cancel', 0),
(80, 2, NULL, 23, '2024-03-02', '2024-03-05', '2024-03-08', 2, 3000.00, 'cash', 1, 'cancel', 0),
(81, 2, NULL, 23, '2024-03-02', '2024-03-04', '2024-03-07', 2, 3000.00, 'esewa', 1, 'booked', 0),
(82, 2, 13, 17, '2024-03-15', '2024-03-19', '2024-03-24', 2, 20000.00, 'cash', 1, 'cancel', 0),
(83, 2, NULL, 17, '2024-03-15', '2024-03-17', '2024-03-19', 2, 6000.00, 'cash', 1, 'cancel', 0),
(84, 2, 8, 5, '2024-03-15', '2024-03-21', '2024-03-25', 2, 20.00, 'cash', 1, 'cancel', 0),
(85, 2, 11, 13, '2024-03-15', '2024-03-23', '2024-03-26', 2, 90000.00, 'cash', 1, 'cancel', 0),
(86, 2, NULL, 18, '2024-03-15', '2024-03-21', '2024-03-23', 2, 3000.00, 'esewa', 1, 'cancel', 0);

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `carousel_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`carousel_id`, `name`, `description`, `image`) VALUES
(1, 'Mountain', 'A country of great beauty, Nepal is home to eight of the 14 highest mountains in the world. The Himalayan mountain range extends across the country from the eastern edge to the western edge. ', 'image/bcnepal.jpg'),
(2, 'CG Temple', 'Cg Temple is a spiritual travel destination located in Devchuli Municipality of Nawalpur district. The temple is inside the Cg industrial park owned by the Chaudhary Group. The temple is not just like a temple but for relaxation and religious travel and g', 'image/cg.jpg'),
(3, 'National park', ' Nepal\'s national parks, including Chitwan, Sagarmatha, and Bardia, showcase diverse ecosystems and rare wildlife, attracting visitors for jungle safaris and mountain adventures.', 'image/trending-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `cid` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `destination_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `destatus` varchar(3) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`destination_id`, `name`, `description`, `destatus`, `price`, `rating`, `image`, `location`) VALUES
(1, 'Tree House', 'nature views', 'on', 1000, 4.7, 'image/destination-1.jpg', 'Chitwan'),
(2, 'Jalbire', 'waterfall ', 'on', 2000, 4.3, 'image/destination-3.jpg', 'Chitwan'),
(3, 'Chitwan National Park', ' Nepal\'s premier wildlife sanctuary', 'on', 3000, 4.8, 'image/destination-4.jpg', 'Chitwan'),
(4, 'Tharu culture', 'Mueseum', 'on', 1500, 4.2, 'image/destination-5.jpg', 'Chitwan'),
(5, 'Meghauli', ' Beauty', 'on', 2000, 4.0, 'image/things-2.jpg', 'Chitwan'),
(6, 'CG Temple', 'Peace', 'on', 2000, 4.0, 'image/destination-6.jpg', 'Chitwan');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `gallery_path` varchar(255) DEFAULT NULL,
  `information` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `gallery_path`, `information`) VALUES
(1, 'image/elephantbath.jpg', 'Elephant bathing'),
(2, 'image/canoeing.jpg', 'Canoeing'),
(4, 'image/bish hajar tal.jpg', 'Bishazari Tal'),
(5, 'image/destination-4.jpg', 'Chitwan National Park'),
(6, 'image/Umbrela_Street-Chitwan.jpg', 'umbrella street'),
(7, 'image/things-7.jpg', 'james world fun park'),
(8, 'image/Tharu-Cultural.jpg', 'Tharu culture Dance'),
(9, 'image/baikuntha-tal.jpg', 'baikuntha tal'),
(10, 'image/ranipokhari.jpg', 'Rani Pokhari'),
(12, 'image/paragliding.jpg', NULL),
(13, 'image/Cruise Ship.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rating` int(1) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `available_room` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `name`, `rating`, `room`, `available_room`, `location`, `image`, `description`, `price`, `status`) VALUES
(1, 'Soltee Hotel', 5, 40, 20, 'patihani', 'hotelimg/soaltee-westend-resort.jpg', NULL, 13000, 'on'),
(2, 'Hotel Siraichuli', 5, 70, 20, 'narayangarh', 'hotelimg/siraichuli hotel.jpg', NULL, 5000, 'on'),
(3, 'CGR', 4, 40, 20, 'narayangarh', 'hotelimg/CGR.jpg', NULL, 3500, 'on'),
(5, 'Hotel Wildlife Camp', 4, 5, 5, 'sauraha', 'hotelimg/hotelwildlifecamp.jpg', 'Experience luxury amidst nature at the heart of Sauraha, Nepal\'s premier wildlife destination.', 4000, 'on'),
(6, 'abc', 2, 3, 4, 'narayangarh', 'hotelimg/2023_02_23_23_33_IMG_7236.JPG', 'abc', 7000, 'on'),
(7, 'XYZ', 5, 30, 1, 'sauraha', 'hotelimg/hotelwildlifecamp.jpg', 'Experience luxury amidst nature at the heart of Sa.', 1000, 'on');

-- --------------------------------------------------------

--
-- Table structure for table `hotelowner`
--

CREATE TABLE `hotelowner` (
  `hotelowner_email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `otp` int(11) NOT NULL,
  `expires` date DEFAULT NULL,
  `otpstatus` int(11) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `phone_no` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotelowner`
--

INSERT INTO `hotelowner` (`hotelowner_email`, `name`, `otp`, `expires`, `otpstatus`, `pass`, `id`, `phone_no`) VALUES
('shresthajames08@gmail.com', 'Rohit shrestha', 481495, '2024-03-12', 0, '$2y$10$sdfLPq0gwIJxz5hTzt0sC.wCg4RcbRVBLh8SyvzHkHky/l92knajm', 1, 9809234720),
('shresthamahima07@gmail.com', 'Mahima shrestha', 0, NULL, 0, '$2y$10$CaXS8cfhDcrmYTXs3fKlYOPqwr21vF7rgvthqH3x1PrAdGIgcedx6', 2, 9866959525),
('shresthagarima07@gmail.com', 'Garima Shrestha', 0, NULL, 0, '$2y$10$JgDiYTujTPgOicZnZnrE.uVEmWK0DCHWT1Vkpy0MO0EF3d5IiUQ0m', 3, 9809504950),
('solte@gmail.com', 'Soaltee Westend Resort ', 0, NULL, 0, '$2y$10$OyCJGDj8PwtOuJsf3gnuouTxg5yc/BkfYqNKfcr07bZ3L2U5xnyEy', 4, 9811111111),
('siraichuli@gmail.com', 'SIRAICHULI HOTEL', 0, NULL, 0, '$2y$10$NxuzSFlYQXKWokXObDsm1.Q6TRmQEaGVX6aR6tiMNVPfb4kJbN7iC', 5, 9800000000),
('boston@gmail.com', 'boston international college', 0, NULL, 0, '$2y$10$FVtqMzxRgUGdD5rZTRZFn.xp3VVYiuMNsFCl9QeMonj9MHmPmOqTm', 9, 9812121212),
('cgr@gmail.com', 'CGR', 0, NULL, 0, '$2y$10$1W2UBcypbc8IDRNaEMz53O1OH9ml9bHOsyeDXyJcAYkzUTXHhspl2', 10, 9855555555),
('serai@gmail.com', 'Meghauli Serai ', 0, NULL, 0, '$2y$10$NizA0Pn5t6J1A6KlZnNti.u8kyLJomxJQmsHI/QmGZzgePbZyP922', 11, 9899664422),
('rainforest@gmail.com', 'Rainforest', 0, NULL, 0, '$2y$10$y0Mr6KnKlnyWSg1SCvIzHeopMQHZQmlJk8rxGjU5CgxLX3JBzBRda', 12, 9877885533),
('junglevilla@gmail.com', 'Jungle villa', 0, NULL, 0, '$2y$10$gp.hV.RC4aqPCwGfMpv/TeLKlwqKab.wxD06FGyyvPoxcvJYjMX.m', 13, 9899886622),
('green@gmail.com', 'Green Park Owner', 0, NULL, 0, '$2y$10$5obn93VvEV9EgW/H/xnaL.dQzxfbq5BwGuDeSXTSmJ/uFszSdLZRm', 14, 9800730000),
('abc@gmail.com', 'abc', 0, NULL, 0, '$2y$10$eByFrtfYG8rgi6xZYr.1veHOosTrzjCLwMHbVmINxukvrMhAoFPeW', 15, 1212121211),
('shanta@gmail.com', 'Shanta Ghar A Rustic Guesthouse', 0, NULL, 0, '$2y$10$HX0GcwTGlL5n2p0uT4C9OeSSYC6/J13kdDrUDl7MBOz/S8iJ8pOyy', 16, 9801986969),
('test@gmail.com', 'test hotel', 0, NULL, 0, '$2y$10$DmBRlp/y05kJt5fWYCtQoO30L1qmckUAFEs3vvErR8zUjzLxpYiU2', 17, 9800775533),
('vivanta@gmail.com', 'Vivanta Chitwan Bharatpur', 0, NULL, 0, '$2y$10$NwsFAHurQo40IFgolA7ZHOGwBVRR9Ob1EknDyCqZOjNR1RZvbZtWG', 18, 9800150000);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(5) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `room` int(11) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `location`, `image`, `description`, `price`, `status`, `email`, `name`, `room`, `map`, `rating`) VALUES
(5, 'Narayangarh', '../hotelowner/temimages/siraichuli hotel.jpg', 'Hotel Siraichuli features an outdoor swimming pool, fitness centre, a garden and shared lounge in Chitwan. This 4-star hotel offers free shuttle service and room service. The hotel provides a terrace and a 24-hour front desk.', 5000, 'on', 'siraichuli@gmail.com', 'Siraichuli Hotel', 10, 'https://maps.app.goo.gl/NNhSFBJw53RGn11w5', 4),
(13, 'patihani', 'temimages/soaltee-westend-resort.jpg', '1 extra-large double bed \r\nProviding free toiletries, this double room includes a private bathroom with a shower. The spacious double room provides air conditioning, soundproof walls, a minibar, a tea and coffee maker, as well as a flat-screen TV with satellite channels. The unit offers 1 bed.', 15000, 'on', 'solte@gmail.com', 'Soaltee Westend Resort', 20, 'https://maps.app.goo.gl/S9YxnmQEuteN8u1J9', 5),
(16, 'Narayangarh', 'temimages/CGR.jpg', 'CGR SERVICE', 3000, 'on', 'cgr@gmail.com', 'CGR', 15, 'https://maps.app.goo.gl/tDdjzHdZaiUYYbda8', 3),
(17, 'meghauli', 'temimages/serai.jpg', 'Standing on the banks of the river Rapti, Meghauli Serai overlooks a vast expanse of rippling waters and the core of Chitwan National Park. This 30 room luxurious jungle safari resort in Chitwan National Park is designed to showcase the spectacular wilderness and rooms as well as guest areas afford uninterrupted views of the jungle.', 3000, 'on', 'serai@gmail.com', 'Meghauli Serai', 10, 'https://maps.app.goo.gl/7BUDXjDpBCGWAkSa7', 3),
(18, 'shivaghat', 'temimages/rainforest.jpg', 'RainForest Resort (Located in Chitwan, Nepal) is a perfect getaway for friends and family for a Private Party, Family Vacation and to celebrate special events and occasions. It is located by the side of the river with a spectacular view of nature. Celebrate Birthday parties, Family Vacation, Destination Wedding, Corporate Events, Movie Nights, Gaming Nights, BBQ Nights, Engagement Party and more.', 1500, 'on', 'rainforest@gmail.com', 'Rain Forest Resort', 10, 'https://maps.app.goo.gl/Nm4JiBjfkszyP6H47', 4),
(19, 'patihani', 'temimages/junglevilla.jpg', 'Jungle Villa Resort features accommodation with an outdoor swimming pool, free private parking, a garden and a terrace. Among the various facilities are a bar and massage services. The resort provides pool views, a children\'s playground, a 24-hour front desk, and free WiFi is available.', 6000, 'on', 'junglevilla@gmail.com', 'Jungle Villa Resort', 10, 'https://maps.app.goo.gl/VZKM9xkSWSa2yjge7', 4),
(23, 'sauraha', 'temimages/greenpark.jpg', 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Sauraha part of Chitwan, this property puts you close to attractions and interesting dining options. Don\'t leave before paying a visit to the famous Bharatpur Airport.', 1000, 'on', 'green@gmail.com', 'Green Park', 10, 'https://maps.app.goo.gl/W7ReJcFnCPq68eBEA', 3),
(27, 'madi', 'temimages/madi.jpg', 'BBQ facilities ,Room service,breakfast,free wifi and parking', 1100, 'on', 'shanta@gmail.com', 'Shanta Ghar A Rustic Guesthouse', 10, 'https://maps.app.goo.gl/5kbAJrEqqSZFWVTp6', 4),
(29, 'Narayangarh', 'temimages/vivanta5.jpg,temimages/vivanta3.jpg,temimages/vivanta2.jpg,temimages/vivanta1.jpg,temimages/vivanta.jpg', 'Situated in Bharatpur, 17 km from Tharu Cultural Museum, Vivanta Chitwan Bharatpur features accommodation with an outdoor swimming pool, free private parking, a shared lounge and a terrace. This 4-star hotel offers an ATM and a concierge service. The accommodation provides a 24-hour front desk, airport transfers, room service and free WiFi throughout the property.', 8000, 'on', 'vivanta@gmail.com', 'Vivanta Chitwan Bharatpur', 10, 'https://maps.app.goo.gl/PjoA47vy1Hw9U95w9', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notice_id` int(11) NOT NULL,
  `nFrom` varchar(255) DEFAULT NULL,
  `ntype` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notice_id`, `nFrom`, `ntype`, `message`, `date`) VALUES
(2, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: duration, description', '2024-02-25'),
(3, 'Siraichuli Hotel', 'Package', 'Request For Updating Package From Siraichuli Hotel for the following fields: name, price', '2024-02-25'),
(4, 'SIRAICHULI', 'Package', 'Request For Updating Package From SIRAICHULI for the following fields: image', '2024-02-26'),
(9, 'SIRAICHULI', 'Package', 'Request For Updating Package From SIRAICHULI for the following fields: price', '2024-02-26'),
(16, 'Siraichuli Hotel', 'hotel', 'Request For Updating hotel From Siraichuli Hotel for the following fields: room, map', '2024-02-26'),
(17, 'Siraichuli Hotel', 'hotel', 'Request For Updating hotel From Siraichuli Hotel for the following fields: map', '2024-02-26'),
(19, 'Siraichuli Hotel', 'hotel', 'Request For Updating hotel From Siraichuli Hotel for the following fields: location', '2024-02-26'),
(21, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: duration', '2024-02-26'),
(22, 'SIRAICHULI', 'Package', 'Request For Updating Package From SIRAICHULI for the following fields: duration', '2024-02-26'),
(23, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: price', '2024-02-26'),
(24, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: description', '2024-02-26'),
(25, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: duration', '2024-02-26'),
(28, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: price', '2024-02-26'),
(29, 'Soaltee Westend Resort', 'hotel', 'Request For Updating hotel From Soaltee Westend Resort for the following fields: price', '2024-02-26'),
(30, 'Soaltee Westend Resort', 'hotel', 'Request For Updating hotel From Soaltee Westend Resort for the following fields: price', '2024-02-26'),
(31, 'Soaltee Westend Resort', 'hotel', 'Request For Updating hotel From Soaltee Westend Resort for the following fields: price', '2024-02-26'),
(32, 'Soaltee Westend Resort', 'hotel', 'Request For Updating hotel From Soaltee Westend Resort for the following fields: price', '2024-02-26'),
(33, 'Soaltee Westend Resort', 'hotel', 'Request For Updating hotel From Soaltee Westend Resort for the following fields: price', '2024-02-26'),
(34, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: description', '2024-02-26'),
(35, 'Family package', 'Package', 'Request For Updating Package From Family package for the following fields: duration', '2024-02-26'),
(36, 'Family package', 'Package', 'Request For Updating Package From Family package for the following fields: duration', '2024-02-26'),
(37, 'CGR', 'hotel', 'Request For Updating hotel From CGR for the following fields: map, description', '2024-02-26'),
(38, 'CGR', 'hotel', 'Request For Updating hotel From CGR for the following fields: map, description', '2024-02-26'),
(39, 'SUMMER PACK', 'Package', 'Request For Updating Package From SUMMER PACK for the following fields: duration', '2024-02-29'),
(40, 'SIRAICHULI', 'Package', 'Request For Updating Package From SIRAICHULI for the following fields: duration', '2024-02-29'),
(41, 'Siraichuli Hotel', 'hotel', 'Request For Updating hotel From Siraichuli Hotel for the following fields: price', '2024-02-29'),
(42, 'Soaltee Westend Resort', 'hotel', 'Request For Updating hotel From Soaltee Westend Resort for the following fields: price', '2024-02-29'),
(43, 'Family package', 'Package', 'Request For Updating Package From Family package for the following fields: price', '2024-02-29'),
(44, 'Soaltee Westend Resort', 'hotel', 'Request For Updating hotel From Soaltee Westend Resort for the following fields: location', '2024-02-29'),
(45, 'CNP Safari', 'Packages', 'Request For Adding New Package FROM Soaltee Westend Resort ', '2024-02-29'),
(46, 'Serai Family Pack', 'Packages', 'Request For Adding New Package FROM Meghauli Serai ', '2024-03-02'),
(47, 'Serai Family Pack', 'Package', 'Request For Updating Package From Serai Family Pack for the following fields: price', '2024-03-02'),
(48, 'Serai Family Pack', 'Package', 'Request For Updating Package From Serai Family Pack for the following fields: name', '2024-03-02'),
(49, 'Green Park', 'hotel', 'Request For Updating hotel From Green Park for the following fields: price', '2024-03-02'),
(50, 'Green Park', 'hotel', 'Request For Updating hotel From Green Park for the following fields: price', '2024-03-02'),
(51, 'Green Park', 'hotel', 'Request For Updating hotel From Green Park for the following fields: price', '2024-03-02'),
(52, 'Green Park package', 'Packages', 'Request For Adding New Package FROM Green Park ', '2024-03-02'),
(53, 'Green Park package', 'Package', 'Request For Updating Package From Green Park package for the following fields: price, duration', '2024-03-02'),
(54, 'Green Park package', 'Package', 'Request For Updating Package From Green Park package for the following fields: price, duration', '2024-03-02'),
(55, 'Green Park package', 'Packages', 'Request For Adding New Package FROM Green Park ', '2024-03-02'),
(56, 'Green Park package', 'Package', 'Request For Updating Package From Green Park package for the following fields: price', '2024-03-02'),
(57, 'Green Park package', 'Packages', 'Request For Adding New Package FROM Green Park ', '2024-03-02'),
(58, 'Green Park package', 'Packages', 'Request For Adding New Package FROM Green Park ', '2024-03-02'),
(59, 'Green Park package', 'Package', 'Request For Updating Package From Green Park package for the following fields: price', '2024-03-02'),
(60, 'Green Park package', 'Packages', 'Request For Adding New Package FROM Green Park ', '2024-03-02'),
(61, 'Green Park package', 'Package', 'Package  Green Park package has been deleted: ', '2024-03-02'),
(62, 'Green Park package', 'Packages', 'Request For Adding New Package FROM Green Park ', '2024-03-02'),
(63, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', 'Request For Adding New Hotel', '2024-04-04'),
(64, 'Shanta Ghar A Rustic Guesthouse', 'hotel', 'Request For Updating hotel From Shanta Ghar A Rustic Guesthouse for the following fields: price', '2024-04-04'),
(65, 'a', 'Packages', 'Request For Adding New Package FROM Shanta Ghar A Rustic Guesthouse ', '2024-04-04'),
(66, 'a', 'Package', 'Request For Updating Package From a for the following fields: duration', '2024-04-04'),
(67, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', ' hotel Shanta Ghar A Rustic Guesthouse Has been deleted by hotel Owner: ', '2024-04-04'),
(68, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', 'Request For Adding New Hotel', '2024-04-04'),
(69, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', ' hotel Shanta Ghar A Rustic Guesthouse Has been deleted by hotel Owner: ', '2024-04-04'),
(70, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', 'Request For Adding New Hotel', '2024-04-04'),
(71, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', ' hotel Shanta Ghar A Rustic Guesthouse Has been deleted by hotel Owner: ', '2024-04-04'),
(72, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', 'Request For Adding New Hotel', '2024-04-04'),
(73, 'a', 'Packages', 'Request For Adding New Package FROM Shanta Ghar A Rustic Guesthouse ', '2024-04-04'),
(74, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', ' hotel Shanta Ghar A Rustic Guesthouse Has been deleted by hotel Owner: ', '2024-04-04'),
(75, 'Shanta Ghar A Rustic Guesthouse', 'Hotel', 'Request For Adding New Hotel', '2024-04-04'),
(76, ' Rustic Guesthouse package', 'Packages', 'Request For Adding New Package FROM Shanta Ghar A Rustic Guesthouse ', '2024-04-04'),
(77, 'test', 'Hotel', 'Request For Adding New Hotel', '2024-04-04'),
(78, 'test', 'Hotel', 'Request For Adding New Hotel', '2024-04-05'),
(79, 'test', 'hotel', 'Request For Updating hotel From test for the following fields: price', '2024-04-05'),
(80, 'test', 'hotel', 'Request For Updating hotel From test for the following fields: room', '2024-04-05'),
(81, 'test', 'hotel', 'Request For Updating hotel From test for the following fields: price', '2024-04-05'),
(82, 'test', 'hotel', 'Request For Updating hotel From test for the following fields: price', '2024-04-05'),
(83, 'test', 'hotel', 'Request For Updating hotel From test for the following fields: map', '2024-04-05'),
(84, 'test', 'hotel', 'Request For Updating hotel From test for the following fields: price', '2024-04-05'),
(85, 'test', 'Packages', 'Request For Adding New Package FROM test ', '2024-04-05'),
(86, 'SIRAICHULI', 'Package', 'Request For Updating Package From SIRAICHULI for the following fields: price', '2024-04-05'),
(87, 'test', 'Packages', 'Request For Adding New Package FROM test ', '2024-04-05'),
(88, 'test', 'Hotel', ' hotel test Has been deleted by hotel Owner: ', '2024-04-05'),
(89, 'test', 'Hotel', 'Request For Adding New Hotel', '2024-04-05'),
(90, 'Vivanta Chitwan Bharatpur', 'Hotel', 'Request For Adding New Hotel', '2024-04-06'),
(91, 'Mahima shrestha', 'Packages', 'Request For Adding New Package FROM Vivanta Chitwan Bharatpur ', '2024-04-07'),
(92, 'vivanta package', 'Packages', 'Request For Adding New Package FROM Vivanta Chitwan Bharatpur ', '2024-04-07');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packages_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `packstatus` varchar(5) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`packages_id`, `name`, `hotel_id`, `description`, `price`, `location`, `packstatus`, `image`, `duration`, `map`, `action`, `email`, `created_at`, `updated_at`) VALUES
(6, 'SIRAICHULI', 5, 'Breakfast Meal Dinner ', 8000, 'Narayangarh', 'on', 'temimages/siraichuli.jpg', 2, 'https://maps.app.goo.gl/NNhSFBJw53RGn11w5', NULL, 'siraichuli@gmail.com', '2024-02-25', '2024-03-01'),
(8, 'SUMMER PACK', 5, 'breakfast,Free toiletries ,Shower, Bidet ,Toilet ,Linen Socket near the bed ,Tile/marble floor ,TV ,Telephone, Satellite channels, Tea/Coffee maker ,Electric kettle, Wake-up service, Clothes rack', 10, 'Narayangarh', 'on', 'temimages/pack2siraichuli.jpg', 4, 'https://maps.app.goo.gl/NNhSFBJw53RGn11w5', NULL, 'siraichuli@gmail.com', '2024-02-25', '2024-03-01'),
(11, 'Family package', 13, 'Embark on a Tharu/Derai Village Tour to experience the local culture and lifestyle.– Experience canoeing on the Rapti River, surrounded by scenic views. Enjoy a buffet lunch at the resort.Visit the Crocodile Breeding Conservation Center, located inside the National Park. Embark on an exciting Jeep Safari inside the National Park (2 to 3 hours) on a seat-in-coach (SIC) basis', 45000, 'patihani', 'on', 'temimages/solte.jpg', 3, 'https://maps.app.goo.gl/S9YxnmQEuteN8u1J9', NULL, 'solte@gmail.com', '2024-02-26', '2024-03-02'),
(12, 'CNP Safari', 13, 'CNP SAFARI', 20000, 'patihani', 'on', 'temimages/trending-3.jpg', 1, 'https://maps.app.goo.gl/S9YxnmQEuteN8u1J9', NULL, 'solte@gmail.com', '2024-02-29', '2024-03-02'),
(13, 'Serai Family Package', 17, 'Featuring free WiFi, Meghauli Serai, Chitwan National Park offers accommodation in Meghauli. The accommodation features a spa bath.', 10000, 'meghauli', 'on', 'temimages/seraipack.jpg', 5, 'https://maps.app.goo.gl/7BUDXjDpBCGWAkSa7', NULL, 'serai@gmail.com', '2024-03-02', '2024-03-02'),
(19, 'Green Park package', 23, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Sauraha part of Chitwan, this property puts you close to attractions and interesting dining options', 1500, 'sauraha', 'on', 'temimages/greenpark.jpg', 5, 'https://maps.app.goo.gl/W7ReJcFnCPq68eBEA', NULL, 'green@gmail.com', '2024-03-02', '0000-00-00'),
(22, ' Rustic Guesthouse package', 27, 'breakfast,lunch,dinner,BBQ facilities', 3000, 'madi', 'on', 'temimages/madi.jpg', 4, 'https://maps.app.goo.gl/5kbAJrEqqSZFWVTp6', NULL, 'shanta@gmail.com', '2024-04-04', '0000-00-00'),
(23, 'vivanta package', 29, 'Situated in Bharatpur, 17 km from Tharu Cultural Museum, Vivanta Chitwan Bharatpur features accommodation with an outdoor swimming pool, free private parking, a shared lounge and a terrace. This 4-star hotel offers an ATM and a concierge service. The accommodation provides a 24-hour front desk, airport transfers, room service and free WiFi throughout the property.\r\nBreakfast , Lunch , Dinner ', 25000, 'Narayangarh', 'on', 'temimages/v1.jpg,temimages/v.jpg', 3, 'https://maps.app.goo.gl/PjoA47vy1Hw9U95w9', NULL, 'vivanta@gmail.com', '2024-04-07', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `packages_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `packstatus` varchar(3) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `duration` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`packages_id`, `name`, `description`, `price`, `location`, `packstatus`, `image`, `hotel_id`, `duration`) VALUES
(1, 'Hotel Wildlife Camp', 'offer', 7000, 'sauraha', 'on', 'packagesimg/hotelwildlifecamp.jpg', 5, '2 '),
(2, 'CGR', 'hello', 7000, 'narayangarh', 'on', 'packagesimg/CGR.jpg', 3, '2'),
(3, 'siraichuli hotel', 'bye', 100000, 'narayangarh', 'on', 'packagesimg/siraichuli hotel.jpg', 2, '2'),
(5, 'madi', 'tharuculture room dinner lunch breakfast', 2000, NULL, 'on', 'packagesimg/baikuntha-tal.jpg', NULL, '1'),
(6, 'Rohit shrestha', 'wifi minifridge tv meal breakfast', 3000, 'narayangarh', 'on', 'packagesimg/back.jpg', NULL, '2'),
(7, 'tharu culture', 'tharu culture', 3000, NULL, 'on', 'packagesimg/Tharu-Cultural.jpg', NULL, '2'),
(8, 'cg', 'cg', 3000, NULL, 'on', 'packagesimg/cg.jpg', NULL, '2'),
(9, 'shivaghat', 'shivaghat', 3000, 'narayangarh', 'on', 'packagesimg/Cruise Ship.jpg', NULL, '2'),
(10, 'Rohit', 'Boston', 100000, 'narayangarh', 'on', 'packagesimg/2024_02_15_16_47_IMG_2204.JPG', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `temp_hotel`
--

CREATE TABLE `temp_hotel` (
  `name` varchar(50) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` <= 5),
  `room` int(11) DEFAULT NULL,
  `hotel_map` varchar(255) DEFAULT NULL,
  `hotel_location` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `h_action` varchar(50) DEFAULT NULL,
  `temp_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_hotel`
--

INSERT INTO `temp_hotel` (`name`, `rating`, `room`, `hotel_map`, `hotel_location`, `image`, `description`, `price`, `status`, `features`, `h_action`, `temp_id`, `email`, `updated_at`) VALUES
('Siraichuli Hotel', 4, 10, 'https://maps.app.goo.gl/NNhSFBJw53RGn11w5', 'Narayangarh', '../hotelowner/temimages/siraichuli hotel.jpg', 'Hotel Siraichuli features an outdoor swimming pool, fitness centre, a garden and shared lounge in Chitwan. This 4-star hotel offers free shuttle service and room service. The hotel provides a terrace and a 24-hour front desk.', 5000, 'on', NULL, 'Approved', 3, 'siraichuli@gmail.com', '2024-03-01'),
('Soaltee Westend Resort', 5, 20, 'https://maps.app.goo.gl/S9YxnmQEuteN8u1J9', 'patihani', 'temimages/soaltee-westend-resort.jpg', '1 extra-large double bed \r\nProviding free toiletries, this double room includes a private bathroom with a shower. The spacious double room provides air conditioning, soundproof walls, a minibar, a tea and coffee maker, as well as a flat-screen TV with satellite channels. The unit offers 1 bed.', 15000, 'on', NULL, 'Approved', 4, 'solte@gmail.com', '2024-03-02'),
('CGR', 3, 15, 'https://maps.app.goo.gl/tDdjzHdZaiUYYbda8', 'Narayangarh', 'temimages/CGR.jpg', 'CGR SERVICE', 3000, 'on', NULL, 'Approved', 8, 'cgr@gmail.com', '2024-02-26'),
('Meghauli Serai', 3, 10, 'https://maps.app.goo.gl/7BUDXjDpBCGWAkSa7', 'meghauli', 'temimages/serai.jpg', 'Standing on the banks of the river Rapti, Meghauli Serai overlooks a vast expanse of rippling waters and the core of Chitwan National Park. This 30 room luxurious jungle safari resort in Chitwan National Park is designed to showcase the spectacular wilderness and rooms as well as guest areas afford uninterrupted views of the jungle.', 3000, 'on', NULL, 'Approved', 9, 'serai@gmail.com', NULL),
('Rain Forest Resort', 4, 10, 'https://maps.app.goo.gl/Nm4JiBjfkszyP6H47', 'shivaghat', 'temimages/rainforest.jpg', 'RainForest Resort (Located in Chitwan, Nepal) is a perfect getaway for friends and family for a Private Party, Family Vacation and to celebrate special events and occasions. It is located by the side of the river with a spectacular view of nature. Celebrate Birthday parties, Family Vacation, Destination Wedding, Corporate Events, Movie Nights, Gaming Nights, BBQ Nights, Engagement Party and more.', 1500, 'on', NULL, 'Approved', 10, 'rainforest@gmail.com', NULL),
('Jungle Villa Resort', 4, 10, 'https://maps.app.goo.gl/VZKM9xkSWSa2yjge7', 'patihani', 'temimages/junglevilla.jpg', 'Jungle Villa Resort features accommodation with an outdoor swimming pool, free private parking, a garden and a terrace. Among the various facilities are a bar and massage services. The resort provides pool views, a children\'s playground, a 24-hour front desk, and free WiFi is available.', 6000, 'on', NULL, 'Approved', 11, 'junglevilla@gmail.com', NULL),
('Green Park', 3, 10, 'https://maps.app.goo.gl/W7ReJcFnCPq68eBEA', 'sauraha', 'temimages/greenpark.jpg', 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Sauraha part of Chitwan, this property puts you close to attractions and interesting dining options. Don\'t leave before paying a visit to the famous Bharatpur Airport.', 1000, 'on', NULL, 'Approved', 16, 'green@gmail.com', NULL),
('Shanta Ghar A Rustic Guesthouse', 4, 10, 'https://maps.app.goo.gl/5kbAJrEqqSZFWVTp6', 'madi', 'temimages/madi.jpg', 'BBQ facilities ,Room service,breakfast,free wifi and parking', 1100, 'on', NULL, 'Approved', 21, 'shanta@gmail.com', NULL),
('Vivanta Chitwan Bharatpur', 4, 10, 'https://maps.app.goo.gl/PjoA47vy1Hw9U95w9', 'Narayangarh', 'temimages/vivanta5.jpg,temimages/vivanta3.jpg,temimages/vivanta2.jpg,temimages/vivanta1.jpg,temimages/vivanta.jpg', 'Situated in Bharatpur, 17 km from Tharu Cultural Museum, Vivanta Chitwan Bharatpur features accommodation with an outdoor swimming pool, free private parking, a shared lounge and a terrace. This 4-star hotel offers an ATM and a concierge service. The accommodation provides a 24-hour front desk, airport transfers, room service and free WiFi throughout the property.', 8000, 'on', NULL, 'Approved', 25, 'vivanta@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `temp_package`
--

CREATE TABLE `temp_package` (
  `packages_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `packstatus` varchar(5) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_package`
--

INSERT INTO `temp_package` (`packages_id`, `name`, `hotel_id`, `description`, `price`, `location`, `packstatus`, `image`, `duration`, `map`, `action`, `email`, `created_at`, `updated_at`) VALUES
(1, 'SIRAICHULI', 5, 'Breakfast Meal Dinner ', 8000, 'Narayangarh', 'on', 'temimages/siraichuli.jpg', 2, 'https://maps.app.goo.gl/NNhSFBJw53RGn11w5', 'Approved', 'siraichuli@gmail.com', '2024-02-25', '2024-04-05'),
(4, 'SUMMER PACK', 5, 'breakfast,Free toiletries ,Shower, Bidet ,Toilet ,Linen Socket near the bed ,Tile/marble floor ,TV ,Telephone, Satellite channels, Tea/Coffee maker ,Electric kettle, Wake-up service, Clothes rack', 10, 'Narayangarh', 'on', 'temimages/pack2siraichuli.jpg', 4, 'https://maps.app.goo.gl/NNhSFBJw53RGn11w5', 'Approved', 'siraichuli@gmail.com', '2024-02-25', '2024-03-01'),
(13, 'Family package', 13, 'Embark on a Tharu/Derai Village Tour to experience the local culture and lifestyle.– Experience canoeing on the Rapti River, surrounded by scenic views. Enjoy a buffet lunch at the resort.Visit the Crocodile Breeding Conservation Center, located inside the National Park. Embark on an exciting Jeep Safari inside the National Park (2 to 3 hours) on a seat-in-coach (SIC) basis', 45000, 'patihani', 'on', 'temimages/solte.jpg', 3, 'https://maps.app.goo.gl/S9YxnmQEuteN8u1J9', 'Approved', 'solte@gmail.com', '2024-02-26', '2024-03-02'),
(14, 'CNP Safari', 13, 'CNP SAFARI', 20000, 'patihani', 'on', 'temimages/trending-3.jpg', 1, 'https://maps.app.goo.gl/S9YxnmQEuteN8u1J9', 'Approved', 'solte@gmail.com', '2024-02-29', '2024-03-02'),
(15, 'Serai Family Package', 17, 'Featuring free WiFi, Meghauli Serai, Chitwan National Park offers accommodation in Meghauli. The accommodation features a spa bath.', 10000, 'meghauli', 'on', 'temimages/seraipack.jpg', 5, 'https://maps.app.goo.gl/7BUDXjDpBCGWAkSa7', 'Approved', 'serai@gmail.com', '2024-03-02', '2024-03-02'),
(21, 'Green Park package', 23, 'The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Conveniently situated in the Sauraha part of Chitwan, this property puts you close to attractions and interesting dining options', 1500, 'sauraha', 'on', 'temimages/greenpark.jpg', 5, 'https://maps.app.goo.gl/W7ReJcFnCPq68eBEA', 'Approved', 'green@gmail.com', '2024-03-02', NULL),
(24, ' Rustic Guesthouse package', 27, 'breakfast,lunch,dinner,BBQ facilities', 3000, 'madi', 'on', 'temimages/madi.jpg', 4, 'https://maps.app.goo.gl/5kbAJrEqqSZFWVTp6', 'Approved', 'shanta@gmail.com', '2024-04-04', NULL),
(28, 'vivanta package', 29, 'Situated in Bharatpur, 17 km from Tharu Cultural Museum, Vivanta Chitwan Bharatpur features accommodation with an outdoor swimming pool, free private parking, a shared lounge and a terrace. This 4-star hotel offers an ATM and a concierge service. The accommodation provides a 24-hour front desk, airport transfers, room service and free WiFi throughout the property.\r\nBreakfast , Lunch , Dinner ', 25000, 'Narayangarh', 'on', 'temimages/v1.jpg,temimages/v.jpg', 3, 'https://maps.app.goo.gl/PjoA47vy1Hw9U95w9', 'Approved', 'vivanta@gmail.com', '2024-04-07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thingstodo`
--

CREATE TABLE `thingstodo` (
  `thingstodo_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thingstodo`
--

INSERT INTO `thingstodo` (`thingstodo_id`, `name`, `description`, `status`, `link`, `image`, `location`) VALUES
(1, 'Canoeing', 'With a canoe ride you will slowly pass the shores of the rivers which are full with amazing crocodiles and beautiful birds.', 'event', 'https://www.facebook.com/profile.php?id=100089449774876', 'image/canoeing.jpg', 'Chitwan'),
(2, 'Sunset View', 'Finding a clear spot within the national park can provide a serene environment for watching the sunset. The park\'s diverse flora and fauna can add to the beauty of the experience.', 'event', 'https://www.facebook.com/profile.php?id=100089449774876', 'image/things-2.jpg', 'Chitwan'),
(3, 'Maulakali Cable Car', 'The cable car system is designed to transport visitors from the base station to the Maulakalika Temple, offering panoramic views of the surrounding landscape.', 'event', 'https://maps.app.goo.gl/zvLFpWM3atHLTuNq5', 'image/things-3.jpg', 'Chitwan'),
(4, 'Elephant bathing', 'Experience the thrill of Elephant Safari– a unique journey into nature\'s embrace.', 'event', 'https://maps.app.goo.gl/hsX8GNnBK1ge22MS8', 'image/elephantbath.jpg', 'Chitwan'),
(5, 'Bishazari Tal', ' Bishazari Tal, also known as the \"Twenty Thousand Lakes,\" is a captivating natural wonder in Nepal. Encircled by lush greenery and majestic mountains, this picturesque lake beckons adventurers and nature enthusiasts. With its tranquil waters reflecting t', 'event', 'https://maps.app.goo.gl/8oBc6JQekfxy6qzf9', 'image/bish hajar tal.jpg', 'Chitwan'),
(6, 'Siraichuli Trek', 'Siraichuli is the highest hill peak of Chitwan District, located in Kaule Village Development Committee in Chitwan District in Narayani Zone of Nepal', 'event', 'https://maps.app.goo.gl/ZijNZCibFXg4pHYu7', 'image/Siraichuli-Hill.jpg', 'Chitwan'),
(7, 'Tharu culture Dance', 'Experience the vibrant rhythms and rich traditions of Tharu culture through mesmerizing dance performances in Nepal. Celebrated for its colorful costumes and energetic movements, Tharu dance reflects the spirit and resilience of Nepal\'s indigenous communi', 'event', 'a', 'image/Tharu-Cultural.jpg', 'Chitwan'),
(8, 'Umbrellan Street', 'An umbrella street constructed in Patihani, Chitwan, at the cost of Rs. 30 million was inaugurated by chairman of the ruling Nepal Communist Party  Pushpa Kamal Dahal Prachanda on Thursday.  Patihani is one of the 100 tourist destinations declared by the ', 'event', 'https://maps.app.goo.gl/dMkUgDu3iusR7orw7', 'image/umbrellastreet1.jpg', 'Chitwan'),
(9, 'Cruise Ship', 'The cruise ship is operating from Kavreghat, about nine kilometres south of Narayangadh, the city in the district headquarters Bharatpur. The ship made three trips on Sunday, said Deepak Dhungel, Executive Director of Rhino Water Entertainment Pvt. Ltd., ', 'event', 'https://maps.app.goo.gl/cSq7dcJXbNkUN4J1A', 'image/Cruise Ship.jpg', 'Chitwan'),
(10, 'Chitwan National Park', ' Nepal\'s premier wildlife sanctuary, home to diverse flora and fauna, including endangered species like the Bengal tiger and one-horned rhinoceros.', 'event', 'https://maps.app.goo.gl/TymuLbeoj6FjD7PSA', 'image/destination-4.jpg', 'Chitwan'),
(11, 'Rani Pokhari', 'Rani Pokhari, located in Sharadhanagar, West Chitwan, is not just a pond but a burgeoning tourist destination offering a serene boating experience amidst its tranquil waters. Originally built several years ago, the pond derived its name, \"Rani Pokhari,\" f', 'event', 'https://maps.app.goo.gl/hDvwh4xRZfp8FPzG7', 'image/ranipokhari.jpg', 'Chitwan');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tourismoverview`
-- (See below for the actual view)
--
CREATE TABLE `tourismoverview` (
`booking_id` int(11)
,`packages_id` int(11)
,`id` int(11)
,`hotel_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `trending`
--

CREATE TABLE `trending` (
  `trending_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `trestatus` varchar(3) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trending`
--

INSERT INTO `trending` (`trending_id`, `name`, `rating`, `trestatus`, `image`, `price`, `description`, `location`) VALUES
(1, 'Siraichuli Hill', 4, 'on', 'image/Siraichuli-Hill.jpg', 2000, 'Siraichuli is the highest hill peak of Chitwan District, located in Kaule Village Development Committee in Chitwan District in Narayani Zone of Nepal.A majestic peak in Nepal, standing at 1,915 meters, offering breathtaking views and cultural charm.', 'chitwan'),
(2, 'Hotel Wildlife Camp', 5, 'on', 'image/hotelwildlifecamp.jpg', 3000, 'nature views located at sauraha', 'chitwan'),
(3, 'soaltee westend resort', 5, 'on', 'image/soaltee-westend-resort.jpg', 7000, 'Experience luxury amidst nature at the heart of chitwan, Nepal\'s premier wildlife destination.', 'chitwan'),
(4, 'Tharu culture', 3, 'on', 'image/Tharu-Cultural.jpg', 1500, 'tharu culture dance', 'Sauraha'),
(5, 'CG Temple', NULL, 'on', 'image/cg.jpg', NULL, 'Cg Temple is a spiritual travel destination located in Devchuli Municipality of Nawalpur district. The temple is inside the Cg industrial park owned by the Chaudhary Group. The temple is not just like a temple but for relaxation and religious travel and get around.', 'chitwan'),
(6, 'Mountain', NULL, 'on', 'image/bcnepal.jpg', NULL, 'A country of great beauty, Nepal is home to eight of the 14 highest mountains in the world. The Himalayan mountain range extends across the country from the eastern edge to the western edge.', 'chitwan'),
(7, 'national park', NULL, 'on', 'image/trending-3.jpg', NULL, 'Nepal\'s national parks, including Chitwan, Sagarmatha, and Bardia, showcase diverse ecosystems and rare wildlife, attracting visitors for jungle safaris and mountain adventures.', 'chitwan');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `otpstatus` int(1) NOT NULL,
  `expires` date DEFAULT NULL,
  `lastup` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `email`, `user_password`, `phone`, `otp`, `otpstatus`, `expires`, `lastup`) VALUES
(1, 'Mahima Shrestha', 'mahima', 'shresthamahima07@gmail.com', '$2y$10$Hff9uc0HqN6kaOVMGeC9c.0RxpXtsMr5mnCAyDalLH3QrgLxBkBgW', 9866959525, 791282, 1, '2024-02-22', '2024-02-29'),
(2, 'Rohit Shrestha', 'rohit', 'shresthajames08@gmail.com', '$2y$10$ZNjmjYgPg9cwkJE/qd79AONFFEjkYtu/EBHnDxY8vIsVVLgBV5nae', 9809234720, NULL, 1, '2024-04-04', '2024-02-28'),
(3, 'Garima Shrestha', 'garima', 'garima@gmail.com', '$2y$10$s/8oDUfcCtDnuddyzw3xMuq4qPEgFW3n4SgM2ru0Z03zHu3csMHEy', 9800000000, NULL, 0, NULL, '2024-02-28'),
(4, 'Roshni shrestha', 'roshni', 'roshni@gmail.com', '$2y$10$Hrv3FrtpJtMyLofDiIjFG.hXDWmboPU.gTi.3ea4REtGZ8wcQe1ha', 9899999999, NULL, 0, NULL, '2024-02-28'),
(7, 'boston international college', 'boston', 'boston@gmail.com', '$2y$10$AsNOkfwJTlIlyQxZd4QP9uQjaIjorjJWPEmq5z2Lalz2TKJgi49iu', 9811112222, NULL, 0, NULL, '2024-02-28');

-- --------------------------------------------------------

--
-- Structure for view `tourismoverview`
--
DROP TABLE IF EXISTS `tourismoverview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tourismoverview`  AS SELECT `booking`.`booking_id` AS `booking_id`, `package`.`packages_id` AS `packages_id`, `users`.`id` AS `id`, `hotels`.`hotel_id` AS `hotel_id` FROM (((`booking` join `users` on(`users`.`id` = `booking`.`user_id`)) left join `package` on(`package`.`packages_id` = `booking`.`packages_id`)) join `hotels` on(`hotels`.`hotel_id` = `booking`.`hotel_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`carousel_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destination_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `hotelowner`
--
ALTER TABLE `hotelowner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hotwlowner_email` (`hotelowner_email`),
  ADD UNIQUE KEY `hotelowner_email` (`hotelowner_email`),
  ADD UNIQUE KEY `phone_no` (`phone_no`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packages_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`packages_id`),
  ADD KEY `fk_hotel_id` (`hotel_id`);

--
-- Indexes for table `temp_hotel`
--
ALTER TABLE `temp_hotel`
  ADD PRIMARY KEY (`temp_id`);

--
-- Indexes for table `temp_package`
--
ALTER TABLE `temp_package`
  ADD PRIMARY KEY (`packages_id`);

--
-- Indexes for table `thingstodo`
--
ALTER TABLE `thingstodo`
  ADD PRIMARY KEY (`thingstodo_id`);

--
-- Indexes for table `trending`
--
ALTER TABLE `trending`
  ADD PRIMARY KEY (`trending_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `carousel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `destination`
--
ALTER TABLE `destination`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hotelowner`
--
ALTER TABLE `hotelowner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `packages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `packages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `temp_hotel`
--
ALTER TABLE `temp_hotel`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `temp_package`
--
ALTER TABLE `temp_package`
  MODIFY `packages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `thingstodo`
--
ALTER TABLE `thingstodo`
  MODIFY `thingstodo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `trending`
--
ALTER TABLE `trending`
  MODIFY `trending_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contactus`
--
ALTER TABLE `contactus`
  ADD CONSTRAINT `contactus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `fk_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
