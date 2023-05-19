-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2023 at 12:41 PM
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
(1, 'testclub-1', '5', 'Technical', 'this is a Technical club'),
(2, 'testclub-2', '8', 'Technical', 'this is a Technical club'),
(3, 'testclub-3', '8', 'Dance', 'this is a Dance club'),
(4, 'testClub4', '9', 'Drawing', 'This Description of Other Club -4');

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
(5, '7', '8', 'Ajaysikhinam', './Api/ProfilePictures/4.jpg'),
(6, '8', '9', 'Ajaysikhinam', './Api/ProfilePictures/4.jpg'),
(7, '9', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(8, '9', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg'),
(9, '10', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(10, '11', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(11, '12', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(12, '13', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(13, '14', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(14, '15', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(15, '16', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(16, '17', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(17, '18', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(18, '19', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(19, '20', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(20, '21', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(21, '22', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(22, '23', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(23, '24', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(24, '25', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(25, '26', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg');

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
(7, 'painting', '2023-04-05', '12:40', 'ground', '4', 'This is a painting event', '8', 'Prasanth Banavth', './Api/ProfilePictures/8.jpg'),
(8, 'Singing', '2023-03-29', '12:25', 'CSE blick', '2', 'This is the clear singing part.', '8', 'Prasanth Banavath', './Api/ProfilePictures/8.jpg'),
(9, 'Cricket', '2023-03-28', '12:39', 'Mech block', '2', 'Come visit us at the cricket ground.', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(20, 'Product Launch Event', '2023-05-25', '09:00', 'Vijayawada', '3', '', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(21, 'Workshops', '2023-05-23', '11:30', 'Tirupathi', '3', '', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(22, 'Conferences', '2023-05-24', '02:00', 'Ongole', '3', '', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(23, 'Cambridge Avenue Event', '2023-05-25', '01:00', 'Guntur', '1', '', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(24, 'Crystal Waterfall Event Planning', '2023-05-22', '11:00', 'Vijayawada', '1', '', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(25, 'Trade shows', '2023-05-15', '10:00', 'Narasaraopet', '1', '', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg'),
(26, 'Charity Event', '2023-05-17', '12:00', 'Tenali', '2', '', '5', 'Ajaysikhinam', './Api/ProfilePictures/5.jpg');

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
('4', '2', 8),
('2', '2', 9),
('5', '2', 12),
('8', '4', 19),
('5', '1', 20),
('10', '2', 21),
('10', '3', 22),
('9', '3', 23),
('9', '1', 24);

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
(13, '6nXpkuWMWKjupexe', '3', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '15.18.26/22:04:2023'),
(14, 'ynXpkuWMT6/2pa06eCXw', '4', '4', 'Ajay sikhinam', './Api/ProfilePictures/4.jpg', '00.07.14/05:05:2023'),
(15, 'ynXpkuWMXrf2rw==', '4', '8', 'Banavathu Prasanth Kumar', './Api/ProfilePictures/8.jpg', '00.07.23/05:05:2023'),
(16, 'ynX83v7EWq/y', '2', '5', 'Ajay sikhinam', './Api/ProfilePictures/5.jpg', '10.09.46/05:05:2023'),
(17, 'ynXpkuXD', '2', '10', 'AbiyaHanson Jangam', './Api/ProfilePictures/empty.jpg', '10.09.51/05:05:2023'),
(18, '6nX83v7EWq/y', '3', '5', 'Ajay sikhinam', './Api/ProfilePictures/5.jpg', '21.56.58/13:05:2023');

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
(5, 'Ajay', 'sikhinam', '09182105041', 'ajaysikhinam530@gmail.com', '$2y$10$C/iItfQ76DUycImO.kWBtuWrSWimkYjCZBv45rRqYOy.pUhSShAYu', '64284c89584129.37100764', 1, '2023-04-12', '[\"Dance\",\"Yoga\"]', './Api/ProfilePictures/5.jpg', 'inactive'),
(8, 'Banavathu', 'Prasanth Kumar', '7995679046', 'prasanth050802@gmail.com', '$2y$10$UqpkgmrpiIBQnJjNsd77W.QTraYuOzqRWjNGj6PzP2DjYSi8IbqAq', '6453fa30e24df8.80285092', 1, '', '[]', './Api/ProfilePictures/8.jpg', 'active'),
(9, 'Pravallika', 'Kesani', '7386138320', 'o170668@rguktong.ac.in', '$2y$10$KFQqYZzPNRtQ3bvYJp3gkedrDyN9J9tEbayK.q5yRhlPvDqDvvOie', '64547eab836335.23136710', 1, '2001-02-21', '[]', './Api/ProfilePictures/9.jpg', 'inactive'),
(10, 'AbiyaHanson', 'Jangam', '7901259915', 'abiyahanson@gmail.com', '$2y$10$pKeBixjARQOXvW.RX0csG.PqS3vbZKUN4UBWVixH.SgSq3hRw2RMu', '64548813b63c54.91619739', 1, '', '[]', './Api/ProfilePictures/10.jpg', 'inactive');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `memberclubs`
--
ALTER TABLE `memberclubs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `registereduserdetails`
--
ALTER TABLE `registereduserdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
