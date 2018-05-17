-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2018 at 05:55 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timviec`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ilPOiDhmKqsxtUpi7ZgWe5vDYjt2ICJK', 1, '2017-11-12 06:15:56', '2017-11-12 06:15:55', '2017-11-12 06:15:56'),
(2, 1, 'rcp04qHne8oATtrTCwKl9FuckJEarSCb', 1, '2017-11-12 06:20:02', '2017-11-12 06:20:02', '2017-11-12 06:20:02'),
(3, 1, 'AHbwHv4BMq4Z5b7nkdvOlvcOvXnPqMk0', 1, '2017-11-12 06:24:14', '2017-11-12 06:24:14', '2017-11-12 06:24:14'),
(4, 1, 'JqmoT6nwuNXt0D5jape2qCQsEVQgWEqA', 1, '2017-11-12 06:26:26', '2017-11-12 06:26:26', '2017-11-12 06:26:26'),
(5, 1, '1TnyfEnFLs7gdNZXKP2r35tc1hBvcnPg', 1, '2017-11-12 07:22:52', '2017-11-12 07:22:52', '2017-11-12 07:22:52'),
(6, 1, 'QlzbRQWzVJgg01NkGUVewoQhT4qPKTMZ', 1, '2017-11-12 07:23:56', '2017-11-12 07:23:56', '2017-11-12 07:23:56'),
(7, 2, 'CHzIqLcv0HophdMnUDzxmxmGVVTTNTzS', 1, '2018-04-06 00:52:58', '2018-04-06 00:52:58', '2018-04-06 00:52:58'),
(8, 3, 'buJ7i8WLEQ6KJYeuPVSBdFzqKy5lQlYY', 1, '2018-04-06 00:54:14', '2018-04-06 00:54:14', '2018-04-06 00:54:14'),
(9, 4, 'InkbxXI6BmtJ1bSxIjvBwWPBmb0jQCEX', 1, '2018-04-06 00:55:07', '2018-04-06 00:55:07', '2018-04-06 00:55:07'),
(10, 5, 'EGJqZZXkRXbNqmXeQJSr75JyQOLw0hge', 1, '2018-04-06 00:56:08', '2018-04-06 00:56:08', '2018-04-06 00:56:08'),
(11, 6, 'z6h4JDz3cAQphIed0IGo2zCcT3jftTfs', 1, '2018-04-06 00:57:12', '2018-04-06 00:57:12', '2018-04-06 00:57:12'),
(12, 7, 'xx5fe7BQXZ2XLQaCARL8GDjP2bfshTvg', 1, '2018-04-06 00:57:56', '2018-04-06 00:57:56', '2018-04-06 00:57:56'),
(13, 8, 'ZI96P4vbx8eyICDWJHQY1asBiryhWXeX', 1, '2018-04-06 18:34:42', '2018-04-06 18:34:42', '2018-04-06 18:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` bigint(20) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `caption` text COLLATE utf8_unicode_ci,
  `alt` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_url` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `marriage_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `certification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `certificated_number` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `email`, `password`, `fullname`, `phone`, `birthday`, `sex_id`, `marriage_id`, `province_id`, `address`, `avatar`, `certification_code`, `certificated_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tranhuyvu@dienkim.com', '$2y$10$JDy8UjKIRPmnMgyIAe3ks.p5Fgpu6HdNl8NysIKtwUvAKrx9jzGfu', 'Trần Huy Vũ', '0988162739', NULL, NULL, NULL, NULL, NULL, 'logo-5-170043946.png', NULL, NULL, 1, '2018-04-03 02:32:59', '2018-04-05 02:00:14'),
(2, 'truongnt@dienkim.com', '$2y$10$jp2WuH8yQ3JhkPmL5zNBPeKK35V2W2.SU0vYLQKkJd8L/HSD441M2', 'Đặng Thị Thu Hằng', '0922111222', '1988-04-11 00:00:00', 1, 1, 2, '23 Lý Thường Kiệt', 'logo-2-xmydbuv95gtc.png', NULL, NULL, 1, '2018-04-03 07:14:21', '2018-04-11 08:31:05'),
(3, 'vientg@dienkim.com', '$2y$10$e9812Kvxwy2C8z.q/tGRQOyPBZSEyQftMBmtiWhD7cJ65RfVtTH7y', 'Trần Gia Viên', '0988223244', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2018-04-04 04:41:02', '2018-05-02 03:17:27'),
(4, 'hanhltm@dienkim.com', '$2y$10$yzu2gHugpB2s5nhJcgKJjeO4WrwCHCt88ZM/ZRF.KoEttByKWKxQ2', 'Lâm Thị Mỹ Hạnh', '0933244156', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2018-04-04 04:53:22', '2018-04-11 08:31:05'),
(5, 'duydp@dienkim.com', '$2y$10$l.PmvBEd9gT/Dod3nJLTHe1i5Ko/uyEItXMYouG0d/od6pgNxZPlm', 'Phạm Đình Duy', '0988145622', '1989-05-06 00:00:00', 1, 1, 51, '62 Lê Thánh Tôn', '300x300-logo-2-3z6s1rfhjulc-1ihm483naoy5.png', NULL, NULL, 1, '2018-04-04 05:18:40', '2018-05-13 18:49:58'),
(6, 'doricata@dienkim.com', '$2y$10$f5xkRP6uU9xCbwatX0o4XetN8cl6VgyElfUNKHOtWzug2YiQNHbRS', 'Nguyễn Văn Cường', '0988162289', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2018-04-04 05:31:42', '2018-04-04 10:14:02'),
(9, 'dienit02@gmail.com', '$2y$10$.poX92LRY9iXsfOPQZLD.eITV1w98HCGcJhCC1S4zYMWf1RLBkb2m', 'Lê Phước Cường', '0922331459', NULL, NULL, NULL, NULL, NULL, NULL, 'iv3kny69a05l28r7wcp4zqj1ghbsdx', 1, 1, '2018-05-15 08:03:17', '2018-05-15 09:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `category_article`
--

DROP TABLE IF EXISTS `category_article`;
CREATE TABLE `category_article` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_banner`
--

DROP TABLE IF EXISTS `category_banner`;
CREATE TABLE `category_banner` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_param`
--

DROP TABLE IF EXISTS `category_param`;
CREATE TABLE `category_param` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `param_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_param`
--

INSERT INTO `category_param` (`id`, `fullname`, `alias`, `parent_id`, `param_value`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Xuất xứ', 'xuat-xu', 0, '', 1, 1, '2018-02-01 20:40:54', '2018-02-02 01:34:27'),
(5, 'Nhật', 'nhat', 1, '', 1, 1, '2018-02-01 20:46:48', '2018-02-02 01:40:43'),
(9, 'Thương hiệu', 'thuong-hieu', 0, '', 2, 1, '2018-02-02 01:38:44', '2018-02-02 01:38:48'),
(10, 'Mỹ', 'my', 1, '', 2, 1, '2018-02-02 01:39:59', '2018-02-02 01:39:59'),
(11, 'Hàn Quốc', 'han-quoc', 1, '', 3, 1, '2018-02-02 01:40:14', '2018-02-02 01:40:14'),
(12, 'Trung Quốc', 'trung-quoc', 1, '', 4, 1, '2018-02-02 01:40:27', '2018-02-02 01:40:30'),
(13, 'Nike', 'nike', 9, '', 19, 1, '2018-02-02 01:41:04', '2018-03-03 03:44:46'),
(14, 'Adidas', 'adidas', 9, '', 12, 1, '2018-02-02 01:41:32', '2018-03-03 03:44:46'),
(15, 'Jordan', 'jordan', 9, '', 14, 1, '2018-02-02 01:41:45', '2018-03-03 03:44:46'),
(16, 'Converse', 'converse', 9, '', 15, 1, '2018-02-02 01:42:53', '2018-03-03 03:44:46'),
(17, 'Reebok', 'reebok', 9, '', 16, 1, '2018-02-02 01:43:05', '2018-03-03 03:44:46'),
(18, 'Vans', 'vans', 9, '', 17, 1, '2018-02-02 01:43:17', '2018-03-03 03:44:46'),
(19, 'Under Armour', 'under-armour', 9, '', 18, 1, '2018-02-02 01:43:26', '2018-03-03 03:44:46'),
(20, 'Puma', 'puma', 9, '', 5, 1, '2018-02-02 01:43:34', '2018-03-03 03:44:46'),
(21, 'New Balance', 'new-balance', 9, '', 13, 1, '2018-02-02 01:43:49', '2018-03-03 03:44:46'),
(22, 'Đơn vị', 'don-vi', 0, '', 3, 1, '2018-02-02 01:44:45', '2018-02-02 01:45:02'),
(23, 'Chiếc', 'chiec', 22, '', 1, 1, '2018-02-02 01:45:15', '2018-02-02 01:45:15'),
(24, 'Bịch', 'bich', 22, '', 1, 1, '2018-02-02 01:45:25', '2018-02-02 01:45:25'),
(25, 'Lọ', 'lo', 22, '', 1, 1, '2018-02-02 01:45:34', '2018-02-02 01:45:34'),
(26, 'Lô hàng', 'lo-hang', 22, '', 1, 1, '2018-02-02 01:46:20', '2018-02-02 01:46:20'),
(27, 'Màu', 'mau', 0, '', 4, 1, '2018-02-02 01:47:29', '2018-02-02 01:47:29'),
(28, 'Xanh lá cây', 'xanh-la-cay', 27, '#00c60e', 5, 1, '2018-02-02 01:48:01', '2018-02-02 01:51:22'),
(29, 'Đỏ', 'do', 27, '#c60000', 4, 1, '2018-02-02 01:48:22', '2018-02-02 01:51:22'),
(30, 'Tím', 'tim', 27, '#8c00c6', 3, 1, '2018-02-02 01:48:45', '2018-02-02 01:51:22'),
(31, 'Vàng', 'vang', 27, '#e6e900', 2, 1, '2018-02-02 01:49:17', '2018-02-02 01:51:22'),
(32, 'Hồng', 'hong', 27, '#ff00e4', 1, 1, '2018-02-02 01:49:49', '2018-02-02 01:51:22'),
(33, 'Bạc', 'bac', 27, '#e8d65d', 6, 1, '2018-02-02 01:51:00', '2018-02-02 01:51:22'),
(34, 'Kích thước', 'kich-thuoc', 0, '1', 5, 1, '2018-02-02 04:24:15', '2018-02-02 04:24:23'),
(35, 'S', 's', 34, '', 1, 1, '2018-02-02 04:24:40', '2018-02-02 04:24:40'),
(36, 'M', 'm', 34, '', 2, 1, '2018-02-02 04:24:54', '2018-02-02 04:25:48'),
(37, 'L', 'l', 34, '', 3, 1, '2018-02-02 04:25:02', '2018-02-02 04:25:48'),
(38, 'XL', 'xl', 34, '', 4, 1, '2018-02-02 04:25:11', '2018-02-02 04:25:48'),
(39, 'XS', 'xs', 34, '', 5, 1, '2018-02-02 04:25:21', '2018-02-02 04:25:48'),
(40, 'REN', 'ren', 9, '', 7, 1, '2018-02-03 04:15:08', '2018-03-03 03:44:46'),
(41, 'NOSBYN', 'nosbyn', 9, '', 8, 1, '2018-02-03 04:15:24', '2018-03-03 03:44:46'),
(42, 'THE BLUE T-SHIRT', 'the-blue-t-shirt', 9, '', 9, 1, '2018-02-03 04:15:38', '2018-03-03 03:44:46'),
(43, 'COCOSIN', 'cocosin', 9, '', 1, 1, '2018-02-03 04:15:53', '2018-02-03 04:15:53'),
(44, 'WEPHOBIA', 'wephobia', 9, '', 2, 1, '2018-02-03 04:16:05', '2018-03-03 03:44:46'),
(45, 'MAGONN', 'magonn', 9, '', 4, 1, '2018-02-03 04:16:21', '2018-03-03 03:44:46'),
(46, 'LIBE', 'libe', 9, '', 6, 1, '2018-02-03 04:16:33', '2018-03-03 03:44:46'),
(47, 'Chất liệu', 'chat-lieu', 0, '', 6, 1, '2018-02-03 11:34:21', '2018-02-03 11:34:29'),
(48, 'Thun', 'thun', 47, '', 2, 1, '2018-02-03 11:34:43', '2018-02-03 11:35:29'),
(49, 'Vải', 'vai', 47, '', 1, 1, '2018-02-03 11:34:53', '2018-02-03 11:35:29'),
(50, 'Nhà thiết kế', 'nha-thiet-ke', 0, '', 7, 1, '2018-02-03 11:36:34', '2018-02-03 11:36:34'),
(51, 'Clara Fashion', 'clara-fashion', 50, '', 1, 1, '2018-02-03 11:36:54', '2018-02-03 11:36:54'),
(52, 'Tình trạng', 'tinh-trang', 0, '', 7, 1, '2018-02-27 03:33:32', '2018-02-27 03:33:46'),
(53, 'Còn hàng', 'con-hang', 52, '1', 1, 1, '2018-02-27 03:34:09', '2018-03-01 03:15:16'),
(54, 'Hết hàng', 'het-hang', 52, '0', 2, 1, '2018-02-27 03:34:29', '2018-03-01 03:15:25'),
(55, 'Bảo hành', 'bao-hanh', 0, '', 8, 1, '2018-03-01 03:21:37', '2018-03-01 03:21:44'),
(56, '1 tháng', '1-thang', 55, '', 1, 1, '2018-03-01 03:23:13', '2018-03-01 03:23:13'),
(57, '2 tháng', '2-thang', 55, '', 2, 1, '2018-03-01 03:23:23', '2018-03-01 03:23:23'),
(58, '3 tháng', '3-thang', 55, '', 3, 1, '2018-03-01 03:23:31', '2018-03-01 03:23:31'),
(59, '4 tháng', '4-thang', 55, '', 4, 1, '2018-03-01 03:23:38', '2018-03-01 03:23:38'),
(60, '5 tháng', '5-thang', 55, '', 5, 1, '2018-03-01 03:23:50', '2018-03-01 03:23:50'),
(61, '6 tháng', '6-thang', 55, '', 6, 1, '2018-03-01 03:24:00', '2018-03-01 03:24:00'),
(62, '7 tháng', '7-thang', 55, '', 7, 1, '2018-03-01 03:24:09', '2018-03-01 03:24:09'),
(63, 'Việt Nam', 'viet-nam', 1, '', 5, 1, '2018-03-02 18:28:20', '2018-03-02 18:28:20'),
(64, 'Công trí', 'cong-tri', 50, '', 2, 1, '2018-03-03 02:31:01', '2018-03-03 02:31:01'),
(65, 'Đỗ Mạnh Cường', 'do-manh-cuong', 50, '', 3, 1, '2018-03-03 02:31:26', '2018-03-03 02:31:26'),
(66, 'Lý Quý Khánh', 'ly-quy-khanh', 50, '', 4, 1, '2018-03-03 02:31:44', '2018-03-03 02:31:44'),
(67, 'Cotton', 'cotton', 47, '', 3, 1, '2018-03-03 02:32:09', '2018-03-03 02:32:09'),
(68, 'Lenovo', 'lenovo', 9, '', 10, 1, '2018-03-03 03:43:53', '2018-03-03 03:44:46'),
(69, 'HP', 'hp', 9, '', 11, 1, '2018-03-03 03:44:04', '2018-03-03 03:44:46'),
(70, 'Acer', 'acer', 9, '', 3, 1, '2018-03-03 03:44:12', '2018-03-03 03:44:46'),
(71, 'Asus', 'asus', 9, '', 20, 1, '2018-03-03 03:46:39', '2018-03-03 03:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `category_video`
--

DROP TABLE IF EXISTS `category_video`;
CREATE TABLE `category_video` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_video`
--

INSERT INTO `category_video` (`id`, `fullname`, `meta_keyword`, `meta_description`, `alias`, `parent_id`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Video', 'metakeyword video', 'metadescription video', 'video', NULL, 'thuvienhinh-1.png', 1, 1, '2018-01-09 10:03:48', '2018-01-09 11:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `classification`
--

DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classification`
--

INSERT INTO `classification` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tốt', 'tot', 1, 1, '2018-04-27 08:25:58', '2018-04-27 08:25:58'),
(2, 'Khá', 'kha', 1, 1, '2018-04-27 08:26:04', '2018-04-27 08:26:04'),
(3, 'Trung bình', 'trung-binh', 1, 1, '2018-04-27 08:26:10', '2018-04-27 08:26:10'),
(4, 'Kém', 'kem', 1, 1, '2018-04-27 08:26:16', '2018-04-27 08:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `fullname`, `alias`, `province_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tân Bình', 'tan-binh', 24, 3, 1, '2018-02-26 03:03:50', '2018-02-26 03:23:39'),
(2, 'Phú Nhuận', 'phu-nhuan', 24, 4, 1, '2018-02-26 03:19:32', '2018-02-26 03:23:39'),
(3, 'Quận 1', 'quan-1', 24, 1, 1, '2018-02-26 03:19:56', '2018-02-26 03:21:12'),
(4, 'Quận 2', 'quan-2', 24, 2, 1, '2018-02-26 03:20:06', '2018-02-26 03:26:09'),
(5, 'Quận 2', 'quan-2', 36, 6, 1, '2018-02-26 03:23:23', '2018-02-26 03:25:07'),
(6, 'Quận 1', 'quan-1', 36, 5, 1, '2018-02-26 03:24:19', '2018-02-26 03:25:00'),
(7, 'Tân Bình', 'tan-binh', 36, 7, 1, '2018-02-26 03:24:47', '2018-02-26 03:25:07'),
(8, 'Phú Nhuận', 'phu-nhuan', 36, 8, 1, '2018-02-26 03:25:52', '2018-02-26 03:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
CREATE TABLE `employer` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `scale_id` int(11) DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacted_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacted_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `certification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `certificated_number` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_authentication` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`id`, `email`, `password`, `fullname`, `alias`, `meta_keyword`, `meta_description`, `address`, `phone`, `province_id`, `scale_id`, `logo`, `intro`, `fax`, `website`, `contacted_name`, `contacted_phone`, `user_id`, `certification_code`, `certificated_number`, `status`, `status_authentication`, `created_at`, `updated_at`) VALUES
(1, 'miraihuman@dienkim.com', '$2y$10$lBR2DSh3Jt/XBtZVUXYSdOj3VCD7hETNH1SZ975dD3gv.BWWehbO6', 'CÔNG TY TNHH NHÂN LỰC MIRAI', 'cong-ty-tnhh-nhan-luc-mirai', NULL, NULL, '155 Trần Trọng Cung, Khu Thương Mại Nam Thông, P. Tân Thuận Đông, Quận 7', '0922331453', 23, 4, 'kyliejenner4-grldu8p1fxwe.jpg', '<p>Mirai Human [Nhân lực Tương lai] là đơn vị hoạt động chuyên sâu trong lĩnh vực đào tạo và đưa người lao động Việt Nam đi làm việc ở Nhật Bản (Xuất khẩu lao động tập trung thị trường Nhật Bản). </p><p>Với đội ngũ Ban lãnh đạo và nhân viên trên 15 năm kinh nghiệm làm việc với các doanh nghiệp, đối tác Nhật Bản, thông thạo Nhật ngữ, am hiểu văn hóa, phong cách làm việc của người Nhật…</p><p>Mirai Human tin tưởng sẽ mang lại nhiều cơ hội thực tập, làm việc, nâng cao năng lực, tay nghề, tác phong cho độ ngũ nhân lực trẻ Việt Nam, mang đến cho người lao động và doanh nghiệp Nhật Bản một tương lai tươi sáng hơn. </p><p>\r\nTẦM NHÌN\r\n</p><p>Đơn vị cung cấp nguồn nhân lực tin cậy cho các doanh nghiệp Nhật Bản </p><p>\r\nSỨ MỆNH\r\n</p><p>Mang đến tương lai tươi sáng cho thế hệ nhân lực trẻ Việt Nam thông qua cơ hội việc làm tại Nhật Bản. </p><p>\r\nGIÁ TRỊ CỐT LÕI\r\n</p><p>- Tôn trọng\r\n</p><p>- Thấu hiểu\r\n</p><p>- Chia sẻ\r\n</p><p>- Tin cậy\r\n</p><p>-Lâu dài</p>', '53465466357', 'www.miraihuman.com', 'Lê Văn Sương', '0921771831', NULL, 'krqf5alpy2inm10hx9g8dv6esbwto4', 0, 1, NULL, '2018-05-16 02:56:26', '2018-05-17 01:47:05'),
(2, 'tbland@dienkim.com', '$2y$10$8pM6hwmyrJSEZ1NHry5n7.RB.HW2j0bqvxBXjDUz.doTP.oXtUqOe', 'Công ty Bất Động Sản TNB Land', 'cong-ty-bat-dong-san-tnb-land', NULL, NULL, 'Tầng 2, Tòa nhà 381 Đội Cấn Quận Ba Đình, Hà Nội', '0922331454', 17, 3, NULL, '<p>Công Ty TNHH sản xuất, thương mại và dịch vụ TNB - \"Công ty Bất Động Sản TNB Land\" là một trong những thương hiệu hàng đầu trong lĩnh vực đầu tư và phân phối bất động sản tại Việt Nam.\r\n</p><p>\r\nCông Ty TNHH sản xuất, thương mại và dịch vụ TNB - \"Công ty Bất Động Sản TNB Land\" hoạt động kinh doanh chính trong lĩnh vực như: Kinh doanh Bất động sản, Tư vấn và lập dự án đầu tư bất động sản, Xây dựng công trình kỹ thuật dân dụng, trang trí nội thất,…\r\nTham gia vào thị trường bất động sản \"Công ty Bất Động Sản TNB Land\" mong muốn sẽ là cầu nối tin cậy cho các nhà đầu tư bất động sản cả nước , giúp các nhà đầu tư phía Bắc có những lựa chọn đầu tư phù hợp ở thị trường hiện nay\r\n\r\nKhách hàng hoàn toàn yên tâm khi hợp tác cùng \"Công ty Bất Động Sản TNB Land\". </p><p>Công ty đảm bảo cung cấp cho khách hàng những sản phẩm có chất lượng cao, tính pháp lý minh bạch và phong cách phục vụ chuyên nghiệp. Khách hàng có thể tiết kiệm được chi phí, thời gian và công sức khi chọn mua sản phẩm bất động sản tại Công ty chúng tôi.</p>', '7347584275883', 'www.tbland.com.vn', 'Trần Văn Đạt', '0921771832', NULL, 'lm6fqji1x8enoc3szvuydgpk0752ar', 0, 1, NULL, '2018-05-16 03:06:13', '2018-05-17 01:47:05'),
(3, 'batico@dienkim.com', '$2y$10$bfVgMb06YAfW7erwt9VZkeoyK5FvH.lg6dQBhXyZqyxeuNjfipclW', 'Công Ty Cổ Phần XNK Bảo Tín', 'cong-ty-co-phan-xnk-bao-tin', NULL, NULL, '200 Lê Lâm, Phú Thạnh, Tân Phú, TP HCM', '0922331455', 23, 4, NULL, '<p>Chúng tôi là một trong những nhà nhập khẩu và phân phối dụng cụ điện cầm tay, máy hàn hàng đầu tại Việt Nam. Với hơn 8 năm kinh nghiệm, 6 chi nhánh, chúng tôi đang cung cấp sản phẩm chất lượng tốt cùng chất lượng dịch vụ cao nhất cho hơn 3000 khách hàng trên 63 tỉnh, thành phố trong cả nước.\r\n</p><p>\r\nChúng tôi nhập khẩu và phân phối nhiều sản phẩm chuyên nghiệp phục vụ cho các ngành cơ khí, xây dựng, chẳng hạn như: khoan điện, khoan tác động, khoan búa, máy mài góc, máy bào điện, máy cắt đá, máy cưa, máy cắt, máy chà nhám, máy hàn,.. trên toàn lãnh thổ Việt Nam. Tất cả sản phẩm của chúng tôi đều được kiểm tra chất lượng nghiêm ngặt trước khi bán và đi kèm với đó là chế độ hậu mãi chu đáo và đáng tin cậy.</p>', '877487147242', 'www.batico.vn', 'Lê Hồng Thanh', '0922345121', NULL, 'hnvz2tf1smplr5c9wua37y48ix0jde', 0, 1, NULL, '2018-05-16 03:23:13', '2018-05-17 01:47:05'),
(4, 'citihome@dienkim.com', '$2y$10$0MFi4ODDkZfgEKC3UvjjveuY5oHGz/uvVgtjzk7CFAYrQq1I/tg.S', 'Công Ty Cổ Phần Dịch Vụ Bất Động Sản CitiHome', 'cong-ty-co-phan-dich-vu-bat-dong-san-citihome', '', '', '436B/65 Đường 3/2, Phường 12, Quận 10', '0944111222', 23, 4, NULL, 'Công ty TNHH Bất Động Sản Citi Home được thành lập năm 2016, là một sàn giao dịch bất động sản chuyên nghiệp. Với kinh nghiệm lâu năm trong lĩnh vực bất động sản chúng tôi cam kết cung cấp thông tin về thị trường chính xác, kịp thời để nhà đầu tư có sự lựa chọn hiệu quả nhất và mang ngôi nhà mơ ước đến với mọi người!', '8889891489243', 'www.citihome.vn', 'Lê Văn Lung', '0922123123', 0, 'lq5pguryn267o0ex319vzitwcsmkdj', 0, 1, 0, '2018-05-16 03:26:27', '2018-05-17 01:47:05'),
(5, 'thanhhungtaxi@dienkim.com', '$2y$10$j3AZl1lkZ/SwYHgFs/tYCO.DVqE5aHJIwakptaK48tPXuRU3rm3/S', 'Hãng Taxi Tải THÀNH HƯNG', 'hang-taxi-tai-thanh-hung', NULL, NULL, 'Hà Nội: 104-106 Nguyễn Văn Cừ, Long Biên, Hà Nội/ HCM: 1942/1C Vườn Lài Nối Dài, phường An Phú Đông, Quận 12, Tp.HCM', '0922331461', 23, 3, NULL, 'Sự lôi cuốn kỳ diệu của cuộc sống chính là ở chỗ: Kết thúc một ngày cũ là khởi đầu một ngày mới. Một tinh thần mới, thật sung mãn, bởi muôn sự mới mẻ còn ở phía trước. Và trỗi dậy lòng ham muốn tột cùng được cống hiến nhằm khám phá và chinh phục cuộc đời. Thế là lại hăm hở lao động...Giá trị của cuộc sống là sự khởi đầu. Giá trị để tạo nên thương hiệu của một doanh nghiệp là sự sáng tạo, luôn khởi đầu các dịch vụ mới nhằm mang đến quyền hưởng lợi tối đa cho Người tiêu dùng. Và hệ quả, hơn mười năm đã qua, những chiếc Taxi Tải - Cánh tay phải của bạn màu đỏ đầu tiên đột phá ở cả hai đầu đất nước. Rồi bất ngờ xuất hiện đầy ấn tượng mô hình Xe Gia Đình - Xe Của Nhà Mình, loại taxi giá rẻ đến 40%, không mang đèn meter và treo biển taxi. Lần lượt, các xí nghiệp chuyển dọn công nghiệp ra đời, với tên gọi Chuyển Nhà Trọn Gói, sẵn sàng ghé vai giúp khách hàng vô điều kiện ở hai miền Nam, Bắc... đã tạo nên Thành Hưng - Thương hiệu của Taxi Tải và Dịch vụ chuyển dọn công nghiệp hàng đầu tại Việt Nam', '34875782534', 'www.thanhhungtaxi.vn', 'Nguyễn Thành Hưng', '0966123456', NULL, '0tcrigoz8xj1kl9nauwp65esmq3y2f', 0, 1, NULL, '2018-05-16 03:31:02', '2018-05-17 01:47:05'),
(6, 'otsvietnam@dienkim.com', '$2y$10$3oVtUQcI4/fpOfCfC38v.OtyHc04ViYtAjGL.3Dn5joVPkuqKs2si', 'Công ty TNHH thiết bị OTS Việt Nam', 'cong-ty-tnhh-thiet-bi-ots-viet-nam', NULL, NULL, 'Tầng 1, Toà nhà Vinaconex, 47 Điện Biên Phủ, Phường Đakao, Quận 1, Tp.HCM', '0978990123', 23, 3, NULL, '<p>Doanh nghiệp chúng tôi là doanh nghiệp Nhật Bản. Chuyên về thiết kế và chế tạo các loại máy tự động hóa theo yêu cầu của khách hàng. Chuyên sâu về cải tiến và chính xác hóa các hoạt động sản xuất của các nhà máy sản xuất.\r\n</p><p>Do nhu cầu phát triển, Công ty con được thành lập vào tháng 12/2013 tại Quận 3 TP.HCM. Công ty chúng tôi hiện đang có đội ngũ thiết kế có bề dày kinh nghiệm, đã từng được đào tạo và làm việc tại Nhật.</p>', '78418747842', 'www.ots06.co.jp', 'Trần Văn Thông', '0966876123', NULL, 'wb4vh7unfiszx650lj913tcya2kgom', 0, 1, NULL, '2018-05-16 03:33:28', '2018-05-17 01:47:05'),
(7, 'noxuongrong@dienkim.com', '$2y$10$P6SxjNYjqQhkdl9esLWlce/E2SWxbgy3RNKLCNMm1Xf4JhnaluSNi', 'CÔNG TY CP THU HỒI NỢ XƯƠNG RỒNG', 'cong-ty-cp-thu-hoi-no-xuong-rong', NULL, NULL, '105 Nguyễn Thị Thập, Phường Tân Hưng, Quận 7, TP. Hồ Chí Minh', '0987123456', 23, 3, NULL, '<p>CÔNG TY CỔ PHẦN THU HỒI NỢ XƯƠNG RỒNG là công ty hàng đầu về lĩnh vực thu hồi nợ cho các Công ty tài chính, các Ngân hàng. Ngoài ra, Công ty Xương Rồng còn là một trong những công ty thu hồi nợ chuyên nghiệp và hợp pháp nhất Việt Nam hiện nay.\r\n</p><p>\r\nCông ty thành lập ngày 07/07/2004. Nhân viên của Xương Rồng là giới tri thức trẻ, năng động, nhiệt huyết với công việc. Tập thể nhân viên Xương Rồng luôn cố gắng, phấn đấu làm tốt nhiệm vụ đặt ra: \"BẢO VỆ CÔNG BẰNG VÀ LẼ PHẢI\".\r\n</p><p>\r\nVăn phòng chính của công ty đặt tại Quận 7, TP. HCM. Ngoài ra còn có các văn phòng đại diện ở khắp cả nước: Hà Nội, Đà Nẵng, Khánh Hòa, Bà Rịa - Vũng Tàu, Bình Dương, Cần Thơ và Đồng Nai.\r\n\r\n</p>', '16461574142', 'www.xuongrong.com.vn', 'Trần Văn Kim', '0945123456', NULL, 'r9agp1l46ei503dswcjmuzqvynhkft', 0, 1, NULL, '2018-05-16 03:35:56', '2018-05-17 01:47:05'),
(8, 'tuongan@dienkim.com', '$2y$10$prMpTJ6J.lBpJMbYHnIgleKv.FsO7s9MdYWbeiYP2uht8z3G1YT9W', 'CÔNG TY CỔ PHẦN DẦU THỰC VẬT TƯỜNG AN', 'cong-ty-co-phan-dau-thuc-vat-tuong-an', NULL, NULL, 'Tòa nhà Empress Tower, 138-142 Hai Bà Trưng, P. Đakao, Q.1, TP. HCM', '0977222321', 23, 3, NULL, '<p>Được thành lập năm 1977, Tường An là thương hiệu gắn liền với tất cả các thế gia đình Việt Nam trong suốt 40 năm qua và là một trong những nhà sản xuất và phân phối dầu ăn lớn nhất ở thị trường Việt Nam. </p><p>Với mong muốn mang đến những sản phẩm chất lượng nhất cho người tiêu dùng, Tường An liên tục đầu tư cải tiến về công nghệ sản xuất, đặt công tác nghiên cứu và phát triển sản phẩm mới làm trọng tâm, nâng cao chất lượng sản phẩm đồng thời mở rộng và khai thác những ngành hàng mới, hướng đến phục vụ nhu cầu thiết yếu hàng ngày của người tiêu dùng.\r\n</p><p>\r\nCuối năm Năm 2016 Tường An chính thức gia nhập và trở thành một trong những thành viên quan trọng nhất của tập đoàn KIDO, đã mở ra cho Tường An chặng hành trình mới vơi một vai trò mới vô cùng trọng yếu trên con đường sát cánh cùng tập đoàn thống lĩnh thị trường thực phẩm thiết yếu.</p>', '7454328587347', 'www.tuongan.com.vn', 'Lê Thị Tường An', '0945556123', NULL, 'i1xkqb8cn9wdoj6hg37u4fylvpsm0e', 0, 1, NULL, '2018-05-16 03:38:32', '2018-05-17 01:47:05'),
(9, 'toanphat@dienkim.com', '$2y$10$Mbcw8aGj.fu4OIf9AZNBjeDCwU2qY8PZ8jcDejLWw9ySSNYB1A41C', 'Công ty TNHH TOÀN PHÁT', 'cong-ty-tnhh-toan-phat', '', '', '589 & 591 Lê Hồng Phong - Phường Phước Long - Thành phố Nha Trang - Khánh Hòa', '0979123456', 24, 4, NULL, '<p>Sản xuất sản phẩm từ plastic	</p><p>\r\n24100	Sản xuất sắt, thép, gang	</p><p>\r\n25920	Gia công cơ khí; xử lý và tráng phủ kim loại	</p><p>\r\n41000	Xây dựng nhà các loại	</p><p>4210	Xây dựng công trình đường sắt và đường bộ	</p><p>\r\n42200	Xây dựng công trình công ích	</p><p>\r\n42900	Xây dựng công trình kỹ thuật dân dụng khác	N\r\n</p><p>43110	Phá dỡ	</p><p>\r\n43120	Chuẩn bị mặt bằng	</p><p>\r\n43210	Lắp đặt hệ thống điện	</p><p>\r\n4322	Lắp đặt hệ thống cấp, thoát nước, lò sưởi và điều hoà không khí	N</p><p>43300	Hoàn thiện công trình xây dựng</p>', '73454463562', 'www.toanphat.com.vn', 'Nguyễn Văn Toàn Phát', '0922678123', 0, 'mjiat71e8wcbx4v3ku5hgyrd2sqfz9', 0, 1, 0, '2018-05-16 03:41:55', '2018-05-17 01:47:05'),
(10, 'aiavnco@dienkim.com', '$2y$10$gWu0ocwyFarB3otM.O351OSsgsNWTE.lH73927VjpNTgFNPR.fDNW', 'Công ty TNHH Bảo hiểm nhân thọ AIA Việt Nam', 'cong-ty-tnhh-bao-hiem-nhan-tho-aia-viet-nam', '', '', 'Toà nhà Royal 235 Nguyễn Văn Cừ , p.Nguyễn Cư Trinh, Quận 1', '0987321123', 23, 3, NULL, '<p>AIA Việt Nam là thành viên của Tập đoàn AIA - tập đoàn bảo hiểm nhân thọ độc lập, có nguồn gốc châu Á lớn nhất thế giới được niêm yết.\r\n</p><p>\r\nĐược thành lập vào năm 2000 với mục tiêu bảo vệ sự phồn thịnh và an toàn tài chính cho người dân Việt Nam, AIA Việt Nam hiện đang là một trong những công ty bảo hiểm nhân thọ hàng đầu và là thương hiệu được khách hàng và công chúng tin cậy.\r\n</p><p>\r\nChúng tôi luôn tiên phong trong việc xây dựng những mô hình dịch vụ sáng tạo nhằm đem đến những trải nghiệm đẳng cấp cho khách hàng. Điều này được thể hiện rõ nét nhất qua \"iPoS\", \"nest by AIA\", \"AIA Exchange\" và \"Tổng Đại Lý NEXT\".\r\nMục tiêu của AIA Việt Nam là trở thành công ty bảo hiểm nhân thọ ưu việt tại Việt Nam.</p>', '4358928953453', 'www.aia.com.vn', 'Trần Bình An', '0991234541', 0, 'q1uifrdekxo5mjs42yt390pgzawv87', 0, 1, 0, '2018-05-16 03:50:29', '2018-05-17 01:47:05'),
(11, 'asuzacacm@dienkim.com', '$2y$10$d/RaU5WM0dLcnB2xAcgGMebRA7j233EO6fcZZQ.gTf.9ba9vtXFhm', 'Công ty TNHH ASUZAC', 'cong-ty-tnhh-asuzac', NULL, NULL, 'Số 1 Đường Số 8 Kcn Viet Nam - Singapore, Thuận An', '0966123123', 23, 4, NULL, '<p>Công ty TNHH ASUZAC là công ty có 100% vốn đầu tư nước ngoài, được thành lập từ năm 2000 và là thành viên của tập đoàn ASUZAC INC. (Nhật bản). Công ty chúng tôi là công ty duy nhất tại Việt Nam sản xuất các sản phẩm bằng nhôm đúc dùng trong trang trí và xây dựng nội ngoại thất theo công nghệ “ V – pro”. Công nghệ này do chính tập đoàn ASUZAC INC. nghiên cứu thành công từ năm 1972. Các sản phẩm bao gồm: cửa, hàng rào, cầu thang, lan can, panel trang trí . . .với các ưu điểm sau:\r\n</p><p>\r\n- Chắc chắn và nhẹ: sản phẩm được cấu tạo bằng hợp kim nhôm đảm bảo vững chắc cho ngôi nhà và khối lượng nhẹ hơn hẳn so với sắt.\r\n</p><p>- Chống ăn mòn: bằng dây chuyền sơn tĩnh điện hiện đại theo tiêu chuẩn Nhật bản tạo cho sản phẩm một lớp sơn bảo vệ vững chắc, bền theo thời gian và đặc biệt sản phẩm không bị oxy hóa (không rỉ sét)\r\n- Không độc hại: nhôm là chất không gây độc hại, điều này chứng minh qua việc sử dụng nhôm trong ngành đóng gói, bảo quản thực phẩm. Vì vậy, mang cảm giác an toàn cho người sử dụng.\r\n</p><p>- Tái sử dụng: nhôm có thể tái sử dụng lại, giúp tiết kiệm nguồn tài nguyên thiên nhiên và bảo vệ môi trừơng.\r\n</p><p>- Mẫu mã được thiết kế theo đơn đặt hàng của khách hàng hoặc dựa theo sự sáng tạo của chuyên viên kỹ thuật của chúng tôi.\r\n\r\nBên cạnh đó còn có sản xuất gốm điện tử bán dẫn dùng trong công nghiệp.</p>', '65468348764', 'www.asuzac-acm.com.vn', 'Trương Thanh Bình', '0966123123', NULL, '7jl4yibwgz89vfmadsore5x01u26pn', 0, 1, NULL, '2018-05-16 04:06:15', '2018-05-17 01:47:05'),
(12, 'auvietkt@dienkim.com', '$2y$10$iaO9CHDrl03YMOrvv4twUuYhsx/fgw1L8v.BJjRpdUw4qODoKohru', 'Công ty CP xuất nhập khẩu kỹ thuật Âu Việt', 'cong-ty-cp-xuat-nhap-khau-ky-thuat-au-viet', NULL, NULL, 'P905 Lô B, khu chung cư Bàn Cát khu B, P 10, quận Tân Bình, Hồ Chí Minh', '0987938123', 23, 3, NULL, 'Công ty CP XNK kỹ thuật Âu Việt được thành lập năm 2009, là công ty kinh doanh XNK các mặt hàng chuyên nghành y tế, thiết bị thí nghiệm bao gồm: Máy móc trang thiết bị y tế, mô hình, máy móc thiết bị thí nghiệm, giáo dục', '77543285783', 'www.auvietvn.com', 'Lương Xuân Việt', '0965123123', NULL, '6rv2he9mc43dqkbwo7gn8ifuspx0tz', 0, 1, NULL, '2018-05-16 04:09:34', '2018-05-17 01:47:05'),
(13, 'pafdv@dienkim.com', '$2y$10$.3bv6przY6l6nVbbMPzTF.UUav/84Ca40QKJqRHuhGQSsWybibBfy', 'CÔNG TY TNHH THƯƠNG MẠI VÀ DỊCH VỤ PAF', 'cong-ty-tnhh-thuong-mai-va-dich-vu-paf', NULL, NULL, '55 Tân Thới Nhất 8, Khu Phố 5 - phường Tân Thới Nhất - Quận 12', '0955123123', 23, 4, NULL, '<p>CÔNG TY TNHH THƯƠNG MẠI VÀ DỊCH VỤ PAF\r\n</p><p>Công ty PAF là công ty chuyên phân phối và cung cấp các sản phẩm và linh kiện lọc nước , gia dụng. Là một trong những đơn vị đi đầu trong ngành lọc nước.Ngoài các sản phẩm thương hiệu đang phân phối như kangaroo, karofi đơn vị còn tham gia nhập khẩu, lắp ráp các thiết bị lọc nước gia đình Hiện tại hệ thống khách hàng trải dài từ miền trung cao nguyên đến miền tây phía nam. Do nhu cầu phát triển mạnh mẽ năm 2017 công ty đang cần có nhu cầu các ứng viên có tâm huyết để cùng đồng hành phát triển cùng công ty. \r\nLiên hệ phỏng vấn </p>', '45723875353', 'www.paf.com.vn', 'Trần Văn Sơn', '0909282038', NULL, 'c64z1im3f2l7akexo9bvp5d8s0yntw', 0, 1, NULL, '2018-05-16 04:13:10', '2018-05-17 01:47:05'),
(14, 'khoitoan@dienkim.com', '$2y$10$qbTb2iuAOQW0S.Av02qxluqcx.9cfBMU0wbOTIOBN3DvZYTKOsYle', 'TRUNG TÂM HIỆU CHUẨN KIỂM ĐỊNH KHỞI TOÀN', 'trung-tam-hieu-chuan-kiem-dinh-khoi-toan', NULL, NULL, '89 Đường số 6, Ấp Tiền Lân, Xã Bà Điểm, Huyện Hóc Môn, TP. Hồ Chí Minh', '0922111222', 23, 3, NULL, '<p>Trung tâm Hiệu chuẩn Kiểm định Khởi Toàn hoạt động trong lĩnh vực đo lường – hiệu chuẩn. Chúng tôi chuyên cung cấp các giải pháp về thử nghiệm trong ngành giày, da, túi xách, dệt may và cao su.\r\nĐể đảm bảo và nâng cao chất lượng dịch vụ, chúng tôi xây dựng hệ thống quản lý chất lượng nội bộ và được công nhận phù hợp chuẩn quốc tế ISO/IEC 17025:2005 về đo lường – hiệu chuẩn.\r\n</p><p>Giải pháp thử nghiệm:\r\n</p><p>+ Hiệu chuẩn, bảo trì các thiết bị thử nghiệm theo tiêu chuẩn SATRA, ASTM, ISO, ĐLVN, DIN và\r\nyêu cầu của khách hàng\r\n</p><p>+ Sửa chữa các thiết bị thử nghiệm\r\n</p><p>+ Đào tạo về vận hành và hiệu chuẩn nội bộ các thiết bị thử nghiệm\r\n</p><p>+ Tư vấn về xây dựng và quản lý phòng thí nghiệm đạt chuẩn\r\nLĩnh vực hiệu chuẩn:\r\n</p><p>+ Khối lượng: cân phân tích, cân kỹ thuật, cân thông dụng\r\n</p><p>+ Độ dài: thước cặp, đồng hồ đo độ dày\r\n</p><p>+ Lực: máy thử lực kéo – nén, đồng hồ đo độ cứng\r\n</p><p>+ Nhiệt độ: tủ thử nghiệm nhiệt độ, nhiệt kế hồng ngoại, nhiệt kế tương tự và hiển thị số, nhiệt kế thuỷ tinh chất lỏng\r\n</p><p>+ Góc: các thiết bị thử nghiệm góc\r\n</p><p>+ Tốc độ: thiết bị thử nghiệm tốc độ vòng quay, thiết bị thử nghiệm tốc độ hành trình\r\n</p><p>+ Áp suất: áp kế kiểu lò xo và hiện số\r\n</p><p>+ Độ ẩm: thiết bị đo độ ẩm không khí</p>', '372472882', 'www.khoitoan.com.vn', 'Giáp Văn Khởi Toàn', '0927523129', NULL, '2hxitdw4k7m8fpbv3y1e6rsjq5zcla', 0, 1, NULL, '2018-05-16 04:16:13', '2018-05-17 01:47:05'),
(15, 'datxanhvn@dienkim.com', '$2y$10$vF0Yv00esqgPJ4EAL25dQuStXe9VJm/.mtcTzwiCDX9MSYgMm4hGC', 'CÔNG TY CỔ PHẦN ĐẤT XANH ĐÀ NẴNG', 'cong-ty-co-phan-dat-xanh-da-nang', NULL, NULL, '386 Điện Biên Phủ, quận Thanh Khê, Đà Nẵng', '0977123881', 54, 3, NULL, '<p>Công ty Đất Xanh Đà Nẵng – Nhà đầu tư và phân phối dự án bất động sản tại Việt Nam. Công ty Đất Xanh Đà Nẵng là thương hiệu uy tín trong lĩnh vực bất động sản thuộc tập đoàn Đất Xanh. Đất Xanh Đà Nẵng là đơn vị kinh doanh chủ lực của Đất Xanh Group - Đất Xanh Miền Trung với hàng trăm dự án về căn hộ, biệt thự nghỉ dưỡng cao cấp, các khu đô thị ở khu vực Miền Trung.\r\n</p><p>\r\n\r\nSứ mệnh của Đất Xanh Đà Nẵng là trở thành công ty hàng đầu về lĩnh vực phân phối bất động sản, tập trung chủ yếu vào các dòng sản phẩm đất nền, căn hộ - condotel, biệt thự nghĩ dưỡng chất lượng sống cao. Chúng tôi không ngừng tìm kiếm và tạo ra các hiệu quả tài chính lành mạnh cho các nhà đầu tư, tạo cơ hội phát triển và đem lại nhiều lợi ích kinh tế cho nhân viên, các đối tác kinh doanh và cộng đồng nơi chúng tôi hoạt động. Chúng tôi luôn phấn đấu hoạt động trên cơ sở chính trực, công bằng và thượng tôn pháp luật trong mọi hành động của mình.\r\n</p><p>\r\nVới đội ngũ CBNV trẻ, nhiệt huyết và năng động. Môi trường làm việc chuẩn Smart Office và chế độ phúc lợi tốt nhất toàn quốc, hằng trăm ứng viên đã thật sự thay đổi hoàn toàn về năng lực bản thân lẫn chất lượng cuộc sống sau khi đầu quân về đội ngũ Đất Xanh Đà Nẵng.</p>', '3782848423', 'www.datxanh.vn', 'Võ Thanh Việt', '0922123899', NULL, '2nxve943f8wcyjtua0hdi1l5zborgk', 0, 1, NULL, '2018-05-16 04:19:21', '2018-05-17 01:47:05'),
(16, 'nhantamnk@dienkim.com', '$2y$10$OHUh0X0Hq3izvh2Rk/LyNe6fHB0Y7Fs4UxJTe7ufGdQVPLC6WrE8C', 'Công Ty TNHH Nha Khoa Nhân Tâm', 'cong-ty-tnhh-nha-khoa-nhan-tam', NULL, NULL, '807 đường 3/2 , Phường 7, Quận 10, TP. HCM', '0954123321', 23, 4, NULL, 'Công Ty TNHH Nha Khoa An Tâm là phòng khám uy tín và chất lượng, dịch vụ tốt, chăm sóc nhiệt tình', '3788754325', 'www.nhakhoant.com.vn', 'Võ Thành Tâm', '0977123123', NULL, 'bpsl2g5qzrnu3dvt0whe178yjfx6im', 0, 1, NULL, '2018-05-16 04:22:28', '2018-05-17 01:47:05'),
(17, 'yonglong@dienkim.com', '$2y$10$8PiUsbdZHtGowlnh5n7k1O32uBZgzKsRq9Ier4VW.kfZBWQa3OyR.', 'Công ty TNHH Yong Long', 'cong-ty-tnhh-yong-long', NULL, NULL, 'Một phần Lô CN18, đường số 4, KCN Sóng Thần 3, P. Phú Tân, Tp. Thủ Dầu Một, Bình Dương', '0931123321', 23, 4, NULL, '<p>Công ty TNHH Yong Long là công ty có vốn 100% đầu tư của Đài Loan.</p><p>Tổng công ty có trụ sở tại Đài Loan, và các chi nhánh tại Trung Quốc.</p><p>Chính thức thành lập tại Việt Nam từ năm 2015. \r\nChuyên sản xuất, gia công các mặt hàng đinh gót giày, ốc vít,...\r\nCông ty có chế độ lương thưởng tốt, hưởng chế độ bảo hiểm ... theo Luật Lao động Việt Nam.</p>', '43778582345334', 'www.yonglong.com.vn', 'Lê Yong Long', '0988981321', NULL, '24eztx0ramn7hu89bs5jfoc3qplv6k', 0, 1, NULL, '2018-05-16 04:28:07', '2018-05-17 01:47:05'),
(18, 'lamaothun@dienkim.com', '$2y$10$GlMOoS/NTcOfGr9bEg4PV.Fp7QEaYVC9n3J9lGrPWuvG.Cm5gBmyO', 'CT TNHH BLUE MORNING', 'ct-tnhh-blue-morning', NULL, NULL, '319B5 Lý Thường Kiệt, Phường 15, Quận 11, TP HCM', '0945123123', 23, 4, NULL, '<p>CÔNG TY TNHH BLUE MORING chuyên cung cấp Đồng phục cho các Doanh nghiệp. </p><p>\r\n\r\n1. May áo thun Đồng phục. </p><p>\r\n2. May áo sơ mi Đồng phục. </p><p>\r\n3. Đồng phục Công sở. </p><p>\r\n4. Đồng phục Bảo hộ LĐ </p><p>\r\n5. May Nón kết, nón Tai bèo.</p>', '7437857285', 'www.lamaothun.com', 'Thái Văn Mậu', '0926123123', NULL, '03obh8dwimqyfvasx5p9egtz2r4jl6', 0, 1, NULL, '2018-05-16 04:31:15', '2018-05-17 01:47:05'),
(19, 'cgvland@dienkim.com', '$2y$10$dp6lxamUiY3TmdQprFR94eQBckAY9RkqmzVilNNbqR2oYoeWotiHa', 'CÔNG TY CỔ PHẦN BẤT ĐỘNG SẢN CGV', 'cong-ty-co-phan-bat-dong-san-cgv', NULL, NULL, '21 Đường số 17, Phường Linh Tây, Quận Thủ Đức, TP.Hồ Chí Minh', '0956123123', 23, 3, NULL, '<p>Công ty Cổ Phần Bất Động Sản CGV là công ty chuyên về đầu tư và môi giới bất động sản. Với tầm nhìn trở thành một công ty hàng đầu về môi giới và đầu tư bất động sản. Chúng tôi đã xác định mục tiêu thiết lập, dẫn dắt thị trường bất động sản năng động, thanh khoản cao. </p><p>\r\nVới mong muốn:\r\n</p><p>- Xây dựng một môi trường làm việc năng động, sáng tạo, tràn đầy năng lượng để cho mỗi thành viên CGV cùng đồng nghiệp mình thỏa sức khám phá khả năng bản thân, tự do thể hiện mình trên tinh thần vui vẻ, đoàn kết. Và đặc biệt chúng tôi mong muốn đưa CGV đứng Top đầu ở Việt Nam về môi trường làm việc cũng như thu nhâp.\r\n</p><p>- Mang đến cho khách hàng những mái ấm bền vững. </p><p>\r\n- Mang đến cho nhà đầu tư lợi nhuận bền vững.</p>', '87547583257', 'www.cgvland.com', 'Đào Anh Thịnh', '0958123123', NULL, 'fute6saovrymh8zpnb4qc79x1w50lg', 0, 1, NULL, '2018-05-16 04:56:52', '2018-05-17 01:47:05'),
(20, 'polytex2016@dienkim.com', '$2y$10$dQVgR.JoqHReSki0GxmMYeGA3.3R4Nrbzu1SN5GsY7IBbaazrf6fC', 'CTy TNHH Polytex Far Eastern VN', 'cty-tnhh-polytex-far-eastern-vn', NULL, NULL, 'Lô B_4B_CN và B_5B_CN, Đường DC và Lô 3E_CN Đường N11, Khu công nghiệp Bàu Bàng, huyện Bàu Bàng, tỉnh Bình Dương', '0952123123', 3, 3, NULL, '<p>Năm 2015 tập đoàn Far Eastern đầu tư dự án với 274 triệu USD trên diện tích gần 100 ha tại khu công nghiệp Bàu Bàng, tỉnh Bình Dương xây dựng CÔNG TY TNHH POLYTEX FAR EASTERN (VIỆT NAM). Đây là dự án lớn nhất từ trước đến nay của tỉnh Bình Dương và dự tính đi vào hoạt động vào cuối năm 2016 đầu năm 2017.\r\n</p><p>Ngành nghề kinh doanh	Sản xuất sợi (1311), Sản xuất vải dệt (1329), Hoàn thiện sản phẩm dệt (1313)</p>', '78354353', 'www.polytexfar.vn', 'Lại Thành Sâm', '0955123123', NULL, 'muyg849qs0jkeax5ohvlfrw17dtp2c', 0, 1, NULL, '2018-05-16 05:00:16', '2018-05-17 01:47:05'),
(21, 'thangloixk@dienkim.com', '$2y$10$Pyy6YFSceC3b.XIz1VkOSeUbuqRW2HTI29WO0ofLdT.QdtycD9aMy', 'CÔNG TY TNHH XK THẮNG LỢI', 'cong-ty-tnhh-xk-thang-loi', NULL, NULL, 'Số 2 cư xá Trần Quang Diệu, Đường Trần Quang Diệu, P.14, Q.3, TP.HCM', '0976123456', 23, 3, NULL, '<p>Công ty chúng tôi chuyên: mua bán các mặt hàng nông sản như : Hạt điều, cà phê, gạo tiêu, các mặt hàng trái cây, rau quả khô,...</p><p>* Với bề dày hơn 20 năm kinh nghiệm trong lĩnh vực mua bán, gia công chế biến, kiểm tra chất lượng các mặt hàng nông sản, với các chuyên gia hàng đầu của công ty chúng tôi, chúng tôi sẽ giúp thúc đẩy công việc kinh doanh của bạn ngày càng thành công, chính xác và nhanh chóng hơn.</p><p>* Với hệ thống khách hàng trên toàn cầu, có mặt trên 75 quốc gia việc kinh doanh của bạn trở nên dễ dàng, thân thiện và thuận lợi hơn bao giờ hết khi hợp tác với chúng tôi.</p><p>* Với đội ngũ nhân viên nhiệt tình, trình độ cao, am hiệu về nghiệp vụ ngoại thương, thông thạo với các kỹ năng giao dịch thương mại điện tử, chúng tôi sẽ đem đến cho bạn sự an tâm và thuận lợi trên từng giao dịch, giúp bạn giảm thiểu rủi ro trong quá trình kinh doanh quốc tế.</p><p>* Với khẩu hiệu “AM HIỂU VIỆT NAM – GIAO DỊCH TOÀN CẦU” chúng tôi tâm niệm rằng sự hỗ trợ của chúng tôi sẽ góp phần làm nên thành công của bạn.</p><p>Quy mô công ty: 10-24</p>', '6754485494', 'www.thangloixk.com.vn', 'Huỳnh Văn Thắng', '0988777111', NULL, '9abpsfquzxd4wig3yelkcn2mr0jovt', 0, 1, NULL, '2018-05-16 05:04:48', '2018-05-17 01:47:05'),
(22, 'cuongthinhphat@dienkim.com', '$2y$10$e0ToWDlpKhbm6PO07mK63.8FmbWaPMXFtSALMM4zJQcM/cngJjqXu', 'Công ty cổ phần địa ốc Cường Thịnh Phát', 'cong-ty-co-phan-dia-oc-cuong-thinh-phat', NULL, NULL, '604a Cộng Hoà, Phường 13, Quận Tân Bình, Hồ Chí Minh', '0967123321', 23, 4, NULL, '<p>Cường Thịnh Phát đang hướng đến mục tiêu trở thành một Tập đoàn kinh tế đa ngành, hoạt động chủ yếu trên các lĩnh vực: Bất động sản, đầu tư tài chính. </p><p>\r\nTừ lúc hình thành và phát triển cho đến nay, chúng tôi nhận thấy rằng chìa khóa của sự thành công của Công ty chính là đầu tư đúng mức vào nguồn nhân lực. Nghĩa là phải có chính sách tuyển dụng nhân sự phù hợp, có chính sách đào tạo - phát triển bài bản \r\nvà chính sách đãi ngộ tương xứng. Trong việc dùng người lấy phẩm chất đạo đức làm nền tảng, lấy kiến thức và kỹ năng chuyên môn làm trụ cột để tuyển dụng, đánh giá và phát triển. </p><p>Đội ngũ nhân sự Cường Thịnh Phát sẽ được chăm sóc và phát triển trên nền \r\nvăn hóa mang bản sắc đặc trưng mà chúng tôi gọi là văn hóa 10 chữ “Trung thực – Trung thành – Tận tụy – Trí tuệ – Thân thiện”, điều cốt yếu là phải có “Tâm – Đức– Tài”.</p>', '435783487', 'www.cuongthinhphat.com.vn', 'Trương Công Phát', '0932123942', NULL, 'jkgmtd0ev18axo93uc7s5prqw4bn26', 0, 1, NULL, '2018-05-16 05:08:03', '2018-05-17 01:47:05'),
(23, 'lienphuong@dienkim.com', '$2y$10$1PdMxelAAQOMVW2eJ4KA3.QZoIFxZxAIMOABusF/W4IReG1M50edq', 'Công ty cổ phần dệt may Liên Phương', 'cong-ty-co-phan-det-may-lien-phuong', NULL, NULL, '18 Tăng Nhơn Phú, Phường Phước Long B, Quận 9, Hồ Chí Minh, Việt Nam', '0969123123', 23, 4, NULL, 'Được thành lập từ năm 1960, Công ty cổ phần Dệt may Liên Phương - LPTEX, tiền thân là Công ty Kỹ nghệ tơ sợi Liên Phương - LYSINTEX chuyên sản xuất vải dệt thoi từ sợi tổng hợp.Với sự phát triển không ngừng, đến nay đạt được nhiều thành công nhất định trong lĩnh vực sản xuất vải len hàng đầu Việt nam, đặc biệt công ty đầu tư và đưa vào hoạt động chuỗi sản xuất vải dệt thoi len/ pha len - Saigon Worsted Mill, với năng suất 6.000.000 m/ năm và dây chuyền may Veston cao cấp - VITC Garment , với năng suất 1.500 bộ / ngày', '6546357645', 'www.lptex.vn', 'Vương Thế Nhân', '0931090991', NULL, 'us8hibl9t7kreqm0dwcxp4yo1nz26j', 0, 1, NULL, '2018-05-16 06:44:13', '2018-05-17 01:47:05'),
(24, 'metech@dienkim.com', '$2y$10$gfmKiwzN9pMoLsA/IEgPzuXg4P4DQibfZ.4VKuz2.NEusxw9r6njO', 'CÔNG TY TNHH CÔNG NGHỆ TRUYỀN THÔNG METECH', 'cong-ty-tnhh-cong-nghe-truyen-thong-metech', NULL, NULL, '363/12/4 Bình Lợi, P 13, Bình Thạnh', '0911345111', 23, 3, NULL, 'Tập hợp từ những cá nhân có kinh nghiệm, chuyên môn cao và hoạt động lâu năm trong lĩnh vực thiết kế, quảng cáo và truyền thông đại chúng MeTech chúng tôi không ngừng vững mạnh về tổ chức, về hoạt động truyền thông mà còn phát triển mạnh các chiến lược Internet Marketing, nâng tầm thương hiệu cho khách hàng thông qua một hệ thống website, các diễn đàn, forum, mạng xã hội tương tác của MeTech', '7253485785', 'www.metech.com.vn', 'Trương Huy Chương', '0925111888', NULL, '47n1ifzqk8065t3pvya9cjhudmgx2e', 0, 1, NULL, '2018-05-16 06:47:54', '2018-05-17 01:47:05'),
(25, 'ngaviet@dienkim.com', '$2y$10$RMSkulKq2nx1eTPrBdQgbe6AzpW2NgKx6W/b3bdR4ZPNTu8TzSs/G', 'DOANH NGHIỆP TƯ NHÂN VIỆT NGA', 'doanh-nghiep-tu-nhan-viet-nga', NULL, NULL, '304 QL30, Phường Mỹ Phú, Tp Cao Lãnh, Đồng Tháp', '0978990121', 57, 3, NULL, '', '435346543242', 'www.phanbonvietnga.com', 'Cao Văn Linh', '0909282031', NULL, 's507d6yagumxwl48jhtv29krnbfeo1', 0, 1, NULL, '2018-05-16 06:53:51', '2018-05-17 01:47:05'),
(26, 'vmglienphuong@dienkim.com', '$2y$10$VyCbjvrNjcLN5N.Js5HhiOZczodsHmB7s58ST0x1Lwpn4WqYDNeci', 'Công ty TNHH thời trang VMG', 'cong-ty-tnhh-thoi-trang-vmg', NULL, NULL, '29-31-33-35 Đường D1, Khu đô thị mới Him Lam, Phường Tân Hưng, Quận 7, Thành phố Hồ Chí Minh', '0922331462', 23, 4, NULL, '<p>Công ty TNHH Thời trang VMG kinh doanh trong lĩnh vực phân phối các mặt hàng thời trang cao cấp của thương hiệu thời trang quốc tế VALENTINO CREATIONS, COTE OPERA.\r\n\r\nSớm có mặt trên thị trường phân phối và bán lẻ hàng thời trang cao cấp, Công ty TNHH Thời trang VMG luôn năng động và không ngừng phát triển. Đến nay, hệ thống đã có hơn 50 cửa hàng phân phối chính thức, có mặt tại hầu hết các Trung Tâm thương mại lớn tại TPHCM, Bình Dương, Hà Nội, Hải Phòng, Hạ Long...\r\n\r\nTự hào là nhà nhập khẩu, tiếp thị và độc quyền phân phối nhãn hàng thời trang cao cấp nổi tiếng quốc tế, Tiếp Thị Việt mang lại cho khách hàng Việt Nam thêm nhiều lựa chọn để thể hiện phong cách thời trang đẳng cấp. VMG luôn cam kết cung cấp những sản phẩm và dịch vụ với chất lượng tốt nhất.\r\n</p><p>\r\nGia nhập đội ngũ nhân viên của VMG, các bạn sẽ có nhiều cơ hội được đào tạo, làm việc và tích lũy kinh nghiệm trong một môi trường năng động, sáng tạo; có nhiều cơ hội được thể hiện khả năng của bản thân, những cơ hội thăng tiến, các chế độ đãi ngộ hấp dẫn và phát triển sự nghiệp bền vững.\r\n</p><p>\r\nCông ty TNHH Thời trang VMG trân trọng chào đón những tài năng cùng tâm huyết để xây dựng một môi trường làm việc đồng đội nhiệt huyết, thân thiện, chân thành, đoàn kết và cùng nhau phát triển</p>', '38742435235', 'www.vmg.com.vn', 'Trần Thị Phương Liên', '0961990123', NULL, 'uk0t97f51r8yhazij4v2n6qwmlx3gc', 0, 1, NULL, '2018-05-16 06:58:08', '2018-05-17 01:47:05'),
(27, 'chanhduong@dienkim.com', '$2y$10$WlBtV0n/xrqc7uGtJzRL/Ow2PQhdaQ3ev1avuvRi23nEJdRcBLonW', 'Công Ty TNHH Xưởng Giấy Chánh Dương', 'cong-ty-tnhh-xuong-giay-chanh-duong', NULL, NULL, 'LÔ B 2-CN, ĐƯỜNG D15 - KCN MỸ PHƯỚC 1 - P. MỸ PHƯỚC - TX. BẾN CÁT - BÌNH DƯƠNG', '0922331463', 23, 3, NULL, '<p>* CTY TNHH Xưởng Giấy Chánh Dương\r\n</p><p>\r\n- Công ty được thành lập tại Việt Nam vào năm 2003 với 100% vốn đầu tư nước ngoài . Tổng diện tích 302,500M2, thuộc Tập đoàn giấy Cửu Long trụ sở tại Đông Quan, Quảng Châu, Trung Quốc. </p><p>\r\n- Cty có hệ thống dây chuyền sản xuất Giấy hiện đại với môi trường làm việc năng động, chế độ phúc lợi tốt.\r\n</p><p>- Ngành Sản xuất: Giấy bìa carton cho ngành bao bì đóng thùng giấy carton.\r\n</p><p>- Cty có nhà máy Nhiệt điện với công suất 60M, cấp hơi, cấp điện và hệ thống xử lý nước hiện đại có thể liên tục kiểm soát trực tuyến việc xả nước, khí, khói đảm bảo việc xả thải ổn định và đạt tiêu chuẩn. \r\nCác cơ sở hoạt động sản xuất của Tập Đoàn Cửu Long\r\n</p><p>1. Công ty TNHH Giấy Cửu Long Đông Quản\r\n</p><p>2. Công ty TNHHGiấy Cửu Long (Thái Thương)\r\n</p><p>3. Công ty TNHH Giấy Cửu Long (Trùng Khánh)\r\n</p><p>4. Công ty TNHH Giấy Cửu Long (Thiên Kinh)\r\n</p><p>5. Công ty TNHH Giấy Cửu Long (Tuyền Châu)\r\n</p><p>6. Công ty TNHH Giấy Cửu Long (Thẩm Dương)\r\n</p><p>7. Công ty TNHH Bột Giấy Cửu Long (Đông Sơn)\r\n</p><p>8. Công ty TNHH Giấy Vĩnh Tân Hà Bắc\r\n</p><p>9. Công ty TNHH Bột Giấy Hưng An Cửu Long (Nội Mông Cổ)\r\n</p><p>10. Công ty TNHH Xưởng Giấy Chánh Dương (Việt Nam)\r\n</p><p>\r\n- Chính sách chất lượng :&nbsp; Chất lượng hàng đầu, Khách hàng trên hết, Hoàn thiện quản lý, Không ngưng tiến bộ.</p><p>- Chính sách môi trường và An toàn sức khỏe nghề nghiệp : Sản xuất xanh sạch, đảm bảo an toàn.&nbsp; Tuân thủ pháp luật, cải tiến liên tục. Ngành giấy sinh thái, Chánh Dương hiện đại.\r\n</p><p>\r\n- Công ty tọa lạc tại khu trung tâm TX. Bến Cát, là khu phát triển mạnh về kinh tế và thu hút nhiều nhà đầu tư trong và ngoài nước, nằm trong khu vực thuận tiện về giao thông, gần bến xe, chợ, siêu thị, trung tâm mua sắm, giải trí.\r\n</p>', '4354353453', 'www.ndpaper.com.vn', 'Phạm Thị Dương Hà', '0928199888', NULL, 'gbrco78qth9u1sepjfday2wm50xz34', 0, 1, NULL, '2018-05-16 07:03:33', '2018-05-17 01:47:05'),
(28, 'sunco@dienkim.com', '$2y$10$kQzePp2kfDlBjwXnl4Q6Puwds1wsZpaIPWyjBT696hh1U/901OJ0y', 'CÔNG TY TNHH TƯ VẤN THIẾT KẾ XÂY DỰNG SUNCO', 'cong-ty-tnhh-tu-van-thiet-ke-xay-dung-sunco', NULL, NULL, '23 Đường số 11 Xã Bình Hưng, Huyện Bình Chánh, TP HCM', '0911345110', 23, 3, NULL, '<p>CÔNG TY TNHH TƯ VẤN THIẾT KẾ XÂY DỰNG SUNCO luôn cố gắng tạo nhiều cơ hội thăng tiến &amp; điều kiện để ứng viên làm việc đúng chuyên môn như Kế toán, Kỹ sư, Thư ký,... với chế độ làm việc phù hợp &amp; mức lương thưởng xứng đáng.\r\n</p><p>Đối với nhóm lao động trình độ phổ thông, công ty vẫn có vị trí phù hợp nhằm đáp ứng nhu cầu việc làm cho nhiều đối tượng lao động.</p>', '534536544', 'www.sunco.vn', 'Trần Minh Nhật', '0962111999', NULL, 't049efdyoqbu173i5wvknlp8sxrj26', 0, 1, NULL, '2018-05-16 07:05:50', '2018-05-17 01:47:05'),
(29, 'toanhop@dienkim.com', '$2y$10$QGEyknl78A4pasage0gBUeVAuZqjOif/uNq8zD3J9J2gZyVqZgsy6', 'CTY TNHH THƯƠNG MẠI QUỐC TẾ TOÀN HỢP', 'cty-tnhh-thuong-mai-quoc-te-toan-hop', NULL, NULL, '173A NGUYỄN VĂN TRỖI, PHƯỜNG 11, QUẬN PHÚ NHUẬN, HCM ( Tòa nhà Lutaco, Lầu 3)', '0952123121', 23, 3, NULL, 'Công ty chuyên về lĩnh vực phân phối các sản phẩm thương mại, thành lập tháng 2/2018', '8748783485', 'www.toanhop.com.vn', 'Hoàng Thị Ngọc Trâm', '0911781999', NULL, '3rnfskl8q716ha5c4udtjmvw9zyobi', 0, 1, NULL, '2018-05-16 07:08:30', '2018-05-17 01:47:05'),
(30, 'nhatlophat@dienkim.com', '$2y$10$FNhqUkdIZOFzuTnTUO0R3epR94aHE9rAT1sGmzSBHJZFjQ5Vpf00m', 'Công Ty TNHH Nhất Lộ Phát 168', 'cong-ty-tnhh-nhat-lo-phat-168', NULL, NULL, '11/29 Quang Trung, phường 12, quận gò vấp, tp. Hồ chí minh', '0972123123', 23, 3, NULL, '', '78438782487', 'www.lophat.com.vn', 'Trần Minh Phát', '0952123666', NULL, 'em6t3j4q2x9kny87u1dfivbwhgrols', 0, 1, NULL, '2018-05-16 07:10:39', '2018-05-17 01:47:05'),
(31, 'cattuonggroup@dienkim.com', '$2y$10$Pek8RMZweINft2aD.bh6g.yfnmZy52GlLv8juJu5x/6RWC10p7tuW', 'CÔNG TY CP KD BĐS CÁT TƯỜNG', 'cong-ty-cp-kd-bds-cat-tuong', NULL, NULL, '622 Cộng Hòa, Phường 13, Quận Tân Bình', '0955123121', 23, 3, NULL, '<p>Công ty Cổ Phần Địa Ốc Cát Tường Đức Hòa thành lập ngày 15/07/2011 có trụ sở chính tại số 789 Ấp Mới 1, Xã Mỹ Hạnh Nam, Huyện Đức Hòa, Tỉnh Long An. Sau 5 năm hoạt động dưới điều hành tài tình của Ban Lãnh Đạo và những nỗ lực không ngừng nghỉ của toàn hệ thống. Từ một doanh nghiệp trẻ trong lĩnh vực bất động sản, đến nay, Địa Ốc Cát Tường Đức Hòa đã hoàn thiện về đội ngũ nhân sự gồm 350 nhân viên chính thức, hơn 400 cộng tác viên lành nghề, 16 sàn giao dịch hoạt động tại khu vực tỉnh Long An &amp; TP.HCM, cùng 05 công ty thành viên:\r\n</p><p>\r\n- Công ty CP Kinh Doanh BĐS Cát Tường\r\n</p><p>\r\n- Công ty CP tư vấn đầu tư Cát Tường Long An\r\n</p><p>\r\n- Công ty cổ phần địa ốc Mỹ Hạnh Đức Hòa\r\n</p><p>\r\n- Công ty cổ phần địa ốc Cát Tường Thảo Nguyên\r\n</p><p>\r\n- Công ty cổ phần đầu tư xây dựng thương mại Mỹ Đức L.A\r\n\r\nhoạt động chuyên nghiệp, hiệu quả trong các lĩnh vực: Đầu tư, kinh doanh, phân phối và tiếp thị các sản phẩm bất động sản, cung cấp giải pháp tài chính, tư vấn, thiết kế và cung cấp VLXD…\r\n\r\n\"</p><p>Trong chiến lược phát triển những năm tới, Cát Tường Đức Hòa tiếp tục tập trung vào phân khúc đất nền và nhà phố giá trung bình, hoàn thành mục tiêu: “Trở thành doanh nghiệp hàng đầu trong lĩnh vực bất động sản tại tỉnh Long An và vươn ra toàn quốc”.\r\n</p><p>\r\nĐể thành công và phát triển bền vững, chúng tôi nhận thức rằng bên cạnh định hướng kinh doanh phù hợp thì việc cung cấp sản phẩm chất lượng và dịch vụ thương mại tốt nhất cho khách hàng, lợi ích cho nhà đầu tư, không ngừng nâng cao mức sống cho nhân viên, lợi nhuận phù hợp cho cổ đông và đóng góp tích cực cho cộng đồng chính là sứ mệnh mà chúng tôi luôn hướng đến.\r\n</p><p>\r\nVới nền tảng đã gầy dựng, Cát Tường Đức Hòa sẽ giữ vững, tạo đà cho những bước tăng trưởng bùng nổ trong tương lai, góp phần thúc đẩy phát triển kinh tế và an sinh xã hội tại địa phương, đồng thời nâng cao năng lực cạnh tranh của cộng đồng doanh nghiệp Việt trong quá trình hội nhập và phát triển.\"</p>', '7878457438', 'www.cattuonggroup.com.vn', 'Thái Văn Thương', '0909282032', NULL, '7q0jmt6zhdopg91awx5bkn4vuie3fr', 0, 1, NULL, '2018-05-16 07:14:43', '2018-05-17 01:47:05'),
(32, 'pineal@dienkim.com', '$2y$10$yYKaeh3blAvHxsL/NsEmXeRM32yWokVCY7H3Jx9dmAfVVT7gUAAty', 'CÔNG TY TNHH THƯƠNG MẠI DỊCH VỤ TRUYỀN THÔNG PINEAL', 'cong-ty-tnhh-thuong-mai-dich-vu-truyen-thong-pineal', NULL, NULL, 'Lầu 2, tòa nhà Royal Building, 225 Nguyễn Xí, Phường 13, Quận Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', '0948111222', 23, 3, NULL, '<p>CÔNG TY TNHH THƯƠNG MẠI DỊCH VỤ TRUYỀN THÔNG PINEAL\r\nLầu 2, tòa nhà Royal Building, 225 Nguyễn Xí, Phường 13, Quận Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam\r\nNgành nghề kinh doanh chính: Tổ chức giới thiệu và xúc tiến thương mại .</p><p>Công ty TNHH MTV Thương Mại Dịch Vụ Truyền Thông PINEAL là đối tác duy nhất về Marketing và giới thiệu khách hàng của các Tập đoàn lớn nhất trên thế giới, như: Safecap Investments Lid, Step By Step Services Limited, …tại các thị trường Đông Nam Á. Định hướng Công ty:Là nhà môi giới hàng đầu tại thị trường Việt Nam và các nước trong khu vực Đông Nam Á.</p>', '5532452453', 'www.pineal.com.vn', 'Lê Minh Đạo', '0923888123', NULL, 'ucrl17m46nyfbi3s2woaejgvdt80x5', 0, 1, NULL, '2018-05-16 07:45:53', '2018-05-17 01:47:05'),
(33, 'secom@dienkim.com', '$2y$10$b8I8KhiuBAbBi2/XMIhWgu6qDGxYKtPyVJUKn1LC/h4D/f8n2sFaC', 'Công ty CP DVBV SECOM Việt Nam', 'cong-ty-cp-dvbv-secom-viet-nam', NULL, NULL, 'Toà nhà The Manor, 91 Nguyễn Hữu Cảnh, Q. Bình Thạnh, Tp. Hồ Chí Minh', '0977112909', 23, 3, NULL, '<p>Công ty cổ phần DVBV SECOM Việt Nam là thành viên của tập đoàn SECOM Nhật Bản. Được thành lập năm 2014, nghành nghề kinh doanh chính là cung cấp các giải pháp an ninh chất lượng cao. Chúng tôi đang phát triển dịch vụ an ninh trên hai lĩnh vực:\r\n</p><p>- Bảo vệ bằng công nghệ Online.\r\n</p><p>- Bảo vệ bằng con người.\r\nCông ty chúng tôi đưa đến cho khách hàng các giải pháp an ninh tốt nhất được quản lý chất lượng dịch vụ từ các chuyên gia hàng đầu đến từ Nhật Bản.</p>', '435423355', 'www.secom.vn', 'Lại Văn Thâm', '0958123009', NULL, 'xh9kwqlp7v5jm1ebufczo43irtn6ga', 0, 1, NULL, '2018-05-16 07:48:29', '2018-05-17 01:47:05'),
(34, 'donaland@dienkim.com', '$2y$10$AS86B8msDcPbOhM6hzpm0OhggkfGq.pE8ngv5rxpBt7351/RWBCVi', 'CÔNG TY CỔ PHẦN ĐẦU TƯ DONAL', 'cong-ty-co-phan-dau-tu-donal', '', '', '998 Đồng Văn Cống Phường Thạnh Mỹ Lợi Quận 2', '1234567890', 23, 4, NULL, '<p>DONALAND là công ty chuyên Marketing BĐS, Môi giới và đào tạo môi giới bất động sản. Tập trung chủ yếu về nhà phố, đất nền dự án, biệt thư cao cấp.\r\nVới phương châm “hợp tác để cùng thành công”; mục tiêu “hướng đến sự hoàn thiện” DONALAND luôn nỗ lực không ngừng về nhân lực lẫn vật lực, tạo niềm tin và gây dựng thương hiệu uy tín, mong muốn mang lại những gì tốt nhất cho khách hàng khi đến với Donaland.\r\n</p><p>\r\nVĂN HÓA CỦA CHÚNG TÔI\r\nChúng tôi làm việc trên tinh thần hợp tác, cam kết, tôn trọng, cùng có lợi dựa trên “10 nguyên tắc Vàng” của Donaland\r\n</p><p>1. Cam kết phải đạt được thành công và lúc nào cũng nhiệt tâm.\r\n</p><p>2. Chia sẽ thành công với những ai đã giúp đỡ bạn.\r\n</p><p>3. Tạo động lực cho mình và cho người khác, để đạt được điều mình mơ ước.\r\n</p><p>4. Truyền thông với người khác và bày tỏ rằng bạn đang quan tâm đến họ.\r\n</p><p>5. Trân trọng và ghi nhận những nỗ lực, cùng thành quả của người khác.\r\n</p><p>6. Tổ chức mừng thành tựu của bạn và của người khác.\r\n</p><p>7. Lắng nghe người khác và học hỏi ý tưởng của họ.\r\n</p><p>8. Vượt hơn mong đợi của khách hàng và của người khác.\r\n</p><p>9. Kiểm soát chi phí để rút ngắn con đường làm giàu.\r\n</p><p>10. Tập thể thắng! chứ không phải cá nhân thắng.\r\n</p><p>\r\nLÀM VIỆC VỚI CHÚNG TÔI\r\n</p><p>Với đội ngũ nhân viên chuyên nghiêp (hơn 20 nhân viên), có chuyên môn sâu và được đào tạo bài bản trong lĩnh vực BĐS, Môi giới, Donaland tự hào mang đến cho khách hàng nhà phố đẹp, biệt thự sang, mảnh đất “vàng”… đảm bảo về chất lượng và giá cả hợp lý mà vẫn đáp ứng nhu cầu cụ thể của từng đối tượng khách hàng. Cụ thể:\r\n</p><p>•	Thầy Nguyễn Thành Tiến – chuyên gia BĐS đắt giá nhất Việt Nam\r\n</p><p>•	Ông Dương Thế Hiệp – chuyên gia môi giới BĐS đầu tư\r\n</p><p>•	Ông Nguyễn Văn Mạnh – chuyên gia Marketing và Giám đốc công ty OBUS\r\n•	Bà Trần Thùy Trang – chuyên gia về xây dựng nội thất và CEO Vannice\r\n•	Ông Hoàng Văn Quyền – Giám đốc Kohler Việt Nam\r\n</p><p>•	Ông Nguyễn Anh Khoa – chuyên gia bán biệt thự the Villas\r\n</p><p>•	…\r\nDONALAND –NƠI CUỘC SỐNG PHỒN THỊNH</p>', '7341857348', 'www.donaland.vn', 'Trần Thị Thu Sương', '0911781991', 0, 'eyfi315tvx2g6o8n7w4lukqasmzh9r', 0, 1, 0, '2018-05-16 07:52:02', '2018-05-17 01:47:05'),
(35, 'hoasenviet@dienkim.com', '$2y$10$Bu3TCADhMmiUMKL33CwENuMUHpEohSi9TL5tXAmMPcUa7gneSAYMu', 'Công ty TNHH Hoa Sen Việt', 'cong-ty-tnhh-hoa-sen-viet', NULL, NULL, 'Trụ sở: Tầng 10, Tòa nhà HD, 25 Bis Nguyễn Thị Minh Khai, Q1, TP. HCM', '0921111222', 23, 3, NULL, '<p>Công ty TNHH Hoa Sen Việt (VietLotus) được thành lập từ năm 2004, là một trong những Công ty kinh doanh thành công trong ngành bán lẻ Mỹ phẩm và Thời trang tại Việt Nam. Sau hơn 12 năm hoạt động, Công ty đang sở hữu hệ thống bán lẻ với 75 cửa hàng trên toàn quốc cho các Thương hiệu nổi tiếng Thế giới như:\r\n</p><p>\r\n- THEFACESHOP - Một trong những thươnghiệu mỹ phẩm hàng đầu tại Hàn Quốc, đang được Công ty phân phối độc quyền tại Việt Nam\r\n- ADIDAS – Thương hiệu nổi tiếng đến từ Đức , đang được Công ty mở rộng phát triển\r\n</p><p>- FRANCO SARTO &amp; NATURALIZER - Thương hiệu giày thời trang cao cấp nữ nổi tiếng của Mỹ với thiết kế theo phong cách Ý, ưu tiên sức khỏe cho đôi chân.\r\n\r\nVới phương châm “con người là tài sản quý giá nhất mang đến những giá trị bền vững cho thương hiệu và doanh nghiệp trong tương lai” Công ty rất chú trọng việc phát triển đào tạo nguồn nhân lực, tạo môi trường làm việc chuyên nghiệp, năng động cho nhân viên. Khi gia nhập cùng Hoa Sen Việt bạn sẽ có các cơ hội:\r\n</p><p>- Được hưởng đầy đủ các chế độ BHXH-BHYT theo quy định của Luật lao động.\r\n</p><p>- Công việc ổn định lâu dài và có nhiều cơ hội học hỏi và phát triển\r\n- Thu nhập cạnh tranh, xứng đáng với năng lực\r\n</p><p>- Được mua BH sức khỏe &amp; mua sản phẩm nội bộ với chính sách ưu đãi, hấp dẫn.\r\n</p><p>- Thưởng các ngày lễ tết, thưởng tháng 13,14 theo quy định của công ty</p><p>- Quà tặng các dịp sinh nhật, trung thu, ốm đau, hiếu hỉ, thai sản, du lịch hàng năm\r\n\r\nTrụ sở Công ty: Lầu 10, HD Bank Tower, 25 Bis Nguyễn Thị Minh Khai, Q1 – TP.HCM\r\nChi nhánh Miền Bắc: Tầng 7 – Tòa nhà GELEXIMCO, Số 36 Phố Hoàng Cầu, Phường Ô Chợ Dừa - Quận Đống Đa - Hà Nội</p>', '4523534', 'www.thefaceshop.com.vn', 'Lương Thế Vinh', '0909282034', NULL, '0ed95w1nohgrck2q3myj47xt8zapis', 0, 1, NULL, '2018-05-16 07:54:58', '2018-05-17 01:47:05'),
(36, 'vietdang@dienkim.com', '$2y$10$8En3lkfPZJcA0GWWtNLt8O4Qps07EoGrvSSqNfGdS6Lmj9JpfuwMW', 'CÔNG TY CỔ PHẦN TRANG THIẾT BỊ Y NHA KHOA VIỆT ĐĂNG', 'cong-ty-co-phan-trang-thiet-bi-y-nha-khoa-viet-dang', NULL, NULL, '18 Sông Thương, Phường 2, Quận Tân Bình, HCM', '0922331460', 23, 3, 'ironmanarmormarkvii4k-xahytcw9dko4.jpg', '<p>Năm 2000: </p><p>- Thành lập công ty cổ phần trang thiết bị Y nha khoa Việt Đăng. </p><p>- Hợp tác với nhà cung cấp chính là SDI, BONARD &amp; một số nhà cung cấp khác. Cong ty Viet Dang</p><p>- Phát triển thương hiệu “Pola Office” - một trong những hệ thống tẩy trắng răng nổi tiếng nhất tại Việt Nam. </p><p>Năm 2006: </p><p>- Trở thành NHÀ PHÂN PHỐI ĐỘC QUYỀN của nhãn hiệu KERR - Mỹ, với nhiều sản phẩm mang tính đột phá về công nghệ. </p><p>- Phát triển thương hiệu “Anthogyr” - một trong những hệ thống implant đầu tiên tại Việt Nam. </p><p>Năm 2008 </p><p>- Mở rộng danh mục sản phẩm, khi phân phối các sản phẩm Meta Biomed, Diadent. </p><p>- Tháng 9, doanh số gia tăng khi hợp tác phát triển sản phẩm Implant Dentium - Hàn Quốc. </p><p>- Tháng 11, 100 nha sĩ tham gia chứng kiến sự kiện công ty Việt Đăng trở thành NHÀ PHÂN PHỐI ĐỘC QUYỀN của thương hiệu Implant Dentium. </p><p>Từ năm 2009 đến 2011: </p><p>- Tháng 04/2009, đã thành công dẫn đoàn 15 nha sĩ Việt Nam tham quan nhà máy cũng như văn phòng làm việc của Dentium - Hàn Quốc &amp; tham dự Dentium World Symposium. </p><p>- Tháng 11/2011, tổ chức thành công dẫn đoàn 30 nha sĩ Việt Nam tham dự Dentium World Symposium tại Mỹ. </p><p>- Liên tục giành được quyền phân phối độc quyền thương hiệu KAVO, GENDEX, ... với các sản phẩm: ghế máy, tay khoan, thiết bị để bàn, thiết bị chẩn đoán hình ảnh, ... </p><p>Năm 2012: </p><p>- Theo nghiên cứu thị trường, công ty đứng top 10 những công ty cung cấp giải pháp toàn diện nha khoa tại thị trường Việt Nam. </p><p>Tháng 4/2012, công ty Việt Đăng chính thức trở thành đại diện phân phối độc quyền sản phẩm ghế máy chất lượng cao và công nghệ tiến tiến đến từ Hoa Kỳ.&nbsp;</p>', '53426456', 'www.vietdang.com.vn', 'Lương Xuân Trường', '0977123129', NULL, 'hmil4x3tcygzbj71r0av95qdf6nop8', 0, 1, NULL, '2018-05-16 08:32:29', '2018-05-17 01:47:05'),
(37, 'doctordong@dienkim.com', '$2y$10$vHg/4c.TpjTzYzS6g.4gkuO2YbKX14sCBOK1z2sTQBw1Ww4zQie4i', 'CÔNG TY TNHH MTV TƯ VẤN TÀI CHÍNH LGC', 'cong-ty-tnhh-mtv-tu-van-tai-chinh-lgc', NULL, NULL, 'Số 27B Nguyễn Đình Chiểu, Phường Đa Kao, Quận 1, TP. HCM', '09223314634', 23, 3, NULL, '<p>Công ty TNHH Một Thành viên Tư vấn Tài Chính LGC (LGC) là Công ty Tư Vấn Tài Chính được thành lập vào năm 2015. </p><p>\r\nMục tiêu hoạt động của công ty là cung cấp dịch vụ tư vấn giải pháp tài chính tin cậy và là công cụ kết nối khách hàng với các đối tác cho vay thông qua thủ tục đơn giản, tức thì.</p>', '734832543', 'www.doctordong.vn', 'Nguyễn Thị Kim Xuân', '0977123122', NULL, 'xg3ve9k5whi8un0t1rls7fdmy24pqo', 0, 1, NULL, '2018-05-16 09:12:17', '2018-05-17 01:47:05'),
(38, 'archiaz@dienkim.com', '$2y$10$LBlOftqJouY0uqo4m41i2uWj75q36P0CFNX8.42EvMqTr.vSAlVH2', 'Công ty TNHH ARCHI A - Z', 'cong-ty-tnhh-archi-a-z', NULL, NULL, '1073 Phan Văn Trị, Phường 10, Quận Gò Vấp, Thành phố Hồ Chí Minh', '0911345119', 23, 3, NULL, 'Chuyên thiết kế và thi công nội thất các công trình như: Salon Beauty,Showroom mỹ phẩm,Spa,Văn phòng,Chung cư,Biệt thự,Nhà ở.Là nhà thầu thiết kế và thi công chính cho các hãng my phẩm nổi tiếng như: Lancome,L\'oreal,Vichy,TheFaceShop,VDL,Grabtree &amp; Evelyn,Givenchy,Samsonite,Viettinbank', '54356765754', 'www.archia-z.vn', 'Phan Huy Ích', '0909282037', NULL, 'mjnqihay705g42zekrds39voxubt6c', 0, 1, NULL, '2018-05-16 09:21:46', '2018-05-17 01:47:05'),
(39, 'giaohangnhanh@dienkim.com', '$2y$10$VWEdb85ibht1lUiB.oz16.8XMaD961gqHOAwrTaTfMyn2zSVS2skm', 'Công Ty Cổ Phần Dịch Vụ Giao Hàng Nhanh', 'cong-ty-co-phan-dich-vu-giao-hang-nhanh', NULL, NULL, '70 Lữ Gia, Phường 15, Quận 11 HCM', '0911345112', 23, 3, NULL, '<p>Công ty Giaohangnhanh.vn được thành lập ngày 20/6/2012 theo Giấy phép đăng ký kinh doanh số: 0311907295, do Sở KHĐT TPHCM cấp, với ngành nghề hoạt động chính là cung cấp dịch vụ chuyển phát nhanh. Là công ty trẻ được đánh giá cao trong lĩnh vực giao nhận Việt Nam, tốc độ tăng trưởng 100%/tháng, nhiều cơ hội làm việc và thăng tiến hấp dẫn (ít nhất 150 vị trí quản lý trong năm 2017).</p>', '4354236', 'www.giaohangnhanh.vn', 'Lê Thánh Tôn', '0930990123', NULL, 'qpiov78glk2cwx3seyrm5jab609tn1', 0, 1, NULL, '2018-05-16 09:25:19', '2018-05-17 01:47:05'),
(40, 'mangsinbad@dienkim.com', '$2y$10$E.PtMTkKmqL7uVTMIWjkyuHWkVAuzX6bvk6Ho0HQwfO75BoptzaRC', 'CÔNG TY TNHH CÔNG NGHỆ MẠNG SINBAD', 'cong-ty-tnhh-cong-nghe-mang-sinbad', '', '', '425A Nguyễn Văn Luông, Phường 12, Quận 6', '0989123999', 23, 3, NULL, 'Nguồn nhân viên công ty 200-300 người, môi trường công việc thanh lịch, cơ chế xúc tiến công việc rõ ràng và chương trình đánh giá hiệu quả hiện đại hóa, do đó thu nhập nhân viên cao hơn so với đồng nghiệp, hoan nghênh chào đón những ai đang có mong muốn tìm việc ổn định.', '4231534535', 'www.sinbad.com.vn', 'Đỗ Văn Mạnh', '0987111222', 0, '59btauxnwlrkmhy3dcvje687qs4gzf', 0, 1, 0, '2018-05-16 09:27:52', '2018-05-17 01:47:05'),
(41, 'mattroido@dienkim.com', '$2y$10$TSHZyPQdSsG2L2HP70s4EusOLNXH05IepeWQjBnvIS1ADzP5ML7hG', 'Công ty TNHH Thời trang Mặt Trời Đỏ', 'cong-ty-tnhh-thoi-trang-mat-troi-do', NULL, NULL, '21/5 Đường số 3, khu nhà ở An Bình, Phường Bình An, Q2', '0977112901', 23, 4, NULL, '<p>Sản xuất và kinh doanh các sản phẩm thời trang, nội thất, tại thị trường Việt Nam và xuất khẩu đi Mỹ, Châu Âu, Nhật Bản.\r\n</p><p>Quy trình công việc rõ ràng và chuyên nghiệp đảm bảo luôn biết rõ ai làm việc gì, trách nhiệm như thế nào.\r\n</p><p>Toàn bộ các hoạt động sản xuất kinh doanh được hệ thống hóa bằng bảng biểu, phần mềm giúp giảm thiểu tối đa sai sót và tăng cao hiệu xuất làm việc của nhân viên nhiều lần.\r\nKhông có nhiều tầng nấc cấp bậc đảm bảo cấp điều hành cao nhất luôn gần gũi với mọi công việc và con người ở cấp thấp nhất, để thấu hiểu, giúp đỡ mọi nhân viên hoàn thành nhiệm vụ.</p>', '7848758725', 'www.mattroido.vn', 'Lê Văn Thương', '0987111221', NULL, 'hswuqjcaky32rbo46i7mgxt91e50dn', 0, 1, NULL, '2018-05-16 09:34:08', '2018-05-17 01:47:05');
INSERT INTO `employer` (`id`, `email`, `password`, `fullname`, `alias`, `meta_keyword`, `meta_description`, `address`, `phone`, `province_id`, `scale_id`, `logo`, `intro`, `fax`, `website`, `contacted_name`, `contacted_phone`, `user_id`, `certification_code`, `certificated_number`, `status`, `status_authentication`, `created_at`, `updated_at`) VALUES
(42, 'pmcorp@dienkim.com', '$2y$10$P/MgHD/NdwB/El8B7cWP4OaDgi.s3Yn.8kNMymM/memUmS8Vs6dwa', 'CÔNG TY CỔ PHẦN TM-DV CƠ ĐIỆN LẠNH P&M', 'cong-ty-co-phan-tm-dv-co-dien-lanh-pm', NULL, NULL, '436B/106/4, đường 3 tháng 2, phường 12, Q10', '0999111222', 23, 3, NULL, '<p>Công ty TNHH TM-DV Cơ Điện Lạnh P&amp;M (PME) là một trong những công ty chuyên nghiệp nhất Việt Nam về lĩnh vực thiết kế và thi công các hệ thống kỹ thuật Cơ - Điện – Điện lạnh cho các công trình qui mô lớn và theo tiêu chuẩn quốc tế.\r\n</p><p>Ban lãnh đạo công ty và các chuyên viên là những người tiên phong về lĩnh vực cơ điện lạnh công trình cao cấp tại Việt Nam từ những năm 1980 đến nay. Họ là những người đầu tiên tham gia xây dựng các khách sạn, trung tâm thương mại, cao ốc văn phòng theo tiêu chuẩn quốc tế đầu tiên tại Việt Nam, và tiếp tục đi sâu vào chuyên ngành cho đến hôm nay.</p>', '785238478', 'www.pmecorp.com.vn', 'La Hoàng Khải', '0909282039', NULL, 'gkzwj95q36yve2x7nfbpc8hdt1s4mo', 0, 1, NULL, '2018-05-16 09:40:02', '2018-05-17 01:47:05'),
(43, 'galaxydr@dienkim.com', '$2y$10$dXztfSPHel.pWV5GX1qwKeFHoIkQ/bRZROEe84kmY17e.mXyMcTB2', 'Công ty TNHH GalaxyDR', 'cong-ty-tnhh-galaxydr', NULL, NULL, 'Tầng 1;2 Tòa nha PVL Linh Tây Tower, Số 05, Đường 1, Phường Linh Tây, Quận Thủ Đức, TPHCM', '0922331464', 23, 3, NULL, '<p>CÔNG TY TNHH DỊCH VỤ THU HỒI NỢ THIÊN HÀ là công ty hàng đầu về lĩnh vực thu hồi nợ cho các Công ty tài chính, các Ngân hàng. Ngoài ra, Công ty Thiên Hà còn là một trong những công ty thu hồi nợ chuyên nghiệp và hợp pháp nhất Việt Nam hiện nay.\r\n</p><p>Nhân viên của Thiên Hà là giới tri thức trẻ, năng động, nhiệt huyết với công việc. Tập thể nhân viên Thiên Hà luôn cố gắng, phấn đấu làm tốt nhiệm vụ đặt ra.</p>', '54364644', 'www.galaxydr.com.vn', 'Đỗ Mạnh Cường', '0966123121', NULL, 'os5c726hvdimr1tbwnlaep40jf8uzy', 0, 1, NULL, '2018-05-16 09:43:55', '2018-05-17 01:47:05'),
(44, 'cfyc123@dienkim.com', '$2y$10$F97AbuTiX2tk90A57Qd25.gi05KqqtS3H7p3VKax9NfsGj7kYOdMq', 'California Fitness And Yoga Centers', 'california-fitness-and-yoga-centers', NULL, NULL, 'Tòa nhà Queen Ann, 28-30-32 Lê Lai, P.Bến Thành, Quận 1; CN HN: 88 Láng Hạ, Đống Đa, Hà Nội', '0955111333', 23, 3, NULL, '<p>\"CHÚNG TÔI MUỐN CHỨNG MINH RẰNG ĐỂ CÓ ĐƯƠC CUỘC SỐNG TỐT VÀ LÀNH MẠNH HƠN, BẠN KHÔNG NHẤT THIẾT PHẢI TUÂN THEO KỶ LUẬT THÉP HOẶC PHẢI HY SINH; THAY VÀO ĐÓ, CHỈ CẦN ĐƯA VÀO LỐI SỐNG CỦA MÌNH NHỮNG THÓI QUEN GIÚP NÂNG CAO CHẤT LƯỢNG CUỘC SỒNG, ĐỒNG THỜI GIẢM THIỂU NHỮNG THÓI QUEN KHÔNG CÓ LỢI.\"\r\nNăm 2007 California Fitness & Yoga trở thành công ty thể dục thể hình quốc tế đầu tiên và lớn nhất ra mắt tại Việt Nam. Với sứ mệnh “Làm Cho Cuộc Sống Tốt Đẹp Hơn”, California Fitness & Yoga không chỉ đơn thuần giống như bao phòng tập thông thường khác. Đây là trung tâm của phong cách sống năng động, nhằm truyền cảm hứng, mang lại niềm vui sảng khoái cũng như nguồn sinh khí mới cho cộng đồng.\r\n</p><p>\r\nĐây là nơi hội tụ của việc luyện tập, thời trang và giải trí trong một môi trường lành mạnh, tràn trề sinh lực. Từ âm nhạc và ánh sáng cho tới các trang thiết bị hiện đại và đội ngũ huấn luyện viên đẳng cấp quốc tế, mỗi chi tiết đều được chuẩn bị một cách tỉ mỉ và công phu, nhằm mang lại những trải nghiệm tích cực và tuyệt vời nhất cho khách hàng.</p>', '784543543534', 'www.cfyc.com.vn', 'Lê Thành Đạt', '0909282033', NULL, 'njy8blwmvfszxip0d6a2ket31rg47c', 0, 1, NULL, '2018-05-16 09:48:11', '2018-05-17 01:47:05'),
(45, 'saigonhousecenter@dienkim.com', '$2y$10$dV.UyRng6Fqd01MSAMPw2O7LZPqyNdB3cUrACAFXgW5QpHOS0ITYq', 'Công ty Cổ phần Dịch vụ Bất động sản Trung tâm nhà Sài Gòn', 'cong-ty-co-phan-dich-vu-bat-dong-san-trung-tam-nha-sai-gon', NULL, NULL, 'Lầu 2 - 161 Võ Văn Tần, Phường 6, Quận 3', '0921111221', 23, 3, NULL, '<p>Công ty Cổ phần Dịch vụ Bất động sản Trung tâm nhà Sài Gòn với đội ngũ nhân viên chuyên nghiệp, nhiệt huyết và giàu kinh nghiệm trong lĩnh vực Bất động sản tại các quận trung tâm như 1,3, 10, Bình Thạnh, Tân Bình...</p><p>Môi trường làm việc thân thiện, tinh thần đoàn kết hợp tác, phong thái chuyên nghiệp, tính kỷ luật cao của đội ngũ nhân viên là yếu tố giúp công ty ngày càng vững mạnh và phát triển</p>', '378218523', 'www.saigonhousecenter.vn', 'Trương Tấn Diệp', '0987111223', NULL, 'e9oi5j6maf8ulv0qt7crzgn1pwxshk', 0, 1, NULL, '2018-05-16 09:50:45', '2018-05-17 01:47:05'),
(46, 'cuongthanh@dienkim.com', '$2y$10$OTXk7iof/vCw0H7l49QbRe9ksa6qJFLQn0e6IE5Zvf1fQD7l/ig9q', 'Công ty Cổ phần Ô tô Cường Thanh', 'cong-ty-co-phan-o-to-cuong-thanh', NULL, NULL, '161F Dạ Nam, Phường 3, Quận 8', '0922331465', 23, 3, NULL, '', '4364564564', 'www.chevroletsaigon.com.vn', 'Trương Văn Long', '0987111224', NULL, 'wna5gyijk7h3zv8oel0qfdur16cb4m', 0, 1, NULL, '2018-05-16 09:52:59', '2018-05-17 01:47:05'),
(47, 'kingdomkaraoke@dienkim.com', '$2y$10$THcS1RQHLDkXvSXanKXHiO3bPIDkWF9mrrx1b7tsU6fq8CBQKaboS', 'CÔNG TY TNHH THƯƠNG MẠI KARAOKE KINGDOM', 'cong-ty-tnhh-thuong-mai-karaoke-kingdom', NULL, NULL, '67 Phạm Viết Chánh, Phường Nguyễn Cư Trinh, Quận 1', '0966111222', 23, 3, NULL, '<p>Karaoke – Nhà hàng KINGDOM với mô hình giải trí hiện đại bậc nhất tại Sài Gòn mang đậm bản sắc văn hóa Việt hòa quyện cùng phong cách cổ điển Châu Âu tráng lệ, tọa lạc tại khu trung tâm Quận 1 sang trọng với 22 phòng hát được thiết kế độc đáo, khác biệt, nhiều phong cách khác nhau, dàn âm thanh hiện đại từ nước ngoài với danh sách bài hát mới luôn được cập nhật thưởng xuyên.\r\n</p><p>\r\nHệ thống Karaoke – Nhà hàng KINGDOM gồm 4 chi nhánh:\r\n</p><p>*Kingdom Trần Quang Khải\r\n218 - 220 Trần Quang Khải, Phường Tân Định, Quận 1, TP.HCM\r\n(NGã ba đường Trần Quang Khải và Hai Bà Trưng)\r\n</p><p>*Kingdom Phạm Viết CHánh\r\n(Gần vòng xoay)\r\n67 - 69 Phạm Viết Chánh, P.Nguyễn Cư Trinh, Quận 1, TP.HCM\r\n\r\nĐể đáp lại thị hiếu của khách hàng đã dành cho Karaoke KINGDOM mở thêm 2 chi nhánh mới Beer Club và Nhà Hàng Nướng Kingdom BBQ:\r\n</p><p>*Kingdom Lê Văn Sỹ\r\n236A Lê Văn Sỹ, Phường 1, Quận Tân Bình, TP.HCM\r\n</p><p>*Kingdom Lê Văn Hưu\r\n26-28-30-32 Lê Văn Hưu, Phường Bến Nghé, Quận 1, TP.HCM\r\nĐẳng cấp đến từ sự khác biệt từ mỗi chi nhánh\r\n\r\nTrang hoàng cho mỗi phòng karaoke một phong cách khác nhau không còn là chuyện xa lạ tại Tp.HCM, nhưng ở Kingdom, sự khác biệt ấy còn đi liền với phong cách và đẳng cấp không thể trộn lẫn.\r\n</p><p>Người ta có thể bắt gặp hình ảnh một Hà Nội trầm mặc với những ngõ nhỏ, phố nhỏ, mà đó còn là thế giới của những ai đam mê công nghệ với phòng Vertu được thiết kế sang trọng và lịch lãm. </p><p>Phòng Ferrari dành cho những bạn trẻ cá tính ham mê tốc độ. Phòng Ba Tư nhuốm màu huyền thoại… Đặc biệt hơn nữa, khi bước vào phòng âm nhạc, bạn sẽ có cảm giác mình chuẩn bị bước lên một sân khấu lớn để chuẩn bị làm thần tượng với hệ thống âm thanh, ánh sáng hiện đại giúp bạn thỏa giấc mơ trở thành ngôi sao ca nhạc.</p>', '54654689456', 'www.kingdomkaraoke.vn', 'Trương Viết Sáng', '0987111225', NULL, 'i3u46wsvmtl0b2pdneka98zo1gcy5x', 0, 1, NULL, '2018-05-16 09:55:56', '2018-05-17 01:47:05'),
(48, 'phobaochi@dienkim.com', '$2y$10$mMryWeCAg0YN6rLDmYfXLuYT0D.EmS3kTaWOCfwaQ3mxIt5ZT36MW', 'CÔNG TY TNHH QUẢNG CÁO CHI PHÓ BẢO', 'cong-ty-tnhh-quang-cao-chi-pho-bao', NULL, NULL, '1460 Võ Văn Kiệt, Phường 1, Quận 6,Thành Phố Hồ Chí Minh', '0988122332', 23, 3, NULL, '<p>Công nghệ mạng ngày càng phát triển và ảnh hưởng sâu sắc tới cuộc sống. Nhu cầu học tập, mua sắm, vui chơi, khám chữa bệnh… đều nhận được sự hỗ trợ đắc lực từ thế giới internet.\r\n</p><p>Cùng với xu hướng phát triển mạnh mẽ của công nghệ,Công ty TNHH Quảng Cáo Chi Phó Bảo đã được thành lập vào ngày 17/4/2017 với sứ mệnh nâng cao chất lượng cuộc sống, thúc đẩy tiêu dùng qua việc khai thác lợi ích của internet. </p><p>\r\nCông ty quy tụ đội ngũ nhân viên trẻ trung, nhiệt huyết, giàu sáng tạo, trình độ chuyên môn cao trong nhiều lĩnh vực như: Thiết kế, Code, Biên tập, Chăm sóc khách hàng và Marketing online như SEO, Google Adwords…\r\nBên cạnh đó, Công ty còn thành lập Trung tâm đào tạo Marketing online – một lĩnh vực mới và chưa có nhiều cơ sở đứng ra tổ chức đào tạo, với mong muốn đem kiến thức Marketing online áp dụng phổ biến trong đời sống và tạo dựng công việc cho nhiều lao động.</p><p>Chúng tôi tin rằng Công ty sẽ là Cầu nối tin cậy của các doanh nghiệp, phòng khám, bệnh viện, trường học,… nhằm quảng bá thương hiệu, dịch vụ của các đối tác tới người tiêu dùng một cách thuận tiện, nhanh chóng nhất thông qua mạng internet.\r\n</p><p>Với mục tiêu, sứ mệnh đã đề ra, Chi Phó Bảo luôn nỗ lực và chú trọng đầu tư cơ sở vật chất, xây dựng môi trường làm việc hiện đại, thoải mái, tạo điều kiện để nhân viên có thể phát huy tối đa sự sáng tạo và đem lại hiệu quả công việc cao nhất.</p>', '453757833', 'www.phochibao.com.vn', 'Dương Thu Sương', '0988777112', NULL, 'm2zacihk3e407rxyjpq6dol85fwgvs', 0, 1, NULL, '2018-05-16 09:58:49', '2018-05-17 01:47:05'),
(49, 'hiepphong@dienkim.com', '$2y$10$8AgXQQSDnB1R9ZRAX5D7l.2yATp14njVWYXVQUVQPbawRH7qiiLie', 'CÔNG TY TNHH TM-DV-SX THIẾT BỊ ĐIỆN HIỆP PHONG', 'cong-ty-tnhh-tm-dv-sx-thiet-bi-dien-hiep-phong', NULL, NULL, '326/5 TÂN PHƯỚC, Phường 7, Quận 10', '0988122445', 23, 3, NULL, '<p>Ra đời chính thức từ cuối năm 2000 nhưng Hiệp Phong đã được biết đến từ 11 năm trước là đơn vị chuyên sản xuất các loại thiết bị và dịch vụ chuyên dùng cho máy phát điện hàng đầu tại Tp. Hồ Chí Minh bao gồm hệ thống cách âm, che mưa, thử tải điện trở v.v\\...Hiệp Phong chuyên cung cấp các loại phụ kiện và dịch vụ lắp đặt máy theo tiêu chuẩn kỹ thuật tiên tiến nhất. </p><p>\r\nHoạt động kinh doanh chính của Hiệp Phong hiện nay là kinh doanh link kiện điện công nghiệp, đầu phát điện, động cơ diesel, các loại máy phát điện có công suất từ 20 ~ 2000 KVA. </p><p>\r\nCùng với sự thuần thục của đội ngũ công nhân kỹ thuật, sự hài hòa và chuyên nghiệp giữa máy móc cùng bàn tay khéo léo, lành nghề. Tất cả để tạo nên chất lượng hàng đầu và là nét đặc trưng riêng biệt, nổi bật cho các sản phẩm của Hiệp Phong.\r\nBắt đầu từ năm 2013, công ty mở thêm lĩnh vực thiết kế &amp; sản xuất các vách trang trí nội thất 2D, 3D. </p><p>Với đội ngũ nhân viên năng động và chuyên nghiệp, chúng tôi sẽ mang đến cho bạn những sản phẩm độc đáo và phù hợp với không gian sống của bạn.</p>', '63246264782', 'www.hiepphong.com.vn', 'Dương Quốc Hiệp', '0988777113', NULL, 'xqnfphyjv7uctzga62e81b9dsim0k4', 0, 1, NULL, '2018-05-16 10:01:13', '2018-05-17 01:47:05'),
(50, 'ocphuocdien@dienkim.com', '$2y$10$/.YHAXUqTjANHlKev2ykyuJeEAK4byk1dJMTC1OdBUHu6i4ia/.NO', 'CÔNG TY CỔ PHẦN XÂY DỰNG THƯƠNG MẠI DỊCH VỤ ĐỊA ỐC PHƯỚC ĐIỀN', 'cong-ty-co-phan-xay-dung-thuong-mai-dich-vu-dia-oc-phuoc-dien', NULL, NULL, 'Thửa Đất Số 1208, Tờ Bản Đồ Số 43, Khu Thương Mại Dịch Vụ Đô Thị Sóng Thần, P. Dĩ An, TX. Dĩ An, Bình Dương', '0988122446', 23, 3, NULL, '<p>Công ty cổ phần Xây dựng Thương mại Dịch vụ Địa Ốc Phước Điền được thành lập từ 02/2016 với định hướng ngay từ ban đầu là đầu tư, kinh doanh bất động sản.\r\n</p><p>Là doanh nghiệp ra đời trong thời điểm thị trường bất động sản trên đà phát triển mạnh đi sau nhiều công ty bất động sản lớn khác vì vậy Phước Điền không tránh khỏi những áp lực cạnh tranh không hề nhỏ tuy nhiên bằng kinh ngiệm,tâm huyết của ban lãnh đạo cộng với chiến lược phát triển rõ ràng bền vững từng bước của công ty phước điền đã khảng định được vị trí và niềm tin đối với khách hàng .\r\n</p><p>Với phương châm \"UY TÍN – HIỆU QUẢ - PHÁT TRIỂN BỀN VỮNG \",mọi hoạt động kinh doanh của doanh nghiệp đều hướng tới xây dựng sự tin tưởng và đem lại lợi ích tối đa của cổ đông, đối tác và của khách hàng; luôn năng động, sáng tạo trong quá trình xây dựng và phát triển; coi đó là lợi ích cốt lõi của chính doanh nghiệp.\r\n</p><p>Bằng sự tận tâm, nhiệt huyết của Ban lãnh đạo Công ty và sự đoàn kết, nỗ lực không mệt mỏi của toàn thể cán bộ, nhân viên, Công ty cổ phần Xây dựng Thương mại Dịch vụ Địa Ốc Phước Điền tin tưởng sẽ đạt được sự hài lòng của khách hàng, sự tin tưởng của đối tác và nhà đầu tư, phấn đấu trở thành một trong những thương hiệu uy tín hàng đầu Việt Nam trong lĩnh vực Bất động sản.\r\nTrụ sở : Số 1 Lô F, Đường D2, Khu Thương Mại Dịch Vụ Đô Thị Sóng Thần, P. Dĩ An, TX. Dĩ An, Bình Dương</p>', '87857458743', 'www.ocphuocdien.vn', 'Lê Văn Điền', '0988777114', NULL, 'ypwi23dhrnkfgbj5ax6917cqszotmu', 0, 1, NULL, '2018-05-16 10:04:26', '2018-05-17 01:47:05'),
(51, 'bonte324@dienkim.com', '$2y$10$KIB5lkYRzFy7zSemKmJ9eOoTTSoNwLhBb5IBW5MKX68tIUdmxEdge', 'Công ty TNHH TM - DV Bốn Tê', 'cong-ty-tnhh-tm-dv-bon-te', NULL, NULL, 'Số 79 Trương Đinh, Phường 6, Quận 3, Tp. Hồ Chí Minh', '0988122334', 23, 3, NULL, '', '47817482342', 'www.chevalier.vn', 'Lê Văn Tư', '0988777115', NULL, 'g932d6vz5n1upqcorh87akif4ymtbj', 0, 1, NULL, '2018-05-16 10:07:26', '2018-05-17 01:47:05'),
(52, 'usbsvn@dienkim.com', '$2y$10$uUQZS/aezos9EFsISZ1PceKZH2x2WjxVbNpE6CnatUu9QB30xCT7C', 'CT TNHH MTV DV HỖ TRỢ KINH DOANH US', 'ct-tnhh-mtv-dv-ho-tro-kinh-doanh-us', NULL, NULL, 'Tầng 8 Tòa nhà QTSC 1 Công viên phần mềm Quang Trung, 8 Tô Ký, P. Tân Chánh Hiệp, Q.12, TP.HCM, Việt Nam', '0988444222', 23, 3, NULL, 'US Business Services hướng đến mục tiêu trở thành công ty cung cấp dịch vụ thu hồi nợ uy tín nhất Việt Nam. Với mục tiêu ấy, chúng tôi luôn thúc đẩy sự phát triển của nhân viên để đạt được kết quả tốt nhất cho khách hàng. Những điều mà công ty cam kết dành cho khách hàng', '43875738573', 'www.usbsvn.com', 'Trần Ngọc Hoan', '0988444111', NULL, 'w1ip5u3nq6dhm9xs4vo7kbz0yr2eg8', 0, 1, NULL, '2018-05-16 10:10:04', '2018-05-17 01:47:05'),
(53, 'longphatdiaoc@dienkim.com', '$2y$10$XtUcg8stq09XeGhMb3xZyecnFrYTKaHf5/KULkIcvNN8Uk0J8awRm', 'CTY TNHH KD ĐỊA ỐC LONG PHÁT', 'cty-tnhh-kd-dia-oc-long-phat', NULL, NULL, 'Số 3 Cửu Long, Phường 2, Quận Tân Bình, Thành phố Hồ Chí Minh', '0912222111', 23, 3, NULL, '<p>Công Ty TNHH Kinh Doanh Địa Ốc Long Phát hoạt động chủ yếu trong lĩnh vực môi giới bất động sản. Phân phối những sản phẩm đẹp với hồ sơ pháp lý đầy đủ rõ ràng mang đến khả năng sinh lời rất cao. </p><p>Dựa trên nguyên tắc đảm bảo quyền lợi cho người mua, bán, bất động sản khi thông qua giao dịch tại công ty được giải quyết thủ tục nhanh gọn, minh bạch, công bằng và đảm bảo đúng theo các quy định của pháp luật\r\nVới sự nghiên cứu kỹ lưỡng thị trường Bất động sản Việt Nam hiện nay, tầm nhìn chiến lược và dài hạn, đội ngũ nhân viên đầy nhiệt huyết và kinh nghiệm. </p><p>Chúng tôi đã và đang tạo nên một môi trường năng động và chuyên nghiệp cho nhân viên, nơi trao gửi niềm tin an toàn và uy tín cho khách hàng, cũng như từng ngày hoàn thiện, nâng cao chất lượng phục vụ cũng như giá trị từng sản phẩm. </p><p>\r\nTrong xu thế hội nhập của nền kinh tế, Công Ty TNHH Kinh Doanh Địa Ốc Long Phát luôn mong muốn được hợp tác, liên doanh liên kết với các đối tác trong và ngoài nước nhằm xây dựng một cộng đồng cùng phát triển với phương châm \" VÌ MỘT CUỘC SỐNG THỊNH VƯỢNG\"</p>', '7324545353', 'www.diaocphongphat.com.vn', 'Trương Quốc Dũng', '0988111222', NULL, 'lwfov5kp6e0ca2xujhrm97in3tzdgq', 0, 1, NULL, '2018-05-16 10:13:36', '2018-05-17 01:47:05'),
(54, 'niemtinviet@dienkim.com', '$2y$10$.tU0vqDf/4pj451OcxbNte0zKOly8p0hqU2Gz.a4imH6PiaVhoyYW', 'CÔNG TY TNHH VIỄN THÔNG NIỀM TIN VIỆT', 'cong-ty-tnhh-vien-thong-niem-tin-viet', '', '', 'Tầng 2 - Block C - Cao ốc Vạn Đô 348 Bến Vân Đồn, Phường 1, Quận 4, TPHCM. Gửi tin nhắn đến công ty', '0923111990', 23, 2, NULL, '<p>Công ty TNHH Viễn thông Niềm Tin Việt (NTV Telecom) là nhà cung cấp dịch vụ và giải pháp dịch vụ chăm sóc khách hàng uy tín hàng đầu tại thị trường Việt Nam. </p><p>Được thành lập từ năm 2007 với mục tiêu nâng cao chất lượng và hiệu quả của dịch vụ cũng như đáp ứng nhu cầu ngày càng cao của doanh nghiệp. Đến nay, dựa trên nền tảng nhiều năm kinh nghiệm, cũng như sự phát triển và làm việc độc lập, Niềm Tin Việt Telecom cung cấp cho doanh nghiệp dịch vụ như giao tiếp, xây dựng và phát triển mối quan hệ với khách hàng, chăm sóc khách hàng, bán hàng và dịch vụ khảo sát qua điện thoại. Với đội ngũ nhân viên được đào tạo chuyên nghiệp sáng tạo và tận tâm, Niềm Tin Việt cam kết cung cấp cho khách hàng những dịch vụ có giá trị và lợi thế cạnh tranh cao.\r\n</p><p>Bạn có muốn gia nhập đội ngũ Call Center của Niềm Tin Việt ?</p><p>\r\n\r\n• Vì sao chọn Niềm Tin Việt ?\r\n</p><p>- Chúng tôi luôn hiểu và tin rằng con người là tài sản lớn nhất của Niềm Tin Việt. Tại Niềm Tin Việt, sự nghiệp của các bạn sẽ được phát triển cùng với sự lớn mạnh không ngừng của chúng tôi. </p><p>Với chúng tôi, bạn là đồng nghiệp, là nguồn sống, là động lực để chúng tôi đầu tư hết mình.\r\n</p><p>\r\n• Chính sách lương thưởng ?</p><p>\r\n- Làm việc tại Niềm Tin Việt, bạn sẽ nhận được mức thu nhập tương xứng với năng lực và cạnh tranh so với thị trường. Ngoài ra, với đội ngũ nhân viên tận tâm, hết lòng vì công ty, chúng tôi luôn dành tặng mức thưởng tương xứng, như thể hiện sự trân trọng của chúng tôi đối với những đóng góp của các bạn.\r\n</p><p>\r\n• Chúng tôi sẽ giúp bạn thành công thế nào trong tương lai ?\r\n</p><p>- Với đội ngũ Back Office hỗ trợ chuyên nghiệp về NGHIỆP VỤ </p><p>- KỸ NĂNG – GIAO TIẾP, chúng tôi tự tin rằng bạn sẽ không bao giờ thấy mình đơn độc trong môi trường chuyên nghiệp của công ty.</p>', '75758734835', 'www.niemtinviet.com.vn', 'Trương Thế Vinh', '0988121333', 0, '5vhud1pby0zefixjsw6kq498ngtol2', 0, 1, 0, '2018-05-16 10:19:14', '2018-05-17 01:47:05'),
(55, 'mobifoneservice@dienkim.com', '$2y$10$mSnxV71QNG1P2yS89Rw.YOw63h37Hf5RoY04Pmy5L864o4Y7K/ZgG', 'CÔNG TY CỔ PHẦN DỊCH VỤ KỸ THUẬT MOBIFONE', 'cong-ty-co-phan-dich-vu-ky-thuat-mobifone', NULL, NULL, 'Lầu 6, Tòa Nhà Scetpa, 19 A Cộng Hòa, P. 12, Q. Tân Bình, Tphcm', '0977111222', 23, 3, NULL, '<p>Công ty Cổ phần dịch vụ kỹ thuật Mobifone là Công ty hoạt động trong lĩnh vực viễn thông chuyên cung cấp các dịch vụ:\r\n</p><p>- Cho thuê cơ sở hạ tầng viễn thông\r\n</p><p>- Dịch vụ lắp đặt, di chuyển, đo kiểm, bảo dưỡng trạm BTS\r\n</p><p>- Dịch vụ tối ưu hóa mạng viễn thông\r\n</p><p>- Dịch vụ giải đáp, chăm sóc khách hàng, bán hàng qua điện thoại\r\n</p><p>- Dịch vụ giá trị gia tăng trên nền công nghệ viễn thông.</p>', '2442113413', 'www.mobifoneservice.com.vn', 'Nguyễn Tường Vân', '0911888111', NULL, 'fxvtn65w4smr8d0o3higjze7aybuc9', 0, 1, NULL, '2018-05-16 10:23:00', '2018-05-17 01:47:05'),
(56, 'transcosmos@dienkim.com', '$2y$10$Tb5.UxsvctcyjK8Sqhyf2O3x.k4VogxNN553GfIvzp42Am6Lg2fIi', 'CÔNG TY TNHH TRANSCOSMOS', 'cong-ty-tnhh-transcosmos', NULL, NULL, 'Tầng 8, Tòa nhà Scetpa, 19A Cộng Hòa, P.12, Q. Tân Bình, TP. Hồ Chí Minh', '0988221331', 23, 3, NULL, '<p>Công ty Transcosmos Vietnam là cty vốn 100% Nhật Bản mới thành lập văn phòng chi nhánh tại TpHCM vào tháng 10/2015. Chúng tôi cung cấp các dịch vụ BPO cũng như dịch vụ chăm sóc khách hàng cho thị trường trong và ngoài Viêt Nam. </p><p>\r\nVề dịch vụ BPO, chúng tôi triển khai dịch vụ Offshore hỗ trợ khai thác, thiết kế nhắm tới đối tượng ngành sản xuất xe hơi, máy bay, xây dựng cơ sở hạ tầng cho các khách hàng từ thị trường Nhật Bản. </p><p>Với sự thành lập của transcosmos Việt Nam, số lượng trụ sở của công ty trên toàn cầu tăng lên 69, là trụ sở thứ 3 ở khu vực ASEAN sau Thái Lan và Indonesia.\r\n\r\nVới qui mô cty Global, TOP 13 trong toàn cầu về ngành BPO,với kinh nghiệm 50 năm trong lĩnh vực BPO, contact centre... chúng tôi tự tin là nhà cung cấp dịch đủ năng lực về tài chính, năng lực triển khai các dự án qui mô lớn về Chăm Sóc khách hang, tư vấn các giải pháp dịch vụ, đem lại những kết quả kinh doanh tối ưu hóa lợi lợi nhuận, giảm chi phí vận hành.\r\n</p><p>\r\nVới mong muốn tìm kiếm những ứng viên tài năng để bước đầu set up team vận hành trong những giai đoạn nền tang. Chúng tôi, chào đón các ứng viên mong muốn được làm việc trong một môi trường yên tâm về phúc lợi, lương bổng, chế độ đãi ngộ và thăng tiến.</p>', '5435364334', 'www.transmoscos.vn', 'Trần Văn Thôi', '0988001001', NULL, 'e7dhw3abfr1pztm5gil8qn0c6vkjuy', 0, 1, NULL, '2018-05-16 10:25:54', '2018-05-17 01:47:05'),
(57, 'tyminh@dienkim.com', '$2y$10$TXrnSrcGJDmt1WN.5twYR.4MYcYdjkTTzJBCZ5P2bacvGByg3sz8W', 'Công Ty TNHH Tỷ Minh - Bình Dương', 'cong-ty-tnhh-ty-minh-binh-duong', NULL, NULL, 'Lô CN1, Đường số 3, KCN Sóng Thần 3, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', '0988151001', 23, 2, NULL, 'Công Ty TNHH Tỷ Minh chuyên gia công đầu gậy, khuôn mẫu tinh chế, gia công ngũ kim.', '87427857854', 'www.tyminhcoltd.vn', 'Trương Văn Minh', '0988152111', NULL, '6xvg39w2dz1irnja4b7uo5s08ephqf', 0, 1, NULL, '2018-05-16 10:27:51', '2018-05-17 01:50:59'),
(58, 'khuongthinh@dienkim.com', '$2y$10$aNRzc8yvvvBDclsSTfjTYeECt93Qo27dvZ/a9d0sIavWZ3ndQzkpS', 'Công ty Cổ phần Đầu tư Khương Thịnh', 'cong-ty-co-phan-dau-tu-khuong-thinh', NULL, NULL, '54A Xô Viết Nghệ Tĩnh, P.19, Q.Bình Thạnh, Tp.HCM.', '0977051661', 23, 4, NULL, '<p>Công ty Cổ phần Đầu tư Khương Thịnh là một trong những doanh nghiệp tiên phong trong lĩnh vực đầu tư, kinh doanh bất động sản chuyên về phân khúc thị trường nhà đất hiện hữu, với phương châm “Chất lượng dịch vụ là giá trị cốt lõi của sản phẩm”. Giỏ sản phẩm chủ yếu là căn hộ cao - trung cấp.</p><p>Các dự án của công ty phân bố ở Tp. HCM và một vài tỉnh thành khác như Đà Nẵng, Phú Quốc, Phan Thiết cùng các văn phòng đại diện đặt tại đây.</p><p>Hiện nay, chúng tôi có đội ngũ nhân sự năng động, được đào tạo chuyên nghiệp với hơn 200 nhân sự trên toàn hệ thống công ty.</p><p>Các lý do gia nhập công ty chúng tôi:</p><p>- Hoa hồng cao nhất thị trường hiện nay</p><p>- Được tham gia các khóa đào tạo nâng cao năng lực cơ bản và chuyên sâu hoàn toàn miễn phí</p><p>- Có lộ trình thăng tiến cho từng vị trí công việc</p><p>- Giỏ sản phẩm đa dạng, thuộc phân khúc cao cấp và trung cấp.</p><p>Hệ thống Khương Thịnh:</p><p>- Văn phòng chính: 54A Xô Viết Nghệ Tĩnh, P.19, Q.Bình Thạnh, Tp.HCM.</p><p>- CN1:125/11 Nguyễn Cửu Vân, P. 17, Q. Bình Thạnh, Tp.HCM.</p><p>- CN2: 212 Tạ Quang Bửu, P.04, Quận 08, Tp.HCM.</p><p>- Văn phòng miền trung: 266 Nguyễn Tri Phương, P. Thạc Gián, Q.Thanh Khê, TP Đà Nẵng.</p><p>- Văn phòng Phú Quốc: 18A Mạc Thiên Tích, Khu Phố 5, TT Dương Đông, Huyện Phú Quốc, Tỉnh Kiên Giang.</p><p>Hãy gia nhập Khương Thịnh ngay hôm nay.</p>', '75834533', 'www.khuongthinh.com.vn', 'Lê Đạt Thịnh', '0988122111', NULL, 'mn9hwy3vlc5p2f6sb80erkdju1ox47', 0, 1, NULL, '2018-05-16 10:30:47', '2018-05-17 01:47:05'),
(59, 'toanthinhphat@dienkim.com', '$2y$10$kpdkJMmKk2fyFYa/mHQk8OnTULPkao4shtNkoCu7oWDg6Q7cppKfe', 'Công ty TNHH TMDV Kỹ Thuật Điện Toàn Thịnh Phát', 'cong-ty-tnhh-tmdv-ky-thuat-dien-toan-thinh-phat', NULL, NULL, '860/60S/15 Xô Viết Nghệ Tĩnh, P25, Q Bình Thạnh', '0988111222', 23, 4, NULL, '<p>Công ty TNHH TMDV Kỹ Thuật Điện Toàn Thịnh Phát là một trong những công ty hàng đầu trong lĩnh vực lắp ráp, sửa chữa và bảo trì Máy phát điện tại Việt Nam, với các loại máy có công suất từ 5 KVA – 2.000 KVA, ... (được ủy nhiệm làm OEM chính thức tại Việt Nam) như: Cummins, Iveco, John Deere, Deuzt, MTU, Mecc Alte, Marathon, Visa Energy, Mitsubishi, EuroPower ...</p><p>Phạm vi hoạt động: rộng khắp trong cả nước.</p><p>Với đội ngũ nhân viên trẻ, đầy sáng tạo và năng động, chịu khó và ham học hỏi. Cùng sự góp sức của các chuyên gia dày dặn kinh nghiệm về thiết kế, phát triển và thi công nhiều công trình Máy Phát Điện, chúng tôi tự hào khi mang đến cho khách hàng những giải pháp điện công nghiệp cao cấp với nhiều phong cách chuyên nghiệp khác nhau, để lại ấn tượng sâu sắc trong lòng người sử dụng, qua đó nâng cao khả năng cạnh tranh cho khách hàng trong lĩnh vực mà công ty chúng tôi đã và đang thực hiện.</p>', '2342878742', 'www.mayphatdienttp.com', 'Trương Quốc Hiệp', '0988777116', NULL, 'e01xckuodlyzihja95ng4sr6bqf27v', 0, 1, NULL, '2018-05-16 10:33:08', '2018-05-17 01:53:42'),
(60, 'vinahost@dienkim.com', '$2y$10$iC/ylC4job0pLuVPaWjqz.tPbMdJYT1Y3Zyv4hChOAFBCQtXeNloy', 'Công Ty TNHH MTV VinaHost', 'cong-ty-tnhh-mtv-vinahost', NULL, NULL, '351/31 Nơ Trang Long, Phường 13, Q Bình Thạnh.', '0941990111', 23, 4, NULL, '<p>VinaHost là công ty cung cấp dịch vụ cho thuê máy chủ và lưu trữ website chuyên nghiệp với hơn 8 năm kinh nghiệm trên thị trường Việt Nam và Bắc Mỹ. </p><p>Chúng tôi cam kết cung cấp dịch vụ cho thuê máy chủ và lưu trữ website tốt nhất tại thị trường Việt Nam:</p><p>Hỗ trợ khách hàng 24/7, đảm bảo giải quyết các sự cố nhanh chóng.</p><p>Các data center hàng đầu của Việt Nam như VDC &amp; Viettel IDC.</p><p>Hệ thống máy chủ Supermicro chất lượng cao.</p><p>Đảm bảo thời gian truy cập 99.9%.</p><p>Giải pháp lưu trữ và ảo hóa tối ưu.</p><p>Sao lưu dữ liệu miễn phí cho khách hàng đối với các dịch vụ lưu trữ website.</p><p>Cam kết hoàn tiền 100% cho khách hàng trong vòng 30 ngày.</p><p>Với đội ngũ nhân viên hỗ trợ kinh nghiệm, nhiệt tình và luôn sẵn sàng, chúng tôi tìm ra và giải quyết vấn đề của quý khách trong thời gian sớm nhất. VinaHost tự tin cung cấp dịch vụ hỗ trợ khách hàng tốt nhất. Chúng tôi biết những gì cần làm để đạt hiệu quả tối ưu và để mang lại thành công cho trang web của khách hàng.</p>', '77234282234', 'www.vinahost.vn', 'Trương Thành Vinh', '0963889231', NULL, 'f84qrpime1woc9b06nj3zavhu7xs5k', 0, 1, NULL, '2018-05-16 10:36:28', '2018-05-17 02:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chưa có kinh nghiệm', 'chua-co-kinh-nghiem', 1, 1, '2018-04-12 06:54:19', '2018-04-12 06:54:19'),
(2, 'Dưới 1 năm', 'duoi-1-nam', 1, 1, '2018-04-12 06:54:30', '2018-04-12 06:54:30'),
(3, '1 năm kinh nghiệm trong nghề', '1-nam-kinh-nghiem-trong-nghe', 1, 1, '2018-04-12 06:54:39', '2018-04-16 01:20:12'),
(4, '2 năm kinh nghiệm trong nghề', '2-nam-kinh-nghiem-trong-nghe', 1, 1, '2018-04-12 06:54:46', '2018-04-16 01:20:23'),
(5, '3 năm kinh nghiệm trong nghề', '3-nam-kinh-nghiem-trong-nghe', 1, 1, '2018-04-12 06:54:52', '2018-04-16 01:20:33'),
(6, '4 năm kinh nghiệm trong nghề', '4-nam-kinh-nghiem-trong-nghe', 1, 1, '2018-04-12 06:54:58', '2018-04-16 01:20:42'),
(7, '5 năm kinh nghiệm trong nghề', '5-nam-kinh-nghiem-trong-nghe', 5, 1, '2018-04-12 06:55:09', '2018-04-16 01:20:54'),
(8, 'Trên 5 năm kinh nghiệm trong nghề', 'tren-5-nam-kinh-nghiem-trong-nghe', 1, 1, '2018-04-12 06:55:26', '2018-04-16 01:21:02'),
(9, 'Không yêu cầu kinh nghiệm', 'khong-yeu-cau-kinh-nghiem', 1, 1, '2018-04-12 06:55:38', '2018-04-12 06:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `graduation`
--

DROP TABLE IF EXISTS `graduation`;
CREATE TABLE `graduation` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `graduation`
--

INSERT INTO `graduation` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giỏi', 'gioi', 1, 1, '2018-04-25 08:00:34', '2018-04-25 08:00:34'),
(2, 'Khá', 'kha', 2, 1, '2018-04-25 08:00:42', '2018-04-25 08:00:42'),
(3, 'Trung bình', 'trung-binh', 3, 1, '2018-04-25 08:00:51', '2018-04-25 08:00:51');

-- --------------------------------------------------------

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_member`
--

INSERT INTO `group_member` (`id`, `fullname`, `alias`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', 1, '2016-12-17 05:05:18', '2018-05-02 03:37:23'),
(2, 'Chăm sóc khách hàng', 'cham-soc-khach-hang', 2, '2018-04-06 07:51:51', '2018-04-14 02:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `group_privilege`
--

DROP TABLE IF EXISTS `group_privilege`;
CREATE TABLE `group_privilege` (
  `id` int(11) NOT NULL,
  `group_member_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_privilege`
--

INSERT INTO `group_privilege` (`id`, `group_member_id`, `privilege_id`, `created_at`, `updated_at`) VALUES
(4805, 2, 157, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4806, 2, 158, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4807, 2, 159, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4808, 2, 160, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4809, 2, 161, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4810, 2, 176, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4811, 2, 177, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(5364, 1, 1, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5365, 1, 2, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5366, 1, 4, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5367, 1, 5, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5368, 1, 18, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5369, 1, 19, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5370, 1, 24, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5371, 1, 25, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5372, 1, 43, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5373, 1, 44, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5374, 1, 49, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5375, 1, 50, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5376, 1, 55, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5377, 1, 56, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5378, 1, 61, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5379, 1, 62, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5380, 1, 67, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5381, 1, 68, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5382, 1, 79, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5383, 1, 80, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5384, 1, 85, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5385, 1, 86, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5386, 1, 103, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5387, 1, 104, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5388, 1, 105, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5389, 1, 106, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5390, 1, 107, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5391, 1, 108, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5392, 1, 109, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5393, 1, 110, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5394, 1, 115, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5395, 1, 116, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5396, 1, 121, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5397, 1, 122, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5398, 1, 123, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5399, 1, 124, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5400, 1, 125, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5401, 1, 126, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5402, 1, 127, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5403, 1, 128, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5404, 1, 129, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5405, 1, 130, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5406, 1, 131, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5407, 1, 132, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5408, 1, 133, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5409, 1, 134, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5410, 1, 135, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5411, 1, 136, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5412, 1, 137, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5413, 1, 138, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5414, 1, 139, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5415, 1, 140, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5416, 1, 141, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5417, 1, 142, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5418, 1, 143, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5419, 1, 144, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5420, 1, 145, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5421, 1, 146, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5422, 1, 151, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5423, 1, 152, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5424, 1, 153, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5425, 1, 154, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5426, 1, 155, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5427, 1, 156, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5428, 1, 157, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5429, 1, 158, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5430, 1, 159, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5431, 1, 160, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5432, 1, 161, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5433, 1, 162, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5434, 1, 163, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5435, 1, 164, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5436, 1, 165, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5437, 1, 166, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5438, 1, 167, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5439, 1, 168, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5440, 1, 169, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5441, 1, 170, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5442, 1, 171, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5443, 1, 172, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5444, 1, 173, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5445, 1, 174, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5446, 1, 175, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5447, 1, 176, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5448, 1, 177, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5449, 1, 178, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5450, 1, 179, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5451, 1, 180, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5452, 1, 181, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5453, 1, 182, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5454, 1, 183, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5455, 1, 184, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5456, 1, 185, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5457, 1, 186, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5458, 1, 187, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5459, 1, 188, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5460, 1, 189, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5461, 1, 190, '2018-05-02 03:37:23', '2018-05-02 03:37:23'),
(5462, 1, 191, '2018-05-02 03:37:23', '2018-05-02 03:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_total_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kinh doanh', 'kinh-doanh', 1, 1, '2018-04-12 04:23:21', '2018-04-12 04:23:21'),
(2, 'Bán hàng', 'ban-hang', 1, 1, '2018-04-12 04:23:42', '2018-04-12 04:23:42'),
(3, 'Chăm sóc khách hàng', 'cham-soc-khach-hang', 1, 1, '2018-04-12 04:23:51', '2018-04-12 04:23:51'),
(4, 'Lao động phổ thông', 'lao-dong-pho-thong', 1, 1, '2018-04-12 04:24:47', '2018-04-12 04:24:47'),
(5, 'Tài chính / Kế toán / Kiểm toán', 'tai-chinh-ke-toan-kiem-toan', 1, 1, '2018-04-12 04:25:02', '2018-04-12 04:25:02'),
(6, 'Hành chính / Thư ký / Trợ lý', 'hanh-chinh-thu-ky-tro-ly', 1, 1, '2018-04-12 04:25:16', '2018-04-12 04:25:16'),
(7, 'Sinh viên / Mới tốt nghiệp / Thực tập', 'sinh-vien-moi-tot-nghiep-thuc-tap', 1, 1, '2018-04-12 04:26:01', '2018-04-12 04:26:01'),
(8, 'Quảng cáo / Marketing / PR', 'quang-cao-marketing-pr', 1, 1, '2018-04-12 04:26:16', '2018-04-12 04:26:16'),
(9, 'Cơ khí / Kỹ thuật ứng dụng', 'co-khi-ky-thuat-ung-dung', 1, 1, '2018-04-12 04:26:31', '2018-04-12 04:26:42'),
(10, 'Báo chí / Biên tập viên', 'bao-chi-bien-tap-vien', 1, 1, '2018-04-12 04:26:55', '2018-04-12 04:26:55'),
(11, 'Bảo vệ / Vệ sĩ / An ninh', 'bao-ve-ve-si-an-ninh', 1, 1, '2018-04-12 04:27:11', '2018-04-12 04:27:11'),
(12, 'Bất động sản', 'bat-dong-san', 1, 1, '2018-04-12 04:27:26', '2018-04-12 04:27:26'),
(13, 'Biên dịch / Phiên dịch', 'bien-dich-phien-dich', 1, 1, '2018-04-12 04:27:40', '2018-04-12 04:27:40'),
(14, 'Bưu chính viễn thông', 'buu-chinh-vien-thong', 1, 1, '2018-04-12 04:27:55', '2018-04-12 04:28:04'),
(15, 'Công nghệ thông tin', 'cong-nghe-thong-tin', 1, 1, '2018-04-12 04:28:16', '2018-04-12 04:28:16'),
(16, 'Dầu khí / Địa chất', 'dau-khi-dia-chat', 1, 1, '2018-04-12 04:28:30', '2018-04-12 04:28:30'),
(17, 'Dệt may', 'det-may', 1, 1, '2018-04-12 04:28:39', '2018-04-12 04:28:39'),
(18, 'Điện / Điện tử / Điện lạnh', 'dien-dien-tu-dien-lanh', 1, 1, '2018-04-12 04:28:56', '2018-04-12 04:28:56'),
(19, 'Du lịch / Nhà hàng / Khách sạn', 'du-lich-nha-hang-khach-san', 1, 1, '2018-04-12 04:29:18', '2018-04-12 04:29:18'),
(20, 'Dược / Hóa chất / Sinh hóa', 'duoc-hoa-chat-sinh-hoa', 1, 1, '2018-04-12 04:29:37', '2018-04-12 04:29:37'),
(21, 'Giải trí / Vui chơi', 'giai-tri-vui-choi', 1, 1, '2018-04-12 04:29:48', '2018-04-12 04:29:48'),
(22, 'Giáo dục / Đào tạo / Thư viện', 'giao-duc-dao-tao-thu-vien', 1, 1, '2018-04-12 04:30:03', '2018-04-12 04:30:03'),
(23, 'Giao thông / Vận tải / Thủy lợi / Cầu đường', 'giao-thong-van-tai-thuy-loi-cau-duong', 1, 1, '2018-04-12 04:31:28', '2018-04-12 04:31:28'),
(24, 'Giày da / Thuộc da', 'giay-da-thuoc-da', 1, 1, '2018-04-12 04:31:47', '2018-04-12 04:31:47'),
(25, 'Khác', 'khac', 1, 1, '2018-04-12 04:31:56', '2018-04-12 04:31:56'),
(26, 'Kho vận / Vật tư / Thu mua', 'kho-van-vat-tu-thu-mua', 1, 1, '2018-04-12 04:32:10', '2018-04-12 04:32:10'),
(27, 'Khu chế xuất / Khu công nghiệp', 'khu-che-xuat-khu-cong-nghiep', 1, 1, '2018-04-12 04:33:01', '2018-04-12 04:33:01'),
(28, 'Kiến trúc / Nội thất', 'kien-truc-noi-that', 1, 1, '2018-04-12 04:33:58', '2018-04-12 04:33:58'),
(29, 'Làm đẹp / Thể lực / Spa', 'lam-dep-the-luc-spa', 1, 1, '2018-04-12 04:34:10', '2018-04-12 04:34:10'),
(30, 'Luật / Pháp lý', 'luat-phap-ly', 1, 1, '2018-04-12 04:34:21', '2018-04-12 04:34:21'),
(31, 'Môi trường / Xử lý chất thải', 'moi-truong-xu-ly-chat-thai', 1, 1, '2018-04-12 04:34:41', '2018-04-12 04:34:41'),
(32, 'Mỹ phẩm / Thời trang / Trang sức', 'my-pham-thoi-trang-trang-suc', 1, 1, '2018-04-12 04:34:56', '2018-04-12 04:34:56'),
(33, 'Ngân hàng / Chứng khoán / Đầu tư', 'ngan-hang-chung-khoan-dau-tu', 1, 1, '2018-04-12 04:35:12', '2018-04-12 04:35:12'),
(34, 'Nghệ thuật / Điện ảnh', 'nghe-thuat-dien-anh', 1, 1, '2018-04-12 04:35:25', '2018-04-12 04:35:25'),
(35, 'Ngoại ngữ', 'ngoai-ngu', 1, 1, '2018-04-12 04:35:36', '2018-04-12 04:35:48'),
(36, 'Nhân sự', 'nhan-su', 1, 1, '2018-04-12 04:36:02', '2018-04-12 04:36:02'),
(37, 'Nông / Lâm / Ngư nghiệp', 'nong-lam-ngu-nghiep', 1, 1, '2018-04-12 04:36:48', '2018-04-12 04:36:48'),
(38, 'PG / PB / Lễ tân', 'pg-pb-le-tan', 1, 1, '2018-04-12 04:37:06', '2018-04-12 04:37:06'),
(39, 'Phát triển thị trường', 'phat-trien-thi-truong', 1, 1, '2018-04-12 04:37:20', '2018-04-12 04:37:20'),
(40, 'Phục vụ / Tạp vụ / Giúp việc', 'phuc-vu-tap-vu-giup-viec', 1, 1, '2018-04-12 04:37:39', '2018-04-12 04:37:39'),
(41, 'Quan hệ đối ngoại', 'quan-he-doi-ngoai', 1, 1, '2018-04-12 04:37:51', '2018-04-12 04:37:51'),
(42, 'Quản lý điều hành', 'quan-ly-dieu-hanh', 1, 1, '2018-04-12 04:38:03', '2018-04-12 04:38:03'),
(43, 'Sản xuất / Vận hành sản xuất', 'san-xuat-van-hanh-san-xuat', 1, 1, '2018-04-12 04:38:19', '2018-04-12 04:38:19'),
(44, 'Tài xế / Lái xe / Giao nhận', 'tai-xe-lai-xe-giao-nhan', 1, 1, '2018-04-12 04:38:42', '2018-04-12 04:38:42'),
(45, 'Thẩm định / Giám định / Quản lý chất lượng', 'tham-dinh-giam-dinh-quan-ly-chat-luong', 1, 1, '2018-04-12 04:39:01', '2018-04-12 04:39:01'),
(46, 'Thể dục / Thể thao', 'the-duc-the-thao', 1, 1, '2018-04-12 04:39:13', '2018-04-12 04:39:13'),
(47, 'Thiết kế / Mỹ thuật', 'thiet-ke-my-thuat', 1, 1, '2018-04-12 04:39:27', '2018-04-12 04:39:27'),
(48, 'Thời vụ / Bán thời gian', 'thoi-vu-ban-thoi-gian', 1, 1, '2018-04-12 04:39:38', '2018-04-12 04:39:38'),
(49, 'Thực phẩm / Dịch vụ ăn uống', 'thuc-pham-dich-vu-an-uong', 1, 1, '2018-04-12 04:39:53', '2018-04-12 04:39:53'),
(50, 'Trang thiết bị công nghiệp', 'trang-thiet-bi-cong-nghiep', 1, 1, '2018-04-12 04:40:04', '2018-04-12 04:40:04'),
(51, 'Thiết bị gia dụng', 'thiet-bi-gia-dung', 1, 1, '2018-04-12 04:40:15', '2018-04-12 04:40:15'),
(52, 'Thiết bị văn phòng', 'thiet-bi-van-phong', 1, 1, '2018-04-12 04:40:29', '2018-04-12 04:40:29'),
(53, 'Tư vấn bảo hiểm', 'tu-van-bao-hiem', 1, 1, '2018-04-12 04:40:41', '2018-04-12 04:40:41'),
(54, 'Xây dựng', 'xay-dung', 1, 1, '2018-04-12 04:40:52', '2018-04-12 04:40:52'),
(55, 'Xuất - Nhập khẩu / Ngoại thương', 'xuat-nhap-khau-ngoai-thuong', 1, 1, '2018-04-12 04:41:07', '2018-04-12 04:41:07'),
(56, 'Y tế', 'y-te', 1, 1, '2018-04-12 04:41:16', '2018-04-12 04:41:16');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tiếng Anh', 'tieng-anh', 1, 1, '2018-04-25 08:35:57', '2018-04-25 08:35:57'),
(2, 'Tiếng Pháp', 'tieng-phap', 1, 1, '2018-04-25 08:36:05', '2018-04-25 08:36:05'),
(3, 'Tiếng Trung', 'tieng-trung', 1, 1, '2018-04-25 08:36:12', '2018-04-25 08:36:12'),
(4, 'Tiếng Nhật', 'tieng-nhat', 1, 1, '2018-04-25 08:36:19', '2018-04-25 08:36:19'),
(5, 'Tiếng Hàn', 'tieng-han', 1, 1, '2018-04-25 08:36:30', '2018-04-25 08:36:30'),
(6, 'Tiếng Nga', 'tieng-nga', 1, 1, '2018-04-25 08:36:37', '2018-04-25 08:36:37'),
(7, 'Tiếng Đức', 'tieng-duc', 1, 1, '2018-04-25 08:36:48', '2018-04-25 08:36:48'),
(8, 'Tiếng Ý', 'tieng-y', 1, 1, '2018-04-25 08:36:57', '2018-04-25 08:36:57'),
(9, 'Tiếng Ả Rập', 'tieng-a-rap', 1, 1, '2018-04-25 08:37:07', '2018-04-25 08:37:07'),
(10, 'Ngôn ngữ khác', 'ngon-ngu-khac', 1, 1, '2018-04-25 08:37:24', '2018-04-25 08:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `language_level`
--

DROP TABLE IF EXISTS `language_level`;
CREATE TABLE `language_level` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language_level`
--

INSERT INTO `language_level` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sơ cấp', 'so-cap', 1, 1, '2018-04-25 08:54:53', '2018-04-25 08:54:53'),
(2, 'Trung cấp', 'trung-cap', 1, 1, '2018-04-25 08:55:00', '2018-04-25 08:55:00'),
(3, 'Cao cấp', 'cao-cap', 1, 1, '2018-04-25 08:55:07', '2018-04-25 08:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `literacy`
--

DROP TABLE IF EXISTS `literacy`;
CREATE TABLE `literacy` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `literacy`
--

INSERT INTO `literacy` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Đại học', 'dai-hoc', 1, 1, '2018-04-12 06:48:52', '2018-04-12 06:48:52'),
(2, 'Cao đẳng', 'cao-dang', 1, 1, '2018-04-12 06:48:59', '2018-04-12 06:48:59'),
(3, 'Trung cấp', 'trung-cap', 1, 1, '2018-04-12 06:49:07', '2018-04-12 06:49:07'),
(4, 'Cao học', 'cao-hoc', 1, 1, '2018-04-12 06:49:23', '2018-04-12 06:49:23'),
(5, 'Trung học', 'trung-hoc', 1, 1, '2018-04-12 06:51:01', '2018-04-12 06:51:01'),
(6, 'Chứng chỉ', 'chung-chi', 1, 1, '2018-04-12 06:51:08', '2018-04-12 06:51:08'),
(7, 'Lao động phổ thông', 'lao-dong-pho-thong', 1, 1, '2018-04-12 06:51:19', '2018-04-12 06:51:19'),
(8, 'Không yêu cầu', 'khong-yeu-cau', 1, 1, '2018-04-12 06:51:28', '2018-04-12 06:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `marriage`
--

DROP TABLE IF EXISTS `marriage`;
CREATE TABLE `marriage` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `marriage`
--

INSERT INTO `marriage` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Độc thân', 'doc-than', 1, 1, '2018-04-05 04:00:57', '2018-04-05 04:00:57'),
(2, 'Đã có gia đình', 'da-co-gia-dinh', 2, 1, '2018-04-05 04:01:28', '2018-04-05 04:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_type_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `menu_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

DROP TABLE IF EXISTS `menu_type`;
CREATE TABLE `menu_type` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_item`
--

DROP TABLE IF EXISTS `module_item`;
CREATE TABLE `module_item` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` text COLLATE utf8_unicode_ci,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `setting` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `content` text,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `fullname`, `alias`, `content`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Thanh toán bằng Ví điện tử NgânLượng', 'NL', '<p style=\"text-align:justify\">Thanh toán trực tuyến AN TOÀN và ĐƯỢC BẢO VỆ, sử dụng thẻ ngân hàng trong và ngoài nước hoặc nhiều hình thức tiện lợi khác. Được bảo hộ & cấp phép bởi NGÂN HÀNG NHÀ NƯỚC, ví điện tử duy nhất được cộng đồng ƯA THÍCH NHẤT 2 năm liên tiếp, Bộ Thông tin Truyền thông trao giải thưởng Sao Khuê<br />\nGiao dịch. Đăng ký ví NgânLượng.vn miễn phí <a href=\"https://www.nganluong.vn/?portal=nganluong&page=user_register\"><span style=\"color:#2980b9\">tại đây</span></a></p>', 1, 1, '2018-01-07 17:25:13', '2018-02-06 10:46:40'),
(2, 'Thanh toán online bằng thẻ ngân hàng nội địa', 'ATM_ONLINE', '<p><i>\n				<span style=\"color:#ff5a00;font-weight:bold;text-decoration:underline;\">Lưu ý</span>: Bạn cần đăng ký Internet-Banking hoặc dịch vụ thanh toán trực tuyến tại ngân hàng trước khi thực hiện.</i></p>\n							\n						<ul class=\"cardList clearfix\">\n						<li class=\"bank-online-methods \">\n							<label for=\"vcb_ck_on\">\n								<i class=\"BIDV\" title=\"Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam\"></i>\n								<input type=\"radio\" value=\"BIDV\" name=\"bankcode\">\n							\n						</label></li>\n						<li class=\"bank-online-methods \">\n							<label for=\"vcb_ck_on\">\n								<i class=\"VCB\" title=\"Ngân hàng TMCP Ngoại Thương Việt Nam\"></i>\n								<input type=\"radio\" value=\"VCB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"vnbc_ck_on\">\n								<i class=\"DAB\" title=\"Ngân hàng Đông Á\"></i>\n								<input type=\"radio\" value=\"DAB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"tcb_ck_on\">\n								<i class=\"TCB\" title=\"Ngân hàng Kỹ Thương\"></i>\n								<input type=\"radio\" value=\"TCB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_mb_ck_on\">\n								<i class=\"MB\" title=\"Ngân hàng Quân Đội\"></i>\n								<input type=\"radio\" value=\"MB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_vib_ck_on\">\n								<i class=\"VIB\" title=\"Ngân hàng Quốc tế\"></i>\n								<input type=\"radio\" value=\"VIB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_vtb_ck_on\">\n								<i class=\"ICB\" title=\"Ngân hàng Công Thương Việt Nam\"></i>\n								<input type=\"radio\" value=\"ICB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_exb_ck_on\">\n								<i class=\"EXB\" title=\"Ngân hàng Xuất Nhập Khẩu\"></i>\n								<input type=\"radio\" value=\"EXB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_acb_ck_on\">\n								<i class=\"ACB\" title=\"Ngân hàng Á Châu\"></i>\n								<input type=\"radio\" value=\"ACB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_hdb_ck_on\">\n								<i class=\"HDB\" title=\"Ngân hàng Phát triển Nhà TPHCM\"></i>\n								<input type=\"radio\" value=\"HDB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_msb_ck_on\">\n								<i class=\"MSB\" title=\"Ngân hàng Hàng Hải\"></i>\n								<input type=\"radio\" value=\"MSB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_nvb_ck_on\">\n								<i class=\"NVB\" title=\"Ngân hàng Nam Việt\"></i>\n								<input type=\"radio\" value=\"NVB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_vab_ck_on\">\n								<i class=\"VAB\" title=\"Ngân hàng Việt Á\"></i>\n								<input type=\"radio\" value=\"VAB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_vpb_ck_on\">\n								<i class=\"VPB\" title=\"Ngân Hàng Việt Nam Thịnh Vượng\"></i>\n								<input type=\"radio\" value=\"VPB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_scb_ck_on\">\n								<i class=\"SCB\" title=\"Ngân hàng Sài Gòn Thương tín\"></i>\n								<input type=\"radio\" value=\"SCB\" name=\"bankcode\">\n							\n						</label></li>\n\n						\n\n						<li class=\"bank-online-methods \">\n							<label for=\"bnt_atm_pgb_ck_on\">\n								<i class=\"PGB\" title=\"Ngân hàng Xăng dầu Petrolimex\"></i>\n								<input type=\"radio\" value=\"PGB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"bnt_atm_gpb_ck_on\">\n								<i class=\"GPB\" title=\"Ngân hàng TMCP Dầu khí Toàn Cầu\"></i>\n								<input type=\"radio\" value=\"GPB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"bnt_atm_agb_ck_on\">\n								<i class=\"AGB\" title=\"Ngân hàng Nông nghiệp &amp; Phát triển nông thôn\"></i>\n								<input type=\"radio\" value=\"AGB\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"bnt_atm_sgb_ck_on\">\n								<i class=\"SGB\" title=\"Ngân hàng Sài Gòn Công Thương\"></i>\n								<input type=\"radio\" value=\"SGB\" name=\"bankcode\">\n							\n						</label></li>	\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_bab_ck_on\">\n								<i class=\"BAB\" title=\"Ngân hàng Bắc Á\"></i>\n								<input type=\"radio\" value=\"BAB\" name=\"bankcode\">\n							\n						</label></li>\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_bab_ck_on\">\n								<i class=\"TPB\" title=\"Tền phong bank\"></i>\n								<input type=\"radio\" value=\"TPB\" name=\"bankcode\">\n							\n						</label></li>\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_bab_ck_on\">\n								<i class=\"NAB\" title=\"Ngân hàng Nam Á\"></i>\n								<input type=\"radio\" value=\"NAB\" name=\"bankcode\">\n							\n						</label></li>\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_bab_ck_on\">\n								<i class=\"SHB\" title=\"Ngân hàng TMCP Sài Gòn - Hà Nội (SHB)\"></i>\n								<input type=\"radio\" value=\"SHB\" name=\"bankcode\">\n							\n						</label></li>\n						<li class=\"bank-online-methods \">\n							<label for=\"sml_atm_bab_ck_on\">\n								<i class=\"OJB\" title=\"Ngân hàng TMCP Đại Dương (OceanBank)\"></i>\n								<input type=\"radio\" value=\"OJB\" name=\"bankcode\">\n							\n						</label></li>\n						\n\n\n\n						\n					</ul>', 2, 1, '2018-01-07 17:25:25', '2018-02-08 02:57:55'),
(3, 'Thanh toán bằng IB', 'IB_ONLINE', '<p><i>\n						<span style=\"color:#ff5a00;font-weight:bold;text-decoration:underline;\">Lưu ý</span>: Bạn cần đăng ký Internet-Banking hoặc dịch vụ thanh toán trực tuyến tại ngân hàng trước khi thực hiện.</i></p>\n\n				<ul class=\"cardList clearfix\">\n					<li class=\"bank-online-methods \">\n						<label for=\"vcb_ck_on\">\n							<i class=\"BIDV\" title=\"Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam\"></i>\n							<input type=\"radio\" value=\"BIDV\" name=\"bankcode\">\n\n						</label></li>\n					<li class=\"bank-online-methods \">\n						<label for=\"vcb_ck_on\">\n							<i class=\"VCB\" title=\"Ngân hàng TMCP Ngoại Thương Việt Nam\"></i>\n							<input type=\"radio\" value=\"VCB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"vnbc_ck_on\">\n							<i class=\"DAB\" title=\"Ngân hàng Đông Á\"></i>\n							<input type=\"radio\" value=\"DAB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"tcb_ck_on\">\n							<i class=\"TCB\" title=\"Ngân hàng Kỹ Thương\"></i>\n							<input type=\"radio\" value=\"TCB\" name=\"bankcode\">\n\n						</label></li>\n\n\n				</ul>', 3, 1, '2018-02-05 11:55:58', '2018-02-08 02:58:59'),
(4, 'Thanh toán atm offline', 'ATM_OFFLINE', '<ul class=\"cardList clearfix\">\n					<li class=\"bank-online-methods \">\n						<label for=\"vcb_ck_on\">\n							<i class=\"BIDV\" title=\"Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam\"></i>\n							<input type=\"radio\" value=\"BIDV\" name=\"bankcode\">\n\n						</label></li>\n						\n					<li class=\"bank-online-methods \">\n						<label for=\"vcb_ck_on\">\n							<i class=\"VCB\" title=\"Ngân hàng TMCP Ngoại Thương Việt Nam\"></i>\n							<input type=\"radio\" value=\"VCB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"vnbc_ck_on\">\n							<i class=\"DAB\" title=\"Ngân hàng Đông Á\"></i>\n							<input type=\"radio\" value=\"DAB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"tcb_ck_on\">\n							<i class=\"TCB\" title=\"Ngân hàng Kỹ Thương\"></i>\n							<input type=\"radio\" value=\"TCB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_mb_ck_on\">\n							<i class=\"MB\" title=\"Ngân hàng Quân Đội\"></i>\n							<input type=\"radio\" value=\"MB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_vtb_ck_on\">\n							<i class=\"ICB\" title=\"Ngân hàng Công Thương Việt Nam\"></i>\n							<input type=\"radio\" value=\"ICB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_acb_ck_on\">\n							<i class=\"ACB\" title=\"Ngân hàng Á Châu\"></i>\n							<input type=\"radio\" value=\"ACB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_msb_ck_on\">\n							<i class=\"MSB\" title=\"Ngân hàng Hàng Hải\"></i>\n							<input type=\"radio\" value=\"MSB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_scb_ck_on\">\n							<i class=\"SCB\" title=\"Ngân hàng Sài Gòn Thương tín\"></i>\n							<input type=\"radio\" value=\"SCB\" name=\"bankcode\">\n\n						</label></li>\n					<li class=\"bank-online-methods \">\n						<label for=\"bnt_atm_pgb_ck_on\">\n							<i class=\"PGB\" title=\"Ngân hàng Xăng dầu Petrolimex\"></i>\n							<input type=\"radio\" value=\"PGB\" name=\"bankcode\">\n\n						</label></li>\n					\n					 <li class=\"bank-online-methods \">\n						<label for=\"bnt_atm_agb_ck_on\">\n							<i class=\"AGB\" title=\"Ngân hàng Nông nghiệp &amp; Phát triển nông thôn\"></i>\n							<input type=\"radio\" value=\"AGB\" name=\"bankcode\">\n\n						</label></li>\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_bab_ck_on\">\n							<i class=\"SHB\" title=\"Ngân hàng TMCP Sài Gòn - Hà Nội (SHB)\"></i>\n							<input type=\"radio\" value=\"SHB\" name=\"bankcode\">\n\n						</label></li>\n					\n\n\n\n				</ul>', 4, 1, '2018-02-06 10:09:38', '2018-02-08 03:00:18'),
(5, 'Thanh toán tại văn phòng ngân hàng', 'NH_OFFLINE', '<ul class=\"cardList clearfix\">\n					<li class=\"bank-online-methods \">\n						<label for=\"vcb_ck_on\">\n							<i class=\"BIDV\" title=\"Ngân hàng TMCP Đầu tư &amp; Phát triển Việt Nam\"></i>\n							<input type=\"radio\" value=\"BIDV\" name=\"bankcode\">\n\n						</label></li>\n					<li class=\"bank-online-methods \">\n						<label for=\"vcb_ck_on\">\n							<i class=\"VCB\" title=\"Ngân hàng TMCP Ngoại Thương Việt Nam\"></i>\n							<input type=\"radio\" value=\"VCB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"vnbc_ck_on\">\n							<i class=\"DAB\" title=\"Ngân hàng Đông Á\"></i>\n							<input type=\"radio\" value=\"DAB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"tcb_ck_on\">\n							<i class=\"TCB\" title=\"Ngân hàng Kỹ Thương\"></i>\n							<input type=\"radio\" value=\"TCB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_mb_ck_on\">\n							<i class=\"MB\" title=\"Ngân hàng Quân Đội\"></i>\n							<input type=\"radio\" value=\"MB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_vib_ck_on\">\n							<i class=\"VIB\" title=\"Ngân hàng Quốc tế\"></i>\n							<input type=\"radio\" value=\"VIB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_vtb_ck_on\">\n							<i class=\"ICB\" title=\"Ngân hàng Công Thương Việt Nam\"></i>\n							<input type=\"radio\" value=\"ICB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_acb_ck_on\">\n							<i class=\"ACB\" title=\"Ngân hàng Á Châu\"></i>\n							<input type=\"radio\" value=\"ACB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_msb_ck_on\">\n							<i class=\"MSB\" title=\"Ngân hàng Hàng Hải\"></i>\n							<input type=\"radio\" value=\"MSB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_scb_ck_on\">\n							<i class=\"SCB\" title=\"Ngân hàng Sài Gòn Thương tín\"></i>\n							<input type=\"radio\" value=\"SCB\" name=\"bankcode\">\n\n						</label></li>\n\n\n\n					<li class=\"bank-online-methods \">\n						<label for=\"bnt_atm_pgb_ck_on\">\n							<i class=\"PGB\" title=\"Ngân hàng Xăng dầu Petrolimex\"></i>\n							<input type=\"radio\" value=\"PGB\" name=\"bankcode\">\n\n						</label></li>\n\n					<li class=\"bank-online-methods \">\n						<label for=\"bnt_atm_agb_ck_on\">\n							<i class=\"AGB\" title=\"Ngân hàng Nông nghiệp &amp; Phát triển nông thôn\"></i>\n							<input type=\"radio\" value=\"AGB\" name=\"bankcode\">\n\n						</label></li>\n					<li class=\"bank-online-methods \">\n						<label for=\"sml_atm_bab_ck_on\">\n							<i class=\"TPB\" title=\"Tền phong bank\"></i>\n							<input type=\"radio\" value=\"TPB\" name=\"bankcode\">\n\n						</label></li>\n\n\n\n				</ul>', 5, 1, '2018-02-06 10:09:53', '2018-02-08 03:01:03'),
(6, 'Thanh toán bằng thẻ Visa hoặc MasterCard', 'VISA', '<p><span style=\"color:#ff5a00;font-weight:bold;text-decoration:underline;\">Lưu ý</span>:Visa hoặc MasterCard.</p>\n				<ul class=\"cardList clearfix\">\n						<li class=\"bank-online-methods \">\n							<label for=\"vcb_ck_on\">\n								Visa:\n								<input type=\"radio\" value=\"VISA\" name=\"bankcode\">\n							\n						</label></li>\n\n						<li class=\"bank-online-methods \">\n							<label for=\"vnbc_ck_on\">\n								Master:<input type=\"radio\" value=\"MASTER\" name=\"bankcode\">\n						</label></li>\n				</ul>', 6, 1, '2018-02-06 10:10:08', '2018-02-08 03:01:34'),
(7, 'Thanh toán bằng thẻ Visa hoặc MasterCard trả trước', 'CREDIT_CARD_PREPAID', '<p><span style=\"color:#ff5a00;font-weight:bold;text-decoration:underline;\">Lưu ý</span>:Thanh toán bằng thẻ Visa hoặc MasterCard trả trước.</p>', 7, 1, '2018-02-06 10:10:45', '2018-02-06 11:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

DROP TABLE IF EXISTS `persistences`;
CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(6, 1, 'WphP2gHqBbRpGKp2WcZb6APTYCNo1onf', '2017-11-12 08:12:08', '2017-11-12 08:12:08'),
(12, 1, 'HMMWMPpBDgdUbv54tKOldPvWyvcaeDCp', '2017-11-12 08:20:55', '2017-11-12 08:20:55'),
(20, 1, 'F4bWDfEvllT0fTv4EzWDp3NWpLxGo4n5', '2017-11-12 08:44:06', '2017-11-12 08:44:06'),
(27, 1, 'f7VCzyYASPW5vTVgTfv3Ji50sxy2ckIt', '2017-11-12 10:14:09', '2017-11-12 10:14:09'),
(35, 1, 'Zlbi5ja6c9Z7no06i5MvPsa8kZI3oLEZ', '2017-11-12 10:41:59', '2017-11-12 10:41:59'),
(43, 3, 'ZsvbfzLh4A4k34VMpmZCqIO2KIDk9pzP', '2017-11-12 10:51:37', '2017-11-12 10:51:37'),
(45, 3, '61CQHzrI8v42ppzJ35HclGUgzulYNwKD', '2017-11-12 10:51:57', '2017-11-12 10:51:57'),
(48, 4, 'M1VbjAgWRrVuXhVCqqvWAQHP287e5fuk', '2017-11-12 11:00:38', '2017-11-12 11:00:38'),
(52, 4, 'zWj9obfujhk7L1DEKOcSOMTi49HvkeVo', '2017-11-12 11:04:17', '2017-11-12 11:04:17'),
(64, 4, 'sGcmm3lmMPLTUyFeagebRe9YiPjWxHn0', '2017-11-12 11:20:36', '2017-11-12 11:20:36'),
(68, 4, 'DsgzaC5yhMG3miJpNrQFeWCpBwqfsMuO', '2017-11-12 11:21:48', '2017-11-12 11:21:48'),
(71, 4, 'aFa63uj6gzLcV0mZtU0nYvVinHZnvyAi', '2017-11-12 11:22:33', '2017-11-12 11:22:33'),
(73, 4, 'P672dGDcBqxGazfRAzJtUxPwSjTq9N4K', '2017-11-12 11:22:59', '2017-11-12 11:22:59'),
(74, 4, 'm0D8Z9mVczUYgqkSJXAwGQi8S9EaqrSg', '2017-11-12 11:23:03', '2017-11-12 11:23:03'),
(94, 1, 'W1uglu6PzKaOfwxa766IOJ33NDdulIri', '2017-11-12 13:01:17', '2017-11-12 13:01:17'),
(105, 4, 'lpP9axx2fJB8SUi7t2NlNMHasH10fl9N', '2017-11-12 19:31:42', '2017-11-12 19:31:42'),
(106, 4, '1PNxpqM3E2RYNr5CT1NzPzCOlNu4xILB', '2017-11-12 19:31:45', '2017-11-12 19:31:45'),
(107, 4, 'IJleJPrQEduTCpRbolCVqNbD3vzzhqXH', '2017-11-12 19:31:51', '2017-11-12 19:31:51'),
(110, 4, 'RyU6rnrEVVwusqJpB1boWgpODKNKthib', '2017-11-12 19:32:50', '2017-11-12 19:32:50'),
(113, 4, '2iWGSejY4rkJdkY2iK65Na0UV05uJEZ3', '2017-11-12 19:34:34', '2017-11-12 19:34:34'),
(115, 1, 'WQkHX9pd7HnW6Fwd58b6FNwURcoRYyK6', '2017-11-12 19:36:57', '2017-11-12 19:36:57'),
(119, 4, 'FGLu6nkqZkVigimI5Chx4mNmXgdi22qe', '2017-11-12 19:44:50', '2017-11-12 19:44:50'),
(124, 1, '1kZXCQqSfCEwmILvBACrUaHl5MpzQWXX', '2017-11-12 20:47:34', '2017-11-12 20:47:34'),
(125, 1, 'XJfqJ7pZakt8xtLNkULZUElD7jHOCtKt', '2017-11-13 17:44:28', '2017-11-13 17:44:28'),
(129, 1, 'JtMzzU4e61U2GRbOedwzutyNWAHHRHKp', '2017-11-13 23:43:59', '2017-11-13 23:43:59'),
(134, 1, 'zTVEKL7zcc4kvYk80AuKHQkn17d1TX0d', '2017-11-14 07:10:53', '2017-11-14 07:10:53'),
(135, 1, 'ZxzpfDpxrMTx7dRhvd1IQs0KoAyp8beZ', '2017-11-14 10:00:40', '2017-11-14 10:00:40'),
(138, 1, 'M9zXqXyMOTprNqZQI4LEpKqNogmDZiCE', '2017-11-14 20:35:29', '2017-11-14 20:35:29'),
(139, 1, 'CDF73h1lqr864dh5T5BQdTRf0hcrS45y', '2017-11-15 01:20:36', '2017-11-15 01:20:36'),
(143, 1, '50Hrxr02Q6CqKUF4p0G0bpP6PhcrLaNG', '2017-11-15 10:34:05', '2017-11-15 10:34:05'),
(145, 1, 'LRlBDrPFH3sF0WLHAUBGdJuLn5beDkqb', '2017-11-15 10:45:25', '2017-11-15 10:45:25'),
(149, 1, 'zV2fdfnD6X5jTDrXbKtgm2BQ4I4CN0vP', '2017-11-15 21:20:42', '2017-11-15 21:20:42'),
(154, 1, 'VbajMvJtRtkXTmUREmO1x8SnojOzoNy4', '2017-11-16 12:09:09', '2017-11-16 12:09:09'),
(155, 1, 'EN255XIbrvzjbXm2TdeuHOJnjAHBKhm0', '2017-11-16 19:00:45', '2017-11-16 19:00:45'),
(156, 1, 'a2STqoxCKAdKjJBxt5RxyBo23j196SqS', '2017-11-17 01:55:13', '2017-11-17 01:55:13'),
(157, 1, 'bWYcBrGX0pTubrxZ2Gz8mOrpfZh4d3R5', '2017-11-17 03:54:15', '2017-11-17 03:54:15'),
(158, 1, 'rOqRgZyRXdpE2wPQxm60VZEi4MVsaHwd', '2017-11-17 09:26:45', '2017-11-17 09:26:45'),
(159, 1, 'MUi9tluQQy8AhsadOL4sMuRSRaMPY2Vi', '2017-11-17 21:05:41', '2017-11-17 21:05:41'),
(162, 1, '0fsBWGHy3uFkICDp4rgusPKisYenbUr5', '2017-11-18 08:03:50', '2017-11-18 08:03:50'),
(163, 1, 'z2MidVz3A5SfcQtc9CjF83lbB9Ncxw4c', '2017-11-19 05:53:59', '2017-11-19 05:53:59'),
(164, 1, 'C3NrRRgDRZQLTrZraBO9IGEl2wXobUup', '2017-11-20 05:47:41', '2017-11-20 05:47:41'),
(165, 1, 'wgjWLdlRLP6Cireh1mZswQnOOTXG8z8O', '2017-11-21 03:33:18', '2017-11-21 03:33:18'),
(166, 1, 'OHI8P6DtqZVW9K4VlZ1mw5gI0IuJYPH1', '2017-11-21 04:17:05', '2017-11-21 04:17:05'),
(167, 1, 'qNdOfppeTTO8yQemqSZtz0s9qjIu8bSY', '2017-11-21 17:39:32', '2017-11-21 17:39:32'),
(168, 1, 'UJbhn9QwAcZUUXnVDtSStqNCq5akR4Lw', '2017-11-21 23:49:19', '2017-11-21 23:49:19'),
(169, 1, 'eo5eQNRwtkvZlv0DmXfze6JymlS0wylC', '2017-11-22 18:21:12', '2017-11-22 18:21:12'),
(173, 1, 'IulV4jEfAVovdnn5YGOTprw3kkvFe8NP', '2017-11-23 05:15:58', '2017-11-23 05:15:58'),
(174, 1, 'Awg5gkMADLkjPbiVitjCzS9ad5sCN9eF', '2017-11-23 18:51:55', '2017-11-23 18:51:55'),
(175, 1, 'STmoiFXISPPMkYZ46mHVd1FgZleRFPma', '2017-11-24 01:23:33', '2017-11-24 01:23:33'),
(176, 1, 'DS9Yw83Zm2blL1F2azbyCcQ4v2ktYX5H', '2017-11-24 02:11:20', '2017-11-24 02:11:20'),
(177, 1, 'e1ZyuWKHR7HQaQSkQEv4J6YMwpFFLXeC', '2017-11-24 06:39:38', '2017-11-24 06:39:38'),
(178, 1, '6KeLIVlJyL7P6FMEGpgxpNljzsQxI20T', '2017-11-25 05:02:32', '2017-11-25 05:02:32'),
(179, 1, 'tKhufJfgecAKrGEAT2EBaEPLaf517QVS', '2017-11-25 09:08:54', '2017-11-25 09:08:54'),
(180, 1, 't3XDlldaLWhVaxrPuwM6dT02mMflr87j', '2017-11-25 19:53:59', '2017-11-25 19:53:59'),
(182, 1, 'fM0W9o41fDgCiycVxhvQeJ02Opj3tULU', '2017-11-25 21:10:55', '2017-11-25 21:10:55'),
(184, 1, 'EMmXbaWTDFtG4QX9UfVNcK7eUBsy7nmJ', '2017-11-25 21:32:34', '2017-11-25 21:32:34'),
(185, 1, 'r6cxynGaM90IU8uZA7aJFjox941jTivP', '2017-11-26 05:12:26', '2017-11-26 05:12:26'),
(198, 1, 'qNJI9OXlvBnQT9IZvLyhcvnjFBHI3dZz', '2017-11-26 10:37:48', '2017-11-26 10:37:48'),
(199, 1, 'C9FPmC5NtedAPoygDQN2oqpB4EZN8azX', '2017-11-26 11:20:11', '2017-11-26 11:20:11'),
(202, 1, 'qCWvTU0oJSjAyobzeHt21656Rl1eWuvq', '2017-11-26 20:07:36', '2017-11-26 20:07:36'),
(203, 1, 'I0m5QArlodAFsFQj0cfoSiIaJ2ZGgbyg', '2017-11-26 23:06:11', '2017-11-26 23:06:11'),
(204, 1, '6tDVgt6sfCGnbfPYISYbMzCQKpXm8QKc', '2017-11-27 00:00:05', '2017-11-27 00:00:05'),
(205, 1, 'R0MhkpKtLCI5fIe1wwCeicZa0ftDQPwx', '2017-11-27 02:16:57', '2017-11-27 02:16:57'),
(206, 1, 'E69AlB0p8xLhxxNVrs46xwrP0a5wm3KX', '2017-11-27 07:58:05', '2017-11-27 07:58:05'),
(207, 1, 'qFJkZtCoPK72qECK96tX226VuMubIMBv', '2017-11-27 19:23:06', '2017-11-27 19:23:06'),
(208, 1, 'yTiyEBo8xE3PfzxTL1GFRVnqqi4ChmIZ', '2017-11-27 20:15:53', '2017-11-27 20:15:53'),
(209, 1, 'YN8x4updqv0OrIsWStBz2c7ZxI7VO5ug', '2017-11-27 20:17:20', '2017-11-27 20:17:20'),
(210, 1, 'UpPwfQYjNbyRmztTDCfl16md4weLyjG3', '2017-11-30 08:03:21', '2017-11-30 08:03:21'),
(211, 1, 'ArOxlkVdyW3lu3SJqot209bFrPZUAPgD', '2017-12-01 10:48:28', '2017-12-01 10:48:28'),
(212, 1, 'xoOGCB3x8fVFoBznts5EU1k13GmZiO11', '2017-12-02 19:53:50', '2017-12-02 19:53:50'),
(214, 1, 'Jqk5DXGugxgRtsZy4pBEFn7brMvOjghm', '2017-12-03 11:57:16', '2017-12-03 11:57:16'),
(216, 1, 'nYe5QuFSOr8eu7GG8atx6EbvbM1XUMlY', '2017-12-03 17:58:34', '2017-12-03 17:58:34'),
(217, 1, 'P5Q1q3gYWSt4k7c0BLPth6QEpGmYVG5T', '2017-12-04 11:12:33', '2017-12-04 11:12:33'),
(218, 1, '0aNMDBXR8Xzt5DTF9HcK4OBSaZyohSzF', '2017-12-05 09:04:17', '2017-12-05 09:04:17'),
(219, 1, '8J8vasVhkLwqagOIRNKwiIU94QoexH4O', '2017-12-05 18:41:41', '2017-12-05 18:41:41'),
(220, 1, 'JChXlObze9eklsMJrTNLH6ekOw47H5mz', '2017-12-06 00:14:21', '2017-12-06 00:14:21'),
(221, 1, 'z18eXjqdkmbBbwJcvBAIt2o5DxA51xjw', '2017-12-06 08:20:51', '2017-12-06 08:20:51'),
(222, 1, 'F40EmMwa02fVssVHs66z0XASzB3S5sqM', '2017-12-08 11:51:41', '2017-12-08 11:51:41'),
(223, 1, 'Ee5i5S8MD2HQVPa7TKeEK3HekFbSCLcO', '2017-12-10 19:42:21', '2017-12-10 19:42:21'),
(224, 1, 'JebpNZTP11ct8IzcxmbYePuG978Jpumq', '2017-12-10 20:05:44', '2017-12-10 20:05:44'),
(226, 1, 'qPVObxjq9k29qoRVkiAV89K6Ds8MnpRz', '2017-12-10 21:48:03', '2017-12-10 21:48:03'),
(227, 1, 'Q0mGHYM1KOmlyLqq9Kw2lH5F1e2t8nIE', '2017-12-11 09:24:23', '2017-12-11 09:24:23'),
(228, 1, 'PKvAShIoy3rHzKX98qFrlcxx9q0weXbE', '2017-12-11 20:07:50', '2017-12-11 20:07:50'),
(229, 1, 'D3EIc9je8gVdFHzEluwGYSxLvcYWfISa', '2017-12-12 10:23:23', '2017-12-12 10:23:23'),
(230, 1, 'LlCfFTdhZIG7Fqb0249N2hlssIbwgswv', '2017-12-12 19:38:58', '2017-12-12 19:38:58'),
(231, 1, '5P3ys652WPCFCcMEtYp9K6YFz8KClLdt', '2017-12-12 20:37:12', '2017-12-12 20:37:12'),
(232, 1, 'AuLUtUUmPWZaLWJxm2RtyHkflWsMlIvb', '2017-12-12 20:48:06', '2017-12-12 20:48:06'),
(233, 1, 'OoMvRAracnoqhoXECrlxDTA8S4M7pGEC', '2017-12-12 21:39:03', '2017-12-12 21:39:03'),
(234, 1, 'LspxbedO8o6CbiofYR0uqLfOwunUpfCT', '2017-12-12 22:11:41', '2017-12-12 22:11:41'),
(235, 1, 'TaJdE7jjBDOwYE4eqf955JoMQh2MGnga', '2017-12-12 23:42:01', '2017-12-12 23:42:01'),
(236, 1, '9ldSOnqDOOdFI4SuMFTE5sOXeKeDaFMK', '2017-12-13 01:24:31', '2017-12-13 01:24:31'),
(237, 1, 'Omqc5SMLNnckeyPe5h70EHA0yUqZ1yAr', '2017-12-13 01:26:17', '2017-12-13 01:26:17'),
(238, 1, 'N57JQIUmXSgVZUN25mI9zA6QB3krnDJa', '2017-12-13 01:27:02', '2017-12-13 01:27:02'),
(239, 1, 'tKi6yXfXoogbGH6Ui12Pps4xBnKQQ1Y6', '2017-12-13 02:42:24', '2017-12-13 02:42:24'),
(241, 1, 'fdAX0oX5HE6HEOuPnpQOCPJPQHOTJazL', '2017-12-13 11:11:26', '2017-12-13 11:11:26'),
(243, 1, '5F15aKMYAKbpu8xARjjk4Z3b4ZLLaiHN', '2017-12-13 19:46:28', '2017-12-13 19:46:28'),
(244, 1, 'bmx6cC4QULNMW3CCh933DzA3kvhDM0ai', '2017-12-13 20:18:26', '2017-12-13 20:18:26'),
(245, 1, 'p89msT6X0idRVFgnJegC63D5VXzGzQZs', '2017-12-13 20:46:43', '2017-12-13 20:46:43'),
(247, 1, 'pS5xSImoYKACiZzQYCbCN9WYfAyE17BJ', '2017-12-13 23:44:24', '2017-12-13 23:44:24'),
(248, 1, 'Ei3UzlkB8E8L2EwvJ6uf7RqWbSiEXWqw', '2017-12-14 02:24:40', '2017-12-14 02:24:40'),
(249, 1, 'XDhhxpNpsyR8JqU9QF9ciEtMAUxzQb70', '2017-12-14 05:39:40', '2017-12-14 05:39:40'),
(251, 1, 'gYei12wI1Xx9L458waGZcXrpzfJSLrEw', '2017-12-14 05:40:20', '2017-12-14 05:40:20'),
(253, 1, 'o0i98RskGVcDO68h58WHtVILX3X7GyZZ', '2017-12-14 08:30:08', '2017-12-14 08:30:08'),
(254, 1, 'rYXzVG9bTG0q8AAikn8E1gKFDUln4zZT', '2017-12-14 17:36:03', '2017-12-14 17:36:03'),
(255, 1, 'yaZ3Gkr2fhEHy46HJzcTlIMgLZjtVE0P', '2017-12-14 18:39:23', '2017-12-14 18:39:23'),
(256, 1, 'YmZvD9xhUam8WQjZebIu5UA5fa79Vmpw', '2017-12-14 19:13:37', '2017-12-14 19:13:37'),
(257, 1, 'GHd02IbsGjboWps4UOuoRMKEHhdAeM4Q', '2017-12-14 19:20:29', '2017-12-14 19:20:29'),
(258, 1, 'bEwsrdAAVsEols37gzepZRofpjQ5CpkS', '2017-12-14 19:46:00', '2017-12-14 19:46:00'),
(259, 1, 'Op5b8y1v9a1Z1AasgU1buuI9PXTpXq14', '2017-12-14 20:36:43', '2017-12-14 20:36:43'),
(260, 1, 'H491pNtELCOBnhzmGJJG5pVQqCQqQ6y9', '2017-12-15 07:13:52', '2017-12-15 07:13:52'),
(265, 1, 'x7SZJyE8pqvN1UmSOiLMvTIDgPU8Op1v', '2017-12-15 23:56:34', '2017-12-15 23:56:34'),
(269, 1, 'bCLJ9ILMZeWaTyO9PK1h4WZ3yG712Q3h', '2017-12-16 00:27:26', '2017-12-16 00:27:26'),
(270, 1, 'VTVKHrHmyn9Ree3oENKNiqLQ8PEllFBP', '2017-12-16 00:40:12', '2017-12-16 00:40:12'),
(271, 1, 'tE71PsmEixwJk0QCDYeIEPpZ6XfzfmQL', '2017-12-16 02:57:23', '2017-12-16 02:57:23'),
(272, 1, '5aHeCSmiZ5bKLIYyaV3gGw8msN1aA63K', '2017-12-16 08:08:53', '2017-12-16 08:08:53'),
(282, 1, 'EUtWgeynbqabsviLDajTiXg6az4xEx4S', '2017-12-16 11:25:51', '2017-12-16 11:25:51'),
(283, 1, 'xKZoSmxNW0WGyljs2cdzeQI7OoHOEYbj', '2017-12-16 20:33:48', '2017-12-16 20:33:48'),
(284, 1, '958RICNQ5SWqdtnNopOEAQEGjy71OLrP', '2017-12-17 07:52:39', '2017-12-17 07:52:39'),
(286, 1, '5wQF5syYD14KXWyo2G0TdOpFgPvDwWML', '2017-12-17 19:52:04', '2017-12-17 19:52:04'),
(287, 1, '57cBU7Ds9QMsjwn0klqjotmHkWuIFlp7', '2017-12-25 19:27:36', '2017-12-25 19:27:36'),
(288, 1, 'pSNdXiePmuervyNG25HffYLqSY4CqCNV', '2017-12-25 21:29:41', '2017-12-25 21:29:41'),
(289, 1, 'HrHLtRQPfVz6XIzSP9YMkHOswmru4q9A', '2017-12-25 21:47:02', '2017-12-25 21:47:02'),
(290, 1, 'loABizfP1dl9zchCj2681qVIsF3OKrJ3', '2017-12-27 10:38:20', '2017-12-27 10:38:20'),
(291, 1, '6oNxIkIquNcQIOEPZnb9gd69OiMONpDD', '2017-12-27 10:45:14', '2017-12-27 10:45:14'),
(292, 1, '1tEcrFgJDbeU1aUB6H5mnmO7zua63PuQ', '2017-12-27 19:13:01', '2017-12-27 19:13:01'),
(293, 1, 'MUkVIspzdlXbtHyCGhcCsnvK7SeCkOVu', '2017-12-27 19:25:12', '2017-12-27 19:25:12'),
(294, 1, 'PSyuKpYZcZ9Ji2eZ5j5rfSh0u6yWDxDS', '2017-12-27 22:32:12', '2017-12-27 22:32:12'),
(295, 1, '5QXQdR5dMiMQF4MSYyuVsYzj5N51Tzux', '2017-12-28 01:38:51', '2017-12-28 01:38:51'),
(296, 1, '6oyeQrWmS58vLjNBe4iMxPX7mUl4gJ8g', '2017-12-29 02:09:33', '2017-12-29 02:09:33'),
(297, 1, 'myq1k4YmAJV6HmELv3CY4Fme7QllpMyV', '2017-12-29 05:40:48', '2017-12-29 05:40:48'),
(298, 1, 'KqG7rQKRTxtJ5owuAVvKCpgDd9ylxyuB', '2018-01-01 19:20:46', '2018-01-01 19:20:46'),
(299, 1, 'gGIbwURi3h2p30EwdzpVSN7s89oJbs1o', '2018-01-01 19:42:39', '2018-01-01 19:42:39'),
(300, 1, 'TMAKb6m8MTahrN1lFJTIoni9vymizoPX', '2018-01-01 22:34:23', '2018-01-01 22:34:23'),
(301, 1, 'fZ3RQ9jvj6UvF2UOcrWIC5tnFpmqrmJr', '2018-01-02 00:59:34', '2018-01-02 00:59:34'),
(302, 1, 'mP3Z9KVER7893IYjcGERZFXKDhm7biAm', '2018-01-02 18:30:12', '2018-01-02 18:30:12'),
(303, 1, 'tsyksujmywH7Hoz3hxqML9Th24Zcv3Dy', '2018-01-03 00:41:50', '2018-01-03 00:41:50'),
(304, 1, 'dMRpWGk7Uvdn3lza8LXBsbteeUnWMOSW', '2018-01-03 05:04:01', '2018-01-03 05:04:01'),
(305, 1, 'F8pNbJFdCdNEIwRCgulVQ1rb5oYmT267', '2018-01-03 09:50:30', '2018-01-03 09:50:30'),
(308, 1, 'mmgyGjX6FKaZrTA1Sy46Xk5afFSPTiLz', '2018-01-03 10:32:13', '2018-01-03 10:32:13'),
(309, 1, 'WkZAETYgs1qll9a5SzLJ5emRNEM2jQcC', '2018-01-03 19:35:54', '2018-01-03 19:35:54'),
(310, 1, 'i3u3Fev9GhSTSKw8zqKOtDxyBukTswNF', '2018-01-04 00:00:04', '2018-01-04 00:00:04'),
(311, 1, 'wIgyuIWSRPW3SoRC3SCDlIdvMSN1ntwp', '2018-01-04 07:50:26', '2018-01-04 07:50:26'),
(312, 1, 'lhTwGs8hINh78Dsjm9VZpOqyGh4ubnFD', '2018-01-04 18:27:00', '2018-01-04 18:27:00'),
(313, 1, 'XZqSKTU7fCn9dhY7pDGf6ny090eeqe8H', '2018-01-05 05:03:20', '2018-01-05 05:03:20'),
(314, 1, 'xPlA9MCUQ1DqNmZwgnVqmexRptuA4bju', '2018-01-05 07:13:15', '2018-01-05 07:13:15'),
(315, 1, 'tIKVZUBkeaj76cE4QGvO5rqFgawgYMNP', '2018-01-06 03:08:10', '2018-01-06 03:08:10'),
(316, 1, 'ntMLkIGaGhDneocoWJFOZTyl6MhuzZan', '2018-01-06 12:28:22', '2018-01-06 12:28:22'),
(317, 1, 'QU8qluCPQ7F4XdP5njtjcRWqzlXX9S8h', '2018-01-06 22:56:38', '2018-01-06 22:56:38'),
(318, 1, 'Us4ZHvY5DHcwpQVf9XysqakskdvsAzFV', '2018-01-07 04:20:27', '2018-01-07 04:20:27'),
(319, 1, 'AsTUE50pKXOtm27NbymiqbnpVrlhzWQ4', '2018-01-07 07:12:26', '2018-01-07 07:12:26'),
(320, 1, 'TSocJysjRMp42L96vEg02rwZBiEUKyyN', '2018-01-07 09:18:55', '2018-01-07 09:18:55'),
(321, 1, 'KQ0cszOBSWH87hnzA7wcYJLSbNcVQgpg', '2018-01-07 19:37:24', '2018-01-07 19:37:24'),
(322, 1, 'H8BxgWKyBTe4U5lwpdbYG43owssAnk1y', '2018-01-08 02:28:24', '2018-01-08 02:28:24'),
(323, 1, '8CEZcoGrealxWIzhXRxoDIGmPieyZkGP', '2018-01-08 04:07:45', '2018-01-08 04:07:45'),
(324, 1, '9wJ8Z8j1bqUBFAPGBkUytzbUmZqKV3HL', '2018-01-08 08:56:34', '2018-01-08 08:56:34'),
(325, 1, 'XKZh1syWLfcamMSbLhsL9SJVPf2Mfv67', '2018-01-08 10:14:35', '2018-01-08 10:14:35'),
(327, 1, 'loNG0asl3Sj6zCitYw1n692cZ5AWL72j', '2018-01-08 23:13:14', '2018-01-08 23:13:14'),
(328, 1, 'kFqFfFmhk2m2hy3Bj3Kuhn8YkI6WyGP1', '2018-01-08 23:20:42', '2018-01-08 23:20:42'),
(329, 1, 'U7t1BBwwPaAhglF8LUPBuWCzHANUDsKh', '2018-01-09 01:22:36', '2018-01-09 01:22:36'),
(330, 1, 'kryBmI5jqwrndEJvS7r4QFl5aKOUn4Rl', '2018-01-09 11:51:15', '2018-01-09 11:51:15'),
(331, 1, 'Yll3QjOrDTaxUkqpcbg62fOqmFlHLhgp', '2018-01-09 20:29:19', '2018-01-09 20:29:19'),
(332, 1, 'AYnzFsKBk3DG8o1HFCkbUaRcTs92YbM3', '2018-01-09 21:30:21', '2018-01-09 21:30:21'),
(333, 1, 'rNBV0y0Wan6Qpj65pQmiJOQ52qtkQ0sL', '2018-01-10 00:31:26', '2018-01-10 00:31:26'),
(334, 1, 'jKTPdBjo4Ev0seh3qIoU8CMVvIE0TTkE', '2018-01-10 02:52:39', '2018-01-10 02:52:39'),
(335, 1, 'E8NFXc9C2nsm8W6FWfgrrGsobWiPRnCT', '2018-01-10 08:34:20', '2018-01-10 08:34:20'),
(336, 1, 'vQMwlhh0SMMXZiQ7fQX1UweaJtNwM2Bv', '2018-01-10 19:06:53', '2018-01-10 19:06:53'),
(337, 1, 'ws5Lv88o5eWYYKzeiqwIHXmhwb5ItcOf', '2018-01-11 07:38:41', '2018-01-11 07:38:41'),
(338, 1, 'ouWCgfhI5q9H3k4h6w2tttsiJV8y3Qzp', '2018-01-11 10:31:12', '2018-01-11 10:31:12'),
(339, 1, 'elx9rwAfOXrPGOmTcsxZ9gsI5i9B9FAJ', '2018-01-11 10:32:25', '2018-01-11 10:32:25'),
(340, 1, 'utdXQIFty8RcOHFm8tpglAx8ANG7irml', '2018-01-11 18:57:38', '2018-01-11 18:57:38'),
(341, 1, 'XigZe34t3cWVnSlrmtPwHHvUHXNHmyPT', '2018-01-11 19:10:44', '2018-01-11 19:10:44'),
(342, 1, 'wwJoo2CBoB1bdZp6C56TPlo1lQ7mLSUa', '2018-01-11 23:57:32', '2018-01-11 23:57:32'),
(343, 1, 'D4OaTt5Z6zu1q6cPPJdne029l1QSAIJz', '2018-01-12 00:55:46', '2018-01-12 00:55:46'),
(344, 1, 'pvdA7qp7hS1G0FazeLwNIJkHXK7hQXzs', '2018-01-12 01:56:45', '2018-01-12 01:56:45'),
(345, 1, 'TcFmUyoJEeyOuCos5ePBdYugNanUjxVd', '2018-01-12 02:06:12', '2018-01-12 02:06:12'),
(346, 1, 'gKRIy92eSDkDLPtDEzZxHPvTO7vmNoaA', '2018-01-13 12:11:00', '2018-01-13 12:11:00'),
(347, 1, 'RHDxUSWbh2csZRCETQ3hXJuTLr4FyzzU', '2018-01-13 13:09:15', '2018-01-13 13:09:15'),
(348, 1, 'pTRVtKlFP6VnVnh61v9ZDhDBtutgZcta', '2018-01-13 13:12:05', '2018-01-13 13:12:05'),
(349, 1, '6k8RmyBaDmXZTwXKws2BaqjnebRDA46s', '2018-01-13 22:32:59', '2018-01-13 22:32:59'),
(350, 1, '29aWBcPaThOZhTUJ3TCMTr06inrXXpPc', '2018-01-14 05:18:27', '2018-01-14 05:18:27'),
(351, 1, 'l1FodYbVYnF5qllJXQn47jURkjbYQIah', '2018-01-14 09:12:20', '2018-01-14 09:12:20'),
(352, 1, 'C7CLHzromxCwETZPNWuFB5KQ1lLgJktO', '2018-01-14 09:39:44', '2018-01-14 09:39:44'),
(353, 1, 'Y7i1AwV61KINlely1225s2t3KYEoTeCl', '2018-01-14 09:54:05', '2018-01-14 09:54:05'),
(354, 1, 'yEepEQljz0lQ9veGResUYlNzZmZVSzYY', '2018-01-14 21:21:16', '2018-01-14 21:21:16'),
(355, 1, 'MoHMY2GAVZ06IfQ8lOrjvKHgSpRlt3sf', '2018-01-14 21:43:17', '2018-01-14 21:43:17'),
(356, 1, 'gJFjqXGL718vBEDWtiWFqrXd7wzQ3PJu', '2018-01-15 11:12:16', '2018-01-15 11:12:16'),
(357, 1, 'lAT4nQL5p2NV6Av36QLpsaS9oTck2miN', '2018-01-15 18:30:37', '2018-01-15 18:30:37'),
(358, 1, '7YzpEdozcjd8zxPMQBoLKz4wKQNvPvmk', '2018-01-15 18:55:34', '2018-01-15 18:55:34'),
(359, 1, 'CDE7azpfNeLEJOz3qA6iixYxURaNY7eL', '2018-01-16 02:56:25', '2018-01-16 02:56:25'),
(360, 1, 'MeVL2sSlFRzhrG0xaJ6ZqRoDCyyrfqpw', '2018-01-16 10:27:54', '2018-01-16 10:27:54'),
(362, 1, '7YWkgnr0fcthbBrZtZxI5VYfq9GkeIrH', '2018-01-16 20:15:12', '2018-01-16 20:15:12'),
(363, 1, 'C7HQZp1uoHWuUddbCURbC67F8WRFPbhz', '2018-01-16 20:57:30', '2018-01-16 20:57:30'),
(364, 1, 'An1hk9DM1kFNeHQDbXs26BUas2QhrMQM', '2018-01-17 00:28:12', '2018-01-17 00:28:12'),
(366, 1, '1wUTqWD2BFEEIS98lz1DmfP6K2QhdeMT', '2018-01-17 00:47:17', '2018-01-17 00:47:17'),
(368, 1, 'qsZQcTzpevnkZoiyIpQbaR4qu3r4g3GV', '2018-01-17 04:18:35', '2018-01-17 04:18:35'),
(372, 1, 'WjL3wP64VMbVgVUFVl99MdM5kcIdpQCy', '2018-01-17 08:29:47', '2018-01-17 08:29:47'),
(373, 1, 'ttUIgNCKBMBEkjLsKH9WuRDAEG4TPjzU', '2018-01-17 20:14:51', '2018-01-17 20:14:51'),
(374, 1, 'noRUog2Feq5ZNAGHfze9DBaubeDzabca', '2018-01-17 20:57:02', '2018-01-17 20:57:02'),
(375, 1, 'zkZ51ymxpywKCyuXmR3HqwHymINrQMfz', '2018-01-18 00:10:25', '2018-01-18 00:10:25'),
(376, 1, 'lzNZOymz8HgNudpRO5sMyTKipm0tpDGF', '2018-01-18 00:16:14', '2018-01-18 00:16:14'),
(377, 1, '2yCG7tSmilLxN8pzJjS2eMkCbplTTJ0h', '2018-01-18 03:52:31', '2018-01-18 03:52:31'),
(378, 1, 'RMWiH4kf71KduXOMGFtgTa3VDI7RA25R', '2018-01-18 09:25:22', '2018-01-18 09:25:22'),
(379, 1, 'jXAi4A9SVVlzEzUs51gWW6AFaJRNKgkG', '2018-01-18 11:20:09', '2018-01-18 11:20:09'),
(380, 1, 'WxxLLaypmZiGOfHWBQbzPUjt0bams3gx', '2018-01-18 11:57:31', '2018-01-18 11:57:31'),
(381, 1, 'KkJ6EvsSh1GkOXBYtfLzTeTE4H2mLzTT', '2018-01-18 19:23:30', '2018-01-18 19:23:30'),
(382, 1, 'xF88UwOSd9p1tmkrmBOEgAjIomkJB0Hx', '2018-01-19 00:25:51', '2018-01-19 00:25:51'),
(383, 1, 'A32q6kvPJplJ4WAIYSrx60zCSSnxpaDG', '2018-01-19 01:20:22', '2018-01-19 01:20:22'),
(384, 1, 'lPLxh0KbKNSsXA2BILeBXobgaGj68OKR', '2018-01-19 02:03:13', '2018-01-19 02:03:13'),
(385, 1, '5HCVqG0BkfTwNNXMnON1OkvmplY5VtPh', '2018-01-19 09:04:44', '2018-01-19 09:04:44'),
(386, 1, 'taFneiiXaSPaXyiEJwFR60oA690Cb2X8', '2018-01-19 20:43:49', '2018-01-19 20:43:49'),
(387, 1, 't23Yq0Wf57G9dDYIZ2lHzkBEnq6ICQAK', '2018-01-20 11:58:10', '2018-01-20 11:58:10'),
(388, 1, 'XmFShMJFqbARwYvuwfNLSOdWLrZmr32z', '2018-01-20 21:08:01', '2018-01-20 21:08:01'),
(389, 1, 'MBWjdSM0CwnQcdFbo5ea8EyDH1YC5ST0', '2018-01-21 05:40:50', '2018-01-21 05:40:50'),
(390, 1, 'evDd4G82kjgac50TOKv1DZrobHzWEZr8', '2018-01-21 08:05:52', '2018-01-21 08:05:52'),
(391, 1, '4dPKUN7BFQPOuGvA8Xt8Oh8azZQQ9pkx', '2018-01-21 10:51:12', '2018-01-21 10:51:12'),
(392, 1, 'iOi6rBobAw6B2Khg9CLDbPizVJYKGW94', '2018-01-21 18:51:39', '2018-01-21 18:51:39'),
(393, 1, 'CY5tmN8UCUMqmSVoRFOipfHKUpoT0j4f', '2018-01-22 00:07:03', '2018-01-22 00:07:03'),
(394, 1, 'aGzNsWOhDrVlT9HIVVFwCpsue1r7D5YA', '2018-01-22 00:44:48', '2018-01-22 00:44:48'),
(395, 1, 'VS5iiETNULvHItpuUmHQUH81sChbbY1l', '2018-01-22 19:02:07', '2018-01-22 19:02:07'),
(399, 1, 'NWnj4UvnZqwWOTX3CeusZ6v8Fhf2c6ub', '2018-01-24 19:02:36', '2018-01-24 19:02:36'),
(400, 1, 'VLSxXPLlSKCtughyjzMut9ug3flrhyi1', '2018-01-24 19:27:36', '2018-01-24 19:27:36'),
(401, 1, 'SnMonFyxu1katYF7DoIioInfgbQIbY6Z', '2018-01-24 23:56:14', '2018-01-24 23:56:14'),
(402, 1, 'u8RnIhbv4c9eCZZaMSjHrsM9hfTRb3r5', '2018-01-25 00:09:18', '2018-01-25 00:09:18'),
(403, 1, 'kb7yBdeIHuIl4kIa9Jt7nDFpllfRVRhx', '2018-01-25 02:08:12', '2018-01-25 02:08:12'),
(404, 1, 'gVw8xTL0zeKZYrqEGP4CcC85esbG8ypE', '2018-01-25 18:18:17', '2018-01-25 18:18:17'),
(406, 4, 'A4FLGiVU9LvfsVEp5mrRl5TZl6nb3ksW', '2018-01-26 01:05:01', '2018-01-26 01:05:01'),
(408, 4, 'aiVheclIV8RMZL6ZMbi0Dg04vjfucSZP', '2018-01-26 01:05:31', '2018-01-26 01:05:31'),
(409, 1, 'gUdW9qbl64egCPRWtavTK9wnexEo3keM', '2018-01-26 01:08:27', '2018-01-26 01:08:27'),
(410, 4, '3HSzUQI78C96yV5DRt6jGX33bdYCK9fb', '2018-01-26 01:43:11', '2018-01-26 01:43:11'),
(411, 4, 'tOlFF3JRWPtyXMuVCeaaMiHjBd2elRJF', '2018-01-26 01:44:07', '2018-01-26 01:44:07'),
(412, 4, 'NscMqRLmkV3IOWMf6RhfVuJbkL8xgsDC', '2018-01-26 01:46:45', '2018-01-26 01:46:45'),
(414, 6, 'wgJCXkC4Mn1V5f0YC9lp8bPKDt85kGtq', '2018-01-26 02:25:04', '2018-01-26 02:25:04'),
(416, 6, 'zSKba5kTj8Qr4ojFsxLqGI7xLuD4q0WR', '2018-01-26 02:30:32', '2018-01-26 02:30:32'),
(417, 6, 'rzG8JBGeT8fiapZ9DtD2uip0lQJwh5q2', '2018-01-26 02:37:18', '2018-01-26 02:37:18'),
(419, 1, 'Sw9M1Lswoukl6vcgMxoFzXvaAtMQCxAA', '2018-01-26 02:57:09', '2018-01-26 02:57:09'),
(420, 1, 'uUOUyXWyeFziFHkxz8h4bDzxhywQ37Si', '2018-01-26 02:57:48', '2018-01-26 02:57:48'),
(421, 1, 'MbKhVbGfhtxwZPPVgtHxdstVXuLeAaiU', '2018-01-26 02:58:29', '2018-01-26 02:58:29'),
(422, 1, 'wJ73tjH6p3w5MYYe7n21fOiCeA3QZfKb', '2018-01-26 02:58:29', '2018-01-26 02:58:29'),
(423, 1, 'VnxOGigvNVkdiHwI3uvstUftvZRW8oBI', '2018-01-26 02:58:36', '2018-01-26 02:58:36'),
(425, 6, 'J0ifpUcLW0NOdbzz7ewLRHG9BpBcOrRA', '2018-01-26 03:17:02', '2018-01-26 03:17:02'),
(427, 6, 'balWgkJAiveVZzQfMycjeIUYgqNmLW3y', '2018-01-26 03:35:38', '2018-01-26 03:35:38'),
(429, 6, 'UyB9F0vWGHpwS1r9avhYxJizwU4HVIwM', '2018-01-26 03:39:37', '2018-01-26 03:39:37'),
(431, 6, 'qfkVlp3dp4QXymKAkS2PfMQCdIeFHQOx', '2018-01-26 04:32:49', '2018-01-26 04:32:49'),
(433, 1, 'A3z4mzsQPa7TSS1rthS9qcXBXGZRHvME', '2018-01-28 09:36:02', '2018-01-28 09:36:02'),
(434, 1, 'fAPFbxNuoTiKlDhdRh4hZPCArPfnVG4h', '2018-01-28 09:36:02', '2018-01-28 09:36:02'),
(439, 1, '0KG2CDdHiNeVtq5WaMwsrvsHxWeLiY9E', '2018-01-28 09:59:33', '2018-01-28 09:59:33'),
(441, 1, 'coUpXV4oip1EFQd6L1wHB22aEgmD85MB', '2018-01-28 10:02:44', '2018-01-28 10:02:44'),
(442, 1, 'qxtyJQgQjE7IdV5pnazmZdm0VB1dGvJn', '2018-01-28 10:02:44', '2018-01-28 10:02:44'),
(443, 1, 'eBajDKsoIEBHqQFXz0BKLjJ9nJHtELsK', '2018-01-28 18:19:52', '2018-01-28 18:19:52'),
(444, 1, 'l9baDmYe0AnLN5Gle9ep2sE7cHEVOnr5', '2018-01-28 18:19:52', '2018-01-28 18:19:52'),
(447, 8, 'GmZMlufC8X5lo3RzA5gsyz2kXYwWvwQF', '2018-01-28 20:45:36', '2018-01-28 20:45:36'),
(448, 8, 'PPGJaXq6NaHLG1dnSP9FOkjzFSdKqvvI', '2018-01-28 21:38:01', '2018-01-28 21:38:01'),
(449, 1, 'vBzzq1RtNsCmGiczUJLFsHSyNzTTubXg', '2018-01-28 21:38:13', '2018-01-28 21:38:13'),
(451, 1, 'B3WzQ8UpMARDoY28vEkB7erfEEpHmLT1', '2018-01-28 21:38:37', '2018-01-28 21:38:37'),
(454, 8, 'tn7HvCBoyGphTHqjxPl0d3fJ3TWVRmTi', '2018-01-29 00:39:35', '2018-01-29 00:39:35'),
(457, 1, 'oo71n7ghA1RolYX2RzzeXwiTJ4KcV6zr', '2018-01-29 18:33:51', '2018-01-29 18:33:51'),
(458, 8, 'jfRtZvsf76QuiNUNY0sgWSA0SbX0YmBR', '2018-01-30 01:41:20', '2018-01-30 01:41:20'),
(460, 1, 'V2vGTjxoDwMXXVvXTCCsodx2oqNRBswK', '2018-01-31 00:07:51', '2018-01-31 00:07:51'),
(461, 1, 'WXfdX3IbIO2N4pHvxeElybt2HWjDzpsZ', '2018-01-31 00:07:51', '2018-01-31 00:07:51'),
(462, 1, 'zWSf8uHGNVGZn8HsVpCc4iowpPHSBqvU', '2018-01-31 09:19:53', '2018-01-31 09:19:53'),
(464, 8, 'ajfSvynTDfObqdqWFVTaN52EkMP1AUNJ', '2018-01-31 10:29:33', '2018-01-31 10:29:33'),
(465, 8, 'ag2Euhwpe5LXZvoQ1FsRXSH2yo0EHwsm', '2018-01-31 10:35:49', '2018-01-31 10:35:49'),
(467, 8, 'yR8tHjT4HKlrVJLADJ5LykJbP27czCKC', '2018-01-31 10:38:45', '2018-01-31 10:38:45'),
(468, 1, 'gJnB66CrVq6a8Mo6GhtYiOtLZhZ1LTMd', '2018-01-31 10:50:07', '2018-01-31 10:50:07'),
(475, 1, 'L7DcvNPiOQIUjCUATn61Y2sh3g3R2k49', '2018-01-31 19:35:25', '2018-01-31 19:35:25'),
(476, 1, 'QK86h3fyZTBFMRUhuP0ZKm1Wq4kzxPbS', '2018-01-31 19:35:25', '2018-01-31 19:35:25'),
(478, 1, 'VqoYkwd6LBv1rVWPEtIMR05InmYOuszG', '2018-01-31 19:55:02', '2018-01-31 19:55:02'),
(479, 1, 'JztvQ0vdnItZtqSiZD0Fi6NEK6c5PjZc', '2018-01-31 19:55:02', '2018-01-31 19:55:02'),
(481, 8, 'zX2GBFJB6Jpcz8jaXScc8XmWSgARW6y1', '2018-02-01 01:42:35', '2018-02-01 01:42:35'),
(482, 8, 'JWqpm7p61IXddy2YyuMkzHTdg7OWwVdL', '2018-02-01 01:50:31', '2018-02-01 01:50:31'),
(483, 1, 'Ck89j1QoAOeoNZvhYi5wPRW4nTm0C1dq', '2018-02-01 02:29:04', '2018-02-01 02:29:04'),
(486, 1, 'AKrOzoCvVttxLIVRMnTD6GPbj2iWGwvK', '2018-02-01 02:56:37', '2018-02-01 02:56:37'),
(487, 1, 'BaciCQSFrRR68rCmWlXSBTzmdHd27uiN', '2018-02-01 02:56:37', '2018-02-01 02:56:37'),
(488, 1, 'KGY6WVGRXBb3UJWz8YnDSw8hXGgzgkA6', '2018-02-01 11:35:24', '2018-02-01 11:35:24'),
(489, 1, '6WdgCEIxtViQrSWjU3UK9HL7wyZ34TUX', '2018-02-01 11:35:24', '2018-02-01 11:35:24'),
(490, 1, 'SfQrjxzVWC8XrSnz8yWht0t3Q8UQdOQr', '2018-02-01 18:27:36', '2018-02-01 18:27:36'),
(494, 1, 'RjNhUlg5noCoWG1eUNo1StHO874EkDvu', '2018-02-01 19:03:40', '2018-02-01 19:03:40'),
(497, 1, 'cESLyplJNgtAmPpMwURnw68ZWEV39PK2', '2018-02-01 19:42:32', '2018-02-01 19:42:32'),
(499, 8, 'NtMOofbv1v5rH5JB3OUHnsrFrF271Tzi', '2018-02-01 20:49:06', '2018-02-01 20:49:06'),
(500, 1, 'wcFo02JafGaHPsM64DKM6t3jA5wTrYjF', '2018-02-01 20:56:50', '2018-02-01 20:56:50'),
(502, 1, 'fGUtMqDBI2ZARFPFBhlaxnCkzrm7UodL', '2018-02-01 20:57:08', '2018-02-01 20:57:08'),
(504, 8, 'KfXSL3FN1hK8b6QT9LdmouyS37T0qqHB', '2018-02-01 20:57:36', '2018-02-01 20:57:36'),
(505, 1, '8Iv9LY8GOJZd1WTl1I5Wz01lx1KzdZWT', '2018-02-01 20:58:09', '2018-02-01 20:58:09'),
(507, 1, 'w9M0kSWQtdQD7zD6stbK63JUbTj1u058', '2018-02-01 20:58:17', '2018-02-01 20:58:17'),
(510, 8, 'NJ76oLl9RoWbXTJShfkd00cpuQZK5zr5', '2018-02-01 21:37:57', '2018-02-01 21:37:57'),
(511, 1, 'jgz8uBUFbY3MSxPOXp7bqA0knGoU5zi7', '2018-02-01 21:37:59', '2018-02-01 21:37:59'),
(514, 8, 'JsQzqbxIGhNuS6SeJ4y8eCnhSDJaeL3s', '2018-02-01 23:56:53', '2018-02-01 23:56:53'),
(515, 1, 'r3gBMpKSI53eQpXqydREPc6oSjC06OUB', '2018-02-01 23:56:56', '2018-02-01 23:56:56'),
(518, 1, 'QoyBvVRHUwmgnGPnOcyUXU4YqPRqMZVe', '2018-02-02 00:01:51', '2018-02-02 00:01:51'),
(521, 1, '0SWAzz5NkBMas3g7T6GC34L38vm83epY', '2018-02-02 00:19:04', '2018-02-02 00:19:04'),
(524, 1, 'MQuKcCFJhtuKynkQkFHxyZBLIy8Ivd3r', '2018-02-02 00:24:05', '2018-02-02 00:24:05'),
(526, 1, '3DniRRSZFO1aYX6cCNqgyiL0OJqpfEVf', '2018-02-02 01:06:18', '2018-02-02 01:06:18'),
(528, 1, 'OfRdoNYhFL3afKEYmg9oWZjtuhANsBfv', '2018-02-02 01:44:35', '2018-02-02 01:44:35'),
(529, 1, 'MlR5175cwkutGCxMpXuVrhgCzUgFIt9A', '2018-02-02 01:44:35', '2018-02-02 01:44:35'),
(530, 8, 'ipiaaYYS8qIo8iSdqnZ6VdkRKq1iyooC', '2018-02-02 09:02:53', '2018-02-02 09:02:53'),
(531, 1, 'wSD7DupM92LgniN8nQQvue0JvXYrEUwC', '2018-02-02 10:18:45', '2018-02-02 10:18:45'),
(532, 1, 'X2NpDhYEcKGWnyoBxRkMG0nasltzUZq4', '2018-02-02 10:18:45', '2018-02-02 10:18:45'),
(533, 1, 'HdLRvWB8aWY9gaFouz9JVIZii2eGcpPp', '2018-02-02 19:05:37', '2018-02-02 19:05:37'),
(535, 1, 'ot4ul9MDUpNjh3avRZwfDQhckk7zNpNC', '2018-02-02 19:07:26', '2018-02-02 19:07:26'),
(536, 1, 'QMzisn3xBXMMAegjFxwbyYlkU2opUFRz', '2018-02-02 19:07:26', '2018-02-02 19:07:26'),
(538, 8, 'ubMneyA1o1wIPK0UHx6I8WuhTRJlYHkP', '2018-02-02 21:16:54', '2018-02-02 21:16:54'),
(539, 8, 'qGTddyiGKSzM0wHVkenVijba0gtvLqOt', '2018-02-03 04:53:58', '2018-02-03 04:53:58'),
(541, 8, 'Nwn0yVO5SlhBd9eY4Z46SbZ1gEPi5IEr', '2018-02-03 09:41:10', '2018-02-03 09:41:10'),
(543, 8, '1aF9GIC1ZWN63Q3hyjgcI91MVJfM5syC', '2018-02-03 13:40:10', '2018-02-03 13:40:10'),
(544, 8, 'Ac5aAgvHGYcsowe9TvjwCmQ4Pp1qNc5P', '2018-02-03 22:01:23', '2018-02-03 22:01:23'),
(546, 1, '2DXLdK0k8pyyhkft4O1N31OHN3qVoZYv', '2018-02-04 06:13:43', '2018-02-04 06:13:43'),
(551, 1, '8Vt8s6xqOFyHpiqYk2QykhWXRenYyUJW', '2018-02-04 08:07:49', '2018-02-04 08:07:49'),
(557, 8, 'COuQ7uk7ZUXmIXoa9x5b5d0WhvRAniBn', '2018-02-04 12:33:20', '2018-02-04 12:33:20'),
(558, 8, 'qLTc2Kf6n28q8us3IMOWD4xzBoQMtVTk', '2018-02-04 18:52:19', '2018-02-04 18:52:19'),
(559, 1, 'OrzHOZ6ZZKJqxkZ0uuh7RKPL9XURJpXd', '2018-02-04 22:21:08', '2018-02-04 22:21:08'),
(561, 8, '1PJvdJesyc0mWbqOamG4hCblgkwH5qgI', '2018-02-04 22:47:36', '2018-02-04 22:47:36'),
(562, 8, 'tVXO1RdjrqL2sGvzHXidbAPJIamEnWxw', '2018-02-04 22:53:02', '2018-02-04 22:53:02'),
(563, 1, 'UdTjDEseGz6vBOmnq318N4Y4raiVQBrB', '2018-02-04 22:53:04', '2018-02-04 22:53:04'),
(565, 8, 'oT80knQNx6JAaH80HdUeHaCsf7HHsuwY', '2018-02-05 01:50:20', '2018-02-05 01:50:20'),
(566, 1, 'vaD9xZckMlXmH8R7l7TyJWgOZD5do7Uc', '2018-02-05 01:50:37', '2018-02-05 01:50:37'),
(568, 1, 'EOGfrIYfC9vcvYfvXURtTeVVrPmeOoXJ', '2018-02-05 01:52:32', '2018-02-05 01:52:32'),
(570, 8, 'peDpe1IKfhu56XA0DLJe8OSCk0zKJqvj', '2018-02-05 03:05:08', '2018-02-05 03:05:08'),
(571, 1, 'UINT91dzThurVugQu61SJytD5X3LmyZH', '2018-02-05 03:16:48', '2018-02-05 03:16:48'),
(572, 1, 'UM3IJ8WRYFkhphJOrwfErOH0523YDVuS', '2018-02-05 19:49:28', '2018-02-05 19:49:28'),
(574, 8, 'uaRVCHac02KAjEWxDiFmDPas2xYNUqAX', '2018-02-05 20:04:45', '2018-02-05 20:04:45'),
(579, 1, 'tnf6HppP4rV0x45qbHoz4BGfoD47gWbI', '2018-02-06 01:01:51', '2018-02-06 01:01:51'),
(580, 1, 'FZe4gTDXRLFyUZ3A17o0qnX95A1OSwer', '2018-02-06 01:01:51', '2018-02-06 01:01:51'),
(583, 8, 'tqm9bi8D3RLI8zOnKZsKAn7a7cJKmj3Y', '2018-02-06 03:00:07', '2018-02-06 03:00:07'),
(584, 1, '8IZWzK4wl0Xk01HPV8Vh1koOFhdBwZWF', '2018-02-06 19:27:14', '2018-02-06 19:27:14'),
(586, 1, '15ABJfq0cryamDZ5TV6HD9Mba3p0Uyff', '2018-02-06 20:03:27', '2018-02-06 20:03:27'),
(588, 1, '13y4QjFvSXPvYHHfN5YrsJA7kQYlqL9B', '2018-02-06 21:31:19', '2018-02-06 21:31:19'),
(589, 8, '6Lk66es0aaoHBjnWLOiXoEC09UixmRoL', '2018-02-06 22:14:33', '2018-02-06 22:14:33'),
(594, 1, 'LqfDWDEwEXDSaXGuQRMwWzjq77ji3Nly', '2018-02-07 19:10:05', '2018-02-07 19:10:05'),
(595, 1, 'mBU8rnnsiGvHbXSOV09fHj7sT1d1FloX', '2018-02-07 19:10:05', '2018-02-07 19:10:05'),
(603, 1, 'bTaiIxtbyDm1fGgESgMMIRMJB1ARzzfN', '2018-02-08 00:31:00', '2018-02-08 00:31:00'),
(605, 8, 'wxlw1jLv1NJPSyyCrjEihVsS8AkSeKdB', '2018-02-08 01:22:05', '2018-02-08 01:22:05'),
(607, 1, 'OVz8xnhOU8CPRYocJu7VZFnUKbs4F7pU', '2018-02-08 02:00:31', '2018-02-08 02:00:31'),
(608, 1, 'WvVjNtgeRP2EOW2R9aydHr7a0rqYQf8s', '2018-02-08 02:00:31', '2018-02-08 02:00:31'),
(609, 1, 'z3FGmuAL19mXNfrDX7HExsCkTbm8LYb7', '2018-02-20 18:38:21', '2018-02-20 18:38:21'),
(610, 1, '8iIAmLFC5uspsDTI1zQ9gSu25mvwHYXA', '2018-02-20 18:38:21', '2018-02-20 18:38:21'),
(611, 1, 'MFXMdjdHYLiWQo0o1aJfn28uaSrS1GDo', '2018-02-20 23:00:58', '2018-02-20 23:00:58'),
(612, 1, 'a1OKXCZYs0EMwGgaHaW2qJSZaGtsal13', '2018-02-20 23:00:58', '2018-02-20 23:00:58'),
(613, 1, 'q0j01G5VhXCVFUZ0IZ6VsCpEJfRHAWez', '2018-02-21 18:32:21', '2018-02-21 18:32:21'),
(614, 1, 'EY4TszKzR6ghCh9MaMwHAQfr8QepXbBa', '2018-02-21 18:32:21', '2018-02-21 18:32:21'),
(615, 1, '8ZTCNSIt1J9qlpQDK4PH1V0ctML0IMJr', '2018-02-22 00:51:27', '2018-02-22 00:51:27'),
(616, 1, 'nbTuhxZ0PxDipT1kSUpgDZUmFsUkwPsx', '2018-02-22 09:03:38', '2018-02-22 09:03:38'),
(618, 1, 'uKNI6Mvu1ExO7rK09MNvAovaWYHLhTs1', '2018-02-23 01:15:17', '2018-02-23 01:15:17'),
(619, 1, 'FspQxFJhmh85knlMInT4WZDQRixJz71d', '2018-02-23 18:38:12', '2018-02-23 18:38:12'),
(620, 1, 'tjOZJFQR1oDB5LaKTE8Ms8vxLUUKbbBF', '2018-02-23 18:38:12', '2018-02-23 18:38:12'),
(621, 1, 'K3NNN4k9OKUSnvmsj5kK14rq8l39pFmT', '2018-02-23 22:37:19', '2018-02-23 22:37:19'),
(622, 1, '5VdOj9t1SMTOOkxlX3SGJb8qVQ9WoHgM', '2018-02-23 22:37:19', '2018-02-23 22:37:19'),
(623, 1, 'Ul8BpMVjUeWF98UrKmTgSPUtkv9Xic9A', '2018-02-23 22:37:41', '2018-02-23 22:37:41'),
(624, 1, 'qKGsmyQqNwNTYgTG5O9sEJrmibWsYdVD', '2018-02-23 22:37:41', '2018-02-23 22:37:41'),
(625, 1, 'C7VKdFfGrpXWoomUQCmBXO02hcu8fGCO', '2018-02-23 22:39:35', '2018-02-23 22:39:35'),
(626, 1, '220mzZp1oL38PQ2d8VhliYoNo7UxHm67', '2018-02-23 22:39:35', '2018-02-23 22:39:35'),
(627, 1, 'al5sb4g355hIHLH0BIP0ejesi0XPo5Di', '2018-02-25 05:09:49', '2018-02-25 05:09:49'),
(628, 1, 'ZJXzKSM1VX1qqAWf6unOvBqLY9a6Hb6P', '2018-02-25 05:09:49', '2018-02-25 05:09:49'),
(629, 1, 'LhH0SVTSzMCqaqPf4QX0aotZP9v3taog', '2018-02-26 00:25:42', '2018-02-26 00:25:42'),
(630, 1, 'hjLZjKjEArW8ZQelh5p7QqG0vhApKwAo', '2018-02-26 00:25:42', '2018-02-26 00:25:42'),
(631, 1, 'jaftrpAl7wTji0W4Vyb16pkxzoapWsfy', '2018-02-26 01:00:44', '2018-02-26 01:00:44'),
(632, 1, '4XZRRoTxUao1PGjjCxGWXllfR5ruKWfi', '2018-02-26 01:00:44', '2018-02-26 01:00:44'),
(633, 1, 'z20ZCP6ZoaRUfjoiYXYl0VfUDtJpkV7I', '2018-02-26 18:21:19', '2018-02-26 18:21:19'),
(634, 1, 'fYkysaSFydtYce4V0Kqu66HMH98mhsZA', '2018-02-26 18:21:19', '2018-02-26 18:21:19'),
(635, 1, 'NVO6Qedfm9ioOmGBaG0UsueQmLLaMVAC', '2018-02-26 18:26:11', '2018-02-26 18:26:11'),
(636, 1, '3EHuVytNqQxcUc5Xuq08CC1n51YzNSiD', '2018-02-26 18:26:11', '2018-02-26 18:26:11'),
(637, 1, 'c4iIxDaA2K6OiJr0XAW6Tu47VBukfcQf', '2018-02-26 20:13:38', '2018-02-26 20:13:38'),
(638, 1, 'vqXjvCqJe3X1op4zgUqUCudbHjpy28gg', '2018-02-26 20:13:38', '2018-02-26 20:13:38'),
(639, 1, 'NpDrfo1E8XvDjE0mShe5FB97WcO94rn4', '2018-02-27 10:23:41', '2018-02-27 10:23:41'),
(640, 1, 'j587qEvVqx0IehstgvOJTJjUoA8k6N8X', '2018-02-27 10:23:41', '2018-02-27 10:23:41'),
(641, 1, 'PfZXqgOR1v7gA6WrxyxpyWzyrPlgvS0a', '2018-02-27 17:47:18', '2018-02-27 17:47:18'),
(642, 1, 'L5CmFhHsSk6eCz6Cozc8uR4Dpn7umBqd', '2018-02-27 17:47:18', '2018-02-27 17:47:18'),
(643, 1, 'KXjsLxOPGtNy5fY68ahfuMo4OPnNXitK', '2018-02-27 23:48:15', '2018-02-27 23:48:15'),
(644, 1, '7XxjQd4pk2DClfqq1IXry2iSKr6LmLAo', '2018-02-27 23:48:15', '2018-02-27 23:48:15'),
(645, 1, 'JHpWzQbEXMpcG0mQnTEDJw5rlUJITahI', '2018-02-28 01:50:26', '2018-02-28 01:50:26'),
(646, 1, 'HRAVYZBLZl4R5biLhwuavdWyVb43UOUj', '2018-02-28 01:50:26', '2018-02-28 01:50:26'),
(647, 1, 'uH3X4pzxKl9fV4wDwVJ1XZbpt3STpyRm', '2018-02-28 03:37:47', '2018-02-28 03:37:47'),
(648, 1, 'E13QWrFrZqr5PLSyEeYHgsAB25STeClg', '2018-02-28 03:37:47', '2018-02-28 03:37:47'),
(649, 1, 'dRkAQr52wD2puNKCRKvxA3IBwyv1C9NN', '2018-02-28 09:52:00', '2018-02-28 09:52:00'),
(650, 1, 'U4hRYTbezKc2z52vHILaLIlYizMtow8i', '2018-02-28 09:52:00', '2018-02-28 09:52:00'),
(651, 1, 'byhwFx5G9AOvJN6SyMRcv4lbyTeqtST2', '2018-02-28 19:44:49', '2018-02-28 19:44:49'),
(652, 1, '0THJSAseoUTuZ4cCGCbSOIHXTp1Q9YdI', '2018-02-28 19:44:49', '2018-02-28 19:44:49'),
(653, 1, 'GZIPErT4Bapcw5CNBQuRCr374lM8BSHm', '2018-02-28 22:07:57', '2018-02-28 22:07:57'),
(654, 1, 'CZhMa7iBCpFSEOxJpRSfLcl9qYbZ7WDN', '2018-02-28 22:07:57', '2018-02-28 22:07:57'),
(655, 1, 'srwsy5CAnIAzexTEEnYNnsBhZhfUBC6j', '2018-02-28 23:53:56', '2018-02-28 23:53:56'),
(657, 1, 'NrZQdcOBNuOR3iW97MgzDVVYdR4hWrts', '2018-02-28 23:54:01', '2018-02-28 23:54:01'),
(658, 1, 'Th102BYfA2BEu65BdXRqqucrfkKHIjTu', '2018-02-28 23:54:01', '2018-02-28 23:54:01'),
(659, 1, 'epmwUt2eEbBAlPUsRvLYye9UXrDbWRsY', '2018-03-01 20:36:24', '2018-03-01 20:36:24'),
(660, 1, 'IBPtMs86N9ZxYAokjAo5IZVsifLYULe0', '2018-03-01 20:36:24', '2018-03-01 20:36:24'),
(661, 1, 'ah6aFi5zxKdz1F8cxjJ1pZnBnHyNZKOc', '2018-03-01 21:05:27', '2018-03-01 21:05:27'),
(662, 1, '6XwoqEwOBL1VASKFFs38FyUX5qgQpyQD', '2018-03-01 21:05:27', '2018-03-01 21:05:27'),
(663, 1, 'fYpXZppwD1leYB1S9D3O2DKE0rZqMVil', '2018-03-02 03:27:22', '2018-03-02 03:27:22'),
(664, 1, 'C5bfu1teMTdMwuwKXc9DsSSr65V4prxu', '2018-03-02 03:27:22', '2018-03-02 03:27:22'),
(665, 1, '18FtXw4eCoEk9aYC4KKeSujj3Skeeg1j', '2018-03-02 07:41:14', '2018-03-02 07:41:14'),
(666, 1, 'gd6maf8zgzzu2O0mHXqHBn9IY1Ovvl0F', '2018-03-02 07:41:14', '2018-03-02 07:41:14'),
(667, 1, 'K3emBbgwwtLt5ojXcvk8Q0tP3VqLefsd', '2018-03-02 11:23:06', '2018-03-02 11:23:06'),
(668, 1, 'P6tdNZSePBmSorun8ODixsb0VDybzRdU', '2018-03-02 11:23:06', '2018-03-02 11:23:06'),
(669, 1, 'dsnZFyjdEunjpPlzdUWupZUThhoLRUhj', '2018-03-02 18:49:24', '2018-03-02 18:49:24'),
(670, 1, 'R1KiyE1oFR7SaY9COquFyViCysmD7GeT', '2018-03-02 18:49:24', '2018-03-02 18:49:24'),
(671, 1, 'iJo0kENKMWSbmbhpqurfsGt1fxhOq8rb', '2018-03-02 20:42:13', '2018-03-02 20:42:13'),
(672, 1, 'ciIiJWF6jOPdWQvcRU0AkOugGLYgOMvC', '2018-03-02 20:42:13', '2018-03-02 20:42:13'),
(673, 1, 'HLvUMZxuVNmkyFrisdoWuDDA801m5sm3', '2018-03-04 05:44:09', '2018-03-04 05:44:09'),
(674, 1, 'HeTLfvd9zkuaeXwksD615gyq72TLtHNs', '2018-03-04 05:44:09', '2018-03-04 05:44:09'),
(675, 1, 'sbC8E1Kk4ot47cgDWJbeSvkF9s0Qqp2g', '2018-03-05 00:00:13', '2018-03-05 00:00:13'),
(676, 1, 'i25E6x2AMWgQaPCYtX56nUNDScxRKV6t', '2018-03-05 00:00:13', '2018-03-05 00:00:13'),
(677, 1, 'xn87wi5uUQDn2uSTmRsJxs0CXzEjAVv4', '2018-03-07 02:54:18', '2018-03-07 02:54:18'),
(678, 1, 'KSUT34nlKI6L8PGyv0cTrbv4I3DYrEi7', '2018-03-07 02:54:18', '2018-03-07 02:54:18'),
(679, 1, 'B8XzrZooV8fU2utG3I3HVqIsJGb8BMsg', '2018-03-07 05:25:09', '2018-03-07 05:25:09'),
(680, 1, 'zWZ5YGezeMIbSJYc0UBVW3DQW6FpmFUV', '2018-03-07 05:25:09', '2018-03-07 05:25:09'),
(681, 1, 'xtqAAbkXcYwpA4BRcU6egvPXRW7NG0L1', '2018-03-07 10:46:09', '2018-03-07 10:46:09'),
(682, 1, 'TxbrsGteK8j72P79MFrD3Z44I4T192Hk', '2018-03-07 10:46:09', '2018-03-07 10:46:09'),
(683, 1, 'mRHjqjwRSX3p7AqLPzILk4zi31W8gI2O', '2018-03-07 13:38:35', '2018-03-07 13:38:35'),
(684, 1, 'xGBGJTbe1e0umQQZjLbpAxVZmKvLubGB', '2018-03-07 13:38:35', '2018-03-07 13:38:35'),
(685, 1, '0gO2pf6VOD5s8pbNYWTpN12mupJboZPU', '2018-03-07 13:56:58', '2018-03-07 13:56:58'),
(686, 1, 'l0V6YuGv4QSMkyFYh5u4smIxHp9bKMfD', '2018-03-07 13:56:58', '2018-03-07 13:56:58'),
(687, 1, 'DdH0YXntFHnDzdAcYtTHLXNOSrD9Nayi', '2018-03-08 00:35:08', '2018-03-08 00:35:08'),
(688, 1, 'WVP0SgXfTfRXMtDKn5yCzhniy6ITsYXn', '2018-03-08 00:35:08', '2018-03-08 00:35:08'),
(689, 1, 'dtPekV4MsbO8mfegEY5HQXncXvVAAicq', '2018-03-08 02:55:06', '2018-03-08 02:55:06'),
(690, 1, '44nWxEUwwTD8CGzOzjoutv1Yyt34Xi42', '2018-03-08 02:55:06', '2018-03-08 02:55:06'),
(691, 1, 'zW258naq0j0KTXkI9f9n0iJDB5UMviZa', '2018-03-09 01:31:57', '2018-03-09 01:31:57'),
(692, 1, 'c7937k8NYcXK3j1Hr96LJQhDxaK00XwP', '2018-03-09 01:31:57', '2018-03-09 01:31:57'),
(693, 1, '5R8A7OodILq54RYQ0TC5tKrhigfTfHFP', '2018-03-09 23:03:00', '2018-03-09 23:03:00'),
(695, 1, 'bLqkWAb61eAbB2GzWSzacoZKF7JVcqmx', '2018-03-10 00:21:45', '2018-03-10 00:21:45'),
(696, 1, 'CmDgjN9sv1zEHPMha1xbZqrNvxr1u6fU', '2018-03-10 00:21:45', '2018-03-10 00:21:45'),
(697, 1, '70LhgQmbM3ePDyhUk0m8clPUuOfeVlax', '2018-03-12 01:26:52', '2018-03-12 01:26:52'),
(698, 1, 'uXA1S7f3Fv218HhK0KYpx6ohND0LVaBG', '2018-03-12 01:26:52', '2018-03-12 01:26:52'),
(699, 1, 'Z5UGllqTBbuZdy2FGBpB7AxVlnPycCxk', '2018-03-12 04:25:56', '2018-03-12 04:25:56'),
(700, 1, 'uLr0gFAcWegAkejxnIg572CNftPlQEfj', '2018-03-12 04:25:56', '2018-03-12 04:25:56'),
(701, 1, 'o6eHDvnHWdn1MqyMLZeQ0s4qSbyH5YCh', '2018-03-12 05:14:27', '2018-03-12 05:14:27'),
(702, 1, 'iwckNXMkOnCVQdj1PNngM1edLxTuMKNK', '2018-03-12 05:14:27', '2018-03-12 05:14:27'),
(703, 1, 'z3CFbndaFo63KgiQjPuV6jwh6OMMmUNr', '2018-03-12 18:56:01', '2018-03-12 18:56:01'),
(704, 1, 'yp1HVdtxNYSITndkMjIMOcj61cIWS3uK', '2018-03-12 18:56:01', '2018-03-12 18:56:01'),
(705, 1, '0o5TH3GwFbGw4I0IUH6zxj05N5YFezWb', '2018-03-12 19:37:48', '2018-03-12 19:37:48'),
(706, 1, 'NhrIwDeXhvPxfvcTYHwSdKe0Nmc2Orv2', '2018-03-12 19:37:48', '2018-03-12 19:37:48'),
(707, 1, 'vUwqO2s9eU92ka8XBcjzgOyrntdNvecG', '2018-03-12 19:50:39', '2018-03-12 19:50:39'),
(708, 1, 'S626mJT9dxa71O7kPIzcyY6MEk1P4K2O', '2018-03-12 19:50:39', '2018-03-12 19:50:39'),
(709, 1, 'mcQtwdrvHWpOxVzTrPExUs9cUBDh4etX', '2018-03-12 20:48:08', '2018-03-12 20:48:08'),
(710, 1, '4jJWxP2m43APqDQAvJGELgjb3tihWGVj', '2018-03-12 20:48:08', '2018-03-12 20:48:08'),
(711, 1, 'IKNd6lpDgpH58dzdf48yUPjT7NNNFuDn', '2018-03-12 20:49:36', '2018-03-12 20:49:36'),
(712, 1, 'VRMuqJzbghv7aLQLD2Ynx6oPimNZ9sdk', '2018-03-12 20:49:36', '2018-03-12 20:49:36'),
(713, 1, 'OCKS44CPwpsLS0qNsJeaHp3uxztND167', '2018-03-12 21:34:29', '2018-03-12 21:34:29'),
(714, 1, '9LNeEsiwSNIRsxAAZGkXrG21eywNwBcE', '2018-03-12 21:34:29', '2018-03-12 21:34:29'),
(715, 1, 'paKxxM0eS68pn4rVkrUi18tfut58edsf', '2018-03-12 22:14:56', '2018-03-12 22:14:56'),
(716, 1, 'SF352JEZsAstv41mIlJlzpfAibtVd4tf', '2018-03-12 22:14:56', '2018-03-12 22:14:56'),
(717, 1, '4JdD49wrb0V4sHtNxEAK0gfAI8iiUDNV', '2018-03-13 00:46:58', '2018-03-13 00:46:58'),
(718, 1, '7fkvj5IctcBAjpLNB7oW5rQLXd0uac3t', '2018-03-13 00:46:58', '2018-03-13 00:46:58'),
(719, 1, 'XP510DrDG5PD6bREHiswReySnl4djsIN', '2018-03-13 01:14:42', '2018-03-13 01:14:42'),
(720, 1, 'PjGZkgvejGQMipZZ1BI0Udfqe0akmhQi', '2018-03-13 01:14:42', '2018-03-13 01:14:42'),
(721, 1, 'WhjyxT93LFWPKOG8x4bSwnrwleuIRHNk', '2018-03-13 04:06:37', '2018-03-13 04:06:37'),
(722, 1, 'AUeHtgYnHpX9VPVAQIc61g8c4OCPf65g', '2018-03-13 04:06:37', '2018-03-13 04:06:37'),
(723, 1, '4AIThW03xeUzORzL1RagV6I1OIQIri29', '2018-03-13 18:39:53', '2018-03-13 18:39:53'),
(724, 1, 'VfXIErsQMYW6hD2dQd3jkv7GJauG7OqQ', '2018-03-13 18:39:53', '2018-03-13 18:39:53'),
(725, 12, 'rBFCZxXwvmbkGO8jinaJglOpkT4wTNIg', '2018-03-13 18:44:05', '2018-03-13 18:44:05'),
(726, 12, 'pwnEsMxBLTWNOx7rPvJLHcac1SETvd4h', '2018-03-13 18:44:05', '2018-03-13 18:44:05'),
(727, 1, 'GDSnYc9pMm7sukbMmrXDAY2XH0l6gBGf', '2018-03-13 18:44:35', '2018-03-13 18:44:35'),
(728, 1, 'gnbnHXOAFuAZaIWJoKu8J8In6MoaiFfx', '2018-03-13 18:44:35', '2018-03-13 18:44:35'),
(729, 12, 'p7AQU0WYA5d5BP9GeBbxfGLqXgHg1VwU', '2018-03-13 18:44:58', '2018-03-13 18:44:58'),
(730, 12, 'Qws70qug0cXVd2BPBH6PYBxavmW5X382', '2018-03-13 18:44:58', '2018-03-13 18:44:58'),
(731, 1, 'LffILsb9qh7cY16GlPOxouaFevpzbm8G', '2018-03-13 19:07:03', '2018-03-13 19:07:03'),
(732, 1, 'rmOc6IM1qu4Fas56uNFunZBGKmtY73KU', '2018-03-13 19:07:04', '2018-03-13 19:07:04'),
(733, 1, 'OAernJS8fBlY8gIqiHqF1M3ya3wipNQx', '2018-03-13 19:07:12', '2018-03-13 19:07:12'),
(734, 1, 'BaZkrjj1WxCbzDoQuLiSugEZuCTklT7w', '2018-03-13 19:07:12', '2018-03-13 19:07:12'),
(735, 1, 'DNR0vm0lGETTtM8mKVnv40s2kvgXri3K', '2018-03-13 19:44:31', '2018-03-13 19:44:31'),
(736, 1, 'zgueCViTDBhjrWZRbAokY51R9Vw5CFRW', '2018-03-13 19:44:31', '2018-03-13 19:44:31'),
(737, 14, 'K6tw6t7Evn9GcXybQeDw6A3PswlvHr2r', '2018-03-13 19:46:20', '2018-03-13 19:46:20'),
(738, 14, 'sj8dKug5hlUjX1e5Wv8tOxyDycNNttzE', '2018-03-13 19:46:20', '2018-03-13 19:46:20'),
(739, 14, 'LcH5SlmiKC5pVEK1f3deU52nD0nhsbKc', '2018-03-13 19:48:14', '2018-03-13 19:48:14'),
(740, 14, 'bfAXcJBUpQPHK4WMqkg5WRzRgcyFDH6A', '2018-03-13 19:48:14', '2018-03-13 19:48:14'),
(741, 1, 'cNgo5DY7yg6fvZWfUiUR9Qdn0AJLcgon', '2018-03-13 19:48:46', '2018-03-13 19:48:46'),
(743, 15, 'kc4mJCfW8b1VgNukNXC3jMxSTjWiWeW3', '2018-03-13 19:51:13', '2018-03-13 19:51:13'),
(744, 15, 'liAHdi51M6DDNTpLF77kYkkGlw1jQAvO', '2018-03-13 19:51:13', '2018-03-13 19:51:13'),
(745, 14, '6LXqipS7esU82Dqek9w3sLj2j9uyeTss', '2018-03-13 19:52:48', '2018-03-13 19:52:48'),
(746, 14, 'rz95L28UCDVZSoxFZ5UmQ5Kzu0SRbrd4', '2018-03-13 19:52:48', '2018-03-13 19:52:48'),
(747, 14, 'fqMCgW9PbUfqEwMHXSi2iMNWSEqe5hDq', '2018-03-13 19:53:39', '2018-03-13 19:53:39'),
(749, 1, 'g653FIPyACmVjJ0n6ApAP0BCLZob6hli', '2018-03-13 19:57:02', '2018-03-13 19:57:02'),
(750, 1, '0gE3V33LpGkYUhKRsewm2Spe5fjJJzbq', '2018-03-13 19:57:02', '2018-03-13 19:57:02'),
(751, 14, 'sIL8bqixgLkVrSJoNHCrAmzuttCT1zfg', '2018-03-13 20:44:48', '2018-03-13 20:44:48'),
(752, 14, 'GBoIaul3HYHxi8dTA0j8Ggy0qKQylkIm', '2018-03-13 20:44:48', '2018-03-13 20:44:48'),
(753, 1, '0wF9kIYt2oObmX8tyPOackmkAoQfPXTL', '2018-03-13 20:49:04', '2018-03-13 20:49:04'),
(754, 1, '3O6zhLbgC05RgNMqp9qxG4fpIepK4Ij3', '2018-03-13 20:49:04', '2018-03-13 20:49:04'),
(755, 1, 'ZVh9hRNiVl3XiQR9xtoRdVnkLHbyl13n', '2018-03-13 21:36:05', '2018-03-13 21:36:05'),
(756, 1, 'PyGPsqXGrWJGhyU5S6oSI7wNvrcwv2CL', '2018-03-13 21:36:05', '2018-03-13 21:36:05'),
(757, 15, 'mdI2P0htiB1XTNy0jEXJ1BqMBqfBQyPJ', '2018-03-13 21:42:34', '2018-03-13 21:42:34'),
(759, 1, 'X91z4SAAJPqnPhQQWJucuktFl1d01rLq', '2018-03-13 21:43:06', '2018-03-13 21:43:06'),
(760, 1, 'zV1rYcBgsjx148qNaAEcBIX3kdvudS2A', '2018-03-13 21:43:06', '2018-03-13 21:43:06'),
(761, 1, 'nGjHiMvoCrcMWshE87TcyTISYiA7BpK8', '2018-03-15 00:56:28', '2018-03-15 00:56:28'),
(762, 1, '5WmAG8o7ME5dJorZvxAyaigcIZUZ4UYF', '2018-03-15 00:56:28', '2018-03-15 00:56:28'),
(763, 1, 'rZ0Vp4PWAauBqhb4C0S7vCfpMRsSvl6c', '2018-03-18 18:54:01', '2018-03-18 18:54:01'),
(764, 1, '1w3KzwIgJE8OLlx3xanGKsJxjdcmyXbM', '2018-03-18 18:54:01', '2018-03-18 18:54:01'),
(765, 1, 'VhVlDqMJubCHEPePi1n772dekLVbRn15', '2018-03-18 20:21:11', '2018-03-18 20:21:11'),
(766, 1, 'wxCSpkojictK2Hvbh5Y5KQkXDim7FpV6', '2018-03-18 20:21:11', '2018-03-18 20:21:11'),
(767, 1, 'dSzmO4oZqiaL4Etg7Ok1T2rXnKw2rg8A', '2018-03-18 20:39:50', '2018-03-18 20:39:50'),
(768, 1, 'bl0yxr9SZz4jOhL1e3h0mmf4Wx5YhSJW', '2018-03-18 20:39:50', '2018-03-18 20:39:50'),
(769, 16, '01f8wN2ZmkVKMBgP5BoRG2MV5x1CmW3K', '2018-03-19 00:20:56', '2018-03-19 00:20:56'),
(770, 16, 'aM9920ka8ubXxTqvTm4uNxiXhPrzWRWx', '2018-03-19 00:20:56', '2018-03-19 00:20:56'),
(771, 1, 'A8Up6kY4pvbozwSKehn1ddzOHefoIlrj', '2018-03-19 01:12:38', '2018-03-19 01:12:38'),
(772, 1, '361U4P9qpDzYle3zIniqiAtukIbuvSqx', '2018-03-19 01:12:38', '2018-03-19 01:12:38'),
(773, 1, 'zAXxpnoUcF08gAU4UeYLBgef9uYZptk2', '2018-03-19 01:28:39', '2018-03-19 01:28:39'),
(774, 1, 'pSnAoCsRyprvfzfmiLYY7XkNEJXvjVnM', '2018-03-19 01:28:39', '2018-03-19 01:28:39'),
(775, 16, 'MxVtDzSwdxDkDKfnPTqYCskdw7OUsblY', '2018-03-19 03:12:44', '2018-03-19 03:12:44'),
(776, 16, 'A6xfoHOxAbLOdcJr9Wn08Oq02cgZX2s6', '2018-03-19 03:12:44', '2018-03-19 03:12:44'),
(777, 16, 'qYLeHVz7RWmKpUM22gNuwp3wz1VwtiAS', '2018-03-19 03:12:45', '2018-03-19 03:12:45'),
(778, 16, 'lvnrZgBTdg6Zo3vpXxZF9GwriZ8L3NYa', '2018-03-19 03:12:45', '2018-03-19 03:12:45'),
(779, 1, 'GG35Q0kQ2Fe9i3sbofYDGteABiXLrX0c', '2018-03-19 03:28:32', '2018-03-19 03:28:32'),
(780, 1, 'gHRCovhTkV3b4MzL44DRQIowg58HnLld', '2018-03-19 03:28:32', '2018-03-19 03:28:32'),
(781, 1, 'zrQ1axb0kh2ghSUFpWWEswy5OU4s6G6R', '2018-03-19 03:34:32', '2018-03-19 03:34:32'),
(782, 1, 'AwkpqiKxm8X2wFxmt8xJuEzPycFiVYgm', '2018-03-19 03:34:32', '2018-03-19 03:34:32'),
(783, 16, 'noUhRYeuNtuRE76tcTk4TvWbLV5PVeue', '2018-03-19 03:53:17', '2018-03-19 03:53:17'),
(784, 1, 'ETIUZmJz0Oi7dau7HuudmvyHXPg3wXJ6', '2018-03-19 03:59:05', '2018-03-19 03:59:05'),
(785, 1, 'bSmht48OLuiB46dT6u0o4r4QYnc0lOG3', '2018-03-19 04:07:29', '2018-03-19 04:07:29'),
(786, 1, '8b3uuZqjagUdmxSe0hmdA2mrZ1Qbahcb', '2018-03-19 04:31:08', '2018-03-19 04:31:08'),
(787, 1, 'c11pXNbXi4ze83socfogJUwKzUkBnPVT', '2018-03-19 06:39:09', '2018-03-19 06:39:09'),
(788, 1, 'lMTysJKQXfO7IaEVC5h6J35WcVI4vguR', '2018-03-19 18:55:52', '2018-03-19 18:55:52'),
(789, 1, 'rrSlqgueLGrCcZmXTiC9Cw7jLHOLjWgI', '2018-03-19 20:21:22', '2018-03-19 20:21:22'),
(790, 1, '5fFvQihHLCJR9s1Clg2shCDQA2LdxbaO', '2018-03-19 21:18:56', '2018-03-19 21:18:56'),
(791, 1, 'rgIQTAh1y9Apxn1XeE74h4BXrTSJELka', '2018-03-19 21:43:10', '2018-03-19 21:43:10'),
(792, 1, 'mazlYOdL090B7OkcvPKOc5JDjPZTC3vu', '2018-03-19 22:09:02', '2018-03-19 22:09:02'),
(793, 1, 'nItdoT4bghRRTFkt6ekP6ELt6Q7iL4oj', '2018-03-20 02:19:26', '2018-03-20 02:19:26'),
(794, 1, 'WmA7cIHiFKHVF3HXbYfT6gf7Y58YCZ4w', '2018-03-20 03:46:05', '2018-03-20 03:46:05'),
(795, 1, 'h9IdtJUOoNRL0I97ZXfCKb5aF5rE5Wym', '2018-03-20 08:58:06', '2018-03-20 08:58:06'),
(796, 1, 'G9V6NahLvTy6LUaaDh62bSZT95kdMnaw', '2018-03-20 12:21:29', '2018-03-20 12:21:29'),
(797, 1, 'RMezE5QaASJR8afKG7cO9IyW5jO0tISz', '2018-03-20 13:30:50', '2018-03-20 13:30:50'),
(798, 1, 'XaR7hRK1EwC2Kf7nUFVhOuZy2zUf8ucg', '2018-03-20 18:52:28', '2018-03-20 18:52:28'),
(799, 1, 'Snqh8ivQX4bnFMuMl1yJhz0EA8MzA84V', '2018-03-20 20:02:13', '2018-03-20 20:02:13'),
(800, 1, '7L73nlW04VxorSHPgD2BSZ0gWoIIukji', '2018-03-20 20:13:23', '2018-03-20 20:13:23'),
(801, 1, 'PyXsZmiEkNsZ3AtBPZQYSkRSN9rqsdg7', '2018-03-20 20:34:59', '2018-03-20 20:34:59'),
(802, 1, 'lSmOXzPQu7B3Gsxz8Q6B0PU4nWZ10ety', '2018-03-20 20:35:46', '2018-03-20 20:35:46'),
(803, 1, 'fynhnpWCeQATdD2Qmf8RCyXH02QjCj7P', '2018-03-20 20:50:25', '2018-03-20 20:50:25'),
(804, 1, 'yCW4U2bHSfGFiDIl7z0HXoh1UFPUIeqE', '2018-03-20 20:55:43', '2018-03-20 20:55:43'),
(805, 1, 'JkF4p8tYUP4oN5der79jIWWgFefqU0fI', '2018-03-20 21:09:48', '2018-03-20 21:09:48'),
(806, 1, 'TpAbAiDvu5vRRA3RcuJcRUxArJ7yqdSe', '2018-03-20 21:35:40', '2018-03-20 21:35:40'),
(807, 1, 'Bm3L0cx6AgmmfwosMXedJSYkCrN6Hi5L', '2018-03-21 04:40:14', '2018-03-21 04:40:14'),
(808, 1, 'aMP5vFkW9K3Ohk6BkFn6EJHhqkGuIkvP', '2018-03-21 22:55:29', '2018-03-21 22:55:29'),
(809, 1, 'IsseRvXc2Yw1jjvzp7mxYIanXPO5rjEZ', '2018-03-21 22:59:19', '2018-03-21 22:59:19'),
(810, 1, 'QWM4SgxxWtrZBvoTJYLTjgkRTUCXRvVl', '2018-03-22 00:20:21', '2018-03-22 00:20:21'),
(811, 1, 'ucC1zcIYRHxEZ6jFZMn1piUNdCBndVrB', '2018-03-22 07:50:08', '2018-03-22 07:50:08'),
(812, 1, 'hBuAPCwJsXpImVFDczr07NUKD4maczgv', '2018-03-25 21:13:02', '2018-03-25 21:13:02'),
(813, 1, '7f44jonBZCaWhRG3fq6LnySxvpIWT3lF', '2018-03-26 00:37:16', '2018-03-26 00:37:16'),
(814, 1, 'qm8QmnMftSO514JILYJdyqN03zwbx0k0', '2018-04-01 04:26:22', '2018-04-01 04:26:22'),
(815, 1, 'bLlucGjpa3UsDiiiwsgPR5ZYAoCW9ebb', '2018-04-04 18:37:14', '2018-04-04 18:37:14'),
(816, 1, 'Y6BVCNbxaF4MkOH8dOcmi2MSDUFPrODD', '2018-04-04 19:37:13', '2018-04-04 19:37:13'),
(819, 1, 'TN1wBeNuriL6bumrWygN8DOBa71SHRUg', '2018-04-05 03:17:58', '2018-04-05 03:17:58'),
(820, 1, 's1YFj8ZTbvdQRZs31AkbCNJ4SEX2WYb2', '2018-04-05 03:20:18', '2018-04-05 03:20:18'),
(821, 1, 'wWAsZqTuPkvRoNFQHQsBWD7vJrYJqL4l', '2018-04-05 03:54:53', '2018-04-05 03:54:53'),
(825, 1, 'NbqlsAQtBPvLd2EDxjE9tIBg6xSSsmpn', '2018-04-06 01:57:17', '2018-04-06 01:57:17'),
(826, 1, '7HNy0YMwdmhHIB7uofk6zIHPwdMNGnar', '2018-04-06 01:57:54', '2018-04-06 01:57:54'),
(827, 1, 'bf9jnJS2pQMKM86UldxloNU3CB3COwsv', '2018-04-06 02:01:01', '2018-04-06 02:01:01'),
(829, 2, 'GvzS8H7LxbyWyGiGwHV71wfi4hdjTeDi', '2018-04-06 02:02:18', '2018-04-06 02:02:18'),
(841, 2, 'wqakmaoVqww0oPsF0sLXAi6BfG9ET5Jd', '2018-04-06 02:22:27', '2018-04-06 02:22:27'),
(855, 1, 'zoKeUEBp9jDKKJKXFb2r7OQKW2bjOvWg', '2018-04-06 09:46:35', '2018-04-06 09:46:35'),
(860, 8, 'F1fXvwjPSlAI1FHRw99HQKQalfINFUPP', '2018-04-06 18:35:31', '2018-04-06 18:35:31'),
(862, 8, 'R1xrrHZPHCnOCGsQY8dfVi3UlzT46WLh', '2018-04-06 18:36:19', '2018-04-06 18:36:19'),
(863, 8, '8HAOOOJX5MuKMN621DhiHIsQuP4mQpTG', '2018-04-06 18:37:33', '2018-04-06 18:37:33'),
(866, 8, 'MrjOChh3DdZkt3kBPoSX2yaz0LgitgAc', '2018-04-06 18:38:01', '2018-04-06 18:38:01'),
(867, 8, 'H6cu1ULUAkNf4lODjyoByvQgnfPgXoCu', '2018-04-06 18:38:09', '2018-04-06 18:38:09'),
(868, 2, 'DHh9xr5QmZoixaGw5v9Bo7G6R1u76gPo', '2018-04-06 18:38:36', '2018-04-06 18:38:36'),
(869, 2, 'x6Q4g6wIsraJ0QU2kn0uNE3WWHzKBZRg', '2018-04-06 18:38:36', '2018-04-06 18:38:36'),
(870, 8, 'jTrUdqDhsmYs0qQB8eKsfT9uqs6D34OS', '2018-04-06 18:40:06', '2018-04-06 18:40:06'),
(876, 8, 'JxGmD3An5cMdACkSBUxZi4pNDgeh0Q1K', '2018-04-06 18:55:20', '2018-04-06 18:55:20'),
(879, 8, 'DmKh00Au3iTo5G5M3QqAyc1USO4SQDLz', '2018-04-06 18:56:12', '2018-04-06 18:56:12');
INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(881, 8, 'iiKmCGjK2jP7Jaf4Ft7bHhRsPAU2uJWJ', '2018-04-06 18:56:41', '2018-04-06 18:56:41'),
(883, 8, 'uHON2x6netVfYI4CzwrSLNSef5zYI0Hi', '2018-04-06 18:57:10', '2018-04-06 18:57:10'),
(884, 8, 'OqTG4VTGCfFV3IqMvV04cWzu69csWzed', '2018-04-06 18:57:26', '2018-04-06 18:57:26'),
(887, 2, 'S6GtKV2YA6hn6mYwSTs9aKCz7y5JTwZW', '2018-04-06 21:09:46', '2018-04-06 21:09:46'),
(888, 2, '7rh4Flpl3HRyygpV07036TRYqu8uv32K', '2018-04-06 21:09:56', '2018-04-06 21:09:56'),
(889, 2, 'TjC77yHqHF6YN7qsO0D27lP9d4tPOx3g', '2018-04-06 21:10:04', '2018-04-06 21:10:04'),
(892, 2, 'dUeuuCBNTEhtTzI9UVTILClIDDtNcDpg', '2018-04-06 21:12:21', '2018-04-06 21:12:21'),
(893, 1, 'Esf7XLuqt2YO4eqdGeyZ3CaA9hlwdAcl', '2018-04-08 03:04:14', '2018-04-08 03:04:14'),
(894, 1, '7UGar6PwjqQlhE4MSTKjRDmxocZRsuxt', '2018-04-08 07:34:22', '2018-04-08 07:34:22'),
(897, 1, 'a7JwQZj0KtZAXubU8cxsGWZTpQw10g2V', '2018-04-11 01:20:26', '2018-04-11 01:20:26'),
(898, 1, 'RfnG3cRPPbXk0dXUCMrKaDFbYnirT0Cf', '2018-04-11 18:22:59', '2018-04-11 18:22:59'),
(899, 1, 'taTvPyF5em3qhy6oCsFkwt0aoZxVuO1m', '2018-04-12 21:22:03', '2018-04-12 21:22:03'),
(900, 1, 'Yk994bGpE8xlNvz6Jp8e7nAFZxUmMc8j', '2018-04-13 19:25:58', '2018-04-13 19:25:58'),
(901, 1, '0OW0aqPy1e3aR6cP2OqL4t2mB3dHcvZF', '2018-04-14 04:39:14', '2018-04-14 04:39:14'),
(902, 1, 'TIZEZMRt2FGXdSk5IetUthflbPcwXJhs', '2018-04-15 01:26:20', '2018-04-15 01:26:20'),
(911, 1, 'MdRRcmW5txh7JiZtHufXNMOA9GFnz9gL', '2018-04-15 08:41:37', '2018-04-15 08:41:37'),
(912, 1, 'h7f1gTwxVFZJ650vk5K048M7Nj59YIcu', '2018-04-15 18:19:53', '2018-04-15 18:19:53'),
(913, 1, 'xgOpeQ0CDrDX1iDozVC9h2nUnuehvJiX', '2018-04-25 00:38:22', '2018-04-25 00:38:22'),
(914, 1, 'YjfpXve6BQAttIetGDdtevr2mo6DIZ2E', '2018-04-27 01:12:48', '2018-04-27 01:12:48'),
(915, 1, '4TLnawuya6QRhCY3HokCxBcrzjfIoeRi', '2018-04-27 11:06:22', '2018-04-27 11:06:22'),
(916, 1, '22b0c7i6pHKNdoXzjiUEpaWZ5n0pnKAm', '2018-04-28 05:03:59', '2018-04-28 05:03:59'),
(917, 1, 'hNveOKwlG26mRC96nJWef33RCBbJYJCM', '2018-05-01 20:08:54', '2018-05-01 20:08:54'),
(918, 1, 't5hI25ie1DN3XGbheHENWmEaYrTbIEQ2', '2018-05-02 00:38:25', '2018-05-02 00:38:25'),
(919, 1, 'Wp3vg04IN6nrn9MjeS3VBKJMVGVnLC7P', '2018-05-02 01:58:22', '2018-05-02 01:58:22'),
(920, 1, 'oos88XkBvCtIDXRSU7aJSMnfwkoiN9R8', '2018-05-12 11:10:53', '2018-05-12 11:10:53'),
(921, 1, 'lhLHogRflDrNgJaAoClBxuWt0ruXdBxJ', '2018-05-13 10:11:53', '2018-05-13 10:11:53'),
(922, 1, 'MIjHWEVUlm8sFUBBOjiRcJgZb6rdT6cp', '2018-05-13 10:45:59', '2018-05-13 10:45:59'),
(923, 1, 'zcR4eALeQdpjItoGAagl7WNwwmm5CevA', '2018-05-13 17:59:48', '2018-05-13 17:59:48'),
(924, 1, 'Loxc9X07m6p81ReHISX4FreGlbfFNzYD', '2018-05-13 20:44:18', '2018-05-13 20:44:18'),
(925, 1, 'X6zJndPulWASNEXQAGCYEJaLV27E67xu', '2018-05-13 22:20:45', '2018-05-13 22:20:45'),
(926, 1, 'xcGMWnh45EkXJMMFugjX2dmAmXGjXBbZ', '2018-05-14 09:28:54', '2018-05-14 09:28:54'),
(927, 1, 'rhEKSKBMlWFkwNDqMpU2j8U6ZL5U4iwM', '2018-05-14 18:28:04', '2018-05-14 18:28:04'),
(928, 1, '66wXiDSKAUOfobqgMkCgpql4SbaeP9RS', '2018-05-14 20:59:27', '2018-05-14 20:59:27'),
(929, 1, 'Cp9noRWMvH2pF6bYuE92WuQXcVq5zhLQ', '2018-05-15 00:58:32', '2018-05-15 00:58:32'),
(930, 1, 'R7LOqXLInpaib4AAC0ysl9Miqde3aTxL', '2018-05-15 18:35:31', '2018-05-15 18:35:31'),
(931, 1, 'bnaWzRMbj7QBdF7IgjHogJ8S6WKCq5wv', '2018-05-15 19:47:12', '2018-05-15 19:47:12'),
(932, 1, 'CehrDeRYEYLHvteI8nwBBUMkhaHF2gQR', '2018-05-15 20:42:23', '2018-05-15 20:42:23'),
(933, 1, 'Nyg8m7czjme6IVQupLs4RM44Yeko1KDi', '2018-05-16 03:19:37', '2018-05-16 03:19:37'),
(934, 1, 'FQ4ai8KRiXUzsTkWM8We7YH6PtoKIS5s', '2018-05-16 10:11:21', '2018-05-16 10:11:21'),
(935, 1, '6EPkMACQuWveGaHzxdrBSDYyxf7YfxZv', '2018-05-16 18:33:19', '2018-05-16 18:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `post_param`
--

DROP TABLE IF EXISTS `post_param`;
CREATE TABLE `post_param` (
  `id` bigint(20) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `param_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_param`
--

INSERT INTO `post_param` (`id`, `post_id`, `param_id`, `created_at`, `updated_at`) VALUES
(22, 9, 10, '2018-02-27 05:02:45', '2018-02-27 05:02:45'),
(23, 9, 54, '2018-02-27 05:02:45', '2018-02-27 05:02:45'),
(24, 10, 10, '2018-02-27 05:03:46', '2018-02-27 05:03:46'),
(25, 10, 54, '2018-02-27 05:03:46', '2018-02-27 05:03:46'),
(26, 11, 10, '2018-02-27 17:49:34', '2018-02-27 17:49:34'),
(27, 11, 53, '2018-02-27 17:49:34', '2018-02-27 17:49:34'),
(30, 12, 10, '2018-02-27 17:52:23', '2018-02-27 17:52:23'),
(31, 12, 54, '2018-02-27 17:52:23', '2018-02-27 17:52:23'),
(32, 13, 10, '2018-02-27 17:56:08', '2018-02-27 17:56:08'),
(33, 13, 53, '2018-02-27 17:56:08', '2018-02-27 17:56:08'),
(34, 14, 10, '2018-02-27 17:57:52', '2018-02-27 17:57:52'),
(35, 14, 54, '2018-02-27 17:57:52', '2018-02-27 17:57:52'),
(36, 15, 10, '2018-02-27 18:06:27', '2018-02-27 18:06:27'),
(37, 15, 53, '2018-02-27 18:06:27', '2018-02-27 18:06:27'),
(38, 16, 10, '2018-02-27 18:08:03', '2018-02-27 18:08:03'),
(39, 16, 53, '2018-02-27 18:08:03', '2018-02-27 18:08:03'),
(76, 35, 12, '2018-02-28 03:40:45', '2018-02-28 03:40:45'),
(77, 35, 54, '2018-02-28 03:40:45', '2018-02-28 03:40:45'),
(78, 36, 12, '2018-02-28 03:44:03', '2018-02-28 03:44:03'),
(79, 36, 53, '2018-02-28 03:44:03', '2018-02-28 03:44:03'),
(80, 37, 53, '2018-02-28 03:45:18', '2018-02-28 03:45:18'),
(81, 38, 12, '2018-02-28 03:47:44', '2018-02-28 03:47:44'),
(82, 38, 53, '2018-02-28 03:47:44', '2018-02-28 03:47:44'),
(83, 39, 12, '2018-02-28 03:50:58', '2018-02-28 03:50:58'),
(84, 39, 53, '2018-02-28 03:50:58', '2018-02-28 03:50:58'),
(85, 40, 12, '2018-02-28 03:52:21', '2018-02-28 03:52:21'),
(86, 40, 53, '2018-02-28 03:52:21', '2018-02-28 03:52:21'),
(87, 41, 10, '2018-02-28 04:30:37', '2018-02-28 04:30:37'),
(88, 41, 53, '2018-02-28 04:30:37', '2018-02-28 04:30:37'),
(89, 42, 10, '2018-02-28 04:32:19', '2018-02-28 04:32:19'),
(90, 42, 53, '2018-02-28 04:32:19', '2018-02-28 04:32:19'),
(91, 43, 10, '2018-02-28 04:36:15', '2018-02-28 04:36:15'),
(92, 43, 53, '2018-02-28 04:36:15', '2018-02-28 04:36:15'),
(93, 44, 10, '2018-02-28 04:37:28', '2018-02-28 04:37:28'),
(94, 44, 53, '2018-02-28 04:37:28', '2018-02-28 04:37:28'),
(95, 45, 10, '2018-02-28 04:42:31', '2018-02-28 04:42:31'),
(96, 45, 53, '2018-02-28 04:42:31', '2018-02-28 04:42:31'),
(102, 46, 10, '2018-02-28 04:45:43', '2018-02-28 04:45:43'),
(103, 46, 53, '2018-02-28 04:45:43', '2018-02-28 04:45:43'),
(166, 1, 10, '2018-03-03 03:46:00', '2018-03-03 03:46:00'),
(167, 1, 23, '2018-03-03 03:46:00', '2018-03-03 03:46:00'),
(168, 1, 53, '2018-03-03 03:46:00', '2018-03-03 03:46:00'),
(169, 1, 62, '2018-03-03 03:46:00', '2018-03-03 03:46:00'),
(170, 1, 68, '2018-03-03 03:46:00', '2018-03-03 03:46:00'),
(171, 2, 10, '2018-03-03 03:46:22', '2018-03-03 03:46:22'),
(172, 2, 23, '2018-03-03 03:46:22', '2018-03-03 03:46:22'),
(173, 2, 53, '2018-03-03 03:46:22', '2018-03-03 03:46:22'),
(174, 2, 61, '2018-03-03 03:46:22', '2018-03-03 03:46:22'),
(175, 2, 70, '2018-03-03 03:46:22', '2018-03-03 03:46:22'),
(176, 3, 10, '2018-03-03 03:47:23', '2018-03-03 03:47:23'),
(177, 3, 23, '2018-03-03 03:47:23', '2018-03-03 03:47:23'),
(178, 3, 53, '2018-03-03 03:47:23', '2018-03-03 03:47:23'),
(179, 3, 61, '2018-03-03 03:47:23', '2018-03-03 03:47:23'),
(180, 3, 71, '2018-03-03 03:47:23', '2018-03-03 03:47:23'),
(181, 4, 10, '2018-03-03 03:48:01', '2018-03-03 03:48:01'),
(182, 4, 23, '2018-03-03 03:48:01', '2018-03-03 03:48:01'),
(183, 4, 53, '2018-03-03 03:48:01', '2018-03-03 03:48:01'),
(184, 4, 61, '2018-03-03 03:48:01', '2018-03-03 03:48:01'),
(185, 4, 70, '2018-03-03 03:48:01', '2018-03-03 03:48:01'),
(186, 5, 10, '2018-03-03 03:48:40', '2018-03-03 03:48:40'),
(187, 5, 23, '2018-03-03 03:48:40', '2018-03-03 03:48:40'),
(188, 5, 53, '2018-03-03 03:48:40', '2018-03-03 03:48:40'),
(189, 5, 61, '2018-03-03 03:48:40', '2018-03-03 03:48:40'),
(190, 5, 70, '2018-03-03 03:48:40', '2018-03-03 03:48:40'),
(191, 6, 10, '2018-03-03 03:49:11', '2018-03-03 03:49:11'),
(192, 6, 23, '2018-03-03 03:49:11', '2018-03-03 03:49:11'),
(193, 6, 53, '2018-03-03 03:49:11', '2018-03-03 03:49:11'),
(194, 6, 61, '2018-03-03 03:49:11', '2018-03-03 03:49:11'),
(195, 6, 69, '2018-03-03 03:49:11', '2018-03-03 03:49:11'),
(196, 7, 10, '2018-03-03 03:49:41', '2018-03-03 03:49:41'),
(197, 7, 23, '2018-03-03 03:49:41', '2018-03-03 03:49:41'),
(198, 7, 53, '2018-03-03 03:49:41', '2018-03-03 03:49:41'),
(199, 7, 61, '2018-03-03 03:49:41', '2018-03-03 03:49:41'),
(200, 7, 68, '2018-03-03 03:49:41', '2018-03-03 03:49:41'),
(201, 8, 10, '2018-03-03 03:50:07', '2018-03-03 03:50:07'),
(202, 8, 23, '2018-03-03 03:50:07', '2018-03-03 03:50:07'),
(203, 8, 53, '2018-03-03 03:50:07', '2018-03-03 03:50:07'),
(204, 8, 61, '2018-03-03 03:50:07', '2018-03-03 03:50:07'),
(205, 8, 68, '2018-03-03 03:50:07', '2018-03-03 03:50:07'),
(210, 47, 10, '2018-03-08 08:24:38', '2018-03-08 08:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `controller` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilege`
--

INSERT INTO `privilege` (`id`, `fullname`, `controller`, `action`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'category-article-list', 'category-article', 'list', 1, '2017-05-18 06:49:30', '2017-05-19 17:26:33'),
(2, 'category-article-form', 'category-article', 'form', 1, '2017-05-18 06:50:32', '2017-11-26 16:43:37'),
(4, 'article-list', 'article', 'list', 1, '2017-05-18 08:34:41', '2017-05-19 18:11:35'),
(5, 'article-form', 'article', 'form', 1, '2017-05-18 08:35:17', '2017-05-19 17:24:54'),
(18, 'privilege-list', 'privilege', 'list', 1, NULL, '2017-11-26 16:43:37'),
(19, 'privilege-form', 'privilege', 'form', 1, NULL, '2017-11-26 16:43:37'),
(24, 'group-member-list', 'group-member', 'list', 1, '2017-05-19 11:59:40', '2017-11-26 16:43:37'),
(25, 'group-member-form', 'group-member', 'form', 1, '2017-05-19 12:00:09', '2017-11-26 16:43:37'),
(43, 'user-list', 'user', 'list', 1, '2017-05-19 17:45:27', '2017-11-26 16:43:37'),
(44, 'user-form', 'user', 'form', 1, '2017-05-19 17:45:57', '2017-11-26 16:43:37'),
(49, 'menu-type-list', 'menu-type', 'list', 1, '2017-05-19 17:49:35', '2017-11-26 16:43:37'),
(50, 'menu-type-form', 'menu-type', 'form', 1, '2017-05-19 17:49:53', '2017-11-26 16:43:37'),
(55, 'menu-list', 'menu', 'list', 1, '2017-05-19 18:01:20', '2017-11-26 16:43:37'),
(56, 'menu-form', 'menu', 'form', 1, '2017-05-19 18:01:38', '2017-11-26 16:43:37'),
(61, 'media-list', 'media', 'list', 1, '2017-05-19 18:05:47', '2017-11-26 16:43:37'),
(62, 'media-form', 'media', 'form', 1, '2017-05-19 18:06:05', '2017-11-26 16:43:37'),
(67, 'product-list', 'product', 'list', 1, '2017-05-19 18:09:08', '2017-11-26 16:43:37'),
(68, 'product-form', 'product', 'form', 1, '2017-05-19 18:09:20', '2017-11-26 16:43:37'),
(79, 'invoice-list', 'invoice', 'list', 1, '2017-05-19 18:14:02', '2017-11-26 16:43:37'),
(80, 'invoice-form', 'invoice', 'form', 1, '2017-05-19 18:14:30', '2017-11-26 16:43:37'),
(85, 'customer-list', 'customer', 'list', 1, '2017-05-19 18:16:10', '2017-11-26 16:43:37'),
(86, 'customer-form', 'customer', 'form', 1, '2017-05-19 18:16:33', '2017-11-26 16:43:37'),
(103, 'category-product-list', 'category-product', 'list', 1, '2017-11-26 14:50:53', '2017-11-26 14:50:53'),
(104, 'category-product-form', 'category-product', 'form', 1, '2017-11-26 14:51:11', '2017-11-26 14:51:11'),
(105, 'payment-method-list', 'payment-method', 'list', 1, '2017-11-26 14:52:56', '2017-11-26 14:52:56'),
(106, 'payment-method-form', 'payment-method', 'form', 1, '2017-11-26 14:53:10', '2017-11-26 14:53:10'),
(107, 'module-item-list', 'module-item', 'list', 1, '2017-11-26 14:54:56', '2017-11-26 14:54:56'),
(108, 'module-item-form', 'module-item', 'form', 1, '2017-11-26 14:55:07', '2017-11-26 14:55:07'),
(109, 'setting-system-list', 'setting-system', 'list', 1, '2017-11-26 14:56:14', '2017-11-26 14:56:31'),
(110, 'setting-system-form', 'setting-system', 'form', 1, '2017-11-26 14:56:46', '2017-11-26 14:56:46'),
(115, 'category-banner-list', 'category-banner', 'list', 1, '2017-12-12 04:05:17', '2017-12-12 04:05:17'),
(116, 'category-banner-form', 'category-banner', 'form', 1, '2017-12-12 04:05:47', '2017-12-12 04:05:47'),
(121, 'banner-list', 'banner', 'list', 1, '2017-12-12 07:41:46', '2017-12-12 07:41:46'),
(122, 'banner-form', 'banner', 'form', 1, '2017-12-12 07:41:56', '2017-12-12 07:41:56'),
(123, 'page-list', 'page', 'list', 1, '2017-12-13 18:10:13', '2017-12-13 18:10:13'),
(124, 'page-form', 'page', 'form', 1, '2017-12-13 18:10:24', '2017-12-13 18:10:24'),
(125, 'project-list', 'project', 'list', 1, '2018-01-04 09:45:36', '2018-01-04 09:45:36'),
(126, 'project-form', 'project', 'form', 1, '2018-01-04 09:45:49', '2018-01-04 09:45:49'),
(127, 'project-article-list', 'project-article', 'list', 1, '2018-01-04 15:21:53', '2018-01-04 15:21:53'),
(128, 'project-article-form', 'project-article', 'form', 1, '2018-01-04 15:22:08', '2018-01-04 15:22:08'),
(129, 'supporter-list', 'supporter', 'list', 1, '2018-01-07 17:18:23', '2018-01-07 17:18:23'),
(130, 'supporter-form', 'supporter', 'form', 1, '2018-01-07 17:18:39', '2018-01-07 17:18:39'),
(131, 'organization-list', 'organization', 'list', 1, '2018-01-08 04:32:03', '2018-01-08 04:32:03'),
(132, 'organization-form', 'organization', 'form', 1, '2018-01-08 04:32:17', '2018-01-08 04:32:17'),
(133, 'album-list', 'album', 'list', 1, '2018-01-08 15:57:00', '2018-01-08 15:57:00'),
(134, 'album-form', 'album', 'form', 1, '2018-01-08 15:57:10', '2018-01-08 15:57:10'),
(135, 'photo-list', 'photo', 'list', 1, '2018-01-08 18:07:30', '2018-01-08 18:07:30'),
(136, 'photo-form', 'photo', 'form', 1, '2018-01-08 18:07:39', '2018-01-08 18:07:39'),
(137, 'category-video-list', 'category-video', 'list', 1, '2018-01-09 09:54:53', '2018-01-09 09:54:53'),
(138, 'category-video-form', 'category-video', 'form', 1, '2018-01-09 09:55:06', '2018-01-09 09:55:06'),
(139, 'video-list', 'video', 'list', 1, '2018-01-09 09:55:16', '2018-01-09 09:55:16'),
(140, 'video-form', 'video', 'form', 1, '2018-01-09 09:55:24', '2018-01-09 09:55:24'),
(141, 'province-list', 'province', 'list', 1, '2018-01-21 17:53:20', '2018-01-21 17:53:20'),
(142, 'province-form', 'province', 'form', 1, '2018-01-21 17:53:29', '2018-01-21 17:53:29'),
(143, 'district-list', 'district', 'list', 1, '2018-01-22 02:03:24', '2018-01-22 02:03:24'),
(144, 'district-form', 'district', 'form', 1, '2018-01-22 02:03:34', '2018-01-22 02:03:34'),
(145, 'category-param-list', 'category-param', 'list', 1, '2018-02-01 20:15:43', '2018-02-01 20:15:43'),
(146, 'category-param-form', 'category-param', 'form', 1, '2018-02-01 20:15:56', '2018-02-01 20:15:56'),
(151, 'scale-list', 'scale', 'list', 1, '2018-04-01 15:39:11', '2018-04-01 15:39:11'),
(152, 'scale-form', 'scale', 'form', 1, '2018-04-01 15:39:21', '2018-04-01 15:39:21'),
(153, 'sex-list', 'sex', 'list', 1, '2018-04-05 02:58:18', '2018-04-05 02:58:18'),
(154, 'sex-form', 'sex', 'form', 1, '2018-04-05 02:58:28', '2018-04-05 02:58:28'),
(155, 'marriage-list', 'marriage', 'list', 1, '2018-04-05 03:49:38', '2018-04-05 03:49:38'),
(156, 'marriage-form', 'marriage', 'form', 1, '2018-04-05 03:49:50', '2018-04-05 03:49:50'),
(157, 'employer-list', 'employer', 'list', 1, '2018-04-06 04:01:55', '2018-04-06 04:01:55'),
(158, 'employer-form', 'employer', 'form', 1, '2018-04-06 04:02:08', '2018-04-06 04:02:08'),
(159, 'dashboard-form', 'dashboard', 'form', 1, '2018-04-07 01:25:58', '2018-04-07 01:25:58'),
(160, 'candidate-list', 'candidate', 'list', 1, '2018-04-11 07:59:45', '2018-04-11 07:59:45'),
(161, 'candidate-form', 'candidate', 'form', 1, '2018-04-11 07:59:57', '2018-04-11 07:59:57'),
(162, 'work-list', 'work', 'list', 1, '2018-04-11 09:21:18', '2018-04-11 09:21:18'),
(163, 'work-form', 'work', 'form', 1, '2018-04-11 09:21:28', '2018-04-11 09:21:28'),
(164, 'literacy-list', 'literacy', 'list', 1, '2018-04-11 09:52:34', '2018-04-11 09:52:34'),
(165, 'literacy-form', 'literacy', 'form', 1, '2018-04-11 09:52:45', '2018-04-11 09:52:45'),
(166, 'experience-list', 'experience', 'list', 1, '2018-04-11 19:43:03', '2018-04-11 19:43:03'),
(167, 'experience-form', 'experience', 'form', 1, '2018-04-11 19:43:15', '2018-04-11 19:43:15'),
(168, 'salary-list', 'salary', 'list', 1, '2018-04-12 01:43:35', '2018-04-12 01:43:35'),
(169, 'salary-form', 'salary', 'form', 1, '2018-04-12 01:43:46', '2018-04-12 01:43:46'),
(170, 'working-form-list', 'working-form', 'list', 1, '2018-04-12 02:20:20', '2018-04-12 02:20:20'),
(171, 'working-form-form', 'working-form', 'form', 1, '2018-04-12 02:20:33', '2018-04-12 02:20:33'),
(172, 'probationary-list', 'probationary', 'list', 1, '2018-04-12 02:49:33', '2018-04-12 02:49:33'),
(173, 'probationary-form', 'probationary', 'form', 1, '2018-04-12 02:49:43', '2018-04-12 02:49:43'),
(174, 'job-list', 'job', 'list', 1, '2018-04-12 03:18:49', '2018-04-12 03:18:49'),
(175, 'job-form', 'job', 'form', 1, '2018-04-12 03:18:57', '2018-04-12 03:18:57'),
(176, 'recruitment-list', 'recruitment', 'list', 1, '2018-04-14 02:26:17', '2018-04-14 02:26:17'),
(177, 'recruitment-form', 'recruitment', 'form', 1, '2018-04-14 02:26:28', '2018-04-14 02:26:28'),
(178, 'rank-list', 'rank', 'list', 1, '2018-04-16 02:47:05', '2018-04-16 02:47:05'),
(179, 'rank-form', 'rank', 'form', 1, '2018-04-16 02:47:23', '2018-04-16 02:47:23'),
(180, 'graduation-list', 'graduation', 'list', 1, '2018-04-25 07:39:52', '2018-04-25 07:39:52'),
(181, 'graduation-form', 'graduation', 'form', 1, '2018-04-25 07:40:05', '2018-04-25 07:40:05'),
(182, 'language-list', 'language', 'list', 1, '2018-04-25 08:11:28', '2018-04-25 08:11:28'),
(183, 'language-form', 'language', 'form', 1, '2018-04-25 08:11:41', '2018-04-25 08:11:41'),
(184, 'language-level-list', 'language-level', 'list', 1, '2018-04-25 08:48:50', '2018-04-25 08:48:50'),
(185, 'language-level-form', 'language-level', 'form', 1, '2018-04-25 08:49:02', '2018-04-25 08:49:02'),
(186, 'classification-list', 'classification', 'list', 1, '2018-04-27 08:14:13', '2018-04-27 08:14:13'),
(187, 'classification-form', 'classification', 'form', 1, '2018-04-27 08:14:27', '2018-04-27 08:14:27'),
(188, 'skill-list', 'skill', 'list', 1, '2018-04-27 18:06:58', '2018-04-27 18:06:58'),
(189, 'skill-form', 'skill', 'form', 1, '2018-04-27 18:07:06', '2018-04-27 18:07:06'),
(190, 'profile-list', 'profile', 'list', 1, '2018-05-02 03:36:52', '2018-05-02 03:36:52'),
(191, 'profile-form', 'profile', 'form', 1, '2018-05-02 03:37:03', '2018-05-02 03:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `probationary`
--

DROP TABLE IF EXISTS `probationary`;
CREATE TABLE `probationary` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `probationary`
--

INSERT INTO `probationary` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhận việc ngay', 'nhan-viec-ngay', 1, 1, '2018-04-12 07:03:49', '2018-04-12 07:03:49'),
(2, '1 tháng', '1-thang', 1, 1, '2018-04-12 07:03:57', '2018-04-12 07:03:57'),
(3, '2 tháng', '2-thang', 1, 1, '2018-04-12 07:04:04', '2018-04-12 07:04:04'),
(4, '3 tháng', '3-thang', 1, 1, '2018-04-12 07:04:10', '2018-04-12 07:04:10'),
(5, 'Trao đổi trực tiếp khi phỏng vấn', 'trao-doi-truc-tiep-khi-phong-van', 1, 1, '2018-04-12 07:04:25', '2018-04-12 07:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `child_image` text CHARACTER SET utf8,
  `price` decimal(11,2) DEFAULT NULL,
  `sale_price` decimal(11,2) DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `detail` text CHARACTER SET utf8,
  `technical_detail` text COLLATE utf8_unicode_ci,
  `video_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_view` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `literacy_id` int(11) DEFAULT NULL,
  `experience_id` int(11) DEFAULT NULL,
  `rank_present_id` int(11) DEFAULT NULL,
  `rank_offered_id` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `file_attached` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `career_goal` text COLLATE utf8_unicode_ci,
  `ms_word` int(11) DEFAULT NULL,
  `ms_excel` int(11) DEFAULT NULL,
  `ms_power_point` int(11) DEFAULT NULL,
  `ms_outlook` int(11) DEFAULT NULL,
  `other_software` text COLLATE utf8_unicode_ci,
  `medal` text COLLATE utf8_unicode_ci,
  `hobby` text COLLATE utf8_unicode_ci,
  `talent` text COLLATE utf8_unicode_ci,
  `status_search` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `fullname`, `alias`, `literacy_id`, `experience_id`, `rank_present_id`, `rank_offered_id`, `salary`, `file_attached`, `candidate_id`, `career_goal`, `ms_word`, `ms_excel`, `ms_power_point`, `ms_outlook`, `other_software`, `medal`, `hobby`, `talent`, `status_search`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhân viên kinh doanh website , tên miền , hosting', 'nhan-vien-kinh-doanh-website-ten-mien-hosting', 5, 4, 3, 4, 17000000, 'ke-hoach-tmdtx-4bu8ydesm103.docx', 5, '<p>Đến Bệnh viện 115 và Thống Nhất thăm các hiệp sĩ gặp nạn sáng nay, ông Nguyễn Thành Phong trò chuyện với ông Trần Văn Hoàng (Trưởng nhóm hiệp sĩ Tân Bình, vừa qua cơn nguy kịch). Ông Phong thay mặt người dân thành phố cảm ơn nghĩa cử cao đẹp của các hiệp sĩ không quản nguy hiểm, xả thân bảo vệ bình yên cho nhân dân.\r\n</p><p>\r\nChủ tịch thành phố nói rằng, ông rất trăn trở khi hiệp sĩ chưa được trang bị bất cứ phương tiện nào để bảo vệ mình, còn tội phạm trộm cướp luôn mang theo vũ khí nguy hiểm.<br></p>', 1, 2, 3, 4, 'MS Sharepoint  48', '<p>- Tốt nghiệp từ trung cấp trở lên;\r\n</p><p>- Khả năng giao tiếp tốt, linh hoạt;\r\n</p><p>- Đạo đức tốt, kỷ luật tốt;\r\n</p><p>- Hoạt bát, có tinh thần cầu tiến, nhiệt huyết và mong muốn phát triển thu nhập xứng đáng với năng lực làm việc;\r\n</p><p>- Có điện thoại, xe máy, laptop;\r\n- Có kinh nghiệm kinh doanh trong các lĩnh vực tài chính/ngân hàng/ FMCG...là một lợi thế.</p>', 'Bóng đá 12', '<p>UNFPA Việt Nam từng hợp tác với Phạm Anh Khoa trong chiến dịch phòng chống bạo lực giới năm 2013, 2014. Anh cũng tham gia sự kiện kỷ niệm 40 năm hợp tác giữa UNFPA và chính phủ Việt Nam hồi tháng 7 năm ngoái. </p><p>Nam ca sĩ đảm nhiệm vai trò đại sứ hình ảnh về phòng chống bạo lực với phụ nữ và trẻ em gái. Trong đó, chống quấy rối và bạo lực tình dục chính là trọng tâm của chương trình này. </p><p>Trước khi đưa ra tuyên bố chính thức, UNFPA đã gỡ bỏ toàn bộ hình ảnh của rocker trên website, facebook của tổ chức này.\r\n\r\nQuỹ Dân số Liên Hợp Quốc (UNFPA) là cơ quan trực thuộc Liên Hợp Quốc, bắt đầu hoạt động từ năm 1969. Quỹ hoạt động ở Việt Nam từ năm 1977. Hoa hậu Đỗ Mỹ Linh, diễn viên Chiều Xuân, MC Phan Anh là đại sứ thiện chí.</p>', 1, 1, '2018-04-16 05:05:40', '2018-05-14 14:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `profile_experience`
--

DROP TABLE IF EXISTS `profile_experience`;
CREATE TABLE `profile_experience` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month_from` int(11) DEFAULT NULL,
  `year_from` int(11) DEFAULT NULL,
  `month_to` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `job_description` text COLLATE utf8_unicode_ci,
  `achievement` text COLLATE utf8_unicode_ci,
  `profile_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_experience`
--

INSERT INTO `profile_experience` (`id`, `company_name`, `person_title`, `month_from`, `year_from`, `month_to`, `year_to`, `currency`, `salary`, `job_description`, `achievement`, `profile_id`, `created_at`, `updated_at`) VALUES
(10, 'Công ty Cổ phần DKRA Việt Nam', 'Chuyên Viên Tư Vấn Bất Động Sản', 2, 2002, 3, 2003, 'vnd', 7000000, '<p>Năm 2018, cùng với sự phát triển mạnh mẽ của thị trường bất động sản, để đáp ứng nhu cầu mở rộng kinh doanh, phân phối độc quyền nhiều dự án từ các chủ đầu tư uy tín, DKRA Việt Nam cần tuyển:\r\n</p><p>- Tìm kiếm và khai thác nguồn khách hàng tiềm năng có nhu cầu mua/ đầu tư bất động sản;\r\n</p><p>- Giới thiệu, hướng dẫn và tư vấn cho khách hàng các thông tin liên quan đến sản phẩm, dự án mà công ty phân phối;\r\n</p><p>- Chăm sóc khách hàng hiện tại và tiềm năng;\r\n- Phối hợp với đội nhóm để thực hiện chỉ tiêu chung;</p>', '<p>Bác sĩ Bùi Minh Trạng (Phó giám đốc Bệnh viện 115) cho biết, đêm qua bệnh viện tích cực cứu chữa cho các hiệp sĩ nhưng anh Nguyễn Hoàng Nam (29 tuổi) và Nguyễn Văn Thôi (42 tuổi) đã tử vong.\r\n</p><p>\r\nCòn ông Trần Văn Hoàng (50 tuổi) bị vết thương ngực trái dài 20 cm, đứt các sụn sườn, thủng phổi, rách màng ngoài tim, rách cơ hoành, dạ dày, ruột trồi ra ngoài, mất khoảng 1.500 ml máu. Sau khi tích cực cứu chữa, bệnh nhân tỉnh, tiếp xúc tốt, không thở máy.</p>', 1, '2018-05-14 14:14:00', '2018-05-14 14:14:00');

-- --------------------------------------------------------

--
-- Table structure for table `profile_graduation`
--

DROP TABLE IF EXISTS `profile_graduation`;
CREATE TABLE `profile_graduation` (
  `id` bigint(20) NOT NULL,
  `literacy_id` int(11) DEFAULT NULL,
  `training_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_from` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `graduation_id` int(11) DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_graduation`
--

INSERT INTO `profile_graduation` (`id`, `literacy_id`, `training_unit`, `year_from`, `year_to`, `department`, `graduation_id`, `degree`, `profile_id`, `created_at`, `updated_at`) VALUES
(1, 6, 'Trung tâm tin học Nhất Nghệ', 2001, 2003, 'Kỹ thuật viên máy tính', 2, 'category-1-238ordk6vuqf.png', 1, '2018-04-28 04:20:34', '2018-04-28 04:20:34'),
(2, 2, 'Đại học FPT', 2003, 2005, 'Công nghệ phần mềm', 3, 'category-2-695mavyhufjz.png', 1, '2018-04-28 04:21:22', '2018-04-28 04:21:22'),
(3, 2, 'Đại học Công Nghệ Thông Tin', 1959, 1956, 'Công nghệ phần mềm', 2, 'category-3-jw5b8khcgsfi.png', 1, '2018-04-28 12:03:42', '2018-04-28 12:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `profile_job`
--

DROP TABLE IF EXISTS `profile_job`;
CREATE TABLE `profile_job` (
  `id` bigint(20) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_job`
--

INSERT INTO `profile_job` (`id`, `profile_id`, `job_id`, `created_at`, `updated_at`) VALUES
(44, 10, 36, '2018-04-16 10:12:19', '2018-04-16 10:12:19'),
(45, 11, 11, '2018-04-16 10:14:15', '2018-04-16 10:14:15'),
(46, 12, 27, '2018-04-16 10:18:40', '2018-04-16 10:18:40'),
(47, 13, 2, '2018-04-17 03:38:34', '2018-04-17 03:38:34'),
(48, 13, 4, '2018-04-17 03:38:34', '2018-04-17 03:38:34'),
(49, 13, 6, '2018-04-17 03:38:34', '2018-04-17 03:38:34'),
(53, 1, 51, '2018-04-21 08:42:16', '2018-04-21 08:42:16'),
(54, 1, 53, '2018-04-21 08:42:16', '2018-04-21 08:42:16'),
(55, 1, 55, '2018-04-21 08:42:16', '2018-04-21 08:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `profile_language`
--

DROP TABLE IF EXISTS `profile_language`;
CREATE TABLE `profile_language` (
  `id` bigint(20) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `language_level_id` int(11) DEFAULT NULL,
  `listening` int(11) DEFAULT NULL,
  `speaking` int(11) DEFAULT NULL,
  `reading` int(11) DEFAULT NULL,
  `writing` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_language`
--

INSERT INTO `profile_language` (`id`, `language_id`, `language_level_id`, `listening`, `speaking`, `reading`, `writing`, `profile_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 1, 2, 3, 4, 1, '2018-04-28 04:21:39', '2018-04-28 04:21:39'),
(2, 4, 3, 4, 3, 2, 1, 1, '2018-04-28 04:22:59', '2018-04-28 04:22:59'),
(3, 5, 3, 1, 2, 3, 4, 1, '2018-04-28 04:46:49', '2018-04-28 04:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `profile_place`
--

DROP TABLE IF EXISTS `profile_place`;
CREATE TABLE `profile_place` (
  `id` bigint(20) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_place`
--

INSERT INTO `profile_place` (`id`, `profile_id`, `province_id`, `created_at`, `updated_at`) VALUES
(36, 10, 10, '2018-04-16 10:12:19', '2018-04-16 10:12:19'),
(37, 11, 7, '2018-04-16 10:14:15', '2018-04-16 10:14:15'),
(38, 12, 7, '2018-04-16 10:18:40', '2018-04-16 10:18:40'),
(39, 13, 2, '2018-04-17 03:38:34', '2018-04-17 03:38:34'),
(40, 13, 4, '2018-04-17 03:38:34', '2018-04-17 03:38:34'),
(41, 13, 6, '2018-04-17 03:38:34', '2018-04-17 03:38:34'),
(45, 1, 57, '2018-04-21 08:42:16', '2018-04-21 08:42:16'),
(46, 1, 59, '2018-04-21 08:42:16', '2018-04-21 08:42:16'),
(47, 1, 61, '2018-04-21 08:42:16', '2018-04-21 08:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `profile_skill`
--

DROP TABLE IF EXISTS `profile_skill`;
CREATE TABLE `profile_skill` (
  `id` bigint(20) NOT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_skill`
--

INSERT INTO `profile_skill` (`id`, `skill_id`, `profile_id`, `created_at`, `updated_at`) VALUES
(7, 4, 1, '2018-04-30 16:02:30', '2018-04-30 16:02:30'),
(8, 6, 1, '2018-04-30 16:02:30', '2018-04-30 16:02:30'),
(9, 8, 1, '2018-04-30 16:02:30', '2018-04-30 16:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` bigint(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_view` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `overview` text COLLATE utf8_unicode_ci,
  `equipment` text COLLATE utf8_unicode_ci,
  `price_list` text COLLATE utf8_unicode_ci,
  `googlemap_url` text COLLATE utf8_unicode_ci,
  `province_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `street` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_article`
--

DROP TABLE IF EXISTS `project_article`;
CREATE TABLE `project_article` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `count_view` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_member`
--

DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
  `id` bigint(20) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_member`
--

INSERT INTO `project_member` (`id`, `project_id`, `member_id`, `created_at`, `updated_at`) VALUES
(1, 10, 4, '2018-01-07 14:09:20', '2018-01-07 14:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'An Giang', 'an-giang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(2, 'Bà Rịa Vũng Tàu', 'ba-ria-vung-tau', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(3, 'Bình Dương', 'binh-duong', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(4, 'Bình Phước', 'binh-phuoc', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(5, 'Bình Thuận', 'binh-thuan', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(6, 'Bình Định', 'binh-dinh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(7, 'Bắc Giang', 'bac-giang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(8, 'Bắc Kạn', 'bac-kan', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(9, 'Bắc Ninh', 'bac-ninh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(10, 'Bến Tre', 'ben-tre', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(11, 'Cao Bằng', 'cao-bang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(12, 'Cà Mau', 'ca-mau', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(13, 'Cần Thơ', 'can-tho', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(14, 'Gia Lai', 'gia-lai', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(15, 'Hà Giang', 'ha-giang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(16, 'Hà Nam', 'ha-nam', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(17, 'Hà Nội', 'ha-noi', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(18, 'Hà Tĩnh', 'ha-tinh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(19, 'Hòa Bình', 'hoa-binh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(20, 'Hưng Yên', 'hung-yen', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(21, 'Hải Dương', 'hai-duong', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(22, 'Hải Phòng', 'hai-phong', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(23, 'Hồ Chí Minh', 'ho-chi-minh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(24, 'Khánh Hòa', 'khanh-hoa', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(25, 'Kiên Giang', 'kien-giang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(26, 'Kon Tum', 'kon-tum', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(27, 'Lai Châu', 'lai-chau', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(28, 'Long An', 'long-an', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(29, 'Lào Cai', 'lao-cai', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(30, 'Lâm Đồng', 'lam-dong', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(31, 'Lạng Sơn', 'lang-son', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(32, 'Nam Định', 'nam-dinh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(33, 'Nghệ An', 'nghe-an', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(34, 'Ninh Bình', 'ninh-binh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(35, 'Ninh Thuận', 'ninh-thuan', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(36, 'Phú Thọ', 'phu-tho', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(37, 'Phú Yên', 'phu-yen', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(38, 'Quảng Nam', 'quang-nam', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(39, 'Quảng Ngãi', 'quang-ngai', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(40, 'Quảng Ninh', 'quang-ninh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(41, 'Quảng Trị', 'quang-tri', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(42, 'Sơn La', 'son-la', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(43, 'Thanh Hóa', 'thanh-hoa', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(44, 'Thái Bình', 'thai-binh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(45, 'Thái Nguyên', 'thai-nguyen', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(46, 'Thừa Thiên Huế', 'thua-thien-hue', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(47, 'Tiền Giang', 'tien-giang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(48, 'Trà Vinh', 'tra-vinh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(49, 'Tuyên Quang', 'tuyen-quang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(50, 'Tây Ninh', 'tay-ninh', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(51, 'Vĩnh Long', 'vinh-long', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(52, 'Vĩnh Phúc', 'vinh-phuc', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(53, 'Yên Bái', 'yen-bai', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(54, 'Đà Nẵng', 'da-nang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(55, 'Đắk Lắk', 'dak-lak', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(56, 'Đồng Nai', 'dong-nai', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(57, 'Đồng Tháp', 'dong-thap', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(58, 'Bạc Liêu', 'bac-lieu', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(59, 'Sóc Trăng', 'soc-trang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(60, 'Hậu Giang', 'hau-giang', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(61, 'Đắk Nông', 'dak-nong', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55'),
(62, 'Điện Biên', 'dien-bien', 1, 1, '2018-02-26 00:00:00', '2018-04-01 17:22:55');

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhân viên', 'nhan-vien', 1, 1, '2018-04-16 02:51:07', '2018-04-16 02:51:07'),
(2, 'Cộng tác viên', 'cong-tac-vien', 1, 1, '2018-04-16 02:51:14', '2018-04-16 02:51:14'),
(3, 'Trưởng nhóm', 'truong-nhom', 1, 1, '2018-04-16 02:51:24', '2018-04-16 02:55:39'),
(4, 'Chuyên gia', 'chuyen-gia', 1, 1, '2018-04-16 02:51:31', '2018-04-16 02:55:44'),
(5, 'Trưởng phó phòng', 'truong-pho-phong', 1, 1, '2018-04-16 02:52:06', '2018-04-16 02:55:39'),
(6, 'Quản lý cấp cao', 'quan-ly-cap-cao', 1, 1, '2018-04-16 02:52:17', '2018-04-16 02:52:17'),
(7, 'Mới tốt nghiệp', 'moi-tot-nghiep', 1, 1, '2018-04-16 04:40:07', '2018-04-16 04:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment`
--

DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sex_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `requirement` text COLLATE utf8_unicode_ci,
  `work_id` int(11) DEFAULT NULL,
  `literacy_id` int(11) DEFAULT NULL,
  `experience_id` int(11) DEFAULT NULL,
  `salary_id` int(11) DEFAULT NULL,
  `commission_from` int(11) DEFAULT NULL,
  `commission_to` int(11) DEFAULT NULL,
  `working_form_id` int(11) DEFAULT NULL,
  `probationary_id` int(11) DEFAULT NULL,
  `benefit` text COLLATE utf8_unicode_ci,
  `duration` datetime DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `count_view` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recruitment`
--

INSERT INTO `recruitment` (`id`, `fullname`, `alias`, `quantity`, `sex_id`, `description`, `requirement`, `work_id`, `literacy_id`, `experience_id`, `salary_id`, `commission_from`, `commission_to`, `working_form_id`, `probationary_id`, `benefit`, `duration`, `employer_id`, `count_view`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhân viên quản lý kho hàng', 'nhan-vien-quan-ly-kho-hang', 1, 2, '<p>- Phụ giúp công việc cho Thủ kho, Thực hiện hoạt động nhập kho, xuất kho hàng hóa được thủ kho phân công.\r\n</p><p>- Đóng gói hàng hóa\r\n</p><p>- Sắp xếp hàng hóa trong kho gọn gàng, hợp lý.\r\n</p><p>- Phối hợp với các nhân viên kho thực hiện công việc chung. </p>', '<p>- Chấp nhận tăng ca\r\n</p><p>- Tuân thủ quy trình, quy định\r\n</p><p>- Siêng năng, chịu khó , trung thực </p>', 1, 3, 2, 3, 0, 0, 1, 2, '<p>- Môi trường làm việc thân thiện, văn minh, chuyên nghiệp, đoàn kết, cởi mở và sáng tạo. </p><p>\r\n- Các chế độ khác theo quy định của công ty</p>', '2018-05-29 00:00:00', 36, NULL, 1, '2018-05-16 08:49:12', '2018-05-17 02:18:23'),
(2, 'Trưởng Nhóm Lập Trình Php (Wordpress)', 'truong-nhom-lap-trinh-php-wordpress', 1, 1, '<p>VinaHost có nhu cầu tuyển dụng nhân sự chuyên thiết kế website dựa trên nền tảng WordPress với mô tả công việc gồm có:</p><p>- Thiết kế và triển khai các giao diện đồ họa trên hệ thống quản lý nội dung mã nguồn mở WordPress theo yêu cầu của khách hàng.</p><p>- Cấu hình các chức năng mở rộng (plugins / extensions) và thực hiện các thao tác quản trị cấu hình WordPress theo yêu cầu của khách hàng.</p><p>- Hỗ trợ hướng dẫn khách hàng cập nhật bài viết và quản lý nội dung website.</p><p>- Chuyển layout từ PSD sang HTML-CSS</p><p>- Lập trình chức năng cho website</p><p>- Quản lý team từ 3 đến 5 bạn</p>', '<p>- Hiểu biết vững chắc và sử dụng thành thạo WordPress</p><p>- Có kinh nghiệm lập trình nhiều dự án web</p><p>- Có kỹ năng/kiến thức tốt về PHP</p><p>- Có kinh nghiệm làm việc với các CMS khác hoặc các PHP Framework (Zend Framework, Yii, Prado, CodeIgniter, Kohana, CakePHP…) là một lợi thế.</p><p>- Có kiến thức về các công nghệ cơ bản như HTML/CSS, AJAX, Javascript.Biết sử dụng Illustrator hoặc Corel là một lợi thế</p><p>- Có kiến thức về thiết kế và khả năng xử lý đồ họa. Có khiếu thẩm mỹ.</p><p>* Yêu cầu hồ sơ :</p><p>- CV ghi rõ các kinh nghiệm có liên quan.</p><p>- Mẫu website đã xây dựng / quản trị sử dụng WordPress.</p>', 1, 3, 3, 6, 0, 0, 1, 3, '<p>- Lương + thưởng theo dự án.</p><p>- Thiết kế cho các thương hiệu, công ty lớn</p><p>- Được cung cấp thiết bị cần thiết cho công việc, tham gia các khóa đào tạo (đào tạo sơ bộ, kiến thức chuyên môn và kỹ năng mềm).</p><p>- Hưởng nhiều chính sách đãi ngộ, đặc biệt như thưởng nóng (tiền mặt hoặc hiện vật) hàng tháng theo kết quả làm việc hoặc những kế hoạch đột phá; thưởng cuối năm theo doanh thu; phụ cấp ăn trưa, đi lại, tiếp khách.</p><p>- Tham gia khám sức khỏe định kỳ hàng năm</p><p>- Du lịch nghỉ mát 01 lần/năm; team building từ 3 lần/năm, Gala cuối năm.</p><p>- Được làm việc trong môi trường trẻ trung, năng động, đánh giá và đãi ngộ dựa trên năng lực & sự nhiệt tình sáng tạo của từng thành viên.</p>', '2018-05-25 00:00:00', 60, NULL, 1, '2018-05-17 02:02:43', '2018-05-17 02:08:32'),
(3, 'Nhân Viên Kinh Doanh Máy Phát Điện', 'nhan-vien-kinh-doanh-may-phat-dien', 3, 1, '<p>- Lập ra kế hoạch để tiếp cận và phát triển các khách hàng mới có nhu cầu sử dụng máy phát điện</p><p>- Xây dựng quan hệ với khách hàng , đàm phán và ký kết hợp đồng với khách hàng.</p><p>- Theo dõi các xu hướng của thị trường và tiếp cận các công trình trực tiếp, thông qua báo chí, internet, các kênh thông tin.</p><p>- Báo cáo công việc cho quản lý trực tiếp.</p>', '<p>- NVKD Có kinh nghiệm kinh doanh các mặt hàng công nghiệp ,hàng tiêu dùng (ưu tiên biết về máy phát điện)&nbsp;</p><p>- Vi tính văn phòng.</p><p>- Nhanh nhẹn giao tiếp tốt.</p><p>- Có kỹ năng đàm phán, thuyết phục, thương lượng</p><p>- Tiếng anh giao tiếp</p><p>- Ưu tiên biết kỹ thuật máy phát điện.</p><p>- Gửi hồ sơ đến email của nhà tuyển dụng</p><p>- Trình độ : Trung cấp , Cao đẳng , đại học chuyên ngành kinh tế, kỹ thuật ,... yêu thích kinh doanh</p>', 1, 3, 4, 5, 0, 0, 1, 3, '<p>- Lương cơ bản 8-10 triệu + hoa hồng&nbsp;</p><p>- Lương thưởng tháng 13 mỗi năm và thưởng lễ, hoa hồng bán hàng.</p><p>- Được đào tạo kiến thức, kỹ năng chuyên môn, hỗ trợ chi phí đi công tác</p><p>- Môi trường làm việc thân thiện, ổn định</p>', '2018-05-23 00:00:00', 59, NULL, 1, '2018-05-17 02:14:48', '2018-05-17 02:14:48'),
(4, 'Nhân Viên Đầu Tư - Khai Thác Dự Án BĐS', 'nhan-vien-dau-tu-khai-thac-du-an-bds', 1, 3, '<p>- Tìm kiếm và khai thác các dự án bất động sản, tìm kiếm cơ hội đầu tư tiềm năng, thực hiện và thẩm định tính khả thi của các phương án đầu tư.</p><p>- Xây dựng phương án và lập kế hoạch khai thác dự án.</p><p>- Dự đoán, phân tích hiện trạng, báo cáo thẩm định từng dự án khai thác, đầu tư.</p><p>- Lập báo cáo nghiên cứu tiền khả thi và khả thi của dự án và phương án triển khai phát triển dự án.</p><p>- Thiết lập, duy trì và phát triển các mối quan hệ với các chủ đầu tư, đối tác để tiến hành đàm phán, làm các thủ tục đầu tư, khai thác, phát triển dự án.</p><p>- Thực hiện các nhiệm vụ khác do Ban Tổng Giám đốc giao.</p>', '<p>- Tốt nghiệp Đại học chuyên ngành Kinh tế, Quản trị Kinh doanh, Luật...</p><p>- Ít nhất có 1 năm kinh nghiệm làm việc ở vị trí khai thác dự án bất động sản.</p><p>- Có kiến thức chuyên sâu về thị trường bất động sản.</p><p>- Khả năng trình bày, đàm phán, thuyết phục tốt.</p><p>- Khả năng đọc, xử lý số liệu dự án.</p><p>- Năng động, cẩn thận, có tinh thần trách nhiệm và chịu áp lực cao trong công việc.</p><p>- Sử dụng thành thạo tin học văn phòng (MS Word, MS Excel), internet..</p>', 1, 1, 4, 5, 0, 0, 1, 3, '<p>- Chế độ nghỉ Lễ, Phép và nghỉ khác tuân thủ theo qui định của Bộ luật lao động.</p><p>- Chế độ phúc lợi hấp dẫn và cạnh tranh.</p><p>- Chương trình nghỉ mát hàng năm dành cho CBNV.</p><p>- Môi trường làm việc trẻ trung, hiện đại, năng động và chuyên nghiệp.</p>', '2018-05-31 00:00:00', 58, NULL, 1, '2018-05-17 02:20:45', '2018-05-17 02:20:45'),
(5, 'Nhân Viên Cơ Điện Làm Việc Bình Dương', 'nhan-vien-co-dien-lam-viec-binh-duong', 4, 1, '<p>- Bảo trì cơ điện, theo dõi, kiểm tra hệ thống điện nước của công ty</p><p>- Trao đổi cụ thể khi phỏng vấn</p>', '<p>- Có kinh nghiệm về cơ điện</p><p>- Có bằng cấp cơ điện</p>', 1, 2, 3, 4, 0, 0, 1, 2, '<p>- Mức lương : từ 6 triệu – 8 triệu.</p><p>- Phỏng vấn trực tiếp trao đổi cụ thể</p>', '2018-05-27 00:00:00', 57, NULL, 1, '2018-05-17 02:26:26', '2018-05-17 03:17:10'),
(6, 'CÔNG TY TNHH TRANSCOSMOS VIỆT NAM', 'cong-ty-tnhh-transcosmos-viet-nam', 3, 1, '<p>- Nhận danh sách lịch hẹn khách hàng hàng ngày và lên kế hoạch để gặp khách hàng đúng giờ.- Gặp khách hàng và thu thập thông tin cần thiết hỗ trợ khách hàng làm hồ sơ.</p><p>- Số lượng KH mỗi ngảy cần gặp khoảng 3-5 người.</p><p>- Báo cáo tình trạng cuộc hẹn và và doanh số hàng ngày cho giám sát bán hàng.</p>', '<p>Tốt nghiệp phổ thông trở lên, cẩn thận, trung thực</p><p>- Có khả năng giao tiếp với tính trách nhiệm cao.</p><p>- Ngoại hình dễ nhìn là một lợi thế-Ưu tiên có kinh nghiệm làm nhân viên kinh doanh trong lĩnh vực ngân hàng, bảo hiểm, tài chính...YÊU CẦU CÔNG VIỆC:.- Tốt nghiệp phổ thông, cẩn thận, trung thực</p><p>- Có khả năng giao tiếp với tính trách nhiệm cao.</p><p>- Ngoại hình dễ nhìn là một lợi thế-Ưu tiên có kinh nghiệm làm nhân viên kinh doanh trong lĩnh vực ngân hàng, bảo hiểm, tài chính...</p>', 1, 5, 3, 3, 0, 0, 1, 3, '<p>- Được đào tạo nghiệp vụ, kỹ năng tư vấn và chăm sóc khách hàng.-&nbsp;</p><p>- Được khám sức khỏe định kỳ, Du lịch hàng năm.</p><p>- Các chế độ bảo hiểm theo luật lao động.</p><p>- Môi trường làm việc văn hóa Công ty Nhật, thân thiện, có cơ hội thăng tiến.</p>', '2018-05-31 00:00:00', 56, NULL, 1, '2018-05-17 02:34:49', '2018-05-17 02:34:49'),
(7, 'Nhân Viên Chăm Sóc Khách Hàng Truyền Hình Mobitv', 'nhan-vien-cham-soc-khach-hang-truyen-hinh-mobitv', 15, 3, '<p>Tiếp nhận và cung cấp thông tin về sản phẩm, dịch vụ, các chương trình khuyến mại của truyền hình MobiTV đến khách hàng.<br></p>', '<p>a. Chuyên môn:</p><p>- Tốt nghiệp Trung cấp trở lên.</p><p>- Biết tra cứu Web tra cứu thông tin trên máy tính.</p><p>b. Kinh nghiệm:</p><p>- Không yêu cầu kinh nghiệm.</p><p>c. Kỹ năng:</p><p>- Có khả năng giao tiếp tốt qua điện thoại, nhiệt tình, trung thực, hòa đồng, có tinh thần trách nhiệm cao, ham học hỏi, có khả năng chịu được áp lực công việc, làm việc độc lập, </p><p>- Giọng nói dễ nghe, phát âm chuẩn, không nói ngọng, nói lắp, khả năng tư vấn, thuyết phục khách hàng tốt, không nói giọng địa phương,</p>', 1, 3, 1, 3, 0, 0, 1, 2, '<p>- Thu nhập: từ 5 triệu/tháng.</p><p>- Được hưởng các chế độ về BHXH, BHYT, BHTN và các chế độ khác theo quy định của Công ty. </p><p>- Được tham gia các lớp đào tạo chuyên môn, nghiệp vụ chăm sóc khách hàng.</p><p>- Được hưởng phụ cấp trực ca, ăn giữa ca, phụ cấp làm thêm giờ.</p><p>- Thưởng lương kinh doanh, các dịp lễ tết tùy vào tình hình hoạt động thực tế của Công ty.</p><p>- Môi trường làm việc Chuyên nghiệp - Năng động - Thân thiện.</p><p>- Có điều kiện để phát triển và thăng tiến trong nghề nghiệp.</p><p>- Khám sức khòe, Nghỉ mát hàng năm.</p>', '2018-05-31 00:00:00', 55, NULL, 1, '2018-05-17 02:39:26', '2018-05-17 02:43:35'),
(8, 'Nhân Viên Tổng Đài Tư Vấn Khách Hàng', 'nhan-vien-tong-dai-tu-van-khach-hang', 20, 3, '<p>1. Mô tả công việc:</p><p>• Thực hiện cuộc gọi tư vấn (Outbound) theo dữ liệu khách hàng sẵn có của Công ty.</p><p>• Tiếp nhận thông tin và hỗ trợ kịp thời các thắc mắc của khách hàng.</p><p>• Đặt lịch hẹn dựa trên nhu cầu thực tế của khách hàng (lịch hẹn sẽ do Team Marketing hỗ trợ tư vấn trực tiếp).</p><p>• Lưu trữ dữ liệu trên hệ thống quản lý thông tin khách hàng, chăm sóc khách hàng sau bán hàng.</p><p>2. Thời gian và địa điểm làm việc: </p><p>• Từ 8h30 – 17h30 từ T2 – T6 (T7, CN, ngày Lễ - Tết được nghỉ).</p><p>• Bạn đăng ký làm việc tại 1 trong các chi nhánh của NTV Telecom:</p><p>- V/p trụ sở chính: Tầng 2 - Block C - Cao ốc Vạn Đô 348 Bến Vân Đồn, Phường 1, Quận 4, TPHCM.</p><p>- Chi nhánh II: Tầng 2 tòa nhà SN Việt Nam - Số 139 Hồng Hà, P.9, Q Phú Nhuận, TPHCM.</p><p>- Chi nhánh III: L20, Đường số 14, Khu Dân Cư Him Lam, P Tân Hưng, Q.7, Tp.HCM.</p><p>- Chi nhánh IV: Tầng 2 - Tòa nhà 34T Phố Hoàng Đạo Thúy, Khu đô thị Trung Hòa, Q. Cầu Giấy, TP Hà Nội.</p>', '<p>• Nam / Nữ dưới 35 tuổi.</p><p>• Tốt nghiệp Trung cấp trở lên (Không phân biệt nghành nghề).</p><p>• Bạn yêu thích giao tiếp và muốn phát triển nâng cao ở lĩnh vực Dịch vụ - Khách hàng.</p><p>• Bạn có chất giọng dễ nghe (Không nói ngọng, nói lắp).</p><p>• Bạn sử dụng được tin học văn phòng căn bản.</p><p>• Ứng viên có kinh nghiệm làm việc ở lĩnh vực Bán hàng / Chăm sóc khách hàng là một lợi thế.</p>', 10, 3, 1, 4, 0, 0, 1, 2, '<p>• Được đào tạo từ cơ bản đến nâng cao kỹ năng CSKH / tư vấn bán hàng hiệu quả, Marketing v.v... và nghiệp vụ chuyên môn khi tham gia công việc.</p><p>• Thu nhập khởi điểm từ 5.000.000đ – trên 7.000.000đ dao động cạnh tranh và tương xứng với chất lượng, hiệu quả công việc.</p><p>• Thưởng vào các dịp Lễ - Tết (Lương tháng 13 lên đến x4).</p><p>• Thưởng phong trào hàng Tháng – Quý – Năm cho nhân viên đạt KPI giỏi.</p><p>• Cơ hội thăng tiến lên các cấp quản lý Trưởng nhóm – Giám sát v.v...</p><p>• Được tham gia chế độ theo luật định, các phúc lợi khác do Công ty quy định (Sau khi được ký hợp đồng chính thức).</p><p>• Môi trường làm việc năng động, chuyên nghiệp. Bạn chắc chắn có cơ hội nâng cao kỹ năng chuyên môn và phát triển tại Công ty.</p><p>• Các hoạt động Team Building: Văn nghệ, Thể thao, Du lịch v.v... tổ chức thường niên cho nhân viên.</p>', '2018-05-30 00:00:00', 54, NULL, 1, '2018-05-17 02:46:51', '2018-05-17 02:46:51'),
(9, 'Nhân Viên Hành Chính Văn Phòng', 'nhan-vien-hanh-chinh-van-phong', 5, 3, '<p>- Tư vấn và bán các SP bất động sản do công ty triển khai.</p><p>- Xây dựng mối quan hệ và chăm sóc khách hàng.</p><p>- Cập nhật thị trường báo cáo cho cấp trên định kỳ.</p>', '<p>1. Nam - Nữ từ 18 đến 28 tuổi</p><p>2. Tốt nghiệp từ trung học phổ thông</p><p>3. Ham học hỏi, có chí lớn.</p><p>4. Có kinh nghiệm trong lĩnh vực BĐS là 1 lợi thế. Chưa có kinh nghiệm sẽ được đào tạo, hướng dẫn.&nbsp;</p><p>5. Kỹ năng giao tiếp tốt, tinh thần tự tin.</p><p>6. Sẵn sàng đi làm ngay.</p>', 1, 2, 1, 4, 0, 0, 1, 3, '<p>Các chính sách phúc lợi đầy đủ:</p><p>+ BHYT cao cấp PVI, BHXH, chế độ khám sức khoẻ tổng quát</p><p>+ Khen thưởng lễ và tết hậu hĩnh.</p><p>+ Du lịch trong nước 2 tháng 1 lần và cơ hội đi nước ngoài mỗi năm: HK, Thái Lan, Sing, Nha Trang, Đà Lạt, Phú Quốc, Đà Nẵng.</p><p>+ Được đóng 100% bảo hiểm trên lương thực nhận.</p><p>+ Các phụ cấp hỗ trợ khác…</p>', '2018-05-30 00:00:00', 53, NULL, 1, '2018-05-17 02:53:39', '2018-05-17 02:53:39'),
(10, 'CT TNHH MTV DV HỖ TRỢ KINH DOANH US', 'ct-tnhh-mtv-dv-ho-tro-kinh-doanh-us', 30, 3, '<p>- Dựa trên danh sách được giao, bạn sẽ chịu trách nhiệm thương lượng với khách hàng của đối tác chúng tôi thông qua các cuộc gọi đi/đến về các khoản nợ quá hạn thanh toán</p><p>- Thông báo cho khách hàng nợ về nghĩa vụ trong việc giữ hẹn, ngày đến hạn, số ngày quá hạn, và những tác động tiềm ẩn trong việc trì hoãn thanh toán.</p><p>- Hàng tháng theo dõi và nhắc nhở các thỏa thuận kế hoạch trả nợ với khách hàng nợ.</p><p>- Đảm bảo những nỗ lực trong việc thu hồi các khoản nợ được tiến hành với mức độ nhanh chóng nhất.</p><p>- Truy tìm thông tin khách hàng không thể liên lạc để thu thập thông tin liên lạc mới.</p><p>- Duy trì và cập nhật chính xác thông tin tài khoản nợ bao gồm số điện thoại, địa chỉ mới, tình hình theo dõi, mỗi nỗ lực đã được thực hiện để thu hồi nợ cần được ghi chú đầy đủ</p><p>- Giữ thái độ lịch sự khi nói chuyện với khách hàng nợ và/hoặc bên thứ ba. Đảm bảo các hoạt động thu hồi nợ được thực hiện theo hướng dẫn của Công ty và phù hợp với Chuẩn Mực Đạo Đức thu hồi nợ.</p><p>- Tiếp nhận và xử lý khiếu nại, đảm bảo thời gian giải quyết kịp thời và theo hướng dẫn.</p><p>- Cung cấp phản hồi cho ban quản lý liên quan đến các vấn đề hoặc lĩnh vực cần cải tiến. Đề xuất các kiến nghị để bổ sung quy trình.</p><p>- Hỗ trợ cho việc triển khai / cải tiến hệ thống.</p><p>- Thực hiện các nhiệm vụ khác được giao.</p><p>** Loại công việc: Toàn thời gian: Thứ 2 - Thứ 6: 8:30 – 17:30, Thứ 7: 8:30 – 12:30</p>', '<p>- Tốt nghiệp Trung Cấp trở lên</p><p>- Kỹ năng thương lượng và giải quyết vấn đề.</p><p>- Giọng nói rõ ràng, kỹ năng giao tiếp tốt.</p><p>- Quyết đoán, khả năng đàm phán và thuyết phục khách hàng</p><p>- Có tính trung thực cao.</p><p>- Kỹ năng quản lý thời gian.</p><p>- Có thể giao tiếp hiệu quả bằng Tiếng Việt.</p>', 1, 3, 3, 4, 0, 0, 1, 2, '<p>- Cơ hội tham gia đào tạo cho nhân viên mới.</p><p>- Làm việc trong môi trường tài chính nước ngoài chuyên nghiệp và năng động.</p><p>- Nghỉ phép và nghỉ lễ theo luật lao động hiện hành.</p><p>- Khám sức khỏe định kỳ hàng năm</p><p>- Lương thưởng: 7-15tr/tháng, thưởng theo thành tích từ 2tr-15tr mỗi tháng tùy vào năng lực</p><p>- Thưởng cho nhân viên xuất sắc của tháng, quý, năm</p><p>- Được đánh giá nâng lương định kỳ 6 tháng hoặc 1 năm từ ngày bắt đầu làm việc</p><p>- Có lộ trình thăng tiến rõ ràng (thăng tiến lên vị trí Chuyên Viên / Trưởng Nhóm / Giám Sát)</p><p>- Tham gia các chương trình đào tạo kỹ năng tại USBS</p><p>- Chế độ phúc lợi hấp dẫn: phép 12 ngày/ năm, công ty tổ chức sinh nhật, miễn phí giữ xe, phụ cấp tiền ăn, quần áo, xăng kèm chỉ tiêu</p>', '2018-05-25 00:00:00', 52, NULL, 1, '2018-05-17 02:56:58', '2018-05-17 02:56:58'),
(11, 'Nhân Viên Kinh Doanh Thị Trường Ngành Đồ Uống', 'nhan-vien-kinh-doanh-thi-truong-nganh-do-uong', 5, 3, '<p>Chevalier là 1 nhà nhập khẩu phân phối rượu vang từ năm 2003. Công ty chúng tôi cần tuyển 2 vị trí nhân viên kinh doanh:</p><p>+ Mở rộng &amp; Quản lý và thúc đẩy doanh số bán các sản phẩm rượu vang ở Tp. HCM</p><p>+ Chăm sóc khách hàng và hỗ trợ bộ phận kế toán thu hồi công nơ.</p>', '<p>+ Đã có kinh nghiệm làm kinh doanh ngành hàng đồ uống</p><p>+ Thành thạo word &amp; excel.</p><p>+ Giao tiếp tốt</p>', 1, 2, 3, 7, 0, 0, 1, 3, '<p>- Lương cơ bản 8 - 10 triệu + hoa hồng hấp dẫn=&gt; Thu nhập đảm bảo cao, xứng đáng năng lực làm việc</p><p>- Chế độ bảo hiểm + chính sách phúc lợi đầy đủ</p>', '2018-05-31 00:00:00', 51, NULL, 1, '2018-05-17 03:02:12', '2018-05-17 03:02:12'),
(12, 'Trưởng Phòng Kinh Doanh BĐS', 'truong-phong-kinh-doanh-bds', 1, 3, '<p>- Quản lý các chuyên viên kinh doanh ( từ 12 nvkd trở lên )</p><p>- Kiểm soát &amp; đánh giá các hoạt động hàng ngày của Nhân viên;</p><p>- Chịu trách nhiệm tất cả các hoạt động kinh doanh của phòng phụ trách;</p><p>- Lập kế hoạch kinh doanh dựa trên dự án được giao, đánh giá và xác định thị trường, khách hàng mục tiêu;</p><p>- Đề xuất các giải pháp nhằm giúp hoạt động kinh doanh đi đúng hướng đã định;</p><p>- Dẫn dắt đội nhóm hoàn thành chỉ tiêu chung.</p><p>- Công việc trưởng phòng Sẽ được đào tạo trước khi làm việc.</p>', '<p>- Tốt nghiệp TC/CĐ trở lên và các chuyên ngành có liên quan.</p><p>- Có ít nhất 01 năm kinh nghiệm trong lĩnh tương tự;từng đảm nhiệm qua chức vụ phó phòng, trưởng phòng</p><p>- Có mong muốn tìm kiếm thu nhập cao trong ngành nghề, khát vọng tự làm chủ;</p><p>- Thích ngành Bất động sản;</p><p>- Có khả năng giao tiếp, truyền đạt, thuyết phục tốt;</p><p>- Có khả năng khai thác chăm sóc nhiều nguồn khách hàng khác nhau;</p><p>- Có khả năng học hỏi nhanh, nhiệt tình với công việc.</p><p>- Biết vi tính văn phòng;</p><p>- Kỹ năng lãnh đạo nhân viên.</p><p>- Kỹ năng phân tích, tổng hợp và làm báo cáo;</p><p>- Kỹ năng giao tiếp, huấn luyện và đào tạo đội ngũ nhân viên dưới sự chỉ đạo của cấp trên.</p><p>- Trung thực,nhiệt tình công tác, thái độ làm việc tích cực.</p>', 1, 3, 3, 5, 0, 0, 1, 3, '<p>- Cơ hội định hướng sự nghiệp trở thành chủ trong lĩnh vực BĐS;</p><p>- Được tham gia các buổi huấn luyện do chính lãnh đạo công ty .</p><p>- Môi trường làm việc trẻ trung, thân thiện, năng động và chuyên nghiệp.</p><p>- Thu nhập theo năng lực, hoa hồng hấp dẫn</p><p>- Thưởng nóng, thưởng đột xuất khác theo dự án</p><p>- Thưởng hiệu quả&nbsp;</p><p>- Du lịch trong và ngoài nước hàng năm .</p><p>- Thu nhập tối thiểu: 30-100tr/tháng, bao gồm</p><p>+ Lương căn bản thỏa thuận: lên đến 50 triệu/tháng tuỳ năng lực cá nhân;&nbsp;</p><p>+ Ký HĐLĐ.</p><p>+ Hoa hồng cao trên giao dịch cá nhân;</p><p>+ Thưởng hiệu quả kinh doanh trên từng giao dịch.</p><p>+ Thưởng hiệu quả kinh doanh năm.</p><p>- Cơ hội thăng tiến trở thành Giám đốc chi nhánh sau 01 năm làm việc hiệu quả với mức lương cao.</p><p>- Lương tháng 13, Thưởng tết, lễ, sinh nhật, cưới hỏi,…</p>', '2018-05-25 00:00:00', 50, NULL, 1, '2018-05-17 03:06:02', '2018-05-17 03:06:02'),
(13, 'Kế Toán Tổng Hợp', 'ke-toan-tong-hop', 3, 2, '<p>- Thực hiện nghiệp vụ kế toán, lập báo cáo tài chính theo quy định hệ thống kế toán</p><p>- Lập báo cáo quản trị doanh thu, chi phí, lợi nhuận</p><p>- Khai báo thuế, quyết toán thuế, kiểm tra, theo dõi và lập báo cáo thuế</p><p>- Kiểm tra, đôn đốc thu hồi công nợ khách hàng, đề xuất các phương án thu hồi công nợ</p><p>- Tính bảng lương</p><p>- Thực hiện các nhiệm vụ theo yêu cầu của cấp trên</p>', '<p>- Tốt nghiệp chuyên ngành kế toán.</p><p>- Có kinh nghiệm kế toán ít nhất 3 năm</p><p>- Sử dụng thành thạo máy tính văn phòng</p><p>- Cẩn thận, nhanh nhẹn</p><p>- Kỹ năng giao tiếp, thuyết phục tốt</p>', 1, 2, 3, 5, 0, 0, 1, 3, '<p>- Chế độ: Theo qui định nhà nước BHXH, BHYT &amp; BHTN, xét tăng lương theo năng lực</p><p>- Lương tháng 13, thưởng Lễ, Tết…</p>', '2018-05-25 00:00:00', 49, NULL, 1, '2018-05-17 03:09:31', '2018-05-17 03:09:31'),
(14, 'Nhân Viên Tư Vấn Sức Khỏe Online', 'nhan-vien-tu-van-suc-khoe-online', 10, 2, '<p>- Tìm kiếm khách hàng, nghe trực giải đáp thắc mắc của khách hàng qua điện thoại</p><p>- Đặt lịch cho khách hàng mới và chăm sóc khách hàng cũ</p><p>- Tư vấn online hoặc qua điện thoại cho khách hàng</p>', '<p>- KHÔNG NHẬN Part-time</p><p>- Nam / nữ 18 -30 Tuổi</p><p>- Tốt nghiệp Trung cấp trở lên KHÔNG phân biệt chuyên ngành (kể cả ứng viên vừa tốt nghiệp)</p><p>- Ưu tiên ứng viên theo học các ngành : Y tá, điều dưỡng, hộ lý, và các chuyên ngành liên quan tới y tế.</p><p>- Biết vi tính văn phòng, yêu thích giao tiếp</p><p>- Nhân viên sẽ được đào tạo về nghiệp vụ chuyên môn trong suốt quá trình làm việc tại Công ty.</p><p>- Làm việc nhóm tốt, hòa đồng</p><p>- Nhanh nhẹn, hoạt bát, nghiêm túc</p><p>- Giao tiếp tốt là một lợi thế</p>', 1, 6, 1, 3, 0, 0, 1, 3, '<p>- Lương theo năng lực</p><p>- Lương tháng 13</p><p>- Du lịch</p><p>- Môi trường làm việc tốt, an toàn, thoải mái,văn minh.</p><p>- Làm việc với các bạn trẻ tài năng, cơ hội thăng tiến cao</p><p>- Lên lương 6 tháng 1 lần</p><p>- Hỗ trợ phí cơm trưa</p><p>- CÓ KTX CHO NHÂN VIÊN Ở XA.</p>', '2018-05-25 00:00:00', 48, NULL, 1, '2018-05-17 03:12:09', '2018-05-17 03:12:09'),
(15, 'Kế toán tổng hợp', 'ke-toan-tong-hop-968256', 2, 3, '<p>- Thực hiện nghiệp vụ của kế toán tổng hợp theo yêu cầu được phân công</p><p>- Hạch toán thu nhập, chi phí, khấu hao, TSCĐ, công nợ, nghiệp vụ khác, thuế GTGT và báo cáo quyết toán thuế.</p><p>- Theo dõi doanh thu, công nợ.</p><p>- Lập báo cáo tài chính theo từng quý, 6 tháng, năm và các báo cáo giải trình chi tiết.</p><p>- Hạch toán các nghiệp vụ kế toán.</p><p>- Cung cấp số liệu cho BGĐ hoặc các đơn vị chức năng khi có yêu cầu.</p><p>- Giải trình số liệu và cung cấp hồ sơ, số liệu cho cơ quan thuế, kiểm toán, thanh tra kiểm tra theo yêu cầu.</p><p>- Kiến nghị và đề xuất biện pháp khắc phục cải tiến.</p><p>- Lưu trữ dữ liệu kế toán theo quy định.</p>', '<p>- Trình độ: Cao đẳng trở lên</p><p>- Chuyên ngành: Kế toán.&nbsp;</p><p>- Có kinh nghiệm ít nhất 1 năm trở lên ở vị trí tương đương.</p><p>- Sử dụng thành thạo Vi tính văn phòng &amp; phần mềm chuyên ngành.</p><p>- Có khả năng làm việc nhóm, độc lập, nhanh nhẹn.</p><p>- Sức khỏe tốt.</p><p>- Ưu tiên người biết tiếng Anh giao tiếp.</p>', 1, 2, 3, 3, 0, 0, 1, 3, '<p>- Thu nhập: 6tr trở lên.</p><p>- Môi trường làm việc: năng động, vui vẻ.</p><p>- Cơ hội học hỏi, nâng cao kiến thức.</p><p>- Du lịch trong và ngoài nước.</p>', '2018-06-01 00:00:00', 47, NULL, 1, '2018-05-17 03:15:33', '2018-05-17 03:15:33'),
(16, 'Nhân Viên Digital Marketing', 'nhan-vien-digital-marketing', 2, 1, '<p>- Nắm bắt về công cụ Digital Marketing Online: SEO, SEM, Adwords, banner display, …lựa chọn loại hình nên sử dụng và tiếp cận khách hàng trong mỗi chiến dịch ngắn hạn và dài hạn trên Internet Marketing.</p><p>- Lựa chọn và phối hợp với Agency, các nhà cung cấp phù hợp khi phát sinh yêu cầu.</p><p>- Thành thạo các thông tin chỉ số đánh giá một kế hoạch digital marketing sẽ được triển khai và sau khi triển khai.</p><p>- Thực hiện các công việc liên quan truyền thông online theo sự phân công của cấp trên.</p><p>- Sẽ có phụ cấp thêm cho ứng viên hỗ trợ IT phần mềm.</p>', '<p>- Nam tuổi từ 22 – 28, thành thạo các công cụ Digital Marketing.&nbsp;</p><p>- Có khả năng sử dụng tốt các phần mềm vi tính có liên quan.</p><p>- Ưu tiên ứng viên có kinh nghiệm về It, làm việc trong ngành bán lẻ.</p><p>- Sử dụng thành thạo các công cụ design phục vụ cho công việc</p><p>- Biết và hiểu rõ về wordpress</p>', 1, 2, 3, 6, 0, 0, 1, 3, '<p>- Lương :10-20tr các khoản phụ cấp (thu nhập cao ổn định, có cơ hội thăng tiến).</p><p>- Được đóng BHXH-BHYT-BHTN theo quy định của Nhà nước.</p>', '2018-05-30 00:00:00', 46, NULL, 1, '2018-05-17 03:18:57', '2018-05-17 03:18:57'),
(17, 'Sale BĐS Nhà Phố', 'sale-bds-nha-pho', 20, 3, '<p>- Tìm kiếm thông tin tư vấn giới thiệu sản phẩm nhà phố cho khách hàng đang có nhu cầu mua đầu tư hoặc an cư</p><p>- Giới thiệu, tư vấn, hướng dẫn khách đi xem nhà; kết nối xúc tiến kí kết hợp đồng</p><p>- Chủ động trong việc tìm kiếm nguồn khách hàng tiềm năng</p><p>- Làm việc với đội nhóm để thực hiện các chỉ tiêu theo quý, tháng và năm</p><p>- Chăm sóc và duy trì mối quan hệ khách hàng sau bán hàng</p>', '<p>- Tốt nghiệp Trung cấp trở lên (từ 20 đến 30 tuổi)</p><p>- Ưu tiên có kinh nghiệm và kiến thức về bất động sản,</p><p>- Tự tin trong giao tiếp, thuyết phục và đàm phán</p><p>• Nắm vững kiến thức các sản phẩm công ty đang phân phối</p><p>• Kiên trì và nhiệt tình trong công việc</p>', 1, 1, 3, 10, 50, 70, 1, 3, '<p>- Thu nhập của bạn có thể không giới hạn tùy vào năng lực của bản thân</p><p>- Hoa hồng cao lên đến 70% và các quyền lợi khác</p><p>- Thưởng và hoa hồng, thưởng nóng cực cao;</p><p>- Được đào tạo chuyên môn và kỹ năng làm việc, được cung cấp nguồn hàng</p><p>- Được thường xuyên đào tạo về sản phầm cũng như các kỹ năng mềm để giao tiếp với khách hàng</p><p>- Có cơ hội được thăng tiến lên vị trí cao hơn</p><p>- Được tự do phát triển năng lực cá nhân trong môi trường năng động, đề cao tinh thần tự chủ</p><p>- Thưởng dịp Lễ, Tết, mừng kết hôn, hiếu hỉ, ốm đau, thai sản, hỗ trợ khó khăn..v.v..</p><p>- Tham gia các hoạt động tập thể: bóng đá, tổ chức sinh nhật hàng tháng, Noel, năm mới, liên hoan hàng tháng</p>', '2018-05-30 00:00:00', 45, NULL, 1, '2018-05-17 03:22:25', '2018-05-17 03:22:25'),
(18, 'Huấn Luyện Viên Thể Hình Cá Nhân', 'huan-luyen-vien-the-hinh-ca-nhan', 25, 3, '<p>- Tư vấn cho khách hàng về sức khỏe, chế độ dinh dưỡng cũng như phương pháp tập luyện.</p><p>- Huấn luyện cho khách hàng, đảm bảo cho khách đạt được mục tiêu luyện tập.</p><p>(Tất cả kiến thức chuyên môn cũng như kĩ năng giao tiếp với khách hàng đều được đào tạo một cách chuyên nghiệp).</p>', '<p>- Có niềm đam mê trong lĩnh vực Thể Dục Thể Hình</p><p>- Nếu chưa có kinh nghiệm hoặc mới tốt nghiệp bạn sẽ được hoan nghênh và được đào tạo đầy đủ về các kiến thức cũng như kỹ năng cần thiết để trở thành một HLV Cá nhân (Personal Trainer - PT) trước khi làm việc .)</p><p>- Tính cách: hoạt bát, vui vẻ, hòa đồng, tinh thần lạc quan, tích cực, có mong muốn mang niềm vui đến cho người khác, và có tinh thần không ngừng học hỏi trong công việc.</p>', 1, 8, 1, 4, 0, 0, 1, 3, '<p>- Được tham gia khóa đào tạo trở thành một PT chuyên nghiệp[ hoàn toàn miễn phí (có hỗ trợ thu nhập trong khóa đào tạo).</p><p>- Được tham gia các khóa học kĩ năng chuyên môn cũng như kĩ năng mềm chuyên nghiệp.</p><p>- Được cấp chứng chỉ Huấn Luận Viên Cấp Quốc Tế (NASM)</p><p>- Được làm việc trong môi trường chuyên nghiệp trong lĩnh vực thể dục thể hình</p><p>- Có cơ hội thăng tiến trong công việc và thu nhập cực kì hấp dẫn bao gồm: lương căn bản, lương hoa hồng, lương dạy khách và các khoản lương thưởng khác.</p>', '2018-05-26 00:00:00', 44, NULL, 1, '2018-05-17 03:27:26', '2018-05-17 03:27:26'),
(19, 'Tổng Đài Viên Nhắc Phí', 'tong-dai-vien-nhac-phi', 50, 3, '<p>- Thực hiện các cuộc gọi đến khách hàng để nhắc nhở/ thuyết phục khách hàng thanh toán khoản nợ đến hạn/ quá hạn.</p><p>- Cập nhật thông tin và lý do trễ hạn trên hệ thống đồng thời lưu ý khách hàng về các rủi ro, các khoản phí trễ hạn phát sinh nếu khách hàng chậm thanh toán.</p><p>- Hướng dẫn các kênh thanh toán hữu ích và tiện lợi.&nbsp;</p><p>- Thời gian làm việc: Ca hành chính. OFF 1 ngày/1 tuần</p><p>- Sẽ được trao đổi cụ thể hơn khi phỏng vấn và sẽ được đào tạo trước khi đi làm.</p><p>- Địa chỉ làm việc &amp; phỏng vấn: Chung cư Linh Tây Tower, Đường D1, P. Linh Tây, Quận Thủ Đức.</p>', '<p>- Có thể giao tiếp tốt qua điện thoại: Giọng nói to, rõ ràng, thân thiện.</p><p>- Biết sử dụng vi tính văn phòng cơ bản.</p><p>- Ưu tiên ứng viên tốt nghiệp THPT trở lên.</p><p>- Kỹ năng tư vấn, thuyết phục.</p><p>- Chịu khó, chuyên cần.</p><p>- Nhanh nhẹn, hoạt bát trong công việc.</p><p>- Ưu tiên: Sinh viên mới ra trường, chăm sóc khách hàng qua điện thoại.</p>', 1, 3, 1, 3, 0, 0, 1, 3, '<p>- Lương cứng 3- 5 triệu, thỏa thuận + phụ cấp + hoa hồng (Thu nhập trung bình từ 5 đến 7 triệu / tháng).</p><p>- Được mua bảo hiểm tai nạn.</p><p>- Tham gia BHXH, YT, TN sau khi ký HĐLĐ</p><p>- Khám sức khỏe hằng năm.</p><p>- Được tham hoạt động Teambuilding do Công ty tổ chức hàng năm.</p><p>- Được đào tạo trước khi làm việc.</p><p>- Được hưởng các quyền lợi từ công đoàn (sinh nhật, cưới hỏi, bệnh hiểm nghèo..).</p><p>- Có cơ hội thăng tiến lên các cấp bậc như trưởng nhóm, quản lý...</p>', '2018-05-31 00:00:00', 43, NULL, 1, '2018-05-17 03:30:39', '2018-05-17 03:30:39'),
(20, 'Nhân Viên Bảo Trì Hệ Thống M&E', 'nhan-vien-bao-tri-he-thong-me', 5, 1, '<p>• Chịu trách nhiệm bảo hành, bảo dưỡng để đảm bảo hệ thống M&amp;E điện, nhiệt lạnh, PCCC, cấp thoát nước của toà nhà được hoạt động tốt.</p><p>• Vệ sinh, sửa chữa các hệ thống và xử lý các vấn đề phát sinh; đảm bảo tiến độ, chất lượng.</p>', '<p>• Yêu cầu giới tính: Nam</p><p>• Yêu cầu độ tuổi: trên 22</p><p>Yêu cầu khác<br></p><p>• Tốt nghiệp TRUNG CẤP/CAO ĐẲNG hoặc Đại học về Điện, nhiêt lạnh, cấp thoát nước&nbsp;</p><p>• Có kinh nghiệm 1 năm.</p><p>• Tinh thần trách nhiệm cao và sẵn sàng thêm giờ vào các ngày cuối tuần để hoàn thành các công việc chưa xong hoặc yêu cầu cấp bách.</p><p>• Chi tiết công việc và mức lương sẽ trao đổi cụ thể khi phỏng vấn .</p>', 1, 3, 3, 4, 0, 0, 1, 3, '<p>- Mức lương thỏa thuận theo năng lực của ứng viên (5-10 triệu)</p><p>- Được hưởng đầy đủ chế độ theo nhà nước quy định</p><p>- Được làm việc trong môi trường chuyên nghiệp</p><p>- Lương thỏa thuận theo năng lực</p><p>- Được làm việc trong môi trường chuyên nghiệp</p><p>- Tăng lương hàng năm, thưởng các dịp lễ, tết, lương tháng 13</p><p>- Chế độ khác: hỗ trợ tiền ăn trưa, phụ cấp xăng, phụ cấp công trình.</p>', '2018-05-31 00:00:00', 42, NULL, 1, '2018-05-17 03:33:48', '2018-05-17 03:33:48'),
(21, 'Nữ Nhân Viên Phụ Kho - Làm Việc Tại Q2', 'nu-nhan-vien-phu-kho-lam-viec-tai-q2', 2, 2, '<p>- Sắp xếp hàng hóa tại kho ( hàng hóa nhẹ)</p><p>- Chuẩn bị hàng hóa theo yêu cầu của quản lý kho</p>', '<p>- Chăm chỉ</p><p>- Trung thực</p>', 1, 8, 1, 2, 0, 0, 1, 2, '<p>- Làm việc tại quận 2 ( gần Metro An Phú)</p><p>- Có cơ hội thăng tiến</p><p>- Lương 4,5tr - 5tr tùy vào năng lực làm việc</p>', '2018-05-31 00:00:00', 41, NULL, 1, '2018-05-17 03:36:30', '2018-05-17 03:36:30'),
(22, 'Nhân Viên Biên Tập Viết Bài Trên Website', 'nhan-vien-bien-tap-viet-bai-tren-website', 5, 3, '<p>- Viết nội dung cho website về lĩnh vực sức khỏe y tế</p><p>- Lập kế hoạch, hỗ trợ lên ý tưởng cho bài viết</p><p>* Edit nội dung, chính tả, ngữ pháp cho các thông tin, tài liệu của công ty.</p><p>- Phụ trách tìm kiếm thông tin, tin tức, cập nhật lên trang tin của công ty&nbsp;</p><p>- Biên tập tiêu đề tin, hướng nội dung thông tin đến từng người đọc</p><p>- Phụ trách biên tập, kiểm soát nội dung&nbsp;</p><p>- Hoạch định nội dung, xây dựng chiến lược nội dung cho trang tin</p><p>- Các công việc khác theo sự phân công của cấp trên</p>', '<p>- Sử dụng thật sự thành thạo, thao tác nhanh nhẹn với máy tính: Thành thạo với word, gõ văn bản, kỹ năng thao tác với máy tính ở mức cao.</p><p>- Có tính kiên trì, chịu khó, yêu thích công việc, có trách nhiệm...</p><p>- Khả năng tư duy nhanh nhẹn, tìm kiếm, học hỏi nhanh.</p><p>- Có mong muốn chứng tỏ bản thân.</p><p>- Yêu thích tham gia các cộng đồng mạng.</p><p>- Thích làm việc tại công ty có môi trường trẻ năng động.</p><p>- Biết tiếng Hoa (Trung) càng tốt</p><p>* Am hiểu về bài viết SEO là một lợi thế vô cùng to lớn .</p><p>* Ưu tiên đã từng viết các bài viết về quảng cáo marketing online</p>', 1, 3, 2, 3, 0, 0, 1, 3, '<p>- Bảo hiểm theo quy định</p><p>- Xét tăng lương 6 tháng 1 lần</p><p>- Hỗ trợ phí cơm trưa</p><p>- Thưởng doanh số, thưởng nhóm</p><p>- Thưởng chuyên cần</p><p>- Lương tháng 13</p><p>- Miễn phí gửi xe</p><p>- Thời gian làm việc 7,5h/ngày</p><p>- Du lịch</p>', '2018-05-29 00:00:00', 40, NULL, 1, '2018-05-17 03:39:27', '2018-05-17 03:39:27'),
(23, 'Chuyên Viên Phát Triển Cơ Sở Hạ Tầng', 'chuyen-vien-phat-trien-co-so-ha-tang', 2, 1, '<p>- Tìm kiếm và chốt hợp đồng thuê kho bãi theo quy trình để đáp ứng nhu cầu mở rộng inside GHN.</p><p>- Thiết kế hệ thống điện, nước, nhà vệ sinh, internet theo nhu cầu Inside GHN và đảm bảo kĩ thuật.</p><p>- Thiết kế hệ thống PCCC và phương án xử lý rủi ro cháy nổ trong kho.</p><p>- Tìm kiếm đối tác thi công đáp ứng nhu cầu kĩ thuật.</p><p>- Giám sát nhà thầu thi công các hạng mục hạ tầng.</p><p>- Nghiệm thu kết quả thi công các hạng mục hạ tầng theo thiết kế ban đầu.</p>', '<p>- Tốt nghiệm Cao đẳng/ Đại học chuyên ngành Thiết kế hạ tầng công nghiệp, điện công nghiệp,</p><p>- Thành thạo tin học văn phòng.</p><p>- Có khả năng thiết kế hệ thống điện và cơ sở hạ tầng.</p><p>- Luôn sáng tạo, đổi mới trong công việc.</p><p>- Có kỹ năng giám sát và quản lý dự án.</p><p>- Có ít nhất 2 năm kinh nghiệm ở vị trí tương đương.</p>', 1, 2, 4, 6, 0, 0, 1, 2, '<p>* Cơ hội huấn luyện:</p><p>- Được tham gia các khóa đào tạo chuyên môn tại công ty.</p><p>- Được hướng dẫn tận tình, chu đáo.</p><p><br></p><p>* Đồng nghiệp:</p><p>- Vui vẻ, thân thiện, hòa đồng, ...</p><p>- Sẵn sàng hỗ trợ để team cùng đạt kết quả tốt</p><p>- Sẵn sàng hướng dẫn tận tình những nhiệm vụ được giao</p><p>* Phúc lợi:<br></p><p>- Được tham gia các chế độ BHYT, BHXH, BHTN,...</p><p>- Thưởng theo năng lực làm việc</p><p>- Khám chữa bệnh định kỳ hằng năm</p><p>- Tham gia các chương trình company trip, team buiding,...</p><p>- Các chính sách phúc lợi khác</p>', '2018-06-30 00:00:00', 39, NULL, 1, '2018-05-17 03:54:26', '2018-05-17 03:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_job`
--

DROP TABLE IF EXISTS `recruitment_job`;
CREATE TABLE `recruitment_job` (
  `id` bigint(20) NOT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recruitment_job`
--

INSERT INTO `recruitment_job` (`id`, `recruitment_id`, `job_id`, `created_at`, `updated_at`) VALUES
(5, 1, 4, '2018-05-16 08:56:52', '2018-05-16 08:56:52'),
(6, 1, 5, '2018-05-16 08:56:52', '2018-05-16 08:56:52'),
(7, 1, 56, '2018-05-16 08:56:52', '2018-05-16 08:56:52'),
(8, 2, 15, '2018-05-17 02:02:43', '2018-05-17 02:02:43'),
(9, 2, 42, '2018-05-17 02:02:43', '2018-05-17 02:02:43'),
(10, 2, 47, '2018-05-17 02:02:43', '2018-05-17 02:02:43'),
(11, 3, 1, '2018-05-17 02:14:48', '2018-05-17 02:14:48'),
(12, 3, 9, '2018-05-17 02:14:48', '2018-05-17 02:14:48'),
(13, 3, 18, '2018-05-17 02:14:48', '2018-05-17 02:14:48'),
(14, 4, 5, '2018-05-17 02:20:45', '2018-05-17 02:20:45'),
(15, 4, 12, '2018-05-17 02:20:45', '2018-05-17 02:20:45'),
(16, 4, 33, '2018-05-17 02:20:45', '2018-05-17 02:20:45'),
(17, 5, 9, '2018-05-17 02:26:26', '2018-05-17 02:26:26'),
(18, 5, 18, '2018-05-17 02:26:26', '2018-05-17 02:26:26'),
(19, 5, 43, '2018-05-17 02:26:26', '2018-05-17 02:26:26'),
(20, 6, 1, '2018-05-17 02:34:49', '2018-05-17 02:34:49'),
(21, 6, 2, '2018-05-17 02:34:49', '2018-05-17 02:34:49'),
(22, 6, 7, '2018-05-17 02:34:49', '2018-05-17 02:34:49'),
(23, 7, 3, '2018-05-17 02:39:26', '2018-05-17 02:39:26'),
(24, 7, 14, '2018-05-17 02:39:26', '2018-05-17 02:39:26'),
(25, 7, 53, '2018-05-17 02:39:26', '2018-05-17 02:39:26'),
(26, 8, 1, '2018-05-17 02:46:52', '2018-05-17 02:46:52'),
(27, 8, 2, '2018-05-17 02:46:52', '2018-05-17 02:46:52'),
(28, 8, 3, '2018-05-17 02:46:52', '2018-05-17 02:46:52'),
(29, 9, 1, '2018-05-17 02:53:39', '2018-05-17 02:53:39'),
(30, 9, 2, '2018-05-17 02:53:39', '2018-05-17 02:53:39'),
(31, 9, 12, '2018-05-17 02:53:39', '2018-05-17 02:53:39'),
(32, 10, 3, '2018-05-17 02:56:58', '2018-05-17 02:56:58'),
(33, 10, 30, '2018-05-17 02:56:58', '2018-05-17 02:56:58'),
(34, 10, 33, '2018-05-17 02:56:58', '2018-05-17 02:56:58'),
(35, 11, 1, '2018-05-17 03:02:12', '2018-05-17 03:02:12'),
(36, 11, 2, '2018-05-17 03:02:12', '2018-05-17 03:02:12'),
(37, 11, 39, '2018-05-17 03:02:12', '2018-05-17 03:02:12'),
(38, 12, 1, '2018-05-17 03:06:02', '2018-05-17 03:06:02'),
(39, 12, 12, '2018-05-17 03:06:02', '2018-05-17 03:06:02'),
(40, 12, 42, '2018-05-17 03:06:02', '2018-05-17 03:06:02'),
(41, 13, 5, '2018-05-17 03:09:31', '2018-05-17 03:09:31'),
(42, 13, 33, '2018-05-17 03:09:31', '2018-05-17 03:09:31'),
(43, 13, 42, '2018-05-17 03:09:31', '2018-05-17 03:09:31'),
(44, 14, 3, '2018-05-17 03:12:09', '2018-05-17 03:12:09'),
(45, 14, 7, '2018-05-17 03:12:09', '2018-05-17 03:12:09'),
(46, 14, 56, '2018-05-17 03:12:09', '2018-05-17 03:12:09'),
(47, 15, 5, '2018-05-17 03:15:33', '2018-05-17 03:15:33'),
(48, 16, 8, '2018-05-17 03:18:57', '2018-05-17 03:18:57'),
(49, 16, 15, '2018-05-17 03:18:57', '2018-05-17 03:18:57'),
(50, 17, 1, '2018-05-17 03:22:25', '2018-05-17 03:22:25'),
(51, 17, 2, '2018-05-17 03:22:25', '2018-05-17 03:22:25'),
(52, 17, 12, '2018-05-17 03:22:25', '2018-05-17 03:22:25'),
(53, 18, 4, '2018-05-17 03:27:26', '2018-05-17 03:27:26'),
(54, 18, 22, '2018-05-17 03:27:26', '2018-05-17 03:27:26'),
(55, 18, 46, '2018-05-17 03:27:26', '2018-05-17 03:27:26'),
(56, 19, 1, '2018-05-17 03:30:39', '2018-05-17 03:30:39'),
(57, 19, 2, '2018-05-17 03:30:39', '2018-05-17 03:30:39'),
(58, 19, 3, '2018-05-17 03:30:39', '2018-05-17 03:30:39'),
(59, 20, 9, '2018-05-17 03:33:48', '2018-05-17 03:33:48'),
(60, 20, 18, '2018-05-17 03:33:48', '2018-05-17 03:33:48'),
(61, 20, 54, '2018-05-17 03:33:48', '2018-05-17 03:33:48'),
(62, 21, 5, '2018-05-17 03:36:30', '2018-05-17 03:36:30'),
(63, 21, 26, '2018-05-17 03:36:30', '2018-05-17 03:36:30'),
(64, 22, 6, '2018-05-17 03:39:27', '2018-05-17 03:39:27'),
(65, 22, 8, '2018-05-17 03:39:27', '2018-05-17 03:39:27'),
(66, 22, 10, '2018-05-17 03:39:27', '2018-05-17 03:39:27'),
(67, 23, 18, '2018-05-17 03:54:26', '2018-05-17 03:54:26'),
(68, 23, 47, '2018-05-17 03:54:26', '2018-05-17 03:54:26'),
(69, 23, 50, '2018-05-17 03:54:26', '2018-05-17 03:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_place`
--

DROP TABLE IF EXISTS `recruitment_place`;
CREATE TABLE `recruitment_place` (
  `id` bigint(20) NOT NULL,
  `recruitment_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recruitment_place`
--

INSERT INTO `recruitment_place` (`id`, `recruitment_id`, `province_id`, `created_at`, `updated_at`) VALUES
(5, 1, 23, '2018-05-16 08:56:52', '2018-05-16 08:56:52'),
(6, 2, 23, '2018-05-17 02:02:43', '2018-05-17 02:02:43'),
(7, 3, 23, '2018-05-17 02:14:48', '2018-05-17 02:14:48'),
(8, 4, 23, '2018-05-17 02:20:45', '2018-05-17 02:20:45'),
(9, 5, 23, '2018-05-17 02:26:26', '2018-05-17 02:26:26'),
(10, 6, 23, '2018-05-17 02:34:49', '2018-05-17 02:34:49'),
(11, 7, 23, '2018-05-17 02:39:26', '2018-05-17 02:39:26'),
(12, 8, 17, '2018-05-17 02:46:52', '2018-05-17 02:46:52'),
(13, 8, 23, '2018-05-17 02:46:52', '2018-05-17 02:46:52'),
(14, 9, 23, '2018-05-17 02:53:39', '2018-05-17 02:53:39'),
(15, 10, 23, '2018-05-17 02:56:58', '2018-05-17 02:56:58'),
(16, 11, 23, '2018-05-17 03:02:12', '2018-05-17 03:02:12'),
(17, 12, 23, '2018-05-17 03:06:02', '2018-05-17 03:06:02'),
(18, 13, 23, '2018-05-17 03:09:31', '2018-05-17 03:09:31'),
(19, 14, 23, '2018-05-17 03:12:09', '2018-05-17 03:12:09'),
(20, 15, 23, '2018-05-17 03:15:33', '2018-05-17 03:15:33'),
(21, 16, 23, '2018-05-17 03:18:57', '2018-05-17 03:18:57'),
(22, 17, 23, '2018-05-17 03:22:25', '2018-05-17 03:22:25'),
(23, 18, 17, '2018-05-17 03:27:26', '2018-05-17 03:27:26'),
(24, 19, 23, '2018-05-17 03:30:39', '2018-05-17 03:30:39'),
(25, 20, 23, '2018-05-17 03:33:48', '2018-05-17 03:33:48'),
(26, 21, 23, '2018-05-17 03:36:30', '2018-05-17 03:36:30'),
(27, 22, 23, '2018-05-17 03:39:27', '2018-05-17 03:39:27'),
(28, 23, 23, '2018-05-17 03:54:26', '2018-05-17 03:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dưới 3 triệu', 'duoi-3-trieu', 1, 1, '2018-04-12 07:00:00', '2018-04-12 07:00:00'),
(2, '3 - 5 triệu', '3-5-trieu', 1, 1, '2018-04-12 07:00:10', '2018-04-12 07:00:10'),
(3, '5 - 7 triệu', '5-7-trieu', 1, 1, '2018-04-12 07:00:21', '2018-04-12 07:00:21'),
(4, '7 - 10 triệu', '7-10-trieu', 1, 1, '2018-04-12 07:00:31', '2018-04-12 07:00:31'),
(5, '10 - 12 triệu', '10-12-trieu', 1, 1, '2018-04-12 07:00:43', '2018-04-12 07:00:43'),
(6, '12 -  15 triệu', '12-15-trieu', 1, 1, '2018-04-12 07:01:01', '2018-04-12 07:01:01'),
(7, '15 - 20 triệu', '15-20-trieu', 1, 1, '2018-04-12 07:01:12', '2018-04-12 07:01:12'),
(8, '20 -  25 triệu', '20-25-trieu', 1, 1, '2018-04-12 07:01:23', '2018-04-12 07:01:23'),
(9, '25 - 30 triệu', '25-30-trieu', 1, 1, '2018-04-12 07:01:37', '2018-04-12 07:01:37'),
(10, 'Trên 30 triệu', 'tren-30-trieu', 1, 1, '2018-04-12 07:01:48', '2018-04-12 07:01:48'),
(11, 'Trao đổi trực tiếp khi phỏng vấn', 'trao-doi-truc-tiep-khi-phong-van', 1, 1, '2018-04-13 04:29:58', '2018-04-13 04:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `scale`
--

DROP TABLE IF EXISTS `scale`;
CREATE TABLE `scale` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `scale`
--

INSERT INTO `scale` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Trên 500 người', 'tren-500-nguoi', 1, 1, '2018-04-01 15:45:09', '2018-04-01 15:46:55'),
(2, '200 - 500 người', '200-500-nguoi', 2, 1, '2018-04-01 15:45:49', '2018-04-01 15:45:49'),
(3, '100 - 200 người', '100-200-nguoi', 3, 1, '2018-04-01 15:46:00', '2018-04-01 15:46:00'),
(4, '50 - 100 người', '50-100-nguoi', 4, 1, '2018-04-01 15:46:12', '2018-04-01 15:46:55'),
(5, '20 - 50 người', '20-50-nguoi', 5, 1, '2018-04-01 15:47:12', '2018-04-01 15:47:12'),
(6, 'Dưới 20 người', 'duoi-20-nguoi', 6, 1, '2018-04-01 15:47:25', '2018-04-01 15:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `setting_system`
--

DROP TABLE IF EXISTS `setting_system`;
CREATE TABLE `setting_system` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `title` text,
  `meta_keyword` text,
  `meta_description` text,
  `author` varchar(255) DEFAULT NULL,
  `copyright` text,
  `google_site_verification` text,
  `google_analytics` text,
  `logo_frontend` text,
  `favicon` varchar(255) DEFAULT NULL,
  `setting` text,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting_system`
--

INSERT INTO `setting_system` (`id`, `fullname`, `alias`, `title`, `meta_keyword`, `meta_description`, `author`, `copyright`, `google_site_verification`, `google_analytics`, `logo_frontend`, `favicon`, `setting`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'settingsystem', 'setting-system', 'Laptop cũ giá rẻ uy tín, chất lượng nhất tại Tphcm | FHP', 'máy tính,  laptop cũ,', 'Bán lẻ máy tính, laptop cũ, mới trên toàn quốc, FHP là một trong những thương hiệu có tiếng lâu đời về các sản phẩm công nghệ như laptop cũ giá rẻ, phụ kiện laptop...', '', '', 'KlLQ51IBlGdopyRBTBG-QMPgj7Il9xduiEBGFkgo4nQ', 'UA-115473299-1', 'logo.png', 'favicon.ico', '[{\"field_name\":\"Số bài viết trên 1 trang\",\"field_code\":\"article_perpage\",\"field_value\":\"10\"},{\"field_name\":\"Độ rộng hình bài viết\",\"field_code\":\"article_width\",\"field_value\":\"400\"},{\"field_name\":\"Độ cao hình bài viết\",\"field_code\":\"article_height\",\"field_value\":\"250\"},{\"field_name\":\"Số sản phẩm trên 1 trang\",\"field_code\":\"product_perpage\",\"field_value\":\"32\"},{\"field_name\":\"Độ rộng hình sản phẩm\",\"field_code\":\"product_width\",\"field_value\":\"300\"},{\"field_name\":\"Độ cao hình sản phẩm\",\"field_code\":\"product_height\",\"field_value\":\"300\"},{\"field_name\":\"Đơn vị tiền tệ\",\"field_code\":\"currency_unit\",\"field_value\":\"vi_VN\"},{\"field_name\":\"MERCHANT_ID\",\"field_code\":\"merchant_id\",\"field_value\":\"36680\"},{\"field_name\":\"MERCHANT_PASS\",\"field_code\":\"merchant_pass\",\"field_value\":\"matkhauketnoi\"},{\"field_name\":\"RECEIVER\",\"field_code\":\"receiver\",\"field_value\":\"demo@nganluong.vn\"},{\"field_name\":\"Smtp host\",\"field_code\":\"smtp_host\",\"field_value\":\"smtp.gmail.com\"},{\"field_name\":\"Smtp port\",\"field_code\":\"smtp_port\",\"field_value\":\"465\"},{\"field_name\":\"Smtp authication\",\"field_code\":\"authentication\",\"field_value\":\"1\"},{\"field_name\":\"Encription\",\"field_code\":\"encription\",\"field_value\":\"ssl\"},{\"field_name\":\"Smtp username\",\"field_code\":\"smtp_username\",\"field_value\":\"dien.toannang@gmail.com\"},{\"field_name\":\"Smtp password\",\"field_code\":\"smtp_password\",\"field_value\":\"bjsdgetadsutdono\"},{\"field_name\":\"Email to\",\"field_code\":\"email_to\",\"field_value\":\"tichtacso.com@gmail.com\"},{\"field_name\":\"Contact person\",\"field_code\":\"contacted_person\",\"field_value\":\"Huỳnh Thúc Vinh\"},{\"field_name\":\"Trụ sở\",\"field_code\":\"address\",\"field_value\":\"50/2/59 Dương Quảng Hàm, Phường 5, Quận Gò Vấp\"},{\"field_name\":\"Hotline\",\"field_code\":\"telephone\",\"field_value\":\"0902.90.74.75\"},{\"field_name\":\"Facebook\",\"field_code\":\"facebook_url\",\"field_value\":\"https://www.facebook.com/nguyenvan.laptrinh\"},{\"field_name\":\"Twitter\",\"field_code\":\"twitter_url\",\"field_value\":\"https://twitter.com/\"},{\"field_name\":\"Google Plus\",\"field_code\":\"google_plus\",\"field_value\":\"https://plus.google.com/u/0/?hl=vi\"},{\"field_name\":\"Youtube\",\"field_code\":\"youtube_url\",\"field_value\":\"https://www.youtube.com/watch?v=kAcV7S3sySU\"},{\"field_name\":\"Instagram\",\"field_code\":\"instagram_url\",\"field_value\":\"http://flickr.com\"},{\"field_name\":\"Pinterest\",\"field_code\":\"pinterest_url\",\"field_value\":\"http://daidung.vn/\"},{\"field_name\":\"Map\",\"field_code\":\"map_url\",\"field_value\":\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.7765505259867!2d106.68751671435092!3d10.828404792286284!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528f0d3be7c47%3A0x3f95e11384c4817f!2zNTAgRMawxqFuZyBRdeG6o25nIEjDoG0sIHBoxrDhu51uZyA1LCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5oLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1515998374369\"},{\"field_name\":\"Giờ giao dịch\",\"field_code\":\"opened_time\",\"field_value\":\"7:00 - 22:30\"}]', 1, 1, '2017-12-03 07:45:35', '2018-04-05 01:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

DROP TABLE IF EXISTS `sex`;
CREATE TABLE `sex` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nam', 'nam', 1, 1, '2018-04-05 03:35:41', '2018-04-05 03:35:41'),
(2, 'Nữ', 'nu', 2, 1, '2018-04-05 03:35:48', '2018-04-05 03:35:53'),
(3, 'Không yêu cầu', 'khong-yeu-cau', 3, 1, '2018-04-12 06:35:12', '2018-04-12 07:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lãnh đạo', 'lanh-dao', 1, 1, '2018-04-27 18:11:33', '2018-04-27 18:11:33'),
(2, 'Làm việc nhóm', 'lam-viec-nhom', 1, 1, '2018-04-27 18:11:43', '2018-04-27 18:11:43'),
(3, 'Quản lý chiến lược', 'quan-ly-chien-luoc', 1, 1, '2018-04-27 18:11:56', '2018-04-27 18:11:56'),
(4, 'Giải quyết vấn đề', 'giai-quyet-van-de', 1, 1, '2018-04-27 18:12:07', '2018-04-27 18:12:07'),
(5, 'Ra quyết định', 'ra-quyet-dinh', 1, 1, '2018-04-27 18:12:15', '2018-04-27 18:12:15'),
(6, 'Quản lý dự án', 'quan-ly-du-an', 1, 1, '2018-04-27 18:12:25', '2018-04-27 18:12:25'),
(7, 'Quản lý thời gian', 'quan-ly-thoi-gian', 1, 1, '2018-04-27 18:12:34', '2018-04-27 18:12:34'),
(8, 'Quản lý stress', 'quan-ly-stress', 1, 1, '2018-04-27 18:12:43', '2018-04-27 18:12:43'),
(9, 'Quản lý giao tiếp', 'quan-ly-giao-tiep', 1, 1, '2018-04-27 18:12:56', '2018-04-27 18:12:56'),
(10, 'Quản lý sáng tạo', 'quan-ly-sang-tao', 1, 1, '2018-04-27 18:13:16', '2018-04-27 18:13:16'),
(11, 'Học hiệu quả', 'hoc-hieu-qua', 1, 1, '2018-04-27 18:13:28', '2018-04-27 18:13:28'),
(12, 'Nghề nghiệp', 'nghe-nghiep', 1, 1, '2018-04-27 18:13:36', '2018-04-27 18:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `supporter`
--

DROP TABLE IF EXISTS `supporter`;
CREATE TABLE `supporter` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_money` decimal(11,0) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supporter`
--

INSERT INTO `supporter` (`id`, `fullname`, `number_money`, `payment_method_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Nguyễn Thị Thu Hằng', '1000000', 1, 1, 1, '2018-01-07 17:32:50', '2018-01-07 17:47:21'),
(7, 'Trần Gia Lạc', '2000000', 2, 2, 1, '2018-01-07 18:02:15', '2018-01-08 07:19:18'),
(8, 'Lê Văn Đại', '2000000', 1, 3, 1, '2018-01-08 02:38:56', '2018-01-08 09:29:07'),
(9, 'Nguyễn Mạnh Hùng', '3000000', 2, 4, 1, '2018-01-08 02:39:19', '2018-01-08 02:39:19'),
(10, 'Trần Tiến Dư', '3000000', 2, 5, 1, '2018-01-08 02:39:35', '2018-01-08 02:39:35');

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2017-11-12 07:00:10', '2017-11-12 07:00:10'),
(2, NULL, 'ip', '127.0.0.1', '2017-11-12 07:00:10', '2017-11-12 07:00:10'),
(3, NULL, 'global', NULL, '2017-11-12 07:00:22', '2017-11-12 07:00:22'),
(4, NULL, 'ip', '127.0.0.1', '2017-11-12 07:00:22', '2017-11-12 07:00:22'),
(5, NULL, 'global', NULL, '2017-11-12 07:00:36', '2017-11-12 07:00:36'),
(6, NULL, 'ip', '127.0.0.1', '2017-11-12 07:00:36', '2017-11-12 07:00:36'),
(7, NULL, 'global', NULL, '2017-11-12 07:05:02', '2017-11-12 07:05:02'),
(8, NULL, 'ip', '127.0.0.1', '2017-11-12 07:05:02', '2017-11-12 07:05:02'),
(9, NULL, 'global', NULL, '2017-11-12 07:30:11', '2017-11-12 07:30:11'),
(10, NULL, 'ip', '127.0.0.1', '2017-11-12 07:30:11', '2017-11-12 07:30:11'),
(11, NULL, 'global', NULL, '2017-11-12 07:32:49', '2017-11-12 07:32:49'),
(12, NULL, 'ip', '127.0.0.1', '2017-11-12 07:32:49', '2017-11-12 07:32:49'),
(13, NULL, 'global', NULL, '2017-11-12 07:39:23', '2017-11-12 07:39:23'),
(14, NULL, 'ip', '127.0.0.1', '2017-11-12 07:39:23', '2017-11-12 07:39:23'),
(15, NULL, 'global', NULL, '2017-11-12 07:55:42', '2017-11-12 07:55:42'),
(16, NULL, 'ip', '127.0.0.1', '2017-11-12 07:55:42', '2017-11-12 07:55:42'),
(17, NULL, 'global', NULL, '2017-11-12 07:59:33', '2017-11-12 07:59:33'),
(18, NULL, 'ip', '127.0.0.1', '2017-11-12 07:59:33', '2017-11-12 07:59:33'),
(19, NULL, 'global', NULL, '2017-11-12 08:01:13', '2017-11-12 08:01:13'),
(20, NULL, 'ip', '127.0.0.1', '2017-11-12 08:01:13', '2017-11-12 08:01:13'),
(21, NULL, 'global', NULL, '2017-11-12 08:01:34', '2017-11-12 08:01:34'),
(22, NULL, 'ip', '127.0.0.1', '2017-11-12 08:01:34', '2017-11-12 08:01:34'),
(23, NULL, 'global', NULL, '2017-11-12 08:01:41', '2017-11-12 08:01:41'),
(24, NULL, 'ip', '127.0.0.1', '2017-11-12 08:01:41', '2017-11-12 08:01:41'),
(25, NULL, 'global', NULL, '2017-11-12 08:02:05', '2017-11-12 08:02:05'),
(26, NULL, 'ip', '127.0.0.1', '2017-11-12 08:02:05', '2017-11-12 08:02:05'),
(27, NULL, 'global', NULL, '2017-11-12 08:12:23', '2017-11-12 08:12:23'),
(28, NULL, 'ip', '127.0.0.1', '2017-11-12 08:12:23', '2017-11-12 08:12:23'),
(29, NULL, 'global', NULL, '2017-11-12 08:18:51', '2017-11-12 08:18:51'),
(30, NULL, 'ip', '127.0.0.1', '2017-11-12 08:18:51', '2017-11-12 08:18:51'),
(31, NULL, 'global', NULL, '2017-11-12 08:19:22', '2017-11-12 08:19:22'),
(32, NULL, 'ip', '127.0.0.1', '2017-11-12 08:19:22', '2017-11-12 08:19:22'),
(33, NULL, 'global', NULL, '2017-11-12 08:34:38', '2017-11-12 08:34:38'),
(34, NULL, 'ip', '127.0.0.1', '2017-11-12 08:34:38', '2017-11-12 08:34:38'),
(35, NULL, 'global', NULL, '2017-11-12 10:21:38', '2017-11-12 10:21:38'),
(36, NULL, 'ip', '127.0.0.1', '2017-11-12 10:21:38', '2017-11-12 10:21:38'),
(37, NULL, 'global', NULL, '2017-11-12 10:38:16', '2017-11-12 10:38:16'),
(38, NULL, 'ip', '127.0.0.1', '2017-11-12 10:38:16', '2017-11-12 10:38:16'),
(39, 1, 'user', NULL, '2017-11-12 10:38:16', '2017-11-12 10:38:16'),
(40, NULL, 'global', NULL, '2017-11-12 10:39:37', '2017-11-12 10:39:37'),
(41, NULL, 'ip', '127.0.0.1', '2017-11-12 10:39:37', '2017-11-12 10:39:37'),
(42, 1, 'user', NULL, '2017-11-12 10:39:37', '2017-11-12 10:39:37'),
(43, NULL, 'global', NULL, '2017-11-12 10:58:13', '2017-11-12 10:58:13'),
(44, NULL, 'ip', '127.0.0.1', '2017-11-12 10:58:13', '2017-11-12 10:58:13'),
(45, NULL, 'global', NULL, '2017-11-12 10:59:19', '2017-11-12 10:59:19'),
(46, NULL, 'ip', '127.0.0.1', '2017-11-12 10:59:19', '2017-11-12 10:59:19'),
(47, 4, 'user', NULL, '2017-11-12 10:59:19', '2017-11-12 10:59:19'),
(48, NULL, 'global', NULL, '2017-11-12 11:00:10', '2017-11-12 11:00:10'),
(49, NULL, 'ip', '127.0.0.1', '2017-11-12 11:00:10', '2017-11-12 11:00:10'),
(50, 4, 'user', NULL, '2017-11-12 11:00:10', '2017-11-12 11:00:10'),
(51, NULL, 'global', NULL, '2017-11-12 11:04:27', '2017-11-12 11:04:27'),
(52, NULL, 'ip', '127.0.0.1', '2017-11-12 11:04:27', '2017-11-12 11:04:27'),
(53, 4, 'user', NULL, '2017-11-12 11:04:27', '2017-11-12 11:04:27'),
(54, NULL, 'global', NULL, '2017-11-12 11:05:04', '2017-11-12 11:05:04'),
(55, NULL, 'ip', '127.0.0.1', '2017-11-12 11:05:04', '2017-11-12 11:05:04'),
(56, 1, 'user', NULL, '2017-11-12 11:05:04', '2017-11-12 11:05:04'),
(57, NULL, 'global', NULL, '2017-11-12 11:08:43', '2017-11-12 11:08:43'),
(58, NULL, 'ip', '127.0.0.1', '2017-11-12 11:08:43', '2017-11-12 11:08:43'),
(59, 1, 'user', NULL, '2017-11-12 11:08:43', '2017-11-12 11:08:43'),
(60, NULL, 'global', NULL, '2017-11-12 11:14:37', '2017-11-12 11:14:37'),
(61, NULL, 'ip', '127.0.0.1', '2017-11-12 11:14:37', '2017-11-12 11:14:37'),
(62, 1, 'user', NULL, '2017-11-12 11:14:37', '2017-11-12 11:14:37'),
(63, NULL, 'global', NULL, '2017-11-12 11:18:13', '2017-11-12 11:18:13'),
(64, NULL, 'ip', '127.0.0.1', '2017-11-12 11:18:13', '2017-11-12 11:18:13'),
(65, 4, 'user', NULL, '2017-11-12 11:18:13', '2017-11-12 11:18:13'),
(66, NULL, 'global', NULL, '2017-11-12 11:19:22', '2017-11-12 11:19:22'),
(67, NULL, 'ip', '127.0.0.1', '2017-11-12 11:19:22', '2017-11-12 11:19:22'),
(68, 4, 'user', NULL, '2017-11-12 11:19:22', '2017-11-12 11:19:22'),
(69, NULL, 'global', NULL, '2017-11-12 12:21:15', '2017-11-12 12:21:15'),
(70, NULL, 'ip', '127.0.0.1', '2017-11-12 12:21:15', '2017-11-12 12:21:15'),
(71, 1, 'user', NULL, '2017-11-12 12:21:15', '2017-11-12 12:21:15'),
(72, NULL, 'global', NULL, '2017-11-12 12:30:54', '2017-11-12 12:30:54'),
(73, NULL, 'ip', '127.0.0.1', '2017-11-12 12:30:54', '2017-11-12 12:30:54'),
(74, 1, 'user', NULL, '2017-11-12 12:30:54', '2017-11-12 12:30:54'),
(75, NULL, 'global', NULL, '2017-11-12 12:31:09', '2017-11-12 12:31:09'),
(76, NULL, 'ip', '127.0.0.1', '2017-11-12 12:31:09', '2017-11-12 12:31:09'),
(77, 1, 'user', NULL, '2017-11-12 12:31:09', '2017-11-12 12:31:09'),
(78, NULL, 'global', NULL, '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(79, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(80, NULL, 'global', NULL, '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(81, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:51', '2017-11-12 19:20:51'),
(82, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(83, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(84, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(85, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(86, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(87, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(88, NULL, 'global', NULL, '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(89, NULL, 'ip', '127.0.0.1', '2017-11-12 19:20:52', '2017-11-12 19:20:52'),
(90, NULL, 'global', NULL, '2017-11-12 19:24:30', '2017-11-12 19:24:30'),
(91, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:30', '2017-11-12 19:24:30'),
(92, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(93, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(94, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(95, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(96, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(97, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(98, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(99, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(100, NULL, 'global', NULL, '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(101, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:31', '2017-11-12 19:24:31'),
(102, NULL, 'global', NULL, '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(103, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(104, NULL, 'global', NULL, '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(105, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(106, NULL, 'global', NULL, '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(107, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:32', '2017-11-12 19:24:32'),
(108, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(109, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(110, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(111, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(112, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(113, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(114, NULL, 'global', NULL, '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(115, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:33', '2017-11-12 19:24:33'),
(116, NULL, 'global', NULL, '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(117, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(118, NULL, 'global', NULL, '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(119, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(120, NULL, 'global', NULL, '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(121, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:34', '2017-11-12 19:24:34'),
(122, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(123, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(124, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(125, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(126, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(127, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(128, NULL, 'global', NULL, '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(129, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:35', '2017-11-12 19:24:35'),
(130, NULL, 'global', NULL, '2017-11-12 19:24:39', '2017-11-12 19:24:39'),
(131, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:39', '2017-11-12 19:24:39'),
(132, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(133, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(134, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(135, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(136, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(137, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(138, NULL, 'global', NULL, '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(139, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:40', '2017-11-12 19:24:40'),
(140, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(141, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(142, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(143, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(144, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(145, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(146, NULL, 'global', NULL, '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(147, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:41', '2017-11-12 19:24:41'),
(148, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(149, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(150, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(151, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(152, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(153, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(154, NULL, 'global', NULL, '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(155, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:42', '2017-11-12 19:24:42'),
(156, NULL, 'global', NULL, '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(157, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(158, NULL, 'global', NULL, '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(159, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(160, NULL, 'global', NULL, '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(161, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:43', '2017-11-12 19:24:43'),
(162, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(163, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(164, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(165, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(166, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(167, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(168, NULL, 'global', NULL, '2017-11-12 19:24:44', '2017-11-12 19:24:44'),
(169, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(170, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(171, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(172, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(173, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(174, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(175, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(176, NULL, 'global', NULL, '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(177, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:45', '2017-11-12 19:24:45'),
(178, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(179, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(180, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(181, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(182, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(183, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(184, NULL, 'global', NULL, '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(185, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:46', '2017-11-12 19:24:46'),
(186, NULL, 'global', NULL, '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(187, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(188, NULL, 'global', NULL, '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(189, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(190, NULL, 'global', NULL, '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(191, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:47', '2017-11-12 19:24:47'),
(192, NULL, 'global', NULL, '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(193, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(194, NULL, 'global', NULL, '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(195, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(196, NULL, 'global', NULL, '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(197, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:48', '2017-11-12 19:24:48'),
(198, NULL, 'global', NULL, '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(199, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(200, NULL, 'global', NULL, '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(201, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(202, NULL, 'global', NULL, '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(203, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:49', '2017-11-12 19:24:49'),
(204, NULL, 'global', NULL, '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(205, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(206, NULL, 'global', NULL, '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(207, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(208, NULL, 'global', NULL, '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(209, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:50', '2017-11-12 19:24:50'),
(210, NULL, 'global', NULL, '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(211, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(212, NULL, 'global', NULL, '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(213, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:51', '2017-11-12 19:24:51'),
(214, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(215, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(216, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(217, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(218, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(219, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(220, NULL, 'global', NULL, '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(221, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:57', '2017-11-12 19:24:57'),
(222, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(223, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(224, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(225, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(226, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(227, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(228, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(229, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(230, NULL, 'global', NULL, '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(231, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:58', '2017-11-12 19:24:58'),
(232, NULL, 'global', NULL, '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(233, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(234, NULL, 'global', NULL, '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(235, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(236, NULL, 'global', NULL, '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(237, NULL, 'ip', '127.0.0.1', '2017-11-12 19:24:59', '2017-11-12 19:24:59'),
(238, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(239, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(240, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(241, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(242, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(243, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(244, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(245, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(246, NULL, 'global', NULL, '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(247, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:00', '2017-11-12 19:25:00'),
(248, NULL, 'global', NULL, '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(249, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(250, NULL, 'global', NULL, '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(251, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(252, NULL, 'global', NULL, '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(253, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:01', '2017-11-12 19:25:01'),
(254, NULL, 'global', NULL, '2017-11-12 19:25:02', '2017-11-12 19:25:02'),
(255, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:02', '2017-11-12 19:25:02'),
(256, NULL, 'global', NULL, '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(257, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(258, NULL, 'global', NULL, '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(259, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(260, NULL, 'global', NULL, '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(261, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:32', '2017-11-12 19:25:32'),
(262, NULL, 'global', NULL, '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(263, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(264, NULL, 'global', NULL, '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(265, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(266, NULL, 'global', NULL, '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(267, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:33', '2017-11-12 19:25:33'),
(268, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(269, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(270, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(271, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(272, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(273, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(274, NULL, 'global', NULL, '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(275, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:34', '2017-11-12 19:25:34'),
(276, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(277, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(278, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(279, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(280, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(281, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(282, NULL, 'global', NULL, '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(283, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:35', '2017-11-12 19:25:35'),
(284, NULL, 'global', NULL, '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(285, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(286, NULL, 'global', NULL, '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(287, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(288, NULL, 'global', NULL, '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(289, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:36', '2017-11-12 19:25:36'),
(290, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(291, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(292, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(293, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(294, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(295, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(296, NULL, 'global', NULL, '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(297, NULL, 'ip', '127.0.0.1', '2017-11-12 19:25:37', '2017-11-12 19:25:37'),
(298, NULL, 'global', NULL, '2017-11-12 19:36:41', '2017-11-12 19:36:41'),
(299, NULL, 'ip', '127.0.0.1', '2017-11-12 19:36:41', '2017-11-12 19:36:41'),
(300, 4, 'user', NULL, '2017-11-12 19:36:41', '2017-11-12 19:36:41'),
(301, NULL, 'global', NULL, '2017-11-12 19:44:35', '2017-11-12 19:44:35'),
(302, NULL, 'ip', '127.0.0.1', '2017-11-12 19:44:35', '2017-11-12 19:44:35'),
(303, 1, 'user', NULL, '2017-11-12 19:44:35', '2017-11-12 19:44:35'),
(304, NULL, 'global', NULL, '2017-11-13 12:12:10', '2017-11-13 12:12:10'),
(305, NULL, 'ip', '127.0.0.1', '2017-11-13 12:12:10', '2017-11-13 12:12:10'),
(306, 1, 'user', NULL, '2017-11-13 12:12:10', '2017-11-13 12:12:10'),
(307, NULL, 'global', NULL, '2017-11-15 04:15:14', '2017-11-15 04:15:14'),
(308, NULL, 'ip', '127.0.0.1', '2017-11-15 04:15:14', '2017-11-15 04:15:14'),
(309, NULL, 'global', NULL, '2017-11-25 05:02:29', '2017-11-25 05:02:29'),
(310, NULL, 'ip', '127.0.0.1', '2017-11-25 05:02:29', '2017-11-25 05:02:29'),
(311, 1, 'user', NULL, '2017-11-25 05:02:29', '2017-11-25 05:02:29'),
(312, NULL, 'global', NULL, '2017-11-25 21:57:16', '2017-11-25 21:57:16'),
(313, NULL, 'ip', '127.0.0.1', '2017-11-25 21:57:16', '2017-11-25 21:57:16'),
(314, 6, 'user', NULL, '2017-11-25 21:57:16', '2017-11-25 21:57:16'),
(315, NULL, 'global', NULL, '2017-11-25 21:57:22', '2017-11-25 21:57:22'),
(316, NULL, 'ip', '127.0.0.1', '2017-11-25 21:57:22', '2017-11-25 21:57:22'),
(317, 6, 'user', NULL, '2017-11-25 21:57:22', '2017-11-25 21:57:22'),
(318, NULL, 'global', NULL, '2017-11-26 20:07:31', '2017-11-26 20:07:31'),
(319, NULL, 'ip', '127.0.0.1', '2017-11-26 20:07:31', '2017-11-26 20:07:31'),
(320, 1, 'user', NULL, '2017-11-26 20:07:31', '2017-11-26 20:07:31'),
(321, NULL, 'global', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(322, NULL, 'ip', '127.0.0.1', '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(323, 1, 'user', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(324, NULL, 'global', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(325, NULL, 'ip', '127.0.0.1', '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(326, 1, 'user', NULL, '2017-11-27 00:24:45', '2017-11-27 00:24:45'),
(327, NULL, 'global', NULL, '2017-11-30 08:03:16', '2017-11-30 08:03:16'),
(328, NULL, 'ip', '127.0.0.1', '2017-11-30 08:03:16', '2017-11-30 08:03:16'),
(329, 1, 'user', NULL, '2017-11-30 08:03:16', '2017-11-30 08:03:16'),
(330, NULL, 'global', NULL, '2017-12-03 07:41:47', '2017-12-03 07:41:47'),
(331, NULL, 'ip', '127.0.0.1', '2017-12-03 07:41:47', '2017-12-03 07:41:47'),
(332, 1, 'user', NULL, '2017-12-03 07:41:47', '2017-12-03 07:41:47'),
(333, NULL, 'global', NULL, '2017-12-03 11:49:24', '2017-12-03 11:49:24'),
(334, NULL, 'ip', '127.0.0.1', '2017-12-03 11:49:24', '2017-12-03 11:49:24'),
(335, NULL, 'global', NULL, '2017-12-03 11:49:31', '2017-12-03 11:49:31'),
(336, NULL, 'ip', '127.0.0.1', '2017-12-03 11:49:31', '2017-12-03 11:49:31'),
(337, NULL, 'global', NULL, '2017-12-03 11:49:49', '2017-12-03 11:49:49'),
(338, NULL, 'ip', '127.0.0.1', '2017-12-03 11:49:49', '2017-12-03 11:49:49'),
(339, NULL, 'global', NULL, '2017-12-03 11:50:32', '2017-12-03 11:50:32'),
(340, NULL, 'ip', '127.0.0.1', '2017-12-03 11:50:32', '2017-12-03 11:50:32'),
(341, NULL, 'global', NULL, '2017-12-03 11:54:18', '2017-12-03 11:54:18'),
(342, NULL, 'ip', '127.0.0.1', '2017-12-03 11:54:18', '2017-12-03 11:54:18'),
(343, NULL, 'global', NULL, '2017-12-04 11:12:12', '2017-12-04 11:12:12'),
(344, NULL, 'ip', '127.0.0.1', '2017-12-04 11:12:12', '2017-12-04 11:12:12'),
(345, 1, 'user', NULL, '2017-12-04 11:12:12', '2017-12-04 11:12:12'),
(346, NULL, 'global', NULL, '2017-12-05 09:04:13', '2017-12-05 09:04:13'),
(347, NULL, 'ip', '127.0.0.1', '2017-12-05 09:04:13', '2017-12-05 09:04:13'),
(348, 1, 'user', NULL, '2017-12-05 09:04:13', '2017-12-05 09:04:13'),
(349, NULL, 'global', NULL, '2017-12-08 11:51:32', '2017-12-08 11:51:32'),
(350, NULL, 'ip', '127.0.0.1', '2017-12-08 11:51:32', '2017-12-08 11:51:32'),
(351, 1, 'user', NULL, '2017-12-08 11:51:32', '2017-12-08 11:51:32'),
(352, NULL, 'global', NULL, '2017-12-08 11:51:37', '2017-12-08 11:51:37'),
(353, NULL, 'ip', '127.0.0.1', '2017-12-08 11:51:37', '2017-12-08 11:51:37'),
(354, 1, 'user', NULL, '2017-12-08 11:51:37', '2017-12-08 11:51:37'),
(355, NULL, 'global', NULL, '2017-12-13 11:11:12', '2017-12-13 11:11:12'),
(356, NULL, 'ip', '127.0.0.1', '2017-12-13 11:11:12', '2017-12-13 11:11:12'),
(357, 1, 'user', NULL, '2017-12-13 11:11:12', '2017-12-13 11:11:12'),
(358, NULL, 'global', NULL, '2017-12-13 11:11:19', '2017-12-13 11:11:19'),
(359, NULL, 'ip', '127.0.0.1', '2017-12-13 11:11:19', '2017-12-13 11:11:19'),
(360, 1, 'user', NULL, '2017-12-13 11:11:19', '2017-12-13 11:11:19'),
(361, NULL, 'global', NULL, '2017-12-13 11:11:21', '2017-12-13 11:11:21'),
(362, NULL, 'ip', '127.0.0.1', '2017-12-13 11:11:21', '2017-12-13 11:11:21'),
(363, 1, 'user', NULL, '2017-12-13 11:11:21', '2017-12-13 11:11:21'),
(364, NULL, 'global', NULL, '2017-12-13 19:46:17', '2017-12-13 19:46:17'),
(365, NULL, 'ip', '127.0.0.1', '2017-12-13 19:46:17', '2017-12-13 19:46:17'),
(366, 1, 'user', NULL, '2017-12-13 19:46:17', '2017-12-13 19:46:17'),
(367, NULL, 'global', NULL, '2017-12-13 19:46:22', '2017-12-13 19:46:22'),
(368, NULL, 'ip', '127.0.0.1', '2017-12-13 19:46:22', '2017-12-13 19:46:22'),
(369, 1, 'user', NULL, '2017-12-13 19:46:22', '2017-12-13 19:46:22'),
(370, NULL, 'global', NULL, '2017-12-16 00:21:37', '2017-12-16 00:21:37'),
(371, NULL, 'ip', '127.0.0.1', '2017-12-16 00:21:37', '2017-12-16 00:21:37'),
(372, 1, 'user', NULL, '2017-12-16 00:21:37', '2017-12-16 00:21:37'),
(373, NULL, 'global', NULL, '2017-12-17 18:07:51', '2017-12-17 18:07:51'),
(374, NULL, 'ip', '127.0.0.1', '2017-12-17 18:07:51', '2017-12-17 18:07:51'),
(375, 1, 'user', NULL, '2017-12-17 18:07:51', '2017-12-17 18:07:51'),
(376, NULL, 'global', NULL, '2017-12-29 02:09:21', '2017-12-29 02:09:21'),
(377, NULL, 'ip', '127.0.0.1', '2017-12-29 02:09:21', '2017-12-29 02:09:21'),
(378, 1, 'user', NULL, '2017-12-29 02:09:21', '2017-12-29 02:09:21'),
(379, NULL, 'global', NULL, '2017-12-29 02:09:27', '2017-12-29 02:09:27'),
(380, NULL, 'ip', '127.0.0.1', '2017-12-29 02:09:27', '2017-12-29 02:09:27'),
(381, 1, 'user', NULL, '2017-12-29 02:09:27', '2017-12-29 02:09:27'),
(382, NULL, 'global', NULL, '2017-12-29 05:40:34', '2017-12-29 05:40:34'),
(383, NULL, 'ip', '127.0.0.1', '2017-12-29 05:40:34', '2017-12-29 05:40:34'),
(384, 1, 'user', NULL, '2017-12-29 05:40:34', '2017-12-29 05:40:34'),
(385, NULL, 'global', NULL, '2017-12-29 05:40:39', '2017-12-29 05:40:39'),
(386, NULL, 'ip', '127.0.0.1', '2017-12-29 05:40:39', '2017-12-29 05:40:39'),
(387, 1, 'user', NULL, '2017-12-29 05:40:39', '2017-12-29 05:40:39'),
(388, NULL, 'global', NULL, '2018-01-01 19:20:37', '2018-01-01 19:20:37'),
(389, NULL, 'ip', '127.0.0.1', '2018-01-01 19:20:37', '2018-01-01 19:20:37'),
(390, 1, 'user', NULL, '2018-01-01 19:20:37', '2018-01-01 19:20:37'),
(391, NULL, 'global', NULL, '2018-01-05 05:03:06', '2018-01-05 05:03:06'),
(392, NULL, 'ip', '127.0.0.1', '2018-01-05 05:03:06', '2018-01-05 05:03:06'),
(393, 1, 'user', NULL, '2018-01-05 05:03:06', '2018-01-05 05:03:06'),
(394, NULL, 'global', NULL, '2018-01-07 02:06:01', '2018-01-07 02:06:01'),
(395, NULL, 'ip', '127.0.0.1', '2018-01-07 02:06:01', '2018-01-07 02:06:01'),
(396, NULL, 'global', NULL, '2018-01-08 23:12:58', '2018-01-08 23:12:58'),
(397, NULL, 'ip', '127.0.0.1', '2018-01-08 23:12:58', '2018-01-08 23:12:58'),
(398, NULL, 'global', NULL, '2018-01-08 23:13:07', '2018-01-08 23:13:07'),
(399, NULL, 'ip', '127.0.0.1', '2018-01-08 23:13:07', '2018-01-08 23:13:07'),
(400, NULL, 'global', NULL, '2018-01-08 23:13:09', '2018-01-08 23:13:09'),
(401, NULL, 'ip', '127.0.0.1', '2018-01-08 23:13:09', '2018-01-08 23:13:09'),
(402, NULL, 'global', NULL, '2018-01-15 01:13:23', '2018-01-15 01:13:23'),
(403, NULL, 'ip', '127.0.0.1', '2018-01-15 01:13:23', '2018-01-15 01:13:23'),
(404, NULL, 'global', NULL, '2018-01-15 11:12:12', '2018-01-15 11:12:12'),
(405, NULL, 'ip', '127.0.0.1', '2018-01-15 11:12:12', '2018-01-15 11:12:12'),
(406, NULL, 'global', NULL, '2018-01-18 09:25:07', '2018-01-18 09:25:07'),
(407, NULL, 'ip', '127.0.0.1', '2018-01-18 09:25:07', '2018-01-18 09:25:07'),
(408, 1, 'user', NULL, '2018-01-18 09:25:07', '2018-01-18 09:25:07'),
(409, NULL, 'global', NULL, '2018-01-18 21:48:18', '2018-01-18 21:48:18'),
(410, NULL, 'ip', '127.0.0.1', '2018-01-18 21:48:18', '2018-01-18 21:48:18'),
(411, 1, 'user', NULL, '2018-01-18 21:48:18', '2018-01-18 21:48:18'),
(412, NULL, 'global', NULL, '2018-01-19 00:25:45', '2018-01-19 00:25:45'),
(413, NULL, 'ip', '127.0.0.1', '2018-01-19 00:25:45', '2018-01-19 00:25:45'),
(414, 1, 'user', NULL, '2018-01-19 00:25:45', '2018-01-19 00:25:45'),
(415, NULL, 'global', NULL, '2018-01-26 01:05:07', '2018-01-26 01:05:07'),
(416, NULL, 'ip', '127.0.0.1', '2018-01-26 01:05:07', '2018-01-26 01:05:07'),
(417, 1, 'user', NULL, '2018-01-26 01:05:07', '2018-01-26 01:05:07'),
(418, NULL, 'global', NULL, '2018-01-26 01:43:54', '2018-01-26 01:43:54'),
(419, NULL, 'ip', '127.0.0.1', '2018-01-26 01:43:54', '2018-01-26 01:43:54'),
(420, 4, 'user', NULL, '2018-01-26 01:43:54', '2018-01-26 01:43:54'),
(421, NULL, 'global', NULL, '2018-01-26 01:44:01', '2018-01-26 01:44:01'),
(422, NULL, 'ip', '127.0.0.1', '2018-01-26 01:44:01', '2018-01-26 01:44:01'),
(423, 4, 'user', NULL, '2018-01-26 01:44:01', '2018-01-26 01:44:01'),
(424, NULL, 'global', NULL, '2018-01-26 01:59:32', '2018-01-26 01:59:32'),
(425, NULL, 'ip', '127.0.0.1', '2018-01-26 01:59:32', '2018-01-26 01:59:32'),
(426, 6, 'user', NULL, '2018-01-26 01:59:32', '2018-01-26 01:59:32'),
(427, NULL, 'global', NULL, '2018-01-26 02:01:55', '2018-01-26 02:01:55'),
(428, NULL, 'ip', '127.0.0.1', '2018-01-26 02:01:55', '2018-01-26 02:01:55'),
(429, 6, 'user', NULL, '2018-01-26 02:01:55', '2018-01-26 02:01:55'),
(430, NULL, 'global', NULL, '2018-01-26 02:02:14', '2018-01-26 02:02:14'),
(431, NULL, 'ip', '127.0.0.1', '2018-01-26 02:02:14', '2018-01-26 02:02:14'),
(432, 6, 'user', NULL, '2018-01-26 02:02:14', '2018-01-26 02:02:14'),
(433, NULL, 'global', NULL, '2018-01-26 02:30:24', '2018-01-26 02:30:24'),
(434, NULL, 'ip', '127.0.0.1', '2018-01-26 02:30:24', '2018-01-26 02:30:24'),
(435, 6, 'user', NULL, '2018-01-26 02:30:24', '2018-01-26 02:30:24'),
(436, NULL, 'global', NULL, '2018-01-26 02:37:37', '2018-01-26 02:37:37'),
(437, NULL, 'ip', '127.0.0.1', '2018-01-26 02:37:37', '2018-01-26 02:37:37'),
(438, 6, 'user', NULL, '2018-01-26 02:37:37', '2018-01-26 02:37:37'),
(439, NULL, 'global', NULL, '2018-01-26 03:16:56', '2018-01-26 03:16:56'),
(440, NULL, 'ip', '127.0.0.1', '2018-01-26 03:16:56', '2018-01-26 03:16:56'),
(441, 6, 'user', NULL, '2018-01-26 03:16:56', '2018-01-26 03:16:56'),
(442, NULL, 'global', NULL, '2018-01-26 03:35:32', '2018-01-26 03:35:32'),
(443, NULL, 'ip', '127.0.0.1', '2018-01-26 03:35:32', '2018-01-26 03:35:32'),
(444, 6, 'user', NULL, '2018-01-26 03:35:32', '2018-01-26 03:35:32'),
(445, NULL, 'global', NULL, '2018-01-28 09:40:43', '2018-01-28 09:40:43'),
(446, NULL, 'ip', '127.0.0.1', '2018-01-28 09:40:43', '2018-01-28 09:40:43'),
(447, 7, 'user', NULL, '2018-01-28 09:40:43', '2018-01-28 09:40:43'),
(448, NULL, 'global', NULL, '2018-01-29 18:33:51', '2018-01-29 18:33:51'),
(449, NULL, 'ip', '127.0.0.1', '2018-01-29 18:33:51', '2018-01-29 18:33:51'),
(450, 1, 'user', NULL, '2018-01-29 18:33:51', '2018-01-29 18:33:51'),
(451, NULL, 'global', NULL, '2018-01-31 00:07:37', '2018-01-31 00:07:37'),
(452, NULL, 'ip', '127.0.0.1', '2018-01-31 00:07:37', '2018-01-31 00:07:37'),
(453, 1, 'user', NULL, '2018-01-31 00:07:37', '2018-01-31 00:07:37'),
(454, NULL, 'global', NULL, '2018-01-31 00:07:43', '2018-01-31 00:07:43'),
(455, NULL, 'ip', '127.0.0.1', '2018-01-31 00:07:44', '2018-01-31 00:07:44'),
(456, 1, 'user', NULL, '2018-01-31 00:07:44', '2018-01-31 00:07:44'),
(457, NULL, 'global', NULL, '2018-01-31 10:50:07', '2018-01-31 10:50:07'),
(458, NULL, 'ip', '127.0.0.1', '2018-01-31 10:50:07', '2018-01-31 10:50:07'),
(459, 1, 'user', NULL, '2018-01-31 10:50:07', '2018-01-31 10:50:07'),
(460, NULL, 'global', NULL, '2018-01-31 20:44:30', '2018-01-31 20:44:30'),
(461, NULL, 'ip', '127.0.0.1', '2018-01-31 20:44:30', '2018-01-31 20:44:30'),
(462, 1, 'user', NULL, '2018-01-31 20:44:30', '2018-01-31 20:44:30'),
(463, NULL, 'global', NULL, '2018-02-01 01:50:34', '2018-02-01 01:50:34'),
(464, NULL, 'ip', '127.0.0.1', '2018-02-01 01:50:34', '2018-02-01 01:50:34'),
(465, 1, 'user', NULL, '2018-02-01 01:50:34', '2018-02-01 01:50:34'),
(466, NULL, 'global', NULL, '2018-02-01 02:10:55', '2018-02-01 02:10:55'),
(467, NULL, 'ip', '127.0.0.1', '2018-02-01 02:10:55', '2018-02-01 02:10:55'),
(468, 1, 'user', NULL, '2018-02-01 02:10:55', '2018-02-01 02:10:55'),
(469, NULL, 'global', NULL, '2018-02-01 02:28:57', '2018-02-01 02:28:57'),
(470, NULL, 'ip', '127.0.0.1', '2018-02-01 02:28:57', '2018-02-01 02:28:57'),
(471, 1, 'user', NULL, '2018-02-01 02:28:57', '2018-02-01 02:28:57'),
(472, NULL, 'global', NULL, '2018-02-01 02:54:48', '2018-02-01 02:54:48'),
(473, NULL, 'ip', '127.0.0.1', '2018-02-01 02:54:48', '2018-02-01 02:54:48'),
(474, 1, 'user', NULL, '2018-02-01 02:54:48', '2018-02-01 02:54:48'),
(475, NULL, 'global', NULL, '2018-02-01 02:56:25', '2018-02-01 02:56:25'),
(476, NULL, 'ip', '127.0.0.1', '2018-02-01 02:56:25', '2018-02-01 02:56:25'),
(477, 1, 'user', NULL, '2018-02-01 02:56:25', '2018-02-01 02:56:25'),
(478, NULL, 'global', NULL, '2018-02-02 19:05:12', '2018-02-02 19:05:12'),
(479, NULL, 'ip', '127.0.0.1', '2018-02-02 19:05:12', '2018-02-02 19:05:12'),
(480, 1, 'user', NULL, '2018-02-02 19:05:12', '2018-02-02 19:05:12'),
(481, NULL, 'global', NULL, '2018-02-04 06:13:43', '2018-02-04 06:13:43'),
(482, NULL, 'ip', '127.0.0.1', '2018-02-04 06:13:43', '2018-02-04 06:13:43'),
(483, 1, 'user', NULL, '2018-02-04 06:13:43', '2018-02-04 06:13:43'),
(484, NULL, 'global', NULL, '2018-02-04 06:32:59', '2018-02-04 06:32:59'),
(485, NULL, 'ip', '127.0.0.1', '2018-02-04 06:32:59', '2018-02-04 06:32:59'),
(486, NULL, 'global', NULL, '2018-02-04 06:33:40', '2018-02-04 06:33:40'),
(487, NULL, 'ip', '127.0.0.1', '2018-02-04 06:33:40', '2018-02-04 06:33:40'),
(488, 9, 'user', NULL, '2018-02-04 06:33:40', '2018-02-04 06:33:40'),
(489, NULL, 'global', NULL, '2018-02-04 08:07:49', '2018-02-04 08:07:49'),
(490, NULL, 'ip', '127.0.0.1', '2018-02-04 08:07:49', '2018-02-04 08:07:49'),
(491, 1, 'user', NULL, '2018-02-04 08:07:49', '2018-02-04 08:07:49'),
(492, NULL, 'global', NULL, '2018-02-05 03:16:48', '2018-02-05 03:16:48'),
(493, NULL, 'ip', '127.0.0.1', '2018-02-05 03:16:48', '2018-02-05 03:16:48'),
(494, 1, 'user', NULL, '2018-02-05 03:16:48', '2018-02-05 03:16:48'),
(495, NULL, 'global', NULL, '2018-02-05 20:05:07', '2018-02-05 20:05:07'),
(496, NULL, 'ip', '127.0.0.1', '2018-02-05 20:05:07', '2018-02-05 20:05:07'),
(497, 1, 'user', NULL, '2018-02-05 20:05:07', '2018-02-05 20:05:07'),
(498, NULL, 'global', NULL, '2018-02-06 01:01:38', '2018-02-06 01:01:38'),
(499, NULL, 'ip', '127.0.0.1', '2018-02-06 01:01:38', '2018-02-06 01:01:38'),
(500, 1, 'user', NULL, '2018-02-06 01:01:38', '2018-02-06 01:01:38'),
(501, NULL, 'global', NULL, '2018-02-06 21:31:19', '2018-02-06 21:31:19'),
(502, NULL, 'ip', '127.0.0.1', '2018-02-06 21:31:19', '2018-02-06 21:31:19'),
(503, 1, 'user', NULL, '2018-02-06 21:31:19', '2018-02-06 21:31:19'),
(504, NULL, 'global', NULL, '2018-02-07 03:29:51', '2018-02-07 03:29:51'),
(505, NULL, 'ip', '127.0.0.1', '2018-02-07 03:29:51', '2018-02-07 03:29:51'),
(506, 8, 'user', NULL, '2018-02-07 03:29:51', '2018-02-07 03:29:51'),
(507, NULL, 'global', NULL, '2018-02-07 21:17:30', '2018-02-07 21:17:30'),
(508, NULL, 'ip', '127.0.0.1', '2018-02-07 21:17:30', '2018-02-07 21:17:30'),
(509, 11, 'user', NULL, '2018-02-07 21:17:30', '2018-02-07 21:17:30'),
(510, NULL, 'global', NULL, '2018-02-08 01:52:59', '2018-02-08 01:52:59'),
(511, NULL, 'ip', '127.0.0.1', '2018-02-08 01:52:59', '2018-02-08 01:52:59'),
(512, 1, 'user', NULL, '2018-02-08 01:52:59', '2018-02-08 01:52:59'),
(513, NULL, 'global', NULL, '2018-02-27 10:23:13', '2018-02-27 10:23:13'),
(514, NULL, 'ip', '127.0.0.1', '2018-02-27 10:23:13', '2018-02-27 10:23:13'),
(515, 1, 'user', NULL, '2018-02-27 10:23:13', '2018-02-27 10:23:13'),
(516, NULL, 'global', NULL, '2018-02-27 10:23:20', '2018-02-27 10:23:20'),
(517, NULL, 'ip', '127.0.0.1', '2018-02-27 10:23:20', '2018-02-27 10:23:20'),
(518, 1, 'user', NULL, '2018-02-27 10:23:20', '2018-02-27 10:23:20'),
(519, NULL, 'global', NULL, '2018-02-27 10:23:27', '2018-02-27 10:23:27'),
(520, NULL, 'ip', '127.0.0.1', '2018-02-27 10:23:27', '2018-02-27 10:23:27'),
(521, 1, 'user', NULL, '2018-02-27 10:23:27', '2018-02-27 10:23:27'),
(522, NULL, 'global', NULL, '2018-02-27 10:23:35', '2018-02-27 10:23:35'),
(523, NULL, 'ip', '127.0.0.1', '2018-02-27 10:23:35', '2018-02-27 10:23:35'),
(524, 1, 'user', NULL, '2018-02-27 10:23:35', '2018-02-27 10:23:35'),
(525, NULL, 'global', NULL, '2018-03-13 20:44:30', '2018-03-13 20:44:30'),
(526, NULL, 'ip', '27.77.246.244', '2018-03-13 20:44:30', '2018-03-13 20:44:30'),
(527, 14, 'user', NULL, '2018-03-13 20:44:30', '2018-03-13 20:44:30'),
(528, NULL, 'global', NULL, '2018-03-13 21:42:58', '2018-03-13 21:42:58'),
(529, NULL, 'ip', '27.77.246.244', '2018-03-13 21:42:58', '2018-03-13 21:42:58'),
(530, 1, 'user', NULL, '2018-03-13 21:42:58', '2018-03-13 21:42:58'),
(531, NULL, 'global', NULL, '2018-04-01 04:26:16', '2018-04-01 04:26:16'),
(532, NULL, 'ip', '127.0.0.1', '2018-04-01 04:26:16', '2018-04-01 04:26:16'),
(533, 1, 'user', NULL, '2018-04-01 04:26:16', '2018-04-01 04:26:16'),
(534, NULL, 'global', NULL, '2018-04-06 02:07:34', '2018-04-06 02:07:34'),
(535, NULL, 'ip', '127.0.0.1', '2018-04-06 02:07:34', '2018-04-06 02:07:34'),
(536, 1, 'user', NULL, '2018-04-06 02:07:34', '2018-04-06 02:07:34'),
(537, NULL, 'global', NULL, '2018-04-06 08:36:06', '2018-04-06 08:36:06'),
(538, NULL, 'ip', '127.0.0.1', '2018-04-06 08:36:06', '2018-04-06 08:36:06'),
(539, NULL, 'global', NULL, '2018-04-06 08:39:03', '2018-04-06 08:39:03'),
(540, NULL, 'ip', '127.0.0.1', '2018-04-06 08:39:03', '2018-04-06 08:39:03'),
(541, 1, 'user', NULL, '2018-04-06 08:39:03', '2018-04-06 08:39:03'),
(542, NULL, 'global', NULL, '2018-04-06 08:48:04', '2018-04-06 08:48:04'),
(543, NULL, 'ip', '127.0.0.1', '2018-04-06 08:48:04', '2018-04-06 08:48:04'),
(544, 3, 'user', NULL, '2018-04-06 08:48:04', '2018-04-06 08:48:04'),
(545, NULL, 'global', NULL, '2018-04-06 18:27:29', '2018-04-06 18:27:29'),
(546, NULL, 'ip', '127.0.0.1', '2018-04-06 18:27:29', '2018-04-06 18:27:29'),
(547, NULL, 'global', NULL, '2018-04-13 19:25:51', '2018-04-13 19:25:51'),
(548, NULL, 'ip', '127.0.0.1', '2018-04-13 19:25:51', '2018-04-13 19:25:51'),
(549, 1, 'user', NULL, '2018-04-13 19:25:51', '2018-04-13 19:25:51'),
(550, NULL, 'global', NULL, '2018-04-15 08:29:19', '2018-04-15 08:29:19'),
(551, NULL, 'ip', '127.0.0.1', '2018-04-15 08:29:19', '2018-04-15 08:29:19'),
(552, 2, 'user', NULL, '2018-04-15 08:29:19', '2018-04-15 08:29:19'),
(553, NULL, 'global', NULL, '2018-04-15 18:19:46', '2018-04-15 18:19:46'),
(554, NULL, 'ip', '127.0.0.1', '2018-04-15 18:19:46', '2018-04-15 18:19:46'),
(555, 1, 'user', NULL, '2018-04-15 18:19:46', '2018-04-15 18:19:46'),
(556, NULL, 'global', NULL, '2018-04-27 11:06:19', '2018-04-27 11:06:19'),
(557, NULL, 'ip', '127.0.0.1', '2018-04-27 11:06:19', '2018-04-27 11:06:19'),
(558, NULL, 'global', NULL, '2018-05-02 01:58:18', '2018-05-02 01:58:18'),
(559, NULL, 'ip', '127.0.0.1', '2018-05-02 01:58:18', '2018-05-02 01:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permissions`, `last_login`, `fullname`, `address`, `phone`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'diennk@dienkim.com', '$2y$10$hJkvWc.IvqSEoXnRj/b3nO7r5a6wiUXvRauDRiaoO/2guW5oOrNNe', NULL, '2018-05-16 18:33:19', 'Nguyễn Kim Điền', NULL, '0988162753', 'nguyen-kim-dien-292.png', 1, 1, '2017-11-12 07:23:56', '2018-05-16 18:33:19'),
(2, 'phucbtm', 'phucbtm@dienkim.com', '$2y$10$LN.mcmWoyQY1.AvMrEu.CeqYB0OrFPfTg.FAQ7qSdU/Sc13w/iy.K', NULL, '2018-04-15 08:29:28', 'Bùi Thị Mỹ Phúc', NULL, '0988162777', 'logo-3-6pnb19a7qygv.png', 2, 1, '2018-04-06 00:52:58', '2018-04-15 08:29:53'),
(3, 'dungnth', 'dungnth@dienkim.com', '$2y$10$06WqHjx5FB.AknXj2MPRceFHgn.WbKeeHLPzmlCfGJwIrIzuPKupG', NULL, '2018-04-15 08:27:23', 'Nguyễn Thị Hoàng Dung', NULL, '0988162781', 'logo-1-ju67i1ylo2f8.png', 3, 1, '2018-04-06 00:54:14', '2018-04-15 08:31:04'),
(4, 'thuyptt', 'thuyptt@dienkim.com', '$2y$10$IExbuIwqMRNyvA4ppYjVtOpobGtABTssSrEChbXURmludJyQTbQ3W', NULL, '2018-04-06 08:36:44', 'Phạm Thị Thanh Thủy', NULL, '0982778123', 'logo-2-ge30clh856td.png', 4, 1, '2018-04-06 00:55:07', '2018-04-06 08:36:44'),
(5, 'thuyttt', 'thuyttt@dienkim.com', '$2y$10$AA6KmOmb/IPF2RZyy3usc.GWvSfZmgNJySKEf65tUtxJ6e3hpp1lS', NULL, '2018-04-06 08:52:03', 'Trần Thị Thanh Thúy', NULL, '0923111222', 'logo-3-3e4tfsqz86h2.png', 5, 1, '2018-04-06 00:56:08', '2018-04-06 08:52:03'),
(6, 'thaoht', 'thaoht@dienkim.com', '$2y$10$HH42krxiiZhRfnaedbjw7exT3LpC5052NANqWiBIFH/As/Gvb5Soe', NULL, '2018-04-06 08:38:28', 'Hoàng Thị Hồng Thảo', NULL, '0944111333', 'logo-4-m30xjclwqpy7.png', 6, 1, '2018-04-06 00:57:12', '2018-04-06 08:38:28'),
(7, 'trangttt', 'trangttt@dienkim.com', '$2y$10$1YolHwegMnyr/ewwtr4t9OHy4apeBhARteyM0cJMxd3oP1rx2XdcO', NULL, '2018-04-06 08:38:44', 'Trần Thị Thu Trang', NULL, '0999123321', 'logo-4-k59pac0t2zg8.png', 7, 1, '2018-04-06 00:57:56', '2018-04-06 08:38:44'),
(8, 'kimly', 'kimly@dienkim.com', '$2y$10$J5v.WmXt1sULlh/vUAQRYek.kX5kl.M1sjb47IqpGR9XZHyMU5OGu', NULL, '2018-04-06 18:57:26', 'Trần Thị Kim Lý', NULL, '0988445223', 'logo-2-7bpmj9wy4xcl.png', 8, 1, '2018-04-06 18:34:42', '2018-04-11 01:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_member`
--

DROP TABLE IF EXISTS `user_group_member`;
CREATE TABLE `user_group_member` (
  `id` bigint(20) NOT NULL,
  `group_member_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_group_member`
--

INSERT INTO `user_group_member` (`id`, `group_member_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '2018-01-26 04:05:58', '2018-01-26 04:05:58'),
(6, 2, 3, '2018-04-06 07:54:14', '2018-04-06 07:54:14'),
(7, 2, 4, '2018-04-06 07:55:07', '2018-04-06 07:55:07'),
(8, 2, 5, '2018-04-06 07:56:08', '2018-04-06 07:56:08'),
(9, 2, 6, '2018-04-06 07:57:12', '2018-04-06 07:57:12'),
(10, 2, 7, '2018-04-06 07:57:56', '2018-04-06 07:57:56'),
(14, 2, 2, '2018-04-07 04:12:56', '2018-04-07 04:12:56'),
(15, 2, 8, '2018-04-11 08:00:06', '2018-04-11 08:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `fullname`, `category_id`, `image`, `video_url`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Đi tham quan núi Bà Đen 2', 1, 'thuvienhinh-1.png', 'F5gQLpScOsI', 2, 1, '2018-01-09 11:01:55', '2018-01-09 11:49:30'),
(5, 'Đi tham quan núi Bà Đen', 1, 'thuvienhinh-2.png', 'BDBb1h-eLsY', 1, 1, '2018-01-09 11:04:06', '2018-01-09 11:49:08'),
(6, 'Đi tham quan núi Bà Đen 3', 1, 'thuvienhinh-3.png', 'rQt2EuoN6oo', 3, 1, '2018-01-09 11:04:29', '2018-01-09 11:49:42'),
(7, 'Đi tham quan núi Bà Đen 4', 1, 'thuvienhinh-4.png', 'jLzAqwCjPuU', 4, 1, '2018-01-09 11:04:54', '2018-01-09 11:49:49'),
(8, 'Đi tham quan núi Bà Đen 5', 1, 'thuvienhinh-5.png', 'koeu_AnZ0BQ', 5, 1, '2018-01-09 11:05:20', '2018-01-09 11:49:56'),
(9, 'Đi tham quan núi Bà Đen 6', 1, 'thuvienhinh-6.png', 'jM53ZU2MCzU', 6, 1, '2018-01-09 11:05:37', '2018-01-09 11:50:04'),
(10, 'Đi tham quan núi Bà Đen 7', 1, 'thuvienhinh-7.png', 'u7xIydku_Yw', 7, 1, '2018-01-09 11:05:53', '2018-01-09 11:50:11'),
(11, 'Đi tham quan núi Bà Đen 8', 1, 'thuvienhinh-8.png', 'yGvSEhQXu4g', 8, 1, '2018-01-09 11:06:08', '2018-01-09 11:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giờ hành chính', 'gio-hanh-chinh', 1, 1, '2018-04-12 06:38:50', '2018-04-12 06:38:50'),
(2, 'Việc làm thu nhập cao', 'viec-lam-thu-nhap-cao', 1, 1, '2018-04-12 06:39:08', '2018-04-12 06:39:08'),
(3, 'Việc làm thêm / Làm việc ngoài giờ', 'viec-lam-them-lam-viec-ngoai-gio', 1, 1, '2018-04-12 06:39:30', '2018-04-12 06:39:30'),
(4, 'Thầu dự án / Freelance / Việc làm tự do', 'thau-du-an-freelance-viec-lam-tu-do', 1, 1, '2018-04-12 06:40:02', '2018-04-12 06:40:02'),
(5, 'Việc làm online', 'viec-lam-online', 1, 1, '2018-04-12 06:40:18', '2018-04-12 06:40:18'),
(6, 'Kinh doanh mạng lưới', 'kinh-doanh-mang-luoi', 1, 1, '2018-04-12 06:40:31', '2018-04-12 06:40:31'),
(7, 'Giúp việc gia đình', 'giup-viec-gia-dinh', 1, 1, '2018-04-12 06:40:43', '2018-04-12 06:40:43'),
(8, 'Hợp tác lao động / Nước ngoài', 'hop-tac-lao-dong-nuoc-ngoai', 1, 1, '2018-04-12 06:40:59', '2018-04-12 06:40:59'),
(9, 'Việc làm người khuyết tật', 'viec-lam-nguoi-khuyet-tat', 1, 1, '2018-04-12 06:41:13', '2018-04-12 06:41:13'),
(10, 'Việc làm theo ca / Đổi ca', 'viec-lam-theo-ca-doi-ca', 1, 1, '2018-04-12 06:41:28', '2018-04-12 06:41:28'),
(11, 'Việc làm cho trí thức lớn tuổi ( trên 50 tuổi )', 'viec-lam-cho-tri-thuc-lon-tuoi-tren-50-tuoi', 1, 1, '2018-04-12 06:42:01', '2018-04-12 06:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `working_form`
--

DROP TABLE IF EXISTS `working_form`;
CREATE TABLE `working_form` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `working_form`
--

INSERT INTO `working_form` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhân viên chính thức', 'nhan-vien-chinh-thuc', 1, 1, '2018-04-12 07:02:39', '2018-04-12 07:02:39'),
(2, 'Nhân viên thời vụ', 'nhan-vien-thoi-vu', 1, 1, '2018-04-12 07:02:49', '2018-04-12 07:02:49'),
(3, 'Bán thời gian', 'ban-thoi-gian', 1, 1, '2018-04-12 07:02:58', '2018-04-12 07:02:58'),
(4, 'Làm thêm ngoài giờ', 'lam-them-ngoai-gio', 1, 1, '2018-04-12 07:03:07', '2018-04-12 07:03:07'),
(5, 'Thực tập và dự án', 'thuc-tap-va-du-an', 1, 1, '2018-04-12 07:03:31', '2018-04-12 07:03:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_article`
--
ALTER TABLE `category_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_banner`
--
ALTER TABLE `category_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_param`
--
ALTER TABLE `category_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_video`
--
ALTER TABLE `category_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `graduation`
--
ALTER TABLE `graduation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_member`
--
ALTER TABLE `group_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_privilege`
--
ALTER TABLE `group_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_level`
--
ALTER TABLE `language_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `literacy`
--
ALTER TABLE `literacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marriage`
--
ALTER TABLE `marriage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_item`
--
ALTER TABLE `module_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_param`
--
ALTER TABLE `post_param`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `probationary`
--
ALTER TABLE `probationary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_experience`
--
ALTER TABLE `profile_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_graduation`
--
ALTER TABLE `profile_graduation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_job`
--
ALTER TABLE `profile_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_language`
--
ALTER TABLE `profile_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_place`
--
ALTER TABLE `profile_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_skill`
--
ALTER TABLE `profile_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_article`
--
ALTER TABLE `project_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_member`
--
ALTER TABLE `project_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitment`
--
ALTER TABLE `recruitment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitment_job`
--
ALTER TABLE `recruitment_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitment_place`
--
ALTER TABLE `recruitment_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scale`
--
ALTER TABLE `scale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_system`
--
ALTER TABLE `setting_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supporter`
--
ALTER TABLE `supporter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_group_member`
--
ALTER TABLE `user_group_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_form`
--
ALTER TABLE `working_form`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category_article`
--
ALTER TABLE `category_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_banner`
--
ALTER TABLE `category_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_param`
--
ALTER TABLE `category_param`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_video`
--
ALTER TABLE `category_video`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `classification`
--
ALTER TABLE `classification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `graduation`
--
ALTER TABLE `graduation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_member`
--
ALTER TABLE `group_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_privilege`
--
ALTER TABLE `group_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5463;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `language_level`
--
ALTER TABLE `language_level`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `literacy`
--
ALTER TABLE `literacy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `marriage`
--
ALTER TABLE `marriage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module_item`
--
ALTER TABLE `module_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=936;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_param`
--
ALTER TABLE `post_param`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `probationary`
--
ALTER TABLE `probationary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profile_experience`
--
ALTER TABLE `profile_experience`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profile_graduation`
--
ALTER TABLE `profile_graduation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profile_job`
--
ALTER TABLE `profile_job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `profile_language`
--
ALTER TABLE `profile_language`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profile_place`
--
ALTER TABLE `profile_place`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `profile_skill`
--
ALTER TABLE `profile_skill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_article`
--
ALTER TABLE `project_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_member`
--
ALTER TABLE `project_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `rank`
--
ALTER TABLE `rank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `recruitment`
--
ALTER TABLE `recruitment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `recruitment_job`
--
ALTER TABLE `recruitment_job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `recruitment_place`
--
ALTER TABLE `recruitment_place`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `scale`
--
ALTER TABLE `scale`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `setting_system`
--
ALTER TABLE `setting_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `supporter`
--
ALTER TABLE `supporter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=560;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_group_member`
--
ALTER TABLE `user_group_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `working_form`
--
ALTER TABLE `working_form`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
