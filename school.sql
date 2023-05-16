-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2023 at 07:25 PM
-- Server version: 10.3.38-MariaDB-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bzmcom_questionskit`
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
(6, 1, 1, '১ম অধ্যায়: বাস্তব সংখ্যা'),
(7, 1, 4, 'Hazrat Mohammad (s)'),
(8, 1, 1, '২য় অধ্যায়: সেট ও ফাংশন'),
(9, 1, 1, '৩য় অধ্যায়: বীজগাণিতিক রাশি'),
(10, 1, 1, '৪র্থ অধ্যায়: সূচক ও লগারিদম'),
(11, 1, 1, '৫ম অধ্যায়: এক চলকবিশিষ্ট সমীকরণ'),
(12, 1, 1, '৬ষ্ঠ অধ্যায়: রেখা, কোন ও ত্রিভূজ'),
(13, 1, 1, '৭ম অধ্যায়: ব্যবহারিক জ্যামিতি'),
(14, 1, 1, '৮ম অধ্যায়: বৃত্ত'),
(15, 1, 1, '৯ম অধ্যায়: ত্রিকোণমিতিক অনুপাত'),
(16, 1, 1, '১০ম অধ্যায়: দূরত্ব ও উচ্চতা'),
(17, 1, 1, '১১তম অধ্যায়: অনুপাত ও সমানুপাত'),
(18, 1, 1, '১২তম অধ্যায়: দুই চলকবিশিষ্ট সরল সহসমীকরণ'),
(19, 1, 1, '১৩তম অধ্যায়: সসীম ধারা'),
(20, 1, 1, '১৪তম অধ্যায়: অনুপাত, সদৃশতা ও প্রতিসমতা'),
(21, 1, 1, '১৫তম অধ্যায়: ক্ষেত্রফল সম্পর্কিত উপপাদ্য ও সম্পাদ্য'),
(22, 1, 1, '১৬তম অধ্যায়: পরিমিতি'),
(23, 1, 1, '১৭তম অধ্যায়: পরিসংখ্যান'),
(24, 2, 3, 'প্রথম অধ্যায়: তথ্য ও যোগাযোগ প্রযুক্তি ( বিশ্ব ও বাংলাদেশ প্রেক্ষিত)'),
(25, 2, 3, 'দ্বিতীয় অধ্যায়: কমিউনিকেশন সিস্টেম ও নেটওয়ার্কিং'),
(26, 2, 3, 'তৃতীয় অধ্যায় (১ম অংশ) : সংখ্যা পদ্ধতি (Number System)'),
(27, 2, 3, 'তৃতীয় অধ্যায় (২য় অংশ) : ডিজিটাল ডিভাইস (Digital Device)'),
(28, 2, 3, 'চতুর্থ অধ্যায়: ওয়েব ডিজাইন পরিচিতি এবং HTML'),
(29, 2, 3, 'পঞ্চম অধ্যায়: প্রোগ্রামিং ভাষা'),
(30, 2, 3, 'ষষ্ঠ অধ্যায়: ডেটাবেজ ম্যানেজমেন্ট সিস্টেম');

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
(1, 'SSC', 'Class-9 & 10 All Subject'),
(2, 'HSC General', 'Bangla, English, ICT, Geography, History etc'),
(3, 'HSC Science', 'Physics, Chemistry, Biology & Higher Math'),
(4, 'HSC Commerce', 'Accounting, Business studies etc'),
(5, 'Class 8', 'All Subject'),
(6, 'Class 7', 'All Subject'),
(7, 'Class 6', 'All Subject'),
(8, 'Class 5', 'All Subject'),
(9, 'Class 4', 'All Subject'),
(10, 'Class 3', 'All Subject'),
(11, 'Class 2', 'All Subject'),
(12, 'Class 1', 'All Subject'),
(13, 'Admission Test ', 'All Subject');

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
(1, 'Hello', 'test@gmail.com', '01722726897', 'hi', 'yes', '2023-04-02 20:30:09.032204');

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
  `question_answer` text DEFAULT NULL,
  `filter` varchar(300) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `fk_author` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creative`
--

INSERT INTO `creative` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_option`, `question_answer`, `filter`, `year`, `fk_author`) VALUES
(1, 1, 2, 1, '<p>dsh</p>\r\n', '[\"<p>sdfh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(2, 1, 2, 1, '<p>fdsh</p>\r\n', '[\"<p>sdh</p>\\r\\n\",\"<p>sdh</p>\\r\\n\",\"<p>sh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\"]', 'test', NULL, NULL, 1),
(3, 1, 2, 1, '<p>sdfh</p>\r\n', '[\"<p>sdh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\",\"<p>sdh</p>\\r\\n\",\"<p>sdfh</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(4, 1, 1, 6, '<p><span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span>&nbsp;ok&nbsp; lets gooooooooooooooooooo again d</p>\n\n<p>&nbsp;</p>\n', '[\"<p><span class=\\\"math-tex\\\">\\\\(x = -b \\\\pm a\\\\)</span></p>\\r\\n\",\"<p>x+1&nbsp;</p>\\r\\n\",\"<p>y+1</p>\\r\\n\",\"<p>x+2</p>\\r\\n\"]', 'no', NULL, NULL, 1),
(5, 1, 1, 6, '<p>Test questions</p>\r\n', '[\"<p>s</p>\\r\\n\",\"<p>d</p>\\r\\n\",\"<p>g</p>\\r\\n\",\"<p>g</p>\\r\\n\"]', 'no', NULL, NULL, 1),
(6, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>saet</p>\\r\\n\",\"<p><span class=\\\"math-tex\\\">\\\\(x = {-b \\\\pm \\\\sqrt{b^2-4ac} \\\\over 2a}\\\\)</span></p>\\r\\n\",\"<p>aset</p>\\r\\n\",\"<p>aset</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(7, 1, 1, 8, '<p><span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>ee</p>\\r\\n\",\"<p>22</p>\\r\\n\",\"<p>44</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(8, 1, 1, 6, '<p>Test</p>\r\n', '[\"<p>asdgg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(9, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>asgd</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '6', NULL, NULL, 1),
(10, 1, 1, 6, '<p>asdgasdga</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(11, 1, 2, 1, '<p>test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '88', NULL, NULL, 1),
(12, 1, 2, 1, '<p>asdg</p>\r\n', '[\"<p>sdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(13, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(14, 1, 1, 6, '<p>11</p>\r\n', '[\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\"]', NULL, NULL, NULL, 1),
(15, 1, 1, 6, '<p>Creative answer test asdsag</p>\r\n', '[\"<p>xx</p>\\r\\n\",\"<p>dd</p>\\r\\n\",\"<p>dd</p>\\r\\n\",\"<p>dd</p>\\r\\n\"]', '<p>dd</p>\r\n', '7,1', '', 1),
(16, 1, 1, 6, '<p>ttt 300 ss</p>\r\n', '[\"<p>dsag</p>\\r\\n\",\"<p>asdgg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\"]', '<p>asgd</p>\r\n', '7,2', '', 1),
(17, 2, 3, 24, '<p style=\"text-align:justify\">আইসিটি নির্ভর জ্ঞান ও প্রযুক্তি মানুষকে নানা বিষয়ে সমৃদ্ধির পথে এগিয়ে নিচ্ছে। হাবিব আইসিটি বিষয়ে পড়াশুনা করে জানতে পারল কোনো প্রকার অস্ত্রোপাচার ছাড়া এক শৈল্য চিকিৎসা পদ্ধতি। পরবর্তীতে হাবিব আইসিটি নির্ভর জীব বৈচিত্র্য সৃষ্টির প্রযুক্তি বিষয়ে জ্ঞান লাভ করে খুবই আনন্দিত হলো।</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:SutonnyMJ\">&nbsp;&nbsp; </span></span></p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োম্যাট্রিক্স কী?</p>\\r\\n\",\"<p>বায়োম্যাট্রিক্স ও বায়োইনফরম্যাট্রিক্স এর মধ্যে পার্থক্য লিখ।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>হাবিবের চিকিৎসা পদ্ধতি শনাক্ত করে ব্যাখ্যা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে যে প্রযুক্তি হাবিব জ্ঞান লাভে আনন্দ দিল সেই প্রযুক্তি কৃষি সম্পদ উন্নয়নে কী ধরনের ভূমিকা রাখে মতামত দাও।&nbsp;&nbsp; &nbsp;<br />\\r\\n&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(18, 2, 3, 24, '<p>সুমনের বড় ভাই যুক্তরাষ্ট্রে থাকেন। তিনি যুক্তরাষ্ট্রের একটি বিশ্ববিদ্যালয়ে ভর্তির জন্য সুমনের কাছ থেকে জরুরিভাবে কিছু ডকুমেন্টের চাহিদা দিলে সুমন এটাচ করে ইলেক্ট্রনিক মেইল পদ্ধতি ব্যবহার করে দ্রুত পাঠিয়ে দেয়। সুমন যে বিশ্ববিদ্যালয়ের জন্য এপ্লাই করেছে ব্রাউজ করে সে বিশ্ববিদ্যালয় সম্পর্কে বিস্তারিত জেনেছে।&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>অডিও কনফারেন্সিং কী?</p>\\r\\n\",\"<p>কথা বলার পাশাপাশি ছবিও দেখা যায় বুঝিয়ে লেখ।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে সুমন যে প্রযুক্তিটি ব্যবহার করে দ্রুত তথ্য প্রেরণ করে সুবিধা পেয়েছে কীভাবে ব্যাখ্যা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের আলোকে দ্রুত যে কোনো তথ্য পাওয়ার সুবিধা সম্পর্কে তোমার মতামত বিশ্লেষণ কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(19, 2, 3, 24, '<p>আমার বন্ধু ডা: এনাম ট্রেনিং-এ ফ্রান্সে গেছে। ভাইবারে সে বলল, ফ্রান্সের সব কাজে ডিজিটাল সিস্টেম ব্যবহৃত হয়। সেখানে ট্রেনিং সেন্টারে প্রবেশ করতে লাগে সুপারভাইজারের আঙ্গুলের ছাপ এবং অপারেশন থিয়েটারে প্রবেশ করতে লাগে চোখ। আমি বললাম &ldquo;বেশ মজাই তো&rdquo; সে আরও বলল &ldquo;গতকাল স্থানীয় বিনোদন পার্কে গিয়ে মাথার হেলমেট ও চোখে বিশেষ চশমা দিয়ে চাঁদে ভ্রমণের অনুভূতি অনুভব করেছি&rdquo;।&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ক্রায়োসার্জারি কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;স্বল্প দূরত্বের ডেটা আদান-প্রদান মাধ্যম&rdquo; ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের আলোকে চাঁদে ভ্রমণের প্রযুক্তিটি বর্ণনা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে ট্রেনিং সেন্টার ও অপারেশন থিয়েটারে ব্যবহৃত প্রযুক্তিদ্বয়ের মধ্যে কোনটি আমাদের দেশে বহুলব্যবহৃত বিশ্লেষণপূর্বক মতামত দাও।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>উদ্দীপকে ট্রেনিং সেন্টার ও অপারেশন থিয়েটারে ব্যবহৃত প্রযুক্তিদ্বয়ের মধ্যে কোনটি আমাদের দেশে বহুলব্যবহৃত বিশ্লেষণপূর্বক মতামত দাও।&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(20, 2, 3, 24, '<p>মি. &quot;Y&quot; তার বাবার ল্যাবরেটরিতে প্রবেশের সময় একটি বিশেষ সেন্সরের দিকে তাকানোর ফলে দরজা খুলে গেল। ভেতরে প্রবেশ করে দেখলো প্রথম কক্ষে জৈব তথ্যকে সাজিয়ে গুছিয়ে ইনফরমেশন সিস্টেম তৈরি সংক্রান্ত গবেষণা এবং দ্বিতীয় কক্ষে রিকম্বিনেন্ট ডিএনএ (DNA) তৈরি সংক্রান্ত গবেষণা করা হয়।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যানোটেকনোলজি কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>তথ্য প্রযুক্তি ও যোগাযোগ প্রযুক্তি একে অপরের পরিপূরক- বুঝিয়ে লেখ।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ল্যাবরেটরির দরজায় ব্যবহৃত প্রযুক্তিটি বর্ণনা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ল্যাবরেটরিতে যে প্রযুক্তি নিয়ে গবেষণা হয় তাদের তুলনামূলক পার্থক্য বিশ্লেষণ কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>ল্যাবরেটরিতে যে প্রযুক্তি নিয়ে গবেষণা হয় তাদের তুলনামূলক পার্থক্য বিশ্লেষণ কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(21, 2, 3, 24, '<p>আসাদ এখন ঘরে বসেই নিজের প্রয়োজনীয় সকল তথ্য তার ল্যাপটপে পেয়ে যাচ্ছে। এ প্রযুক্তির সহায়তায় সে তার বাবাকে ধানক্ষেতের ক্ষতিকর কীটপতঙ্গ দমনে করণীয় সম্পর্কে তথ্য সরবরাহ করে। উক্ত এলাকার চেয়ারম্যান মঞ্জুর এলাহী প্রতিমাসে ঢাকায় থাকা তার কয়েকজন পরিচিত ডাক্তার বন্ধুদের থেকে গ্রামের মানুষের জন্য সরাসরি স্বাস্থ্যসেবা গ্রহণের ব্যবস্থা করে দেন। &nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>তথ্য ও যোগাযোগ প্রযুক্তি কী?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ইলেকট্রনিক পদ্ধতিতে পত্র আদান প্রদানের সুবিধা অনেক- বুঝিয়ে লেখ।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের আসাদ কোন ক্ষেত্রে তথ্য প্রযুক্তির সুবিধা গ্রহণ করেছে? ব্যাখা কর। &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের চেয়ারম্যানের গৃহীত ব্যবস্থা স্বাস্থ্যসেবার মান উন্নয়নে কতটুকু সহায়ক বিশ্লেষণ কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(22, 2, 3, 24, '<p>জামান দক্ষিণ কোরিয়াতে ড্রাইভার হিসেবে একটি প্রতিষ্ঠানে চাকরি নিয়ে আসে। যেখানে সে প্রথম এক মাস একটি বিশেষ কৃত্রিম পরিবেশে গাড়ি চালনার প্রশিক্ষণ গ্রহণ করে। এ পরিবেশেই সে বিভিন্ন পরিস্থিতিতে গাড়ি চালানোর নানা কৌশল রপ্ত করে। জামান তার কাজের পাশাপাশি আরও একটি প্রতিষ্ঠানেও ডেটা এন্ট্রির কাজ নেয়। তার পাঠানো অর্থেই গ্রামের বাড়িতে তার অর্ধপাকা ঘরটি আজ দোতলা দালানে পরিণত হয়েছে।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>কৃত্রিম বুদ্ধিমত্তা কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সামাজিক যোগাযোগ মাধ্যম বলতে কী বোঝায়?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে জামানের প্রবাস জীবনে কোন প্রযুক্তিটির কথা বলা হয়েছে? ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>জামানের ক্ষেত্রে তথ্য প্রযুক্তির ভূমিকা মূল্যায়ন কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>জামানের ক্ষেত্রে তথ্য প্রযুক্তির ভূমিকা মূল্যায়ন কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(23, 2, 3, 24, '<p>নির্বাচন কমিশন ন্যাশনাল আইডি কার্ড তৈরি করার জন্য প্রাপ্তবয়স্ক নাগরিকদের মুখম&ETH;লের ছবি, আঙুলের ছাপ এবং সিগনেচার সংগ্রহ করে একটি চমৎকার ডেটাবেজ তৈরি করেছে। ইদানিং বাংলাদেশ পাসপোর্ট অফিস নির্বাচন কমিশনের অনুমতি নিয়ে উক্ত ডেটাবেজের সাহায্যে মেশিন রিডেবল পাসপোর্ট তৈরি করেছে। কিছু অসৎ ব্যক্তি নকল পাসপোর্ট তৈরি করার জন্য উক্ত ডেটাবেজ হ্যাক করার চেষ্টা করে এবং পরিশেষে ব্যর্থ হয়।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ভিডিও কনফারেন্সিং কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;বিশেষ প্রযুক্তি ব্যবহারের মাধ্যমে নিরাপদে ড্রাইভিং প্রশিক্ষণ সম্ভব&rdquo; বুঝিয়ে লিখ।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নির্বাচন কমিশন ডেটাবেজ তৈরিতে যে প্রযুক্তির সাহায্যে নিয়েছিল তা উদ্দীপকের আলোকে বিশ্লেষণ কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের কিছু ব্যক্তির ব্যর্থ চেষ্টার নৈতিকতার দিকগুলো ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>উদ্দীপকের কিছু ব্যক্তির ব্যর্থ চেষ্টার নৈতিকতার দিকগুলো ব্যাখ্যা কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(24, 2, 3, 24, '<p>আইসিটি নির্ভর জ্ঞান ও প্রযুক্তি মানুষকে নানা বিষয়ে সমৃদ্ধির পথে এগিয়ে নিচ্ছে। হাসান ওঈঞ বিষয়ে পড়াশুনা করে জানতে পারল কোনো প্রকার অস্ত্রোপচার ছাড়া এক শৈল্য চিকিৎসা পদ্ধতি। পরবর্তীতে হাসান আইসিটি নির্ভর জীববৈচিত্র্য সৃষ্টির প্রযুক্তি বিষয়ে জ্ঞান লাভ করে খুবই আনন্দিত হলো।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যানোটেকনোলজি কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ব্যক্তি শনাক্তকরণের প্রযুক্তিটি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>হাসান এর চিকিৎসা পদ্ধতি শনাক্ত করে ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে যে প্রযু্িক্ত হাসানের জ্ঞান লাভে আনন্দ দিল সেই প্রযুক্তি কৃষি সম্পদ উন্নয়নের কি ধরনের ভূমিকা রাখে মতামত দাও।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>উদ্দীপকে যে প্রযু্িক্ত হাসানের জ্ঞান লাভে আনন্দ দিল সেই প্রযুক্তি কৃষি সম্পদ উন্নয়নের কি ধরনের ভূমিকা রাখে মতামত দাও।&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(25, 2, 3, 24, '<p>বাংলাদেশের প্রধানমন্ত্রী গণভবন থেকে ভিডিওর মাধ্যমে দেশের তৃতীয় সমুদ্রবন্দর হিসেবে পটুয়াখালীর কলাপাড়ায় অবস্থিত পায়রাবন্দর উদ্বোধন করেন। অপরদিকে দেশের শিক্ষামন্ত্রী সকল শিক্ষা প্রতিষ্ঠানকে ইলেকট্রনিক উপায়ে শিক্ষার্থীদের উপস্থিত নিশ্চিতকরণের কথা বলার প্রেক্ষিতে অইঈ কলেজের পরিচালনা পরিষদ শিক্ষার্থীদের জন্য ফেস-রিকগনিশন পদ্ধতি চালু করার কথা ভাবছে। যদিও বর্তমানে শিক্ষকদের জন্য আঙ্গুলের ছাপ পদ্ধতি চালু আছে।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ই-কমার্স কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&lsquo;শীতলীকরণ প্রক্রিয়ায় চিকিৎসা দেয়া সম্ভব&rsquo;-ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে সমুদ্রবন্দর উদ্ধোধনের জন্য ব্যবহৃত প্রযুক্তিটির সুবিধাগুলো কী কী? ব্যাখ্যা কর ।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপককে কম সময়ে উপস্থিতি নিশ্চিতকরণের ক্ষেত্রে কোনটির প্রাধান্য দেয়া কলেজের জন্য বেশি যুক্তিযুক্ত হবে? বিশ্লেষণ কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>উদ্দীপককে কম সময়ে উপস্থিতি নিশ্চিতকরণের ক্ষেত্রে কোনটির প্রাধান্য দেয়া কলেজের জন্য বেশি যুক্তিযুক্ত হবে? বিশ্লেষণ কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(26, 2, 3, 24, '<p>ডাঃ হাতেম শল্য চিকিৎসায় প্রশিক্ষণের জন্য চীন গমন করেন। ভর্তি হওয়ার সময় তাঁর একটি আঙ্গুলের ছাপ নেয়া হয় এবং তাঁকে একটি পরিচয়পত্র দেয়া হয়। প্রশিক্ষণকক্ষে ঢুকার পূর্বে তাঁকে প্রতিবার দরজায় রাখা একটি যন্ত্রে ঐ আঙ্গুলের চাপ দিয়েই ভিতরে প্রবেশ করতে হয়। শ্রেণিকক্ষে অন্যান্য প্রশিক্ষণার্থীদের মত তাঁকে হাত, মাথা ও চোখে কিছু বিশেষ যন্ত্র পরানো হয়। তিনি কম্পিউটারের মনিটরে বিভিন্ন দৃশ্যাবলির মাধ্যমে প্রশিক্ষণের প্রাথমিক পর্ব শেষ করেন।&nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>রোবোটিক্স কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>হ্যাকিং নৈতিকতা বিরোধী কর্মকান্ড- ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে উল্লিখিত দরজায় কোন প্রযুক্তি ব্যবহার করা হয়ছে? ব্যাখ্যা কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ডা: হাতেমের প্রশিক্ষণে ব্যবহৃত প্রযুক্তির ভূমিকা মূল্যায়ন কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>ডা: হাতেমের প্রশিক্ষণে ব্যবহৃত প্রযুক্তির ভূমিকা মূল্যায়ন কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(27, 2, 3, 24, '<p>নাঈম একদিন তার গবেষক মামার অফিসে গিয়ে দেখতে পেল যে, অফিসের কর্মকর্তাগণ মূল দরজার নির্ধারিত জায়গায় বৃদ্ধাঙ্গুল রাখতেই দরজা খুলে যাচ্ছে। সে আরো দেখতে পেল যে তার মামা গবেষণা কক্ষের বিশেষ স্থানে কিছুক্ষণ থাকাতেই দরজা খুলে গেল। নাঈম তার মামার কাছ থেকে জানতে পারল যে, তিনি মিষ্টি টমেটো উৎপাদন নিয়ে গবেষণা করছেন।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ই-কমার্স কী? &nbsp;&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিম্ন তাপমাত্রায় চিকিৎসা পদ্ধতি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>মিষ্টি টমেটো উৎপাদনে নাঈমের মামার ব্যবহৃত প্রযুক্তিটি বর্ণনা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে দরজা খোলার প্রযুক্তিদ্বয়ের মধ্যে কোনটি বহুল ব্যবহৃত বিশ্লেষণপূর্বক মতামত দাও।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>উদ্দীপকে দরজা খোলার প্রযুক্তিদ্বয়ের মধ্যে কোনটি বহুল ব্যবহৃত বিশ্লেষণপূর্বক মতামত দাও।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(28, 2, 3, 24, '<p>মি: &lsquo;&lsquo;ক&rdquo; একজন ব্যবস্থাপক। তিনি যে অফিসে চাকরি করেন যেখানে কর্মচারীর সংখ্যা কয়েক হাজার। অফিসের কর্মচারীদের হাজিরা নেয়ার জন্য তথ্য প্রযুক্তির সহায়তা নিলেন। তিনি এমন একটি প্রযুক্তির সাহায্য নিলেন, সেখানে আঙ্গুলের ছাপ ব্যবহার করা হয়। তিনি পর্যায়ক্রমে কর্মচারীদের কৃত্রিম পরিবেশে বিশেষ পোশাক পরিধান করে গাড়ি চালনা প্রশিক্ষণের ব্যবস্থা নিয়েছেন।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যানো টেকনোলজি কাকে বলে?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;টেলিমেডিসিন এক ধরনের সেবা&rdquo;- বুঝিয়ে লিখ।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে কর্মচারীদের প্রশিক্ষণে ব্যবহৃত প্রযুক্তি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে বর্ণিত মি: &ldquo;ক&rdquo; এর প্রযুক্তি নিরাপত্তার ক্ষেত্রে কতটুকু গুরুত্বপূর্ণ ভূমিকা রাখবে? তোমার মতামতের সপক্ষে যুক্তিসহ বিশ্লেষণ কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>উদ্দীপকে বর্ণিত মি: &ldquo;ক&rdquo; এর প্রযুক্তি নিরাপত্তার ক্ষেত্রে কতটুকু গুরুত্বপূর্ণ ভূমিকা রাখবে? তোমার মতামতের সপক্ষে যুক্তিসহ বিশ্লেষণ কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(29, 2, 3, 24, '<p>ডা: ফারিহা শহরের কর্মস্থল অবস্থান করেও প্রত্যন্ত অঞ্চলের নাগরিকদের চিকিৎসা সেবা দিয়ে থাকেন। তিনি কৃত্রিম পরিবেশে অপারেশনের প্রশিক্ষণ গ্রহণ করেছেন।&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>হ্যাকিং কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;যন্ত্র স্বয়ংক্রিয়ভাবে কাজ করে&rdquo;- ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ডা: ফারিহা কীভাবে চিকিৎসা সেবা দিয়ে থাকেন? ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ডা: ফারিহার প্রশিক্ষণে ব্যবহৃত প্রযুক্তিটি প্রাত্যহিক জীবনে কী প্রভাব রাখছে? আলোচনা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>ডা: ফারিহার প্রশিক্ষণে ব্যবহৃত প্রযুক্তিটি প্রাত্যহিক জীবনে কী প্রভাব রাখছে? আলোচনা কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(30, 2, 3, 24, '<p>ভিনক্লু নামে জাপানের এক প্রযুক্তি কোম্পানী ডিজিটাল প্রযুক্তির কৃত্রিম গৃহকর্মী তৈরি করেছে যার নাম দেওয়া হয়েছে হিকারি। এই গৃহকর্মীকে দেখা যাবে হলোগ্রাফিক পর্দায়। হিকারী তার গৃহকর্তাকে ঘুম থেকে জাগানো, গুড মর্নিং বলা, অফিসের কাজের ফাঁকে ফাঁকে বিভিন্ন বার্তা পাঠানোর কাজও করবে। রাফি সদ্য পড়াশুনা শেষ করে বেসরকারি ব্যাংকের কর্মকর্তা হিসেবে যোগদান করেছে। যেহেতু সে বাসায় একা থাকে তাই মাঝে মাঝে ঘুম থেকে উঠতে দেরী হয়। সেজন্য সে একটি হিকারি কেনার সিদ্ধান্ত নিলেন। যেহেতু হিকারীর দাম বেশি তাই বাসা থেকে চুরি না হয় সেজন্য বাসার নিরাপত্তার ব্যবস্থা গ্রহণের চিন্তা করলেন যাতে পরিচিত ব্যক্তিরা নির্দিষ্ট বাটনে আঙুলের ছাপ দিয়ে বাসায় প্রবেশ করতে পারবে। যদিও নিরাপত্তার জন্য তার অফিসের টাকার ভোল্টে প্রবেশের জন্য মাইক্রোফোনে কথা বলে প্রবেশ করতে হয়।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ক্রায়োসার্জারি কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আণবিক পর্যায়ের গবেষণার প্রযুক্তিটি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের হিকারি তৈরিতে ব্যবহৃত প্রযুক্তি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে রাফির বাসা ও অফিসে নিরাপত্তা ব্যবস্থা কৌশলের মধ্যে কোনটি বেশি উপযোগীবিশ্লেষণপূর্বক তোমার মতামত দাও।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>উদ্দীপকে রাফির বাসা ও অফিসে নিরাপত্তা ব্যবস্থা কৌশলের মধ্যে কোনটি বেশি উপযোগীবিশ্লেষণপূর্বক তোমার মতামত দাও।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(31, 2, 3, 24, '<p>কৃষি গবেষক ড. ফয়সাল আবিস্কৃত বীজ চাষ করে একজন কৃষক পূর্বের ফলনের চেয়ে অধিক ফলন ঘরে তুলল। ড. ফয়সাল একবার ব্রেন টিউমারে আক্রান্ত হন এবং চিকিৎসকের শরণাপন্ন হন। ডাঃ জামিল ও তাঁর দল অপারেশনের পূর্বে বিশেষ ধরনের হেলমেট পরে কম্পিউটার নিয়ন্ত্রিত প্রযুক্তির মাধ্যমে অভিজ্ঞতা অর্জন করে সফল অস্ত্রোপচার সম্পন্ন করেন। এই ধরনের জটিল ব্রেন টিউমার অপারেশন এ দেশে এর আগে আর হয়নি।</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ক্রায়োসার্জারি কী?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে অধিক ফলনের প্রযুক্তি ব্যাখ্যা কর।&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ড. ফয়সালের গবেষণায় কোন ধরনের প্রযুক্তি ব্যবহৃত হয়েছে? বর্ণনা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ডাঃ জামিলের কার্যক্রমের যৌক্তিকতা বিশ্লেষণ কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(32, 2, 3, 24, '<p>লিজা এইচ এস সি পরীক্ষার কারণে ঈদের শপিংয়ের জন্য মার্কেটে যেতে পারেনি তবে সে তথ্য প্রযুক্তির সহায়তায় বাসায় বসেই যাবতীয় কেনাকাটা সম্পন্ন করে। লিজার বড় ভাই চিকিৎসা বিজ্ঞানের ছাত্র। সে দেখলো তার বড় ভাই কম্পিউটার নিয়ন্ত্রিত হেলমেট, গ্লাভস ইত্যাদি ব্যবহার করে চিকিৎসা বিজ্ঞানের বিভিন্ন জটিল বিষয়সমূহ অনুধাবনের চেষ্টা করছে।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োমেট্রিক্স কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;ক্রায়োসার্জারির মাধ্যমে রক্তপাতহীন অপারেশন সম্ভব&rdquo;- বুঝিয়ে লেখ।&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>লিজার কেনাকাটায় তথ্য প্রযুক্তির যে দিকটি প্রতিফলিত হয়েছে তা আলোচনা কর।&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>লিজার ভাইয়ের কার্যক্রমের যৌক্তিকতা বিশ্লেষণ কর। &nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>লিজার ভাইয়ের কার্যক্রমের যৌক্তিকতা বিশ্লেষণ কর। &nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(33, 2, 3, 24, '<p>জনাব শিহাব একজন বৈমানিক। তিনি কম্পিউটারের মেলা থেকে ১ টেরাবাইটের একটি হার্ডডিস্ক কিনলেন। এটির আকার বেশ ছোট দেখে তিনি অবাক হলেন। প্রযুক্তির অগ্রযাত্রায় বিভিন্ন ডিভাইসের আকার ছোট হয়ে আসছে। বিমান চালনা প্রশিক্ষণের ব্যবস্থাতেও পরিবর্তন এসেছে। এখন সত্যিকারের বিমান ব্যবহার না করে কম্পিউটার নিয়ন্ত্রিত পরিবেশে বিমান পরিচালনার প্রশিক্ষণ দেওয়া হয়।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বিশ্বগ্রাম কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>তথ্য ও যোগাযোগ প্রযুক্তি ব্যবহারে নৈতিকতা ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে ছোট &nbsp;আকারের হার্ডডিস্কের ধারণক্ষমতা বৃদ্ধিতে যে প্রযুক্তি ব্যবহার করা হচ্ছে তার বর্ণনা দাও।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বিমান চালনা প্রশিক্ষণে ব্যবহৃত বর্তমান প্রযুক্তিটি নগর পরিকল্পনার ক্ষেত্রে ব্যবহার করা যায়। ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>বিমান চালনা প্রশিক্ষণে ব্যবহৃত বর্তমান প্রযুক্তিটি নগর পরিকল্পনার ক্ষেত্রে ব্যবহার করা যায়। ব্যাখ্যা কর।</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(34, 2, 3, 24, '<p>ইলিয়াস সাহেব নিজের ল্যাপটপ ব্যবহার করেই বহির্বিশ্বের বিভিন্ন অনুষ্ঠান দেখেন এবং আমেরিকা প্রবাসী ছেলের সাথে প্রতিদিন কথা বলেন। ইলিয়াস সাহেবের ছেলে ইমরান ল্যাপটপের মাধ্যমেই বিদেশি লাইব্রেরি ও বিশ্ববিদ্যালয় থেকে প্রয়োজনীয় তথ্যাদি সংগ্রহ করে এবং ঘরে বসেই একটি বিদেশি ডিগ্রি অর্জন করে।&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ইলেকট্রনিক মেইল বা ই-মেইল কী?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলি-মেডিসিন এক ধরনের সেবা- বুঝিয়ে বল।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে ইলিয়াস সাহেবের ক্ষেত্রে বিশ্বগ্রামের উপাদানটি ব্যাখ্যা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আমাদের দেশের শিক্ষায় ইমরানের কর্মকান্ডের প্রভাব বিশ্লেষণ কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(35, 2, 3, 24, '<p>সাব্বির সিঙ্গাপুরে বেড়াতে গেলে তার চাচা তাকে নিয়ে সায়েন্স পার্কে যায়। প্রবেশের সময় গেটে আঙ্গুল এবং চোখ ব্যবহৃত হয়। অতঃপর তারা সায়েন্স পার্কের প্লে জোনে গিয়ে বিশেষ ধরনের হেলমেট ও চশমা পরে অনেক্ষণ মজা করে ড্রাইভিং করে।</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যানোটেকনোলজি কী?&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>তথ্য প্রযুক্তির সাম্প্রতিক প্রবণতায় ডায়াবেটিস রোগীরা কীভাবে উপকৃত হচ্ছে?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের প্লে জোনে ব্যবহৃত প্রযুক্তিটি ব্যাখ্যা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের গেটে এবং আরেকটি স্থানে ব্যবহৃত প্রযুক্তির মধ্যে কোনটি অধিকতর ব্যবহৃত হচ্ছেবিশ্লেষণপূর্বক তোমার মতামত দাও।&nbsp;&nbsp; &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(36, 2, 3, 24, '<p>জনাব সাব্বির এক ব্যবসায়িক সভায় ল্যাপটপ চালু করে নিজের ব্যবসা সংক্রান্ত কিছু ভিডিও দেখালেন। তার একজন ব্যবসায়িক প্রতিদ্ব&rsaquo;দ্বী তার অনুপস্থিতিতে সে ভিডিওগুলো নেয়ার জন্য সাব্বির সাহেবের কম্পিউটার খুললেন কিন্তু তিনি সেখানে কিছুই পেলেন না। কিছুক্ষণ পর সাব্বির সাহেব ফিরে এসে কম্পিউটার খুললে প্রতিদ্ব&rsaquo;দ্বী ব্যবসায়ী ব্যবসা সংক্রান্ত ঐ ভিডিওগুলো দেখতে চাইলে তিনি তা তাকে আবার দেখালেন।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ফ্লাইট সিমুলেশন কি?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>3G মোবাইলের আবিষ্কার আমাদেরকে যে সুযোগ সৃষ্টি করে দিয়েছে তা বর্ণনা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সাব্বির সাহেব কোথায় তথ্য সংরক্ষণ করেন তার বর্ণনা দাও।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ICT এর ভাষায় উদ্দীপকে উল্লিখিত ব্যবসায়িক প্রতিদ্ব&rsaquo;দ্বীর কর্মকান্ড মূল্যায়ন কর।&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>ICT এর ভাষায় উদ্দীপকে উল্লিখিত ব্যবসায়িক প্রতিদ্ব&rsaquo;দ্বীর কর্মকান্ড মূল্যায়ন কর।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(37, 2, 3, 24, '<p>আলতাফ কম্পিউটার বিষয়ে প্রশিক্ষণ নিয়ে ঘরে বসে বিশেষ পদ্ধতিতে কাজ করে বৈদেশিক মুদ্রা অর্জন করে অর্থনৈতিকভাবে স্বাবলম্বী হয়েছে। তার বড় ভাই মিজান ব্যবসার পণ্য সামগ্রী ক্রয়-বিক্রয় ও অন্যান্য ব্যবসায়িক কর্মকান্ড পরিচালনার জন্য নিজস্ব ওয়েবসাইট ও ই-মেইল একাউন্ট খুলে পণ্য-দ্রব্যের বিজ্ঞাপন দিয়ে অল্পসময়ে ব্যবসায় উন্নতি ও খ্যাতি অর্জন করে।</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ভিডিও কনফারেন্সিং কী?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>প্রযুক্তি নির্ভর সমাজের/বিশ্বের সুবিধা ব্যাখ্যা কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের আলোকে মিজানের ব্যবসায়িক কর্মকান্ড ব্যাখ্যা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;বাংলাদেশের যুব সমাজের বেকারত্ব দূরীকরণে আলতাফ অনুকরণীয় দৃষ্টান্ত&rdquo;-উক্তিটির যৌক্তিকতা বিশ্লেষণ কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(38, 2, 3, 24, '<p>১ম বর্ষের ওরিয়েন্টশন ক্লাসে অধ্যক্ষ মহোদয় বললেন, &ldquo;নিয়মিত ক্লাসে উপস্থিত হতে হবে। একজনের উপস্থিতি যেন অন্য কেউ দিতে না পারে, তার জন্য বিশেষ যন্ত্র আছে। শুধু তাই নয়, ক্লাসে উপস্থিত না হলে অভিভাবক তা স্বয়ংক্রিয়ভাবে সাথে সাথে &nbsp;জেনে যাবেন।&rdquo;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জেনেটিক ইঞ্জিনিয়ারিং কী?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;&nbsp; &nbsp;&ldquo;প্রযুক্তি ব্যবহারের মাধ্যমে নিরাপদে প্রাক্ ড্রাইভিং প্রশিক্ষণ সম্ভব&rdquo;- কীভাবে?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকের আলোকে উপস্থিতি নিশ্চিতকরণ পদ্ধতি ব্যাখা কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;তথ্য প্রযুক্তি ব্যবহার করে শিক্ষাঙ্গনে শিক্ষার অনুকূল পরিবেশ সৃষ্টি করা সম্ভব&rdquo;-উদ্দীপকের আলোকে আলোচনা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(39, 2, 3, 24, '<p>দৃশ্যকল্প-১ : আসিফ কুয়াকাটা বেড়াতে গিয়ে অসুস্থ হয়ে পড়লে ঢাকায় অবস্থানরত একজন চিকিৎসকের সঙ্গে যোগাযোগ করে। তিনি আসিফকে দ্র&aelig;ত হাসপাতালে যেতে পরামর্শ দিলেন। পরে হাসপাতালের চিকিৎসক ঢাকার বিশেষজ্ঞ চিকিৎসকের পরামর্শ অনুযায়ী তাকে ঢাকার হাসপাতালে প্রেরণ করে।&nbsp;<br />\r\nদৃশ্যকল্প-২:&nbsp;&nbsp; &nbsp;কম্পিউটার প্রশিক্ষিত সুমি&nbsp;&nbsp; &nbsp;&rarr;&nbsp;&nbsp; &nbsp;ইউনিয়ন তথ্য সেবা কেন্দ্রে চাকরি&nbsp;&nbsp; &nbsp;&rarr;&nbsp;&nbsp; &nbsp;স্বাবলম্বী&nbsp;&nbsp; &nbsp;&rarr;&nbsp;&nbsp; &nbsp;দেশের উন্নয়ন</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ই-মেইল কী?&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিরাপত্তায় বায়োমেট্রিক্স প্রযুক্তির অবদান বুঝিয়ে লেখ।&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>দৃশ্যকল্প-১ এ কোন প্রযুক্তির উল্লেখ করা হয়েছে তা ব্যাখ্যা কর।&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>দৃশ্যকল্প-২ এর প্রবাহ চিত্রের আলোকে তথ্য প্রযুক্তির ভূমিকা বিশ্লেষণ কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(40, 2, 3, 24, '<p>রাজিব শিক্ষা সফরে ঢাকা এসে বঙ্গবন্ধু নভোথিয়েটার পরিদর্শনে যায়। সেখানে সে কৃত্রিম পরিবেশে সৌর দৃশ্যাবলি অবলোকন করে। রাজিব মহাকাশ ভ্রমণরত একজন নভোচারীর মত রোমাঞ্চকর অনুভূতি অনুভব করল। পরবর্তীতে রাজিব তার বন্ধুদের সাথে তার অভিজ্ঞতা বিনিময় করে এবং তারা একটি মহাকাশ জ্ঞানচর্চা নামে ক্লাব গড়ে তোলে। &nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>কৃত্রিম বুদ্ধিমত্তা কী?&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োমেট্রিক্স একটি আচরণীক বৈশিষ্ট্যনির্ভর প্রযুক্তি কেন?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে ব্যবহৃত প্রযুক্তিটি ব্যাখ্যা কর। &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রাজিবের ক্ষেত্রে তথ্য প্রযুক্তির প্রভাব যুক্তিসহ বিশ্লেষণ কর।&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(41, 2, 3, 24, '<p>ড: মাকসুদ দেশের খাদ্য ঘাটতি পূরণ নিমিত্তে দীর্ঘদিন গবেষণা করে বন্যা ও খরা সহনশীল উন্নতজাতের ধান আবিষ্কার করেন। তথ্যের যথাযথ ব্যবস্থা না নেওয়ায় অন্য একজন তার গবেষণালব্দ ফল নিজের নামে পেটেন্ট দাবি করে।&nbsp;&nbsp; &nbsp;[মা.বো. ২০১৭]</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ই-মেইল কী?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&ldquo;বিশ্বগ্রামের মেরুদ&ETH;ই হচ্ছে কানেক্টিভিটি&rdquo;- বিশ্লেষণ কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>খাদ্য ঘাটতি পূরণে মাকসুদ সাহেবের প্রযুক্তি বর্ণনা কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>পেটেন্ট দাবিকারীর কর্মকান্ড মূল্যায়ন কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(42, 2, 3, 24, '<p>সাভারের রানা প্লাজা ধ্বসে নিহত বহু পোশাক শ্রমিকের পরিচয় প্রাথমিক অবস্থায় শনাক্ত করা যাচ্ছিল না। পরবর্তীতে সরকারের সদিচ্ছায় উচ্চ প্রযুক্তির মাধ্যমে অধিকাংশ লাশ শনাক্ত করা সম্ভব হয়। &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>ন্যানো টেকনোলজি কী?&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>জেনেটিক ইঞ্জিনিয়ারিং কীভাবে মানুষকে সহায়তা দিচ্ছে?&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>উদ্দীপকে বর্ণিত পরিস্থিতিতে শ্রমিকদের লাশ শনাক্তকরণের জন্য গৃহীত পদ্ধতি চিহ্নিত করে তা ব্যাখ্যা কর।&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>উদ্দীপকের আলোকে তথ্য-প্রযুক্তি ব্যবহার করে প্রতিরোধমূলক ব্যবস্থা গ্রহণের মাধ্যমে ঝুঁকি কমিয়ে আনা সম্ভব- বিশ্লেষণ কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\"]', '<p>উদ্দীপকের আলোকে তথ্য-প্রযুক্তি ব্যবহার করে প্রতিরোধমূলক ব্যবস্থা গ্রহণের মাধ্যমে ঝুঁকি কমিয়ে আনা সম্ভব- বিশ্লেষণ কর।&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '4', '2017', 1),
(43, 2, 3, 24, '<p>ড. জামিল একজন কৃষি গবেষক। তাঁর আবিষ্কৃত বীজ চাষ করে একজন কৃষক পূর্বের ফসলে চেয়ে অধিক ফসল ঘরে তুলল। ড. জামিল একদিন তাঁর বন্ধু চিকিৎসকের নিকট গালের আঁচিল অপারেশনের জন্য গেলেন। বন্ধু তাকে স্বল্প সময়ে 20<sup>০</sup>C&nbsp; তাপমাত্রায় রক্তপাতহীন অপারেশন করলেন। তিনি তৎক্ষণাৎ বাড়ী ফিরে এলেন।&nbsp;&nbsp; &nbsp;[ব.বো. ২০১৭]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>রোবোটিক্স কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ব্যক্তি শনাক্তকরণের প্রযুক্তিটি ব্যাখ্যা কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ড. জামিলের গবেষণায় কোন ধরনের প্রযুক্তি ব্যবহৃত হয়েছে ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ড. জামিলের বন্ধুর চিকিৎসা পদ্ধতির যৌক্তিকতা বিশ্লেষণপূর্বক মতামত দাও।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>ড. জামিলের বন্ধুর চিকিৎসা পদ্ধতির যৌক্তিকতা বিশ্লেষণপূর্বক মতামত দাও।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '5', NULL, 1),
(44, 2, 3, 24, '<p>জয়িতা চৌধুরী পরীক্ষা সংক্রান্ত প্রজেক্ট পেপার তৈরির ক্ষেত্রে ইন্টারনেটের সহায়তা নিয়ে থাকে। সে নিয়ম মেনে প্রতিটি তথ্যের উৎস উল্লেখ করে। ইন্টারনেট থেকে প্রাপ্ত তথ্য হতে সে এমন একটি প্রযুক্তি সম্পর্কে জেনেছে যা দিয়ে অণুর গঠন দেখা সম্ভব। তবে জয়ন্ত ইন্টারনেট থেকে বিভিন্ন ফাইলের সফটকপি সংগ্রহ করে কোনোরূপ কৃতজ্ঞতা জ্ঞাপন ছাড়াই নিজের নামে প্রকাশ করে।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োইনফরমেটিক্স কী?&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বাস্তবে অবস্থান করেও কল্পনাকে ছুঁয়ে দেখা সম্ভব- ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে উল্লিখিত প্রযুক্তিটির ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>তথ্য প্রযুক্তির নৈতিকতার বিচারে জয়িতা চৌধুরী ও জয়ন্তের আচরণ মূল্যায়ন কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>তথ্য প্রযুক্তির নৈতিকতার বিচারে জয়িতা চৌধুরী ও জয়ন্তের আচরণ মূল্যায়ন কর।&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '1', NULL, 1),
(45, 2, 3, 24, '<p>আসিফ আমেরিকার একটি বিশ্ববিদ্যালয়ে পড়াশুনার সুযোগ পায়। কিন্তু আর্থিক অস্বচ্ছলতার কারণে আমেরিকাতে যাওয়া সম্ভব হয়নি। অতঃপর বাংলাদেশে বসেই অনলাইনের মাধ্যমে বিশ্ববিদ্যালয়ের ডিগ্রি অর্জন করল। আসিফ পড়াশুনার ফাঁকে ফাঁকে অনলাইনে কাজ করে অর্থ উপার্জন করে। ফলে তার পারিবারিক অবস্থার উন্নতি হয়। তার বন্ধু মনির নতুন জাতের টমোটো চাষ করে আর্থিকভাবে লাভবান হয়।&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>ন্যানো টেকনোলজি কী?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>নিম্ন তাপমাত্রায় চিকিৎসা পদ্ধতি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>আসিফের বিশ্ববিদ্যালয়ের ডিগ্রি অর্জন কীভাবে সম্ভব হয়েছে? ব্যাখ্যা কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>উদ্দীপকের আলোকে আসিফ ও মনির এর আর্থিক সচ্ছলতার কারণ তুলনামূলক বিশ্লেষণপূর্বক তোমার মতামত দাও।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\"]', '<p>উদ্দীপকের আলোকে আসিফ ও মনির এর আর্থিক সচ্ছলতার কারণ তুলনামূলক বিশ্লেষণপূর্বক তোমার মতামত দাও।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '4,9', '2017', 1),
(46, 2, 3, 24, '<p>সোমা তার বন্ধুকে মোবাইল দিয়ে গুগল ম্যাপ ব্যবহার করে উত্তরায় তার বাড়ির অবস্থান দেখচ্ছিল। সোমা অবাক হয়ে জানতে চাইল এটা কীভাবে করলি? সোমা বললো এটা তো কিছুই না আমি আমার এই মোবাইল দিয়ে চাইলে বাড়িতে বসেই আমার পড়াশোনার বিষয়ে যে কোনো তথ্য জানতে পারি, এমনকি আমার প্রয়োজনীয় পাঠ্য বইও এখানে &nbsp;রেখে দিতে পারি ।&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>জিপিএস (GPS) কি?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>&lsquo;অ্যাকচুয়েটর হলো রোবোটের পেশী&rsquo;- ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>বিশ্বগ্রামে যোগাযোগকে সহজ করতে জনপ্রিয় গুগল ম্যাপ এর ব্যবহৃত প্রযুক্তিটি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>সোমা তার পড়াশোনার জন্য যে মোবাইলের সহায়তা নিচ্ছে তা কতটা ইতিবাচক বা নেতিবাচক এ বিষয়ে যুক্তিসহ তোমার মতামত উপস্থাপন কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\"]', '<p>সোমা তার পড়াশোনার জন্য যে মোবাইলের সহায়তা নিচ্ছে তা কতটা ইতিবাচক বা নেতিবাচক এ বিষয়ে যুক্তিসহ তোমার মতামত উপস্থাপন কর।&nbsp;&nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '5', '2012', 1),
(47, 2, 3, 24, '<p>রনি তার ভাইয়ের বাসায় বেড়াতে এসে দেখল তার বাসায় মানুষের মতো একটি যন্ত্র ভাইয়ার নির্দেশমতো বিভিন্ন রকম কাজ করছে। ভাইয়ার ঘর পরিষ্কার, চা বানানো এমনকি ভাইয়ার থিসিসের কাজগুলোতেও সে ভাইয়ার নির্দেশমতো নির্ভুলভাবে সব রকম সাহায্য করে যাচ্ছে। এর মধ্যে ভাইয়ার মোবাইলে তার ল্যাবের একজন সহকারী ফোন করল। রনি দেখল তিনি ভাইয়ার ফোনে তার ল্যাবের কমপিউটারটির স্ক্রিনের ভিডিও দেখিয়ে সেখানে কি যেন একটা সমস্যার সমাধান ভাইয়ার কাছ থেকে জেনে নিল। &nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বুলেটিন বোর্ড কী?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কীভাবে বিশ্বকে নেটওয়ার্কের আওতায় আনা যায় ব্যাখ্যা কর।&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>উদ্দীপকে রনির ভাইয়ের সহকর্মীর ব্যবহৃত প্রযুক্তির জন্য প্রয়োজনীয় উপকরণগুলো বর্ণনা কর।&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রনির ভাইয়ের শারীরিক পরিবর্তন বিবেচনায় নিয়ে উদ্দীপক উল্লিখিত যন্ত্রটি ব্যবহারের নেতিবাচক প্রভাব কীভাবে কাটিয়ে ওঠা যায় সে সম্পর্কে তোমার সুচিন্তিত মতামত প্রদান কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(48, 2, 3, 24, '<p>রুমার মা হঠাৎ করে অসুস্থ হয়ে পড়লে তাঁকে হাসপাতালে ভর্তির পর জানা যায় তাঁর কানেক্টিভ টিস্যু (যোজক কলা) তে টিউমার রয়েছে যা তৎক্ষণাৎ অপসারণ করা প্রয়োজন। কিন্তু বয়সজনিত জটিলতায় তাঁকে অপারেশন করা সম্ভব নয়। এমতাবস্থায় &nbsp;হাসপাতালের বিশেষজ্ঞ ডা: সুমন সিদ্ধান্ত নেন বিশেষ পদ্ধতিতে কোন কাটাছেঁড়া ছাড়াই তাঁর টিউমারটি অপসারণ করতে হবে। এক্ষেত্রে তিনি অপারেশনের সময় সম্পূর্ণ প্রক্রিয়াটিতে যে কোনো অনাকাক্সিক্ষত জটিলতা এড়াতে তাৎক্ষণিক সহায়তা এবং প্রায়োজনীয় পরামর্শ দিতে তাঁর এককালীন অত্যন্ত &nbsp;ঘনিষ্ঠ সহকর্মী সিঙ্গাপুরে অবস্থানরত টিউমার ও ক্যান্সার বিশেষজ্ঞ ডা: বকুলকে অনুরোধ জানান।</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জিআইএস(GIS) কি?</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>চিকিৎসা ক্ষেত্রে AI এর প্রয়োগ বুঝিয়ে লেখ।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অপারেশন চলাকালীন সময় ডা : সুমনের সাথে সার্বক্ষণিক যুক্ত থাকার মাধ্যমে তাঁর সাহায্য গ্রহণের জন্য প্রয়োজনীয় প্রযুক্তিটি ব্যাখ্য কর।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রুমার মায়ের চিকিৎসায় ডাঃ সুমনের নেয়া সিদ্ধান্তসমূহ &nbsp;কতটুকু বাস্তবসম্মত সে বিষয়ে যুক্তিসহ তোমার মতামত উপস্থাপন কর।&nbsp;&nbsp; &nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', NULL, NULL, 1),
(49, 2, 3, 24, '<p>সুজন সম্প্রতি সিম কিনতে দোকানে গেলে দোকানি পরিচয় নিশ্চিত করতে তার পরিচয়পত্রের ফটোকপি নেবার পর একটি যন্ত্রে তার হাতের আঙুলের ছাপ দিতে বলল। দোকানির সিম বিক্রির কার্যক্রমের মাঝে সুজন দোকানে ঝুলিয়ে রাখা বিভিন্ন ইন্ট্রিগ্রেটেড মেমোরি কার্ডের প্যাকেটগুলো লক্ষ্য করল। সে ভাবল এখনকার মেমোরি কার্ডগুলো যত ছোটো, তাদের ধারণ ক্ষমতা ততই বেশি। কোনোটা ৩২ জিবি, কোনোটা ৬৪ জিবি, এমনকি ১২৮ জিবি পর্যন্ত মেমোরি দেখার পর মনে মনে সে হাসল। মাত্র বছর দশেক আগেও এদেশে এদেশে ১ গিগাবাইট মেমোরি ছিল সর্বোচ্চ। ইতোমধ্যে দোকানি তাকে বলল, স্যার আপনার আঙুলের ছাপটি আরেকবার দিন। অবশেষে ৩য় বার আঙুলের ছাপ দেবার পর সুজন তার পরিচিতি নিশ্চিত করে সীম কিনতে সক্ষম হলো।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>আরএফআইডি (RFID) কি?</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>&lsquo;কম্পিউটার নিয়ন্ত্রিত পরিবেশে অবাস্তবকে বাস্তবের ন্যায় অনুভূত হয়&rsquo;-ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>উদ্দীপকে সুজনের মেমোরি কার্ড বিষয়ক ভাবনার সাথে সংশ্লিষ্ট প্রযুক্তিটি ব্যাখ্যা কর।</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>উদ্দীপকে সীম কেনার জন্য সুজনের পরিচিতি নিশ্চিত করতে ব্যবহৃত প্রযুক্তিটির ক্ষেত্রে সৃষ্ট জটিলতার কারণ কি? তোমার মতামতটি যুক্ত দিয়ে বিশ্লেষণ কর।&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\"]', '<p>উদ্দীপকে সীম কেনার জন্য সুজনের পরিচিতি নিশ্চিত করতে ব্যবহৃত প্রযুক্তিটির ক্ষেত্রে সৃষ্ট জটিলতার কারণ কি? তোমার মতামতটি যুক্ত দিয়ে বিশ্লেষণ কর।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '4', '2000', 1),
(50, 2, 3, 24, '<p>ABC</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>a</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>b</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>c</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>d</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\"]', '<p>d</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '5', '2017', 1),
(51, 1, 1, 6, '<p>test asgsdag</p>\r\n', '[\"<p>asgd</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\"]', '<p>asgd</p>\r\n', '5,7,9,12,1,2,3', '2016', 1),
(52, 2, 3, 24, '', '[\"\",\"\",\"\",\"\"]', '', '8', '', 1),
(53, 2, 3, 24, '<p>a</p>\r\n', '[\"<p>a</p>\\r\\n\",\"<p>a</p>\\r\\n\",\"<p>a</p>\\r\\n\",\"<p>a</p>\\r\\n\"]', '<p>a</p>\r\n', '4', '2017', 1);

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
(9, 'Test Exam 07', 'SHS_55_5015', 32, '1', '1', '2023-05-05 10:38:00', '2023-05-05 11:38:00', 0, 1, 1, '2023-05-05 04:38:19', '2023-05-05 04:38:19'),
(10, 'Exam-1st Chapter', 'SHS_105_3217', 39, '2', '3', '2023-05-10 09:41:00', '2023-05-12 09:41:00', 0, 1, 1, '2023-05-10 03:41:55', '2023-05-10 03:41:55'),
(11, 'test exam', 'SHS_105_2852', 40, '2', '3', '2023-05-10 14:52:00', '2023-05-10 15:52:00', 0, 1, 1, '2023-05-10 08:52:59', '2023-05-10 08:52:59'),
(12, 'Abc', 'SHS_105_4815', 40, '2', '3', '2023-05-10 15:46:00', '2023-05-12 15:46:00', 0, 1, 1, '2023-05-10 09:46:56', '2023-05-10 09:46:56'),
(13, 'Test exam 99', 'SHS_105_1741', 40, '1', '3', '2023-05-10 15:49:00', '2023-05-10 16:49:00', 0, 1, 1, '2023-05-10 09:49:24', '2023-05-10 09:59:26'),
(14, 'test004', 'SHS_105_1197', 40, '2', '3', '2023-05-10 16:59:00', '2023-05-10 20:59:00', 0, 1, 1, '2023-05-10 10:59:10', '2023-05-10 10:59:10'),
(15, '2nd Exam', 'QK(QG_145_1739', 40, '2', '3', '2023-05-14 14:46:00', '2023-05-14 15:11:00', 0, 1, 1, '2023-05-14 08:47:42', '2023-05-14 08:47:42'),
(16, '2nd Chapter Weekly Exam', 'QK(QG_145_1846', 48, '2', '3', '2023-05-14 15:27:00', '2023-05-15 15:27:00', 0, 1, 1, '2023-05-14 09:28:03', '2023-05-14 09:28:03'),
(17, '123', 'QK(QG_145_1749', 49, '2', '3', '2023-05-14 15:35:00', '2023-05-15 15:35:00', 0, 1, 1, '2023-05-14 09:36:02', '2023-05-14 09:36:02'),
(18, 'Daily Exam ', 'QK(QG_145_5453', 49, '2', '3', '2023-05-14 15:59:00', '2023-05-25 15:59:00', 0, 1, 1, '2023-05-14 09:59:51', '2023-05-14 09:59:51'),
(19, 'Weekly Exam (14-05-23)', 'QK(QG_145_9571', 49, '2', '3', '2023-05-14 16:35:00', '2023-05-14 17:35:00', 0, 1, 1, '2023-05-14 10:35:15', '2023-05-14 10:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `exams_participants`
--

CREATE TABLE `exams_participants` (
  `id` int(11) NOT NULL,
  `answers` varchar(800) NOT NULL,
  `submit_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
(9, '\"2,1,1,1\"', '0000-00-00 00:00:00', 1, 9, 201002182, 1, '2023-05-05 04:39:44', '2023-05-05 04:39:53'),
(10, '\"3,3,3,1,2,0,3,1,0,3,2,1,3,3,1,2\"', '0000-00-00 00:00:00', 1, 12, 100, 1, '2023-05-10 10:09:20', '2023-05-10 10:09:25'),
(11, '\"4,4,4,2,3,1,4,2,1,4,3,2,4,2,2,1\"', '2023-05-10 11:20:41', 9, 14, 100, 1, '2023-05-10 11:20:39', '2023-05-10 11:20:41'),
(12, '\"4,4,4,2,3,1,4,2,1,4,3,2,4,4,2,3\"', '2023-05-14 08:50:07', 8, 15, 100, 1, '2023-05-14 08:49:48', '2023-05-14 08:50:07'),
(13, '\"3,4,4,3,3,2,2,1,3,4,4,4,1,4,1,3,3\"', '2023-05-14 09:30:32', 15, 16, 100, 1, '2023-05-14 09:30:29', '2023-05-14 09:30:32'),
(14, '\"2,2,2,1,2,2,1,2,2,3,4,4,1,4,1\"', '2023-05-14 09:37:18', 6, 17, 100, 1, '2023-05-14 09:37:16', '2023-05-14 09:37:18'),
(15, '\"3,4,4,3,3,2,2,1,3,4,4,4,1,4,1\"', '2023-05-14 10:02:41', 15, 18, 100, 1, '2023-05-14 10:02:39', '2023-05-14 10:02:41'),
(16, '\"1,3,2,1,1,1,1,3,1,2,1,4,1,4,1\"', '2023-05-14 10:36:31', 4, 19, 100, 1, '2023-05-14 10:36:26', '2023-05-14 10:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE `filter` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` (`id`, `type`, `name`) VALUES
(1, 'uni', 'BUET'),
(2, 'uni', 'Dhaka University'),
(3, 'uni', 'Jahangirnagar University'),
(4, 'board', 'Dhaka'),
(5, 'board', 'Comilla'),
(6, 'board', 'Jessore'),
(7, 'board', 'Chittagong'),
(8, 'board', 'Rajshahi'),
(9, 'board', 'Dinajpur'),
(10, 'board', 'Barishal'),
(11, 'board', 'Sylhet'),
(12, 'board', 'Mymensingh'),
(13, 'board', 'Madrasha ');

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
(1, 'silver', 1000, 100, 11, 33, 0, '2023-04-04 19:57:02.639398'),
(2, 'gold', 20000, 100, 33, 500, 0, '2023-04-04 19:57:02.655152'),
(3, 'platinum', 30000, 100, 50, 5000, 0, '2023-04-04 19:57:02.665706');

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
  `question_answer` text NOT NULL,
  `filter` varchar(300) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `fk_author` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_option`, `question_answer`, `filter`, `year`, `fk_author`) VALUES
(1, 1, 2, 1, '<p>কোন বাক্যে ক্রিয়া পদ উহ্য রয়েছে?</p>\r\n', '[\"<p>তিনি সাঁতার কাটছেন</p>\\r\\n\",\"<p>ইনি আমার ভাই</p>\\r\\n\",\"<p>কবির বই পড়ছে</p>\\r\\n\",\"<p>করণকারক</p>\\r\\n\"]', '2', NULL, NULL, 1),
(12, 1, 4, 7, '<p>কবি গানের প্রথম কবি &ndash;</p>\r\n', '[\"<p>গোজলা পুট</p>\\r\\n\",\"<p>হরু ঠাকুর</p>\\r\\n\",\"<p>ভবানী ঘোষ</p>\\r\\n\",\"<p>নিতাই বৈরাগী</p>\\r\\n\"]', '2', NULL, NULL, 1),
(26, 1, 2, 1, '<h2><span style=\"font-size:14px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় ! dd</p>\\r\\n\"]', '4', NULL, NULL, 1),
(27, 1, 4, 7, '<p>আমাদের দেশের নাম কি?</p>\r\n', '[\"<p>বাংলাদেশ</p>\\r\\n\",\"<p>ভারত</p>\\r\\n\",\"<p>নেপাল</p>\\r\\n\",\"<p>ভুটান</p>\\r\\n\"]', '1', NULL, NULL, 1),
(28, 1, 2, 1, '<p>কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</p>\r\n', '[\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\",\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\",\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\",\"<p>অবকাশে বসন্ত বাতাসে অতীতের&nbsp;</p>\\r\\n\"]', '1', NULL, NULL, 1),
(29, 1, 4, 7, '<h2><span style=\"font-size:16px\">কোন বাক্যে ক্রিয়া পদ উহ্য রয়েছে?</span></h2>\r\n', '[\"<p>তিনি সাঁতার কাটছেন</p>\\r\\n\",\"<p>ইনি আমার ভাই</p>\\r\\n\",\"<p>কবির বই পড়ছে</p>\\r\\n\",\"<p>আমি লিখছি</p>\\r\\n\"]', '2', NULL, NULL, 1),
(35, 1, 2, 1, '<h2><span style=\"font-size:12px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় !</p>\\r\\n\"]', '4', NULL, NULL, 1),
(36, 1, 4, 7, '<h2><span style=\"font-size:14px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় adhg</p>\\r\\n\"]', '4', NULL, NULL, 1),
(37, 1, 1, 6, '<h2><span style=\"font-size:12px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?.</span></h2>\r\n', '[\"<p>শামসুর রাহমান.</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর.</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম.</p>\\r\\n\",\"<p>কোনটিই নয় .</p>\\r\\n\"]', '2', NULL, NULL, 1),
(38, 1, 2, 1, '<h2><span style=\"font-size:12px\">কোনোদিন কর্মহীন পূর্ণ অবকাশে বসন্ত বাতাসে অতীতের তীর হাতে যে রাত্রে বহীবে দীর্ঘশ্বাস, ঝরা বকুলের কান্না ব্যথিবে আকাশ। উপরিউক্ত চরণের রচয়িতা কে?</span></h2>\r\n', '[\"<p>শামসুর রাহমান</p>\\r\\n\",\"<p>রবীন্দ্রনাথ ঠাকুর</p>\\r\\n\",\"<p>কাজী নজরুল ইসলাম</p>\\r\\n\",\"<p>কোনটিই নয় sdfh</p>\\r\\n\"]', '4', NULL, NULL, 1),
(40, 1, 1, 6, '<p>What is x+y?</p>\r\n', '[\"<p>3</p>\\r\\n\",\"<p>35</p>\\r\\n\",\"<p>35</p>\\r\\n\",\"<p>35</p>\\r\\n\"]', '3', NULL, NULL, 1),
(41, 1, 1, 6, '<p>x+y= 3 and x-y = 3 then what is&nbsp;<span class=\"math-tex\">\\((x^2+y^2)^4\\)</span>&nbsp;and what is xy2</p>\r\n', '[\"<p>353</p>\\r\\n\",\"<p>5</p>\\r\\n\",\"<p>345</p>\\r\\n\",\"<p>35</p>\\r\\n\"]', '2', NULL, NULL, 1),
(42, 1, 4, 7, '<h2><span style=\"font-size:14px\">ই-কমার্স সাইট amazon.com কত সালে প্রতিষ্ঠিত হয়?</span></h2>\r\n', '[\"<p>১৯৯০ সালে</p>\\r\\n\",\"<p>১৯৮৮ সালে</p>\\r\\n\",\"<p>১৯৯৪ সালে</p>\\r\\n\",\"<p>১৯৯৮ সালে</p>\\r\\n\"]', '1', NULL, NULL, 1),
(43, 1, 1, 6, '<h2><span style=\"font-size:14px\">বৃত্তের পরিধি ও ব্যাসের অনুপাত-</span></h2>\r\n', '[\"<p>3</p>\\r\\n\",\"<p>4</p>\\r\\n\",\"<p>22/3</p>\\r\\n\",\"<p>44/2</p>\\r\\n\"]', '1', NULL, NULL, 1),
(44, 1, 1, 6, '<h2><span style=\"font-size:14px\">কোন চতুর্ভুজের বিপরীত কৌণিক বিন্দুর সংযোজন রেখাংশ দুটির প্রত্যেকটিকে বলে-</span></h2>\r\n', '[\"<p>ভূমি</p>\\r\\n\",\"<p>কর্</p>\\r\\n\",\"<p>মধ্যমা</p>\\r\\n\",\"<p>উচ্চতা</p>\\r\\n\"]', '4', '', '', 1),
(45, 1, 1, 6, '<p><span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span>&nbsp;er man koto?</p>\r\n', '[\"<p>1</p>\\r\\n\",\"<p>22</p>\\r\\n\",\"<p>4</p>\\r\\n\",\"<p>24</p>\\r\\n\"]', '2', NULL, NULL, 1),
(46, 1, 1, 6, '<p><img alt=\"\" src=\"http://localhost:3000/uploads/questions/goalm.jpg\" style=\"height:31px; width:122px\" />&nbsp;</p>\r\n\r\n<p>Hello&nbsp;<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>test&nbsp;</p>\\r\\n\",\"<p>&nbsp;asdg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\"]', '3', NULL, NULL, 1),
(47, 1, 1, 6, '<p>adg</p>\r\n', '[\"<p>adsg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2', NULL, NULL, 1),
(48, 1, 1, 6, '<p>New sample chek for edit working</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>adsg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '1', NULL, NULL, 1),
(49, 1, 1, 6, '<p>Hello there</p>\r\n', '[\"<p>jhon</p>\\r\\n\",\"<p>kabir</p>\\r\\n\",\"<p>mitro</p>\\r\\n\",\"<p>sen</p>\\r\\n\"]', '2', NULL, NULL, 1),
(50, 1, 1, 6, '<p>Test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>adg</p>\\r\\n\"]', '4', NULL, NULL, 1),
(51, 1, 1, 6, '<p>asdg</p>\r\n', '[\"<p>sadg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sdag</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '1', NULL, NULL, 1),
(52, 1, 1, 6, '<p>Test from server</p>\r\n', '[\"<p>test 1</p>\\r\\n\",\"<p>test 1</p>\\r\\n\",\"<p>test 2</p>\\r\\n\",\"<p>&nbsp;sadg</p>\\r\\n\"]', '3', NULL, NULL, 1),
(53, 1, 2, 1, '<p>bangla vasa&nbsp;</p>\r\n', '[\"<p>ee</p>\\r\\n\",\"<p>rr</p>\\r\\n\",\"<p>dd</p>\\r\\n\",\"<p>ss</p>\\r\\n\"]', '4', NULL, NULL, 1),
(54, 1, 1, 6, '', '[\"\",\"\",\"\",\"\"]', '1', NULL, NULL, 1),
(55, 1, 1, 6, '<p>Test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2', NULL, NULL, 1),
(56, 1, 1, 6, '<p>asgd 33</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2', NULL, NULL, 1),
(57, 1, 1, 6, '<p>aasdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '3', NULL, NULL, 1),
(58, 1, 1, 6, '<p>sdfg</p>\r\n', '[\"<p>sfg</p>\\r\\n\",\"<p>sfdg</p>\\r\\n\",\"<p>sdfg</p>\\r\\n\",\"<p>sfgd</p>\\r\\n\"]', '1', NULL, NULL, 1),
(59, 1, 1, 6, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4', NULL, NULL, 1),
(60, 1, 1, 6, '<p>3333</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2', NULL, NULL, 1),
(61, 1, 1, 6, '<p>2222</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>ag</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4', NULL, NULL, 1),
(62, 1, 1, 6, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2', NULL, NULL, 1),
(63, 1, 1, 6, '<p>222333</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asgd</p>\\r\\n\",\"<p>adg</p>\\r\\n\",\"<p>asg</p>\\r\\n\"]', '3', NULL, NULL, 1),
(64, 1, 1, 8, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4', NULL, NULL, 1),
(65, 1, 1, 8, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '3', NULL, NULL, 1),
(66, 1, 1, 8, '<p>asgdasdg</p>\r\n', '[\"<p>asdgsadg</p>\\r\\n\",\"<p>asdgasdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4', NULL, NULL, 1),
(67, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>test</p>\\r\\n\",\"<p>test</p>\\r\\n\",\"<p>test</p>\\r\\n\"]', '4', NULL, NULL, 1),
(68, 1, 1, 6, '<p>11</p>\r\n', '[\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\",\"<p>11</p>\\r\\n\"]', '3', NULL, NULL, 1),
(69, 2, 3, 24, '<p>বিশ্বগ্রামের জন্য সবচেয়ে গুরুত্বপূর্ণ কোনটি ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>তথ্য</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সফটওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>হার্ডওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কানেক্টিভিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(70, 2, 3, 24, '<p>বিশ্বগ্রাম ধারণাটি সর্বপ্রথম প্রবর্তন করেন কে ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>মার্শাল ম্যাকলুহান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>মার্ক জাকারবার্গ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বিল গেটস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টিম বার্নাস লি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(71, 2, 3, 24, '<p>বিশ্বগ্রামের মেরুদন্ড কোনটি ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>হার্ডওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সফটওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ডেটা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কানেকটিভিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(72, 2, 3, 24, '<p>কোন উপাদানটি গ্লোবাল ভিলেজ এর ক্ষেত্রে সবচেয়ে বেশি গুরুত্বপূর্ণ ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ইন্টারন্টে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সংবাদপত্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিভিশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>মোবাইল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(73, 2, 3, 24, '<p>বিশ্বগ্রাম বলতে বুঝায় ?</p>\r\n\r\n<p>i) রিয়েল টাইম সেবা বিনিময়</p>\r\n\r\n<p>ii) তথ্য ও বিনোদন সহজলভ্যতা</p>\r\n\r\n<p>iii) বিশ্বের গ্রামসমূহের আন্তঃসম্পর্ক</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i , ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(74, 2, 3, 24, '<p>বিশ্বগ্রাম ধারণার সাথে কোন বিষয়টি বিশেষভাবে সম্পৃক্ত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>গ্রামের সাথে শহরের সহজ যোগযোগ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ইন্টারনেট সুবিধার ব্যাকপ প্রসার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বিশ্বব্যাপী গ্রামকে নগরে পরিবর্তন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>শিক্ষার অবাধ সুযোগ সুবিধার বিস্তার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(75, 2, 3, 24, '<p>আউটসোর্সিং কী ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>নিদির্ষ্ট শ্রমত ঘন্টায় কাজ করা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ইন্টারনেটভিত্তিক কাজ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বিশেষ ব্রাউজিং সুবিধা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বিশ্বব্যাপী নেটওয়ার্ক ব্যবস্থা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(76, 2, 3, 24, '<p>কোনটি ক্রায়োসার্জারির সাথে সম্পর্কিত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ফাজি লজিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বিশেষ ধরনের গ্লাভস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নাইট্রোজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নেভিগেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(77, 2, 3, 24, '<p>কোনটি রোবটের ব্যবহার?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জটিল সার্জারি চিকৎসায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ব্যক্তির স্বাক্ষর শণাক্তকরণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নতুন জাতের বীজ উৎপাদনে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেনিস বলের আকৃতিতৈরিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(78, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটিতে কী ধরনের ইমেজ তৈরি হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>এক মাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>দ্বি মাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বহুমাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ত্রি &ndash;মাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(79, 2, 3, 24, '<p>কোনটি বায়োইনফরমেট্রিক্সর বৈশিষ্ট্য?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>স্বল্পডেটা সংক্ষরণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>জৈবিক ডেটার সমাহার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানো টেকনোলজির ব্যবস্থা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>প্রযুক্তি নির্ভর নিরাপত্তা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(80, 2, 3, 24, '<p>প্লেজিয়ারিজম কোন অরাধের সাথে জড়িত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>অন্যের লেখা চুরি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সফটওয়্যার পাইরেসি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কপিরাইট লংঘন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আইডেন্টিটি চুরি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(81, 2, 3, 24, '<p>বিশ্বগ্রাম প্রতিষ্ঠার প্রয়োজনীয় উপাদান হলো-</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>i. কানেকটিভিটি&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ii. ডেটা</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>iii. সক্ষমতা</p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>i ও ii</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>i ও iii</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>ii ও iii</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>i , ii ও iii</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\"]', '4', NULL, NULL, 1),
(82, 2, 3, 24, '<p>বিশ্বগ্রাম বা গ্লোবাল ভিলেজের উদ্ভাবক কে ছিলেন ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>IS Cooper</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Jack Wiliamson</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Marshal McLuhan</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>K. Eric Drexler</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(83, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটি শব্দের অর্থ কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বাস্তব কৃত্রিমতা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কৃত্রিম বাস্তবতা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বাস্তবতা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কাল্পনিক বাস্তবতা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(84, 2, 3, 24, '<p>কোনটি হার্ডওয়্যার ও সফটওয়্যারের সমন্বয়ে তৈরি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>হ্যান্ড গ্লোভস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>স্যুট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভিজার্ভ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(85, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটিতে কত মাত্রার ইমেজ ব্যবহার করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>একমাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>দ্বি-মাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ত্রি-মাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বহুমাত্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(86, 2, 3, 24, '<p>কোন কম্পিউটার বিজ্ঞানী প্রথম ভার্চুয়াল রিয়েলিটি টার্মটি ব্যবহার করেন?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জ্যারন ল্যানিয়ার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আইজ্যাক আশিমোভ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ম্যাকার্থি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টমলিনসন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(87, 2, 3, 24, '<p>এক্সপার্ট সিস্টেম কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>যন্ত্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিউরাল নেটওয়ার্ক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অ্যাপ্লিকেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(88, 2, 3, 24, '<p>HMD-এর পূর্ণরূপ কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>Hand Mountained Display</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Head Motioned Display</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Hand Motioned Display</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Head Mountained Display</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(89, 2, 3, 24, '<p>কম্পিউটারের মাধ্যমে দূর থেকে কোনো কিছু পরিচালনা করাকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>টেলিপ্রেটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিপ্রেস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিপ্রেজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিকম</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(90, 2, 3, 24, '<p>টেলিপ্রিজেন্স এর প্রয়োগ ক্ষেত্র কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আর্টিফিশিয়াল ইন্টেলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(91, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটির নতুন রূপ কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>সিমুলেটর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিপ্রজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অ্যান্টিট্রাস্ট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অগমেন্টেড রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(92, 2, 3, 24, '<p>কৃত্তিম ত্রিমাত্রিক জগতে উপস্থিত থাকার গতি সেন্সরের মাধ্যম নিয়ন্ত্রণ করাকে কি বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>টেলিকনফারেন্সস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিপ্রেজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিমেডিসিন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিকমিউনিকেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(93, 2, 3, 24, '<p>বাস্তব জগতের সাথে ভার্চুয়াল জগতের এক ধরনের সংমিশ্রণ তৈরি করে কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অগমেন্টেড রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(94, 2, 3, 24, '<p>কৃত্তিম ত্রিমাত্রিক জগতে উপস্থিত থাকার গতি সেন্সরের মাধ্যম নিয়ন্ত্রণ করাকে কি বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>টেলিকনফারেন্সস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিপ্রেজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিমেডিসিন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেলিকমিউনিকেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(95, 2, 3, 24, '<p>বাস্তব জগতের সাথে ভার্চুয়াল জগতের এক ধরনের সংমিশ্রণ তৈরি করে কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অগমেন্টেড রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(96, 2, 3, 24, '<p>কোনটির মাধ্যমে সত্যিকার যুদ্ধক্ষেত্রের আবহ তৈরি করে সৈনিকদেরকে উন্নত ও নিখুঁত প্রশিক্ষণ দেওয়া হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>আর্টিফিসিয়াল ইন্টিলিজেন্টস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিউরাল নেটওয়ার্ক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(97, 2, 3, 24, '<p>যে বিষয়গুলো বাস্তবে দেখা অসম্ভব সেই বিষয়গুলোকে দেখা যায় কীসের মাধমে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>আর্টিফিসিয়াল ইন্টিলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সিমুলেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিউরাল নেটওয়ার্ক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(98, 2, 3, 24, '<p>বাস্তব অবস্থার প্রেক্ষিতে কোন বিষয় দু&#39;টিকে আলাদা করে দেখা অবকাশ নেই?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জ্ঞান আর প্রযুক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কৃত্রিম বুদ্ধিমত্তা আর মানব বুদ্ধিমত্তা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>তথ্য প্রযুক্তি আর যোগাযোগ প্রযুক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সিমুলেশন ও মডেলিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(99, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটির বৈশিষ্ট্য কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>তথ্য আদান-প্রদান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>দ্বিমাত্রিক জগতে প্রবেশ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কাল্পনিক জগতে বিচরণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বাস্তব জগতে বিচরণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(100, 2, 3, 24, '<p>কোন প্রযুক্তিতে সিমুলেশনের মাধ্যমে জটিল অপারেশন, ডিএনএ পর্যালোচনা প্রভৃতি কাজ অত্যন্ত সূক্ষ্মভাবে সম্পন্ন করা সম্ভব হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(101, 2, 3, 24, '<p>ত্রি-মাত্রিক সিমুলেশনের বিভিন্ন ধরনের কার্টুন, অ্যাকশন মুভি, ঐতিহাসিক ছবি তৈরিতে কোন প্রযুক্তি ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(102, 2, 3, 24, '<p>কোনটির মাধ্যমে উৎপাদন ব্যবস্থায় নতুন কর্মচারীদের প্রশিক্ষণ প্রদান করা যায়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়ুটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(103, 2, 3, 24, '<p>ঝুঁকিপূর্ণ বিষয় সম্পৰ্কে প্ৰশিক্ষণ লাভ সম্ভব হয় কোনটির মাধ্যমে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>যোগাযোগ প্রযুক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(104, 2, 3, 24, '<p>কম্পিউটার সিমুলেশনের প্রয়োগ কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ইন্টারনেট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভিডিও কনফারেন্সিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(105, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটিতে কৃত্রিম পরিবেশ ব্যবস্থা সৃষ্টি করা হয় কোন পদ্ধতিতে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>একমাত্রিক সিমুলেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>দ্বিমাত্রিক সিমুলেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ত্রি-মাত্রিক সিমুলেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>চতুর্থমাত্রিক সিমুলেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(106, 2, 3, 24, '<p>পেশাজীবী চিকিৎসকদের নতুন চিকিৎসা সম্পর্কে ধারণা অর্জন বা প্রশিক্ষণের জন্য ব্যবহৃত হচ্ছে কোনটি?<br />\r\n<quillbot-extension-portal></quillbot-extension-portal></p>\r\n', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(107, 2, 3, 24, '<p>কোন তত্ত্বের ওপর ভার্চুয়াল রিয়েলিটি প্রতিষ্ঠিত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মরগান তত্ত্ব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কম্পিউটার তত্ত্ব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সিমুলেশন তত্ত্ব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল তত্ত্ব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(108, 2, 3, 24, '<p>উৎপাদিত বা প্রস্তাবিত পণ্যের গুণগতমান মূল্যায়নের জন্য ব্যবহৃত হয় কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োইনফরম্যাটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(109, 2, 3, 24, '<p>কোন ক্ষেত্রে ভার্চুয়াল রিয়েলিটি ব্যবহার করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সামাজিক যোগাযোগে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জীব বৈচিত্র্য সৃষ্টিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কৃষিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ড্রাইভিং প্রশিক্ষণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(110, 2, 3, 24, '<p>কোনটি বিপদজ্জনক ও ক্ষতিকারক দ্রব্য পরীক্ষায় ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োম্যাট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আর্টিফিশিয়াল ইন্টেলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(111, 2, 3, 24, '<p>ব্যবসায় ভার্চুয়াল রিয়েলিটির ব্যবহার- i. ক্রয় করায় ii. সম্ভাব্যতা যাচাইয়ে iii. পণ্যের মান যাচাইয়ে নিচের কোনটি সঠিক?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i ,ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(112, 2, 3, 24, '<p>কমবয়সীদের ক্ষেত্রে ভার্চুয়াল রিয়েলিটির প্রতিক্রিয়া- i. তীব্র ii. দীর্ঘস্থায়ী iii. স্বল্পস্থায়ী নিচের কোনটি সঠিক ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i , ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(113, 2, 3, 24, '<p>আমরা কোন প্রযুক্তির মাধ্যমে ঘরে বসে চাঁদে বিচরণের বাস্তব অভিজ্ঞতা অর্জন করতে পারি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(114, 2, 3, 24, '<p>কমবয়সীদের ক্ষেত্রে ভার্চুয়াল রিয়েলিটির প্রতিক্রিয়া কেমন হতে পারে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ইতিবাচক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তীব্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্ষণস্থায়ী</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্বল্প</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(115, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটি নির্ভর নির্মাণ&mdash; i. কল্পকাহিনী ii. কার্টুন iii. ঐতিহাসিক চলচ্চিত্র নিচের কোনটি সঠিক?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i , ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(116, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটির প্রভাব রয়েছে&mdash; i. সামরিক ক্ষেত্রে ii. প্রশিক্ষণে iii. শিক্ষা ক্ষেত্রে নিচের কোনটি সঠিক?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i , ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(117, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটি এর সাথে সম্পর্কিত- i. Al ii. 3d iii. সেন্সর</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i , ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(118, 2, 3, 24, '<p>ভার্চুয়াল রিয়েলিটিতে ব্যবহৃত হয় &mdash; i.বৈদ্যুতিক পাওয়ার ii. হ্যান্ড গ্লোভস ii বডি.স্যুট</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>i, ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(119, 2, 3, 24, '<p>কী ব্যবহার করে দ্বিতীয় শিল্পবিল্পব শুরু হয়?</p>\r\n\r\n<p>&nbsp;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জলীয় শক্তি</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আইসিটি<quillbot-extension-portal></quillbot-extension-portal></p>\\r\\n\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বৈদ্যুতিক শক্তি</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রযোক্তি শক্তি</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(120, 2, 3, 24, '<p>কোনটির ব্যবহারে নতুন শিল্পবিল্পবের শুরু হয়েছে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বাষ্পীয় শক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আইসিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বৈদ্যুতিক শক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তাপ শক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(121, 2, 3, 24, '<p>NLP এর পূর্ণরূপ কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Neural language Processor</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Neural language Processing</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Natural language Processor</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Natural language Processing</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(122, 2, 3, 24, '<p>মানুষের ভাষাকে কম্পিউটারের সাথে তথ্য আদান-প্রদান করার ব্যবস্থা করে কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যাচারাল ল্যাঙ্গুয়েজ প্রসেসিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিউরাল ল্যাঙ্গুয়েজ প্রসেসর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যাচারাল ল্যাঙ্গুয়েজ প্রসেসর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিউরাল ল্যাঙ্গুয়েজ প্রসেসিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(123, 2, 3, 24, '<p>মূলত কম্পিউটারকে দিয়ে কথা বলানো ও শোনানোর কৌশলকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>সাউন্ড প্রসেসিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>স্পিচ প্রসেসিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সাউন্ড সিস্টেম</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পিচ সিস্টেম</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(124, 2, 3, 24, '<p>প্রোগ্রামিংয়ের মাধ্যমে মেশিনকে বুদ্ধিমান করে তোলাকে বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আর্টিফিশিয়াল ইন্টেলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অগমেন্টেড রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(125, 2, 3, 24, '<p>যন্ত্রকে ডেটা বিশ্লেষণ করার ক্ষমতা দেওয়াকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>এন এল পি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অগমেন্টেড রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আর্টিফিশিয়াল ইন্টেলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(126, 2, 3, 24, '<p>মেশিন লার্নিং-এর অপর নাম কি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আর্টিফিশিয়াল ইন্টেলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পিচ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ডিপ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অগমেন্টেড রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(127, 2, 3, 24, '<p>ইমেজ প্রসেসিং এর অপর নাম কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>তথ্য সমন্বয়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ডিপ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভিশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পিচ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(128, 2, 3, 24, '<p>তথ্য প্রক্রিয়া করার জন্য মানুষের মস্তিষ্কের মতো কাজ করে কোন পদ্ধতি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউরাল নেটওয়ার্ক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ডিপ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউরাল সাইন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>লাইট লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(129, 2, 3, 24, '<p>নিউরাল নেটের কয়টি স্তর থাকে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>২ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৪ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৫ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(130, 2, 3, 24, '<p>কম্পিউটারের জন্য গাণিতিকভাবে তৈরি এমনকিছু কৃত্রিম নিউরণকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আইসি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সিনাপস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>পাওয়ারফুল প্রসেসের</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>পারসেপট্রন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(131, 2, 3, 24, '<p>নিউরাল নেটওয়ার্ক তৈরিতে কোন কৃত্রিম নিউরণগুলো ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভ্যাকুয়াম টিউব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>পারসেপট্রন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ট্রানজিস্টর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অ্যাকচুয়েটর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(132, 2, 3, 24, '<p>মানুষ বা অন্য কোনো প্রাণীর চিন্তা করার ক্ষমতাকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>Stane procedure</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Intelligent</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Heuristic</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Artificial Intelligent</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(133, 2, 3, 24, '<p>লুক্কায়িত স্তরে অনেকগুলো স্তর ব্যবহার করে কম্পিউটারকে জটিল ফাংশন শেখানো সম্ভব-এ প্রক্রিয়াকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ল্যাঙ্গুয়েজ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মেশিন লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>থিংক লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ডীপ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(134, 2, 3, 24, '<p>কোনটির সাহায্যে ইদানিং কম্পিউটার দ্বারা বেশ কঠিন সব সমস্যার সমাধান হচ্ছে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ডীপ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>থিংক লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মেশিন লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(135, 2, 3, 24, '<p>কোনটি আর্টিফিশিয়াল ইন্টেলিজেন্সের সবচেয়ে কাছাকাছি একটি প্রক্রিয়ার নাম?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>লাইট লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ডিপ লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউরাল সাইন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউরাল নেট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(136, 2, 3, 24, '<p>ইনপুট স্তর ও আউটপুট স্তরের মাঝের স্তরটির নাম কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সিক্রেট স্তর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সেকেন্ড স্তর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ওপেন স্তর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>লুকায়িত স্তর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(137, 2, 3, 24, '<p>আইনি সমস্যার সম্ভাব্য সঠিক সমাধানে কোন প্রযুক্তি ব্যবহার করা যায়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরম্যাটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কৃত্রিম বুদ্ধিমত্তা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(138, 2, 3, 24, '<p>স্মার্টফোনে স্বয়ংক্রিয় গেম তৈরিতে কোনটি ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কৃত্রিম বুদ্ধিমত্তা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক প্রকৌশল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরম্যাটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(139, 2, 3, 24, '<p>LISP প্রোগ্রামিং কোথায় ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরম্যাট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আর্টিফিসিয়াল ইনটেলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(140, 2, 3, 24, '<p>কৃত্রিম বুদ্ধিমত্তা প্রয়োগ করার জন্য কোন প্রোগ্রামিং ভাষা ব্যবহার করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>PASCAL</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>FORTRAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>LISP</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>BASIC</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(141, 2, 3, 24, '<p>কৃত্রিম বুদ্ধিমত্তার সবচেয়ে সফল ক্ষেত্র কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মেশিন লার্নিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ইমেজ প্রসেসিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>এন এল পি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(142, 2, 3, 24, '<p>Reinforcement Learning এর মূল ভিত্তি কী</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যন্ত্রকে দিয়ে তথ্য বিশ্লেষণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যন্ত্রকে প্রক্রিয়াকরণ শেখানো</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যন্ত্রকে বুদ্ধি দেওয়া</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যন্ত্রকে আলাদা কিছু শেখানো</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1);
INSERT INTO `questions` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_option`, `question_answer`, `filter`, `year`, `fk_author`) VALUES
(143, 2, 3, 24, '<p>আর্টিফিশিয়াল ইন্টেলিজেন্সর ব্যবহারের উদাহরণ নয় কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আবহাওয়ার ভবিষ্যৎবানী</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পেস এক্সপ্লোরেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিম্ন তাপমাত্রায় চিকিৎসা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ড্রাইভারবিহীন গাড়ি।</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(144, 2, 3, 24, '<p>কম্পিউটার মানুষের মতো আচরণ করবে তা কম্পিউটার বিজ্ঞানের কোন শাখায় গবেষণা করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আর্টিফিসিয়াল ইন্টেলিজেন্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(145, 2, 3, 24, '<p>Artificial Intelligence ব্যবহৃত হয় ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানোটেকনোলজিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্সে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরম্যাটিক্সে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োমেট্রিক্সে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(146, 2, 3, 24, '<p>মানুষের চিন্তা চেতনাকে যন্ত্রের মাধ্যমে প্রকাশ করার প্রযুক্তিটি কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কৃত্রিম বুদ্ধিমত্তা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(147, 2, 3, 24, '<p>মানুষের কর্মকাণ্ডের অনুরূপ কর্মকাণ্ড করতে পারে কে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউরাল নেট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>এন এল পি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ড্রাইভার বিহীন গাড়ি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(148, 2, 3, 24, '<p>সর্বপ্রথম কে রোবট শব্দটি ব্যবহার করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>টুরিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আইজ্যাক আশিমোভ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিউটন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কারেল ক্যাপেক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(149, 2, 3, 24, '<p>এক যুগ আগে রোবটিক্সের মূল ব্যবহার কী ছিল?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>গাড়ির স্কু লাগানোয়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আইসি তৈরিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মাইন নিস্ক্রিয়করণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>গাড়ির রঙ করায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(150, 2, 3, 24, '<p>রোবটিক্স কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট তৈরিতে ব্যবহৃত ভাষা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট বিজ্ঞান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>শিল্পে ব্যবহৃত রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটের ক্রিয়ানীতি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(151, 2, 3, 24, '<p>রোবটিক্সের গঠনে কয়টি বিশেষত্ব রয়েছে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>২ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>৩ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>৪ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>৫ টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(152, 2, 3, 24, '<p>কাজের প্রয়োজনে রোবটকে কত ডিগ্রি কোণ পর্যন্ত ঘুরানো যায়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>৯০ ডিগ্রি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>১৮০ ডিগ্রি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>২৭০ ডিগ্রি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>৩৬০ ডিগ্রি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(153, 2, 3, 24, '<p>অ্যাকচুয়েটর ব্যবহার করা হয় কোন ক্ষেত্রে-</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(154, 2, 3, 24, '<p>সর্বপ্রথম &#39;robot&#39; শব্দের পরিচয় করেন কে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আইজ্যাক অ্যাসিমভ (Isaac Asimov)</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্যারেল ক্যাপেক (Karel Capek)</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জন ম্যাককার্থি (John McCarthy)</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যোসেফ ফ্রেডরিক এঙ্গেলবার্গার (Joseph Engelberger)</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(155, 2, 3, 24, '<p>বিপদজ্জনক কাজে রোবটের ব্যবহার নয় কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জীবাণুমুক্তকরণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>খনির ভেতরের কাজে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>টানলে নির্মাণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মাইন নিস্ক্রিয়করণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(156, 2, 3, 24, '<p>মানুষের দুঃসাধ্য কাজের প্রযুক্তি কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কৃত্রিম বুদ্ধিমত্তা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(157, 2, 3, 24, '<p>রোবটের কাজ কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রোগ্রাম রচনা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রোগ্রাম নিয়ন্ত্রণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রতিকূল কাজে সাহায্য করা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রোগ্রাম উন্নয়ন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(158, 2, 3, 24, '<p>রোবটকে কী দ্বারা নিয়ন্ত্রণ করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিদ্যুৎ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ব্যাটারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সফটওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>হার্ডওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(159, 2, 3, 24, '<p>রোবট কোন কাজে ব্যবহার করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রশাসনিক সিদ্ধান্ত গ্রহণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্বাধীনভাবে জটিল সিদ্ধান্ত গ্রহণ করতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মানুষের বিকল্প হিসাবে বিপদজনক কাজে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মানুষের কর্মক্ষেত্র বৃদ্ধি করতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(160, 2, 3, 24, '<p>সার্জারি, জীবাণুমুক্তকরণ ও ওষুধ বিতরণ ইত্যাদি কাজে কোনটি ব্যবহার করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(161, 2, 3, 24, '<p>রোবটের গঠনের বিশেষত্ব নয় কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিদ্যুৎ ব্যবহার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিশেষ যান্ত্রিক গঠন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউক্লিয়ার শক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কম্পিউটার প্রোগ্রামিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(162, 2, 3, 24, '<p>রোবটকে কি দিয়ে নিয়ন্ত্রণ করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>হিউম্যানওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কম্পিউটার প্রোগ্রামিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রিমোট কন্ট্রোলিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ইলেকট্রনিক্স ডিভাইস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(163, 2, 3, 24, '<p>সমুদ্রের তলদেশে যেকোনো অনুসন্ধানী কাজ ও নদী বা সমুদ্রের নিচে টানেল নির্মাণে কোনটির সহায়তা নেওয়া হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিশেষ জাহাজ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সাবমেরিন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(164, 2, 3, 24, '<p>শিল্প কারখানায় রোবটের ব্যবহার কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সংযোজন ও পরিবহনে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মাইক্রোসার্কিট তৈরিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভারী বস্তু নড়াচড়ায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্যাকিং-এ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(165, 2, 3, 24, '<p>রোবটের সূক্ষ্মাতিসূক্ষ্ম কাজে ব্যবহার কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বোমা নিস্ক্রিয়করণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রিন্টেড সার্কিট বোর্ড তৈরিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউক্লিয়ার শক্তি কেন্দ্রে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জীবাণুমুক্তকরণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(166, 2, 3, 24, '<p>সামরিকক্ষেত্রে রোবটের ব্যবহার নয় কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মিলিটারি অপারেশনে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিস্ফোরক দ্রব্য শনাক্তকরণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিপজ্জনক আসামী ধরায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বোমা নিস্ক্রিয়করণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(167, 2, 3, 24, '<p>শিক্ষা ও বিনোদনে রোবটের ব্যবহার নয় কোনটি ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তথ্য অনুসন্ধানে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মিডিয়া আর্টে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অটিস্টিকদের শিক্ষায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>খেলনা রোবট তৈরি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(168, 2, 3, 24, '<p>কম্পিউটার নিয়ন্ত্রিত যন্ত্রসমূহ ডিজাইন ও উৎপাদন সংক্রান্ত বিজ্ঞান কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োবিজ্ঞান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(169, 2, 3, 24, '<p>পুঙ্খানুপুঙ্খ রূপে মাইক্রোসার্কিটের পরীক্ষা করতে কোনটি ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জেনেটিক প্রকৌশল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরম্যাটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(170, 2, 3, 24, '<p>বিজ্ঞান, ইঞ্জিনিয়ারিং এবং প্রযুক্তি এগুলোর সাথে সম্পর্কযুক্ত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পেস এক্সপ্লোরেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সেন্সিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োপ্রব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(171, 2, 3, 24, '<p>কোন প্রযুক্তিটি ইলেকট্রনিক্স, কম্পিউটার সাইন্স, কৃত্রিম বুদ্ধিমত্তা প্রভৃতি প্রযুক্তির সংমিশ্রণে কাজ করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রোবোটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(172, 2, 3, 24, '<p>কোন প্রযুক্তির সাহায্যে স্বয়ংক্রিয়ভাবে মানবদেহের অভ্যন্তরে সার্জারি করা যায়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(173, 2, 3, 24, '<p>শীতল তাপমাত্রায় অস্বাভাবিক রোগাক্রান্ত টিস্যু ধ্বংস করার চিকিৎসা পদ্ধতিকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োপ্রব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োজেনিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োবোলেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(174, 2, 3, 24, '<p>কাটা ছেৱাৰিহীন চিকিৎসা পদ্ধতিকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োথেরাপি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউরোসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নিউরোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(175, 2, 3, 24, '<p>ক্রায়োসার্জারিতে আক্রান্ত কোষগুলোর অবস্থান ও সীমানা নির্ধারণের জন্য কী ধরনের সফটওয়্যার ব্যবহার হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>সিম্যুলেটেড</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অ্যাপ্লিকেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>কাস্টমাইজড</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিশেষ সফটওয়্যার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(176, 2, 3, 24, '<p>Cryo কোন ধরনের শব্দ থেকে এসেছে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>গ্রিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ফারসি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ইংরেজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আরবি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(177, 2, 3, 24, '<p>ক্রায়োসার্জারিতে ক্ষতস্থান শনাক্তকরণে কোনটি ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োজেনিক এজেন্ট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োজেনিক গ্যাস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োপ্রোব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মাইক্রো-ক্যামেরাযুক্ত নল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(178, 2, 3, 24, '<p>কত সেন্টিগ্রেড তাপমাত্রা হ্রাসের ফলে নির্বাচিত টিস্যুতে অক্সিজেন সরবরাহ বন্ধ হয়ে যায়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>-৪১ থেকে &ndash; ১৫৬</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>- ৪১ থেকে -১৯৬</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>- ২১ থেকে - ১৯৬</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>-২১ থেকে -১৫৬</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(179, 2, 3, 24, '<p>ক্রায়োসার্জারিতে কুলিং এজেন্ট হিসেবে কী ব্যবহার করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তরল নাইট্রোজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তরল অক্সিজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তরল ফ্রেয়ন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ড্রাই আইস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(180, 2, 3, 24, '<p>ক্রায়োসার্জারিতে নির্দিষ্ট টিউমার শীতলীকরণে কোনটি ব্যবহৃত হয় না?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কার্বন-ডাই-অক্সাইড</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তরল অক্সিজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>আর্গন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তরল নাইট্রোজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(181, 2, 3, 24, '<p>ক্রায়োসার্জারিতে কেন তরল নাইট্রোজেন বা আর্গন গ্যাস ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অস্ত্রোপাচারের সময় রোগীকে জ্ঞানহীন করার জন্য</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নির্দিষ্ট শীতলতায় পৌছানোর জন্য</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>তাপমাত্রা স্বাভাবিক রাখার জন্য</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>গরম করার জন্য</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(182, 2, 3, 24, '<p>কোনটি ক্রায়োসার্জারির সাথে সম্পর্কিত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নেভিগেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নাইট্রোজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিশেষ ধরনের গ্লাভস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ফাজি লজিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(183, 2, 3, 24, '<p>ক্রায়োসার্জারিতে চিকিৎসা পদ্ধতিতে ব্যবহৃত হয়&mdash;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ডাই মিথানল ইথেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কার্বন মনোঅক্সাইড</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কঠিন নাইট্রোজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>আর্গন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(184, 2, 3, 24, '<p>ক্রায়োসার্জারিতে ব্যবহৃত প্রধান উপাদান &mdash;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মিথেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নাইট্রোজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>হাইড্রোজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অক্সিজেন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(185, 2, 3, 24, '<p>ক্রায়োসার্জারি চিকিৎসায় ডাক্তারদের প্রশিক্ষণে কোনটি ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরম্যাট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(186, 2, 3, 24, '<p>ক্রায়োসার্জারির নেতিবাচক দিক কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্নায়ুবিক সমস্যার সৃষ্টি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>পার্শ্বপ্রতিক্রিয়া নেই</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>শীতলীকরণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সময় কম লাগা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(187, 2, 3, 24, '<p>রোগে আক্রান্ত টিস্যুকে কোন পার্শ্বপ্রতিক্রিয়া ছাড়া ধ্বংস করা হয় কোন পদ্ধতিতে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ক্রায়োসার্জারিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রেডিওথেরাপিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অস্ত্রোপচার করে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কেমোথেরাপিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(188, 2, 3, 24, '<p>ক্রায়োপ্রোব বলতে বুঝায়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারিতে ব্যবহৃত সুতার মতো যন্ত্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারিতে ব্যবহৃত ছোট কাঠির মতো যন্ত্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারিতে ব্যবহৃত সূচের মতো যন্ত্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারিতে ব্যবহৃত মোমের মতো যন্ত্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(189, 2, 3, 24, '<p>ক্রায়োসার্জারিতে যে সুক্ষ্ম সূচের মত নল ব্যবহার করা হয় তাকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োনল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসিম</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োপাইপ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োপ্রব</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(190, 2, 3, 24, '<p>মহাকাশযানের পৃথিবীর মাধ্যাকর্ষণ শক্তি ভেদ করে বায়ুমন্ডলের বাইরে যাওয়াকে কী বলে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মহাকাশ অভিযান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মহাকাশ ভ্রমণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মহাকাশ গমন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মহাকাশচারণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(191, 2, 3, 24, '<p>পৃথিবীর চারপাশে কত কিলোমিটার বায়ুমণ্ডল?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>২০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১০০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৫০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>২০০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(192, 2, 3, 24, '<p>কোনটির মাধ্যমে মহাকাশ থেকে সর্বপ্রথম সংকেত পাওয়া সম্ভব হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সালিউড</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পুটনিক-১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভয়েজার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভোস্টক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(193, 2, 3, 24, '<p>গ্যাগারিন কোন তারিখে মহাকাশ অভিযানে যান?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৬০ সালের ১১ জুন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৬১ সালের ২ এপ্রিল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৬২ সালের ২ এপ্রিল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৬৩ সালের ১ মার্চ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(194, 2, 3, 24, '<p>কত তারিখে মানুষ প্রথম চাঁদে অবতরণ করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>২৮ মে ১৯৭৬</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>২১ জুন ১৯৭১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>২৫ মার্চ ১৯৭৫</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>২০ জুলাই ১৯৬৯</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(195, 2, 3, 24, '<p>১৯৫৭ সালের ৪ অক্টোবর সোভিয়েত ইউনিয়ন সর্বপ্রথম কোন কৃত্রিম উপগ্রহ উৎক্ষেপণ করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মির</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সালিউড</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভোস্টক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পুটনিক-১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(196, 2, 3, 24, '<p>মঙ্গল গ্রহে প্রথম কোন মহাকাশযান অবতরন করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মার্স-২</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পুটনিক-২</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মার্স-৩</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পুটনিক-১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(197, 2, 3, 24, '<p>কত সালে প্রথম মঙ্গল গ্রহে মহাকাশযান অবতরন করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৬৯</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৭১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৮১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১৯৫৭</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(198, 2, 3, 24, '<p>কোন দেশ প্রথম স্পেস শাটল উৎক্ষেপণ করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যুক্তরাজ্য</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যুক্তরাষ্ট্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রাশিয়া</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>চীন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(199, 2, 3, 24, '<p>কোন দেশ প্রথম কৃত্রিম উপগ্রহ উৎক্ষেপণ করে</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>রাশিয়া</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যুক্তরাজ্য</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যুক্তরাষ্ট্র</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জার্মানি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(200, 2, 3, 24, '<p>মহাকাশযানের গতিবেগ ঘন্টায় কত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩০০০ মাইল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩০ মাইল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩০০০০ মাইল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩০০ মাইল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(201, 2, 3, 24, '<p>শব্দের গতিবেগের তুলনায় মহাকাশযানের গতিবেগ কত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>১০ গুণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩০ গুণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৮ গুণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৪ গুণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(202, 2, 3, 24, '<p>অসংখ্য স্যাটেলাইটের সিগন্যাল ব্যবহার করে কাজ করে কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যুদ্ধবিমান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রেডিও</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জিপিএস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(203, 2, 3, 24, '<p>নিম্নের কোনটি মহাকাশ গবেষণায় অনেক বড় ভূমিকা রাখছে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রাডার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জিপিএস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(204, 2, 3, 24, '<p>স্যাটেলাইটগুলো পৃথিবী পৃষ্ঠ থেকে কত উপরে থাকে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩৪০০০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩৪০০০০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩৪০০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৩৪০ কিলোমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(205, 2, 3, 24, '<p>মহাকাশ অভিযানে আইসিটির ভূমিকা নয় কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>গতি বৃদ্ধিতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যোগাযোগ রক্ষায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>যন্ত্রপাতি পরিচালনায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>গতিপথ বের করায়</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(206, 2, 3, 24, '<p>নিজস্ব স্যাটেলাইটের মালিক হিসেবে বিশ্বে বাংলাদেশের অবস্থান কততম?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৬৩</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৫৩</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>৫৭</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>৬৭</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(207, 2, 3, 24, '<p>কোনটি জিওস্টেশনারি স্যাটেলাইট?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মার্স-৩</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্পুটনিক-১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>শাটল-৩ &middot;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বঙ্গবন্ধু-১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(208, 2, 3, 24, '<p>সুৰিধাৰম্ভিত এলাকায় বিশেষ করে দুর্গম পার্বত্য ও হাওড় অঞ্চলে ইন্টারনেট সেবা দিতে কোনটি ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>টেলিফোন সার্ভিস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>সাবমেরিন ক্যাবল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>অপটিক্যাল ক্যাবল</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(209, 2, 3, 24, '<p>আজকাল কোনটির কারণে হাতের স্পর্শ ছাড়াই কলকারখানায় পণ্যোৎপাদন চলছে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ভার্চুয়াল রিয়েলিটি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্মার্টফোন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কম্পিউটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(210, 2, 3, 24, '<p>সমুদ্রসীমার নজরদারিতে ও ডিজিটাল ম্যাপ তৈরিতে কোনটি ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রোবট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ডিজিটাল সার্ভে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ইন্টারনেট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(211, 2, 3, 24, '<p>GPS এর পূর্ণরূপ কী?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>Geospatial Positioning Satellite</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Global Positioning System</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Global Positioning Satellite</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>Global Positioning Survey</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(212, 2, 3, 24, '<p>মহাকাশ অভিযান কোন সময়ে শুরু হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ঊনবিংশ শতাব্দীর শেষে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিংশ শতাব্দীর শেষে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ঊনবিংশ শতাব্দীর শুরুতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিংশ শতাব্দীর শুরুতে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(213, 2, 3, 24, '<p>উৎপাদন ব্যবস্থায় আইসিটির প্রয়োগ নয় কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>নকশা ও উন্নয়নে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বিপনন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জীবাণুমুক্তকরণে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>পণ্যের গুনগত মান নির্ধারণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(214, 2, 3, 24, '<p>কোন প্রযুক্তির সাহায্যে মানুষকে অদ্বিতীয়ভাবে শনাক্ত করা যায়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানো টেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(215, 2, 3, 24, '<p>বায়োমেট্রিক্সের আচরণগত বৈশিষ্ট্য-</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>মুখমণ্ডল সনাক্তকরণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>DNA গঠন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>রেটিনা স্ক্যান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>কী স্ট্রোক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(216, 2, 3, 24, '<p>মোবাইল সিম ক্রয়ে কোন প্রযুক্তি গ্রাহককে সহায়তা করে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানো টেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(217, 2, 3, 24, '<p>জীব সংক্রান্ত তথ্য ব্যবস্থাপনার কাজে কম্পিউটার প্রযুক্তির প্রয়োগ হলো--</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(218, 2, 3, 24, '<p>কোনটি বায়োইনফরমেটিক্সের বৈশিষ্ট্য?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>প্রযুক্তি নির্ভর নিরাপত্তা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>স্বপ্ন ডেটা সংরক্ষণ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানোটেকনোলজির ব্যবহার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জৈবিক ডেটার সমাহার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(219, 2, 3, 24, '<p>বিভিন্ন জটিল রোগের কারণ আবিষ্কারে কোন প্রযুক্তি কাজ করছে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>&nbsp;</p>\\r\\n\\r\\n<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ক্রায়োসার্জারি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(220, 2, 3, 24, '<p>এক ন্যানোমিটার সমান কত মিটার?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p><span class=\\\"math-tex\\\">\\\\(\\r\\n10^{-12}\\\\)</span><br />\\r\\n<quillbot-extension-portal></quillbot-extension-portal></p>\\r\\n\",\"<p><span class=\\\"math-tex\\\">\\\\(10^{-9}\\\\)</span></p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p><span class=\\\"math-tex\\\">\\\\(10^{-6}\\\\)</span></p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p><span class=\\\"math-tex\\\">\\\\(10^{-11}\\\\)</span></p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, NULL, 1),
(221, 2, 3, 24, '<p>আনবিক পর্যায়ে পদার্থকে পরিবর্তন ও রিয়ন্ত্রন করার বিদ্যাকে বলা হয়-<quillbot-extension-portal></quillbot-extension-portal></p>\r\n', '[\"<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>নিউক্লিয়ার ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োইনফরমেটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(222, 2, 3, 24, '<p>কাকে ন্যানো প্রযুক্তির জনক বলা হয় ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জোহান্স মেন্ডেস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>লুই পাস্তর</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রিচার্ড ফাইনম্যান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>মার্শাল ম্যাকলুহান</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(223, 2, 3, 24, '<p>কোন প্রযুক্তির মাধ্যমে আমাদের নিত্য ব্যবহার্য পন্য ছোট হয়ে থাকে ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ট্যানজিস্টার প্রযুক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়ো প্রযুক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানো প্রযুক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>লিকুইড ক্রিস্টাল প্রযুক্তি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, NULL, 1),
(224, 2, 3, 24, '<p>ন্যানো অবজেক্ট তৈরি করা হয় কোথা থেকে ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>মলিকুলার কম্পোনেন্ট থেকে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>লার্জার এনটিটি থেকে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সাইনিং এর মাধ্যমে</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>প্রোগ্রামিং দ্বারা</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, NULL, 1),
(225, 2, 3, 24, '<p>খাদ্যজাত দ্রব্যের মান সঠিক রাখার জন্য প্যাকেটের ভেতর প্রলেপ করার প্রযুক্তি কি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>রোবটিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বায়োমেট্রিক্স</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানোটেকনোলজি</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, NULL, 1),
(226, 2, 3, 24, '<p>টপ ডাউন পদ্ধতিতে কোন জিনিসকে নির্দিষ্ট আকার দেওয়া হয় কোন প্রযুক্তি ব্যবহার করে?</p>\r\n\r\n<p>&nbsp;</p>\r\n', '[\"<p>বায়োমেট্রিক্স</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>বায়োইনফরমেটিক্স</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>জেনেটিক ইঞ্জিনিয়ারিং</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\",\"<p>ন্যানোটেকনোলজি</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\"]', '4', '5', '2017', 1);
INSERT INTO `questions` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_option`, `question_answer`, `filter`, `year`, `fk_author`) VALUES
(227, 2, 3, 25, '<p>IEEE 802.11 প্রযুক্তির সাহায্যে কোন নেটওয়ার্কটি তৈরি করা যাবে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>PAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>CAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>LAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>WAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, '', 1),
(228, 2, 3, 25, '<p>নিচের কোনটি WI-FI স্ট্যান্ডার্ড?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>802.10</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.01</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.16</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.11</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, '', 1),
(229, 2, 3, 25, '<p>টেলিভিশনের রিমোট কন্ট্রোলে ব্যবহৃত হয়&mdash;</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>Bluetooth</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Radio wave</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Microwave</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>Infrared</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, '', 1),
(230, 2, 3, 25, '<p>Wi-Max কোন ধরনের নেটওয়ার্কে ব্যবহৃত হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>WAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>LAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>MAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>PAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, '', 1),
(231, 2, 3, 25, '<p>WiMax এর স্ট্যান্ডার্ড কত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>802.15 GHz</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.11a GHz</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.16 GHz</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.11 GHz</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, '', 1),
(232, 2, 3, 25, '<p>ব্লুটুথের IEEE Standard কত?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>801.15.4</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.15</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>802.20</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>801.15</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, '', 1),
(233, 2, 3, 25, '<p>ব্লুটুথ এর মাধ্যমে কোন নেটওয়ার্ক তৈরি করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>LAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>PAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>MAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>WAN</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '2', NULL, '', 1),
(234, 2, 3, 25, '<p>ডেটা কমিউনিকেশন মাধ্যম হচ্ছে- i. টুইস্টেড পেয়ার ক্যাবল ii. রেডিও ওয়েভ iii. মডেম</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>i ও ii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>i, ii ও iii</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', NULL, '', 1),
(235, 2, 3, 25, '<p>কোনটি বায়ুমণ্ডলের আয়নোস্ফিয়ার ভেদ করে যেতে আসতে পারে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ফাইবার অপটিক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রেডিও ওয়েভ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>মাইক্রোওয়েভ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>লেজার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', NULL, '', 1),
(236, 2, 3, 25, '<p>যোগাযোগের জন্য যে সব জায়গায় ক্যাবল ব্যবহারে অনুপযোগী সে সব স্থানে কী স্থাপন করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>মাল্টিমোড ফাইবার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সাবমেরিন স্টেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অপটিক্যাল ফাইবার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেরিস্ট্রিয়াল ট্রান্সমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, '', 1),
(237, 2, 3, 25, '<p>যোগাযোগের জন্য যে সব জায়গায় ক্যাবল ব্যবহারে অনুপযোগী সে সব স্থানে কী স্থাপন করা হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>মাল্টিমোড ফাইবার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>সাবমেরিন স্টেশন</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>অপটিক্যাল ফাইবার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>টেরিস্ট্রিয়াল ট্রান্সমিটার</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, '', 1),
(238, 2, 3, 25, '<p>বাংলাদেশের প্রথম জিওস্টেশনারি স্যাটেলাইট কোনটি?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>ন্যানো স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ন্যানো স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বঙ্গবন্ধু স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>বঙ্গবন্ধু -১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', NULL, '', 1),
(239, 2, 3, 25, '<p>পৃথিবীর অক্ষে ঘূর্ণনের সমান গতিতে কোনটি পরিভ্রমণ করতে পারে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>জিওস্টেশনারি স্যাটেলাইট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>স্পুটনিক-১</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ভস্টক</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রকেট</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', '\"13\"', '2010', 1),
(240, 2, 3, 25, '<p>GEO স্যাটেলাইট ভূমি থেকে কত উচ্চতায় নির্দিষ্ট কক্ষ পথে রাখতে হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>12000 km</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>22000 km</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>&nbsp;</p>\\r\\n\\r\\n<p>27000 km</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>36000 km</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '4', '\"13\"', '2011', 1),
(241, 2, 3, 25, '<p>মাইক্রোওয়েভ প্রযুক্তির অসুবিধা দূর করতে কোন প্রযুক্তি আবশ্যক?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>কৃত্রিম উপগ্রহ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>জিপিএস</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>রেডিও ওয়েভ</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>ইনফ্রারেড</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', '\"12\"', '2010', 1),
(242, 2, 3, 25, '<p>কৃত্রিম উপগ্রহের মাধ্যমে মাইক্রোওয়েডে সিগন্যাল আদান-প্রদান শুরু হয় কত সালের দিকে?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>১৯২০</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>১৯৪০</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>১৯৫০</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>১৯৩০</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', '\"12\"', '2010', 1),
(243, 2, 3, 25, '<p>টেরিস্ট্রিয়াল সংযোগে কত মাইল পরপর রিপিটার/ মাল্টি সেকশন রীলে স্টেশন বসাতে হয়?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>১০</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>২০</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>80</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>৩০</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '3', '\"13\"', '2010', 1),
(244, 2, 3, 25, '<p>ABCD ?</p>\r\n<quillbot-extension-portal></quillbot-extension-portal>', '[\"<p>A</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>B</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>C</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\",\"<p>D</p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n<quillbot-extension-portal></quillbot-extension-portal>\"]', '1', '5', '2000', 1),
(245, 1, 1, 6, '<p>test ques</p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>adsg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '2', '5', '', 1),
(246, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\"]', '3', '5', '', 1),
(247, 1, 1, 6, '<p>asdg</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '3', '9,11', '', 1),
(248, 1, 1, 6, '<p>asdg rwar</p>\r\n', '[\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\",\"<p>sadg</p>\\r\\n\"]', '3', '6,9,11', '2020', 1),
(249, 2, 3, 25, '<p>ABCDafdffgh</p>\r\n', '[\"<p>a</p>\\r\\n\",\"<p>a</p>\\r\\n\",\"<p>a</p>\\r\\n\",\"<p>a</p>\\r\\n\"]', '4', '4', '2000', 1),
(250, 2, 3, 25, '<p>adgs</p>\r\n', '[\"<p>A</p>\\r\\n\",\"<p>S</p>\\r\\n\",\"<p>D</p>\\r\\n\",\"<p>F</p>\\r\\n\"]', '2', '4', '2000', 1),
(251, 1, 1, 6, '<p>test</p>\r\n', '[\"<p>test</p>\\r\\n\",\"<p>test</p>\\r\\n\",\"<p>adsg</p>\\r\\n\",\"<p>asdg</p>\\r\\n\"]', '4', '', '', 1);

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
  `question_answer` text NOT NULL,
  `filter` varchar(300) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `fk_author` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `q_others`
--

INSERT INTO `q_others` (`id`, `class_id`, `subject_id`, `chapter_id`, `question_text`, `question_answer`, `filter`, `year`, `fk_author`) VALUES
(1, 1, 1, 6, '<p><img alt=\"\" src=\"http://localhost:3000/uploads/questions/goalm.jpg\" style=\"height:31px; width:122px\" />Test of update</p>\r\n', '<p>test</p>\r\n', NULL, NULL, 1),
(2, 1, 1, 6, '<p>gdasfg</p>\r\n', '<p>asdg</p>\r\n', NULL, NULL, 1),
(3, 1, 1, 6, '<p>gdasfg</p>\r\n', '<p>asdg</p>\r\n', NULL, NULL, 1),
(4, 1, 1, 6, '<p>sdfh</p>\r\n', '<p>sdfh</p>\r\n', NULL, NULL, 1),
(5, 1, 1, 6, '<p>dfgh</p>\r\n', '<p>dfgh</p>\r\n', NULL, NULL, 1),
(6, 1, 1, 6, '<p>sdfh</p>\r\n', '<p>sdfh</p>\r\n', NULL, NULL, 1),
(7, 1, 1, 6, '<p>sdh</p>\r\n', '<p>sdhf</p>\r\n', NULL, NULL, 1),
(8, 1, 1, 6, '<p>dsfh</p>\r\n', '<p>sdfh</p>\r\n', NULL, NULL, 1),
(9, 1, 1, 6, '<p>asg</p>\r\n', '<p>sadg</p>\r\n', NULL, NULL, 1),
(10, 1, 1, 6, '<p>dsfhs</p>\r\n', '<p>sdfh</p>\r\n', NULL, NULL, 1),
(11, 1, 1, 6, '<p>New</p>\r\n', '<p>sadg</p>\r\n', NULL, NULL, 1),
(12, 1, 1, 6, '<p>What is the value of&nbsp;<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\r\n', '<p>The right answer is 1</p>\r\n', NULL, NULL, 1),
(13, 1, 1, 6, '<p>asdg</p>\r\n', '<p>asdg</p>\r\n', NULL, NULL, 1),
(14, 1, 1, 6, '<p>test</p>\r\n', '<p>test</p>\r\n', NULL, NULL, 1),
(15, 1, 1, 6, '<p>this is test ques</p>\r\n', '<p>test</p>\r\n', '[\"6\",\"2\"]', '', 1);

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
(38, 'Test', 1, '0', 'creative', 33, 33, '1,2,3', ',test,', 1, '2023-04-11 13:06:44', '2023-04-11 13:06:48'),
(39, 'Habibur Rahman', 2, '3', 'mcq', 10, 10, NULL, NULL, 1, '2023-05-09 16:52:21', '2023-05-09 16:52:21'),
(40, 'তথ্য ও যোগাযোগ প্রযুক্তি: বিশ্ব ও বাংলাদেশ প্রেক্ষিত', 2, '3', 'mcq', 15, 15, '69,71,73,75,78,79,81,83,82,87,88,92,93,77,76,80', '4,4,4,2,4,2,4,2,3,4,4,2,3,1,3,1', 1, '2023-05-10 03:49:33', '2023-05-10 03:50:09'),
(41, 'test', 2, '3', 'mcq', 33, 33, '81', '4', 1, '2023-05-10 08:59:23', '2023-05-10 08:59:37'),
(42, '123', 2, '3', 'mcq', 10, 10, NULL, NULL, 1, '2023-05-12 08:59:28', '2023-05-12 08:59:28'),
(43, 'ICT', 2, '3', 'creative', 10, 10, NULL, NULL, 1, '2023-05-14 08:05:07', '2023-05-14 08:05:07'),
(44, 'Test Filter', 2, '3', 'creative', 50, 5, NULL, NULL, 1, '2023-05-14 08:09:34', '2023-05-14 08:09:34'),
(45, 'test01', 2, '3', 'creative', 50, 5, '17,22,23', '<p>,<p>জামানের ক্ষেত্রে তথ্য প্রযুক্তির ভূমিকা মূল্যায়ন কর।</p><p>,<p>উদ্দীপকের কিছু ব্যক্তির ব্যর্থ চেষ্টার নৈতিকতার দিকগুলো ব্যাখ্যা কর।</p><p>', 1, '2023-05-14 08:16:19', '2023-05-14 08:16:43'),
(46, 'test', 2, '3', 'mcq', 11, 22, '69', '4', 1, '2023-05-14 08:22:03', '2023-05-14 08:23:28'),
(47, 'test56', 2, '3', 'creative', 50, 5, NULL, NULL, 1, '2023-05-14 08:30:40', '2023-05-14 08:30:40'),
(48, 'Test 111', 2, '3', 'mcq', 15, 15, '227,228,229,230,231,232,234,233,235,236,237,238,239,240,241,242,243', '3,4,4,3,3,2,1,2,3,4,4,4,1,4,1,3,3', 1, '2023-05-14 09:25:20', '2023-05-14 09:26:32'),
(49, '123', 2, '3', 'mcq', 15, 15, '227,228,229,230,231,232,233,234,235,236,237,238,239,240,241', '3,4,4,3,3,2,2,1,3,4,4,4,1,4,1', 1, '2023-05-14 09:33:21', '2023-05-14 09:34:45'),
(50, 'এইচএসসি আইসিটি', 2, '3', 'mcq', 15, 15, '227,228,229,230,231,232,69,70,71,72,73,74,75,76,77', '3,4,4,3,3,2,4,4,4,1,4,3,2,3,1', 1, '2023-05-14 10:53:43', '2023-05-14 10:54:05'),
(51, 'প্রথম অধ্যায়ঃ তথ্য ও যোগাযোগ প্রযুক্তি: বিশ্ব ও বাংলাদেশ প্রেক্ষিত', 2, '3', 'mcq', 25, 25, '73,74,75,76,81,80,79,83,92,106,105,104,109,110,113,119,120,123,127,129,137,138,139,140,141', '4,3,2,3,4,1,2,2,2,1,3,1,4,4,4,3,2,2,3,2,3,2,4,3,1', 1, '2023-05-14 10:55:33', '2023-05-14 10:56:55'),
(52, 'এইচএসসি আইসিটি', 2, '3', 'creative', 50, 5, NULL, NULL, 1, '2023-05-14 11:00:21', '2023-05-14 11:00:21'),
(53, 'এইচএসসি আইসিটি', 2, '3', 'mcq', 5, 5, NULL, NULL, 1, '2023-05-14 18:04:30', '2023-05-14 18:04:30'),
(54, 'filter test', 1, '19', 'mcq', 22, 22, NULL, NULL, 1, '2023-05-15 12:30:47', '2023-05-15 12:30:47'),
(55, 'এইচএসসি আইসিটি', 2, '3', 'mcq', 10, 10, NULL, NULL, 1, '2023-05-15 12:36:44', '2023-05-15 12:36:44'),
(56, 'test', 1, '0', 'mcq', 33, 33, NULL, NULL, 1, '2023-05-15 13:14:10', '2023-05-15 13:14:10'),
(57, 'Abc', 2, '3', 'mcq', 5, 5, NULL, NULL, 1, '2023-05-15 15:35:45', '2023-05-15 15:35:45'),
(58, 'এইচএসসি আইসিটি', 2, '3', 'mcq', 10, 10, NULL, NULL, 1, '2023-05-15 17:24:48', '2023-05-15 17:24:48'),
(59, 'এইচএসসি আইসিটি', 2, '3', 'creative', 20, 2, NULL, NULL, 1, '2023-05-16 01:02:09', '2023-05-16 01:02:09');

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
(1, 'admin', 'Questions Kit (Auto Question Generator)', 'Dhaka, Bangladesh', 'habibbzm2018@gmail.com', '01712128532', 'Questions Kit (Auto Question Generator) is the best & first software for Auto Question Generator in world.', 'Questions Kit', 'A+', 'Questions Kit', '01712128532', 'habibbzm2018@gmail.com', '$2b$11$FK.B/vx5VXDWuM2Iwm7bbewqiLTzTqDO9p8KSbfeWq6qghDFs1Q4S', '', 1, 3, '2025-01-03', '2023-03-15 14:19:28.052897'),
(3, 'admin', 'Bogura Zilla School', 'Bogura Sadar', 'bzs@gmail.com', '017227339435', 'Test info', 'bogura admin', 'b+', 'Sonatola', '017272278355', 'boguraadmin@gmail.com', '$2b$11$GXOU60o9gOTiEe0pkjAR9.vKrcRzvagio0ZmYz1tPDHpt4CwiaM4G', 'soikat.jpg', 0, NULL, NULL, '2023-03-29 23:59:36.731147'),
(4, '', 'SHS', 'admin', 'scc@gmaol.com', 'ash', 'asdh', 'asdh', 'asdh', 'asdh', 'asdh', 'asdh@sdhf', '$2b$11$s3X0LFJuHoF8YdFL664IGO/NR9ffrut87W0tj80kSpBMcSdzWVVjK', '', 1, 1, NULL, '2023-04-06 19:41:50.474375'),
(5, '', 'dsfh', 'admin', 'sdfh@sdh', 'sdfh', 'sdfh', 'sdfh', '', '', 'sdfh', 'sdfh@sdhj', '$2b$11$o/9qf0AzFODTN59jPYh9GeAWLJ5FicSDHmBqan8lxpnkKi9tqUAY6', '', 0, 0, NULL, '2023-04-06 19:44:00.536125'),
(6, '', 'Test From user', 'Test From user', 'user@gmail.com', 'asdg', '', 'asdg', '', '', 'asdg', 'test@gmail.com', '$2b$11$wOL8Xgs43iR8yvTxnoOW8Oa/bG798O58bY6WJ0IBcuxjJSAxrqfQi', '', 1, 1, '2023-04-19', '2023-04-06 19:59:25.376624'),
(7, '', '4444', 'admin', '', 'asdg', '', 'asdg', '', '', 'asgd', 'sadg@sdfhg', '$2b$11$tGoN4P5WSlZqK/35R5WRaO1VIs6mC//y1fHuR3jqz/6Atc/Ua8TKi', '', 1, 2, NULL, '2023-04-06 20:05:13.610995'),
(8, 'admin', 'Edubeach ICT Heaven', 'Sadarpur, Faridpur-7820', 'habibbzm2018@gmail.com', '01712128532', 'info@edubeach.com', 'Habibur Rahman', 'A+', 'Sadarpur, Faridpur-7820', '01913865284', 'admin@edubeach.com', '$2b$11$fdvkGBukhwwd9r9mdZyLR.OwHN1gavvpKKj3c/g3hy8XgDgpUnMXq', '', 1, 3, '2024-06-10', '2023-04-19 04:25:51.524643');

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
('1QmlX8ZGmuQme1XWQ8Mc3F4mzoppWjag', 1684055688, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('1YDz2MfgWKnxi87B3hvyrhsFxntfZVau', 1684257743, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTcxMzA4LCJleHAiOjE2ODQyNTc3MDh9.zQRsdJowxliJGrt_EjFjFg8uVJvu4J9DZ4zLvNv34TI\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('1lXtL5OQXACiGBwxBGObXa5OD66-bBMh', 1684046782, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('1uQGFTsZYfGjhQAvPVeS0US4CApStwyY', 1684240511, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('1zXCDEHKG4ceNgKe3Tk0LZgQctAjbUjX', 1684081867, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('24rWO3boU0tm7l9EUpj_ebx7EvNCN4Hd', 1684297251, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('266LrNpEaHKHmaVr_UW14kAGyoCkDNMT', 1684210925, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('2Ib6ka-LdfA9MQNQJxOPSRFSAwRHGu54', 1684261422, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTc0OTcwLCJleHAiOjE2ODQyNjEzNzB9.r6F5fbNeI2DCoPQCTUBhlL3zmD-EX5Vroy0po4iLEgU\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('2ewnYNTaCn5WMXxgb56NAWHsEMzEWrGh', 1684138934, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJzaGFtaW0iLCJ0YWJsZSI6InRlYWNoZXJzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjg0MDUyMTQ0LCJleHAiOjE2ODQxMzg1NDR9.ckvBqt8Cviu_0lbeKC4prf-BTCloUH5D45FvochkLVk\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('2ySpNsjQNRb5_VQQOqe4m5VLYsDEMOtl', 1683989293, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3Su_Vv8nm8qzMK3CF1ewitvleXbMgucR', 1684028326, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5THgSd2VvFyZFIdF1C4AUl2BRE7aLn0k', 1684285298, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5ls-2RBbTP0wog8EirUwp9Kv4HgsPAkI', 1684312191, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5tURnjKkbrsqFrdsA53E7IhGepbbQdrT', 1684260107, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5uVfOUgfGcnIZs-7ZRMzQBEcWLdRSLzN', 1684161112, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('67GXIAwFgOtxb1h7VfGtVgZy-JMCD1_S', 1684298687, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('6KyQMKU7fQsZjsygnMY_ytneJwCuX9P3', 1683944640, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('7ipqvADrpwqrxCyljqj6LWIP-_CQo7q_', 1684173964, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJoYWJpYmJ6bTIwMThAZ21haWwuY29tIiwidGFibGUiOiJzY2hvb2xzIiwidXNlclR5cGUiOiJhZG1pbiIsImlhdCI6MTY4NDA4NzU1NywiZXhwIjoxNjg0MTczOTU3fQ.tjn0VUoXesAjdZggZ2PObQOk_gw3L9tgN6k5XSlwfD4\",\"user\":{\"id\":1,\"userType\":\"admin\",\"school_name\":\"Questions Kit (Auto Question Generator)\",\"school_address\":\"Dhaka, Bangladesh\",\"school_email\":\"habibbzm2018@gmail.com\",\"school_phone\":\"01712128532\",\"school_info\":\"Questions Kit (Auto Question Generator) is the best & first software for Auto Question Generator in world.\",\"admin_name\":\"Questions Kit\",\"admin_blood_group\":\"A+\",\"admin_address\":\"Questions Kit\",\"admin_phone\":\"01712128532\",\"admin_email\":\"habibbzm2018@gmail.com\",\"admin_password\":\"$2b$11$FK.B/vx5VXDWuM2Iwm7bbewqiLTzTqDO9p8KSbfeWq6qghDFs1Q4S\",\"admin_avater\":\"\",\"status\":1,\"package\":3,\"validity\":\"2025-01-02T18:00:00.000Z\",\"createdAt\":\"2023-03-15T14:19:28.052Z\"}}'),
('7jtCbKmfbknOsqpLTFblVIAqfYzS9H9F', 1684292119, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('8WNaNkDd9t49oT1MsSsJuRgA7UEWt5_v', 1684137752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('8yH4NXHsdY2X8nbc0WZVTmoM1SR-OoD_', 1684081854, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BUsYC_uqxEKJkwAXz1JUtpftwxnKolUG', 1684250298, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('CT40ohuWahg306_SnuIaMADt-GYq9rYo', 1684262156, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('DIAW956wreSMY3ehgs2Pgm0h3sboeDr2', 1684139054, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('EOJ1jy9iZTMTw0o2EIvLmUhjKINc1sm7', 1683921725, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('EhoFnx9vyDspRb9zJO-7YLgkl1v59HO7', 1684147283, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJzaGFtaW0iLCJ0YWJsZSI6InRlYWNoZXJzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjg0MDYwNzM4LCJleHAiOjE2ODQxNDcxMzh9.34t3tcvxHUb2rUf1N7UFv5Fcx52vZ-bdOdUj8IacqW8\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('FDbiOV8TosvHZlCc_K_Dh4TSqvm3hGI9', 1684171093, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('FUcQkJ4-ynt1V3mOsX4SHvwuqMAbSFAg', 1684209501, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('FwsZTsw8j3BXIOP42-NBuG84jpNy4dVr', 1684203112, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('G0l9V3GNUfq37y-MbQoHivzjRausyBg0', 1684040402, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('GQEdh1_uraCQxI4BDyRwEduwwkVFpYdD', 1684063895, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjgzOTcyNjg0LCJleHAiOjE2ODQwNTkwODR9.YEHOUq7GjMZ-hOoDpZ3DihCsTYYhf3HyjcrXBlM452s\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('GkAQp4YuBkWy5XrDIx2_5O9KtlMo-1u2', 1684069363, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('GmSKcJcG41G8bkeW5D56W3qWXfPNaecy', 1683963913, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('HMD4Tu4-aQsaf7ADnBH9ZfhXFh6E1BwM', 1683946661, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('HfQFkCFC6zG949cW1MYDuc8fmoZ2nn_N', 1684168732, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('I7b3oVggX_BTKIGRBEfTCJO0y-CRIbVd', 1684047799, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ISCl276l5JSrwBqV_bVOjQktZWSOlfNa', 1684281028, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('JQukJK7bEYcPONz_2FbUndY5mVhJAgQW', 1684276147, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('K7P9CYNUEfUwykLzDkQac_Swi5aCCz4F', 1684175648, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('KQBYBLFlAamyGOnVKz5KjmtqGiLku-jK', 1683906005, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('KSvS3JVRbVv1c1BWI3NuPDnVOy8pWg9x', 1684305937, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ku5e-zfRAPK88DYFGFC3XHr7neacggph', 1684030354, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('LAg8yHAOWY0RNrsiXNy169qN80ULQrNO', 1684295325, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Lt-HSbo6ZxoWKnGVcD8O9MYOt7Gg8oPo', 1684257533, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTYzOTMwLCJleHAiOjE2ODQyNTAzMzB9.FHF6P8d4zYmqUrSqzmxh6q01nWtrKW7Zfqq5BExZXvM\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('MwT3xw2FLfN6f_8xtEtzhGKwMqZ48gpE', 1683998218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('MwW114HxN9tn3WOsklI5nxNBQLsvNTUi', 1683998218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Nb46NMkSgtT2NIgTYBmxTwajp2imi8Qy', 1684147489, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJzaGFtaW0iLCJ0YWJsZSI6InRlYWNoZXJzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjg0MDYwOTk3LCJleHAiOjE2ODQxNDczOTd9.Bw2rlLRIsTTGbsptSnI8l-v4dagx7Fu9DwoDlE49Me8\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('NkQeU5S8vHUdcxKNDy5CbiHlGApARDZ2', 1684040203, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('NuLNyDzLGP0DwVY8Ouqr8iXGx0udPv9v', 1683962656, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('NuhMXzHSy5Qry6ZqKZUXwkS1UYIPOTt8', 1684028326, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('OWI5BieJMzwv_-PovyQFttpDDhrl0tvP', 1684190506, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('OYpIbJORCX0ZzFhDufndoGI9zePec1RT', 1684243050, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTU2NjE3LCJleHAiOjE2ODQyNDMwMTd9.Mdjh3q6kousOJRx5kqy5Xn-Qu5gE2iBUphlT-esgCf0\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('OZIsHo_75bzptnxobmcx_p5jL9ZHMwFo', 1684257960, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('PVsijSMpPBNYCGqhwy8fpZJL4-yqFOEy', 1684184854, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('QEdU52heBAcLBbgLJv_d4u2vcXtA-i_3', 1683921725, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('QSRQkwVntaOAutYpLRhkd9Ezye6KMmOn', 1683988828, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('SUO75hPkdywJm4z50NtZEeSWSN69Sv8S', 1684050928, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ScjaP80WjCIBeI6BQPR8yAuiXpAlxxfi', 1684137774, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('T-QeHt77xJBFwnyA4SPUYgwr4sRtqggh', 1684018114, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"sessionID\":\"9229d123-f15b-4842-961c-3902ad914f2c\",\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInRhYmxlIjoidXNlcnMiLCJ1c2VyVHlwZSI6InN1cGVyYWRtaW4iLCJpYXQiOjE2ODM5MzE1NzQsImV4cCI6MTY4NDAxNzk3NH0.nEkHecYQAECX7nAr6r98qBsC5ZKh0x3iRI9SQTHNY44\",\"user\":{\"id\":1,\"userType\":\"superadmin\",\"username\":\"admin\",\"email\":\"shamim@gmail.com\",\"password\":\"$2b$11$Zh9RmdCkzMQqyaSF12.sfOstJMnr7ANFiYC5/J/R5XgiYzPouim6y\",\"profilePics\":\"/uploads/avater.jpg\",\"createdAt\":\"2023-03-15T14:22:06.000Z\"}}'),
('TKE2mtTfWhJJVEGCxWktXPhO8jvSAKbW', 1683998218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('U7pDbOI2e1S2LeecPLCRrWA8tGkITO3p', 1683909067, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('VFsz16WW-Tm5qbfDmu9xKoynhRNZVcc6', 1683924629, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('XFyqrZzSRbNHcQToqz3lFHLUQhU5M5EM', 1684310753, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('XwXq1es0sfrU2cdnWtj4zhHwEScKa7JW', 1683991090, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ZtTOn0dLbdn9y7lsz7RWflivc2RqIUBx', 1683913093, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_CKq057K5jJJdLzTff-c8wNE-FTnVdZr', 1684264058, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTc3NTE4LCJleHAiOjE2ODQyNjM5MTh9.h2BH0lYF01TMqP9IPD7I9J4E6lL-CUnx4nHW3xYW_Kg\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('_H3cC2cUqX4SRnuGnkYTALSyeMyxf1RM', 1683975309, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_MXGAEZudZFnGgk6fRGGdGQqS5eExBh2', 1684259032, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTcxODIxLCJleHAiOjE2ODQyNTgyMjF9.cDCLsDCcbYssLkp0AFLWk1baMax8FMXcvrKykKAllB0\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('_hk2u08JVCMU_ZUqHK2cVOv0-m4O9ic0', 1684262155, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('aV5JJloiOMLdFIrMfVlnDX6N90mwLER6', 1683950754, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bHv1VhWGVRIC_aduLWlfTpFU-a2FM3xO', 1684139168, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bTtx6iZc-32olHsEShJY-D8VpcESra-e', 1684257809, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('c1q5sqm1aRk-sgiQKRf2xZtofZgwkTwT', 1684213819, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('cfj1ufRjO5wUl4smu_o-cwrnuNJZ0Ai0', 1684028326, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('cgffQ8B4GKrgghqSMXxfuqakna8bundq', 1684257668, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTcxMjM3LCJleHAiOjE2ODQyNTc2Mzd9.OmVSh4xI5ZVakTdHtCakt5AlmMqzPOc5xF-LXB6yJM8\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('d-hIbqxzAZbwbYr86FimIqzIK6smfkF7', 1684002977, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dMvcJo-tL-4feKlmVa6cR7AueKlq-oOb', 1684300282, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dUgXa1a8IoBZ0cVdCWl14KdPd5n15TO9', 1684003041, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dZCdua_ma6UxUiqYcRCa0mhP-0bgv4Zm', 1684302321, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('eguU4ojbQ145x2uBd73Q56bPF6dzNwtY', 1684137753, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('elh9GphUGost4QAlwWnzZnYQiK5HBqvn', 1684250269, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTU0MzQ4LCJleHAiOjE2ODQyNDA3NDh9.IvOY8bEaMteEm5qQ6Oy4tL-6skdwDCOGg4xiiC1Lahg\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('fHKZqCSc7OI27Rnpp5AorzYAcSiCiLxZ', 1684066759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ftgJyc0YGvIXZsUGxyu-YMhVSl1TCd75', 1683911805, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ghkbTBY2qVdrLzyWKx8Ov3UubYp8oImp', 1684046784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('glwjkeTyoRfMQcJBPjZxwfZUqDRtTRCR', 1684259071, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTcyNjQzLCJleHAiOjE2ODQyNTkwNDN9.Lkp8XDfYiw7Y82IIeEbzxYIDGiYxaSJLLEFDOagiq2I\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('gwWyCJ5WIgUJzsUr1ZFrE7o1ihIEJZ7A', 1684305940, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('gz2xYM90Nc-pPie0a2q2fM9FGTswUCaH', 1683993839, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('h5Xj_1_qNKVeTX6j1L2drj8zCqNs0-AP', 1683898728, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('iCFPPBm9BPjR2Iqd_UX5A6CETqujILjc', 1684223753, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('iKGJFpr7T7A_wlTvhuSki73xTrDrvx0t', 1683961557, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ifF04gh13M_dr-kyR0_VVYMJ_RGQo7c1', 1684250299, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('j4JDWd69LgSKFgBq3q4Rq8hOhG23ZPYq', 1684139572, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJzaGFtaW0iLCJ0YWJsZSI6InRlYWNoZXJzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjg0MDUyMzMwLCJleHAiOjE2ODQxMzg3MzB9.C_H4Rn4F614hRPyjlkr0SnFdVt5rRXVpM_2auKAzejM\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('ke3GcD-phKKYHMGw5V-_MXxgNM5IcZ8C', 1683917528, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kj3OAhUag2Ev1PLeJv-Mk5oqbKfN4FZ5', 1683953515, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lSHGcgNe6hH10fYTJmrSqbYE-UHJAhv0', 1684293329, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('nWFtiODi8FRL2EjHxj4t92jRgSvKkzhA', 1684179493, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('nyZut5VGOCpEA4jNag8112XS8hSBCbEC', 1684258097, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTcxNTkxLCJleHAiOjE2ODQyNTc5OTF9.kxm6HHwQa5LAKJRLTqP8utU9fj8LxNpXSP-b6P8d0lU\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('oZtd_pvg-VYuq-3oO7v5cymE5Zfm1Omf', 1684138330, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ouuJFqPMOwLwEfiYquCmwPXwRitMbUB4', 1684328011, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MjQwOTA4LCJleHAiOjE2ODQzMjczMDh9.509GIf-KlgwD09kAFSzx_CZhnwc_CgFdwo_YLkIrlbk\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('pH-RNJ9_FmnOpjv7BBrmg1mRvAcv2pIZ', 1684251440, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJzaGFtaW0iLCJ0YWJsZSI6InRlYWNoZXJzIiwidXNlclR5cGUiOiJ0ZWFjaGVyIiwiaWF0IjoxNjg0MTY0OTA5LCJleHAiOjE2ODQyNTEzMDl9.HzafcJ_4VqwROeAxIbDgAb1oGhWpBLhSn0YhyntxuYQ\",\"user\":{\"id\":1,\"userType\":\"teacher\",\"name\":\"shamim\",\"username\":\"shamim\",\"email\":\"shamim@gmail.com\",\"address\":null,\"phone\":\"017229742\",\"password\":\"$2b$11$FPWYHmcWRwMOkps57qHoFO6xrxY.nlVBdRicCZTietn0JGej6blli\",\"school_id\":1,\"avater\":null}}'),
('pTfvYFgTTnvpaXGs4b_0LptiysnwDhIM', 1684078847, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('qTozlSZibm-QpYMTgd9ebXDLrAUak10k', 1684285377, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('qknryB_uMtmMYIYCvFyPWn2q7iJswoGf', 1684147007, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJOYXNpciIsInRhYmxlIjoic3R1ZGVudHMiLCJ1c2VyVHlwZSI6InN0dWRlbnQiLCJpYXQiOjE2ODQwNjA1MjYsImV4cCI6MTY4NDE0NjkyNn0.BpR-oirDZ5ihzlTMBuYMNfowlo2KstEcJS4EKeD0Ys4\",\"user\":{\"id\":2,\"userType\":\"student\",\"name\":\"Nasir\",\"class_id\":2,\"student_id\":\"100\",\"password\":\"123456789zxcvbnm\",\"school_id\":1,\"gender\":\"male\",\"dob\":\"2023-04-06T18:00:00.000Z\",\"address\":\"Sadarpur\",\"avater\":null,\"created_at\":\"2023-04-06T21:06:34.000Z\",\"updated_at\":\"2023-05-10T03:45:09.000Z\"}}'),
('rLM_s-EGrdRfDRU0dtq3CGbwZ5WwKBSX', 1684258170, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MTcxNzIxLCJleHAiOjE2ODQyNTgxMjF9.E4PzOuyxrT2rWnQs7EjLv7B7F8-HJHccAfuCrZBqeC4\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}'),
('sEzRJKK0dFiHY90Ojp7sS8QNmxk8IrDT', 1683946461, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('sQ7Rosk1tdtLInusZ64TJbNUmdo2cqTG', 1684298275, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tdBIaxFXU5sbejUxqe_IGILk07g7bEUs', 1683951766, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('teEG0LOzWBEoTyDin71yXD1-DgsnsCD1', 1684175648, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ueD1Bn9-drTosr4Le0KPbDNWA8RxQoXG', 1684140067, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vLbHNgKTCfXg6bPPLoc6YMfi_9rRnoT1', 1684078818, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vakHTJe5-vFoXUBnbVTVstXgoiQGTAK7', 1684010221, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vpje7kLjERlHdP19MRuL__elcrce4E77', 1684294285, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vr8UxLi-AY-3DKdIwLOySAigVV9t3m6x', 1684175430, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xU9JVHfKOXaDnv8LuAEwlcyzq1f8vr7c', 1683968981, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xg58gxZybdF_smSGw73_xIOhRP_KFwve', 1684321256, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xuSlMj1XlRRA5GJtLTlNoFxU5ePIxM2p', 1683899894, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ynaKU-b-R-ab18leEa3XsIKEqpIp-QZ5', 1684229505, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('zE6KhO81Mv1kU-4hw7sHgzAqPALiPPW2', 1684276149, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('zWtZrvCcDwW-cc3KLmaczTDPCYplDoEC', 1684327415, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"isLoggedIn\":true,\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJtb2RlcmF0b3IiLCJ0YWJsZSI6Im1vZGVyYXRvciIsInVzZXJUeXBlIjoibW9kZXJhdG9yIiwiaWF0IjoxNjg0MjQwNTAxLCJleHAiOjE2ODQzMjY5MDF9.JR3zrRAvdwe_y__xtyxkIBeru8pNUNg2t5hiWkXYhlo\",\"user\":{\"id\":1,\"userType\":\"moderator\",\"name\":\"Shamim\",\"username\":\"moderator\",\"email\":\"m@gmail.cm\",\"phone\":\"523532532\",\"password\":\"$2b$11$4LXY5kOL1qXJ7NyP2RWNluFLhR54Whe38G3K7LUVyk3mjJH2GXrFu\",\"avater\":\"/uploads/moderator_avater_1680884299511_Screenshot 2023-03-26 005004.png\"}}');

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
(1, 'student', 'Soikat Hossain', 2, '201002182', '11111', 1, 'female', '2023-03-12', '11', '/uploads/student_avater_1680805600661_crop.jpg', '2023-03-14 18:26:56', '2023-05-10 10:05:28'),
(2, 'student', 'Nasir', 2, '100', '123456789zxcvbnm', 1, 'male', '2023-04-07', 'Sadarpur', NULL, '2023-04-06 21:06:34', '2023-05-10 03:45:09');

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
(1, 1, 'সাধারন গণিত', 'MATH-104'),
(2, 1, 'উচ্চতর গণিত', 'BAN-102'),
(3, 2, 'তথ্য ও যোগাযোগ প্রযুক্তি', 'EAP-103'),
(4, 1, 'পদার্থ বিজ্ঞান', 'IOM-403'),
(5, 2, 'বাংলা ১ম পত্র', 'GED-403'),
(6, 2, 'বাংলা ২য় পত্র', 'SCI-352'),
(8, 4, 'physics', 'phy102'),
(9, 4, 'Math', 'asdg'),
(10, 3, 'Math', 'asdg'),
(11, 5, 'Gonit', 'mat'),
(12, 1, 'রসায়ন বিজ্ঞান', 'GED-405'),
(13, 1, 'জীববিজ্ঞান', '22'),
(14, 1, 'বাংলা ১ম পত্র', 'B-02'),
(15, 1, 'বাংলা ২য় পত্র', 'B-01'),
(16, 1, 'English 1st Paper', 'E-01'),
(17, 1, 'English 2nd Paper', 'E-02'),
(18, 1, 'ইসলাম শিক্ষা', 'I-01'),
(19, 1, 'তথ্য ও যোগাযোগ প্রযুক্তি', 'ICT-01');

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
  ADD KEY `chapter_id` (`chapter_id`),
  ADD KEY `fk_author` (`fk_author`);

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
-- Indexes for table `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `chapter_id` (`chapter_id`),
  ADD KEY `fk_author` (`fk_author`);

--
-- Indexes for table `q_others`
--
ALTER TABLE `q_others`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `chapter_id` (`chapter_id`),
  ADD KEY `fk_author` (`fk_author`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `creative`
--
ALTER TABLE `creative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `exams_participants`
--
ALTER TABLE `exams_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `filter`
--
ALTER TABLE `filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `q_others`
--
ALTER TABLE `q_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `q_set`
--
ALTER TABLE `q_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  ADD CONSTRAINT `creative_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`),
  ADD CONSTRAINT `creative_ibfk_4` FOREIGN KEY (`fk_author`) REFERENCES `moderator` (`id`);

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
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`),
  ADD CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`fk_author`) REFERENCES `moderator` (`id`);

--
-- Constraints for table `q_others`
--
ALTER TABLE `q_others`
  ADD CONSTRAINT `q_others_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject_list` (`id`),
  ADD CONSTRAINT `q_others_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `q_others_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`),
  ADD CONSTRAINT `q_others_ibfk_4` FOREIGN KEY (`fk_author`) REFERENCES `moderator` (`id`);

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
