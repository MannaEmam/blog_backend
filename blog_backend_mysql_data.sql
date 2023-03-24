-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2023 at 10:32 PM
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
-- Database: `blog_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication_user`
--

CREATE TABLE `authentication_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(5) NOT NULL,
  `status` varchar(5) NOT NULL,
  `created_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authentication_user`
--

INSERT INTO `authentication_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`, `status`, `created_by_id`) VALUES
(1, 'pbkdf2_sha256$260000$wst3T7oEr0680jR0EkidG5$G+33zInJOzjXMIxBDES5nFP9qLQYveqrH98P+wjr1yk=', '2023-03-24 18:50:34.147020', 1, 'super', '', '', '', 1, 1, '2023-03-24 17:17:16.066037', 'US', 'A', NULL),
(2, 'pbkdf2_sha256$260000$YxnCKDgObJNkGIYgNXhpMY$9xeEa0QaqC4hxup3Pam48f3ApkgPD5RurPJEoFqkLBk=', NULL, 0, 'admin', 'tye', '', '', 0, 1, '2023-03-24 17:17:53.064584', 'AD', 'A', NULL),
(3, 'pbkdf2_sha256$260000$GsBa7HWxFFB1ZyCgX4uaOX$vUSAPnCM/5Nbzwv2gtXD5dZwIMnjUCVjD7d2RyPu2nc=', NULL, 0, 'mod', 'new', '', '', 0, 1, '2023-03-24 17:18:30.274173', 'MD', 'A', NULL),
(4, 'pbkdf2_sha256$260000$P3D5NrFtl9rjwL7IC2MYgq$8AmmRlmqRl1RQFSYb250qzeMl0xao87ABklOXq86ajs=', NULL, 0, 'user1', '', '', '', 0, 1, '2023-03-24 17:50:12.038403', 'US', 'A', NULL),
(5, 'pbkdf2_sha256$260000$XpVjblUd6ALPc5h65SLT2m$k8wHexRPJNK97K5jbB/g2LtwBtQ1FvxuyHv1uLCZEjU=', NULL, 0, 'user2', '', '', '', 0, 1, '2023-03-24 17:50:18.462688', 'US', 'A', NULL),
(6, 'pbkdf2_sha256$260000$wiAeU9Fz53P0wZP9KP0meV$cxgZVAVVN1o0TQ3qYkxObh58znr9jgoAU30nkxuVi8I=', NULL, 0, 'user3', '', '', '', 0, 1, '2023-03-24 17:50:25.934177', 'US', 'A', NULL),
(7, 'pbkdf2_sha256$260000$FMCX24VHueWBK52jnLvT5M$xQgv3hqlQVRcCZww7CcX801IT4kg+SK9Gqu4s5hTz60=', NULL, 0, 'user4', '', '', '', 0, 1, '2023-03-24 17:50:32.567128', 'US', 'A', NULL),
(8, 'pbkdf2_sha256$260000$pLfSfpvUvyMKFqbke1vS7W$o1/EN31n2Fshq/WFK3DrL9agSluWuOnknz8rsPYgFAI=', NULL, 0, 'user5', '', '', '', 0, 1, '2023-03-24 17:50:39.098113', 'US', 'A', NULL),
(9, 'pbkdf2_sha256$260000$7ABP5aEdXneYlQyaS79pKA$DnfErVEFipvxq+tXpKSePOky2tcU8zKV+AeOE0J9MU8=', NULL, 0, 'user6', '', '', '', 0, 1, '2023-03-24 17:50:47.669623', 'US', 'A', NULL),
(10, 'pbkdf2_sha256$260000$6FPJQuHuh9Z7ybBP4ON9Jg$+hffy5BCwdmhJY7cAaDLxMk94e+lzta3P7OF3oNhAek=', NULL, 0, 'user7', '', '', '', 0, 1, '2023-03-24 17:50:54.595623', 'US', 'A', NULL),
(11, 'pbkdf2_sha256$260000$VOCLpDVrQtHApt8SCzMeNA$ndGj0HGYXAsbdFWnEFBwYTrCSlrjoqNPHBMFGNMAQtQ=', NULL, 0, 'user8', '', '', '', 0, 1, '2023-03-24 17:51:01.646348', 'US', 'A', NULL),
(12, 'pbkdf2_sha256$260000$pa3U4y5kJtYAQIPNWi1ZV8$DiQ02FX+JYAU8/N1GvTXUerixAuXTmclbLiMkx8xPsU=', NULL, 0, 'user9', '', '', '', 0, 1, '2023-03-24 17:51:11.265584', 'US', 'A', NULL),
(13, 'pbkdf2_sha256$260000$4LDNy1cozdkuvpikAIWD85$9468PQSpFvdCWCFaehc34NzpTYHOXZiPtOZ7b3eP1PY=', NULL, 0, 'user10', 'test', '', '', 0, 1, '2023-03-24 17:51:18.225060', 'US', 'A', NULL),
(14, 'pbkdf2_sha256$260000$497i13S7z17LBPoEc6ilAW$sIVbL0SYyDGTfNjHxaoBQHaazkVpO2TadNYSE7H1H2w=', NULL, 0, 'user11', '', '', '', 0, 1, '2023-03-25 01:08:39.021644', 'US', 'A', NULL),
(15, 'pbkdf2_sha256$260000$1rjMGenlglNO87JFPQZbDl$cqKjm233zWjoIR5FE7OidWqZvn9dlKPMgAUNiSiX61Q=', NULL, 0, 'moderator', '', '', '', 0, 1, '2023-03-25 03:09:28.975271', 'US', 'A', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authentication_user_groups`
--

CREATE TABLE `authentication_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authentication_user_user_permissions`
--

CREATE TABLE `authentication_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('39916e376df1cdcf41b22fb76ec6e47a8a99afef', '2023-03-24 17:50:26.333032', 6),
('4de666721533d9b1b91ef6718630ce798312c5db', '2023-03-24 17:51:02.056822', 11),
('5848f069d2281379328ac3512de49b7fdceb071b', '2023-03-25 01:08:39.858601', 14),
('b44c07092c4068845ba55c9c27185c1a2e93f7d1', '2023-03-24 17:50:12.734042', 4),
('b51e9e6e8dae005649dfdfcaf3412a68a67e75ca', '2023-03-24 17:50:32.956348', 7),
('b93fab6c3e5b2c0ecdb42b82c649f6b8f49d29ec', '2023-03-24 17:51:18.646517', 13),
('d978c6a9b62ad589d67f6b6c046c6d3e1164400d', '2023-03-24 17:51:11.647461', 12),
('e5ab170ef8b5339fe41afb7af7d0c5e06e5a7191', '2023-03-24 17:50:55.033270', 10),
('e8bf8a138e89ee10802a8e4ee09618a65d65490b', '2023-03-24 17:50:39.531870', 8),
('ea4d61012d98fa0406ae0b0a67d9302ad58fd840', '2023-03-24 17:50:18.833145', 5),
('f45b62a31654fefacc287eae3b47390c8d22162c', '2023-03-24 17:50:48.066631', 9),
('f4764f3832223d0f172c4c5a04a294a0882ddc5b', '2023-03-25 03:09:29.634516', 15),
('f75509de33718468f9d9fd37d3bae2a24c4b5b87', '2023-03-24 17:18:30.755892', 3),
('f8b91ebeb03e712593e0dcea7645ab1baf9bc806', '2023-03-24 17:17:53.444269', 2),
('fd6838f2c1c60548d75cfbe2980fd716309d5445', '2023-03-24 17:17:16.389240', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add content type', 3, 'add_contenttype'),
(10, 'Can change content type', 3, 'change_contenttype'),
(11, 'Can delete content type', 3, 'delete_contenttype'),
(12, 'Can view content type', 3, 'view_contenttype'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add post', 5, 'add_post'),
(18, 'Can change post', 5, 'change_post'),
(19, 'Can delete post', 5, 'delete_post'),
(20, 'Can view post', 5, 'view_post'),
(21, 'Can add comment', 6, 'add_comment'),
(22, 'Can change comment', 6, 'change_comment'),
(23, 'Can delete comment', 6, 'delete_comment'),
(24, 'Can view comment', 6, 'view_comment'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add token', 8, 'add_tokenproxy'),
(30, 'Can change token', 8, 'change_tokenproxy'),
(31, 'Can delete token', 8, 'delete_tokenproxy'),
(32, 'Can view token', 8, 'view_tokenproxy'),
(33, 'Can add log entry', 9, 'add_logentry'),
(34, 'Can change log entry', 9, 'change_logentry'),
(35, 'Can delete log entry', 9, 'delete_logentry'),
(36, 'Can view log entry', 9, 'view_logentry'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `body`, `created_at`, `updated_at`, `created_by_id`, `post_id`) VALUES
(1, 'user 10', '2023-03-24 19:10:52.967803', '2023-03-25 03:14:30.846006', 4, 1),
(2, 'sdfsdags', '2023-03-24 19:11:19.293746', '2023-03-24 19:11:19.293746', 5, 1),
(4, 'sdfsdags', '2023-03-24 19:44:23.885601', '2023-03-24 19:44:23.885601', 8, 1),
(5, 'sdfsdags', '2023-03-24 19:44:28.744508', '2023-03-24 19:44:28.744508', 8, 1),
(6, 'sdfsdags', '2023-03-24 19:44:31.973081', '2023-03-24 19:44:31.973081', 9, 1),
(7, 'sdfsdags', '2023-03-24 19:44:34.989658', '2023-03-24 19:44:34.989658', 10, 1),
(8, 'sdfsdags', '2023-03-24 19:45:17.411492', '2023-03-24 19:45:17.411492', 11, 1),
(9, 'sdfsdags', '2023-03-24 19:45:22.576363', '2023-03-24 19:45:22.576363', 12, 1),
(10, 'sdfsdags', '2023-03-24 19:45:26.351882', '2023-03-24 19:45:26.351882', 13, 1),
(11, 'user 10', '2023-03-24 21:01:56.111611', '2023-03-25 03:14:01.027497', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `article` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `view_count` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `updated_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `title`, `article`, `created_at`, `updated_at`, `view_count`, `author_id`, `updated_by_id`) VALUES
(1, 'afhd', 'secfsadgfond', '2023-03-24 18:09:07.068126', '2023-03-24 18:09:07.068126', 102, 4, NULL),
(2, 'afhfsdd', 'secfsadgsfsffond', '2023-03-24 18:09:16.635253', '2023-03-24 18:53:40.354946', 0, 5, 3),
(3, 'fsd', 'secfsadgfdssfsffond', '2023-03-24 18:09:26.784194', '2023-03-24 18:53:52.892117', 0, 6, 2),
(4, 'd', 'fgsd', '2023-03-24 18:10:13.663977', '2023-03-24 18:54:04.831609', 0, 7, 1),
(5, 'dg', 'fgsdd', '2023-03-24 18:10:30.025948', '2023-03-24 18:54:23.174103', 0, 8, 3),
(6, 'tes', 'sdfaf', '2023-03-24 19:08:20.824643', '2023-03-24 19:08:20.824643', 0, 9, NULL),
(7, 'safj', 'sdfa', '2023-03-24 19:08:40.392603', '2023-03-24 19:08:40.392603', 0, 10, NULL),
(8, 'quweer', 'dssafsfag', '2023-03-24 19:08:54.534431', '2023-03-24 19:09:23.444725', 0, 11, 11),
(9, 'treat', 'sjfofjmfsd', '2023-03-24 19:09:43.556602', '2023-03-24 19:09:43.556602', 0, 12, NULL),
(10, 'sfadfgsdfg', 'sfgsfgwefwef', '2023-03-24 19:09:55.839730', '2023-03-24 19:09:55.839730', 0, 13, NULL),
(11, 'tesa', 'agsdgsgrhwerhbeaghrwihgkwrh', '2023-03-25 01:11:12.547708', '2023-03-25 01:11:12.547708', 0, 14, NULL);

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-24 18:53:40.499607', '2', 'afhfsdd', 2, '[{\"changed\": {\"fields\": [\"Author\", \"Updated by\"]}}]', 5, 1),
(2, '2023-03-24 18:53:52.923208', '3', 'fsd', 2, '[{\"changed\": {\"fields\": [\"Author\", \"Updated by\"]}}]', 5, 1),
(3, '2023-03-24 18:54:04.872573', '4', 'd', 2, '[{\"changed\": {\"fields\": [\"Author\", \"Updated by\"]}}]', 5, 1),
(4, '2023-03-24 18:54:23.182118', '5', 'dg', 2, '[{\"changed\": {\"fields\": [\"Author\", \"Updated by\"]}}]', 5, 1),
(5, '2023-03-24 19:09:23.739444', '8', 'quweer', 2, '[{\"changed\": {\"fields\": [\"Author\", \"Updated by\"]}}]', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'admin', 'logentry'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(4, 'authentication', 'user'),
(7, 'authtoken', 'token'),
(8, 'authtoken', 'tokenproxy'),
(6, 'blog', 'comment'),
(5, 'blog', 'post'),
(3, 'contenttypes', 'contenttype'),
(10, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-24 16:51:58.944411'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-03-24 16:51:59.484340'),
(3, 'auth', '0001_initial', '2023-03-24 16:52:02.439504'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-03-24 16:52:03.047050'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-03-24 16:52:03.139410'),
(6, 'auth', '0004_alter_user_username_opts', '2023-03-24 16:52:03.221712'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-03-24 16:52:03.391387'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-03-24 16:52:03.414464'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-03-24 16:52:03.487767'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-03-24 16:52:03.513832'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-03-24 16:52:03.548076'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-03-24 16:52:03.625669'),
(13, 'auth', '0011_update_proxy_permissions', '2023-03-24 16:52:03.653656'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-03-24 16:52:03.685660'),
(15, 'authentication', '0001_initial', '2023-03-24 16:52:08.571232'),
(16, 'blog', '0001_initial', '2023-03-24 16:52:36.525612'),
(17, 'blog', '0002_auto_20230322_2217', '2023-03-24 16:52:42.947509'),
(18, 'blog', '0003_delete_user', '2023-03-24 16:52:43.293395'),
(19, 'admin', '0001_initial', '2023-03-24 16:53:19.479133'),
(20, 'admin', '0002_logentry_remove_auto_add', '2023-03-24 16:53:19.512907'),
(21, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-24 16:53:19.546062'),
(22, 'authtoken', '0001_initial', '2023-03-24 16:53:20.755749'),
(23, 'authtoken', '0002_auto_20160226_1747', '2023-03-24 16:53:20.878468'),
(24, 'authtoken', '0003_tokenproxy', '2023-03-24 16:53:21.006705'),
(25, 'sessions', '0001_initial', '2023-03-24 16:53:21.357155');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('jnimhvx5uh9rs73w4r11g9mkaw12mn38', '.eJxVjMsOwiAQRf-FtSFgGR4u3fcbyMwAUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSpyQuQovT70bIj9x2kO7YbrPkua3LRHJX5EG7HOeUn9fD_Tuo2Ou3LqxtGZAVKbCpWG0wIHNW3iZPZ2uSD5nRa8gKAIJy5Aw6pEKDcg7E-wP9zTgw:1pfgsM:WsKJrB0Pq9VjmxC1HYfXyx0b8N8WqoRxY_IL7aIFi0o', '2023-04-07 18:50:34.188962');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication_user`
--
ALTER TABLE `authentication_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `authentication_user_created_by_id_d3f2a616_fk_authentic` (`created_by_id`);

--
-- Indexes for table `authentication_user_groups`
--
ALTER TABLE `authentication_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentication_user_groups_user_id_group_id_8af031ac_uniq` (`user_id`,`group_id`),
  ADD KEY `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `authentication_user_user_permissions`
--
ALTER TABLE `authentication_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authentication_user_user_user_id_permission_id_ec51b09f_uniq` (`user_id`,`permission_id`),
  ADD KEY `authentication_user__permission_id_ea6be19a_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_created_by_id_bb8e38a4_fk_authentication_user_id` (`created_by_id`),
  ADD KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_author_id_dd7a8485_fk_authentication_user_id` (`author_id`),
  ADD KEY `blog_post_updated_by_id_022b627c_fk_authentication_user_id` (`updated_by_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_authentication_user_id` (`user_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authentication_user`
--
ALTER TABLE `authentication_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `authentication_user_groups`
--
ALTER TABLE `authentication_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authentication_user_user_permissions`
--
ALTER TABLE `authentication_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authentication_user`
--
ALTER TABLE `authentication_user`
  ADD CONSTRAINT `authentication_user_created_by_id_d3f2a616_fk_authentic` FOREIGN KEY (`created_by_id`) REFERENCES `authentication_user` (`id`);

--
-- Constraints for table `authentication_user_groups`
--
ALTER TABLE `authentication_user_groups`
  ADD CONSTRAINT `authentication_user__user_id_30868577_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`),
  ADD CONSTRAINT `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `authentication_user_user_permissions`
--
ALTER TABLE `authentication_user_user_permissions`
  ADD CONSTRAINT `authentication_user__permission_id_ea6be19a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `authentication_user__user_id_736ebf7e_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_authentication_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`);

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
-- Constraints for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `blog_comment_created_by_id_bb8e38a4_fk_authentication_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `authentication_user` (`id`),
  ADD CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`);

--
-- Constraints for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `blog_post_author_id_dd7a8485_fk_authentication_user_id` FOREIGN KEY (`author_id`) REFERENCES `authentication_user` (`id`),
  ADD CONSTRAINT `blog_post_updated_by_id_022b627c_fk_authentication_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `authentication_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentication_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
