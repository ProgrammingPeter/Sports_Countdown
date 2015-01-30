-- phpMyAdmin SQL Dump
-- version 4.0.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 02, 2014 at 05:01 AM
-- Server version: 5.5.33
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nbaschedule`
--
CREATE DATABASE IF NOT EXISTS `nbaschedule` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `nbaschedule`;

-- --------------------------------------------------------

--
-- Table structure for table `Conferences`
--

CREATE TABLE `Conferences` (
  `ConferenceID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  KEY `ConferenceID` (`ConferenceID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Conferences`
--

INSERT INTO `Conferences` (`ConferenceID`, `Name`) VALUES
(1, 'Eastern Conference'),
(2, 'Western Conference');

-- --------------------------------------------------------

--
-- Table structure for table `Divisions`
--

CREATE TABLE `Divisions` (
  `DivisionID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ConferenceID` int(11) NOT NULL,
  KEY `DivisionID` (`DivisionID`),
  KEY `ConferenceID` (`ConferenceID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Divisions`
--

INSERT INTO `Divisions` (`DivisionID`, `Name`, `ConferenceID`) VALUES
(1, 'Atlantic Division', 1),
(2, 'Central Division', 1),
(3, 'Southeast Division', 1),
(4, 'Pacific Division', 2),
(5, 'Southwest', 2),
(6, 'Northwest Division', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Schedules`
--

CREATE TABLE `Schedules` (
  `ScheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `HomeTeam` char(3) COLLATE latin1_general_ci NOT NULL,
  `AwayTeam` char(3) COLLATE latin1_general_ci NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Televized` tinyint(1) NOT NULL DEFAULT '0',
  `TVNetwork` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `AwayTeam` (`AwayTeam`),
  KEY `HomeTeam` (`HomeTeam`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Schedules`
--

INSERT INTO `Schedules` (`ScheduleID`, `HomeTeam`, `AwayTeam`, `Date`, `Televized`, `TVNetwork`) VALUES
(1, 'BOS', 'NYK', '2014-12-12 17:30:00', 0, ''),
(2, 'NYK', 'BOS', '2015-02-03 17:30:00', 1, 'ESPN');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `ID` varchar(4) COLLATE latin1_general_ci NOT NULL COMMENT 'Primary Key - Team 3 Letter Tag',
  `FullName` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `City` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `DivisionID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `ConferenceID` (`DivisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`ID`, `FullName`, `City`, `DivisionID`) VALUES
('ATL', 'Atlanta Hawks', 'Atlanta', 3),
('BKN', 'Brooklyn Nets', 'Brooklyn', 1),
('BOS', 'Boston Celtics', 'Boston', 1),
('CHA', 'Charlotte Hornets', 'Charlotte', 3),
('CHI', 'Chicago Bulls', 'Chicago', 2),
('CLE', 'Cleveland Cavaliers', 'Cleveland', 2),
('DAL', 'Dallas Mavericks', 'Dallas', 5),
('DEN', 'Denver Nuggets', 'Denver', 6),
('DET', 'Detroit Pistons', 'Detroit', 2),
('GSW', 'Golden State Warriors', 'Golden State', 4),
('HOU', 'Houston Rockets', 'Houston', 5),
('IND', 'Indiana Pacers', 'Indiana', 2),
('LAC', 'Los Angeles Clippers', 'Los Angeles', 4),
('LAL', 'Los Angeles Lakers', 'Los Angeles', 4),
('MEM', 'Memphis Grizzlies', 'Memphis', 5),
('MIA', 'Miami Heat', 'Miami', 3),
('MIL', 'Milwaukee Bucks', 'Milwaukee', 2),
('MIN', 'Minnesota Timberwolves', 'Minnesota', 6),
('NO', 'New Orleans Pelicans', 'New Orleans', 5),
('NYK', 'New York Knicks', 'New York', 1),
('OKC', 'Oklahoma City Thunder', 'Oklahoma City', 6),
('ORL', 'Orlando Magic', 'Orlando', 3),
('PHI', 'Philadelphia 76ers', 'Philadelphia', 1),
('PHX', 'Phoenix Suns', 'Phoenix', 4),
('POR', 'Portland Trailblazers', 'Portland', 6),
('SAC', 'Sacramento Kings', 'Sacramento', 4),
('SAS', 'San Antonio Spurs', 'San Antonio', 5),
('TOR', 'Toronto Raptors', 'Toronto', 1),
('UTAH', 'Utah Jazz', 'Utah', 6),
('WSH', 'Washington Wizards', 'Washington', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Divisions`
--
ALTER TABLE `Divisions`
  ADD CONSTRAINT `divisions_ibfk_1` FOREIGN KEY (`ConferenceID`) REFERENCES `Conferences` (`ConferenceID`);

--
-- Constraints for table `Schedules`
--
ALTER TABLE `Schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`AwayTeam`) REFERENCES `Teams` (`ID`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`HomeTeam`) REFERENCES `Teams` (`ID`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `team_division` FOREIGN KEY (`DivisionID`) REFERENCES `divisions` (`DivisionID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
