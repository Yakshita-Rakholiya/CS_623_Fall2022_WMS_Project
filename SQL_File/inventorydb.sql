-- Database - MySQL Workbench
-- version 8.0.30
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2022 at 07:20 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventorydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(200) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 1234567890, 'admin@pace.edu', '076cbe104245ae41fbfb9ee66d5565c1', '2022-06-25 07:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrand`
--

CREATE TABLE `tblbrand` (
  `ID` int(10) NOT NULL,
  `BrandName` varchar(200) DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbrand`
--

INSERT INTO `tblbrand` (`ID`, `BrandName`, `Status`, `CreationDate`) VALUES
(26, '500cc Dark Amber PET(45/400)', 1, '2022-12-04 01:33:23'),
(27, '500cc Clear PET (45/400)', 1, '2022-12-04 01:33:40'),
(28, '500cc Clear PET (53/400)', 1, '2022-12-04 01:33:55'),
(29, '500cc White HDPE Bottle 53/400', 1, '2022-12-04 01:34:11'),
(30, '500CC Clear PET Bottle (53/400)', 1, '2022-12-04 01:34:24'),
(31, '500CC White HDPE Bottle (53/400)', 1, '11-28-2022 09:10:22'),
(32, '500cc Amber Bottle 53/400', 1, '2022-12-04 01:34:56'),
(33, '500cc Pet Dark Amber Bottle 45/400 (SMP)', 1, '2022-12-04 01:35:11');


-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `ID` int(10) NOT NULL,
  `ProductId` int(5) DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `ProductQty` int(11) DEFAULT NULL,
  `IsCheckOut` int(5) DEFAULT NULL,
  `CartDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcart`
--

INSERT INTO `tblcart` (`ID`, `ProductId`, `BillingId`, `ProductQty`, `IsCheckOut`, `CartDate`) VALUES
(38, 17, 492730430, 3070, 1, '2022-12-04 01:44:03'),
(39, 17, 650518955, 3050, 1, '2022-12-04 01:45:23'),
(40, 17, 350947161, 2549, 1, '2022-12-04 01:46:17'),
(41, 17, 815756750, 2699, 1, '2022-12-04 01:46:17'),
(42, 17, 170766186, 3036, 1, '2022-12-04 01:47:55'),
(43, 17, 401581921, 509, 1, '2022-11-22 05:53:15');


-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `ID` int(10) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `CategoryName`, `Status`, `CreationDate`) VALUES
(17, '500CC', 1, '2022-12-04 01:24:39');


-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `ID` int(10) NOT NULL,
  `BillingNumber` varchar(120) DEFAULT NULL,
  `CustomerName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `ModeofPayment` varchar(50) DEFAULT NULL,
  `BillingDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`ID`, `BillingNumber`, `CustomerName`, `MobileNumber`, `ModeofPayment`, `BillingDate`) VALUES
(7, '492730430', 'Lot # 081007 Omega 3 Fish Oil', 7797987987, 'cash', '2022-12-04 01:44:03'),
(8, '650518955', 'Lot # 012003 Omega 3 Fish Oil', 23456789, 'card', '2022-12-04 01:45:23'),
(9, '350947161', 'Lot # 062014 Omega 3 Fish Oil', 7987978979, 'card', '2022-12-04 01:46:17'),
(10, '815756750', 'Lot # 062022 Activated Charcoal Capsules', 52638596, 'card', '2022-12-04 01:47:06'),
(11, '170766186', 'Lot # 092022 Omega 3 Fish Oil', 748596, 'card', '2022-12-04 01:47:55'),
(12, '401581921', 'Lot # 092023 Omega 3 Fish Oil', 968574, 'card', '2022-12-04 01:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `ID` int(10) NOT NULL,
  `ProductName` varchar(200) DEFAULT NULL,
  `CatID` int(5) DEFAULT NULL,
  `SubcatID` int(5) DEFAULT NULL,
  `BrandName` varchar(200) DEFAULT NULL,
  `ModelNumber` varchar(200) DEFAULT NULL,
  `Stock` int(10) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`ID`, `ProductName`, `CatID`, `SubcatID`, `BrandName`, `ModelNumber`, `Stock`, `Price`, `Status`, `CreationDate`) VALUES
(17, '500cc Dark Amber PET (45/400)', 17, 28, '500cc Dark Amber PET (45/400)', '1234', 15092, '2', 1, '2022-12-04 01:37:27'),
(18, '500cc Clear PET (45/400)', 17, 29, '500cc Clear PET (45/400)', '12345',8624, '3', 1, '2022-12-04 01:38:12'),
(19, '500cc Clear PET (53/400)', 17, 30, '500cc Clear PET (53/400)', 2345, '75522','2', 1, '2022-12-04 01:38:58'),
(20, '500cc White HDPE Bottle 53/400', 17, 31, '500cc White HDPE Bottle 53/400', 23456, '4704','2', 1, '2022-12-04 01:39:49'),
(21, '500CC Clear PET Bottle (53/400)', 17, 32, '500CC Clear PET Bottle (53/400)', 3456, '17456', '4', 1, '2022-12-04 01:40:36'),
(22, '500CC White HDPE Bottle (53/400)', 17, 33, '500CC White HDPE Bottle (53/400)', '3456', '162680', '2', 1, '2022-12-04 01:41:25'),
(23, '500cc Amber Bottle 53/400', 17, 34, '500cc Amber Bottle 53/400', '4567', 3080, '4', 1, '2022-12-04 01:42:16'),
(24, '500cc Pet Dark Amber Bottle 45/400 (SMP)', 17, 35, '500cc Pet Dark Amber Bottle 45/400 (SMP)', '5678', 8820, '1', 1, '2022-12-04 01:42:58');


-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `ID` int(10) NOT NULL,
  `CatID` int(5) DEFAULT NULL,
  `SubCategoryname` varchar(200) DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`ID`, `CatID`, `SubCategoryname`, `Status`, `CreationDate`) VALUES
(28, 1, 'Dark Amber PET', 1, '2022-12-04 01:25:16'),
(29, 1, ' Clear PET', 1, '2022-12-04 01:25:35'),
(30, 1, 'Clear PET', 1, '2022-12-04 01:25:53'),
(31, 1, 'White HDPE Bottle', 1, '2022-12-04 01:26:11'),
(32, 1, 'Clear PET Bottle', 1, '2022-12-04 01:26:31'),
(33, 2, 'White HDPE Bottle', 1, '2022-12-04 01:26:51'),
(34, 2, ' Amber Bottle', 1, '2022-12-04 01:27:09'),
(35, 2, ' Pet Dark Amber Bottle', 1, '2022-12-04 01:27:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbrand`
--
ALTER TABLE `tblbrand`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BillingNumber` (`BillingNumber`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbrand`
--
ALTER TABLE `tblbrand`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
