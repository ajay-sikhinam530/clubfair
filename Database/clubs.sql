-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2023 at 05:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clubs`
--

-- --------------------------------------------------------

--
-- Table structure for table `clubdetails`
--

CREATE TABLE `clubdetails` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `OwnerId` varchar(255) NOT NULL,
  `Categories` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clubdetails`
--

INSERT INTO `clubdetails` (`Id`, `Name`, `OwnerId`, `Categories`, `Description`) VALUES
(1, 'testclub-1', '1', 'Technical', 'this is a Technical club'),
(2, 'testclub-2', '1', 'Technical', 'this is a Technical club'),
(3, 'testclub-3', '2', 'Dance', 'this is a Dance club'),
(4, 'testClub4', '4', 'Drawing', 'This Description of Other Club -4');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `ClubId` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `OrganizerId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`Id`, `Name`, `Date`, `ClubId`, `Description`, `OrganizerId`) VALUES
(1, '', '', '', '', ''),
(2, 'asd', '123', 'asew', 'asdfg', '');

-- --------------------------------------------------------

--
-- Table structure for table `memberclubs`
--

CREATE TABLE `memberclubs` (
  `UserId` varchar(25) NOT NULL,
  `ClubId` varchar(255) NOT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberclubs`
--

INSERT INTO `memberclubs` (`UserId`, `ClubId`, `Id`) VALUES
('1', '1', 1),
('1', '2', 2),
('2', '3', 3),
('4', '4', 5),
('5', '3', 6),
('5', '1', 7),
('4', '2', 8);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `Id` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `ClubId` varchar(255) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `UserPic` varchar(255) NOT NULL,
  `TimeStamp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registereduserdetails`
--

CREATE TABLE `registereduserdetails` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `MobileNumber` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `DateOfBirth` varchar(255) NOT NULL,
  `Interests` varchar(255) NOT NULL,
  `ProfilePic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registereduserdetails`
--

INSERT INTO `registereduserdetails` (`Id`, `FirstName`, `LastName`, `MobileNumber`, `Email`, `Password`, `Token`, `isActive`, `DateOfBirth`, `Interests`, `ProfilePic`) VALUES
(1, 'Jangam ', 'Abiya Hanson', '7901259915', 'abiyahanson@gmail.com', '$2y$10$0Eq5Gaw2uSu23aKJQj/zXeEl9yBZx16xrGYQyp0fjdS7cMwSYjM9G', '63fccae4a4b6a8.73849504', 1, '2023-03-10', '', './Api/ProfilePictures/empty.jpg'),
(2, 'Abiya', 'Hanson', '123456', 'abiyahanson12@gmail.com', '$2y$10$42W2oBUt6IK4ojlJToOg6eBQqpVgqmIBBTo5yyVdjbPpJjgpU6TV2', '63fccbe23a13b3.43040681', 1, '2023-03-10', '', './Api/ProfilePictures/empty.jpg'),
(4, 'Ajay', 'sikhinam', '09182105041', 'ajaysikhinam888@gmail.com', '$2y$10$syiBYektQYiO4Ck7W1ZrxOVTrOGqt.R1rgfuDMKBEuLYUGGYLSYJ.', '6421324e1d8295.33227561', 1, '2023-04-13', '[\"Dance\",\"Yoga\"]', './Api/ProfilePictures/4.jpg'),
(5, 'Ajay', 'sikhinam', '09182105041', 'ajaysikhinam530@gmail.com', '$2y$10$C/iItfQ76DUycImO.kWBtuWrSWimkYjCZBv45rRqYOy.pUhSShAYu', '64284c89584129.37100764', 1, '2023-04-12', '[\"Dance\",\"Yoga\"]', './Api/ProfilePictures/5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clubdetails`
--
ALTER TABLE `clubdetails`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `memberclubs`
--
ALTER TABLE `memberclubs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `registereduserdetails`
--
ALTER TABLE `registereduserdetails`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clubdetails`
--
ALTER TABLE `clubdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `memberclubs`
--
ALTER TABLE `memberclubs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registereduserdetails`
--
ALTER TABLE `registereduserdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;