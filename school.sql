-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2023 at 07:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE `chapter` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `chapter_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`id`, `class_id`, `subject_id`, `chapter_name`) VALUES
(1, 1, 2, 'Amader Gram'),
(2, 5, 11, 'five chapter update'),
(3, 5, 11, 'five 3'),
(4, 5, 11, 'new of five'),
(5, 5, 11, 'ok'),
(6, 1, 1, 'Matrix'),
(7, 1, 4, 'Hazrat Mohammad (s)'),
(8, 1, 1, 'Calculas');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `class_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `class_description`) VALUES
(1, 'one', 'CT: SHAMIM'),
(2, 'two', 'CT: Abul Kashem'),
(3, 'three', 'Sayed Ahmadullah'),
(4, 'four', 'Shamim'),
(5, 'five', 'CT: Abdur Razzak'),
(6, 'six', 'Hafizur Mia');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `respond` enum('yes','no') DEFAULT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`, `respond`, `createdAt`) VALUES
(1, 'Hello', 'test@gmail.com', '01722726897', 'hi', 'yes', '2023-04-02 20:30:09.032204'),
(3, 'Soikat', 'soikat@gmail.com', '01722726897', 'Basic Price koto tk?\r\n', 'no', '2023-04-08 23:24:15.284543');

-- --------------------------------------------------------

--
-- Table structure for table `creative`
--

CREATE TABLE `creative` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL,
  `question_option` text NOT NULL,
  `question_answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creative`
--

INSERT INTO `creative` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_option`, `question_answer`) VALUES
(1, 1, 2, 1, '<p>dsh</p>\r\n', '[\"<p>sdfh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\"]', NULL),
(2, 1, 2, 1, '<p>fdsh</p>\r\n', '[\"<p>sdh</p>\\r\\n\",\"<p>sdh</p>\\r\\n\",\"<p>sh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\"]', 'test'),
(3, 1, 2, 1, '<p>sdfh</p>\r\n', '[\"<p>sdh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\",\"<p>sdh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\"]', NULL),
(4, 1, 1, 6, '<p><span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span>&nbsp;ok&nbsp; lets gooooooooooooooooooo again d</p>\n\n<p>&nbsp;</p>\n', '[\"<p><span class=\\\"math-tex\\\">\\\\(x = -b \\\\pm a\\\\)</span></p>\\r\\n\",\"<p>x+1&nbsp;</p>\\r\\n\",\"<p>y+1</p>\\r\\n\",\"<p>x+2</p>\\r\\n\"]', 'no'),
(5, 1, 1, 6, '<p>Test questions</p>\r\n', '[\"<p>s</p>\\r\\n\",\"<p>d</p>\\r\\n\",\"<p>g</p>\\r\\n\",\"<p>g</p>\\r\\n\"]', 'no'),
(6, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>saet</p>\\r\\n\",\"<p><span class=\\\"math-tex\\\">\\\\(x = {-b \\\\pm \\\\sqrt{b^2-4ac} \\\\over 2a}\\\\)</span></p>\\r\\n\",\"<p>aset</p>\\r\\n\",\"<p>aset</p>\\r\\n\"]', NULL),
(7, 1, 1, 8, '<p><span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>ee</p>\\r\\n\",\"<p>22</p>\\r\\n\",\"<p>44</p>\\r\\n\"]', NULL),
(8, 1, 1, 6, '<p>Test</p>\r\n', '[\"<p>asdgg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL),
(9, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>asgd</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '6'),
(10, 1, 1, 6, '<p>asdgasdga</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL),
(11, 1, 2, 1, '<p>test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '88'),
(12, 1, 2, 1, '<p>asdg</p>\r\n', '[\"<p>sdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL),
(13, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL),
(14, 1, 1, 6, '<p>11</p>\r\n', '[\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\"]', NULL),
(15, 1, 1, 6, '<p>Creative answer test</p>\r\n', '[\"<p>xx</p>\\r\\n\",\"<p>dd</p>\\r\\n\",\"<p>dd</p>\\r\\n\",\"<p>dd</p>\\r\\n\"]', '<p>test</p>\r\n'),
(16, 1, 1, 6, '<p>ttt 300</p>\r\n', '[\"<p>dsag</p>\\r\\n\",\"<p>asdgg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\"]', '<p>asgd</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `q_set_id` int(11) NOT NULL,
  `class` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` int(2) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `name`, `code`, `q_set_id`, `class`, `subject`, `start_time`, `end_time`, `status`, `school_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(4, 'new answer cjecl', 'SHS_273_4949', 15, '1', '0', '2023-03-27 03:47:00', '2023-03-27 06:47:00', 0, 1, 1, '2023-03-26 21:48:03', '2023-03-26 21:48:03'),
(5, 'Model Test Exam', 'SHS_303_6388', 20, '1', '0', '2023-03-30 06:16:00', '2023-03-30 07:16:00', 0, 1, 1, '2023-03-30 00:16:20', '2023-03-30 00:16:20'),
(6, 'Test exam', 'SHS_24_5197', 27, '1', '0', '2023-04-02 19:53:00', '2023-04-02 20:53:00', 0, 1, 1, '2023-04-02 13:53:42', '2023-04-02 13:53:42'),
(7, 'Pre Test', 'SHS_55_4790', 32, '1', '1', '2023-05-05 09:41:00', '2023-05-05 10:42:00', 0, 1, 1, '2023-05-05 03:42:09', '2023-05-05 03:42:09'),
(8, 'Model Test 03', 'SHS_55_2352', 32, '1', '1', '2023-05-05 09:47:00', '2023-05-05 10:47:00', 0, 1, 1, '2023-05-05 03:47:13', '2023-05-05 03:47:13'),
(9, 'Test Exam 07', 'SHS_55_5015', 32, '1', '1', '2023-05-05 10:38:00', '2023-05-05 11:38:00', 0, 1, 1, '2023-05-05 04:38:19', '2023-05-05 04:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `exams_participants`
--

CREATE TABLE `exams_participants` (
  `id` int(11) NOT NULL,
  `answers` varchar(800) NOT NULL,
  `submit_on` datetime NOT NULL,
  `score` int(5) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `stu_id` int(10) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams_participants`
--

INSERT INTO `exams_participants` (`id`, `answers`, `submit_on`, `score`, `exam_id`, `stu_id`, `school_id`, `created_at`, `updated_at`) VALUES
(5, '\"0,0,0,1,1,2,3,0,1\"', '0000-00-00 00:00:00', 2, 5, 1111, 1, '2023-03-30 00:57:07', '2023-03-30 00:57:08'),
(6, '\"0,0,2,2,1,2,0,2,1,0\"', '0000-00-00 00:00:00', 2, 6, 1111, 1, '2023-04-02 14:01:00', '2023-04-02 14:01:52'),
(7, '\"2,1,0,1\"', '0000-00-00 00:00:00', 0, 7, 201002182, 1, '2023-05-05 03:44:55', '2023-05-05 03:44:58'),
(8, '\"0,1,0,1\"', '0000-00-00 00:00:00', 0, 8, 201002182, 1, '2023-05-05 03:48:22', '2023-05-05 03:48:25'),
(9, '\"2,1,1,1\"', '0000-00-00 00:00:00', 1, 9, 201002182, 1, '2023-05-05 04:39:44', '2023-05-05 04:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `id` int(11) NOT NULL,
  `userType` enum('moderator') DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avater` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `moderator`
--

INSERT INTO `moderator` (`id`, `userType`, `name`, `username`, `email`, `phone`, `password`, `avater`) VALUES
(1, 'moderator', 'Shamim', 'moderator', 'm@gmail.cm', '523532532', '$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu', '/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png'),
(2, 'moderator', 'Soikat Hossain', 'soikat', 'admin@sfh', 'dsfh', '$2b$11$quB2ytE1iJd7hvlKf3qL7efXuAQZB4iqauRy4ciokwc3AI7KWAohO', '/uploads/moderator_avater_1680882831984_crop.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `package_name` enum('silver','gold','platinum') NOT NULL,
  `price` int(6) NOT NULL,
  `validity` int(6) NOT NULL,
  `teacher_limit` int(6) NOT NULL,
  `student_limit` int(6) DEFAULT NULL,
  `total_subscriber` int(6) NOT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `price`, `validity`, `teacher_limit`, `student_limit`, `total_subscriber`, `createdAt`) VALUES
(1, 'silver', 1000, 3, 11, 33, 0, '2023-04-04 19:57:02.639398'),
(2, 'gold', 20000, 4, 33, 1, 0, '2023-04-04 19:57:02.655152'),
(3, 'platinum', 30000, 5, 44, 4324, 0, '2023-04-04 19:57:02.665706');

-- --------------------------------------------------------

--
-- Table structure for table `pkg_subscriber`
--

CREATE TABLE `pkg_subscriber` (
  `id` int(11) NOT NULL,
  `pkg_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `approval_status` int(1) DEFAULT 0,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL,
  `question_option` text NOT NULL,
  `question_answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_option`, `question_answer`) VALUES
(1, 1, 2, 1, '<p>কোন বাক্যে ক্রিয়া পদ উহ্য রয়েছে?</p>\r\n', '[\"<p>তিনি সাঁতার কাটছেন</p>\\r\\n\",\"<p>ইনি আমার ভাই</p>\\r\\n\",\"<p>কবির বই পড়ছে</p>\\r\\n\",\"<p>করণকারক</p>\\r\\n\"]', '2'),
(12, 1, 4, 7, '<p>কবি গানের প্রথম কবি &ndash;</p>\r\n', '[\"<p>গোজলা পুট</p>\\r\\n\",\"<p>হরু ঠাকুর</p>\\r\\n\",\"<p>ভবানী ঘোষ</p>\\r\\n\",\"<p>নিতাই বৈরাগী</p>\\r\\n\"]', '2'),
(26, 1, 2, 1, '<h2><span style=\"font-size:14px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় ! dd</p>\\r\\n\"]', '4'),
(27, 1, 4, 7, '<p>আমাদের দেশের নাম কি?</p>\r\n', '[\"<p>বাংলাদেশ</p>\\r\\n\",\"<p>ভারত</p>\\r\\n\",\"<p>নেপাল</p>\\r\\n\",\"<p>ভুটান</p>\\r\\n\"]', '1'),
(28, 1, 2, 1, '<p>কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</p>\r\n', '[\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\",\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\",\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\",\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\"]', '1'),
(29, 1, 4, 7, '<h2><span style=\"font-size:16px\">কোন বাক্যে ক্রিয়া পদ উহ্য রয়েছে?</span></h2>\r\n', '[\"<p>তিনি সাঁতার কাটছেন</p>\\r\\n\",\"<p>ইনি আমার ভাই</p>\\r\\n\",\"<p>কবির বই পড়ছে</p>\\r\\n\",\"<p>আমি লিখছি</p>\\r\\n\"]', '2'),
(35, 1, 2, 1, '<h2><span style=\"font-size:12px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় !</p>\\r\\n\"]', '4'),
(36, 1, 4, 7, '<h2><span style=\"font-size:14px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় adhg</p>\\r\\n\"]', '4'),
(37, 1, 1, 6, '<h2><span style=\"font-size:12px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?.</span></h2>\r\n', '[\"<p>শামসুর রাহমান.</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর.</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম.</p>\\r\\n\",\"<p>কোনটিই নয় .</p>\\r\\n\"]', '2'),
(38, 1, 2, 1, '<h2><span style=\"font-size:12px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় sdfh</p>\\r\\n\"]', '4'),
(40, 1, 1, 6, '<p>What is x+y?</p>\r\n', '[\"<p>3</p>\\r\\n\",\"<p>35</p>\\r\\n\",\"<p>35</p>\\r\\n\",\"<p>35</p>\\r\\n\"]', '3'),
(41, 1, 1, 6, '<p>x+y= 3 and x-y = 3 then what is&nbsp;<span class=\"math-tex\">\\((x^2+y^2)^4\\)</span>&nbsp;and what is xy2</p>\r\n', '[\"<p>353</p>\\r\\n\",\"<p>5</p>\\r\\n\",\"<p>345</p>\\r\\n\",\"<p>35</p>\\r\\n\"]', '2'),
(42, 1, 4, 7, '<h2><span style=\"font-size:14px\">ই-কমার্স সাইট amazon.com কত সালে প্রতিষ্ঠিত হয়?</span></h2>\r\n', '[\"<p>১৯৯০ সালে</p>\\r\\n\",\"<p>১৯৮৮ সালে</p>\\r\\n\",\"<p>১৯৯৪ সালে</p>\\r\\n\",\"<p>১৯৯৮ সালে</p>\\r\\n\"]', '1'),
(43, 1, 1, 6, '<h2><span style=\"font-size:14px\">বৃত্তের পরিধি ও ব্যাসের অনুপাত-</span></h2>\r\n', '[\"<p>3</p>\\r\\n\",\"<p>4</p>\\r\\n\",\"<p>22/3</p>\\r\\n\",\"<p>44/2</p>\\r\\n\"]', '1'),
(44, 1, 1, 6, '<h2><span style=\"font-size:14px\">কোন চতুর্ভুজের বিপরীত কৌণিক বিন্দুর সংযোজন রেখাংশ দুটির প্রত্যেকটিকে বলে-</span></h2>\r\n', '[\"<p>ভূমি</p>\\r\\n\",\"<p>কর্</p>\\r\\n\",\"<p>মধ্যমা</p>\\r\\n\",\"<p>উচ্চতা</p>\\r\\n\"]', '4'),
(45, 1, 1, 6, '<p><span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span>&nbsp;er man koto?</p>\r\n', '[\"<p>1</p>\\r\\n\",\"<p>22</p>\\r\\n\",\"<p>4</p>\\r\\n\",\"<p>24</p>\\r\\n\"]', '2'),
(46, 1, 1, 6, '<p><img alt=\"\" src=\"http://localhost:3000/uploads/questions/goalm.jpg\" style=\"height:31px; width:122px\" />&nbsp;</p>\r\n\r\n<p>Hello&nbsp;<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>test&nbsp;</p>\\r\\n\",\"<p>&nbsp;asdg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\"]', '3'),
(47, 1, 1, 6, '<p>adg</p>\r\n', '[\"<p>adsg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2'),
(48, 1, 1, 6, '<p>New sample chek for edit working</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>adsg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '1'),
(49, 1, 1, 6, '<p>Hello there</p>\r\n', '[\"<p>jhon</p>\\r\\n\",\"<p>kabir</p>\\r\\n\",\"<p>mitro</p>\\r\\n\",\"<p>sen</p>\\r\\n\"]', '2'),
(50, 1, 1, 6, '<p>Test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>adg</p>\\r\\n\"]', '4'),
(51, 1, 1, 6, '<p>asdg</p>\r\n', '[\"<p>sadg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sdag</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '1'),
(52, 1, 1, 6, '<p>Test from server</p>\r\n', '[\"<p>test 1</p>\\r\\n\",\"<p>test 1</p>\\r\\n\",\"<p>test 2</p>\\r\\n\",\"<p>&nbsp;sadg</p>\\r\\n\"]', '3'),
(53, 1, 2, 1, '<p>bangla vasa&nbsp;</p>\r\n', '[\"<p>ee</p>\\r\\n\",\"<p>rr</p>\\r\\n\",\"<p>dd</p>\\r\\n\",\"<p>ss</p>\\r\\n\"]', '4'),
(54, 1, 1, 6, '', '[\"\",\"\",\"\",\"\"]', '1'),
(55, 1, 1, 6, '<p>Test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2'),
(56, 1, 1, 6, '<p>asgd 33</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2'),
(57, 1, 1, 6, '<p>aasdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '3'),
(58, 1, 1, 6, '<p>sdfg</p>\r\n', '[\"<p>sfg</p>\\r\\n\",\"<p>sfdg</p>\\r\\n\",\"<p>sdfg</p>\\r\\n\",\"<p>sfgd</p>\\r\\n\"]', '1'),
(59, 1, 1, 6, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4'),
(60, 1, 1, 6, '<p>3333</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2'),
(61, 1, 1, 6, '<p>2222</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>ag</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4'),
(62, 1, 1, 6, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2'),
(63, 1, 1, 6, '<p>222333</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\",\"<p>adg</p>\\r\\n\",\"<p>asg</p>\\r\\n\"]', '3'),
(64, 1, 1, 8, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4'),
(65, 1, 1, 8, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '3'),
(66, 1, 1, 8, '<p>asgdasdg</p>\r\n', '[\"<p>asdgsadg</p>\\r\\n\",\"<p>asdgasdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4'),
(67, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>test</p>\\r\\n\",\"<p>test</p>\\r\\n\",\"<p>test</p>\\r\\n\"]', '4'),
(68, 1, 1, 6, '<p>11</p>\r\n', '[\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\"]', '3');

-- --------------------------------------------------------

--
-- Table structure for table `q_others`
--

CREATE TABLE `q_others` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL,
  `question_answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `q_others`
--

INSERT INTO `q_others` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_answer`) VALUES
(1, 1, 1, 6, '<p><img alt=\"\" src=\"http://localhost:3000/uploads/questions/goalm.jpg\" style=\"height:31px; width:122px\" />Test of update</p>\r\n', '<p>test</p>\r\n'),
(2, 1, 1, 6, '<p>gdasfg</p>\r\n', '<p>asdg</p>\r\n'),
(3, 1, 1, 6, '<p>gdasfg</p>\r\n', '<p>asdg</p>\r\n'),
(4, 1, 1, 6, '<p>sdfh</p>\r\n', '<p>sdfh</p>\r\n'),
(5, 1, 1, 6, '<p>dfgh</p>\r\n', '<p>dfgh</p>\r\n'),
(6, 1, 1, 6, '<p>sdfh</p>\r\n', '<p>sdfh</p>\r\n'),
(7, 1, 1, 6, '<p>sdh</p>\r\n', '<p>sdhf</p>\r\n'),
(8, 1, 1, 6, '<p>dsfh</p>\r\n', '<p>sdfh</p>\r\n'),
(9, 1, 1, 6, '<p>asg</p>\r\n', '<p>sadg</p>\r\n'),
(10, 1, 1, 6, '<p>dsfhs</p>\r\n', '<p>sdfh</p>\r\n'),
(11, 1, 1, 6, '<p>New</p>\r\n', '<p>sadg</p>\r\n'),
(12, 1, 1, 6, '<p>What is the value of&nbsp;<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\r\n', '<p>The right answer is 1</p>\r\n'),
(13, 1, 1, 6, '<p>asdg</p>\r\n', '<p>asdg</p>\r\n'),
(14, 1, 1, 6, '<p>test</p>\r\n', '<p>test</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `q_set`
--

CREATE TABLE `q_set` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `formate` varchar(50) NOT NULL,
  `total_mark` int(11) NOT NULL,
  `total_qus` int(4) NOT NULL,
  `questions` varchar(300) DEFAULT NULL,
  `answers` varchar(300) DEFAULT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `q_set`
--

INSERT INTO `q_set` (`id`, `name`, `class_id`, `subject`, `formate`, `total_mark`, `total_qus`, `questions`, `answers`, `school_id`, `created_at`, `updated_at`) VALUES
(15, 'Check', 1, '0', 'mcq', 12, 21, '37,41,43,40', '4,2,1,3', 1, '2023-03-26 21:19:09', '2023-03-26 21:46:45'),
(20, 'Model Test Before Annual Exam', 1, '0', 'mcq', 20, 20, '37,40,41,43,46,49,26,28,35', '3,3,2,1,3,2,4,1,4', 1, '2023-03-30 00:15:20', '2023-03-30 00:15:43'),
(21, 'MCQ TEST', 1, '0', 'mcq', 12, 12, '37,40,41,43,47,48,44,45,46,26,28,1,38,35,27,29,36', '3,3,2,1,2,1,4,2,3,4,1,2,4,4,1,2,4', 1, '2023-03-30 00:35:29', '2023-03-30 00:35:52'),
(22, 'Preview', 1, '0', 'mcq', 33, 33, '1,26,28', '2,4,1', 1, '2023-03-30 00:44:32', '2023-03-30 00:44:36'),
(24, 'From server', 1, '0', 'mcq', 30, 30, '37,40,41,43,47,48,50', '3,3,2,1,2,1,4', 1, '2023-03-30 01:43:20', '2023-03-30 01:43:28'),
(25, 'Test', 1, '0', 'mcq', 22, 22, '40,41,45,1', '3,2,2', 1, '2023-04-02 11:32:16', '2023-04-11 13:25:23'),
(26, 'Combined', 1, '0', 'mcq', 20, 20, '37,41,43,46,45,28,35,26,12,27,29,36,1', '3,2,1,3,2,1,4,4,2,1,2,4,0', 1, '2023-04-02 11:39:50', '2023-04-11 13:14:21'),
(27, 'Combined', 1, '0', 'mcq', 20, 20, '37,45,46,41,26,28,35,29,36,42', '3,2,3,2,4,1,4,2,4,1', 1, '2023-04-02 13:48:10', '2023-04-02 13:49:07'),
(28, 'Test', 1, '0', 'mcq', 22, 22, '37,40,41,1', '3,3,2', 1, '2023-04-02 13:56:47', '2023-04-11 13:25:46'),
(30, 'Model test', 1, '0', 'mcq', 22, 22, '46,50,40,43,44,45,37,48,49,41,47,51,52,29,36,42', '3,4,3,1,4,2,3,1,2,2,2,1,3,2,4,1', 1, '2023-04-07 22:55:39', '2023-04-07 23:12:26'),
(31, 'Test', 1, '0', 'q_others', 22, 22, '1,2', '0,0', 1, '2023-04-08 13:48:16', '2023-04-08 14:04:08'),
(32, 'test', 1, '1', 'mcq', 33, 33, '40,46,54,1', '3,3,1,4,4,1,0,0,0,0,0', 1, '2023-04-08 14:05:29', '2023-04-11 13:41:47'),
(35, 'sadg', 1, '2', 'q_others', 22, 22, '1,2,8,12', '0,0,0,0', 1, '2023-04-08 14:06:49', '2023-04-08 14:06:55'),
(38, 'Test', 1, '0', 'creative', 33, 33, '1,2,3', ',test,', 1, '2023-04-11 13:06:44', '2023-04-11 13:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `userType` enum('admin') DEFAULT NULL,
  `school_name` varchar(250) NOT NULL,
  `school_address` varchar(500) DEFAULT NULL,
  `school_email` varchar(100) DEFAULT NULL,
  `school_phone` varchar(15) NOT NULL,
  `school_info` varchar(500) DEFAULT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_blood_group` varchar(5) DEFAULT NULL,
  `admin_address` varchar(500) DEFAULT NULL,
  `admin_phone` varchar(15) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(250) NOT NULL,
  `admin_avater` varchar(250) DEFAULT '/uploades/school/admin_avater.png',
  `status` int(1) DEFAULT 0,
  `package` int(2) DEFAULT NULL,
  `validity` date DEFAULT NULL,
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `userType`, `school_name`, `school_address`, `school_email`, `school_phone`, `school_info`, `admin_name`, `admin_blood_group`, `admin_address`, `admin_phone`, `admin_email`, `admin_password`, `admin_avater`, `status`, `package`, `validity`, `createdAt`) VALUES
(1, 'admin', 'Satshimulia High School', 'Demo Adress', 'shs@gmail.com', '01733333', 'info demo', 'school_admin', 'b+', 'admin_adress', '01822222', 'administration@gmail.com', '$2b$11$MsM4DRsf9JzgYsc1Hg1PFOasUG/rm4a3qLfJGkyMfzxBq3FLNH00e', '', 0, 2, '2023-04-18', '2023-03-15 14:19:28.052897'),
(3, 'admin', 'Bogura Zilla School', 'Bogura Sadar', 'bzs@gmail.com', '017227339435', 'Test info', 'bogura admin', 'b+', 'Sonatola', '017272278355', 'boguraadmin@gmail.com', '$2b$11$GXOU60o9gOTiEe0pkjAR9.vKrcRzvagio0ZmYz1tPDHpt4CwiaM4G', 'soikat.jpg', 0, NULL, NULL, '2023-03-29 23:59:36.731147'),
(4, '', 'SHS', 'admin', 'scc@gmaol.com', 'ash', 'asdh', 'asdh', 'asdh', 'asdh', 'asdh', 'asdh@sdhf', '$2b$11$s3X0LFJuHoF8YdFL664IGO/NR9ffrut87W0tj80kSpBMcSdzWVVjK', '', 1, 1, NULL, '2023-04-06 19:41:50.474375'),
(5, '', 'dsfh', 'admin', 'sdfh@sdh', 'sdfh', 'sdfh', 'sdfh', '', '', 'sdfh', 'sdfh@sdhj', '$2b$11$o/9qf0AzFODTN59jPYh9GeAWLJ5FicSDHmBqan8lxpnkKi9tqUAY6', '', 0, 0, NULL, '2023-04-06 19:44:00.536125'),
(6, '', 'Test From user', 'Test From user', 'user@gmail.com', 'asdg', '', 'asdg', '', '', 'asdg', 'test@gmail.com', '$2b$11$wOL8Xgs43iR8yvTxnoOW8Oa/bG798O58bY6WJ0IBcuxjJSAxrqfQi', '', 1, 1, '2023-04-19', '2023-04-06 19:59:25.376624'),
(7, '', '4444', 'admin', '', 'asdg', '', 'asdg', '', '', 'asgd', 'sadg@sdfhg', '$2b$11$tGoN4P5WSlZqK/35R5WRaO1VIs6mC//y1fHuR3jqz/6Atc/Ua8TKi', '', 1, 2, NULL, '2023-04-06 20:05:13.610995'),
(8, 'admin', 'test', 'admin', 'test@gmail.com', 'sss', 'test@gmail.com', 'ssss', 's', 'ssss', 'ssss', 'test@gmail.com', '$2b$11$O7j8.6WeDFDU.Ui/briF/O79E9NkFtPfn/0BENa14aZ61Bx/TDSLe', '', 1, 1, '2023-06-14', '2023-04-19 04:25:51.524643');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('2eIog4scrN_mfEPoOrilUHSIhRG5XGpr', 1683567318, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3AYmuYZl65y-0GaKbyhBoGeM9i2sINU8', 1680228581, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3vpfbJHMiaJYrAO6Vdga1d2AtSSJXFNW', 1681362631, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5D37CayNy8h06sHuFPDdsVUXu1FOR5eD', 1680903797, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('GVElRzZkJ2kRVmYZ0u40hGjdule0tZlg', 1681361848, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"sessionID\":\"77fdc552-4685-496d-a024-f2a72f0ee9f3\",\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInRhYmxlIjoidXNlcnMiLCJ1c2VyVHlwZSI6InN1cGVyYWRtaW4iLCJpYXQiOjE2ODEyNzUzNTcsImV4cCI6MTY4MTM2MTc1N30.8KVGrbxhazKKL8ndYw1HCrBp6zQzadSaeI5N6tf7FdY\",\"user\":{\"id\":1,\"userType\":\"superadmin\",\"username\":\"admin\",\"email\":\"shamim@gmail.com\",\"password\":\"$2b$11$Zh9RmdCkzMQqyaSF12.sfOstJMnr7ANFiYC5/J/R5XgiYzPouim6y\",\"profilePics\":\"/uploads/avater.jpg\",\"createdAt\":\"2023-03-15T14:22:06.000Z\"}}'),
('GawaJ0EAbW4cCM8Fl4wmLl6znAWHE2AB', 1680276639, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('JyRkGCNaViJ3muZhmuHyS5RMS-b1q68T', 1683567344, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"sessionID\":\"f1269302-8671-4e9c-9f9f-4cbd7cdaa10e\",\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInRhYmxlIjoidXNlcnMiLCJ1c2VyVHlwZSI6InN1cGVyYWRtaW4iLCJpYXQiOjE2ODM0ODA5NDMsImV4cCI6MTY4MzU2NzM0M30.p87sgrh9ImRrvrkwsiMUhZHAei7R59QrqjsD-00BzU0\",\"user\":{\"id\":1,\"userType\":\"superadmin\",\"username\":\"admin\",\"email\":\"shamim@gmail.com\",\"password\":\"$2b$11$Zh9RmdCkzMQqyaSF12.sfOstJMnr7ANFiYC5/J/R5XgiYzPouim6y\",\"profilePics\":\"/uploads/avater.jpg\",\"createdAt\":\"2023-03-15T14:22:06.000Z\"}}'),
('NVNVNcysOhmmI8EMIdE0KDvA6LfnYhuv', 1681968137, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidGFibGUiOiJzY2hvb2xzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjgxODgxNjE1LCJleHAiOjE2ODE5NjgwMTV9.Jwl7pXICwdh-Bki2R61hlx1ReaxcWUV3_z0lXekKsig\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('OzC6FpZZYRP_ryvG_AXOX1PsOxYmyObd', 1683344987, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJzaGFtaW0iLCJ0YWJsZSI6InRlYWNoZXJzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjgzMjU4NTYzLCJleHAiOjE2ODMzNDQ5NjN9.I-bTlzwIYubXfp4cwOhR6ys5hIvY9QrYwVDu-a2Flzs\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('PIOSFP7q7jxFjzTKzHfDV9q4btcgp-Nl', 1680558383, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"sessionID\":\"06ebad57-eaad-4736-b0a7-6cb552d92117\",\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInRhYmxlIjoidXNlcnMiLCJ1c2VyVHlwZSI6InN1cGVyYWRtaW4iLCJpYXQiOjE2ODA0NjgyOTQsImV4cCI6MTY4MDU1NDY5NH0.DFnQ8FQy-0W1XjOwRnnsnvnqv0dFVwjATAhQJcgXKps\",\"user\":{\"id\":1,\"userType\":\"superadmin\",\"username\":\"admin\",\"email\":\"shamim@gmail.com\",\"password\":\"$2b$11$GXOU60o9gOTiEe0pkjAR9.vKrcRzvagio0ZmYz1tPDHpt4CwiaM4G\",\"profilePics\":\"/uploads/avater.jpg\",\"createdAt\":\"2023-03-15T14:22:06.000Z\"}}'),
('RzJvVXnylrGByLGfxvJKUKUgXBZgZIqj', 1680731782, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbkBnbWFpbC5jb20iLCJ0YWJsZSI6InNjaG9vbHMiLCJ1c2VyVHlwZSI6ImFkbWluIiwiaWF0IjoxNjgwNjQxMDg1LCJleHAiOjE2ODA3Mjc0ODV9.x2a9xWeQU3-8iPlx3IGkP3KRWZ0lEz8LzH-i5WF9vrA\",\"user\":{\"id\":1,\"userType\":\"admin\",\"school_name\":\"Satshimulia High School\",\"school_address\":\"Demo Adress\",\"school_email\":\"shs@gmail.com\",\"school_phone\":\"01733333\",\"school_info\":\"info demo\",\"admin_name\":\"school_admin\",\"admin_blood_group\":\"b+\",\"admin_address\":\"admin_adress\",\"admin_phone\":\"01822222\",\"admin_email\":\"admin@gmail.com\",\"admin_password\":\"$2b$11$GXOU60o9gOTiEe0pkjAR9.vKrcRzvagio0ZmYz1tPDHpt4CwiaM4G\",\"admin_avater\":\"\",\"status\":0,\"createdAt\":\"2023-03-15T14:19:28.052Z\"}}'),
('XTpyzKvF2SbmM1PQEATge0P9H8RjDoHO', 1680723660, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Successfully Logged In\"]},\"isLoggedIn\":true,\"sessionID\":\"40c65f95-26e0-4620-999b-67ec19f7dc7e\",\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInRhYmxlIjoidXNlcnMiLCJ1c2VyVHlwZSI6InN1cGVyYWRtaW4iLCJpYXQiOjE2ODA2MzcyNDcsImV4cCI6MTY4MDcyMzY0N30.l7fnHLdRexrdQAfJAbZm7gvtLpBmmmKnCWX27S3ziSE\",\"user\":{\"id\":1,\"userType\":\"superadmin\",\"username\":\"admin\",\"email\":\"shamim@gmail.com\",\"password\":\"$2b$11$GXOU60o9gOTiEe0pkjAR9.vKrcRzvagio0ZmYz1tPDHpt4CwiaM4G\",\"profilePics\":\"/uploads/avater.jpg\",\"createdAt\":\"2023-03-15T14:22:06.000Z\"}}'),
('Zf7R4iY_zbI6DaGtWJVGwmnzWZ3T6iaR', 1681307158, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJzaGFtaW0iLCJ0YWJsZSI6InRlYWNoZXJzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjgxMjE3NzM2LCJleHAiOjE2ODEzMDQxMzZ9.dZS_t_JdRFB2sZCa-SYKFhW05rICqOU7GeqrRF3Hy0U\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('bJ-9XAUB1ALu7iYZPw8URSsz0HwwvHj_', 1681000617, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjgwOTExNzQ4LCJleHAiOjE2ODA5OTgxNDh9.NhNOo4pathbUHF9g1-9hW_uF02lvzkDMiKfbKZdGiUQ\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"moderator vai\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$GXOU60o9gOTiEe0pkjAR9.vKrcRzvagio0ZmYz1tPDHpt4CwiaM4G\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('rIWIhcTzqH9ccmPntoPU6g2Z_X5NHroQ', 1681084914, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJTb2lrYXQgSG9zc2FpbiIsInRhYmxlIjoic3R1ZGVudHMiLCJ1c2VyVHlwZSI6InN0dWRlbnQiLCJpYXQiOjE2ODA5OTg1MTMsImV4cCI6MTY4MTA4NDkxM30.cJbpG48oLHRCX2D6rm025SesUC45ZMYy4Een9LLY49Y\",\"user\":{\"id\":1,\"userType\":\"student\",\"name\":\"Soikat Hossain\",\"class_id\":2,\"student_id\":\"201002182\",\"password\":\"11111\",\"school_id\":1,\"gender\":\"female\",\"dob\":\"2023-03-11T18:00:00.000Z\",\"address\":\"11\",\"avater\":\"/uploads/student_avater_1680805600661_crop.jpg\",\"created_at\":\"2023-03-14T18:26:56.000Z\",\"updated_at\":\"2023-04-07T18:06:34.000Z\"}}'),
('rqjtzuaH7MHl0ML999In5GgZULX-D6T1', 1681157305, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"sessionID\":\"e96fd8b3-edb4-4c2f-affc-04134c350864\",\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInRhYmxlIjoidXNlcnMiLCJ1c2VyVHlwZSI6InN1cGVyYWRtaW4iLCJpYXQiOjE2ODEwNjUwODEsImV4cCI6MTY4MTE1MTQ4MX0.tpSqD4uAPssNNvoOa-Z4mFYHFzPcV88tvPaba98UB9Y\",\"user\":{\"id\":1,\"userType\":\"superadmin\",\"username\":\"admin\",\"email\":\"shamim@gmail.com\",\"password\":\"$2b$11$Zh9RmdCkzMQqyaSF12.sfOstJMnr7ANFiYC5/J/R5XgiYzPouim6y\",\"profilePics\":\"/uploads/avater.jpg\",\"createdAt\":\"2023-03-15T14:22:06.000Z\"}}'),
('vLzu06wL_dc_MbQPooO1E4Ie0CL3kort', 1683348376, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('wqs7jU_sBXUlBpMdO_2ptme_anIN17VT', 1681968560, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `userType` enum('student') DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(355) DEFAULT NULL,
  `avater` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `userType`, `name`, `class_id`, `student_id`, `password`, `school_id`, `gender`, `dob`, `address`, `avater`, `created_at`, `updated_at`) VALUES
(1, 'student', 'Soikat Hossain', 1, '201002182', '11111', 1, 'female', '2023-03-12', '11', '/uploads/student_avater_1680805600661_crop.jpg', '2023-03-14 18:26:56', '2023-05-05 03:44:31'),
(2, 'student', 'Nasir', 3, 'asdg', 'asdg', 1, 'female', '2023-04-07', 'asdgsadg', NULL, '2023-04-06 21:06:34', '2023-04-08 23:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `subject_list`
--

CREATE TABLE `subject_list` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `subject_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject_list`
--

INSERT INTO `subject_list` (`id`, `class_id`, `subject_name`, `subject_code`) VALUES
(1, 1, 'Math', 'MATH-104'),
(2, 1, 'Bangla', 'BAN-102'),
(3, 2, 'English For Today', 'EAP-103'),
(4, 1, 'Islam Book', 'IOM-403'),
(5, 2, 'Social Science', 'GED-403'),
(6, 2, 'Science', 'SCI-352'),
(8, 4, 'physics', 'phy102'),
(9, 4, 'Math', 'asdg'),
(10, 3, 'Math', 'asdg'),
(11, 5, 'Gonit', 'mat'),
(12, 1, 'Social Science', 'GED-405'),
(13, 1, 'test44', '22');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `userType` enum('superadmin','admin','teacher','student','guerdian','librarian','user') DEFAULT 'user',
  `name` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `avater` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `userType`, `name`, `username`, `email`, `address`, `phone`, `password`, `school_id`, `avater`) VALUES
(1, 'teacher', 'shamim', 'shamim', 'shamim@gmail.com', NULL, '017229742', '$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli', 1, NULL),
(2, 'teacher', 'Soikat', 'soikat6897', 'soikatkhan61@gmail.com', 'Test', '01722726897', '1234ee', NULL, NULL),
(3, 'teacher', 'New', 'hello', 'ass@gmail.com', 'ahasdh', '01722726897', '$2b$11$CUtT/Vgw0ZWUUxvC.3GisOSrGPPAEetj5J6lqVIAbiztu5wGCNPvC', NULL, NULL),
(4, 'teacher', 'TEst', 'asdg', 'ass@gmail.com', 'asdg', 'asdg', '$2b$11$gUU4TSzhmzNWiGHKVzZ4huDTIbpvFQ7Jjj1xUqXiHt3xkeFosXg4S', 1, NULL),
(5, 'teacher', 'adh', 'asdh', 'ass@gmail.com', 'asdhd', 'asdh', '$2b$11$VTGCnUVTtGVioPfow8iZQ..rc46UWbE2vWLsxNMYdDFBI/O/GsT76', 1, '/uploads/teacher_avater_1680645163247_71IbtYa4G1S._UX342_.jpg'),
(6, 'teacher', 'sdah', 'hello', 'ass@gmail.com', 'adfhsdfh', 'asdh', '$2b$11$2z5Uu/.An1pzteKcamjHAugzEnfGxSp56sTiO0.xjBziDHPekqg/K', 1, NULL),
(7, 'teacher', 'Soikat k', 'soikat.6897', 'testemail@gmail.com', 'Uttar satshimulia\r\n', '01722726897', '$2b$11$61DQBIQrAxtI4liKATwFSuw1CtYfIWUk7IWnlcdhMJ.joelYmyKmy', 1, '/uploads/teacher_avater_1680805519093_Screenshot 2023-03-26 005004.png'),
(8, 'teacher', 'Obaydullah', 'dgasdgsadg', 'admin@gmail.com', 'asdgsadg', 'asdgasdgas', '$2b$11$MC6eEV/tlig4KADIwwJeQ.zf9RWVP3aZ26y6ZIBgqtjMgiI7paEn2', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userType` enum('superadmin','admin','teacher','student','guerdian','librarian','user') DEFAULT 'user',
  `username` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profilePics` varchar(200) DEFAULT '/uploads/avater.jpg',
  `createdAt` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userType`, `username`, `email`, `password`, `profilePics`, `createdAt`) VALUES
(1, 'superadmin', 'admin', 'shamim@gmail.com', '$2b$11$Zh9RmdCkzMQqyaSF12.sfOstJMnr7ANFiYC5/J/R5XgiYzPouim6y', '/uploads/avater.jpg', '2023-03-15 14:22:06.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_name` (`class_name`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creative`
--
ALTER TABLE `creative`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `q_set_id` (`q_set_id`);

--
-- Indexes for table `exams_participants`
--
ALTER TABLE `exams_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `moderator`
--
ALTER TABLE `moderator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pkg_subscriber`
--
ALTER TABLE `pkg_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pkg_id` (`pkg_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `q_others`
--
ALTER TABLE `q_others`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `q_set`
--
ALTER TABLE `q_set`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `subject_list`
--
ALTER TABLE `subject_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `creative`
--
ALTER TABLE `creative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `exams_participants`
--
ALTER TABLE `exams_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `moderator`
--
ALTER TABLE `moderator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pkg_subscriber`
--
ALTER TABLE `pkg_subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `q_others`
--
ALTER TABLE `q_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `q_set`
--
ALTER TABLE `q_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject_list`
--
ALTER TABLE `subject_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject_list` (`id`),
  ADD CONSTRAINT `chapter_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `creative`
--
ALTER TABLE `creative`
  ADD CONSTRAINT `creative_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject_list` (`id`),
  ADD CONSTRAINT `creative_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `creative_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exams_ibfk_3` FOREIGN KEY (`q_set_id`) REFERENCES `q_set` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exams_participants`
--
ALTER TABLE `exams_participants`
  ADD CONSTRAINT `exams_participants_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exams_participants_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pkg_subscriber`
--
ALTER TABLE `pkg_subscriber`
  ADD CONSTRAINT `pkg_subscriber_ibfk_1` FOREIGN KEY (`pkg_id`) REFERENCES `packages` (`id`),
  ADD CONSTRAINT `pkg_subscriber_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject_list` (`id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`);

--
-- Constraints for table `q_others`
--
ALTER TABLE `q_others`
  ADD CONSTRAINT `q_others_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject_list` (`id`),
  ADD CONSTRAINT `q_others_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `q_others_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`);

--
-- Constraints for table `q_set`
--
ALTER TABLE `q_set`
  ADD CONSTRAINT `q_set_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `q_set_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject_list`
--
ALTER TABLE `subject_list`
  ADD CONSTRAINT `subject_list_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
