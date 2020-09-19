-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2020 at 11:51 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nikhojshongbad`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add people', 7, 'add_people'),
(26, 'Can change people', 7, 'change_people'),
(27, 'Can delete people', 7, 'delete_people'),
(28, 'Can view people', 7, 'view_people'),
(29, 'Can add search image', 8, 'add_searchimage'),
(30, 'Can change search image', 8, 'change_searchimage'),
(31, 'Can delete search image', 8, 'delete_searchimage'),
(32, 'Can view search image', 8, 'view_searchimage');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$WGjfynBf2Zug$2jrTQuXRXyIFgh965VPSLx8hNHLFk9bvJcvyCTZIcuw=', '2020-09-15 07:06:37.916135', 1, 'shahed', '', '', 'shahedtalukder51@gmail.com', 1, 1, '2020-09-13 05:23:34.876471');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-09-13 15:43:48.994517', '1', 'People object (1)', 2, '[{\"changed\": {\"fields\": [\"Gardian name\", \"Gardian phone number\"]}}]', 7, 1),
(2, '2020-09-13 17:28:49.549424', '1', 'Ashik | 1233', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(3, '2020-09-13 17:37:32.652369', '1', 'Ashik | 1233', 3, '', 7, 1),
(4, '2020-09-13 17:43:17.655959', '2', 'Ashik | 1233', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(5, '2020-09-13 17:44:01.692338', '2', 'Ashik | 1233', 3, '', 7, 1),
(6, '2020-09-15 10:33:14.676823', '5', 'Alvi | 2', 3, '', 7, 1),
(7, '2020-09-15 10:33:14.680823', '4', 'Alvi | 2', 3, '', 7, 1),
(8, '2020-09-15 10:48:58.761672', '7', 'Nimai | 3', 2, '[{\"changed\": {\"fields\": [\"Address\"]}}]', 7, 1),
(9, '2020-09-15 11:13:16.925128', '3', 'Ashik | 1', 2, '[{\"changed\": {\"fields\": [\"P id\"]}}]', 7, 1),
(10, '2020-09-15 11:13:29.977462', '3', 'Ashik | 1233', 2, '[{\"changed\": {\"fields\": [\"P id\"]}}]', 7, 1),
(11, '2020-09-15 11:13:59.064365', '3', 'Ashik | 1', 2, '[{\"changed\": {\"fields\": [\"P id\"]}}]', 7, 1),
(12, '2020-09-15 11:14:24.302739', '3', 'Ashik | 1233', 2, '[{\"changed\": {\"fields\": [\"P id\"]}}]', 7, 1),
(13, '2020-09-19 08:51:57.959787', '6', 'Alvi | 2', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'people'),
(8, 'main', 'searchimage'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-09-13 05:21:44.339831'),
(2, 'auth', '0001_initial', '2020-09-13 05:21:44.683025'),
(3, 'admin', '0001_initial', '2020-09-13 05:21:45.639861'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-09-13 05:21:45.898060'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-13 05:21:45.909907'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-09-13 05:21:46.027874'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-09-13 05:21:46.138400'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-09-13 05:21:46.255415'),
(9, 'auth', '0004_alter_user_username_opts', '2020-09-13 05:21:46.269415'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-09-13 05:21:46.356186'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-09-13 05:21:46.361186'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-13 05:21:46.379871'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-09-13 05:21:46.408874'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-13 05:21:46.452943'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-09-13 05:21:46.479296'),
(16, 'auth', '0011_update_proxy_permissions', '2020-09-13 05:21:46.498301'),
(17, 'sessions', '0001_initial', '2020-09-13 05:21:46.563254'),
(18, 'main', '0001_initial', '2020-09-13 05:22:23.699002'),
(19, 'main', '0002_auto_20200913_1126', '2020-09-13 05:26:47.984553'),
(20, 'main', '0003_auto_20200913_1127', '2020-09-13 05:27:37.714869'),
(21, 'main', '0004_auto_20200913_1347', '2020-09-13 07:47:12.718247'),
(22, 'main', '0005_auto_20200913_2139', '2020-09-13 15:39:24.968323'),
(23, 'main', '0006_people_image', '2020-09-13 17:27:42.557898'),
(24, 'main', '0007_searchimage', '2020-09-14 11:14:43.375534');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('btv5t3cyewswr35ds3qniqvbj03tyvnx', 'ZDQ4Njc1NjgxNDMzMjU4YzlmYzEyZDBmMDA2NTBjMThmNDliYmU5NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmODUzOWM0NDlhOGY0NGNhYWYxZTFkY2ZiMWQ2ODdhYzQzNDY0ZGFlIn0=', '2020-09-29 07:06:37.925137'),
('v09n5s8tuvq2fxfcl936dd1uiqbm8omy', 'ZDQ4Njc1NjgxNDMzMjU4YzlmYzEyZDBmMDA2NTBjMThmNDliYmU5NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmODUzOWM0NDlhOGY0NGNhYWYxZTFkY2ZiMWQ2ODdhYzQzNDY0ZGFlIn0=', '2020-09-28 13:01:13.582394');

-- --------------------------------------------------------

--
-- Table structure for table `main_searchimage`
--

CREATE TABLE `main_searchimage` (
  `id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_searchimage`
--

INSERT INTO `main_searchimage` (`id`, `image`) VALUES
(1, 'search/shahed.jpg'),
(2, 'search/shahed_6Q6qeaP.jpg'),
(3, 'search/shahed_IUGxRIA.jpg'),
(4, 'search/shahed.jpg'),
(5, 'search/shahed.jpg'),
(6, 'search/shahed_fWNjb8y.jpg'),
(7, 'search/shahed_TFBggaK.jpg'),
(8, 'search/shahed_1QYxK7B.jpg'),
(9, 'search/shahed.jpg'),
(10, 'search/shahed.jpg'),
(11, 'search/shahed_W7xFupa.jpg'),
(12, 'search/shahed.jpg'),
(13, 'search/shahed_ZhKvTHD.jpg'),
(14, 'search/shahed_XQJlxRZ.jpg'),
(15, 'search/shahed_uBgDXMV.jpg'),
(16, 'search/shahed.jpg'),
(17, 'search/shahed_G0B0DdY.jpg'),
(18, 'search/shahed_uHvrHWA.jpg'),
(19, 'search/shahed.jpg'),
(20, 'search/shahed.jpg'),
(21, 'search/shahed.jpg'),
(22, 'search/shahed.jpg'),
(23, 'search/shahed_J8sLXKi.jpg'),
(24, 'search/shahed_uu0CAse.jpg'),
(25, 'search/shahed.jpg'),
(26, 'search/shahed.jpg'),
(27, 'search/shahed_ZzvdwhK.jpg'),
(28, 'search/shahed_klByC03.jpg'),
(29, 'search/WIN_20200914_18_43_39_Pro.jpg'),
(30, 'search/WIN_20200914_18_43_39_Pro_wjrfw29.jpg'),
(31, 'search/WIN_20200914_18_43_39_Pro_JYUoySU.jpg'),
(32, 'search/WIN_20200914_18_43_39_Pro_rvCB9VS.jpg'),
(33, 'search/WIN_20200914_18_43_39_Pro_IOg56RK.jpg'),
(34, 'search/WIN_20200914_18_43_39_Pro.jpg'),
(35, 'search/WIN_20200914_18_43_39_Pro_xioK55q.jpg'),
(36, 'search/WIN_20200914_18_43_39_Pro.jpg'),
(37, 'search/WIN_20200914_18_43_39_Pro.jpg'),
(38, 'search/alvi.jpg'),
(39, 'search/alvi_GeKLPmE.jpg'),
(40, 'search/alvi.jpg'),
(41, 'search/alvi.jpg'),
(42, 'search/alvi.jpg'),
(43, 'search/alvi.jpg'),
(44, 'search/alvi.jpg'),
(45, 'search/alvi.jpg'),
(46, 'search/nimai.jpg'),
(47, 'search/WIN_20200918_00_00_27_Pro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `people_information`
--

CREATE TABLE `people_information` (
  `id` int(11) NOT NULL,
  `p_id` varchar(50) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `blood_group` varchar(20) NOT NULL,
  `special_mark` varchar(120) DEFAULT NULL,
  `age` varchar(120) DEFAULT NULL,
  `skin_tone` varchar(120) DEFAULT NULL,
  `dress_up` varchar(120) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_location` varchar(150) DEFAULT NULL,
  `miscellaneous` longtext DEFAULT NULL,
  `nick_name` varchar(150) DEFAULT NULL,
  `gardian_name` varchar(120) DEFAULT NULL,
  `gardian_phone_number` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `people_information`
--

INSERT INTO `people_information` (`id`, `p_id`, `full_name`, `address`, `blood_group`, `special_mark`, `age`, `skin_tone`, `dress_up`, `phone_number`, `last_location`, `miscellaneous`, `nick_name`, `gardian_name`, `gardian_phone_number`, `image`) VALUES
(3, '1233', 'Md Ashik Rahman', 'East Adalot Para, Tangail', 'O Positive', 'Black spot in chick', '25', 'White Brown', 'Shirt And Jeans', '01725629435', 'Sohrawardi Uddan,Dhaka', 'Nothing to say about him. He has lost his mind', 'Ashik', 'ATM Edris', '01725629435', 'shahed.jpg'),
(6, '2', 'Alvi Ahmed', 'Narayongong,Dhaka', 'A Negative', 'Simple Scratch in left arm', '26', 'White Brown', 'Shirt(White Color)', '01795468736', 'Daffodil  Internation University', 'An elegant person with narrative look', 'Alvi', 'Rafin Talukder', '01795468736', 'alvi_9JqmbNN.jpg'),
(7, '3', 'Nimai Chandra Das', 'Shukrabad, Main Campus', 'B Positive', 'Simple Scratch in left arm', '25', 'Brown', 'T-shirt(Green Color)', '01846236512', 'Permanent Campus Daffodin University', 'No criminal record.', 'Nimai', 'Prafulla Debnath', '01846236512', 'nimai.jpg'),
(8, '4', 'Sadik Hossain Shonchoy', 'Rajshahi Boarder, Rajshahi', 'O Negative', 'Simple Scratch in right arm', '23', 'Brown', 'T-shirt(Yellow Color)', '01965342689', 'Permanent Campus Daffodin University', 'Nothing to say about him. Very simple and elegant person', 'Sadik', 'Aslam Miah', '01965342689', 'sadik.jpg'),
(9, '5', 'Salman Miah', 'Kishorgonj, Foridpur', 'AB Positive', 'Black spot in chick', '25', 'White Brown', 'Shirt And Jeans', '01746325689', 'Daffodil  Internation University', 'Nothing to say about him', 'Salman', 'Salimullah Khan', '01746325689', 'salman.jpg'),
(10, '6', 'Showive Hossain', 'Lalmatiya, Noakhali', 'B Positive', 'Simple Scratch in left arm', '23', 'Black', 'Shirt And Jeans', '01936456535', 'Permanent Campus Daffodin University', 'Very Rude and a bad refuge I mean rohinga', 'Showive', 'Nabil Ahmed', '01936456535', 'showive.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

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
-- Indexes for table `main_searchimage`
--
ALTER TABLE `main_searchimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people_information`
--
ALTER TABLE `people_information`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `main_searchimage`
--
ALTER TABLE `main_searchimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `people_information`
--
ALTER TABLE `people_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
