-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2025 at 10:04 AM
-- Server version: 8.0.30
-- PHP Version: 8.0.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `egov`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `houseNumber` varchar(255) DEFAULT NULL,
  `streetAddress` varchar(255) DEFAULT NULL,
  `subDivision` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `countryId` int DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `cityId` int DEFAULT NULL,
  `postOfficeBox` varchar(255) DEFAULT NULL,
  `livingIn` enum('bhamas','overseas') DEFAULT NULL,
  `sameAsHomeAddress` tinyint(1) DEFAULT '0',
  `idValidation` enum('creditCard','postOffice') DEFAULT NULL,
  `statusType` enum('approve','reject') DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` json NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blockedIps`
--

CREATE TABLE `blockedIps` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `browserInfo` varchar(255) DEFAULT NULL,
  `blockedType` enum('Login','PowerPanel') DEFAULT NULL,
  `loginAccess` enum('N','Y') DEFAULT 'N',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sortName` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `imageId` int DEFAULT NULL,
  `isPublish` enum('active','inActive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `isPublish` enum('active','inActive') DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `imageId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formBuilder`
--

CREATE TABLE `formBuilder` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `formName` varchar(255) DEFAULT NULL,
  `formType` varchar(255) DEFAULT NULL,
  `departmentId` int DEFAULT NULL,
  `serviceId` int DEFAULT NULL,
  `formData` text,
  `status` enum('active','inActive') DEFAULT 'inActive',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uploadPath` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `imageSize` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `allUsersId` text,
  `addRecordCode` int DEFAULT NULL,
  `notificationText` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `unreadUsersId` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviewFeedbacks`
--

CREATE TABLE `reviewFeedbacks` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `departmentId` int DEFAULT NULL,
  `type` enum('eGOV','Department Service','other') DEFAULT NULL,
  `ratings` int DEFAULT NULL,
  `comment` text,
  `status` enum('pending','approve','reject') DEFAULT 'pending',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `isPublish` enum('active','inActive') DEFAULT 'inActive',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int NOT NULL,
  `departmentId` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fees` int DEFAULT NULL,
  `tat` time DEFAULT NULL,
  `imageId` int DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isPublish` enum('active','inActive') DEFAULT 'active',
  `prerequisite` text,
  `instructions` text,
  `documentId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `imageId` int DEFAULT NULL,
  `settingName` varchar(255) DEFAULT NULL,
  `fieldName` varchar(255) DEFAULT NULL,
  `fieldValue` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `updatedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `countryId` int DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticketComment`
--

CREATE TABLE `ticketComment` (
  `id` int NOT NULL,
  `commentParentId` int DEFAULT NULL,
  `ticketSystemId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticketCommentReply`
--

CREATE TABLE `ticketCommentReply` (
  `id` int NOT NULL,
  `ticketCommentId` int NOT NULL,
  `userId` int NOT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `replyComment` varchar(255) DEFAULT NULL,
  `respondedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticketSystem`
--

CREATE TABLE `ticketSystem` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ticketNumber` varchar(255) DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `respondedOn` datetime DEFAULT NULL,
  `status` enum('new','closed','inProgress','pending') DEFAULT 'new',
  `priority` enum('high','low','medium') DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `departmentId` int DEFAULT NULL,
  `serviceId` int DEFAULT NULL,
  `imageId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `assignedToUserId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `resetCount` int DEFAULT NULL,
  `expiredTime` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `resident` enum('Citizen/Resident','nonResident') DEFAULT NULL,
  `gender` enum('male','female','others') DEFAULT NULL,
  `nibNumber` varchar(255) DEFAULT NULL,
  `imageId` int DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `countryOfBirth` varchar(255) DEFAULT NULL,
  `countryOfCitizenship` varchar(255) DEFAULT NULL,
  `cityOfBirth` varchar(255) DEFAULT NULL,
  `addressId` int DEFAULT NULL,
  `departmentId` int DEFAULT NULL,
  `mobileNumber` int DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  `status` enum('active','inActive') DEFAULT 'inActive',
  `isDelete` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userType` enum('Employee','External Vendor') DEFAULT NULL,
  `loginAttempts` int DEFAULT '0',
  `lastLoginAttempt` varchar(255) DEFAULT NULL,
  `notificationCount` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `countryId` (`countryId`),
  ADD KEY `stateId` (`stateId`),
  ADD KEY `cityId` (`cityId`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blockedIps`
--
ALTER TABLE `blockedIps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stateId` (`stateId`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `formBuilder`
--
ALTER TABLE `formBuilder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `departmentId` (`departmentId`),
  ADD KEY `serviceId` (`serviceId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `reviewFeedbacks`
--
ALTER TABLE `reviewFeedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentId` (`documentId`),
  ADD KEY `departmentId` (`departmentId`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countryId` (`countryId`);

--
-- Indexes for table `ticketComment`
--
ALTER TABLE `ticketComment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticketSystemId` (`ticketSystemId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `ticketCommentReply`
--
ALTER TABLE `ticketCommentReply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticketCommentId` (`ticketCommentId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `ticketSystem`
--
ALTER TABLE `ticketSystem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `departmentId` (`departmentId`),
  ADD KEY `serviceId` (`serviceId`),
  ADD KEY `imageId` (`imageId`),
  ADD KEY `assignedToUserId` (`assignedToUserId`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`mobileNumber`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `imageId` (`imageId`),
  ADD KEY `addressId` (`addressId`),
  ADD KEY `departmentId` (`departmentId`),
  ADD KEY `roleId` (`roleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blockedIps`
--
ALTER TABLE `blockedIps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formBuilder`
--
ALTER TABLE `formBuilder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviewFeedbacks`
--
ALTER TABLE `reviewFeedbacks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketComment`
--
ALTER TABLE `ticketComment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketCommentReply`
--
ALTER TABLE `ticketCommentReply`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketSystem`
--
ALTER TABLE `ticketSystem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_753` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `address_ibfk_754` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `address_ibfk_755` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `address_ibfk_756` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blockedIps`
--
ALTER TABLE `blockedIps`
  ADD CONSTRAINT `blockedIps_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `formBuilder`
--
ALTER TABLE `formBuilder`
  ADD CONSTRAINT `formBuilder_ibfk_184` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formBuilder_ibfk_185` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `formBuilder_ibfk_186` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `reviewFeedbacks`
--
ALTER TABLE `reviewFeedbacks`
  ADD CONSTRAINT `reviewFeedbacks_ibfk_135` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewFeedbacks_ibfk_136` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_376` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_ibfk_377` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `setting`
--
ALTER TABLE `setting`
  ADD CONSTRAINT `setting_ibfk_85` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_ibfk_86` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticketComment`
--
ALTER TABLE `ticketComment`
  ADD CONSTRAINT `ticketComment_ibfk_264` FOREIGN KEY (`ticketSystemId`) REFERENCES `ticketSystem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticketComment_ibfk_265` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticketCommentReply`
--
ALTER TABLE `ticketCommentReply`
  ADD CONSTRAINT `ticketCommentReply_ibfk_203` FOREIGN KEY (`ticketCommentId`) REFERENCES `ticketComment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticketCommentReply_ibfk_204` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticketSystem`
--
ALTER TABLE `ticketSystem`
  ADD CONSTRAINT `ticketSystem_ibfk_767` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticketSystem_ibfk_768` FOREIGN KEY (`serviceId`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticketSystem_ibfk_769` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticketSystem_ibfk_770` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticketSystem_ibfk_771` FOREIGN KEY (`assignedToUserId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_791` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_792` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_793` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_794` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
