-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2026 at 02:55 PM
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
-- Database: `task_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `recipient` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `message`, `recipient`, `type`, `date`, `is_read`) VALUES
(1, '\'Customer Feedback Survey Analysis\' has been Assigned to you. Please review and start working on it.', 3, 'New Task Assigned', '2025-11-06', 1),
(2, '\'jessica this is your task\' has been assigned to you. Please review and start working on it', 9, 'New Task Assigned', '0000-00-00', 1),
(3, '\'task titlr\' has been assigned to you. Please review and start working on it', 9, 'New Task Assigned', '0000-00-00', 1),
(4, '\'task title\' has been assigned to you. Please review and start working on it', 3, 'New Task Assigned', '2025-11-02', 1),
(5, '\'look at the task\' has been assigned to you. Please review and start working on it', 3, 'New Task Assigned', '2025-11-02', 1),
(6, '\'look the website of the managers branch\' has been assigned to you. Please review and start working on it', 9, 'New Task Assigned', '2025-11-02', 1),
(7, '\'montly sales\' has been assigned to you. Please review and start working on it', 9, 'New Task Assigned', '2025-11-07', 1),
(8, '\'title task for oliver\' has been assigned to you. Please review and start working on it', 12, 'New Task Assigned', '2025-11-14', 1),
(9, '\'mobile sales\' has been assigned to you. Please review and start working on it', 9, 'New Task Assigned', '2025-12-07', 1),
(10, '\'task 1\' has been assigned to you. Please review and start working on it', 17, 'New Task Assigned', '2025-12-07', 1),
(11, '\'ttamanna\' has been assigned to you. Please review and start working on it', 18, 'New Task Assigned', '2025-12-26', 1),
(12, '\'fdzv\' has been assigned to you. Please review and start working on it', 9, 'New Task Assigned', '2026-01-20', 0),
(13, '\'hello user\' has been assigned to you. Please review and start working on it', 3, 'New Task Assigned', '2026-01-20', 1),
(14, '\'gfxchgvjm\' has been assigned to you. Please review and start working on it', 20, 'New Task Assigned', '2026-01-26', 0),
(15, '\'hello\' has been assigned to you. Please review and start working on it', 21, 'New Task Assigned', '2026-01-26', 1),
(16, '\'create a montly sales report for sugacare.\' has been assigned to you. Please review and start working on it', 21, 'New Task Assigned', '2026-02-01', 1),
(17, '\'create sales report\' has been assigned to you. Please review and start working on it', 26, 'New Task Assigned', '2026-02-03', 1),
(18, '\'Monthly Financial Report Preparation\' has been assigned to you. Please review and start working on it', 31, 'New Task Assigned', '2026-02-10', 1),
(19, '\'Customer Feedback Survey Analysis\' has been assigned to you. Please review and start working on it', 31, 'New Task Assigned', '2026-02-10', 1),
(20, '\'Website Maintaenace and Update\' has been assigned to you. Please review and start working on it', 32, 'New Task Assigned', '2026-02-10', 1),
(21, '\'Quarterly Inventory Audit\' has been assigned to you. Please review and start working on it', 31, 'New Task Assigned', '2026-02-10', 1),
(22, '\'Employee Training Program Development\' has been assigned to you. Please review and start working on it', 31, 'New Task Assigned', '2026-02-10', 1),
(23, '\'keep monthly sales record of xyz company\' has been assigned to you. Please review and start working on it', 34, 'New Task Assigned', '2026-02-19', 1),
(24, '\'update report\' has been assigned to you. Please review and start working on it', 35, 'New Task Assigned', '2026-03-15', 1),
(25, '\'Monthly Financial Report Preparation\' has been assigned to you. Please review and start working on it', 37, 'New Task Assigned', '2026-03-26', 1),
(26, '\'Monthly Financial Report Preparation\' has been assigned to you. Please review and start working on it', 39, 'New Task Assigned', '2026-03-26', 1),
(27, '\'Customer Feedback Survey Analysis\' has been assigned to you. Please review and start working on it', 39, 'New Task Assigned', '2026-03-26', 1),
(28, '\'Website Maintaenace and Update\' has been assigned to you. Please review and start working on it', 40, 'New Task Assigned', '2026-03-26', 1),
(29, '\'Quarterly Inventory Audit\' has been assigned to you. Please review and start working on it', 40, 'New Task Assigned', '2026-03-26', 0),
(30, '\'Employee Training Program Development\' has been assigned to you. Please review and start working on it', 40, 'New Task Assigned', '2026-03-26', 0),
(31, '\'task\' has been assigned to you. Please review and start working on it', 41, 'New Task Assigned', '2026-03-27', 1),
(32, '\'task title\' has been assigned to you. Please review and start working on it', 42, 'New Task Assigned', '2026-03-27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `assigned_to`, `due_date`, `status`, `created_at`) VALUES
(42, 'Monthly Financial Report Preparation', 'Prepare and review the monthly financial report, including profit and\r\nloss statements, balance sheets, and cash flow analysis', 39, '2026-03-25', 'in_progress', '2026-03-26 14:27:07'),
(43, 'Customer Feedback Survey Analysis', 'Collect and analyze data from the latest customer feedback survey to identify areas for improvement in customer service.', 39, '2026-03-27', 'completed', '2026-03-26 14:29:04'),
(44, 'Website Maintaenace and Update', 'Perform regular maintenance on the company website, update\r\ncontent, and ensure all security patches are applied', 40, '0000-00-00', 'pending', '2026-03-26 14:29:37'),
(45, 'Quarterly Inventory Audit', 'Conduct a thorough audit of inventory levels across all warehouses\r\nand update the inventory management system accordingly', 40, '2026-03-28', 'pending', '2026-03-26 14:30:24'),
(46, 'Employee Training Program Development', 'Develop and implement a new training program focused on enhancing employee skills in project management and teamwork', 40, '2026-03-27', 'completed', '2026-03-26 14:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','employee') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `password`, `role`, `created_at`) VALUES
(2, 'oliver', 'admin', '$2y$10$Vb7s0C.ZN0LLbV0pvZt50.26QYPO9O63RA1kDhx3v0Am5SRGw4vSu', 'admin', '2025-10-24 11:37:48'),
(39, 'john smith', 'john', '$2y$10$ZP6N3vXBu2Zrbq2f6CyeUOxV92AZR8QxYsg7gOUFnlf//2iRnzLHS', 'employee', '2026-03-26 14:25:43'),
(40, 'riya singh', 'riya', '$2y$10$rvYqnFsfV6mV.gGz1jiC7en3H8ZEYx/y6GArr2nKFyIXlIQprOXu2', 'employee', '2026-03-26 14:26:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
