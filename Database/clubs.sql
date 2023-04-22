-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 12:10 PM
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
-- Table structure for table `eventmembers`
--

CREATE TABLE `eventmembers` (
  `Id` int(11) NOT NULL,
  `EventId` varchar(255) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `UserPic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eventmembers`
--

INSERT INTO `eventmembers` (`Id`, `EventId`, `UserId`, `UserName`, `UserPic`) VALUES
(1, '4', 'Ajay', '', ''),
(2, '4', 'Test', 'Test', 'Test'),
(3, '5', 'Test', 'Test', 'Test'),
(4, '6', '', '', ''),
(5, '7', '4', 'Ajaysikhinam', './Api/ProfilePictures/4.jpg'),
(6, '8', '4', 'Ajaysikhinam', './Api/ProfilePictures/4.jpg'),
(7, '9', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(8, '9', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `Time` varchar(255) NOT NULL,
  `Venue` varchar(255) NOT NULL,
  `ClubId` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `OrganizerId` varchar(255) NOT NULL,
  `OrganizerName` varchar(255) NOT NULL,
  `OrganizerPic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`Id`, `Name`, `Date`, `Time`, `Venue`, `ClubId`, `Description`, `OrganizerId`, `OrganizerName`, `OrganizerPic`) VALUES
(1, '', '', '', '', '', '', '', '', ''),
(2, 'asd', '123', '', '', 'asew', 'asdfg', '', '', ''),
(3, '', '', '', '', '', '', '', '', ''),
(4, 'Test', 'Test', 'Test', 'Test', 'est', 'Test', 'Test', 'Test', 'Test'),
(5, 'Test', 'Test', 'Test', 'Test', 'est', 'Test', 'Test', 'Test', 'Test'),
(6, '', '', '', '', '', '', '', '', ''),
(7, 'painting', '2023-04-05', '12:40', 'ground', '4', 'This is a painting event', '4', 'Ajaysikhinam', './Api/ProfilePictures/4.jpg'),
(8, 'Singing', '2023-03-29', '12:25', 'CSE blick', '2', 'This is the clear singing part.', '4', 'Ajaysikhinam', './Api/ProfilePictures/4.jpg'),
(9, 'Cricket', '2023-03-28', '12:39', 'Mech block', '2', 'Come visit us at the cricket ground.', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg');

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
('2', '3', 3),
('4', '4', 5),
('5', '3', 6),
('5', '1', 7),
('4', '2', 8),
('2', '2', 9),
('5', '2', 12);

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`Id`, `Message`, `ClubId`, `UserId`, `UserName`, `UserPic`, `TimeStamp`) VALUES
(1, '6nXpkuWMXrf2r+xsNHU=', '2', '5', 'Ajay sikhinam', './Api/ProfilePictures/5.jpg', '11.31.54/05:04:2023'),
(2, '6nXpkuWMXrf2r+xhP30=', '2', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '11.32.10/05:04:2023'),
(3, '9XjkivmMWLL+uKt0YyPaxekEYPLeBvzaB/lew5BpAle8Tg==', '2', '5', 'Ajay sikhinam', './Api/ProfilePictures/5.jpg', '11.32.31/05:04:2023'),
(4, '43zp3u3DULk=', '2', '5', 'Ajay sikhinam', './Api/ProfilePictures/5.jpg', '11.32.38/05:04:2023'),
(5, '+3X23uPYTP32uqB0eyiW3g==', '2', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '11.32.50/05:04:2023'),
(6, '1XjkiqrNXbLiouwtYzg=', '2', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '11.32.56/05:04:2023'),
(7, 'zXvkh6riVr7y', '2', '5', 'Ajay sikhinam', './Api/ProfilePictures/5.jpg', '11.33.11/05:04:2023'),
(8, '6nXpkuWMXLzj9q0+bTQ=', '2', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '15.48.12/05:04:2023'),
(9, '6nX83ujAXr789q0+bTQ=', '2', '5', 'Ajay sikhinam', './Api/ProfilePictures/5.jpg', '15.48.26/05:04:2023'),
(10, '6nXpkuWMS7XypKl0YSSJ2vIRKLjO', '2', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '17.31.28/05:04:2023'),
(11, '6nXpkuWm', '2', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '14.29.38/21:04:2023'),
(12, '6nXpkuWMS7XypKl0aziDwQ==', '4', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '12.34.42/22:04:2023'),
(13, '6nXpkuWMWKjupexe', '3', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '15.18.26/22:04:2023');

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
  `ProfilePic` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registereduserdetails`
--

INSERT INTO `registereduserdetails` (`Id`, `FirstName`, `LastName`, `MobileNumber`, `Email`, `Password`, `Token`, `isActive`, `DateOfBirth`, `Interests`, `ProfilePic`, `Status`) VALUES
(1, 'Jangam ', 'Abiya Hanson', '7901259915', 'abiyahanson@gmail.com', '$2y$10$0Eq5Gaw2uSu23aKJQj/zXeEl9yBZx16xrGYQyp0fjdS7cMwSYjM9G', '63fccae4a4b6a8.73849504', 1, '2023-03-10', '', './Api/ProfilePictures/empty.jpg', 'inactive'),
(2, 'Abiya', 'Hanson', '123456', 'abiyahanson12@gmail.com', '$2y$10$42W2oBUt6IK4ojlJToOg6eBQqpVgqmIBBTo5yyVdjbPpJjgpU6TV2', '63fccbe23a13b3.43040681', 1, '2023-03-10', '', './Api/ProfilePictures/empty.jpg', 'inactive'),
(4, 'Ajay', 'sikhinam', '09182105041', 'ajaysikhinam888@gmail.com', '$2y$10$syiBYektQYiO4Ck7W1ZrxOVTrOGqt.R1rgfuDMKBEuLYUGGYLSYJ.', '6421324e1d8295.33227561', 1, '2023-04-13', '[\"Dance\",\"Yoga\"]', './Api/ProfilePictures/4.jpg', 'inactive'),
(5, 'Ajay', 'sikhinam', '09182105041', 'ajaysikhinam530@gmail.com', '$2y$10$C/iItfQ76DUycImO.kWBtuWrSWimkYjCZBv45rRqYOy.pUhSShAYu', '64284c89584129.37100764', 1, '2023-04-12', '[\"Dance\",\"Yoga\"]', './Api/ProfilePictures/5.jpg', 'inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clubdetails`
--
ALTER TABLE `clubdetails`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `eventmembers`
--
ALTER TABLE `eventmembers`
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
-- AUTO_INCREMENT for table `eventmembers`
--
ALTER TABLE `eventmembers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `memberclubs`
--
ALTER TABLE `memberclubs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `registereduserdetails`
--
ALTER TABLE `registereduserdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
