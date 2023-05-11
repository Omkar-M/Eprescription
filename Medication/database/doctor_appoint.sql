-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2022 at 01:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_appoint`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `appointment_datetime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `dr_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `appointment_datetime`, `status`, `dr_id_id`, `user_id_id`) VALUES
(1, '2022-05-02 10:00:00.000000', 0, 1, 1);

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
(25, 'Can add doctor education model', 7, 'add_doctoreducationmodel'),
(26, 'Can change doctor education model', 7, 'change_doctoreducationmodel'),
(27, 'Can delete doctor education model', 7, 'delete_doctoreducationmodel'),
(28, 'Can view doctor education model', 7, 'view_doctoreducationmodel'),
(29, 'Can add doctor model', 8, 'add_doctormodel'),
(30, 'Can change doctor model', 8, 'change_doctormodel'),
(31, 'Can delete doctor model', 8, 'delete_doctormodel'),
(32, 'Can view doctor model', 8, 'view_doctormodel'),
(33, 'Can add pharmacy model', 9, 'add_pharmacymodel'),
(34, 'Can change pharmacy model', 9, 'change_pharmacymodel'),
(35, 'Can delete pharmacy model', 9, 'delete_pharmacymodel'),
(36, 'Can view pharmacy model', 9, 'view_pharmacymodel'),
(37, 'Can add user model', 10, 'add_usermodel'),
(38, 'Can change user model', 10, 'change_usermodel'),
(39, 'Can delete user model', 10, 'delete_usermodel'),
(40, 'Can view user model', 10, 'view_usermodel'),
(41, 'Can add prescription model', 11, 'add_prescriptionmodel'),
(42, 'Can change prescription model', 11, 'change_prescriptionmodel'),
(43, 'Can delete prescription model', 11, 'delete_prescriptionmodel'),
(44, 'Can view prescription model', 11, 'view_prescriptionmodel'),
(45, 'Can add appointment model', 12, 'add_appointmentmodel'),
(46, 'Can change appointment model', 12, 'change_appointmentmodel'),
(47, 'Can delete appointment model', 12, 'delete_appointmentmodel'),
(48, 'Can view appointment model', 12, 'view_appointmentmodel'),
(49, 'Can add prescription model3', 13, 'add_prescriptionmodel3'),
(50, 'Can change prescription model3', 13, 'change_prescriptionmodel3'),
(51, 'Can delete prescription model3', 13, 'delete_prescriptionmodel3'),
(52, 'Can view prescription model3', 13, 'view_prescriptionmodel3'),
(53, 'Can add prescription model2', 14, 'add_prescriptionmodel2'),
(54, 'Can change prescription model2', 14, 'change_prescriptionmodel2'),
(55, 'Can delete prescription model2', 14, 'delete_prescriptionmodel2'),
(56, 'Can view prescription model2', 14, 'view_prescriptionmodel2'),
(57, 'Can add prescription model1', 15, 'add_prescriptionmodel1'),
(58, 'Can change prescription model1', 15, 'change_prescriptionmodel1'),
(59, 'Can delete prescription model1', 15, 'delete_prescriptionmodel1'),
(60, 'Can view prescription model1', 15, 'view_prescriptionmodel1');

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
  `first_name` varchar(150) NOT NULL,
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
(1, 'pbkdf2_sha256$260000$SpheHxTSxeRMruNVsWzpDD$ig5uc4BH3JnXHCcSuY1UcvGiPq1SCWNG1GbBznal9Ww=', '2022-05-02 11:24:26.283495', 1, 'admin', '', '', '', 1, 1, '2022-05-02 11:22:57.041669');

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
(1, '2022-05-02 11:24:56.547890', '1', 'DoctorEducationModel object (1)', 1, '[{\"added\": {}}]', 7, 1);

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
(12, 'medapp', 'appointmentmodel'),
(7, 'medapp', 'doctoreducationmodel'),
(8, 'medapp', 'doctormodel'),
(9, 'medapp', 'pharmacymodel'),
(11, 'medapp', 'prescriptionmodel'),
(15, 'medapp', 'prescriptionmodel1'),
(14, 'medapp', 'prescriptionmodel2'),
(13, 'medapp', 'prescriptionmodel3'),
(10, 'medapp', 'usermodel'),
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
(1, 'contenttypes', '0001_initial', '2022-05-02 11:20:35.482211'),
(2, 'auth', '0001_initial', '2022-05-02 11:20:36.114030'),
(3, 'admin', '0001_initial', '2022-05-02 11:20:36.249256'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-02 11:20:36.260377'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-02 11:20:36.273981'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-02 11:20:36.336861'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-02 11:20:36.393899'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-02 11:20:36.418333'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-02 11:20:36.430563'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-02 11:20:36.501736'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-02 11:20:36.505726'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-02 11:20:36.519723'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-02 11:20:36.538388'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-02 11:20:36.559047'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-02 11:20:36.578069'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-02 11:20:36.592825'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-02 11:20:36.610475'),
(18, 'medapp', '0001_initial', '2022-05-02 11:20:37.039820'),
(19, 'medapp', '0002_prescriptionmodel3_prescriptionmodel2_and_more', '2022-05-02 11:20:37.459225'),
(20, 'sessions', '0001_initial', '2022-05-02 11:20:37.500105');

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
('3tosvo590et2946lnz477pjaldrj2x2d', 'eyJwaGFybWFjeV9pZCI6MSwicGhhcm1hY3lfbmFtZSI6IlJhaiBNZWRpY2FscyJ9:1nlUQb:1spS2fRnbrZP32O9j1MMAkYcgbKIUYuxaBSreQbQnj0', '2022-05-16 11:41:21.737773'),
('w56n047aiyo07g3jj6mk6xoyu3g5ha2t', '.eJxVjskOwiAURf-FtSFleCAu3fsNzYMHtrVC0yEujP9uGxujyzud3CercZmbepniWLfETkyww6_nMdxi3gLqMF8LDyXPY-v5VuF7OvFLodif9-4foMGpWdfJg0yoyHqjnU5AFo9JgZDSRWdIawUqBSXIVK5yBFqAFZ6sBSWtiXKFUglz-bwUX5XxHlf8MGL3wJ693vbyQ_I:1nlUOv:wPThOagr5T8VWw7Vhs-1QSK6vhXSfgme6BA3o5Ws_Mg', '2022-05-16 11:39:37.799641');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `dr_id` int(11) NOT NULL,
  `dr_name` varchar(50) NOT NULL,
  `dr_email` varchar(50) NOT NULL,
  `dr_mobile` varchar(14) NOT NULL,
  `dr_password` varchar(500) NOT NULL,
  `dr_address` varchar(100) NOT NULL,
  `dr_education_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`dr_id`, `dr_name`, `dr_email`, `dr_mobile`, `dr_password`, `dr_address`, `dr_education_id`) VALUES
(1, 'prajwal', 'prajwal3844@gmail.com', '+919766152573', 'prajwal', 'pune', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_education`
--

CREATE TABLE `doctor_education` (
  `dr_education_id` int(11) NOT NULL,
  `dr_degree` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_education`
--

INSERT INTO `doctor_education` (`dr_education_id`, `dr_degree`) VALUES
(1, 'mbbs');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `pharmacy_id` int(11) NOT NULL,
  `pharmacy_name` varchar(50) NOT NULL,
  `pharmacy_email` varchar(50) NOT NULL,
  `pharmacy_mobile` varchar(14) NOT NULL,
  `pharmacy_password` varchar(500) NOT NULL,
  `pharmacy_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`pharmacy_id`, `pharmacy_name`, `pharmacy_email`, `pharmacy_mobile`, `pharmacy_password`, `pharmacy_address`) VALUES
(1, 'Raj Medicals', 'prajwal4483@gmail.com', '+918999784556', 'rahul', 'goa');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `patient_email` varchar(50) NOT NULL,
  `patient_prescription` longtext NOT NULL,
  `prescription_datetime` datetime(6) NOT NULL,
  `dr_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `patient_name`, `patient_email`, `patient_prescription`, `prescription_datetime`, `dr_id_id`, `user_id_id`) VALUES
(1, 'tara', 'tara3844@gmail.com', 'b\'gAAAAABib8MWuIjsg-zhTgz_w_oRbpqlgjI9BJp3X9cft8Zbe871IXuhT4CKJ6EYjqKw1SsuM10XpL8VrTUSoxEMEsgMii-UYQ==\'', '2022-05-02 11:40:06.272860', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prescription1`
--

CREATE TABLE `prescription1` (
  `prescription_id` int(11) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `patient_email` varchar(50) NOT NULL,
  `patient_prescription` longtext NOT NULL,
  `prescription_datetime` datetime(6) NOT NULL,
  `dr_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription1`
--

INSERT INTO `prescription1` (`prescription_id`, `patient_name`, `patient_email`, `patient_prescription`, `prescription_datetime`, `dr_id_id`, `user_id_id`) VALUES
(1, 'tara', 'tara3844@gmail.com', 'b\'gAAAAABib8MWuIjsg-zhTgz_w_oRbpqlgjI9BJp3X9cft8Zbe871IXuhT4CKJ6EYjqKw1SsuM10XpL8VrTUSoxEMEsgMii-UYQ==\'', '2022-05-02 11:40:06.276963', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prescription2`
--

CREATE TABLE `prescription2` (
  `prescription_id` int(11) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `patient_email` varchar(50) NOT NULL,
  `patient_prescription` longtext NOT NULL,
  `prescription_datetime` datetime(6) NOT NULL,
  `dr_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription2`
--

INSERT INTO `prescription2` (`prescription_id`, `patient_name`, `patient_email`, `patient_prescription`, `prescription_datetime`, `dr_id_id`, `user_id_id`) VALUES
(1, 'tara', 'tara3844@gmail.com', 'b\'gAAAAABib8MWuIjsg-zhTgz_w_oRbpqlgjI9BJp3X9cft8Zbe871IXuhT4CKJ6EYjqKw1SsuM10XpL8VrTUSoxEMEsgMii-UYQ==\'', '2022-05-02 11:40:06.280954', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prescription3`
--

CREATE TABLE `prescription3` (
  `prescription_id` int(11) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `patient_email` varchar(50) NOT NULL,
  `patient_prescription` longtext NOT NULL,
  `prescription_datetime` datetime(6) NOT NULL,
  `dr_id_id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription3`
--

INSERT INTO `prescription3` (`prescription_id`, `patient_name`, `patient_email`, `patient_prescription`, `prescription_datetime`, `dr_id_id`, `user_id_id`) VALUES
(1, 'tara', 'tara3844@gmail.com', 'b\'gAAAAABib8MWuIjsg-zhTgz_w_oRbpqlgjI9BJp3X9cft8Zbe871IXuhT4CKJ6EYjqKw1SsuM10XpL8VrTUSoxEMEsgMii-UYQ==\'', '2022-05-02 11:40:06.284947', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_mobile` varchar(14) NOT NULL,
  `user_password` varchar(500) NOT NULL,
  `user_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_mobile`, `user_password`, `user_address`) VALUES
(1, 'tara', 'tara3844@gmail.com', '+9921827945', 'krishna', 'mumbai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_dr_id_id_d34f29d3_fk_doctor_dr_id` (`dr_id_id`),
  ADD KEY `appointment_user_id_id_e1ab344c_fk_user_user_id` (`user_id_id`);

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
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`dr_id`),
  ADD UNIQUE KEY `dr_email` (`dr_email`),
  ADD UNIQUE KEY `dr_mobile` (`dr_mobile`),
  ADD KEY `doctor_dr_name_1b9bf9_idx` (`dr_name`),
  ADD KEY `doctor_dr_educ_c0a230_idx` (`dr_education_id`);

--
-- Indexes for table `doctor_education`
--
ALTER TABLE `doctor_education`
  ADD PRIMARY KEY (`dr_education_id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`pharmacy_id`),
  ADD UNIQUE KEY `pharmacy_email` (`pharmacy_email`),
  ADD UNIQUE KEY `pharmacy_mobile` (`pharmacy_mobile`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `prescription_dr_id_id_d5d484d2_fk_doctor_dr_id` (`dr_id_id`),
  ADD KEY `prescription_user_id_id_459527b1_fk_user_user_id` (`user_id_id`);

--
-- Indexes for table `prescription1`
--
ALTER TABLE `prescription1`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `prescription1_dr_id_id_22c7e86d_fk_doctor_dr_id` (`dr_id_id`),
  ADD KEY `prescription1_user_id_id_241aa820_fk_user_user_id` (`user_id_id`);

--
-- Indexes for table `prescription2`
--
ALTER TABLE `prescription2`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `prescription2_dr_id_id_900b17e8_fk_doctor_dr_id` (`dr_id_id`),
  ADD KEY `prescription2_user_id_id_f592d445_fk_user_user_id` (`user_id_id`);

--
-- Indexes for table `prescription3`
--
ALTER TABLE `prescription3`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `prescription3_dr_id_id_9296c608_fk_doctor_dr_id` (`dr_id_id`),
  ADD KEY `prescription3_user_id_id_07b63e0e_fk_user_user_id` (`user_id_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_mobile` (`user_mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `dr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_education`
--
ALTER TABLE `doctor_education`
  MODIFY `dr_education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `pharmacy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription1`
--
ALTER TABLE `prescription1`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription2`
--
ALTER TABLE `prescription2`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription3`
--
ALTER TABLE `prescription3`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_dr_id_id_d34f29d3_fk_doctor_dr_id` FOREIGN KEY (`dr_id_id`) REFERENCES `doctor` (`dr_id`),
  ADD CONSTRAINT `appointment_user_id_id_e1ab344c_fk_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`user_id`);

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

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_dr_education_id_d6ace925_fk_doctor_ed` FOREIGN KEY (`dr_education_id`) REFERENCES `doctor_education` (`dr_education_id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_dr_id_id_d5d484d2_fk_doctor_dr_id` FOREIGN KEY (`dr_id_id`) REFERENCES `doctor` (`dr_id`),
  ADD CONSTRAINT `prescription_user_id_id_459527b1_fk_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `prescription1`
--
ALTER TABLE `prescription1`
  ADD CONSTRAINT `prescription1_dr_id_id_22c7e86d_fk_doctor_dr_id` FOREIGN KEY (`dr_id_id`) REFERENCES `doctor` (`dr_id`),
  ADD CONSTRAINT `prescription1_user_id_id_241aa820_fk_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `prescription2`
--
ALTER TABLE `prescription2`
  ADD CONSTRAINT `prescription2_dr_id_id_900b17e8_fk_doctor_dr_id` FOREIGN KEY (`dr_id_id`) REFERENCES `doctor` (`dr_id`),
  ADD CONSTRAINT `prescription2_user_id_id_f592d445_fk_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `prescription3`
--
ALTER TABLE `prescription3`
  ADD CONSTRAINT `prescription3_dr_id_id_9296c608_fk_doctor_dr_id` FOREIGN KEY (`dr_id_id`) REFERENCES `doctor` (`dr_id`),
  ADD CONSTRAINT `prescription3_user_id_id_07b63e0e_fk_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
