-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 06:31 PM
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
-- Database: `trivia_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_22_143248_create_quiz_attempts_table', 1),
(5, '2024_05_22_143301_create_questions_table', 1),
(6, '2024_05_22_144645_create_personal_access_tokens_table', 2),
(7, '2024_05_22_215416_add_questions_to_quiz_attempts_table', 3),
(8, '2024_05_22_223401_update_questions_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'authToken', 'deb2f9aa714c0ca68d4243570e90bdc3b39212cb8c731316dbdcfe1978cbc1d0', '[\"*\"]', NULL, NULL, '2024-05-22 19:44:06', '2024-05-22 19:44:06'),
(2, 'App\\Models\\User', 2, 'authToken', '58a68fd4c3441cfee77c3234831ce5b8f03966043b5ad7e87b20840fe679f159', '[\"*\"]', NULL, NULL, '2024-05-22 19:45:14', '2024-05-22 19:45:14'),
(3, 'App\\Models\\User', 3, 'authToken', 'de06566ba9666d684162f1e3546fbd9f7b019c588e6dcbc6aba51c70f555a795', '[\"*\"]', NULL, NULL, '2024-05-24 08:53:31', '2024-05-24 08:53:31'),
(4, 'App\\Models\\User', 3, 'authToken', 'd7e0bdfdbe3c9856f9143bf0487647757a5dbb69736f0fd88bb9ba6301bda4c7', '[\"*\"]', NULL, NULL, '2024-05-24 09:01:04', '2024-05-24 09:01:04'),
(5, 'App\\Models\\User', 3, 'authToken', '6d6a22d245c551944b580ea40a9c6ba628f4630eb7253f9d98c3cb18986deff1', '[\"*\"]', NULL, NULL, '2024-05-24 09:01:43', '2024-05-24 09:01:43'),
(6, 'App\\Models\\User', 3, 'authToken', 'f4f2f6bbd476d647e9e9ca3ea6dc44ea7241704d7071c029fb30731162a233b9', '[\"*\"]', NULL, NULL, '2024-05-24 09:02:20', '2024-05-24 09:02:20'),
(7, 'App\\Models\\User', 4, 'authToken', '644cef079c4aebf6d263ca97a6a3554a59cce43c11ea01b948b42b13008a3f71', '[\"*\"]', NULL, NULL, '2024-05-24 09:08:54', '2024-05-24 09:08:54'),
(8, 'App\\Models\\User', 4, 'authToken', 'e1c8ca43174ebb4bc7c7ab1c7d10673ad1b9e595ac91492357866770ce06a97c', '[\"*\"]', NULL, NULL, '2024-05-24 09:10:54', '2024-05-24 09:10:54'),
(9, 'App\\Models\\User', 4, 'authToken', 'e40847dab573250b0499153398654ab157a09f94c04aa2715f166dffc9dd236b', '[\"*\"]', NULL, NULL, '2024-05-24 09:11:38', '2024-05-24 09:11:38'),
(10, 'App\\Models\\User', 4, 'authToken', '6ca8c5386789ec050f1e4a36e2b959feae24388fb387d6818a8deaa60473d1d0', '[\"*\"]', NULL, NULL, '2024-05-24 09:12:05', '2024-05-24 09:12:05'),
(11, 'App\\Models\\User', 4, 'authToken', '878c3d8757dcb785d513f663682c94376462a0b109b963b593eb4f013eabee47', '[\"*\"]', NULL, NULL, '2024-05-24 09:12:57', '2024-05-24 09:12:57'),
(12, 'App\\Models\\User', 4, 'authToken', 'd48f18858d144cd780a65d7dbdcdd993e8191f2f386648f92cd95e708604a0be', '[\"*\"]', NULL, NULL, '2024-05-24 09:17:30', '2024-05-24 09:17:30'),
(13, 'App\\Models\\User', 4, 'auth_token', '1bdb58c966059ae845838ca67217476d0418050b8d45ac59e01160af2827e821', '[\"*\"]', NULL, NULL, '2024-05-24 09:29:18', '2024-05-24 09:29:18'),
(14, 'App\\Models\\User', 6, 'auth_token', 'df7cef1f45bb7328b6b90bd98c2ebf91addf10758f70d2b417f8842f698e5f1e', '[\"*\"]', NULL, NULL, '2024-05-24 09:34:33', '2024-05-24 09:34:33'),
(15, 'App\\Models\\User', 7, 'auth_token', '37aebee11dd6afbf2099fee20e1d61c36fe078b1194b4622388b393aaffa9df6', '[\"*\"]', NULL, NULL, '2024-05-24 09:45:04', '2024-05-24 09:45:04'),
(16, 'App\\Models\\User', 8, 'auth_token', '6a23707d1cce88952760e81dc02aa51a440ac714c2f80a4071a93768f2024903', '[\"*\"]', NULL, NULL, '2024-05-24 09:58:00', '2024-05-24 09:58:00'),
(18, 'App\\Models\\User', 10, 'auth_token', '27bf71d8fd937636de6cdb404343a3bbd88bca1440734af3e501c2637b47059a', '[\"*\"]', '2024-05-24 15:41:44', NULL, '2024-05-24 10:38:39', '2024-05-24 15:41:44'),
(39, 'App\\Models\\User', 11, 'auth_token', 'fb18af90b14259307bad4078ea9f5714f9e58ec219ef5a0534e0c909c597c0bd', '[\"*\"]', NULL, NULL, '2024-05-24 20:47:02', '2024-05-24 20:47:02'),
(42, 'App\\Models\\User', 13, 'auth_token', 'cabb6c0067b53ea82523ad3a534ebab3bebc0c6972db331886511c8c9f5d4e8c', '[\"*\"]', NULL, NULL, '2024-05-24 20:57:41', '2024-05-24 20:57:41'),
(43, 'App\\Models\\User', 13, 'auth_token', 'ad6259818236cf69517b44a592625407dadf23d2f50f0e3ac3a3bf1649013ccc', '[\"*\"]', NULL, NULL, '2024-05-24 20:57:43', '2024-05-24 20:57:43'),
(44, 'App\\Models\\User', 14, 'auth_token', 'a127bbc3ac6ef4e3fa30d8578e1f70a10bf7e9e47c0542b81dd63bfe4062263d', '[\"*\"]', NULL, NULL, '2024-05-24 21:03:09', '2024-05-24 21:03:09'),
(45, 'App\\Models\\User', 14, 'auth_token', '57a84d99b2d17e29b0b717b3a7bb6f0b1c609b61fe9e4439f5dfcf99b0100d06', '[\"*\"]', NULL, NULL, '2024-05-24 21:03:10', '2024-05-24 21:03:10'),
(46, 'App\\Models\\User', 9, 'auth_token', '9f1582cefdd8fb2638e36b79dfe01ce7b97a9cb324a58b54b271120cd9fcfff2', '[\"*\"]', NULL, NULL, '2024-05-24 21:14:59', '2024-05-24 21:14:59'),
(47, 'App\\Models\\User', 15, 'auth_token', 'e3b3d8950d2658fab754aacea763b82dea0fd524871d805ac5486fd7bf0b401e', '[\"*\"]', NULL, NULL, '2024-05-24 21:15:22', '2024-05-24 21:15:22'),
(48, 'App\\Models\\User', 15, 'auth_token', '0a33fd10e5ac46eaf4a805457110120b5e437a17dfe04ee93f8de997603f7125', '[\"*\"]', NULL, NULL, '2024-05-24 21:15:23', '2024-05-24 21:15:23'),
(49, 'App\\Models\\User', 16, 'auth_token', '10ee4de406a011754224d92580acd7e4085ed4132f32af1fb471aa0e7ba04040', '[\"*\"]', NULL, NULL, '2024-05-24 21:19:09', '2024-05-24 21:19:09'),
(50, 'App\\Models\\User', 16, 'auth_token', '43e701281795afe44eab11d1d0c3bc414a00b979cf0af1f94bc074a8ace8a825', '[\"*\"]', NULL, NULL, '2024-05-24 21:19:11', '2024-05-24 21:19:11'),
(51, 'App\\Models\\User', 17, 'auth_token', '90b7ca5708fd9ff932fbcbdc04ec77636d76201d1db6ab66281e45a00cb60a36', '[\"*\"]', NULL, NULL, '2024-05-24 21:19:55', '2024-05-24 21:19:55'),
(52, 'App\\Models\\User', 17, 'auth_token', '96672a49afb04d9e54282b801f68eb35e938b535df6aca3129da302b41c15dd2', '[\"*\"]', NULL, NULL, '2024-05-24 21:19:57', '2024-05-24 21:19:57'),
(53, 'App\\Models\\User', 18, 'auth_token', 'edbe9fede3560c2ae9f4c8d01808b32b5ffb241e2047d928500be99eefbc56ae', '[\"*\"]', NULL, NULL, '2024-05-24 21:23:08', '2024-05-24 21:23:08'),
(54, 'App\\Models\\User', 18, 'auth_token', '1698e275d113f8c389570249993fc3b7cec02eb8df82e3db9f06ffd53797adb7', '[\"*\"]', NULL, NULL, '2024-05-24 21:23:10', '2024-05-24 21:23:10'),
(55, 'App\\Models\\User', 19, 'auth_token', '7816a5ea2e2025f0f32a2fc1da1406170664b0d9881b260d355e585210959bb9', '[\"*\"]', NULL, NULL, '2024-05-24 21:24:50', '2024-05-24 21:24:50'),
(56, 'App\\Models\\User', 19, 'auth_token', '0b8b0843f75f0d2fa8e9f95a0e772d20b10ed86171587f476095acaf63a48a35', '[\"*\"]', NULL, NULL, '2024-05-24 21:24:51', '2024-05-24 21:24:51'),
(57, 'App\\Models\\User', 20, 'auth_token', '2a1f903b9c8fc450ca7cec534638cc1d4966e0f9985d87897022c9697647b0de', '[\"*\"]', NULL, NULL, '2024-05-24 21:25:28', '2024-05-24 21:25:28'),
(58, 'App\\Models\\User', 20, 'auth_token', '06c81a1ffc69367cdf6f005863556a876fa11d70f56a763180be21895477b301', '[\"*\"]', NULL, NULL, '2024-05-24 21:25:30', '2024-05-24 21:25:30'),
(59, 'App\\Models\\User', 21, 'auth_token', 'a103da81093caa8e556ad9b376b780f3956264923e59cd903f8ee39c8147527a', '[\"*\"]', NULL, NULL, '2024-05-24 21:26:19', '2024-05-24 21:26:19'),
(60, 'App\\Models\\User', 21, 'auth_token', 'd1c1a62ba39439a642302f35b45a247f1b89b393eaf4e46417e626969e91de3c', '[\"*\"]', '2024-05-24 22:03:25', NULL, '2024-05-24 21:26:20', '2024-05-24 22:03:25'),
(61, 'App\\Models\\User', 22, 'auth_token', 'c8d558879b008f94a7cf1a828ce3c208ee94b6469ed7908ab4ee4f78fe3ad758', '[\"*\"]', NULL, NULL, '2024-05-26 07:07:03', '2024-05-26 07:07:03'),
(62, 'App\\Models\\User', 22, 'auth_token', '8543888fb935805e138b681e4d63e3b34ff37813df5120f362262614b26a6201', '[\"*\"]', NULL, NULL, '2024-05-26 07:07:04', '2024-05-26 07:07:04'),
(63, 'App\\Models\\User', 22, 'auth_token', 'e7706f7d672b9bb221142e40c9dd260a1d746d774858256857c6d8570e91d3be', '[\"*\"]', NULL, NULL, '2024-05-26 07:59:05', '2024-05-26 07:59:05'),
(64, 'App\\Models\\User', 22, 'auth_token', '69c1d417f09f5e3f67ff33d68619e2cc613a126b7f4ecf4d081070776afaf7b2', '[\"*\"]', '2024-05-26 08:36:16', NULL, '2024-05-26 08:23:13', '2024-05-26 08:36:16'),
(65, 'App\\Models\\User', 22, 'auth_token', 'bb6c60991011ff61869c1866907fb26a74942a5aa5e9f88d78038d84d1b485c2', '[\"*\"]', NULL, NULL, '2024-05-26 08:37:04', '2024-05-26 08:37:04'),
(66, 'App\\Models\\User', 22, 'auth_token', '7ad2cffbb4d500b011983b6ad82354c5f972b4269857498c44b4ed6a5d7f1855', '[\"*\"]', '2024-05-26 08:52:26', NULL, '2024-05-26 08:38:00', '2024-05-26 08:52:26'),
(67, 'App\\Models\\User', 22, 'auth_token', 'f10bffa594a957d7c88ee943ce707b05ff17b91816236eead1565986894e9275', '[\"*\"]', '2024-05-26 08:56:33', NULL, '2024-05-26 08:52:54', '2024-05-26 08:56:33'),
(68, 'App\\Models\\User', 22, 'auth_token', '944f7865e81749121bf299e52d4ab9df2b49137b3a2b3e6ad930196ded46eb03', '[\"*\"]', '2024-05-26 09:28:18', NULL, '2024-05-26 08:57:23', '2024-05-26 09:28:18'),
(69, 'App\\Models\\User', 22, 'auth_token', 'e98bae5f9e66c12d2cf61d738038d38ff6b395961928f1da9db1655466e0465f', '[\"*\"]', '2024-05-26 12:42:49', NULL, '2024-05-26 09:32:34', '2024-05-26 12:42:49'),
(70, 'App\\Models\\User', 22, 'auth_token', '09e7a6ec4f60abe7a11ebe110659103b38ec4373d0761c5b2184c8258e6f7ac7', '[\"*\"]', '2024-05-26 13:01:06', NULL, '2024-05-26 12:43:08', '2024-05-26 13:01:06'),
(71, 'App\\Models\\User', 23, 'auth_token', 'ac5937aa2acbca8102936657586b1813c58dba7e46217c0a00673c27cb94d778', '[\"*\"]', NULL, NULL, '2024-05-26 13:03:25', '2024-05-26 13:03:25'),
(72, 'App\\Models\\User', 23, 'auth_token', '1ed21012a382820d70a9a750cd51183612caa9fa2ba5668a8a1e10419d074595', '[\"*\"]', '2024-05-26 14:24:18', NULL, '2024-05-26 13:03:26', '2024-05-26 14:24:18'),
(73, 'App\\Models\\User', 24, 'auth_token', 'cb42990a341f498ae43769c80dc4890fef65675803b39b277002eb11f6042c86', '[\"*\"]', NULL, NULL, '2024-05-26 14:28:52', '2024-05-26 14:28:52'),
(74, 'App\\Models\\User', 24, 'auth_token', '011dccff23f9a45b72a85fb29d870a2e60242937f387e9b8cffb3445504e730e', '[\"*\"]', '2024-05-26 14:29:50', NULL, '2024-05-26 14:28:54', '2024-05-26 14:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `questionType` varchar(255) NOT NULL,
  `answerSelectionType` varchar(255) NOT NULL,
  `messageForCorrectAnswer` text NOT NULL,
  `messageForIncorrectAnswer` text NOT NULL,
  `explanation` text NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `correct_answer`, `answers`, `created_at`, `updated_at`, `questionType`, `answerSelectionType`, `messageForCorrectAnswer`, `messageForIncorrectAnswer`, `explanation`, `point`) VALUES
(101, 'Which of these is not a layer in the OSI model for data communications?', '4', '[\"Transport Layer\",\"Application Layer\",\"Physical Layer\",\"Connection Layer\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(102, 'What is the Gray Wolf&#039;s scientific name?', '4', '[\"Canis Aureus\",\"Canis Lupus Lycaon\",\"Canis Latrans\",\"Canis Lupus\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(103, 'Which of these is NOT the name of a rival gang in the video game Saint&#039;s Row 2?', '3', '[\"The Sons of Samedi\",\"The Brotherhood\",\"The Zin Empire\",\"The Ronin\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(104, 'What did the Spanish autonomous community of Catalonia ban in 2010, that took effect in 2012?', '2', '[\"Fiestas\",\"Bullfighting\",\"Mariachi\",\"Flamenco\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(105, 'Who authored The Adventures of Tintin?', '1', '[\"Herg&eacute;\",\"Chic Young\",\"E.P. Jacobs\",\"Rin Tin Tin\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(106, 'In &quot;Call Of Duty: Zombies&quot;, completing which map&#039;s easter egg will reward you with the achievement, &quot;Time Travel Will Tell&quot;?', '3', '[\"Moon\",\"Ascension\",\"Shangri-La\",\"Die Rise\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(107, 'What is the official language of Brazil?', '4', '[\"Spanish\",\"English\",\"Brazilian\",\"Portugese\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(108, 'What is the name of Team Fortress 2&#039;s Heavy Weapons Guy&#039;s minigun?', '1', '[\"Sasha\",\"Diana\",\"Anna\",\"Betty\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(109, 'What is an alternative name for multiple personality disorder?', '3', '[\"Schizophrenia\",\"Body integrity identity disorder\",\"Dissociative identity disorder\",\"Identity crisis\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(110, 'How many years did the Hundred Years&#039; War last?', '4', '[\"90\",\"101\",\"100\",\"116\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(111, 'What is the main CPU is the Sega Mega Drive / Sega Genesis?', '4', '[\"Zilog Z80\",\"Yamaha YM2612\",\"Intel 8088\",\"Motorola 68000\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(112, 'By how many minutes are you late to work in &quot;Half-Life&quot;?', '1', '[\"30\",\"5\",\"60\",\"15\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(113, 'In &quot;Highschool DxD&quot;, what is the name of the item some humans are born with?', '4', '[\"Blessed Artifact\",\"Hallowed Relic\",\"Imperial Arm\",\"Sacred Gear\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(114, 'When did Lithuania declare independence from the Soviet Union?', '4', '[\"December 25th, 1991\",\"December 5th, 1991\",\"April 20th, 1989\",\"March 11th, 1990\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(115, '.rs is the top-level domain for what country?', '4', '[\"Russia\",\"Romania\",\"Rwanda\",\"Serbia\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(116, 'What genetic disease is caused by having an extra Y chromosome (XYY)?', '1', '[\"Jacob\'s Syndrome\",\"Klinefelter\'s Syndrome\",\"Turner\'s Syndrome\",\"Down Syndrome\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(117, 'Which of these is the name of an American psychedelic rock band formed in 2002 by Benjamin Goldwasser and Andrew VanWyngarden?', '1', '[\"MGMT\",\"SBTRKT\",\"STRFKR\",\"MSTRKRFT\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(118, 'What is the name of Manchester United&#039;s home stadium?', '4', '[\"City of Manchester Stadium\",\"St James Park\",\"Anfield\",\"Old Trafford\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(119, 'What mainly favored rifle is used by the Terrorists in Counter Strike: Global Offensive?', '2', '[\"CZ-75 AUTO\",\"AK-47\",\"AK-74\",\"M4A4\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(120, 'In Fallout 4, which type of power armor is first encountered in the early mission &quot;When Freedom Calls&quot; in a crashed Vertibird?', '1', '[\"T-45\",\"T-51\",\"T-60\",\"X-01\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(121, 'In &quot;Jurassic World&quot;, what is the name of the dinosaur that is a genetic hybrid?', '4', '[\"Pteranodon\",\"Tyrannosaurus Rex \",\"Mosasaurus\",\"Indominus Rex\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(122, 'Who designed the Chupa Chups logo?', '4', '[\"Andy Warhol\",\"Vincent van Gogh\",\"Pablo Picasso\",\"Salvador Dali\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(123, 'In the &quot;Jurassic Park&quot; universe, what is the name of the island that contains InGen&#039;s Site B?', '3', '[\"Isla Pena\",\"Isla Nublar\",\"Isla Sorna\",\"Isla Muerta\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(124, 'What is the name of the common, gun-toting enemies of the &quot;Oddworld&quot; video game series?', '4', '[\"Slogs\",\"Glukkons\",\"Scrabs\",\"Sligs\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(125, 'In Chess, the Queen has the combined movement of which two pieces?', '1', '[\"Bishop and Rook\",\"Rook and King\",\"Knight and Bishop\",\"King and Knight\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(126, 'In Terry Pratchett&#039;s Discworld novel &#039;Wyrd Sisters&#039;, which of these are not one of the three main witches?', '4', '[\"Magrat Garlick\",\"Granny Weatherwax\",\"Nanny Ogg\",\"Winny Hathersham\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(127, 'Which of the following car models has been badge-engineered (rebadged) the most?', '4', '[\"Suzuki Swift\",\"Chevy Camaro\",\"Holden Monaro\",\"Isuzu Trooper\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(128, 'The name of technology company HP stands for what?', '3', '[\"Hellman-Pohl\",\"Howard Packmann\",\"Hewlett-Packard\",\"Husker-Pollosk\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(129, 'In the &quot;Call Of Duty: Zombies&quot; map &quot;Origins&quot;, how many steps are there to upgrade a Staff?', '3', '[\"7\",\"5\",\"4\",\"3\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(130, 'Which of these is not a member of the virtual band Gorillaz?', '2', '[\"Noodle\",\"Phi Cypher\",\"Russel Hobbs\",\"Murdoc Niccals\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(131, 'In most FPS video games such as Counter-Strike, shooting which part of the body does the highest damage?', '3', '[\"Chest\",\"Arm\",\"Head\",\"Leg\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(132, 'In most traditions, who was the wife of Zeus?', '4', '[\"Athena\",\"Aphrodite\",\"Hestia\",\"Hera\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(133, 'In Cook, Serve, Delicious!, which food is NOT included in the game?', '4', '[\"Lasagna\",\"Shish Kabob\",\"Hamburger\",\"Pie\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(134, 'Which historical conflict killed the most people?', '1', '[\"World War II\",\"Three Kingdoms War\",\"Taiping Rebellion\",\"Mongol conquests\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(135, 'When did the last episode of &quot;Futurama&quot; air before returning in 2023?', '1', '[\"September 4, 2013\",\"March 28, 1999\",\"December 25, 2010\",\"November 4, 2021\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(136, 'What geometric shape is generally used for stop signs?', '4', '[\"Hexagon\",\"Triangle\",\"Circle\",\"Octagon\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(137, 'Which of the following is not a type of computer mouse?', '2', '[\"Drum mouse\",\"Smoothie mouse\",\"Trackball mouse\",\"Optical mouse\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(138, 'Which former Coronation Street actress was once a hostess on the British Game Show &quot;Double Your Money&quot;?', '1', '[\"Amanda Barrie\",\"Jean Alexander\",\"Violet Carson\",\"Sue Nicholls\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(139, 'What were the first states to break away from Yugoslavia?', '1', '[\"Slovenia, Croatia\",\"Macedonia, Montenegro\",\"Montenegro, Slovenia\",\"Slovenia, Macedonia\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(140, 'Which country has three capital cities?', '1', '[\"South Africa\",\"China\",\"Somalia\",\"United Kingdom\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(141, 'In Need For Speed: Most Wanted (2005), how many people are there to defeat on the blacklist?', '3', '[\"10\",\"20\",\"15\",\"5\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(142, 'In 2013 how much money was lost by Nigerian scams?', '2', '[\"$2.7 Billion\",\"$12.7 Billion\",\"$956 Million\",\"$95 Million\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(143, 'What is Laos?', '2', '[\"River\",\"Country\",\"City\",\"Region\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(144, 'In the movie &ldquo;The Iron Giant,&rdquo; this character is the protagonist.', '1', '[\"Hogarth Hughes\",\"Annie Hughes\",\"Kent Mansley\",\"Dean McCoppin\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(145, 'When did the rapper Eazy-E die?', '3', '[\"July 11, 1992\",\"February 14, 1993\",\"March 26, 1995\",\"October 21, 1994\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(146, 'In &quot;Gravity Falls&quot;, the character Bill Cipher remarks that &quot;the universe is what?&quot;', '3', '[\"A simulation\",\"An illusion \",\"A hologram \",\"Corrupting\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(147, 'Who painted the Sistine Chapel?', '2', '[\"Leonardo da Vinci\",\"Michelangelo\",\"Raphael\",\"Pablo Picasso\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(148, 'Who sculpted the statue of David?', '3', '[\"Auguste Rodin\",\"Donatello\",\"Michelangelo\",\"Gian Lorenzo Bernini\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(149, 'What is the name of the planet that the Doctor from television series &quot;Doctor Who&quot; comes from?', '1', '[\"Gallifrey\",\"Sontar\",\"Skaro\",\"Mondas\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(150, 'Who was the author of the 1954 novel, &quot;Lord of the Flies&quot;?', '2', '[\"F. Scott Fitzgerald\",\"William Golding\",\"Hunter Fox\",\"Stephen King\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 20),
(151, 'When BMW was established in 1916, it was producing automobiles.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(152, 'The French Kingdom helped the United States gain their independence over Great Britain during the Revolutionary War.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(153, 'A person can get sunburned on a cloudy day.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(154, 'In 2010, Twitter and the United States Library of Congress partnered together to archive every tweet by American citizens.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(155, 'Blue Danube was one of the musical pieces featured in Disney&#039;s 1940&#039;s film Fantasia.', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(156, 'The name of the main character of the video game &quot;The Legend of Zelda&quot;, is Zelda.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(157, 'In &quot;Super Mario 3D World&quot;, the Double Cherry power-up originated from a developer accidentally making two characters controllable.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(158, 'Korean girl group, TWICE, consists of 9 members', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(159, 'The card game &quot;Munchkin&quot; won the 2001 Origins Award for Best Traditional Card Game.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(160, 'Skateboarding was included in the 2020 Summer Olympics in Tokyo.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(161, 'In the periodic table, Potassium&#039;s symbol is the letter K.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(162, 'Centripedal force is an apparent force that acts outward on a body moving around a center, arising from the body&#039;s inertia.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(163, 'Venus of Willendorf is one of the earliest works of art, depicting the planets Mars and Venus embrace in the heavens at night.', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(164, 'Nintendo started out as a playing card manufacturer.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(165, 'Pistons were added to Minecraft in Beta 1.5.', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(166, 'In Undertale, having a &quot;Fun Value&quot; set to 56-57 will play the &quot;Wrong Number Song Call&quot;.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(167, 'Doki Doki Literature Club was developed in Japan.', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(168, 'In the video game &quot;Transistor&quot;, &quot;Red&quot; is the name of the main character.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(169, 'In Pok&eacute;mon Sun and Moon, a male Salandit can evolve to a Salazzle.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(170, 'In Splatoon, the Squid Sisters are named Tako and Yaki.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(171, 'Android versions are named in alphabetical order.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(172, 'The Olympics tennis court is a giant green screen.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(173, 'Janus was the Roman god of doorways and passageways.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(174, 'In &quot;Star Trek&quot;, Klingons respect William Shakespeare, they even suspect him having a Klingon lineage.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(175, 'Hippopotomonstrosesquippedaliophobia is the irrational fear of long words.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(176, 'The Sun rises from the North.', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(177, 'The very first recorded computer &quot;bug&quot; was a moth found inside a Harvard Mark II computer.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(178, 'Igneous rocks are formed by excessive heat and pressure.', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(179, 'The bikini is named after the &quot;Bikini Atoll&quot;, an island where the United States conducted tests on atomic bombs.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(180, 'In World War ll, Great Britian used inflatable tanks on the ports of Great Britain to divert Hitler away from Normandy/D-day landing.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(181, 'Wilt Chamberlain scored his infamous 100-point-game against the New York Knicks in 1962.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(182, 'In the &quot;Toaru Kagaku no Railgun&quot; anime,  espers can only reach a maximum of level 6 in their abilities.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(183, 'In the &quot;To Love-Ru&quot; series, Peke is considered a female robot.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(184, 'In the game &quot;Subnautica&quot;, a &quot;Spadefish&quot; will attack you.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(185, 'Arcade Fire&#039;s &#039;The Suburbs&#039; won the Album of the Year award in the 2011 Grammys.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(186, 'BMW M GmbH is a subsidiary of BMW AG that focuses on car performance.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(187, 'Abraham Lincoln was the first U.S. President to be born outside the borders of the thirteen original states. ', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(188, 'The freshwater amphibian, the Axolotl, can regrow it&#039;s limbs.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(189, 'In &quot;Star Trek&quot;, Klingons are aliens.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(190, 'A Boolean value of &quot;0&quot; represents which of these words?', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(191, '&quot;PAYDAY: The Heist&quot; is a sequel to the board game &quot;Payday&quot;.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(192, 'Nutcracker Suite was one of the musical pieces featured in Disney&#039;s 1940&#039;s film Fantasia.', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(193, 'The full English name of the car manufacturer BMW is Bavarian Motor Works', '2', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(194, 'The programming language &quot;Python&quot; is based off a modified version of &quot;JavaScript&quot;.', '2', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(195, 'Shrimp can swim backwards.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(196, 'Lead Singer Rivers Cuomo of American rock band Weezer attended Harvard.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(197, 'Bob Ross was a US Air Force pilot.', '1', '[\"False\",\"True\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(198, 'Anatomy considers the forms of macroscopic structures such as organs and organ systems.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(199, 'According to Norse mythology, Loki is a mother.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10),
(200, 'In the &quot;Kagerou Daze&quot; series, Shintaro Kisaragi is prominently shown with the color red.', '1', '[\"True\",\"False\"]', NULL, NULL, 'text', 'single', 'Correct answer. Good job.', 'Incorrect answer. Please try again.', '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `totalPoints` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quiz_attempts`
--

INSERT INTO `quiz_attempts` (`id`, `score`, `totalPoints`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 10, 30, 22, '2024-05-26', '2024-05-26'),
(13, 30, 30, 22, '2024-05-26', '2024-05-26'),
(14, 10, 20, 22, '2024-05-26', '2024-05-26'),
(15, 20, 40, 22, '2024-05-26', '2024-05-26'),
(16, 10, 20, 22, '2024-05-26', '2024-05-26'),
(17, 10, 30, 22, '2024-05-26', '2024-05-26'),
(18, 10, 30, 22, '2024-05-26', '2024-05-26'),
(19, 30, 70, 22, '2024-05-26', '2024-05-26'),
(20, 40, 90, 22, '2024-05-26', '2024-05-26'),
(21, 20, 70, 22, '2024-05-26', '2024-05-26'),
(22, 30, 70, 22, '2024-05-26', '2024-05-26'),
(23, 40, 70, 22, '2024-05-26', '2024-05-26'),
(24, 20, 90, 22, '2024-05-26', '2024-05-26'),
(25, 40, 80, 22, '2024-05-26', '2024-05-26'),
(26, 20, 80, 22, '2024-05-26', '2024-05-26'),
(27, 30, 90, 22, '2024-05-26', '2024-05-26'),
(28, 40, 70, 23, '2024-05-26', '2024-05-26'),
(29, 40, 80, 23, '2024-05-26', '2024-05-26'),
(30, 40, 80, 23, '2024-05-26', '2024-05-26'),
(31, 90, 90, 23, '2024-05-26', '2024-05-26'),
(32, 20, 80, 23, '2024-05-26', '2024-05-26'),
(33, 40, 70, 23, '2024-05-26', '2024-05-26'),
(34, 20, 70, 23, '2024-05-26', '2024-05-26'),
(35, 30, 60, 23, '2024-05-26', '2024-05-26'),
(36, 10, 80, 23, '2024-05-26', '2024-05-26'),
(37, 40, 100, 24, '2024-05-26', '2024-05-26'),
(38, 40, 70, 24, '2024-05-26', '2024-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1H95KHmUoDybdfNYNdzpmM1N314VcwNzKSP6EOah', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 OPR/109.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0swVWpOTU1ENGQ4dE1qckZ4VnB0dm9NWEZIejBTZkxaMU5vT3E3VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716410602),
('5tse3dkmXY4sn1piQXXlCLSfX0jOMV9Db2LhCbfr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 OPR/109.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidm1XeHNjSVlvMG03RENPaVk2N3JzazRkTVN2YjhLNmZjbmxoWGY1RyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716409985),
('Ds1fq3EGGbjZIrnEskYyFk6jU23Yx5sy0vvYyn6W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 OPR/109.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaXdtbU55ajBkRUhsckhlbXByczZDd2FkdWJ5MVNhWnZZd0JGVndOYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716410207),
('LRLXwtPRK7Skk7GQt7Ity7sHoBO9eIPcctRgOJek', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmdaZFJvUXNwUXhLM01BaG9XRDNXTmlPZGtIRU9QcjhNcExjMlVlUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1716585138),
('Mg3230t8ekcvP6Bwd96Xa5MvxV1qG6pkN4uNslaZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 OPR/109.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWEJaYXBEc3Vvd1FPRW9BdTM3a0M1QjB6RmRGM044WlJyaDRwbjdTSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716409799),
('p8Miou8eF1diChFI4FO7JqFLVU9dcJ1AzYRo5KTa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 OPR/109.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVBKTUlRUGw4Y2NvbjRyeXo2bGdvcDhPQWZjYUk0TGdRbXhHRFdrcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1716408677),
('Qe0fdsynNTZpEiBC5yN4mvE9jWDtjwtwVyLLEEWI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 OPR/109.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ3JKZ3h6ejhXbjh2STFRMGZrNjNIVUxkU01oMjBRdGtmZnZWTFgyUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716410452),
('uB1VyxjnTttUQjyFsDgUR2fPG6qvBvW54Dmw4FAD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 OPR/109.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaWJRdHJCbjloeE54aENaTEk2d1ZPb3lLWnpHeTJ6WTI4bXBLSzNnRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716409873);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `api_token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `api_token`, `created_at`, `updated_at`) VALUES
(22, 'Stefan', 'stefan@gmail.com', NULL, '$2y$12$pb0Y3vKXyHgQePOvzaG2JuyF713lIN0jqTFKgLEt/W0Am.vcbPjty', NULL, '70|2vRT5i1ZfRtsKlzTb5xWPJknjoqWlo6BvN8gLkYz52f6b445', '2024-05-26 07:07:02', '2024-05-26 12:43:08'),
(23, 'gabi12', 'gabi@gmail.com', NULL, '$2y$12$QuEgJFuRqVSrZp0WiJM3U.NqY3Zv58KFUuEzfveexP.j3zpGzcGna', NULL, '72|8V7WIbGeMh8n7eRpTDhT3ltbJjaRDjOgnSLrqUD21961093b', '2024-05-26 13:03:25', '2024-05-26 13:56:39'),
(24, 'user1', 'user1@gmail.com', NULL, '$2y$12$fE3KnE3ehIFWUs2Nf0/7e.DMEqAETxPjfSnBw8g5QM7fkN7jK158i', NULL, '74|E7ekzGLeoF3CEWLKFYyTx7eQbAeIyNfvC1QP0RHT3fb48bc1', '2024-05-26 14:28:52', '2024-05-26 14:28:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_attempts_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `quiz_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
