-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 26, 2021 at 01:48 PM
-- Server version: 5.7.35-0ubuntu0.18.04.2
-- PHP Version: 7.2.24-0ubuntu0.18.04.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Thyroidapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Sno` int(50) NOT NULL,
  `Name` text NOT NULL,
  `age` int(50) NOT NULL,
  `Gender` int(11) NOT NULL,
  `on_thyroxine` int(11) NOT NULL,
  `query_on_thyroxine` int(11) NOT NULL,
  `on_antithyroid_medication` int(11) NOT NULL,
  `sickness` int(11) NOT NULL,
  `pregnant` int(11) NOT NULL,
  `thyroid_surgery` int(11) NOT NULL,
  `I131_treatment` int(11) NOT NULL,
  `query_hypothyroid` int(11) NOT NULL,
  `query_hyperthyroid` int(11) NOT NULL,
  `lithium` int(11) NOT NULL,
  `goitre` int(11) NOT NULL,
  `tumor` int(11) NOT NULL,
  `hypopituitary` int(11) NOT NULL,
  `psych` int(11) NOT NULL,
  `T3` float(11,0) NOT NULL,
  `TT4` float NOT NULL,
  `T4U` float NOT NULL,
  `FTI` float NOT NULL,
  `referral_source` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Sno`, `Name`, `age`, `Gender`, `on_thyroxine`, `query_on_thyroxine`, `on_antithyroid_medication`, `sickness`, `pregnant`, `thyroid_surgery`, `I131_treatment`, `query_hypothyroid`, `query_hyperthyroid`, `lithium`, `goitre`, `tumor`, `hypopituitary`, `psych`, `T3`, `TT4`, `T4U`, `FTI`, `referral_source`) VALUES
(1, 'Tushar arora', 18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 54, 34.4, 45.8, 43, 1),
(3, 'myname', 34, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 34, 54, 34, 54, 3),
(4, 'ashish', 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 34, 34, 23, 4),
(7, 'arora', 34, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 43, 23, 43, 23, 4),
(8, 'tushar', 23, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 34, 23, 43, 23, 4),
(9, 'Tushar', 20, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 32, 43, 23, 43, 4),
(10, 'dfg', 345, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 34, 54, 34, 54, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
