-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2019 at 10:24 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sentiment_analysis_twitter_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `analysis`
--

CREATE TABLE `analysis` (
  `analysis_id` int(11) NOT NULL,
  `analysis_topic` varchar(255) NOT NULL,
  `analysis_total_tweets` int(11) NOT NULL,
  `analysis_date` varchar(255) NOT NULL,
  `analysis_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analysis`
--

INSERT INTO `analysis` (`analysis_id`, `analysis_topic`, `analysis_total_tweets`, `analysis_date`, `analysis_description`) VALUES
(1, 'bitcoin', 200, '8 February,2019', 'Sentiment analysis of bitcoin data'),
(2, 'election in india', 300, '9 February,2019', 'election in india'),
(3, 'salman khan', 100, '8 February,2019', 'salman khan sentiment analysis'),
(4, 'bigdata', 10, '8 February,2019', 'Test'),
(5, 'kashmir', 500, '8 February,2019', 'kashmir');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL,
  `configuration_consumer_key` text NOT NULL,
  `configuration_consumer_secret` text NOT NULL,
  `configuration_access_token` text NOT NULL,
  `configuration_access_token_secret` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_consumer_key`, `configuration_consumer_secret`, `configuration_access_token`, `configuration_access_token_secret`) VALUES
(1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `department_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_desc`) VALUES
(1, 'IT Department', 'IT Department'),
(2, 'Java Developement', 'Java Developement'),
(3, 'HR Department', 'HR Department'),
(4, 'Web Developement', 'Web Developement');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(255) NOT NULL,
  `designation_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designation_id`, `designation_name`, `designation_desc`) VALUES
(1, 'Software Engineer', 'Software Engineer'),
(2, 'Sr. Software Engineer', 'Sr. Software Engineer'),
(3, 'Team Lead', 'Team Lead'),
(4, 'Lead Engineer', 'Lead Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3nydxueq651e5e1f6fi2m7ot7qr551kt', 'MmQ2NzE1MWUzZDg5ODhlMWMwNjA1NDY0NGI5ZmQ1YWE2NmMxNjE3Nzp7InVzZXJfaWQiOjE3LCJ1c2VyX2ZpcnN0X25hbWUiOiJKYXkiLCJhdXRoZW50aWNhdGVkIjp0cnVlLCJ1c2VyX2xldmVsX2lkIjoyfQ==', '2017-12-09 16:28:09'),
('7xwuqbgziavwdy1pxkb1l9gw3ju4qqdi', 'YTE4ODU5NzhiNGQ0ZjQzYzRlYmUzMTM2ZjI2ZmFkYzQ1NzU1MWRkYTp7InVzZXJfaWQiOjI4LCJ1c2VyX2ZpcnN0X25hbWUiOiJhc2RmIiwiYXV0aGVudGljYXRlZCI6dHJ1ZSwidXNlcl9sZXZlbF9pZCI6MX0=', '2018-03-20 16:58:10'),
('8lg6u5d7u128egy5kj72ysszh182p908', 'NmYwMTg1YzkwNjMzOGM0MjEwNTlkNWIyN2U1YTY1YjA5MTYwNzA3MTp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2017-12-05 12:19:43'),
('a4bleeve4vy4s8yuqgcqb4lyd6z8cmdj', 'YzgyMjc0ZThmZTA5ODJlNTg2YjUyZWU5ZjMxYzU0MTVhMzE1MDhjMzp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2017-09-19 17:52:21'),
('eg60bzzadg4n1ujp7gs3di2mjycaskqx', 'MmQ2NzE1MWUzZDg5ODhlMWMwNjA1NDY0NGI5ZmQ1YWE2NmMxNjE3Nzp7InVzZXJfaWQiOjE3LCJ1c2VyX2ZpcnN0X25hbWUiOiJKYXkiLCJhdXRoZW50aWNhdGVkIjp0cnVlLCJ1c2VyX2xldmVsX2lkIjoyfQ==', '2018-03-07 17:37:10'),
('hg55fs3f1lm7w6ue7hkhfubad11170ew', 'ZDYxMDkzOWE2M2Q1ODgxMTQyZjFiYjMyMTc4NzA1ZDJmOWE3OWE1ODp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2ZpcnN0X25hbWUiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2V9', '2018-05-16 08:00:49'),
('i5307nyqqp0qrqq0ra7rvhketcp4j9va', 'NmYwMTg1YzkwNjMzOGM0MjEwNTlkNWIyN2U1YTY1YjA5MTYwNzA3MTp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2017-12-05 18:18:27'),
('jepc0gbw67i143r8kh9wxk20un3p6p5l', 'YzgyMjc0ZThmZTA5ODJlNTg2YjUyZWU5ZjMxYzU0MTVhMzE1MDhjMzp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2017-09-19 17:45:30'),
('kqt5frr7v58jvqqq1i2udn2f19ffjon3', 'ZDYxMDkzOWE2M2Q1ODgxMTQyZjFiYjMyMTc4NzA1ZDJmOWE3OWE1ODp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2ZpcnN0X25hbWUiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2V9', '2018-05-17 07:16:29'),
('l5jxmb32y1fhd78zmimye8pkfqlvmx07', 'ZDYxMDkzOWE2M2Q1ODgxMTQyZjFiYjMyMTc4NzA1ZDJmOWE3OWE1ODp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2ZpcnN0X25hbWUiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2V9', '2017-12-09 17:00:32'),
('qi4jui1wag7y5kjd3nal07b1h2jlc9ia', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2017-07-21 17:16:47'),
('v2xqcmbpaue3jxachbqtwtorwazdt0j8', 'YWM2MGJiMjRkYjRlYWYzOGRlODcyMDI1ZmJiYjI2ZTUxMTgxOTlhNDp7ImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsInVzZXJfZmlyc3RfbmFtZSI6IkFtaXQifQ==', '2019-02-22 08:07:20'),
('xqsmb86gbz6nmq69p1izuqxm1uwnj5je', 'YWM2MGJiMjRkYjRlYWYzOGRlODcyMDI1ZmJiYjI2ZTUxMTgxOTlhNDp7ImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsInVzZXJfZmlyc3RfbmFtZSI6IkFtaXQifQ==', '2019-02-22 08:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(11) NOT NULL,
  `level_name` varchar(255) NOT NULL,
  `level_sccore` varchar(255) NOT NULL,
  `level_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_name`, `level_sccore`, `level_description`) VALUES
(1, 'Beginner', 'Level 1', 'Beginner'),
(2, 'Intermediate', 'Level 1', ''),
(3, 'Advanced', '', 'Advanced'),
(4, 'Expert', '', 'Expert');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_emp_id` int(11) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_level` int(11) NOT NULL DEFAULT '3',
  `login_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_emp_id`, `login_user`, `login_password`, `login_level`, `login_email`) VALUES
(1, 0, 'admin', 'test', 1, 'kaushal.rahuljaiswal@gmail.com'),
(6, 1002, 'kaushal', 'test', 3, 'kaushal.rahuljaiswal@gmail.com'),
(7, 1003, 'kaushal123', 'test', 3, 'aggarwal.neha@gmail.com'),
(8, 1004, 'neha', 'test', 3, 'aggarwal.neha@gmail.com'),
(9, 1005, 'test', 'test', 3, 'aggarwal.neha@gmail.com'),
(10, 1006, 'atul', 'test', 3, 'aatul@gmail.com'),
(11, 1007, 'sumit1', 'test', 3, 'sumit.singh@gmail.com'),
(12, 1008, 'neha123', 'test', 3, 'aggarwal.neha@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month_id` int(11) NOT NULL,
  `month_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `salutions`
--

CREATE TABLE `salutions` (
  `sl_id` int(11) NOT NULL,
  `sl_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salutions`
--

INSERT INTO `salutions` (`sl_id`, `sl_name`) VALUES
(1, 'Mr.'),
(2, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `sentiment`
--

CREATE TABLE `sentiment` (
  `sentiment_id` int(11) NOT NULL,
  `sentiment_anlysis_id` int(11) NOT NULL,
  `sentiment_positive` int(11) NOT NULL,
  `sentiment_weakly_positive` int(11) NOT NULL,
  `sentiment_strongly_positive` int(11) NOT NULL,
  `sentiment_neutral` int(11) NOT NULL,
  `sentiment_negative` int(11) NOT NULL,
  `sentiment_weakly_negetive` int(11) NOT NULL,
  `sentiment_strongly_negetive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sentiment`
--

INSERT INTO `sentiment` (`sentiment_id`, `sentiment_anlysis_id`, `sentiment_positive`, `sentiment_weakly_positive`, `sentiment_strongly_positive`, `sentiment_neutral`, `sentiment_negative`, `sentiment_weakly_negetive`, `sentiment_strongly_negetive`) VALUES
(1, 1, 9, 24, 9, 46, 1, 12, 1),
(2, 2, 9, 24, 1, 39, 3, 24, 0),
(3, 3, 8, 44, 2, 35, 6, 4, 1),
(4, 4, 0, 20, 0, 60, 0, 10, 10),
(5, 5, 9, 20, 2, 54, 1, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_city`
--

CREATE TABLE `users_city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_city`
--

INSERT INTO `users_city` (`city_id`, `city_name`) VALUES
(1, 'Allahabad'),
(2, 'Varanasi');

-- --------------------------------------------------------

--
-- Table structure for table `users_country`
--

CREATE TABLE `users_country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_country`
--

INSERT INTO `users_country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `role_id` int(11) NOT NULL,
  `role_title` varchar(255) NOT NULL,
  `role_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`role_id`, `role_title`, `role_description`) VALUES
(1, 'Admin', 'Admin Roles and Permissions'),
(2, 'Student', 'Student Roles and Permission'),
(3, 'Teacher', 'Teacher roles and permission');

-- --------------------------------------------------------

--
-- Table structure for table `users_state`
--

CREATE TABLE `users_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_state`
--

INSERT INTO `users_state` (`state_id`, `state_name`) VALUES
(1, 'UttarnPradesh'),
(2, 'Madhya Pradesh');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `user_id` int(11) NOT NULL,
  `user_level_id` int(11) NOT NULL,
  `user_username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_first_name` varchar(255) NOT NULL,
  `user_add1` varchar(255) NOT NULL,
  `user_add2` varchar(255) NOT NULL,
  `user_city` int(11) NOT NULL,
  `user_state` int(11) NOT NULL,
  `user_country` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`user_id`, `user_level_id`, `user_username`, `user_password`, `user_first_name`, `user_add1`, `user_add2`, `user_city`, `user_state`, `user_country`, `user_email`, `user_mobile`, `user_gender`, `user_dob`, `user_image`, `user_last_name`) VALUES
(8, 1, 'admin', 'test', 'Amit', 'Allahabad', 'Lunckonw', 1, 1, 1, 'amit@gmail.com', '9878987678', 'Male', '2 July,1987', '/uploads/p1.jpg', 'Kumar'),
(10, 2, 'student', 'test', 'Manasa Singh', 'House no : 768', 'Noida', 2, 1, 1, 'manasa@gmail.com', '9876543212', 'Female', '18 January,1968', '/uploads/p2.jpg', '1'),
(11, 3, 'teacher', 'test', 'Aman', 'House No : 355, Sector 23', 'Noida', 1, 2, 1, 'aman@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p3.jpg', 'Kumar'),
(14, 3, 'pawan', 'test', 'Pawan Kumar', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'pawan@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p4.jpg', '1'),
(15, 1, 'vishal', 'test', 'Vishal Singh', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'vvishal@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p9.jpg', '1'),
(16, 2, 'alok', 'test', 'Alok Kumar', 'Pasco House,', '', 1, 1, 1, 'alok@gmail.com', '9876543212', 'Male', '17 July,1998', '/uploads/p6.jpg', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analysis`
--
ALTER TABLE `analysis`
  ADD PRIMARY KEY (`analysis_id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`configuration_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `salutions`
--
ALTER TABLE `salutions`
  ADD PRIMARY KEY (`sl_id`);

--
-- Indexes for table `sentiment`
--
ALTER TABLE `sentiment`
  ADD PRIMARY KEY (`sentiment_id`);

--
-- Indexes for table `users_city`
--
ALTER TABLE `users_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `users_country`
--
ALTER TABLE `users_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users_state`
--
ALTER TABLE `users_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analysis`
--
ALTER TABLE `analysis`
  MODIFY `analysis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `configuration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `salutions`
--
ALTER TABLE `salutions`
  MODIFY `sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sentiment`
--
ALTER TABLE `sentiment`
  MODIFY `sentiment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_city`
--
ALTER TABLE `users_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_country`
--
ALTER TABLE `users_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_state`
--
ALTER TABLE `users_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
