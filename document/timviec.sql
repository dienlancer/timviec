-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 23, 2018 lúc 02:04 PM
-- Phiên bản máy phục vụ: 10.1.29-MariaDB
-- Phiên bản PHP: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `timviec`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activations`
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
-- Đang đổ dữ liệu cho bảng `activations`
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
-- Cấu trúc bảng cho bảng `album`
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
-- Cấu trúc bảng cho bảng `article`
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

--
-- Đang đổ dữ liệu cho bảng `article`
--

INSERT INTO `article` (`id`, `fullname`, `alias`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(31, 'Laptop HP có tốt không?', 'laptop-hp-co-tot-khong', '100000_laptop-hp-14-bs561tu-2ge29pa-04.jpg', 'Laptop HP có tốt không là câu hỏi được nhiều người quan tâm', '<p style=\"text-align:justify\">Ng&agrave;y n&agrave;y, laptop l&agrave; thiết bị kh&ocirc;ng thể thiếu trong thời đại c&ocirc;ng nghệ. Trong đ&oacute;, ch&uacute;ng ta c&oacute; thể kể đến những d&ograve;ng m&aacute;y nổi tiếng như Dell, HP, Asus,&hellip; đ&acirc;y l&agrave; những d&ograve;ng m&aacute;y th&ocirc;ng dụng v&agrave; nổi tiếng tr&ecirc;n thị trường laptop bởi gi&aacute; cả của d&ograve;ng sản phẩm n&agrave;y b&igrave;nh d&acirc;n, chất lượng v&agrave; đ&aacute;p ứng được nhiều cầu sử dụng kh&aacute;c nhau. B&agrave;i viết ng&agrave;y h&ocirc;m nay của&nbsp;ch&uacute;ng t&ocirc;i sẽ giới thiệu về d&ograve;ng m&aacute;y laptop HP. Ch&uacute;ng t&ocirc;i sẽ cung cấp đầy đủ những th&ocirc;ng tin hữu &iacute;ch về d&ograve;ng m&aacute;y n&agrave;y để c&oacute; thể trả lời cho c&acirc;u hỏi của người ti&ecirc;u d&ugrave;ng như c&oacute; n&ecirc;n mua&nbsp;laptop HP&nbsp;kh&ocirc;ng ? M&aacute;y t&iacute;nh HP c&oacute; tốt kh&ocirc;ng? M&aacute;y t&iacute;nh HP chất lượng như thế n&agrave;o?</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h2 style=\"text-align:justify\"><strong>M&aacute;y t&iacute;nh HP c&oacute; tốt kh&ocirc;ng?</strong></h2>\n\n<h3 style=\"text-align:justify\"><br />\n<strong>1. Thương hiệu HP bắt nguồn từ nước n&agrave;o?</strong></h3>\n\n<p style=\"text-align:center\"><img alt=\"100000 laptop hp 14 bs561tu 2ge29pa 04\" src=\"https://dcmobile.vn/uploads/tin-tuc/2018_01/100000_laptop-hp-14-bs561tu-2ge29pa-04.jpg\" /></p>\n\n<p style=\"text-align:center\">H&igrave;nh 1 : Những mẫu laptop HP đẹp</p>\n\n<p style=\"text-align:justify\"><br />\nHP l&agrave; từ viết tắt của Hewlett-Packard đ&acirc;y l&agrave; một thương hiệu đến từ Mỹ, được xem l&agrave; một trong c&aacute;c h&atilde;ng m&aacute;y t&iacute;nh, laptop h&agrave;ng đầu thế giới. HP c&oacute; rất nhiều d&ograve;ng m&aacute;y t&iacute;nh, laptop kh&aacute;c nhau được trải d&agrave;i v&agrave; phần kh&uacute;c từ b&igrave;nh d&acirc;n cho đến ph&acirc;n kh&uacute;c cao cấp, ph&ugrave; hợp với mọi đối tượng sử dụng.<br />\n&nbsp;</p>\n\n<h3 style=\"text-align:justify\"><strong>2. Ưu điểm của d&ograve;ng m&aacute;y Laptop HP</strong></h3>\n\n<p style=\"text-align:justify\"><br />\nĐể c&oacute; thể trả lời được c&acirc;u hỏi rằng m&aacute;y t&iacute;nh HP c&oacute; tốt kh&ocirc;ng, bạn cần căn cứ v&agrave;o ưu điểm của sản phẩm để c&oacute; c&acirc;u trả lời thuyết phục nhất d&agrave;nh cho người ti&ecirc;u dung.<br />\n<br />\n-&nbsp;<strong>Thứ nhất</strong>&nbsp;: Laptop HP c&oacute; mức gi&aacute; th&agrave;nh phong ph&uacute;, từ b&igrave;nh d&acirc;n cho đến những sản phẩm laptop cho danh nh&acirc;n, người th&agrave;nh đạt, giới thượng lưu,&hellip; V&igrave; vậy, bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m lựa chọn một d&ograve;ng m&aacute;y laptop HP ph&ugrave; hợp với t&uacute;i tiền cũng như nhu cầu sử dụng của m&igrave;nh.<br />\n&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"c05473503 500x367\" src=\"https://dcmobile.vn/uploads/tin-tuc/2018_01/c05473503_500x367.jpg\" /></p>\n\n<p style=\"text-align:center\">H&igrave;nh 2 : Laptop HP m&agrave;u trắng tinh tế</p>\n\n<p style=\"text-align:justify\">-&nbsp;<strong>Thứ hai</strong>&nbsp;: Laptop HP lu&ocirc;n sở hữu cấu h&igrave;nh m&aacute;y ổn định, t&iacute;nh năng hiện đại v&agrave; c&oacute; độ bền cao, kiểu d&aacute;ng đẹp.<br />\n<br />\n-&nbsp;<strong>Thứ ba</strong>&nbsp;: Laptop HP lu&ocirc;n đa dạng về kiểu d&aacute;ng từ thể thao, thời trang đến những kiểu d&aacute;ng mạnh mẽ, nữ t&iacute;nh,&hellip; Tuỳ v&agrave;o sở th&iacute;ch của người sử dụng để lựa chọn kiểu d&aacute;ng m&aacute;y ph&ugrave; hợp.<br />\n<br />\n-&nbsp;<strong>Thứ tư</strong>&nbsp;: Laptop HP sở hữu tốc độ chạy ổn định. Laptop c&oacute; thể chịu được lượng dữ liệu rất lớn.<br />\n&nbsp;</p>\n\n<h2 style=\"text-align:justify\"><strong>3. Nhược điểm của d&ograve;ng m&aacute;y Laptop HP</strong></h2>\n\n<p style=\"text-align:justify\"><br />\nNếu đ&atilde; c&oacute; ưu điểm th&igrave; sẽ c&oacute; nhược điểm, ch&uacute;ng t&ocirc;i nếu ra những nhược điểm của d&ograve;ng m&aacute;y laptop HP m&agrave; người d&ugrave;ng thường hay đ&aacute;nh gi&aacute; để bạn c&oacute; thể hiểu r&otilde; hơn về d&ograve;ng m&aacute;y n&agrave;y.<br />\n<br />\nTheo người ti&ecirc;u d&ugrave;ng th&igrave; Laptop HP kiểu d&aacute;ng kh&ocirc;ng được bắt mắt bằng những thương hiệu kh&aacute;c tr&ecirc;n thị trường, mặc d&ugrave; d&ograve;ng m&aacute;y n&agrave;y kh&aacute; đa dạng về mẫu m&atilde;. Hiệu suất l&agrave;m việc của dong m&aacute;y n&agrave;y cũng thấp hơn so với những d&ograve;ng m&aacute;y kh&aacute;c c&oacute; c&ugrave;ng cấu h&igrave;nh, pin kh&ocirc;ng được đ&aacute;nh gi&aacute; c&aacute;o.<br />\n&nbsp;</p>\n\n<h2 style=\"text-align:justify\"><strong>4. M&aacute;y t&iacute;nh HP c&oacute; tốt kh&ocirc;ng?</strong></h2>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"laptop hp pavilion 14 bf022tu 04\" src=\"https://dcmobile.vn/uploads/tin-tuc/2018_01/laptop-hp-pavilion-14-bf022tu-04.jpg\" /></p>\n\n<p style=\"text-align:center\">H&igrave;nh 3 : Laptop HP cao cấp</p>\n\n<p style=\"text-align:justify\"><br />\nD&ograve;ng m&aacute;y t&iacute;nh laptop HP mặt d&ugrave; c&ograve;n c&oacute; những hạn chế nhất định, nhưng laptop HP vẫn l&agrave; một thương hiệu cao cấp m&agrave; bạn c&oacute; thể lựa chọn để hổ trợ cho c&ocirc;ng việc, học tập hang ng&agrave;y. Tuy nhi&ecirc;n, bạn cần xem x&eacute;t kỹ lưỡng c&aacute;c d&ograve;ng sản phẩm của thương hiệu n&agrave;y để c&oacute; thể chọn được mẫu laptop ph&ugrave; hợp với nhu cầu v&agrave; mong muốn của m&igrave;nh nhất.<br />\n<br />\nD&ograve;ng m&aacute;y t&iacute;nh n&agrave;o cũng c&oacute; những ưu v&agrave; nhược điểm kh&aacute;c nhau n&ecirc;n tuỳ thuộc v&agrave;o nhu cầu sử dụng của bạn để lựa chọn thương hiệu laptop ph&ugrave; hợp. Như vậy, bạn đ&atilde; c&oacute; c&acirc;u trả lời cho c&acirc;u hỏi m&aacute;y t&iacute;nh HP c&oacute; tốt kh&ocirc;ng? Rồi phải kh&ocirc;ng, đ&acirc;y chắc chắn l&agrave; thương hiệu m&aacute;y t&iacute;nh tốt v&agrave; nổi tiếng tr&ecirc;n thị trường nội thất hiện nay.</p>', '', 'Laptop HP có tốt không, laptop cũ', 'Laptop HP là một thương hiệu nổi tiêng trên thị trường laptop và để các bạn hiểu hơn về dòng máy này chúng tôi xin giới thiệu bài viết Laptop HP có tốt không?', 25, 1, 1, '2018-03-08 08:35:42', '2018-03-22 21:27:20'),
(32, 'Nơi bán laptop giá tốt nhất', 'noi-ban-laptop-gia-tot-nhat', 'noi-ban-laptop-gia-tot-nhat.jpg', 'Ngày nay ai ai cũng cần 1 chiếc laptop do đó ai cũng mong muốn mình mua được một chiếc laptop ưng ý với giá tốt nhất. Nên chọn được nơi bán laptop giá tốt nhất đó là điều mà khách hàng đang quan tâm. Chúng tôi là đơn vị phân phối laptop chất lượng, uy tín, kèm dịch vụ hậu mãi hàng đầu và là một trong những cửa hàng bán laptop giá tốt nhất tại TP HCM.', '<p style=\"text-align:justify\">Ng&agrave;y nay hầu như ai ai cũng cần 1 chiếc laptop cho c&ocirc;ng việc, học tập, giải tr&iacute;, nghi&ecirc;n cứu. V&igrave; vậy ai ai cũng mong muốn kiếm được một nơi b&aacute;n laptop chất lượng, dịch vụ uy t&iacute;n chuy&ecirc;n nghiệp v&agrave; l&agrave; nơi b&aacute;n <strong>laptop gi&aacute; tốt nhất</strong>. Bởi v&igrave; ai ai cũng cần một chiếc laptop đủ tốt để hoạt động v&agrave; dịch vụ phải đủ chuy&ecirc;n nghiệp để an t&acirc;m mua m&aacute;y. Phải đạt 2 điều đ&oacute; rồi mới t&igrave;m kiếm nơi n&agrave;o b&aacute;n laptop gi&aacute; tốt nhất.</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h2 style=\"text-align:justify\"><strong>C&aacute;ch để chọn nơi b&aacute;n laptop gi&aacute; tốt nhất</strong></h2>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h3 style=\"text-align:justify\"><strong>1.&nbsp;C&aacute;ch t&igrave;m kiếm th&ocirc;ng tin tr&ecirc;n mạng để tra ra nơi b&aacute;n laptop gi&aacute; tốt nhất</strong></h3>\n\n<p style=\"text-align:justify\"><br />\nDo đ&oacute; để kiếm nơi b&aacute;n <strong>laptop gi&aacute; tốt nhất</strong> kh&ocirc;ng hề kh&oacute;, bạn chỉ cần l&ecirc;n google search ngay từ kh&oacute;a &quot; laptop g&igrave; ở đ&acirc;u uy t&iacute;n, chất lượng, gi&aacute; tốt nhất&quot; chắc chắn sẽ c&oacute; h&agrave;ng ngh&igrave;n kết quả hiển thị cho bạn tha hồ lựa chọn. Nhưng gi&aacute; tốt nhất đ&oacute; l&agrave; linh động t&ugrave;y v&agrave;o ti&ecirc;u ch&iacute; chọn m&aacute;y của từng kh&aacute;ch h&agrave;ng. Đầu ti&ecirc;n trước khi chọn m&aacute;y phải kể đến l&agrave; chất lượng của chiếc laptop đ&oacute;. Thứ 2 l&agrave; dịch vụ bảo h&agrave;nh, hậu m&atilde;i. Sẽ thật kh&oacute; để kh&aacute;ch h&agrave;ng c&oacute; thể lựa chọn một chiếc m&aacute;y laptop cũ kh&ocirc;ng c&oacute; bảo h&agrave;nh được b&aacute;n với mức gi&aacute; si&ecirc;u rẻ. Tuy nhi&ecirc;n nếu sản phẩm chất lượng, bảo h&agrave;nh uy t&iacute;n v&agrave; dịch vụ hậu m&atilde;i tuyệt vời th&igrave; l&uacute;c đ&oacute; mới xem x&eacute;t xem l&agrave; gi&aacute; đ&oacute; đ&atilde; tốt nhất hay chưa.&nbsp;<br />\n&nbsp;</p>\n\n<h3 style=\"text-align:justify\"><strong>2. C&aacute;ch chọn nơi b&aacute;n laptop gi&aacute; tốt nhất ph&ugrave; hợp cho từng đối tượng</strong></h3>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">C&oacute; thể thấy gi&aacute; tốt nhất kh&ocirc;ng hẳn l&agrave; gi&aacute; rẻ nhất, m&agrave; đ&oacute; l&agrave; mức gi&aacute; rẻ nhất với những chất lượng, dịch vụ, bảo h&agrave;nh đi k&egrave;m. Như đ&atilde; n&oacute;i ở tr&ecirc;n l&agrave; n&oacute; c&ograve;n t&ugrave;y thuộc v&agrave;o ti&ecirc;u ch&iacute; chọn m&aacute;y. Đối với những kh&aacute;ch h&agrave;ng sỉ th&igrave; c&aacute;i họ quan t&acirc;m l&agrave; chất lượng sản phẩm v&agrave; một mức gi&aacute; rẻ nhất để họ c&oacute; thể về kiếm lời. V&agrave; đương nhi&ecirc;n đa phần họ sẽ chịu phần rủi ro bảo h&agrave;nh. C&ograve;n đối với những kh&aacute;ch lẻ c&oacute; điều kiện thấp c&aacute;i họ cần l&agrave; gi&aacute; rẻ nhất c&oacute; thể, họ sẽ c&oacute; thể bỏ qua hoặc hạn chế kh&acirc;u bảo h&agrave;nh để tiết kiệm đồng n&agrave;o hay đồng nấy.<br />\n<br />\nTuy nhi&ecirc;n rủi ro l&agrave; rất cao, nếu như m&aacute;y c&oacute; trục trặc g&igrave; th&igrave; họ sẽ tự chịu tr&aacute;ch nhiệm. Với một số người kh&aacute;c họ chọn chiếc laptop chất lượng v&agrave; bảo h&agrave;nh trong thời gian m&agrave; họ cho rằng l&agrave; đủ để kiểm tra 1 chiếc m&aacute;y c&oacute; chất lượng hay kh&ocirc;ng. Đối với nh&oacute;m n&agrave;y một chiếc <strong>laptop gi&aacute; tốt nhất</strong> sẽ l&agrave; chiếc m&aacute;y đạt chất lượng v&agrave; thời gian bảo h&agrave;nh họ cho l&agrave; cần thiết. Đối với một nh&oacute;m kh&aacute;c lại mong muốn t&igrave;m kiếm một chiếc laptop gi&aacute; tốt nhất thỏa m&atilde;n c&aacute;c ti&ecirc;u ch&iacute; như sản phẩm chất lượng, bảo h&agrave;nh l&acirc;u, cửa h&agrave;ng cơ sở uy t&iacute;n, dịch vụ hậu m&atilde;i tuyệt vời. Sau đ&oacute; mới t&igrave;m nơi b&aacute;n laptop với gi&aacute; tốt nhất đ&aacute;p ứng c&aacute;c ti&ecirc;u ch&iacute; tr&ecirc;n.<br />\n&nbsp;</p>\n\n<p style=\"text-align:justify\">Với những trường hợp m&igrave;nh n&ecirc;u tr&ecirc;n th&igrave; việc chọn 1 chiếc <strong>laptop gi&aacute; tốt nhất</strong> kh&ocirc;ng phải l&agrave; một con số cố định. Đ&acirc;y l&agrave; một biến số linh động v&agrave; để phục vụ được tất cả c&aacute;c kh&aacute;ch h&agrave;ng n&agrave;y đ&ograve;i hỏi cửa h&agrave;ng phải c&oacute; được dịch vụ tốt nhất v&agrave; mức gi&aacute; rẻ nhất để đ&aacute;p ứng cho từng nhu cầu của kh&aacute;ch h&agrave;ng.<br />\n<br />\nTại DC mobile ch&uacute;ng t&ocirc;i c&oacute; đầy đủ tất cả c&aacute;c dịch vụ tốt nhất, ch&iacute;nh s&aacute;ch bảo h&agrave;nh l&acirc;u nhất, khuyến m&atilde;i hấp dẫn nhất v&agrave; dịch vụ hậu m&atilde;i tốt nhất v&agrave; cả mức gi&aacute; rẻ nhất. Ch&uacute;ng t&ocirc;i sẽ t&ugrave;y v&agrave;o lựa chọn của kh&aacute;ch h&agrave;ng m&agrave; c&oacute; mức gi&aacute; ph&ugrave; hợp theo chất lượng, dịch vụ, bảo h&agrave;nh, khuyến m&atilde;i, hậu m&atilde;i. Đối với ch&uacute;ng t&ocirc;i, mong muốn lớn nhất l&agrave; được phục vụ kh&aacute;ch h&agrave;ng, được gi&uacute;p đỡ những kh&aacute;ch h&agrave;ng đang cần đến ch&uacute;ng t&ocirc;i.</p>\n\n<h3 style=\"text-align:justify\"><br />\n<strong>3. Tại sao n&oacute;i DC mobile l&agrave; nơi b&aacute;n laptop gi&aacute; tốt nhất tại tp hcm</strong></h3>\n\n<p style=\"text-align:justify\"><br />\n<strong>DC mobile</strong> tự h&agrave;o l&agrave; một trong những đơn vị chuy&ecirc;n cung cấp laptop uy t&iacute;n với gi&aacute; tốt nhất thị trường. Đối với ch&uacute;ng t&ocirc;i điều ti&ecirc;n quyết đầu ti&ecirc;n l&agrave; một sản phẩm chất lượng. Tiếp đến l&agrave; chế độ bảo h&agrave;nh trọn vẹn, ch&uacute;ng t&ocirc;i c&oacute; chế độ bảo h&agrave;nh tận nơi cho doanh nghiệp v&agrave; c&aacute; nh&acirc;n. Người mua sẽ kh&ocirc;ng phải tốn h&agrave;ng giờ đồng hồ để đến cửa h&agrave;ng của ch&uacute;ng t&ocirc;i để sửa laptop nếu c&oacute; lỗi xảy ra. Chế độ khuyến m&atilde;i v&ocirc; c&ugrave;ng hấp dẫn với nhiều qu&agrave; tặng gi&aacute; trị t&ugrave;y v&agrave;o từng thời điểm. Dịch vụ hậu m&atilde;i tuyệt vời cho kh&aacute;ch y&ecirc;n t&acirc;m. Tại DC mobile ch&uacute;ng t&ocirc;i, nh&acirc;n vi&ecirc;n được đ&agrave;o tạo b&agrave;i bản, chuy&ecirc;n nghiệp lu&ocirc;n lu&ocirc;n vui vẻ, nhiệt t&igrave;nh, cởi mở với kh&aacute;ch h&agrave;ng. Kh&aacute;ch h&agrave;ng sẽ h&agrave;i l&ograve;ng nếu mua laptop cũ tại cửa h&agrave;ng của ch&uacute;ng t&ocirc;i.<br />\n&nbsp;</p>', '', 'nơi bán laptop giá tốt nhất', 'Để mua được 1 chiếc laptop có tính năng đầy đủ, cấu hình tốt, giá vừa phải, thì khách hàng nên chọn nơi bán laptop giá tốt nhất để mua và sử dụng.', 24, 1, 1, '2018-03-09 08:36:21', '2018-03-23 07:01:47'),
(33, 'Dịch vụ bán laptop tphcm', 'dich-vu-ban-laptop-tphcm', NULL, 'Dịch vụ bán laptop tphcm nhằm mục đích cung cấp những chiếc laptop cũ chất lượng với giá rẻ uy tín. Chế độ chăm sóc khách hàng 5 sao tại DC mobile sẽ giúp khách hàng an tâm mua laptop tại đây. DC mobile muốn hướng đến chất lượng và dịch vụ tốt nhất để phục vụ cho khách hàng.', '<p style=\"text-align:justify\"><strong>Dịch vụ b&aacute;n laptop tại tphcm</strong> l&agrave; dịch vụ cung cấp những chiếc laptop chất lượng cho thị trường tphcm. Với dịch vụ tư vấn laptop miễn ph&iacute; nhằm t&igrave;m kiếm những chiếc laptop ph&ugrave; hợp với nhu cầu sử dụng của từng kh&aacute;ch h&agrave;ng. C&oacute; thể n&oacute;i dịch vụ <strong>b&aacute;n laptop tphcm </strong>ch&iacute;nh l&agrave; t&igrave;m kiếm những chiếc m&aacute;y chất lượng để cung cấp cho người d&ugrave;ng. Với nhiệm vụ đ&oacute;, DC mobile ch&uacute;ng t&ocirc;i muốn gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; được những chiếc laptop mong muốn với gi&aacute; rẻ nhất v&agrave; hưởng những dịch vụ tốt nhất d&agrave;nh ri&ecirc;ng cho kh&aacute;ch h&agrave;ng của DC mobile.</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><img alt=\"Dịch vụ bán laptop tại TP.HCM\" src=\"/upload/laptop/dich-vu-ban-laptop-tphcm-1.jpg\" style=\"height:692px; width:1037px\" /></p>\n\n<h2 style=\"text-align:justify\">&nbsp;</h2>\n\n<h2 style=\"text-align:justify\"><strong>C&aacute;ch m&agrave; DC mobile b&aacute;n laptop tphcm&nbsp;</strong></h2>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h3 style=\"text-align:justify\"><strong>1. C&aacute;ch tư vấn để chọn mua laptop cho kh&aacute;ch h&agrave;ng.</strong></h3>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Đầu ti&ecirc;n để c&oacute; 1 chiếc laptop ch&iacute;nh l&agrave; t&igrave;m kiếm th&ocirc;ng tin về chiếc laptop m&agrave; m&igrave;nh định mua. C&oacute; 2 c&aacute;ch để t&igrave;m kiếm th&ocirc;ng tin: t&igrave;m kiếm tr&ecirc;n mạng nếu đ&atilde; r&agrave;nh về m&aacute;y, t&igrave;m kiếm 1 chuy&ecirc;n gia tư vấn laptop. Với những ai kh&ocirc;ng r&agrave;nh về laptop n&ecirc;n t&igrave;m kiếm 1 chuy&ecirc;n gia tư vấn c&aacute;ch chọn 1 chiếc laptop ph&ugrave; hợp. Nếu kh&ocirc;ng biết t&igrave;m tại đ&acirc;u th&igrave; h&atilde;y để chuy&ecirc;n gia tư vấn của DC mobile tư vấn gi&uacute;p bạn.<br />\n<br />\n<br />\nCh&uacute;ng t&ocirc;i l&agrave; 1 trong những đơn vị chuy&ecirc;n <strong>b&aacute;n laptop tphcm</strong> uy t&iacute;n nhất. Để chọn laptop th&igrave; đầu ti&ecirc;n phải n&oacute;i đến l&agrave; mua cho mục đ&iacute;ch g&igrave;: c&ocirc;ng việc, học tập, nghi&ecirc;n cứu, giải tr&iacute;...Tiếp đến l&agrave; ng&acirc;n s&aacute;ch d&agrave;nh ra để mua laptop l&agrave; bao nhi&ecirc;u. Tiếp đến mới t&iacute;nh đến thương hiệu, kiểu d&aacute;ng, m&agrave;u sắc...Với những kh&aacute;ch h&agrave;ng kh&ocirc;ng c&oacute; đủ điều kiện kh&ocirc;ng thể n&agrave;o đua theo những kh&aacute;ch h&agrave;ng c&oacute; tiền được.<br />\n<br />\nVới số tiền &iacute;t bạn chỉ c&oacute; thể lựa chọn m&aacute;y c&oacute; cấu h&igrave;nh thấp mỏng đẹp hoặc cấu h&igrave;nh cao m&aacute;y th&ocirc;, nặng, cồng kềnh. T&ugrave;y v&agrave;o kh&aacute;ch m&agrave; tư vấn cho ph&ugrave; hợp. Với những ai gần với cửa h&agrave;ng th&igrave; n&ecirc;n chọn bảo h&agrave;nh tại cửa h&agrave;ng c&ograve;n xa th&igrave; c&oacute; thể chọn g&oacute;i bảo h&agrave;nh tại cửa h&agrave;ng. Đ&oacute; l&agrave; những điều kh&aacute;ch h&agrave;ng cần biết.</p>\n\n<h3 style=\"text-align:justify\"><br />\n<strong>2. C&aacute;ch chọn m&aacute;y v&agrave; kiểm tra m&aacute;y tại điểm b&aacute;n laptop tphcm của DC mobile</strong></h3>\n\n<p style=\"text-align:justify\"><br />\nĐể đi đến việc trả tiền cho chiếc m&aacute;y phải th&ocirc;ng qua c&ocirc;ng đoạn xem m&aacute;y v&agrave; test m&aacute;y. Test m&aacute;y th&igrave; c&oacute; thể test ngoại h&igrave;nh v&agrave; test phần cứng, phần mềm của m&aacute;y. Đầu ti&ecirc;n phải xem m&aacute;y c&oacute; nguy&ecirc;n vẹn kh&ocirc;ng, cấn m&oacute;p, xước, bể g&igrave; kh&ocirc;ng. Xem ngoại h&igrave;nh c&ograve;n đẹp hay kh&ocirc;ng. Tiếp đến l&agrave; kiểm tra cấu h&igrave;nh xem c&oacute; đ&uacute;ng cấu h&igrave;nh m&agrave; người b&aacute;n n&oacute;i kh&ocirc;ng. Cuối c&ugrave;ng l&agrave; test c&aacute;c chức năng ch&iacute;nh. Như vậy l&agrave; ho&agrave;n th&agrave;nh một giao dịch <strong>b&aacute;n laptop tphcm.</strong><br />\n<br />\nTrong b&agrave;i hướng dẫn c&aacute;ch test m&aacute;y b&ecirc;n m&igrave;nh sẽ hướng dẫn c&aacute;ch test m&aacute;y thật cụ thể chi tiết.<br />\n&nbsp;</p>\n\n<p style=\"text-align:justify\"><img alt=\"Test laptop tại fhp.com.vn\" src=\"/upload/laptop/test-may-tai-dc-mobile.jpg\" style=\"height:709px; width:945px\" /></p>\n\n<p style=\"text-align:justify\"><br />\n<strong>3. Tại sao chọn DC mobile l&agrave;m đơn vị cung cấp</strong></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Ch&uacute;ng&nbsp;t&ocirc;i l&agrave; đơn vị cung cấp laptop cũ nhiều năm v&agrave; được nhiều kh&aacute;ch h&agrave;ng ủng hộ. Phương ch&acirc;m của ch&uacute;ng t&ocirc;i lu&ocirc;n lu&ocirc;n n&oacute;i thẳng n&oacute;i thật kh&ocirc;ng dấu giếm che dấu điều g&igrave;. Ch&uacute;ng t&ocirc;i lu&ocirc;n lu&ocirc;n cung cấp đ&uacute;ng chất lượng. <strong>Dịch vụ b&aacute;n laptop tphcm</strong> của ch&uacute;ng t&ocirc;i bao gồm một chuỗi kết hợp để gi&uacute;p kh&aacute;ch h&agrave;ng y&ecirc;n t&acirc;m về 1 chiếc laptop m&igrave;nh đang sử dụng.<br />\n<br />\nThứ nhất, với kh&acirc;u tư vấn, ch&uacute;ng t&ocirc;i lu&ocirc;n lu&ocirc;n đưa ra những lựa chọn tốt nhất cho kh&aacute;ch h&agrave;ng kh&ocirc;ng cố gắng b&aacute;n những sản phẩm đắt tiền hơn với khả năng cao hơn m&agrave; kh&aacute;ch h&agrave;ng kh&ocirc;ng d&ugrave;ng tới. Cũng như ch&uacute;ng t&ocirc;i kh&ocirc;ng chọn những chiếc laptop c&oacute; cấu h&igrave;nh kh&aacute; thấp kh&ocirc;ng đủ để l&agrave;m việc. Ch&uacute;ng t&ocirc;i ưu ti&ecirc;n chọn m&aacute;y ph&ugrave; hợp với mục đ&iacute;ch sử dụng với số tiền trong khả năng của kh&aacute;ch h&agrave;ng.<br />\n<br />\nThứ hai, với kh&acirc;u test m&aacute;y ch&uacute;ng t&ocirc;i lu&ocirc;n để cho kh&aacute;ch h&agrave;ng thoải m&aacute;i test bất cứ thứ g&igrave;, những kh&aacute;ch h&agrave;ng kh&ocirc;ng r&agrave;nh sẽ được hướng dẫn test chi tiết. Thứ ba ch&uacute;ng t&ocirc;i b&aacute;n laptop với nhiều khuyến m&atilde;i k&egrave;m theo, dịch vụ hậu m&atilde;i nhiệt t&igrave;nh, nhanh nhẹn, th&acirc;n thiện, chế độ bảo h&agrave;nh 5 sao &iacute;t đơn vị n&agrave;o c&oacute; được đ&oacute; l&agrave; dịch vụ bảo h&agrave;nh tận nh&agrave;. V&agrave; cuối c&ugrave;ng l&agrave; tất cả những điều tr&ecirc;n được gộp lại trong 1 c&aacute;i gi&aacute; rất rẻ.</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Nếu bạn muốn mua một chiếc laptop h&atilde;y chat với chuy&ecirc;n gia tư vấn nh&eacute;, hoặc gọi v&agrave;o hotline của <strong>FHP</strong>&nbsp;để được tư vấn miễn ph&iacute; hoặc c&oacute; thể tham khảo trước c&aacute;c mẫu laptop vừa t&uacute;i tiền của m&igrave;nh trước khi nhờ tư vấn tại mục <strong>laptop cũ</strong>.</p>', '', 'dịch vụ bán laptop tphcm', '', 24, 1, 0, '2018-03-09 09:07:05', '2018-03-24 01:29:59'),
(34, 'Tại sao laptop không nhận USB', 'tai-sao-laptop-khong-nhan-usb', 'tai-sao-laptop-khong-nhan-usb.jpg', 'USB là 1 thiết bị hữu ích cho công việc cũng như giải trí. Tuy nhiên, trong quá trình sử dụng có một số lỗi, trục trặc, cụ thể như laptop không nhận usb mặc dù đã gắm đúng chỗ khe laptop.', '<h2 style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:13.0pt\">Tại sao laptop&nbsp;kh&ocirc;ng nhận usb? C&oacute; rất nhiều nguy&ecirc;n nh&acirc;n dẫn đến t&igrave;nh trạng n&agrave;y v&agrave; rất nhiều người sử dụng m&aacute;y t&iacute;nh đ&atilde; gặp phải lỗi n&agrave;y.</span></em></strong></span></span></h2>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"Laptop không nhận usb\" src=\"/upload/laptop/tai-sao-laptop-khong-nhan-usb.jpg\" style=\"height:250px; width:450px\" /></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</h2>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:18px\"><span style=\"color:#3498db\"><span style=\"font-family:Calibri,sans-serif\"><strong><em>Nguy&ecirc;n nh&acirc;n g&acirc;y ra lỗi laptop kh&ocirc;ng nhận usb</em></strong></span></span></span></h2>\n\n<p>&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:13.0pt\">N</span></em></strong><span style=\"font-size:13.0pt\">guy&ecirc;n nh&acirc;n c&oacute; thể l&agrave; do m&aacute;y t&iacute;nh ch&uacute;ng ta bị lỗi, nếu muốn kiểm tra trước ti&ecirc;n c&aacute;c bạn phải chắc chắn l&agrave; usb của bạn đang sử dụng b&igrave;nh thường bằng c&aacute;ch căm usb v&agrave;o một m&aacute;y t&iacute;nh kh&aacute;c nếu m&aacute;y t&iacute;nh đ&oacute; nhận b&igrave;nh thường th&igrave; chắn chắn m&aacute;y t&iacute;nh của bạn bị lỗi.</span></span></span></li>\n</ul>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:13.0pt\">C</span></em></strong><span style=\"font-size:13.0pt\">&ograve;n nếu ngược lại, th&igrave; do usb bị hỏng, trong trường hợp n&agrave;y c&aacute;ch khắc phục tốt nhất l&agrave; c&aacute;c bạn n&ecirc;n mua chiếc usb kh&aacute;c để sử dụng.&nbsp;</span></span></span></li>\n</ul>\n\n<h2 style=\"text-align:justify\">&nbsp;</h2>\n\n<h2 style=\"text-align:justify\"><span style=\"color:#3498db\"><span style=\"font-size:18px\"><span style=\"font-family:Calibri,sans-serif\">C&aacute;ch khắc phục lỗi m&aacute;y t&iacute;nh kh&ocirc;ng nhận usb</span></span></span></h2>\n\n<p>&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"khắc phục laptop không nhận usb\" src=\"/upload/laptop/Khac-phuc-loi-may-tinh-laptop-khong-nhan-usb-3.jpg\" style=\"height:349px; width:550px\" /></p>\n\n<ol>\n	<li style=\"text-align:justify\">\n	<h3><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">Do m&aacute;y t&iacute;nh của bạn thiếu Driver.</span></span></span></h3>\n	</li>\n</ol>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">M&aacute;y bạn mới mua, mới c&agrave;i lại win rất c&oacute; thể đ&atilde; thiếu Driver n&ecirc;n m&aacute;y k thể nhận được usb.</span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">C&aacute;ch khắc phục rất đơn giản th&ocirc;i, c&aacute;c bạn chỉ cần tải một bộ Driver bất k&igrave; về v&agrave; c&agrave;i đặt l&agrave; được.</span></span></span></li>\n</ul>\n\n<ol start=\"2\">\n	<li style=\"text-align:justify\">\n	<h3><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">Do c&ocirc;ng usb tiếp x&uacute;c k&eacute;m.</span></span></span></h3>\n	</li>\n</ol>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">M&aacute;y t&iacute;nh của bạn sử dụng trong một thời gian d&agrave;i kh&ocirc;ng vệ sinh dẫn đến t&igrave;nh trạng cổng usb bị bụi bẩn b&aacute;m.</span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">C&aacute;ch khắc phục rất đơn giản: bạn vệ sinh c&aacute;c cổng usb cho sạch sẽ v&agrave; thửu kết nối lại xem.</span></span></span></li>\n</ul>\n\n<ol start=\"3\">\n	<li style=\"text-align:justify\">\n	<h3><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">Cổng usb bị kh&oacute;a.</span></span></span></h3>\n	</li>\n</ol>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">T&igrave;nh trạng n&agrave;y gặp &iacute;t nhưng kh&ocirc;ng phải l&agrave; kh&ocirc;ng c&oacute;, c&oacute; thể bạn v&ocirc; t&igrave;nh kh&oacute;a m&agrave; kh&ocirc;ng biết hay cho bạn b&egrave; mượn m&aacute;y.</span></span></span></li>\n</ul>\n\n<ol start=\"4\">\n	<li style=\"text-align:justify\">\n	<h3><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">M&aacute;y t&iacute;nh bị nhiễm Virut</span></span></span></h3>\n	</li>\n</ol>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">Rất c&oacute; thể m&aacute;y t&iacute;nh của bạn đ&atilde; bị nhiễm viret độc hại l&agrave;m cho m&aacute;y kh&ocirc;ng thể kết nối được usb. Nếu bạn kh&ocirc;ng biết c&aacute;ch sử dụng m&aacute;y t&iacute;nh đ&uacute;ng c&aacute;ch th&igrave; rất dễ d&iacute;nh phải virut.</span></span></span></li>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\">C&aacute;ch khắc phục: bạn chỉ cần c&agrave;i phần mềm diệt virut v&agrave; scan lại m&aacute;y. Sau đ&oacute; restar lại m&aacute;y.</span></span></span></li>\n</ul>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:13.0pt\"><span style=\"color:#70ad47\">Tr&ecirc;n l&agrave; 4 t&igrave;nh trạng m&agrave; m&aacute;y t&iacute;nh thường gặp khi kh&ocirc;ng thể kết nối usb. C&aacute;c bạn tham khảo v&agrave; cho m&igrave;nh &yacute; kiến nh&eacute;!</span></span></span></span></p>', '', 'Tại sao laptop không nhận usb', 'Tại sao laptop không  nhận usb là câu hỏi được nhiều bạn hỏi, thắc mắc. Đây là vấn đề thường gặp trong quá trình sử dụng, nguyên nhân  thì có thể do laptop, driver hoặc usb có vấn đề.', 27, 1, 1, '2018-03-13 08:08:34', '2018-03-23 11:13:25'),
(35, 'Cửa hàng laptop uy tín ở thành phố Hồ Chí Minh', 'cua-hang-laptop-uy-tin-o-thanh-pho-ho-chi-minh', 'dich-vu-ban-laptop-tphcm-1.jpg', 'Cửa hàng hàng laptop uy tín ở thành phố hồ chí minh là nơi cung cấp những sản phẩm laptop giá rẻ cho tất cả mọi người.\nGiúp cho bạn nên mua laptop ở cửa hàng nào đem lại chất lượng tốt nhất.  Đồng thời cung cấp nơi mua laptop đáng tin cậy thành phố Hồ Chí Minh và nơi bán laptop cũ uy tín ở tphcm. Nếu ban đang đắn đo shop laptop uy tin tphcm thì bài viết sẽ là sự lựa chọn đúng đắn dành cho bạn.', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Thị trường kinh doanh latop </span></span><span style=\"font-size:11.0pt\"><span style=\"color:black\">nay c&oacute; sự tham gia của rất nhiều c&ocirc;ng ty v&agrave; cửa h&agrave;ng tr&ecirc;n khắp cả nước. Để t&igrave;m cho m&igrave;nh </span></span><strong><span style=\"font-size:11.0pt\"><span style=\"color:black\">Cửa h&agrave;ng laptop uy t&iacute;n ở tphcm</span></span></strong><span style=\"font-size:11.0pt\"><span style=\"color:black\"> hay c&aacute;c tỉnh th&agrave;nh kh&aacute;c l&agrave; đều kh&ocirc;ng hề đơn giản. </span></span></span><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Việc chọn mua một sản phẩm d&ugrave;ng l&acirc;u d&agrave;i v&agrave; phục vụ tốt cho c&ocirc;ng việc l&agrave; mong muốn của đa số kh&aacute;ch h&agrave;ng. V&igrave; thế muốn mua được một chiếc laptop hợp với t&uacute;i tiền v&agrave; nhu cầu c&ocirc;ng việc l&agrave; điều được đặt ra. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\"><img alt=\"Cửa hàng laptop uy tín ở thành phố Hồ Chí Minh\" src=\"/upload/laptop/dich-vu-ban-laptop-tphcm-1.jpg\" /></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"color:null\"><span style=\"font-size:18px\"><strong>Cửa h&agrave;ng laptop uy t&iacute;n ở tphcm được đ&aacute;nh gi&aacute; cao hiện nay</strong></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Th&agrave;nh phố Hồ Ch&iacute; Minh l&agrave; nơi c&oacute; mật độ d&acirc;n số tập trung đ&ocirc;ng đảo, l&agrave; th&agrave;nh phố trực thuộc trung ương, nằm trong v&ugrave;ng kinh tế trọng điểm ph&iacute;a nam.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Nơi đ&acirc;y tập trung c&aacute;c nh&agrave; m&aacute;y, x&iacute; nghiệp sản xuất tạo ra việc l&agrave;m cho h&agrave;ng triệu lao động. Hằng năm ở th&agrave;nh phố ở th&agrave;nh phố Hồ Ch&iacute; Minh c&oacute; h&agrave;ng trăm c&ocirc;ng ty doanh nghiệp được th&agrave;nh lập. Th&agrave;nh phố Hồ Ch&iacute; Minh c&ograve;n l&agrave; trung t&acirc;m gi&aacute;o dục của cả nước với nhiều trường Đại học h&agrave;ng đầu cả nước, với nhiều ng&agrave;nh nghề thế mạnh như c&ocirc;ng nghệ th&ocirc;ng tin, y dược&hellip;</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Th&agrave;nh phố Hồ Ch&iacute; Minh c&ograve;n l&agrave; trung t&acirc;m giải tr&iacute; của cả nước, nơi tập trung nhiều loại h&igrave;nh vui chơi giải tr&iacute; đ&aacute;p ứng nhu cầu của nh&acirc;n d&acirc;n.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Với lực lượng lao động được tập trung về th&agrave;nh phố Hồ Ch&iacute; Minh l&agrave;m cho th&agrave;nh phố Hồ Ch&iacute; Minh trở th&agrave;nh một thị trường ti&ecirc;u thụ rất rộng lớn. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Tại đ&acirc;y nhu cầu sinh hoạt v&agrave; mua sắm của người d&acirc;n rất lớn n&ecirc;n c&oacute; nhiều cửa h&agrave;ng kinh doanh laptop được th&agrave;nh lập <strong>n&ecirc;n mua laptop ở cửa h&agrave;ng n&agrave;o </strong>l&agrave; yếu tố đầu ti&ecirc;n khi mọi người muốn mua một chiếc laptop phục vụ nhu cầu học tập hay kinh doanh của m&igrave;nh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Ng&agrave;y với sự ph&aacute;t triền của c&ocirc;ng nghệ th&ocirc;ng tin v&agrave; mạng x&atilde; hội việc t&igrave;m kiếm cho một cửa h&agrave;ng kinh doanh uy t&iacute;n l&agrave; v&ocirc; c&ugrave;ng quan trọng. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Bạn l&agrave; người đang sinh sống ở th&agrave;nh phố Hồ Ch&iacute; Minh để tiết kiệm chi ph&iacute; bạn n&ecirc;n chọn c&aacute;c <strong>shop b&aacute;n Laptop uy t&iacute;n tphcm</strong>. Thay v&igrave; chọn cho m&igrave;nh một <strong>cửa h&agrave;ng b&aacute;n laptop uy t&iacute;n tại H&agrave; Nội</strong> hay một số địa b&agrave;n kh&aacute;c bạn n&ecirc;n chọn cho m&igrave;nh một <strong>nơi b&aacute;n laptop cũ uy t&iacute;n ở tphcm. &nbsp;</strong>T&ugrave;y nhu cầu mỗi người trong cuộc sống học tập kinh doanh của m&igrave;nh bạn n&ecirc;n cho một chiếc laptop ph&ugrave; hợp với y&ecirc;u cầu c&ocirc;ng việc của m&igrave;nh v&agrave; t&uacute;i tiền của m&igrave;nh. Nếu bạn l&agrave; l&agrave; sinh vi&ecirc;n hay người c&oacute; thu nhấp th&igrave; bạn n&ecirc;n t&igrave;m đến những <strong>nơi b&aacute;n laptop cũ uy t&iacute;n ở tphcm</strong>. Điều n&agrave;y l&agrave; việc bạn cần c&acirc;n nhắc kĩ trước khi đưa ra quyết định mua cho m&igrave;nh một </span></span> <span style=\"font-size:11.0pt\"><span style=\"color:black\">sản phẩm ưng &yacute;.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><a href=\"/upload/cua-hang-ban-laptop.png\"><img alt=\"cửa hàng bán laptop uy tín\" src=\"/upload/cua-hang-ban-laptop.png\" /></a></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Khi bạn đ&atilde; c&oacute; quyết định mua một chiếc laptop sao cho c&oacute; cấu h&igrave;nh tốt th&igrave; đừng ngần lại li&ecirc;n hệ với fhp. Trong c&aacute;c cửa h&agrave;ng kinh doanh laptop th&igrave; fph l&agrave; c&ocirc;ng ty lu&ocirc;n được đ&aacute;nh gi&aacute; cao về độ uy t&iacute;n v&agrave; chất lượng sản phẩm</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Fhp l&agrave; <strong>nơi mua laptop đ&aacute;ng tin cậy th&agrave;nh phố Hồ Ch&iacute; Minh, </strong>nơi cung cấp laptop gi&aacute; rẻ cho tất cả mọi kh&aacute;ch h&agrave;ng trong v&agrave; ngo&agrave;i nước. Fhp lu&ocirc;n đi đầu thị trường mang đến cho tất cả kh&aacute;ch h&agrave;ng những chiếc laptop c&oacute; chất lượng tốt nhất. Shop được đ&aacute;nh gi&aacute; l&agrave; <strong>shop laptop uy tin tphcm </strong>do kh&aacute;ch h&agrave;ng b&igrave;nh chọn. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:12pt\"><span style=\"color:#1f4d78\">Những gi&aacute; trị bạn đạt được khi mua h&agrave;ng ở Fhp</span></span></h2>\n\n<p>&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Đến với ch&uacute;ng t&ocirc;i việc phục vụ kh&aacute;ch h&agrave;ng l&agrave; niềm vui với ch&uacute;ng t&ocirc;i. Cty sẽ đem đến cho bạn chất lượng phục vụ tốt nhất v&agrave; gi&aacute; cả tốt. Những gi&aacute; trị c&aacute;c bạn c&oacute; thể đạt được như sau: </span></span></span></p>\n\n<ul>\n	<li><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Tư vấn mọi thắc mắc khi mua h&agrave;ng như th&ocirc;ng tin về sản phẩm.</span></span></span></li>\n	<li><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Tư vấn về cấu h&igrave;nh m&aacute;y sao cho ph&ugrave; hợp với c&ocirc;ng việc </span></span></span></li>\n	<li><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Mỗi sản phẩm lu&ocirc;n đi với chất lượng v&agrave; chữ t&iacute;n l&agrave;m đầu.</span></span></span></li>\n	<li><span style=\"font-size:14pt\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Mỗi chiếc laptop khi kh&aacute;ch h&agrave;ng đặt tr&ecirc;n web <a href=\"http://fhp.com.vn/\"><strong>fhp.com.vn</strong></a></span></span><span style=\"font-size:11.0pt\"><span style=\"color:black\">&nbsp;sẽ được xử l&yacute; v&agrave; chuyển nhanh nhất đến kh&aacute;ch h&agrave;ng.</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><br />\n<span style=\"font-size:14pt\"><span style=\"font-size:10.5pt\"><span style=\"color:black\"><strong><span style=\"background-color:white\">Mọi th&ocirc;ng tin chi tiết, xin vui l&ograve;ng </span></strong></span></span><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"color:black\">fhp</span></span></span><strong><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"color:black\"> qua địa chỉ sau đ&acirc;y:</span></span></span></strong><br />\n<span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"color:black\">fhp</span></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Địa chỉ: 35/6 B&ugrave;i Quang L&agrave; - Phường 12 - Quận G&ograve; Vấp - TP.HCM</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Điện thoại:&nbsp;0949.027.720 - 0963.027.720</span></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Email:&nbsp;</span></span><a href=\"mailto:tichtacso.com@gmail.com\" style=\"color:#0563c1; text-decoration:underline\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">tichtacso.com@gmail.com</span></span></a></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:14pt\"><span style=\"background-color:white\"><span style=\"font-size:10.5pt\"><span style=\"color:black\">Website:&nbsp;http://fhp.com.vn/</span></span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>', '', 'Cửa hàng laptop uy tín ở tphcm, Cửa hàng laptop uy tín ở tphcm, shop bán Laptop uy tín tphcm, cửa hàng bán laptop uy tín tại Hà Nội, nơi bán laptop cũ uy tín ở tphcm, nơi bán laptop cũ uy tín ở tphcm, nơi mua laptop đáng tin cậy thành phố Hồ Chí Minh, shop laptop uy tín tphcm', 'Khi bạn có nhu cầu mua một chiếc laptop giá mà còn chưa tìm được một Cửa hàng laptop uy tín ở thành phố Hồ Chí Minh. Bạn đang có nhu cầu mua laptop phục vụ công việc.. bài viết sẽ cũng cấp cho bạn nhưng thông tin hữu ích.', 46, 1, 1, '2018-03-14 04:45:52', '2018-03-27 10:05:10');
INSERT INTO `article` (`id`, `fullname`, `alias`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(36, 'Cách kết nối laptop với tivi qua cổng hdmi', 'cach-ket-noi-laptop-voi-tivi-qua-cong-hdmi', 'Kết nối HDMI với Tivi..jpg', 'Bạn đang có 1 chiếc laptop để xem phim – video hoặc là hình ảnh mà màn hình 14 inch hoặc 15 inch của là laptop khi xem không được thỏa mãn và quá bé thì việc kết nổi laptop với tivi qua cổng hdmi mà không cần sự hộ trợ kết nối mạng. Là điều đáng được mong chờ .', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Bạn đang c&oacute; 1 chiếc laptop để xem phim &ndash; video hoặc l&agrave; h&igrave;nh ảnh m&agrave; m&agrave;n h&igrave;nh 14 inch hoặc 15 inch của l&agrave; laptop khi xem kh&ocirc;ng được thỏa m&atilde;n v&agrave; qu&aacute; b&eacute; th&igrave; việc kết nổi laptop với tivi qua cổng hdmi m&agrave; kh&ocirc;ng cần sự hỗ&nbsp;trợ kết nối mạng&nbsp;l&agrave; điều đ&aacute;ng được mong chờ .</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Với&nbsp;HDMI (High Definition Multimedia Interface)&nbsp;được kết nối chất lượng nhất giữa thiết bị nguồn v&agrave; thiết bị ph&aacute;t. HDMI được truyền &acirc;m thanh v&agrave; video chất lượng cao giữa c&aacute;c thiết bị. C&ocirc;ng nghệ HDMI được sử dụng với c&aacute;c thiết bị như HDTV, m&aacute;y chiếu, DVD hoặc đầu Blu-ray. Nhờ c&oacute; HDMI m&agrave; ch&uacute;ng ta kh&ocirc;ng chỉ truyền được h&igrave;nh ảnh m&agrave; c&ograve;n truyền được cả &acirc;m thanh giữa c&aacute;c thiết bị.</span></span></span></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\">Sau đ&acirc;y ta c&ugrave;ng t&igrave;m hiểu c&aacute;ch kết nối laptop với tivi qua cổng hdmi</span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\">Bước 1</span></em></strong><span style=\"font-size:12.0pt\"> &ndash; Chuẩn bi :&nbsp; - 1 Chiếc laptop&nbsp; - 1 chiếc tivi v&agrave; 1 c&aacute;p HDMI.&nbsp; </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Đối với l&agrave; latop v&agrave; tivi th&igrave; bạn phải đảm bảo rằng hai&nbsp; thiết bị n&agrave;y phải c&oacute; hộ trợ HDMI.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">C&ograve;n đối với HDMI bạn cso thể&nbsp; mua ở cửa h&agrave;ng 1 c&aacute;ch dễ d&agrave;ng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Ket-noi-HDMI\" src=\"/upload/ketnoi/Cap-HDMI.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:12.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H&igrave;nh 1 : C&aacute;p HDMI</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\">Bước 2 :</span></em></strong><span style=\"font-size:12.0pt\">&nbsp;&nbsp; Nối 1 đầu của c&aacute;p HDMI với cổng HDMI tr&ecirc;n laptop. Khi cắm v&agrave;o laptop bạn lưu &yacute; đến phần chữ nổi tr&ecirc;n cổng chiếc laptop hoặc k&yacute; hiểu cổng HDMI.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"\" src=\"/upload/ketnoi/Ket-noi-HDMI-voi-Laptop.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:12.0pt\">H&igrave;nh 2 : Kết nối HDMI với Laptop</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\">Bước 3 :&nbsp; </span></em></strong><span style=\"font-size:12.0pt\">Nối đầu c&ograve;n lại c&aacute;p HDMI với chiếc Tivi. Phia sau m&agrave;n h&igrave;nh tivi l&agrave; cổng HDMI v&agrave; cũng được k&yacute; hiệu cổng nổi tr&ecirc;n miểng c&ocirc;ng. Bạn lưu &yacute; căm s&acirc;u v&agrave; chắc để đảm bảo được đường chuyền tốt nhất.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"ket-noi-HDMI-voi-Tivi\" src=\"/upload/ketnoi/ket-noi-HDMI-voi-Tivi.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:12.0pt\">H&igrave;nh 3 : Kết nối HDMI với Tivi.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:12.0pt\">Bước 4 :&nbsp; </span></em></strong><span style=\"font-size:12.0pt\">Bạn tiến h&agrave;nh bật tivi l&ecirc;n trước để điều chỉnh n&uacute;t nguồn v&agrave;o tivi bằng c&aacute;ch chọn v&agrave;o d&ograve;ng lệnh HDMI trong bảng inputs hiện ra.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"dieu-chinh-tren-tivi\" src=\"/upload/ketnoi/dieu-chinh-tren-tivi.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:12.0pt\">H&igrave;nh 4 : Điều chỉnh tr&ecirc;n tivi.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><strong>Bước 5 : </strong>&nbsp;Bật m&aacute;y t&iacute;nh l&ecirc;n v&agrave; chờ để 2 thiết bị kết nối với nhau .Sau khoảng 15s kh&ocirc;ng c&oacute; sự kết nội th&igrave; h&atilde;y bấm ph&iacute;m Windows + Ph&iacute;m P v&agrave; chọn Duplicate&nbsp; để hiển thị điều chỉnh tr&ecirc;n laptop v&agrave; kết nối 2 thiết bị .</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Thao-tac-tren-laptop\" src=\"/upload/ketnoi/Thao-tac-tren-laptop.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:12.0pt\">H&igrave;nh 5 : Thao t&aacute;c tr&ecirc;n laptop.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Chon-Duplicate\" src=\"/upload/ketnoi/Chon-Duplicate.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:12.0pt\">H&igrave;nh 6 : Chọn Duplicate.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><strong>Bước 6 :&nbsp;</strong> Đặt laptop v&agrave;o vị tr&iacute; hợp l&yacute; v&agrave; thưởng thức th&ocirc;i.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Hai-thiet-bi-da-ket-noi-thanh-cong-thong-qua-HDMI\" src=\"/upload/ketnoi/Hai-thiet-bi-da-ket-noi-thanh-cong-thong-qua-HDMI.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:12.0pt\">H&igrave;nh 7 : Hai thiết bị đ&atilde; kết nối th&agrave;nh c&ocirc;ng th&ocirc;ng qua HDMI.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>', '', 'Kết nối tivi với laptop qua HDMI, Kết nối cổng HDMI,', 'Bạn đang có 1 chiếc laptop để xem phim – video hoặc là hình ảnh mà màn hình 14 inch hoặc 15 inch của là laptop khi xem không được thỏa mãn và quá bé thì việc kết nổi laptop với tivi qua cổng hdmi mà không cần sự hộ trợ kết nối mạng.', 27, 1, 1, '2018-03-19 10:25:39', '2018-03-27 12:19:03'),
(37, 'Nên mua máy tính xách tay của hãng nào', 'nen-mua-may-tinh-xach-tay-cua-hang-nao', '8.jpg', 'Hiện nay trên thị trường máy tính rất đa dạng, phong phú và luôn thay đổi công nghệ vào máy để thu hút người dùng. Một số loại được ưu chuộng như  Apple, Dell, Asus, lenovo, Hp...khi mua máy tùy thuộc vào nhu cầu sử dụng máy vào việc gì ? và tài chính kinh tế để mua máy là bao nhiêu ? Sau đây chúng ta cùng điểm qua các hãng máy tính xách tay phổ biết để bạn có thể dưa ra sự lựa chọn cho mình:', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nếu bạn đang c&oacute; nhu cầu về mua sắm m&aacute;y t&iacute;nh x&aacute;ch tay v&agrave; bạn đang ph&acirc;n v&acirc;n n&ecirc;n chọn h&atilde;ng n&agrave;o cho bản th&acirc;n để n&oacute; đem lại &iacute;ch lợi tốt nhất. Hiện nay tr&ecirc;n thị trường m&aacute;y t&iacute;nh rất đa dạng, phong ph&uacute; v&agrave; lu&ocirc;n thay đổi c&ocirc;ng nghệ v&agrave;o m&aacute;y để thu h&uacute;t người d&ugrave;ng. Một số loại được ưu chuộng như&nbsp; Apple, Dell, Asus, lenovo, Hp...khi mua m&aacute;y t&ugrave;y thuộc v&agrave;o nhu cầu sử dụng m&aacute;y v&agrave;o việc g&igrave; ? v&agrave; t&agrave;i ch&iacute;nh kinh tế để mua m&aacute;y l&agrave; bao nhi&ecirc;u ? Sau đ&acirc;y ch&uacute;ng ta c&ugrave;ng điểm qua c&aacute;c h&atilde;ng m&aacute;y t&iacute;nh x&aacute;ch tay phổ biến&nbsp;để bạn c&oacute; thể dưa ra sự lựa chọn cho m&igrave;nh: </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">1 . H&atilde;ng Apple</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Khi n&oacute;i về apple th&igrave; l&agrave; một h&agrave;ng lớn về sản xuất ra những chiếc m&aacute;y t&iacute;nh chất lượng nhất thế gi&oacute; hiện nay.</span> <span style=\"font-size:14.0pt\">Apple đạt được số điểm ho&agrave;n hảo trong hỗ trợ kỹ thuật, thiết kế kiểu d&aacute;ng, chất lượng gia c&ocirc;ng vỏ, linh kiện, b&agrave;n ph&iacute;m/ touchpad, m&agrave;n h&igrave;nh hiển thị v&agrave; &acirc;m thanh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"hãng laptop apple\" src=\"/upload/laptop/chonhang/hang-apple.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 1 M&aacute;y t&iacute;nh x&aacute;ch tay Apple</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">Thiết kế :</span></em></strong><span style=\"font-size:14.0pt\">&nbsp;H&atilde;ng apple được thiết kế mang biểu tưởng l&agrave; &ldquo;quả c&aacute;o gặm đở&rdquo;, trọng lượng của m&aacute;y kh&aacute; l&agrave; nhẹ rất tinh xảo, ti&ecirc;u thụ điện năng thấp, c&aacute;c d&ograve;ng macbook do apple&nbsp; sản xuất th&igrave; chủ sử dụng hệ điều h&agrave;nh <span style=\"background-color:#fdfdfd\"><span style=\"color:black\">X Mavericks&nbsp;của h&atilde;ng. Được trang bị cấu h&igrave;nh m&aacute;y cực tốt. Về touchpad th&igrave; dường như b&agrave;n ph&iacute;m apple kh&ocirc;ng c&oacute; sự thay đổi nhiều 1 phần l&agrave; h&atilde;ng n&agrave;y muốn c&oacute; sự phấn k&iacute;ch v&agrave; quen thuộc khi sử dụng khi g&otilde;.</span></span></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"kiểu bàn phím của apple\" src=\"/upload/laptop/chonhang/ban-phim-apple.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\"><span style=\"background-color:#fdfdfd\"><span style=\"color:black\">H&igrave;nh 2 : B&agrave;n ph&iacute;m Apple</span></span></span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">M&agrave;n h&igrave;nh v&agrave; &acirc;m thanh</span></em></strong><span style=\"font-size:14.0pt\">:&nbsp; C&aacute;c d&ograve;ng laptop MacBook Pro hiện nay đ&atilde; c&oacute; sự cải tiến về chất lượng m&agrave;n h&igrave;nh, Apple sử dụng c&ocirc;ng nghệ Retina tr&ecirc;n d&ograve;ng laptop MacBook Pro 15 inch cho độ ph&acirc;n giải lớn 2880 x 1800 v&agrave; 2560 x 1600 cho phi&ecirc;n bản 13-inch v&agrave; tận dụng để tối ưu h&oacute;a tối đa m&agrave;n h&igrave;nh tuyệt đẹp .MacBook mới nhất của Apple hiện nay l&agrave; MacBook Pro v&agrave; MacBook Air đều c&oacute; &acirc;m thanh phong ph&uacute; v&agrave; r&otilde; r&agrave;ng. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">Phần mềm:</span></em></strong><span style=\"font-size:14.0pt\"> Apple cung cấp cho người d&ugrave;ng khả năng n&acirc;ng cấp miễn ph&iacute; l&ecirc;n hệ điều h&agrave;nh qua mạng internet gi&uacute;p bạn tiện lợi trong việc tương t&aacute;c với nh&agrave; sản xuất Apple hơn. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Laptop MacBook của Apple c&oacute; nhiều ưu điểm l&agrave; thế, song gi&aacute; cả vẫn c&ograve;n kh&aacute; lớn với người ti&ecirc;u d&ugrave;ng .</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">2. H&atilde;ng Dell </span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Theo mức ti&ecirc;u thụ hiện nay Dell l&agrave; thương hiệu b&aacute;n chạy nhất do Dell được đ&aacute;nh gi&aacute; l&agrave; d&ograve;ng laptop c&oacute; linh kiện bền, hiệu năng cũng thuộc loại cao n&ecirc;n kh&aacute; phổ biến v&agrave; ưu chuộng &nbsp;ưa chuộng hiện nay. Nhược điểm lớn nhất của Dell thường kh&ocirc;ng được đẹp mắt &ndash; tr&ocirc;ng kh&aacute;&nbsp; th&ocirc; so với h&atilde;ng kh&aacute;c v&agrave; pin cũng kh&ocirc;ng phải l&agrave; bền đối với loại m&agrave;n 12 inch trở xuống c&ograve;n đối với m&agrave;n h&igrave;nh 12 inch trờ l&ecirc;n th&igrave; g&acirc;y ấn tượng nhiều về thiết kế v&agrave; hiệu suất.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Hãng máy tính dell\" src=\"/upload/laptop/chonhang/hang-dell.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 3 : M&aacute;y t&iacute;nh x&aacute;ch tay Dell</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">Thiết kế</span></em></strong><span style=\"font-size:14.0pt\"> &nbsp;: Dell thường được đ&aacute;nh gi&aacute; l&agrave; một h&atilde;ng c&oacute; c&oacute; thiết kế th&ocirc; nhất c&aacute;c d&ograve;ng Dell Vostro, Dell Inspiron cho đến Dell Latitude 14 ~ 15,6 inch hầu hết đều c&oacute; sự tương đồng nhau v&agrave; thiết kế dầy, to c&oacute; phần nặng hơn c&aacute;c thương hiệu kh&aacute;c. Từ nhược điểm n&agrave;y kiểu d&aacute;ng n&agrave;y m&agrave; Dell ch&uacute; trọng đến vấn đề về độ bền của linh kiện b&ecirc;n trong v&agrave; mức tỏa nhiệt của laptop khi hoạt động nhiều v&agrave; bền bỉ. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">B&agrave;n ph&iacute;m v&agrave; touchpad lu&ocirc;n được Dell ch&uacute; trọng trong thiết kế, độ nhạy v&agrave; cảm gi&aacute;c của người d&ugrave;ng khi bấm ph&iacute;m - Dell&nbsp; thường điều hướng trơn tru, hỗ trợ mạnh mẽ. Chiếc m&aacute;y t&iacute;nh Alienware của Dell tiếp tục g&acirc;y ấn tượng với t&ugrave;y biến, b&agrave;n ph&iacute;m s&aacute;ng l&ecirc;n hỗ trợ xử l&yacute; trong đ&ecirc;m v&agrave; touchpad lớn k&egrave;m với c&aacute;c n&uacute;t chuy&ecirc;n dụng 2 b&ecirc;n kh&aacute; nhạy.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><img alt=\"bàn phím dell\" src=\"/upload/laptop/chonhang/ban-phim-dell.jpg\" /></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 4 : B&agrave;n ph&iacute;m m&aacute;y dell</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">M&agrave;n h&igrave;nh&nbsp; v&agrave; &acirc;m thanh</span></em></strong><span style=\"font-size:14.0pt\"> : Laptop m&aacute;y dell được trang bị m&agrave;n h&igrave;nh QHD - Dell Alienware 14, 17 v&agrave; 18 inch được thiết kế bắt mắt với m&agrave;n h&igrave;nh độ ph&acirc;n giải 1080p. D&ograve;ng laptop 14 inch của Dell c&oacute; vẻ đ&atilde; rực rỡ hơn trước, nhưng nh&igrave;n chung, m&agrave;n h&igrave;nh b&igrave;nh thường đ&atilde; s&aacute;ng hơn m&aacute;y t&iacute;nh x&aacute;ch tay trung b&igrave;nh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Chất lượng &acirc;m thanh của Dell được đ&aacute;nh gi&aacute; l&agrave; kh&ocirc;ng cao ,kể cả &acirc;m bass tr&ecirc;n d&ograve;ng m&aacute;y t&iacute;nh Dell vẫn thiếu một ch&uacute;t khả năng khi nghe nhạc hoặc xem phim. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">Phần mềm :</span></em></strong><span style=\"font-size:14.0pt\"> H&atilde;ng Dell th&igrave; kh&ocirc;ng c&oacute; nhiều software hỗ trợ do Dell kh&ocirc;ng đầu tư nhiều v&agrave;o việc viết phần mềm, phần cứng ri&ecirc;ng. M&agrave;u sắc v&agrave; kiểu d&aacute;ng của Dell kh&ocirc;ng đẹp v&agrave; kh&ocirc;ng c&oacute; nhiều cải tiến, gi&aacute; cả đa số &quot;chấp nhận được&quot; cho c&aacute;c bạn t&ugrave;y theo nhu cầu kh&aacute;c nhau, c&oacute; một nhược điểm l&agrave; thường tỏa nhiệt cao.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">3. H&atilde;ng&nbsp; Lenovo</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Lenovo được biết đến l&agrave; một d&ograve;ng m&aacute;y t&iacute;nh qu&aacute; phong ph&uacute; về chủng loại , m&agrave;u sắc v&agrave; kiểu d&aacute;ng kh&ocirc;ng nhưng thế h&atilde;ng c&ograve;n trang bị cho m&aacute;y cấu h&igrave;nh hiện đại v&agrave;o từng giai đoạn ph&aacute;t triển v&agrave; sản xuất của m&aacute;y.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><img alt=\"Hãng máy tính xách tay lenovo\" src=\"/upload/laptop/chonhang/hang-lenovo.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 5 : H&atilde;ng m&aacute;y t&iacute;nh x&aacute;ch tay lenovo</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">Thiết kế </span></em></strong><span style=\"font-size:14.0pt\">: &nbsp;Lenovo kh&aacute; quen thuộc với ch&uacute;ng ta với ưu điểm dễ nhận thấy l&agrave; trọng lượng nhẹ, nhỏ gọn khi x&aacute;ch tay, tr&ocirc;ng chiếc laptop như một m&aacute;y t&iacute;nh bảng. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Với d&ograve;ng Lenovo IBM Thinkpad: kiểu d&aacute;ng kh&aacute; nhỏ, thiết kế vu&ocirc;ng vức, nếu kh&ocirc;ng sở hữu những ưu điểm về độ bền linh kiện v&agrave; chất lượng cũng như sức mạnh cấu h&igrave;nh b&ecirc;n trong th&igrave; n&oacute; cũng kh&oacute; để kiếm được t&igrave;nh cảm ưu &aacute;i tr&ecirc;n thị trường. Nhược điểm của Lenovo l&agrave; lớp nhung bọc tr&ecirc;n nắp m&aacute;y rất dễ bị trầy sướt.&nbsp; B&agrave;n ph&iacute;m Lenovo thường c&oacute; gi&aacute;c mạnh mẽ giữa tay v&agrave; b&agrave;n ph&iacute;m, khoảng c&aacute;ch giữa c&aacute;c ph&iacute;m rộng v&agrave; h&igrave;nh dạng cong. Touchpad trơn tru, chuyển hướng ch&iacute;nh x&aacute;c v&agrave; TrackPoint l&agrave; thiết bị trỏ nhưng v&ocirc; c&ugrave;ng ch&iacute;nh x&aacute;c sẽ gi&uacute;p bạn di chuyển nhẹ nh&agrave;ng đến bất cứ nơi đ&acirc;u tr&ecirc;n m&agrave;n h&igrave;nh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><img alt=\"bàn phím lenovo\" src=\"/upload/laptop/chonhang/ban-phim-lenovo.png\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 6 : &nbsp;B&agrave;n ph&iacute;m lenovo.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">M&agrave;n h&igrave;nh v&agrave; &acirc;m thanh:</span></em></strong><span style=\"font-size:14.0pt\"> Laptop của Lenovo thường kh&ocirc;ng ch&uacute; trọng &acirc;m thanh v&agrave; h&igrave;nh ảnh, cả &acirc;m thanh v&agrave; h&igrave;nh ảnh thường chỉ ở mức trung b&igrave;nh v&agrave; dễ chịu, rất &iacute;t c&aacute;c trường hợp trong đ&oacute; c&aacute;c thiết bị của Lenovo nổi bật hơn so với c&aacute;c đối thủ cạnh tranh về điểm n&agrave;y.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">Phần mềm : </span></em></strong><span style=\"font-size:14.0pt\">Lenovo cung cấp c&aacute;c tiện &iacute;ch tiện dụng tr&ecirc;n c&aacute;c d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay h&agrave;ng đầu. IdeaPads, như Flex 14, t&iacute;nh năng &quot;One Key Recovery&quot; để sao lưu tức thời, phần mềm quản l&yacute; năng lượng Energy Manager v&agrave; Lenovo Companion cho kh&aacute;m ph&aacute; ứng dụng nhanh ch&oacute;ng . Dell c&ograve;n đ&oacute;ng g&oacute;i &quot;QuickConnect&quot; để kiểm so&aacute;t m&aacute;y t&iacute;nh x&aacute;ch tay của bạn với điện thoại Android, cũng như &quot;QuickCast&quot; để trao đổi dữ liệu giữa c&aacute;c m&aacute;y t&iacute;nh trong c&ugrave;ng một mạng LAN.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">4. H&atilde;ng&nbsp; Asus</span></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Asus l&agrave; một h&atilde;ng đ&atilde; xuất hiện kh&aacute; l&acirc;u đời - &nbsp;khả năng PR cho sản phẩm của họ cũng kh&ocirc;ng phải b&agrave;n c&atilde;i. Ngo&agrave;i những thiết kế s&aacute;ng tạo về kiểu d&aacute;ng cho đến m&agrave;n h&igrave;nh,&hellip; thu h&uacute;t giới c&ocirc;ng nghệ m&agrave; thương hiệu của họ cũng được biết đến khi vượt trội hầu hết c&aacute;c đối thủ cạnh tranh về hạng mục hỗ trợ kỹ thuật.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"máy tính laptop asus\" src=\"/upload/laptop/chonhang/hang-asus.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 7 : H&atilde;ng m&aacute;y t&iacute;nh x&aacute;ch tay Asu</span></em></span></span><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">s</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">Thiết kế :</span></em></strong><span style=\"font-size:14.0pt\"> ASUS &nbsp;c&oacute; s&aacute;ng tạo ri&ecirc;ng của m&igrave;nh khi cho ra đời mẫu laptop &quot;lật nắp&quot;. ASUS chuyển đổi nắp tr&ecirc;n của latop Taichi 21 th&agrave;nh một m&agrave;n h&igrave;nh cảm ứng thứ hai, đ&acirc;y l&agrave; một sự s&aacute;ng tạo &quot;lạ l&ugrave;ng&quot; v&agrave; &quot;t&aacute;o bạo&quot;, m&agrave;n h&igrave;nh &quot;k&eacute;p&quot; thiết kế &quot;lai&quot;. H&atilde;ng ASUS đ&atilde; loại bỏ khung nh&ocirc;m m&atilde; n&atilde;o cổ điển, cho ra mắt tại thị trường Việt Nam một nguồn cảm hứng thiết kế với d&aacute;ng vẻ sắc mỏng, tinh xảo gợi h&igrave;nh ảnh những chiếc kim đồng hồ s&aacute;ng b&oacute;ng. H&atilde;ng c&ograve;n bổ sung k&iacute;nh cường lực si&ecirc;u bền c&ocirc;ng nghệ chống trầy xước tr&ecirc;n nắp gi&uacute;p sản phẩm c&oacute; khả năng phản quang cực đẹp, khung m&aacute;y được l&agrave;m bằng vỏ nhựa.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><em><span style=\"font-size:14.0pt\">B&agrave;n ph&iacute;m :</span></em></strong><span style=\"font-size:14.0pt\"> B&agrave;n ph&iacute;m m&aacute;y t&iacute;nh x&aacute;ch tay ASUS thường cảm gi&aacute;c mạnh mẽ, bố tr&iacute; hợp l&yacute; v&agrave; kh&ocirc;ng đ&iacute;nh khi g&otilde;.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><img alt=\"bàn phím asus\" src=\"/upload/laptop/chonhang/hang-laptop-asus.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 8 : B&agrave;n ph&iacute;m asus.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">M&agrave;n h&igrave;nh v&agrave; &acirc;m thanh: m&agrave;n h&igrave;nh m&aacute;y asus thường c&oacute; độ ph&acirc;n giải cao v&agrave; m&agrave;u sắc sắc n&eacute;t, chất lượng m&agrave;n h&igrave;nh cực chuẩn , c&aacute;c tile c&oacute; m&agrave;u sắc tươi s&aacute;ng, sống động tr&ecirc;n một nền m&agrave;u rực rỡ , phần m&agrave;n h&igrave;nh n&agrave;y thể hiện r&otilde; hơn khi m&aacute;y trang bị windows 8 trở l&ecirc;n.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">&Acirc;m thanh 1 số m&aacute;y sử dụng c&ocirc;ng nghệ mới về Audio cho ph&eacute;p truyền &acirc;m to mặc d&ugrave; chất lượng &acirc;m chưa thực sự &quot;r&otilde; rệt&quot;. C&aacute;c video v&agrave; b&agrave;i h&aacute;t được ph&aacute;t với một &acirc;m lượng bass vừa phải. Tuy nhi&ecirc;n, được đ&aacute;nh gi&aacute; chung l&agrave; tr&ecirc;n mức trung b&igrave;nh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Phần mềm từ Asus : C&aacute;c d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay gần đ&acirc;y của ASUS được bổ sung tiện &iacute;ch từ 20 ứng dụng độc quyền tr&ecirc;n c&aacute;c m&aacute;y t&iacute;nh x&aacute;ch tay, điều chỉnh m&agrave;n h&igrave;nh hiển thị, ASUS WebStorage cung cấp hữu &iacute;ch 5.5GB dung lượng miễn ph&iacute; (tăng từ 2GB năm ngo&aacute;i), v&agrave; ASUS Instant Connect c&oacute; thể sử dụng chung giữa điện thoại Android v&agrave; m&aacute;y t&iacute;nh x&aacute;ch tay ASUS.</span></span></span></p>', '', 'nên mua máy tính laptop hãng nào, hãng laptop tốt nhất hiện nay,', 'Trên thị trường máy tính rất đa dạng, phong phú và luôn thay đổi công nghệ vào máy để thu hút người dùng. Nên việc mua máy tính xách tay của hãng nào tốt nhất hiện nay là điều khá băn khoăn của nhiều người.', 29, 1, 1, '2018-03-20 03:13:16', '2018-03-26 03:07:12'),
(38, 'Phần mềm test laptop tốt nhất hiện nay', 'phan-mem-test-laptop-tot-nhat-hien-nay', 'phan-mem-kiem-tra-phan-cung-may-tinh-tot-nhat-1.jpg', '', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Laptop l&agrave; một phần trong c&ocirc;ng việc hiện tại của ch&uacute;ng ta, nhưng khi ta đi mua hay thậm ch&iacute; muốn biết cấu h&igrave;nh của m&aacute;y thế n&agrave;o th&igrave; 1 trong nhưng c&aacute;c test m&aacute;y t&iacute;nh nhanh v&agrave; đơn giản l&agrave; d&ugrave;ng <strong>phần mềm&nbsp;test laptop</strong>. H&ocirc;m nay ch&uacute;ng ta sẽ đi t&igrave;m hiểu chuy&ecirc;n s&acirc;u về c&aacute;c&nbsp;phần mềm test m&aacute;y t&iacute;nh: </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\">1 &ndash; Phần mềm CPU-Z</span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">CPU Z l&agrave; một phần mềm kh&aacute; nổi tiển về hiển thị th&ocirc;ng tin m&aacute;y , đ&acirc;y l&agrave; một trong những phần mềm kiểm tra phần cứng, cấu h&igrave;nh m&aacute;y t&iacute;nh phổ biến v&agrave; dễ sử dụng nhất. Để sử dụng bạn chỉ cần tải CPU Z ph&iacute;a dưới file exe về m&aacute;y, c&agrave;i đặt v&agrave; khởi động l&ecirc;n, l&uacute;c n&agrave;y bạn sẽ thấy hiển thị tất cả c&aacute;c th&ocirc;ng tin chi tiết của m&aacute;y.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"phần mềm cpu-z\" src=\"/upload/laptop/chonhang/test/phan-mem-kiem-tra-phan-cung-may-tinh-tot-nhat-2015-1.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 1 : Th&ocirc;ng tin về m&aacute;y t&iacute;nh hiển thị tr&ecirc;n CPU-Z.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Phần mềm CPU-Z cho bạn biết được thiết bị của bạn đang hoạt động thế n&agrave;o, tốc độ&nbsp; chạy l&agrave; bao nhiều, c&aacute;c th&ocirc;ng số chi tiết về caches, memory, mainboard,.... v&agrave; cung cấp th&ocirc;ng tin về RAM, VGA v&agrave; Mainboard. Khi bạn mua một chiếc m&aacute;y bộ được lắp r&aacute;p sẵn v&agrave; muốn xem th&ocirc;ng tin chi tiết c&aacute;c th&agrave;nh phần b&ecirc;n trong m&agrave; kh&ocirc;ng phải th&aacute;o tung th&ugrave;ng m&aacute;y th&igrave; tải CPU-Z về m&aacute;y để xem v&agrave; biết th&ocirc;ng tin về m&aacute;y&nbsp; t&iacute;nh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">2 &ndash; Phần mềm GPU-Z</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Phần mềm GPU-Z l&agrave; một c&ocirc;ng cụ gi&uacute;p người d&ugrave;ng kiểm tra th&ocirc;ng số chi tiết của vi xử l&yacute; v&agrave; th&ocirc;ng tin về card đồ họa của laptop, m&aacute;y t&iacute;nh. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"phần mềm gpu-z\" src=\"/upload/laptop/chonhang/test/phan-mem-kiem-tra-phan-cung-may-tinh-tot-nhat-1.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 2 : Th&ocirc;ng tin về m&aacute;y t&iacute;nh hiển thị tr&ecirc;n GPU-Z.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Ngo&agrave;i ra, n&oacute; c&ograve;n&nbsp; cho người d&ugrave;ng chi tiết v&agrave; đầy đủ c&aacute;c th&ocirc;ng số d&ograve;ng Card m&agrave;n h&igrave;nh của h&atilde;ng sản xuất NVIDIA v&agrave; ATI bao gồm model, GPU với c&aacute;c th&ocirc;ng tin về c&ocirc;ng nghệ v&agrave; kỹ thuật chế tạo, phi&ecirc;n bản, t&ecirc;n c&ocirc;ng ty, m&atilde; sản phẩm, k&iacute;ch thước, phi&ecirc;n bản BIOS, giao diện kết nối, tốc độ xử l&yacute;, băng th&ocirc;ng, bộ nhớ RAM, phi&ecirc;n bản DirectX v&agrave; driver, xung nhịp v&agrave; chế độ card. Phần mềm n&agrave;y chủ yếu được d&ugrave;ng cho người d&ugrave;ng khi mua&nbsp; m&aacute;y cấu h&igrave;nh cao th&igrave; GPU-Z l&agrave; sự lựa chọn h&agrave;ng đầu.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">3 &ndash; Phần mềm Core Temp</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Core Temp l&agrave; phần mềm kiểm tra phần cứng PC, m&aacute;y t&iacute;nh được nhắc tới tiếp theo. Ngo&agrave;i ra n&oacute; c&ograve;n theo d&otilde;i nhiệt độ của CPUv&agrave; hiển thị th&ocirc;ng số chi tiết về nhiệt độ v&agrave; c&ocirc;ng suất ti&ecirc;u thụ điện hiện tại của CPU.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"phần mềm core temp\" src=\"/upload/laptop/chonhang/test/Core-Temp.png\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em>H&igrave;nh 3 : Th&ocirc;ng tin về m&aacute;y t&iacute;nh hiển thị tr&ecirc;n Core Temp.</em></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Phần mềm Core Temp được d&ugrave;ng chủ yếu cho m&aacute;y đời cũ hoặc m&aacute;y t&iacute;nh PC l&agrave; chủ yếu. Việc sử dụng phần mềm n&agrave;y gi&uacute;p m&aacute;y t&iacute;nh ở trong trạng th&aacute;i tốt nhất v&igrave; người d&ugrave;ng biết chi tiết trạng th&aacute;i của m&aacute;y m&agrave; điều chỉnh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">4 &ndash; Phần mềm Furmark&nbsp; </span></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Phần mềm Furmark c&oacute; chức năng đẩy VGA l&ecirc;n hoạt động ở 100% c&ocirc;ng suất để xem VGA c&oacute; bị qu&aacute; nhiệt hay kh&ocirc;ng. Khi chơi game thường xuy&ecirc;n v&agrave; gặp t&igrave;nh trạng m&aacute;y đang chạy mượt m&agrave; m&agrave; bỗng giật v&agrave; lag hay đột ngột bị m&agrave;n h&igrave;nh xanh chết ch&oacute;c th&igrave; rất c&oacute; thể l&agrave; lỗi ph&aacute;t sinh từ VGA. Th&igrave; c&ocirc;ng cụ n&agrave;y sẽ rất hữu &iacute;ch cho bạn.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"phần mềm furmark\" src=\"/upload/laptop/chonhang/test/phan-mem-kiem-tra-phan-cung-may-tinh-tot-nhat-2.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><em>H&igrave;nh 4 : Th&ocirc;ng tin về m&aacute;y t&iacute;nh hiển thị tr&ecirc;n Furmark.</em></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">5 &ndash;&nbsp; Phần mềm Fraps</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Fraps cũng l&agrave; một phần mềm kiểm tra phần cứng m&aacute;y t&iacute;nh kh&aacute; quen thuộc đặc biệt ở d&acirc;n chơi game, n&oacute; gi&uacute;p đo số khung h&igrave;nh tr&ecirc;n gi&acirc;y trong bất kỳ ứng dụng n&agrave;o đang chạy v&agrave; cung cấp khả năng chụp h&igrave;nh v&agrave; ghi h&igrave;nh những g&igrave; đang xảy ra tr&ecirc;n m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh hay t&iacute;nh số FPS trung b&igrave;nh trong một khoảng thời gian định sẵn.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"phần mềm fraps\" src=\"/upload/laptop/chonhang/test/phan-mem-kiem-tra-phan-cung-may-tinh-tot-nhat-5-1.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 5 : Th&ocirc;ng tin về m&aacute;y t&iacute;nh hiển thị tr&ecirc;n Fraps.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Phần mềm n&agrave;y chủ yếu được d&ugrave;ng cho người d&ugrave;ng hay chơi game hoặc c&aacute; qu&aacute;n n&eacute;t th&igrave; Phần mềm Fraps l&agrave; sự lựa chọn h&agrave;ng đầu.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Tr&ecirc;n đ&acirc;y l&agrave; 5 trong những phần mềm test m&aacute;y t&iacute;nh kh&aacute; chuẩn v&agrave; cực kỳ m&agrave; m&igrave;nh đ&atilde; kiểm tra rồi th&ocirc;ng k&ecirc; lại sau khi thử nghiệm.</span></span></span></p>', '', 'phần mềm test laptop, ứng dụng test máy laptop,', 'Máy tính là một phần trong công việc hiện tại của chúng ta nhưng khi ta đi mua hay thậm chí muốn biết cấu hình của máy thế nào thì 1 trong nhưng các test máy tính nhanh và đơn gian là dùng phần mềm để test', 27, 1, 1, '2018-03-20 03:40:27', '2018-03-25 19:01:43');
INSERT INTO `article` (`id`, `fullname`, `alias`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(39, 'Cáp kết nối ổ cứng với laptop', 'cap-ket-noi-o-cung-voi-laptop', 'o-cung-3.0.jpg', 'Kết nối ổ cứng với laptop để nhằm tăng thêm dung lượng bộ nhớ,  có thể di chuyển dễ dàng, hoạt động như 1 usb ...việc kết kết nối ổ cứng thường theo chuẩn IDE hay SATA mà thông thường là cổng USB 2.0 hoặc  3.0, cáp biến ổ cứng máy tính để bàn, ổ cứng dư, cũ bỏ đi thành ổ cứng di động, cách chọn mua box ổ cứng di động , tốc độ cao. Ổ cứng hiện có kích thước 3.5 đối với ổ pc hoặc ổ 2.5\" đối với ổ laptop đều có thể biến thành ổ cứng di động được.', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">C&aacute;p kết nối ổ cứng với laptop nhằm tăng th&ecirc;m dung lượng bộ nhớ,&nbsp; c&oacute; thể di chuyển dễ d&agrave;ng, hoạt động như 1 usb ...việc kết kết nối ổ cứng thường theo chuẩn IDE hay SATA m&agrave; th&ocirc;ng thường l&agrave; cổng USB 2.0 hoặc &nbsp;3.0, c&aacute;p biến ổ cứng m&aacute;y t&iacute;nh để b&agrave;n, ổ cứng dư, cũ bỏ đi th&agrave;nh ổ cứng di động, c&aacute;ch chọn mua box ổ cứng di động , tốc độ cao. Ổ cứng hiện c&oacute; k&iacute;ch thước 3.5 đối với ổ pc hoặc ổ 2.5&quot; đối với ổ laptop đều c&oacute; thể biến th&agrave;nh ổ cứng di động được.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Sau đ&acirc;y l&agrave; những c&aacute;p kết nối rất nhỏ gọn v&agrave; tiện d&ugrave;ng, tương th&iacute;ch với mọi hệ điều h&agrave;nh Windows XP 7 8 v&agrave; cả 10.</span></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Box 2.0 vỏ nhựa </span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><img alt=\"họp box wd\" src=\"/upload/laptop/chonhang/ketnoiocung/hop-box-WD.jpg\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 1 : Hộp box WD.</span></em></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Phần l&otilde;i trong hộp box</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><img alt=\"ben trong hop box wd\" src=\"/upload/laptop/chonhang/ketnoiocung/ben-trong%20hop-box-wd.jpg\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 2 : B&ecirc;n trong hộp box WD.</span></em></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Box vỏ nhựa, d&ugrave;ng USB chuẩn 3.0</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\"><img alt=\"Hộp box ORICON\" src=\"/upload/laptop/chonhang/ketnoiocung/hop-box-ORICON.jpg\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 3 : Hộp box ORICON</span></em></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">C&aacute;p USB to SATA 3.0</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\"><img alt=\"ổ cứng sata 3.0\" src=\"/upload/laptop/chonhang/ketnoiocung/o-cung-3_0(1).jpg\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 4 : Ổ cứng sata 3.0</span></em></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Trong h&igrave;nh lần lượt l&agrave; c&aacute;p SATA to USB 2.0; SATA to USB 3.0 v&agrave; box ổ cứng di động​</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\"><img alt=\"3 loại cáp thông dụng.\" src=\"/upload/laptop/chonhang/ketnoiocung/3-loai-o-cung-thong-dung.jpg\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 5 : 3 loại c&aacute;p th&ocirc;ng dụng.</span></em></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">C&aacute;c ổ cứng di động &nbsp;mua sẵn thường l&agrave; 1 ổ cứng 2.5&quot; c&oacute; box 2.5&quot; k&egrave;m 1 cổng v&agrave; c&aacute;p USB.</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><img alt=\"các  ổ cứng khi mua săn\" src=\"/upload/laptop/chonhang/ketnoiocung/o-cung-khi-mua-san.jpg\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 6 : C&aacute;c ổ cứng khi mua sẵn</span></em></span></span></p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">C&aacute;p usb cắp trực tiếp kh&ocirc;ng cần nguồn ngo&agrave;i.</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><img alt=\"cáp cắm trực tiếp\" src=\"/upload/laptop/chonhang/ketnoiocung/cap-usb-cam-truc-tiep.jpg\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 7 : C&aacute;p usb cắm trực tiếp.</span></em></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>\n\n<ul>\n	<li style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Ngo&agrave;i ra c&aacute;c HDD box để cắm nhiều ổ cứng 1 l&uacute;c. Thiết bị n&agrave;y mang t&iacute;nh cố định nhiều hơn l&agrave; d&ugrave;ng box di động.</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><img alt=\"cắm nhiểu ổ cứng cùng 1 lúc\" src=\"/upload/laptop/chonhang/ketnoiocung/hdd-box-cam-nhieu-o-cung.png\" /></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 8 : HDD box cắm nhiều ổ&nbsp; c&ugrave;ng l&uacute;c.</span></em></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm; text-align:justify\">&nbsp;</p>', '', 'cáp kết nối ổ cứng với laptop, laptop được cắm ổ cứng thế nào', 'Kết nối ổ cứng với laptop để nhằm tăng thêm dung lượng bộ nhớ,  có thể di chuyển dễ dàng, hoạt động như 1 usb ...việc kết kết nối ổ cứng thường theo chuẩn IDE hay SATA mà thông thường là cổng USB 2.0 hoặc  3.0, cáp biến ổ cứng máy tính để bàn, ổ cứng dư, cũ bỏ đi thành ổ cứng di động, cách chọn mua box ổ cứng di động , tốc độ cao.', 25, 1, 1, '2018-03-20 04:16:46', '2018-03-27 21:26:20'),
(40, 'Cách kết nối laptop với tivi qua cổng vga', 'cach-ket-noi-laptop-voi-tivi-qua-cong-vga', 'thuong-thuc-sau-ket-noi.jpg', 'Việc kết nối laptop với tivi qua cổng VGA là một kiểu kết nối mới vì Cổng  VGA rất quen thuộc và dễ sử dụng. Do đó kiểu kết nối nay ngày càng trở nên thân thiện hơn với các hãng sản xuát tivi smart. Việc kết nối chiếc laptop với tivi này giúp bạn xem phim – video hoặc là hình ảnh một cách thỏa mãn và mãn nhãn hơn là kết nối qua cổng VGA là 1 điều đáng được mong chờ .', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Trong thời buổi c&ocirc;ng nghệ số thay đổi li&ecirc;n tục th&igrave; việc h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển một số kiểu kết nối mới để thay thế một số kiểu kết nối cụ đang hiện hữu trong ch&uacute;ng ta. Việc <strong>kết nối laptop với tivi qua cổng VGA</strong> l&agrave; một kiểu kết nối mới v&igrave; Cổng&nbsp; VGA rất quen thuộc v&agrave; dễ sử dụng. Do đ&oacute; kiểu kết nối n&agrave;y ng&agrave;y c&agrave;ng trở n&ecirc;n th&acirc;n thiện hơn với c&aacute;c h&atilde;ng sản xu&aacute;t tivi smart. Việc kết nối chiếc laptop với tivi n&agrave;y gi&uacute;p bạn xem phim &ndash; video hoặc l&agrave; h&igrave;nh ảnh một c&aacute;ch thỏa m&atilde;n v&agrave; m&atilde;n nh&atilde;n hơn l&agrave; kết nối qua cổng VGA l&agrave; 1 điều đ&aacute;ng được mong chờ .</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Sau đ&acirc;y ta c&ugrave;ng t&igrave;m hiểu&nbsp;việc kết nối n&agrave;y :</span> &nbsp; </span></span></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Bước 1 : Chuẩn bị</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">&nbsp;1 d&acirc;y VGA + 1 chiếc laptop + 1 Chiếc tivi&nbsp; c&oacute; hỗ trợ cổng VGA.</span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"dây vga\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/day-vga.jpg\" style=\"height:356px; width:400px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 1 : D&acirc;y VGA</span></em></span></span></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Bước 2 : Kết nối VGA với laptop.</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nối 1 đầu VGA với cổng VGA tr&ecirc;n laptop (giống kết nối m&aacute;y chiếu). </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><img alt=\"kết nối vga với laptop\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/ket-noi-vga-voi-laptop.jpg\" style=\"height:385px; width:800px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 2 : Cổng kết nối VGA với laptop</span></em></span></span></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Bước 3 : Kết nối VGA với tivi</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Sau đ&oacute;, nối tiếp đầu VGA c&ograve;n lại v&agrave;o cổng VGA của tivi . Bạn n&ecirc;n ch&uacute; &yacute; khoảng c&aacute;ch đặt laptop v&agrave; tivi phụ thuộc v&agrave;o chiều d&agrave;i của d&acirc;y c&aacute;p VGA.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Cổng kết nối VGA với tivi\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/ket-noi-vga-voi.jpg\" style=\"height:351px; width:700px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 3 : Cổng kết nối VGA với tivi</span></em></span></span></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Bước 4 : Điều khiển tr&ecirc;n tivi</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Sử dụng remote bấm n&uacute;t nguồn v&agrave;o của tivi. Sau đ&oacute; chọn v&agrave;o d&ograve;ng lệnh HDMI 1/MHL.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Chọn lệnh HDMI\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/Chon-lenh-HDMI.jpg\" style=\"height:285px; width:500px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 4 : Chọn lệnh HDMI</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Bước 5 :&nbsp; Điều chỉnh tr&ecirc;n laptop</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Chờ đợi tivi kết nối với laptop. Nếu đợi khoảng 15s kh&ocirc;ng thấy t&iacute;n hiệu nhận c&aacute;p. Bạn bấm đồng thời 2 tổ hợp ph&iacute;m Windows + P tr&ecirc;n laptop, sau đ&oacute; chọn v&agrave;o Duplicate để gh&eacute;p nối laptop với tivi.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Thao tác trên laptop\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/thao-tac-tren-laptop.jpg\" style=\"height:457px; width:700px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 5 : Thao t&aacute;c tr&ecirc;n laptop</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Thao tác trên laptop\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/chon-Duplicate.jpg\" style=\"height:476px; width:361px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 6 : Duplicate</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:14.0pt\">PC Screen Only</span></strong><span style=\"font-size:14.0pt\">: Chỉ hiển thị m&agrave;n h&igrave;nh nguồn xuất ra</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:14.0pt\">Duplicate</span></strong><span style=\"font-size:14.0pt\">: Hiển thị nội dung ở cả 2 m&agrave;n h&igrave;nh với c&ugrave;ng 1 nội dung</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:14.0pt\">Extend</span></strong><span style=\"font-size:14.0pt\">: Đ&acirc;y l&agrave; chế độ hiển thị song song 2 m&agrave;n h&igrave;nh v&agrave; &nbsp;c&oacute; thể k&eacute;o thả c&aacute;c đối tượng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:14.0pt\">Second screen Only</span></strong><span style=\"font-size:14.0pt\">: Chỉ hiển thị m&agrave;n h&igrave;nh thứ 2.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Bước 6 :&nbsp;&nbsp; Chỉnh vị tr&iacute; của m&aacute;y hợp với chiều d&agrave;i d&acirc;y VGA v&agrave; xem th&ocirc;i.</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"kết quả kết nối vga \" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/thuong-thuc-sau-ket-noi.jpg\" style=\"height:467px; width:700px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 6 : Thưởng thức kết nối vga.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>', '', 'kết nối vga giữa vga và laptop, cách kết nối vga và laptop', 'Việc kết nối chiếc laptop với tivi này giúp bạn xem phim – video hoặc là hình ảnh một cách thỏa mãn và mãn nhãn hơn là kết nối qua cổng VGA là 1 điều đáng được mong chờ .', 22, 1, 1, '2018-03-20 04:34:05', '2018-03-25 04:30:17'),
(41, 'Dòng laptop nào tốt nhất hiện nay', 'dong-laptop-nao-tot-nhat-hien-nay', 'cac-may-tinh-cu.jpg', 'Thị trường mua bán máy tính cũ hiện nay rất nhộn nhịp và sinh động hơn bao giờ hết một trong nhưng lý do được đưa ra là công nghệ thay đổi liên tục ở đời máy mới , nhu cầu công việc ngày 1 tăng, tình hình kinh tế đã thay đổi ít nhiều ..... nếu bạn là một người dùng thực sự muốn mua máy tính cũ để đáp ứng nhu cầu công việc hiện tại thì bài học này sẽ cung cấp và chia sẻ tới bạn những gì khi mua máy tính cũ.', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><img alt=\"mua máy tính cũ\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/chonmaytinhcu/cac-may-tinh-cu.jpg\" /></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 1 : C&aacute;c mua t&iacute;nh cũ.</span></em></span></span></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\">Những c&acirc;u hỏi được đặt ra trước khi đi mua m&aacute;y t&iacute;nh cũ l&agrave; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">N&ecirc;n chọn h&atilde;ng n&agrave;o tốt ch&uacute;t nhỉ ?</span></em></span></span></li>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">M&igrave;nh l&agrave;m c&aacute;i n&agrave;y th&igrave; mua m&aacute;y cấu h&igrave;nh sao cho ph&ugrave; hợp nhỉ ?</span></em></span></span></li>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">Tiền m&igrave;nh c&ograve;n c&oacute; từng n&agrave;y mua m&aacute;y n&agrave;o ngon ch&uacute;t nhỉ ?</span></em></span></span></li>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">.........</span></em></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Đ&oacute; l&agrave; những c&acirc;u hỏi đang được nhiều người d&ugrave;ng đặt ra khi mua m&aacute;y cũ. Sau đ&acirc;y m&igrave;nh sẽ chia sẻ to&agrave;n bộ kiến thức về m&aacute;y t&iacute;nh để bạn c&oacute; dịp trổ t&agrave;i khi mua m&aacute;y t&iacute;nh cũ nh&eacute; :</span></span></span></p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Về nhu cầu : </span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Việc trang bị m&aacute;y t&iacute;nh d&ugrave; mua mới hay cũ th&igrave; bạn cũng phải x&aacute;c định được mua m&aacute;y về l&agrave; g&igrave; ? một khi trả lời được c&acirc;u hỏi đ&oacute; bạn mới t&igrave;m ch&iacute;nh x&aacute;c loại m&aacute;y đ&aacute;p ứng được c&ocirc;ng việc của m&igrave;nh. </span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nếu l&agrave; d&acirc;n văn ph&ograve;ng, phục vụ giải tr&iacute;,học về m&aacute;y t&iacute;nh ... th&igrave; n&ecirc;n chọn loại c&oacute; cấu h&igrave;nh vừa phải , m&agrave;n h&igrave;nh rộng &nbsp;v&agrave; c&oacute; thể c&ugrave;i 1 ch&uacute;t. Như Dell, Asus hoặc lenovo. </span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nếu l&agrave; d&acirc;n đồ họa hoặc thiết kế &nbsp;h&igrave;nh v&agrave; ảnh th&igrave; bắt buộc m&aacute;y bạn mua phải c&oacute; Card đồ họa hộ trợ c&oacute; thể gắn trực tiếp tr&ecirc;n main hoặc card rời h&atilde;ng nổi tiếng cho d&acirc;n n&agrave;y l&agrave; Apple , Dell v&agrave; c&oacute; thể l&agrave; PC đời mới.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nếu bạn sử dụng m&aacute;y cho việc chơi game th&igrave; kh&ocirc;ng chỉ card đồ họa phải&nbsp; tốt m&agrave; c&ograve;n b&agrave;n ph&iacute;m bấm kh&ocirc;ng d&iacute;nh, &iacute;t n&oacute;ng, m&agrave;n h&igrave;nh 15inch trở l&ecirc;n đối với laptop.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Về cấu h&igrave;nh m&aacute;y ; </span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Cấu h&igrave;nh m&aacute;y l&agrave; những th&ocirc;ng số tr&ecirc;n c&aacute;c thiết bị được gắn gh&eacute;p v&agrave;o m&aacute;y cũ thể l&agrave;&nbsp; bộ xử l&yacute; (CPU :... ghz), Ram(t&iacute;nh bằng Gb), Bộ nhớ(t&iacute;nh bằng GB hoặc TB, Card graphic (t&iacute;nh bằng Gb), Đời main, Core (i bao nhi&ecirc;u), k&iacute;ch thước m&agrave;n h&igrave;nh(t&iacute;nh bằng inch)...</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Những th&ocirc;ng số n&agrave;y c&agrave;ng cao c&agrave;ng tốt nhưng phải phụ thuộc v&agrave;o t&agrave;i ch&iacute;nh kinh tế của bạn.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Về gi&aacute; cả : </span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">T&ugrave;y mỗi h&atilde;ng , cấu h&igrave;nh , thời gian sử dụng, địa điểm b&aacute;n th&igrave; c&oacute; mức gi&aacute; kh&aacute;c nhau nhưng khi mua m&aacute;y t&iacute;nh cũ th&igrave; rẻ hơn m&aacute;y mới 30-80% . Chỉ đ&aacute;p ứng cho người d&ugrave;ng c&oacute; kh&oacute; khăn về kinh tế.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"công cụ test\" src=\"/upload/laptop/chonhang/ketnoiocung/ketvga/chonmaytinhcu/phan-mem-test.png\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh 2 : C&ocirc;ng cũ&nbsp;test m&aacute;y</span></em></span></span></p>\n\n<h2 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Những b&agrave;i học được r&uacute;t ra :</span></span></span></span></h2>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Chọn c&ocirc;ng ty hoặc nơi cung cấp m&aacute;y t&iacute;nh cũ chất lượng v&agrave; uy t&iacute;n.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Để biết được nơi cung cấp m&aacute;y t&iacute;nh cũ đ&oacute; c&oacute; uy t&iacute;n kh&ocirc;ng th&igrave; bạn n&ecirc;n quan t&acirc;m đến ch&iacute;nh s&aacute;ch bảo h&agrave;nh m&aacute;y, th&aacute;i độ ứng xử nh&acirc;n vi&ecirc;n kỹ thuật, cam kết của người b&aacute;n v&agrave; gi&aacute; cả nơi đ&oacute;.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Nhờ người th&acirc;n &ndash; b&agrave;n b&egrave; c&oacute; k&iacute;nh nghiệp về m&aacute;y t&iacute;nh.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Tr&ecirc;n thực tế người c&oacute; kinh nghiệm d&ugrave;ng m&aacute;y t&iacute;nh th&igrave; khi c&oacute; họ đi c&ugrave;ng bạn sẽ y&ecirc;n t&acirc;m chọn m&agrave; kh&ocirc;ng lo về chất lượng v&agrave; cấu h&igrave;nh m&aacute;y nếu bạn m&ugrave; th&ocirc;ng tin n&agrave;y.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Kh&ocirc;ng n&ecirc;n mua m&aacute;y t&iacute;nh cũ ở cửa h&agrave;ng trực tuyến hoặc trang chợ đen.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nhưng nơi n&agrave;y lu&ocirc;n tiềm ẩn rủ r&ograve; rất cao đơn giản kh&ocirc;ng chỉ gian đối về tiền b&aacute;c m&agrave; c&ograve;n thay đổi linh kiện trong m&aacute;y rất kh&oacute; ph&aacute;t hiện trong thời gian ngắn.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Kiểm tra tổng quan khi mua m&aacute;y t&iacute;nh cũ.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Khi thấu hiểu c&aacute;c phần tr&ecirc;n rồi th&igrave; trước hết bạn phải phải kiểm tra t&iacute;nh thực tại của m&aacute;y t&iacute;nh cũ đ&oacute; như cpu,ram,m&agrave;n h&igrave;nh, b&agrave;n ph&iacute;m,chuột, ổ cứng ......thậm ch&iacute; l&agrave; độ n&oacute;ng của m&aacute;y sau khi hoạt động. Ngo&agrave;i ra bạn c&oacute; thể sử dụng phần mềm test để biết chi tiết hơn.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Thử nghiệm nguồn m&aacute;y t&iacute;nh.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nguồn m&aacute;y t&iacute;nh l&agrave; nơi cung cấp điện năng cho m&aacute;y hoạt động do đ&oacute; nguồn cũng l&agrave; 1 phần kh&ocirc;ng thể bỏ qua khi mua m&aacute;y.</span></span></span></p>', '', 'Bán máy tính cũ, mua máy tính cũ, bài học khi mua máy tính cũ , mua máy tính cũ ở đâu.', 'mua bán máy tính cũ hiện nay rất nhộn nhịp và sinh động hơn bao giờ hết một trong nhưng lý do được đưa ra là công nghệ thay đổi liên tục ở đời máy mới , nhu cầu công việc ngày 1 tăng, tình hình kinh tế đã thay đổi ít nhiều .....', 35, 1, 1, '2018-03-20 08:41:31', '2018-03-25 08:22:24'),
(42, 'Tổng hợp những kinh nghiệm khi mua máy tính cũ', 'tong-hop-nhung-kinh-nghiem-khi-mua-may-tinh-cu', 'DC-Mobile.png', 'Để sắm cho mình 1 chiếc máy tính cũ thì hiện nay ngoài những đã đọc qua trên báo mạng thì bạn cũng nên có cho mình 1 số kinh nghiệm thực tế khi mua máy tính cũ - nếu bạn là một người dùng thực sự muốn mua máy tính cụ hoặc biết chút kinh nghiệm để đáp ứng nhu cầu công việc hiện tại thì bài học này sẽ cung cấp tới bạn những gì cần biết khi mua máy tính cũ.', '<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"tổng hợp kinh nghiệm mua máy tính cũ\" src=\"/upload/ketnoi/tonghop/tong-hop-kinh-nghiem.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">H&igrave;nh : Kinh nghiệm khi mua m&aacute;y t&iacute;nh cũ</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Những c&acirc;u hỏi được đặt ra trước khi đi mua m&aacute;y t&iacute;nh cũ&nbsp;l&agrave; :</span></span></span></p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">N&ecirc;n chọn h&atilde;ng n&agrave;o tốt &nbsp;hơn ch&uacute;t nhỉ ?</span></em></span></span></li>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">M&igrave;nh l&agrave;m c&aacute;i n&agrave;y th&igrave; mua m&aacute;y cấu h&igrave;nh sao &nbsp;nhỉ ?</span></em></span></span></li>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">&nbsp;3 triệu m&igrave;nh c&oacute; thể mua m&aacute;y n&agrave;o ngon ch&uacute;t nhỉ ?</span></em></span></span></li>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">.........</span></em></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Đ&oacute; l&agrave; những c&acirc;u hỏi đang được nhiều người d&ugrave;ng đặt ra khi mua m&aacute;y cũ. Sau đ&acirc;y m&igrave;nh sẽ tổng hợp kiến thức về m&aacute;y t&iacute;nh n&oacute;i chung v&agrave; m&aacute;y t&iacute;nh cũ n&oacute;i ri&ecirc;ng để bạn c&oacute; dịp mua m&aacute;y t&iacute;nh cũ&nbsp;nh&eacute; :</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:16.0pt\">Th&ocirc;ng số cấu h&igrave;nh m&aacute;y t&iacute;nh bạn cần biết&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Cấu h&igrave;nh m&aacute;y l&agrave; những th&ocirc;ng số tr&ecirc;n c&aacute;c thiết bị được gắn gh&eacute;p v&agrave;o m&aacute;y cũ thể l&agrave;&nbsp; bộ xử l&yacute; (CPU :... ghz), Ram(t&iacute;nh bằng Gb), Bộ nhớ(t&iacute;nh bằng GB hoặc TB, Card graphic (t&iacute;nh bằng Gb), Đời main, Core (i bao nhi&ecirc;u), k&iacute;ch thước m&agrave;n h&igrave;nh(t&iacute;nh bằng inch)...</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\n\n<ul>\n	<li><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Đối tượng người mua m&aacute;y t&iacute;nh d&ugrave;ng để l&agrave;m g&igrave; ?</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Việc n&agrave;y nhằm c&acirc;n bằng nhu &ndash; cầu của bạn tr&ecirc;n thực tế nhằm x&aacute;c định cho ph&ugrave; hợp với bản th&acirc;n người d&ugrave;ng.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nếu l&agrave; d&acirc;n văn ph&ograve;ng, phục vụ giải tr&iacute;,học về m&aacute;y t&iacute;nh ... th&igrave; n&ecirc;n chọn loại c&oacute; cấu h&igrave;nh vừa phải , m&agrave;n h&igrave;nh rộng &nbsp;v&agrave; c&oacute; thể c&ugrave;i 1 ch&uacute;t. </span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nếu l&agrave; d&acirc;n đồ họa hoặc thiết kế &nbsp;h&igrave;nh v&agrave; ảnh th&igrave; bắt buộc m&aacute;y bạn mua phải c&oacute; Card đồ họa hộ trợ c&oacute; thể gắn trực tiếp tr&ecirc;n main hoặc card rời.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">&nbsp;Nếu bạn sử dụng m&aacute;y cho việc chơi game th&igrave; kh&ocirc;ng chỉ card đồ họa phải&nbsp; tốt m&agrave; c&ograve;n b&agrave;n ph&iacute;m bấm kh&ocirc;ng d&iacute;nh, &iacute;t n&oacute;ng, m&agrave;n h&igrave;nh 15inch trở l&ecirc;n đối với laptop.</span></span></span></p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Chọn nơi cung cấp m&aacute;y t&iacute;nh cũ chất lượng v&agrave; uy t&iacute;n.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nhưng địa chỉ chất lượng v&agrave; uy t&iacute;n được đ&aacute;nh gi&aacute; bằng nhiều g&oacute;c đ&oacute; như chế độ của địa chỉ cung cấp đối với kh&aacute;ch h&agrave;ng &ndash; sự phục vụ của địa chỉ đ&oacute;, thời gian cảm kết với kh&aacute;ch h&agrave;ng &ndash; chất lượng sản phẩm được nhiều người đ&aacute;nh gi&aacute;... vậy để m&aacute;y m&aacute;y t&iacute;nh cũ&nbsp;bạn h&atilde;y &aacute;p dụng nhưng điều tr&ecirc;n để chọn đ&uacute;ng đia chỉ mua m&aacute;y t&iacute;nh cũ.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Nhờ người th&acirc;n &ndash; b&agrave;n b&egrave; c&oacute; k&iacute;nh nghiệp về m&aacute;y t&iacute;nh.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Tr&ecirc;n thực tế người đ&atilde; qua thời gian d&ugrave;ng m&aacute;y t&iacute;nh th&igrave; &iacute;t nhiều cũng hộ trợ bạn khi bạn đến địa chỉ mua m&aacute;y t&iacute;nh cũ m&agrave; kh&ocirc;ng l&uacute;ng t&uacute;ng v&agrave; &nbsp;sẽ y&ecirc;n t&acirc;m chọn m&agrave; kh&ocirc;ng lo về chất lượng v&agrave; cấu h&igrave;nh m&aacute;y.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Kh&ocirc;ng n&ecirc;n mua m&aacute;y t&iacute;nh cũ ở cửa h&agrave;ng online hoặc mạng x&atilde; hội.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Những nơi n&agrave;y lu&ocirc;n tiềm ẩn rủ r&ograve; rất cao về gian lận tiền bạc m&agrave; c&ograve;n thay đổi linh kiện trong m&aacute;y rất kh&oacute; nhận biết trong thời gian ngắn.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Kiểm tra tổng qu&aacute;t khi mua m&aacute;y t&iacute;nh cũ.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Khi thấu hiểu c&aacute;c phần tr&ecirc;n rồi th&igrave; trước hết bạn phải phải kiểm tra t&iacute;nh thực tế về cấu h&igrave;nh m&aacute;y t&iacute;nh cũ đ&oacute; như cpu,ram, b&agrave;n ph&iacute;m,chuột, ổ cứng, m&agrave;n h&igrave;nh,....v&agrave; độ n&oacute;ng của m&aacute;y sau khi hoạt động. </span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Để &yacute; đến nguồn m&aacute;y t&iacute;nh.</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Nguồn m&aacute;y t&iacute;nh l&agrave; nơi cung cấp điện năng cho m&aacute;y hoạt động do đ&oacute; nguồn cũng l&agrave; 1 phần kh&ocirc;ng thể bỏ qua khi mua m&aacute;y.</span></span></span></p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:36pt; margin-right:0cm\">&nbsp;</p>\n\n<ul>\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ch&iacute;nh s&aacute;ch bảo h&agrave;nh m&aacute;y t&iacute;nh cũ</span></span></span></span></li>\n</ul>\n\n<p style=\"margin-left:36pt; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Mặc d&ugrave; với danh nghĩa l&agrave; m&aacute;y t&iacute;nh cũ&nbsp;nhưng nhưng nhưng chế độ đ&oacute; bắt buộc phải c&oacute; nếu bạn kh&ocirc;ng muốn d&iacute;nh đến rủ ro cao sau khi mua. kh&ocirc;ng th&igrave; bạn n&ecirc;n quan t&acirc;m đến ch&iacute;nh s&aacute;ch bảo h&agrave;nh m&aacute;y, th&aacute;i độ ứng xử nh&acirc;n vi&ecirc;n kỹ thuật, cam kết của người b&aacute;n v&agrave; gi&aacute; cả nơi đ&oacute;.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>', '', 'mua máy tính cũ, kinh nghiệm mua máy tính', 'Để sắn cho mình 1 chiếc máy tính cũ thì hiện nay ngoài những đã đọc qua trên báo mạng thì bạn cũng nên có cho mình 1 số kinh nghiệm thực tế khi mua máy tính cũ -', 38, 1, 1, '2018-03-20 09:45:07', '2018-03-26 11:30:23');
INSERT INTO `article` (`id`, `fullname`, `alias`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(43, 'mua laptop dell dòng nào tốt nhất hiện nay', 'mua-laptop-dell-dong-nao-tot-nhat-hien-nay', 'dell-inspiron-.jpg', 'Laptop máy Dell là một hãng máy tính mà được nhiều người lựa chọn làm công cụ để làm việc. Không chỉ vì ưu điểm là bền , cấu hính tốt mà Dell còn khắc phục những nhược điểm về kiểu dáng và hình thức rất nhanh. Đem lại tin tưởng cho người dùng. Vậy mua laptop dell dòng nào tốt nhất ?', '<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"Dong may dell\" src=\"/upload/ketnoi/tonghop/may-laptop-Dell.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:18.0pt\"><span style=\"background-color:white\"><span style=\"color:black\">H&igrave;nh 1 : M&aacute;y t&iacute;nh Dell.</span></span></span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\"><span style=\"background-color:white\"><span style=\"color:black\">C&aacute;c d&ograve;ng laptop dell tốt nhất hiện nay</span></span></span></strong></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Nhận diện m&aacute;y dell</span></strong></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\">Laptop Dell hiện tại sản xuất ra hai d&ograve;ng ch&iacute;nh l&agrave; Vostro v&agrave; Inspiron. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\">Với d&ograve;ng Vostro thường được k&yacute; hiệu chữ V+4 số. Với 4 số nay tăng dần theo thời gian ph&aacute;t triển của d&ograve;ng. Chủ yếu d&ograve;ng n&agrave;y thuộc v&agrave;o tầng cao hướng đến đối tượng l&agrave; doanh nghiệp, tổ chức d&ugrave;ng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\">Với d&ograve;ng Inspiron thường được k&yacute; hiệu l&agrave; N +4 số Với 4 số nay tăng dần theo thời gian ph&aacute;t triển của d&ograve;ng. Chủ yếu d&ograve;ng n&agrave;y thuộc phụ vụ cho đa tầng v&igrave; mức gi&aacute; v&agrave; cấu h&igrave;nh kh&aacute; đa dạng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\">Trong 4 chữ số đ&oacute; th&igrave; : số đầu biểu thị d&ograve;ng m&aacute;y đang ở giai đoạn ph&aacute;t triển thứ mấy của h&atilde;ng, số thứ 2 l&agrave; biểu thị k&iacute;ch thước m&agrave;n h&igrave;nh v&iacute; dụ : 5 l&agrave; 15.6 inch.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Cấu h&igrave;nh m&aacute;y dell</span></strong></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">CPU </span></strong><span style=\"font-size:18.0pt\">: L&agrave; phần quan trọng nhất của m&aacute;y t&iacute;nh. N&oacute; l&agrave; trung t&acirc;m xử l&yacute; th&ocirc;ng tin v&agrave; quyết định nhiều tới tốc độ của m&aacute;y.&nbsp; Với c&aacute;c CPU được lắp tr&ecirc;n m&aacute;y t&iacute;nh Dell như Pentium, core dual, i3 i5 i7 Haswell, Broadwell. Khi c&oacute; một m&aacute;y k&yacute; hi&ecirc;u i7 _ 7200U &nbsp;l&agrave; thể hiện loại chip U v&agrave; chip M. Chip U yếu hơn Chip M nhưng đem lại lợi &iacute;ch kh&ocirc;ng nhỏ cho người d&ugrave;ng như tiết kiệm điện l&acirc;u n&oacute;ng. Tủy thuộc v&agrave;o nhu cầu m&agrave; bạn c&oacute; thể chọn lựa cho hợp l&yacute;.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">RAM </span></strong><span style=\"font-size:18.0pt\">: &nbsp;l&agrave; bộ nhớ truy cập ngẫu nhi&ecirc;n của m&aacute;y nếu bạn c&oacute; &yacute; định mua th&igrave; n&ecirc;n d&ugrave;ng 4 hoặc 8 Gb l&agrave; đủ.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Ổ cứng </span></strong><span style=\"font-size:18.0pt\">: l&agrave; phần lưu trữ th&ocirc;ng tin v&agrave; dữ liệu của m&aacute;y. C&oacute; 2 loại l&agrave; HDD v&agrave; SSD với tốc độ của SSD l&agrave; nhanh hơn.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">M&agrave;n H&igrave;nh</span></strong><span style=\"font-size:18.0pt\"> : l&agrave; phần hiển thị th&ocirc;ng tin của m&aacute;y t&iacute;nh. C&aacute;c bạn c&oacute; thể lựa chọn 14,15,6 hoặc 17 inch t&ugrave;y thuộc v&agrave;o t&iacute;nh chất c&ocirc;ng việc.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Card m&agrave;n h&igrave;nh</span></strong><span style=\"font-size:18.0pt\"> : l&agrave; phần hộ trợ độ họa hiện th&igrave; cho m&aacute;y nếu bạn l&agrave; d&acirc;n game hoặc photoshop th&igrave; n&ecirc;n lưu &yacute; đến vấn đền n&agrave;y.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\">Ngo&agrave;i ra c&ograve;n một số th&ocirc;ng số kh&aacute;c Cổng usb 3.0, Pin-thường 4 Cell, Trọng lượng,Ổ đĩa DVD...</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\">Khi c&aacute;c bạn <span style=\"background-color:white\"><span style=\"color:black\">mua laptop dell d&ograve;ng n&agrave;o tốt nhất</span></span> th&igrave; bạn n&ecirc;n biết về c&aacute;c cấu h&igrave;nh m&agrave; đem ra lựa chọn cho hợp l&yacute;.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Một số d&ograve;ng m&aacute;y dell đang thịnh h&agrave;nh</span></strong></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Inspiron Mini</span></strong><span style=\"font-size:18.0pt\">: l&agrave; d&ograve;ng netbook của Dell c&oacute; k&iacute;ch thước nhỏ m&agrave;n h&igrave;nh chỉ 10 inch v&agrave; bộ vi xử l&yacute; Intel Atom.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Inspiron</span></strong><span style=\"font-size:18.0pt\">: l&agrave; d&ograve;ng m&aacute;y cơ bản của Dell với th&ocirc;ng số cấu h&igrave;nh vừa phải. Chỉ hay d&ugrave;ng cho người d&ugrave;ng c&oacute; thu nhập thấp.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"laptop inspiron\" src=\"/upload/ketnoi/tonghop/dell-inspiron-.jpg\" style=\"height:300px; width:450px\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:18.0pt\">H&igrave;nh 2 : Chiếc laptop Dell Inspiron</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">XPS</span></strong><span style=\"font-size:18.0pt\">: d&ograve;ng laptop cao cấp của Dell với với th&ocirc;ng số cấu h&igrave;nh vừa phải, thiết kế đẹp v&agrave; khả năng đa phương tiện tốt. D&ograve;ng n&agrave;y c&oacute; ưu điểm về chất lượng &acirc;m thanh.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Studio</span></strong><span style=\"font-size:18.0pt\">: l&agrave; d&ograve;ng m&aacute;y bậc cao của Dell với th&ocirc;ng số cấu h&igrave;nh cực khủng. Chỉ hay d&ugrave;ng cho người d&ugrave;ng c&oacute; thu nhập cao trong x&atilde; hội</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Alienware</span></strong><span style=\"font-size:18.0pt\">: l&agrave; d&ograve;ng m&aacute;y chuy&ecirc;n phục vụ cho d&acirc;n game của Dell với th&ocirc;ng số cấu h&igrave;nh tốt nhất. Tốc độ xử l&yacute; v&agrave; t&iacute;nh năng, thiết kế kh&aacute; ấn tượng</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Vostro</span></strong><span style=\"font-size:18.0pt\">: l&agrave; d&ograve;ng laptop của h&atilde;ng Dell thuộc tầm thấp d&agrave;nh cho doanh nh&acirc;n, doanh nghiệp vừa v&agrave; nhỏ, cung cấp một cấu h&igrave;nh m&aacute;y tốt cho những doanh nghiệp. V&igrave; n&oacute; rất dễ d&ugrave;ng v&agrave; mọi thứ điều t&iacute;ch hợp sẵn. </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Latitude</span></strong><span style=\"font-size:18.0pt\">: l&agrave; d&ograve;ng laptop của h&atilde;ng Dell thuộc tầm trung. Cấu h&igrave;nh t&iacute;ch hợp trong sản xuất d&ograve;ng m&aacute;y laptop n&agrave;y cũng vừa phải. Tr&ecirc;n model, chữ &quot;E&quot; biểu thị cho &quot;họ&quot; Latitude để nhận biết d&ograve;ng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><strong><span style=\"font-size:18.0pt\">Precision</span></strong><span style=\"font-size:18.0pt\">: l&agrave; d&ograve;ng laptop chuy&ecirc;n m&aacute;y trạm l&agrave;m việc của Dell. C&aacute;c th&ocirc;ng số kỹ thuật cực chất rồi. Với k&yacute; hiệu tr&ecirc;n m&aacute;y l&agrave; chữ&nbsp; M.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\"><img alt=\"Precision\" src=\"/upload/ketnoi/tonghop/Precision_M6600.png\" style=\"height:319px; width:599px\" /></span></span></span><br />\n&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:18.0pt\">H&igrave;nh 3 :&nbsp; Chiếc m&aacute;y t&iacute;nh laptop Precision.</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:18.0pt\">Dưa ra quyết định <strong><span style=\"background-color:white\"><span style=\"color:black\">mua laptop dell d&ograve;ng n&agrave;o tốt nhất</span></span></strong> cho bản th&acirc;n th&igrave; bạn h&atilde;y xem x&eacute;t cấu h&igrave;nh, c&aacute;c d&ograve;ng hiện c&oacute; v&agrave; t&agrave;i ch&iacute;nh kinh tế của m&igrave;nh.</span></span></span></p>', '', 'mua laptop dell dòng nào tốt nhất, mua laptop dell', 'Bền, cấu hình tốt mà Dell còn khắc phục điểm về kiểu dáng, hình thức. Đem lại tin tưởng cho người dùng. Vậy mua laptop dell dòng nào tốt nhất', 21, 1, 1, '2018-03-22 11:28:21', '2018-03-26 03:24:43'),
(44, 'Cách kiểm tra máy khi mua laptop cũ chuẩn nhất', 'cach-kiem-tra-may-khi-mua-laptop-cu-chuan-nhat', 'cauhinh.jpg', 'Mua laptop cũ để dùng trong công việc là nhu cầu đang phổ biến hiện nay. Với một số lợi ích như rẻ tiền hơn, cấu hình tốt.... tùy nhiên bạn cần phải trang bị các kiến thức về laptop thì mới có thể chọn được máy tốt. Sau đây mình sẽ hướng dẫn các bạn cách kiểm tra máy khi mua laptop cũ về  dùng.', '<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:13pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\"><span style=\"background-color:white\">Quy trình c&aacute;ch kiểm tra m&aacute;y khi mua laptop cũ</span></span></span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra t&ocirc;̉ng th&ecirc;̉ b&ecirc;n ngoài của máy </span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Vi&ecirc;̣c ki&ecirc;̉m tra t&ocirc;̉ng th&ecirc;̉ máy laptop cụ khi mua là những gì hi&ecirc;̣n ra b&ecirc;n ngoài chi&ecirc;́c máy tính cụ đó. Cụ th&ecirc;̉ là bạn phải quan sát vỏ máy , khung máy, tem chính hạng còn kh&ocirc;ng, tem nhà ph&acirc;n ph&ocirc;́i còn kh&ocirc;ng... những vị trí này có th&ecirc;̉ cho đang ki&ecirc;̉m tra ph&acirc;̀n cứng v&acirc;̣t lý của máy.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">N&ecirc;́u máy laptop đó kh&ocirc;ng còn tem thì có th&ecirc;̉ phải quan t&acirc;m đ&ecirc;́n bảo hành của máy. Thì mới đáng đ&ocirc;̀ng ti&ecirc;̀n bạn bỏ r&acirc;̀m kh&ocirc;ng phải mắc h&ocirc;́i h&acirc;̣n khi mua laptop cụ này.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"chọn mua laptop cụ\" src=\"/upload/ketnoi/tonghop/chon-mua-laptop_cu.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">Hình 1 : Chọn mua máy và ki&ecirc;̉m tra máy</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra c&acirc;́u hình của máy</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Với &nbsp;c&ocirc;ng vi&ecirc;̣c này bạn chỉ quan t&acirc;m đ&ecirc;́n CPU bao nhi&ecirc;u Ghz , pentium hay core bao nhi&ecirc;̀u là được. Với các th&ocirc;ng s&ocirc;́ tr&ecirc;n nhằm đảm bảo và ki&ecirc;̉m tra t&ocirc;́c đ&ocirc;̣ xử lý của máy là bao nhi&ecirc;u. Nhanh hay ch&acirc;̣m là cái này góp ph&acirc;̀n quan trọng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Với cái c&acirc;̀n quan t&acirc;m là RAM tính bằng Gb&nbsp; , Card đ&ocirc;̀ họa bao nhi&ecirc;u Gb.&nbsp; N&ecirc;́u bạn là d&acirc;n đ&ocirc;̀ họa hay d&acirc;n game thì 2 y&ecirc;́u t&ocirc;́ này quan trọng b&acirc;̣c nh&acirc;́t của vi&ecirc;̣c mua máy tính laptopp.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"cấu hình máy laptop\" src=\"/upload/ketnoi/tonghop/cauhinh.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">Hình 2 : cách ki&ecirc;̉m tra máy khi mua laptop cũ</span></em></span></span></p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra màn hình laptop</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Màn hình là ph&acirc;̀n hi&ecirc;̉n thị th&ocirc;ng tin từ máy tinh. Do đó với vi&ecirc;̣c ki&ecirc;̉m tra xem màn hình có đ&ocirc;̣ ph&acirc;n giải th&ecirc;́ nào, ánh sáng của máy như th&ecirc;́ nào , có bị tr&acirc;̀y xước mạnh hay nhẹ và màn hình có bị kẻ sọc màu hay kh&ocirc;ng ? bạn có th&ecirc;̉ sử dụng c&ocirc;ng cụ ki&ecirc;̉m tra màn hinh đ&ecirc;̉ ki&ecirc;̉m tra.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"lỗi màn hình\" src=\"/upload/ketnoi/tonghop/soc-man-hinh-min.png\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">Hình 3 &nbsp;: Ki&ecirc;̉m tra màn hình.</span></em></span></span></p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra bàn phím máy tính</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Bàn phím là ph&acirc;̀n dùng đ&ecirc;̉ gõ chữ và s&ocirc;́ hoặc ký tự đặc bi&ecirc;̣t mà bạn phải thao tác thương xuy&ecirc;n. Do đó những vi&ecirc;̣c bạn phải ki&ecirc;̉m tra là phím có dính khi b&acirc;́m kh&ocirc;ng, có bị li&ecirc;̣t phím nào kh&ocirc;ng, t&ocirc;́c đ&ocirc;̣ hi&ecirc;̉n thị như th&ecirc;́ nào...&nbsp; </span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra loa của máy tính</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Là ph&acirc;̀n phát &acirc;m thanh&nbsp; của máy tính laoptp. Với laptop nó sẽ có 2 ph&acirc;n loa là loa b&ecirc;n trái và loa b&ecirc;n phải. Hãy b&acirc;̣t m&ocirc;̣t file đa phương ti&ecirc;̣n hay có ph&acirc;̀n test loa trong control panel và lắng nghe xem có bị rè kh&ocirc;ng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"loa laptop\" src=\"/upload/ketnoi/tonghop/loa-laptop.jpg\" /></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><em><span style=\"font-size:14.0pt\">Hình 4 : Loa máy tính laptop</span></em></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra chu&ocirc;̣t cảm ứng của máy </span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Chu&ocirc;̣t cảm ứng là ph&acirc;n được tích hợp ngay tr&ecirc;n máy dùng đ&ecirc;̉ đi&ecirc;̀u khi&ecirc;̉n và trực ti&ecirc;́p click trong máy tính. Bạn hãy ki&ecirc;̉m tra đ&ocirc;̣ nhạy và có mắc l&ocirc;̃i l&acirc;̀m nào kh&ocirc;ng, có hi&ecirc;̣n tượng nhảy&nbsp; đ&ocirc;̣t bi&ecirc;́n khi cắp sạc kh&ocirc;ng cái này do adapter. Bạn có th&ecirc;̉ y&ecirc;u c&acirc;̀u thay adapter mới và ki&ecirc;̉m tra lại.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra &ocirc;̉ đĩa CD/DVD</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">&Ocirc;̉ địa quang này có chức năng là ghi và đọc địa cả CD và DVD. Do đó bạn có th&ecirc;̉ ki&ecirc;̉m tra sơ b&ocirc;̣ ph&acirc;̀n này đ&ecirc;̉ nắm bắt tình trạng của chức năng nay. &nbsp;&nbsp;Bằng cách dùng địa đ&ecirc;̉ thử .</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra pin của máy tính</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Pin là ph&acirc;̀n gắn trực ti&ecirc;́p tr&ecirc;n máy có chức năng c&acirc;́p đi&ecirc;̣n cho hoạt đ&ocirc;̣ng của máy.&nbsp; N&ecirc;́u bạn th&acirc;́y thời lượng của nó&nbsp; kéo dài sau khi sử dụng thì&nbsp; càng t&ocirc;́t&nbsp; tr&ecirc;n&nbsp; thực t&ecirc;́ vi&ecirc;̣c thay th&ecirc;́ pin m&ocirc;̣t cách thu&acirc;̣n ti&ecirc;̃n nhưng bạn n&ecirc;n nhớ khi mua máy tính cũ có th&ecirc;̉&nbsp; t&ocirc;́t được ph&acirc;̀n nào thì máy tính laptop cũ tu&ocirc;̉i thọ càng t&ocirc;́t b&acirc;́y nhi&ecirc;u.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra ngu&ocirc;̀n đi&ecirc;̣n sạc cho máy tính</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Ngu&ocirc;̀n &nbsp;đi&ecirc;̣n sạc của máy là ngu&ocirc;̀n đi&ecirc;̣n chuy&ecirc;̉n đ&ocirc;̉i từ 220V th&ocirc;ng thường xu&ocirc;́ng 17 ~ 18 V có chức năng chính là sạc pin cho laptop và ngu&ocirc;̀n đi&ecirc;̣n li&ecirc;n tục khi kh&ocirc;ng có pin trong quá trình máy hoạt đ&ocirc;̣ng. Do đó bạn c&acirc;̀n ki&ecirc;̉m tra xem nó ti&ecirc;́p xúc th&ecirc;́ nào&nbsp; khi cắm, đ&acirc;̀u cắm có chảy nhựa kh&ocirc;ng và có chắp n&ocirc;́i gì kh&ocirc;ng.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra &ocirc;̉ cứng của máy tính</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">&Ocirc;̉ cứng là ph&acirc;̀n lưu trữ th&ocirc;ng tin và dữ li&ecirc;̃u của máy tính. Do đó cái bạn c&acirc;̀n ki&ecirc;̉m tra là &ocirc;̉ cứng thu&ocirc;̣c HDD hay SSD, t&ocirc;́c đ&ocirc;̣ truy v&acirc;́n tr&ecirc;n &ocirc;̉ đĩa th&ecirc;́ nào, du lượng lưu trữ th&ecirc;́ nào ? bạn n&ecirc;n ki&ecirc;̉m tra th&acirc;̣t kỹ ph&acirc;̀n này.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<h3 style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Cambria,serif\"><span style=\"color:#4f81bd\"><span style=\"font-size:14.0pt\">Ki&ecirc;̉m tra các c&ocirc;̉ng k&ecirc;́t n&ocirc;́i usb và k&ecirc;́t n&ocirc;́i wifi</span></span></span></span></h3>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Là những vị trí đ&acirc;̀u vào của máy tính do v&acirc;̣y đ&ecirc;̉ ki&ecirc;̉m tra ph&acirc;̀n này bạn n&ecirc;n chú ý đ&ecirc;́n vi&ecirc;̣c thử c&acirc;́m usb hoặc chu&ocirc;̣t usb vào các c&ocirc;̉ng &nbsp;của máy xem nó có hi&ecirc;̣n kh&ocirc;ng .</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Vi&ecirc;̣c k&ecirc;́t n&ocirc;́i wifi của máy xem nó th&ecirc;̉ bắt t&ocirc;́t kh&ocirc;ng. L&ocirc;̃i thường gặp phải v&ecirc;̀ vi&ecirc;̣c k&ecirc;́t n&ocirc;́i wifi là do Card &nbsp;bị hỏng mà nó có th&ecirc;̉ được kh&ocirc;ng bắt được. N&ecirc;́u phát sinh l&ocirc;̃i này bạn có th&ecirc;̉ y&ecirc;u c&acirc;u người bán thay cái card mới.</span></span></span></p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\n\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">Tr&ecirc;n đ&acirc;y là toàn b&ocirc;̣ vị trí và các b&ocirc;̣ ph&acirc;̣n tr&ecirc;n máy tính mà bạn c&acirc;̀n ki&ecirc;̉m tra trước khi mua.&nbsp; Với&nbsp; cách ki&ecirc;̉m tra máy khi mua laptop&nbsp; cụ này </span></span></span></p>', '', 'cách kiểm tra laptop cũ máy khi mua, cách kiểm tra máy khi mua laptop cũ', 'tùy nhiên bạn cần phải trang bị các kiến thức về laptop thì mới có thể chọn được máy tốt. Sau đây mình sẽ hướng dẫn các bạn cách kiểm tra máy khi mua laptop cũ về  dùng.', 13, 1, 1, '2018-03-24 03:57:17', '2018-03-28 10:56:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article_category`
--

DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` bigint(20) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `article_category`
--

INSERT INTO `article_category` (`id`, `article_id`, `category_id`, `created_at`, `updated_at`) VALUES
(47, 31, 11, '2018-03-08 08:35:42', '2018-03-08 08:35:42'),
(48, 32, 11, '2018-03-09 08:36:21', '2018-03-09 08:36:21'),
(49, 33, 11, '2018-03-09 09:07:05', '2018-03-09 09:07:05'),
(50, 34, 11, '2018-03-13 08:08:34', '2018-03-13 08:08:34'),
(51, 35, 11, '2018-03-14 04:45:52', '2018-03-14 04:45:52'),
(52, 36, 11, '2018-03-19 10:25:39', '2018-03-19 10:25:39'),
(53, 37, 11, '2018-03-20 03:13:16', '2018-03-20 03:13:16'),
(54, 38, 11, '2018-03-20 03:40:27', '2018-03-20 03:40:27'),
(59, 40, 11, '2018-03-20 05:14:29', '2018-03-20 05:14:29'),
(60, 39, 11, '2018-03-20 05:20:37', '2018-03-20 05:20:37'),
(61, 41, 11, '2018-03-20 08:41:31', '2018-03-20 08:41:31'),
(62, 42, 11, '2018-03-20 09:45:07', '2018-03-20 09:45:07'),
(63, 43, 11, '2018-03-22 11:28:21', '2018-03-22 11:28:21'),
(64, 44, 11, '2018-03-24 03:57:17', '2018-03-24 03:57:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
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

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `category_id`, `caption`, `alt`, `image`, `page_url`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Khi trẻ cười', 'khi trẻ cười 2', 'slider_2.jpg', 'cloudbeauty.vn', 2, 1, '2017-12-16 05:04:04', '2018-02-27 02:07:51'),
(3, 2, '', '', 'member-1.png', '', 1, 1, '2017-12-28 02:38:24', '2017-12-28 02:40:03'),
(4, 2, '', '', 'member-2.png', '', 2, 1, '2017-12-28 02:38:40', '2017-12-28 02:40:03'),
(5, 2, '', '', 'member-3.png', '', 3, 1, '2017-12-28 02:38:51', '2017-12-28 02:40:07'),
(6, 2, '', '', 'member-4.png', '', 4, 1, '2017-12-28 02:38:59', '2017-12-28 02:40:03'),
(7, 2, '', '', 'member-5.png', '', 5, 1, '2017-12-28 02:39:08', '2017-12-28 02:40:03'),
(8, 2, '', '', 'member-6.png', '', 6, 1, '2017-12-28 02:39:19', '2017-12-28 02:40:03'),
(9, 2, '', '', 'member-7.png', '', 7, 1, '2017-12-28 02:39:28', '2017-12-28 02:40:03'),
(14, 1, 'test 1', 'test 1', 'slider_3.jpg', 'http://magiwan.vn/', 3, 1, '2018-01-18 07:23:11', '2018-02-27 02:07:58'),
(15, 2, '', '', 'partner-1.png', '', 8, 1, '2018-01-20 04:26:00', '2018-01-20 04:26:00'),
(16, 2, '', '', 'partner-2.png', '', 9, 1, '2018-01-20 04:26:06', '2018-01-20 04:26:06'),
(17, 2, '', '', 'partner-3.png', '', 10, 1, '2018-01-20 04:26:14', '2018-01-20 04:26:14'),
(18, 2, '', '', 'partner-4.png', '', 11, 1, '2018-01-20 04:26:23', '2018-01-20 04:26:23'),
(19, 2, '', '', 'partner-5.png', '', 12, 1, '2018-01-20 04:26:32', '2018-01-20 04:26:32'),
(20, 2, '', '', 'partner-6.png', '', 13, 1, '2018-01-20 04:26:43', '2018-01-20 04:26:43'),
(21, 2, '', '', 'partner-7.png', '', 14, 1, '2018-01-20 04:26:54', '2018-01-20 04:27:02'),
(22, 2, '', '', 'partner-8.png', '', 15, 1, '2018-01-20 04:27:12', '2018-01-20 04:27:12'),
(23, 2, '', '', 'partner-9.png', '', 16, 1, '2018-01-20 04:27:20', '2018-01-20 04:27:20'),
(24, 2, '', '', 'partner-10.png', '', 17, 1, '2018-01-20 04:27:28', '2018-01-20 04:27:28'),
(25, 2, '', '', 'partner-11.png', '', 19, 1, '2018-01-20 04:27:38', '2018-01-20 04:27:38'),
(26, 2, '', '', 'partner-12.png', '', 20, 1, '2018-01-20 04:27:50', '2018-01-20 04:27:50'),
(27, 2, '', '', 'partner-13.png', '', 21, 1, '2018-01-20 04:28:00', '2018-01-20 04:28:05'),
(28, 5, 'Thời trang nữ', 'Thời trang nữ', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-22 16:19:19', '2018-02-22 17:44:45'),
(29, 5, 'Thời trang nữ', 'thoi-trang-nu', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-22 16:19:35', '2018-02-22 17:44:53'),
(30, 7, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:13:48', '2018-02-25 12:13:48'),
(31, 7, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:13:55', '2018-02-25 12:13:55'),
(32, 8, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:14:08', '2018-02-25 12:14:08'),
(33, 8, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:14:14', '2018-02-25 12:14:14'),
(34, 9, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:14:27', '2018-02-25 12:14:27'),
(35, 9, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:14:33', '2018-02-25 12:14:33'),
(36, 10, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:14:43', '2018-02-25 12:14:43'),
(37, 10, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:14:50', '2018-02-25 12:14:50'),
(38, 11, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:15:00', '2018-02-25 12:15:00'),
(39, 11, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:15:08', '2018-02-25 12:15:08'),
(40, 12, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:15:20', '2018-02-25 12:15:20'),
(41, 12, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:15:25', '2018-02-25 12:15:25'),
(42, 13, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:15:37', '2018-02-25 12:15:37'),
(43, 13, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:15:43', '2018-02-25 12:15:43'),
(44, 14, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:15:54', '2018-02-25 12:15:54'),
(45, 14, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:16:00', '2018-02-25 12:16:00'),
(46, 15, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:16:11', '2018-02-25 12:16:11'),
(47, 15, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:16:17', '2018-02-25 12:16:17'),
(48, 6, '', '', 'thoi-trang-nu-1.jpg', '', 1, 1, '2018-02-25 12:16:33', '2018-02-25 12:16:33'),
(49, 6, '', '', 'thoi-trang-nu-2.jpg', '', 2, 1, '2018-02-25 12:16:39', '2018-02-25 12:16:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `candidate`
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
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `candidate`
--

INSERT INTO `candidate` (`id`, `email`, `password`, `fullname`, `phone`, `birthday`, `sex_id`, `marriage_id`, `province_id`, `address`, `avatar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tranhuyvu@dienkim.com', '$2y$10$JDy8UjKIRPmnMgyIAe3ks.p5Fgpu6HdNl8NysIKtwUvAKrx9jzGfu', 'Trần Huy Vũ', '0988162739', NULL, NULL, NULL, NULL, NULL, 'logo-5-170043946.png', 1, '2018-04-03 02:32:59', '2018-04-05 02:00:14'),
(2, 'truongnt@dienkim.com', '$2y$10$jp2WuH8yQ3JhkPmL5zNBPeKK35V2W2.SU0vYLQKkJd8L/HSD441M2', 'Đặng Thị Thu Hằng', '0922111222', '1988-04-11 00:00:00', 1, 1, 2, '23 Lý Thường Kiệt', 'logo-2-xmydbuv95gtc.png', 1, '2018-04-03 07:14:21', '2018-04-11 08:31:05'),
(3, 'vientg@dienkim.com', '$2y$10$e9812Kvxwy2C8z.q/tGRQOyPBZSEyQftMBmtiWhD7cJ65RfVtTH7y', 'Trần Gia Viên', '0988223244', NULL, NULL, NULL, NULL, NULL, '', 1, '2018-04-04 04:41:02', '2018-04-11 08:31:05'),
(4, 'hanhltm@dienkim.com', '$2y$10$yzu2gHugpB2s5nhJcgKJjeO4WrwCHCt88ZM/ZRF.KoEttByKWKxQ2', 'Lâm Thị Mỹ Hạnh', '0933244156', NULL, NULL, NULL, NULL, NULL, '', 1, '2018-04-04 04:53:22', '2018-04-11 08:31:05'),
(5, 'duydp@dienkim.com', '$2y$10$l.PmvBEd9gT/Dod3nJLTHe1i5Ko/uyEItXMYouG0d/od6pgNxZPlm', 'Phạm Đình Duy', '0988145622', '1989-05-06 00:00:00', 1, 1, 51, '62 Lê Thánh Tôn', 'logo-2-gj5xel7w8as0.png', 1, '2018-04-04 05:18:40', '2018-04-15 15:43:19'),
(6, 'doricata@dienkim.com', '$2y$10$f5xkRP6uU9xCbwatX0o4XetN8cl6VgyElfUNKHOtWzug2YiQNHbRS', 'Nguyễn Văn Cường', '0988162289', NULL, NULL, NULL, NULL, NULL, '', 1, '2018-04-04 05:31:42', '2018-04-04 10:14:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_article`
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

--
-- Đang đổ dữ liệu cho bảng `category_article`
--

INSERT INTO `category_article` (`id`, `fullname`, `meta_keyword`, `meta_description`, `alias`, `parent_id`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Hỗ trợ khách hàng', 'metakeyword Tin dự án', 'metadescription Tin dự án', 'ho-tro-khach-hang', 0, 'conmochieu-5.png', 1, 1, '2017-12-18 02:17:10', '2018-02-28 07:22:22'),
(5, 'Đời sống số', 'metakeword Ngành gỗ', 'metadescription Ngành gỗ', 'doi-song-so', 0, 'conmochieu-6.png', 2, 1, '2017-12-18 02:17:19', '2018-02-28 08:08:31'),
(8, 'Sản phẩm', '', '', 'san-pham', 0, NULL, 3, 1, '2018-02-28 08:08:49', '2018-04-14 03:14:07'),
(9, 'Điện tử gia dụng', '', '', 'dien-tu-gia-dung', 0, NULL, 4, 1, '2018-02-28 08:09:03', '2018-02-28 08:09:03'),
(11, 'Kinh nghiệm laptop', '', '', 'kinh-nghiem-laptop', 0, NULL, 6, 1, '2018-02-28 08:09:50', '2018-03-13 05:15:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_banner`
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

--
-- Đang đổ dữ liệu cho bảng `category_banner`
--

INSERT INTO `category_banner` (`id`, `fullname`, `theme_location`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Slideshow', 'slideshow', 1, 1, '2017-12-16 05:02:58', '2017-12-28 08:45:44'),
(2, 'Đối tác', 'doi-tac', 1, 12, '2017-12-26 04:32:09', '2018-02-25 12:13:20'),
(5, 'Thời trang nữ', 'thoi-trang-nu', 1, 2, '2018-02-22 16:18:56', '2018-02-25 12:13:20'),
(6, 'Điện thoại máy tính', 'dien-thoai-may-tinh', 1, 13, '2018-02-25 12:10:15', '2018-02-25 12:13:20'),
(7, 'Thời trang nam', 'thoi-trang-nam', 1, 3, '2018-02-25 12:10:28', '2018-02-25 12:13:20'),
(8, 'Giày dép túi xách', 'giay-dep-tui-xach', 1, 4, '2018-02-25 12:10:49', '2018-02-25 12:13:20'),
(9, 'Phụ kiện số camera', 'phu-kien-so-camera', 1, 5, '2018-02-25 12:11:10', '2018-02-25 12:13:20'),
(10, 'Mẹ  bé - Đồ chơi', 'me-be-do-choi', 1, 6, '2018-02-25 12:11:27', '2018-02-25 12:13:20'),
(11, 'Đồng hồ phụ kiện', 'dong-ho-phu-kien', 1, 7, '2018-02-25 12:11:47', '2018-02-25 12:13:20'),
(12, 'Nhà cửa tân trang nhà', 'nha-cua-tan-trang-nha', 1, 8, '2018-02-25 12:12:08', '2018-02-25 12:13:20'),
(13, 'Sức khỏe sắc đẹp', 'suc-khoe-sac-dep', 1, 9, '2018-02-25 12:12:26', '2018-02-25 12:13:20'),
(14, 'Tivi thiết bị âm thanh', 'tivi-thiet-bi-am-thanh', 1, 10, '2018-02-25 12:12:42', '2018-02-25 12:13:20'),
(15, 'Dụng cụ thể thao', 'dung-cu-the-thao', 1, 11, '2018-02-25 12:13:00', '2018-02-25 12:13:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_param`
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
-- Đang đổ dữ liệu cho bảng `category_param`
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
-- Cấu trúc bảng cho bảng `category_product`
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

--
-- Đang đổ dữ liệu cho bảng `category_product`
--

INSERT INTO `category_product` (`id`, `fullname`, `meta_keyword`, `meta_description`, `alias`, `image`, `status`, `parent_id`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'metakeyword Gỗ óc chó', 'metadescription Gỗ óc chó', 'laptop', 'laptop-sinh-vien.png', 1, 0, 1, '2018-01-02 05:00:16', '2018-02-28 01:58:22'),
(12, 'Máy tính', 'metakeyword Điện thoại mới', 'metadescription Điện thoại mới', 'may-tinh', NULL, 1, 0, 2, '2018-02-01 03:00:35', '2018-02-28 01:58:26'),
(16, 'Phụ kiện máy tính', 'metakeyword Máy tính để bàn', 'metadescription Máy tính để bàn', 'phu-kien-may-tinh', NULL, 1, 0, 6, '2018-02-01 03:07:07', '2018-02-26 07:36:09'),
(17, 'Loa âm thanh', 'metakeyword Máy in và phụ kiện', 'metadescription Máy in và phụ kiện', 'loa-am-thanh', NULL, 1, 0, 7, '2018-02-01 03:07:37', '2018-02-28 04:01:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_video`
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
-- Đang đổ dữ liệu cho bảng `category_video`
--

INSERT INTO `category_video` (`id`, `fullname`, `meta_keyword`, `meta_description`, `alias`, `parent_id`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Video', 'metakeyword video', 'metadescription video', 'video', NULL, 'thuvienhinh-1.png', 1, 1, '2018-01-09 10:03:48', '2018-01-09 11:08:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `district`
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
-- Đang đổ dữ liệu cho bảng `district`
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
-- Cấu trúc bảng cho bảng `employer`
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
  `contacted_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacted_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `status_authentication` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employer`
--

INSERT INTO `employer` (`id`, `email`, `password`, `fullname`, `alias`, `meta_keyword`, `meta_description`, `address`, `phone`, `province_id`, `scale_id`, `logo`, `intro`, `fax`, `website`, `contacted_name`, `contacted_email`, `contacted_phone`, `user_id`, `status`, `status_authentication`, `created_at`, `updated_at`) VALUES
(1, 'pnjcomvn@dienkim.com', '$2y$10$9x.3XOYYCCvKEMM6pA9AhuIGl9muSxYPyWMpJfwQ2vuHoLkrIdwxO', 'Công ty CP Vàng Bạc Đá Quý Phú Nhuận', 'cong-ty-cp-vang-bac-da-quy-phu-nhuan', '', '', '170E Phan Đăng Lưu, Phường 03, Quận Phú Nhuận', '0988162733', 23, 3, 'logo-7-3409.png', 'PNJ là thương hiệu hàng đầu tại Việt Nam trong lĩnh vực chế tác và bán lẻ trang sức bằng vàng, bạc, đá quý. Sản phẩm PNJ ngày càng được các nước tại thị trường Châu Á và Châu Âu ưu chuộng. \r\n\r\nHiện tại, Công ty có hơn 5.200 nhân viên với hệ thống bán sỉ, và hơn 270 cửa hàng bán lẻ trải rộng trên toàn quốc; Xí Nghiệp Nữ trang PNJ có công suất sản xuất đạt trên 4 triệu sản phẩm/năm, được đánh giá là một trong những xí nghiệp chế tác nữ trang lớn nhất khu vực Châu Á với đội ngũ hơn 1.000 nhân viên.\r\n\r\nTrải qua 30 năm hình thành và phát triển, PNJ đã đạt đươc nhiều thành tựu đáng kể: thuộc Top 500 nhà bán lẻ hàng đầu Châu Á Thái Bình Dương, Giải thưởng Chất lượng Châu Á Thái Bình Dương, Thương hiệu quốc gia, … \r\n\r\nVới những giá trị cốt lõi mà PNJ đã theo đuổi, PNJ đã sở hữu được nguồn nhân lực có tác phong làm việc chuyên nghiệp, hiệu quả lao động cao và hơn cả là mối gắn kết nhân viên với tổ chức. Cơ sở vật chất được trang bị hiện đại bảo đảm nhân viên được làm việc trong điều kiện tốt nhất. Ngoài ra công ty còn trang bị thêm phòng tập GYM và Yoga giúp người lao động tái tạo sức lao động sau một ngày làm việc. \r\n\r\nTập thể PNJ đã cùng nhau chung tay xây dựng văn hoá cảm thông, chia sẻ bằng những hoạt động hỗ trợ cộng đồng, thành lập quỹ từ thiện PNJ, chương trình “mái ấm PNJ” mang đến một cuộc sống tốt đẹp cho người dân nghèo, ươm mầm phát triển tài năng. \r\n\r\nĐể tiếp tục khẳng định vị thế PNJ tại VN và thế giới, chúng tôi đang mở rộng hệ thống phát triển kinh doanh và cần bổ sung những ứng viên tài năng vào đội ngũ nhân sự chuyên nghiệp của mình. \r\n\r\nTại PNJ, sự nghiệp của các bạn sẽ được phát triển cùng với sự lớn mạnh không ngừng của chúng tôi.', '88483127487588', 'www.pnj.com.vn', 'Trần Lệ Diễm Quyên', 'quyentld@dienkim.com', '0988162778', 2, 1, NULL, '2018-04-03 01:48:19', '2018-04-06 15:55:37'),
(2, 'lottevn@dienkim.com', '$2y$10$5QrmrHzQ84G0GDuwW1XY8uLDaYoy9N1KOp0n5Xk//..bdt.br5CqC', 'LOTTE MART VIỆT NAM', 'lotte-mart-viet-nam', '', '', '469 Nguyễn Hữu Thọ, Quận 7, TP Hồ Chí Minh', '0988162732', 23, 4, NULL, 'Công ty TNHH TTTM LOTTE trực thuộc tập đoàn LOTTE của Hàn Quốc. Tính đến thời điểm này, Trung tâm thương mại LOTTE Mart đã có mặt tại 4 quốc gia của châu Á là: Hàn Quốc, Trung Quốc, Indonesia và Việt Nam, với 243 trung tâm thương mại được xây dựng theo phong cách hiện đại, phù hợp với thị hiếu và nhu cầu mua sắm của người tiêu dùng. Tại Việt Nam, LOTTE Mart đã khai trương 7 trung tâm thương mại, tọa lạc tại những khu vực trung tâm thành phố Hồ Chí Minh: LOTTE Mart Nam Sài Gòn tại quận 7 và LOTTE Mart Phú Thọ quận 11, LOTTE Mart Đồng Nai, LOTTE Mart Đà Nẵng, LOTTE Mart Phan Thiết, LOTTE Mart Bình Dương, LOTTE Mart Hà Nội. Từ khi bước vào thị trường Việt Nam năm 2008 đến nay, LOTTE Mart luôn không ngừng vươn lên với mục tiêu làm hài lòng, thỏa mãn nhu cầu của quý khách, nỗ lực tối đa để cung cấp những sản phẩm, dịch vụ tốt nhất đến tay người tiêu dùng. Mục tiêu đến năm 2020 LOTTE Mart sẽ mở khoảng 60 cửa hàng trải dài khắp các tỉnh thành trên đất nước Việt Nam.', '87437372767823578', 'www.lottemart.com.vn', 'Trần Thanh Tùng', 'tungtt@dienkim.com', '0978222214', 7, 1, 0, '2018-04-03 01:58:47', '2018-04-08 16:37:40'),
(3, 'spt3134@dienkim.com', '$2y$10$vXe9D1NRDa9vMA.udYBSCOkbs/s.LnwYLdwM5FNF.cHoqEYAdt/2.', 'Công ty CP DV Bưu Chính Viễn Thông Sài Gòn', 'cong-ty-cp-dv-buu-chinh-vien-thong-sai-gon', '', '', '10 Cô Giang, Phường Cầu Ông Lãnh, Q.1, TP HCM', '0983222111', 23, 3, NULL, 'TRUNG TÂM ĐIỆN THOẠI SPT (SPT Telephone Center - STC) là một Chi nhánh trực thuộc\r\nCông ty Cổ phần Dịch vụ Bưu chính Viễn thông Sài Gòn – SPT chuyên cung cấp số thuê bao điện\r\nthoại cố định, ADSL, FTTx, IPTV và các dịch vụ khác...đáp ứng nhu cầu lắp đặt tại các Công ty, Khu\r\ndân cư, Khu công nghiệp, Khu chế xuất, Khu thương mại,...', '', 'www.spt.vn', 'Đinh Thị Trường Giang', 'giangdtt@dienkim.com', '0933251718', 5, 1, NULL, '2018-04-03 06:55:44', '2018-04-08 10:09:15'),
(4, 'pmecorp@dienkim.com', '$2y$10$VmWhueq32Xuv7oXVvEU5cuNc9YxGWG3tSEow4snOKfaU6ymFgLsAq', 'CÔNG TY CỔ PHẦN TM-DV CƠ ĐIỆN LẠNH P&M', 'cong-ty-cp-tm-dv-do-dien-lanh-p-m', '', '', '436B/106/4, đường 3 tháng 2, phường 12, Q.10', '0978123479', 23, 4, 'logo-7-5yk7jo4xcgz2.png', 'Công ty TNHH TM-DV Cơ Điện Lạnh P&M (PME) là một trong những công ty chuyên nghiệp nhất Việt Nam về lĩnh vực thiết kế và thi công các hệ thống kỹ thuật Cơ - Điện – Điện lạnh cho các công trình qui mô lớn và theo tiêu chuẩn quốc tế.\r\nBan lãnh đạo công ty và các chuyên viên là những người tiên phong về lĩnh vực cơ điện lạnh công trình cao cấp tại Việt Nam từ những năm 1980 đến nay. Họ là những người đầu tiên tham gia xây dựng các khách sạn, trung tâm thương mại, cao ốc văn phòng theo tiêu chuẩn quốc tế đầu tiên tại Việt Nam, và tiếp tục đi sâu vào chuyên ngành cho đến hôm nay.', '8858349859839', 'www.pmecorp.com.vn', 'Nguyễn Thị Xuân', 'xuann@dienkim.com', '0987421908', 4, 1, NULL, '2018-04-04 05:29:16', '2018-04-11 08:37:21'),
(5, 'dathanhland@dienkim.com', '$2y$10$q8i8QEea0jeU2s3O0n7YD.fJy0ACn0wRUOSOY2GI0tj997TmV0VNC', 'Công Ty Bất Động Sản Đà Thành Land', 'cong-ty-bds-da-thanh-land', 'metakeyword Công ty CP BĐS ĐÀ THÀNH LAND', 'metadescription Công ty CP BĐS ĐÀ THÀNH LAND', '518 đường 2/9, Phường Hoà Cường Nam, Quận Hải Châu, Thành phố Đà Nẵng', '0986123789', 12, 4, 'logo-3-2os9xabnpmtf.png', 'Được thành lập vào tháng 12/2016. Công ty với phương châm hoạt động kiến tạo sự thành vượng sẽ mang lại giải pháp đầu tư tốt nhất về tài chính cho phân khúc bất động sản cho quý khách hàng nhằm mang lại giải pháp an cư và đầu tư tốt nhất tạo nên sự thịnh vượng cho khách hàng, xã hội, toàn cầu.', '78834778238543', 'www.dathanhland.net', 'Trương Nam Thành', 'thanhtn@dienkim.com', '0982365172', 6, 1, 0, '2018-04-04 08:06:36', '2018-04-08 17:02:50'),
(6, 'truyenthonglienviet@dienkim.com', '$2y$10$0pW9Y6V4EjK5VKNZ5Kpg2.8j2UVcAuFpnz3C3XiRyHKcfdDMwnDmO', 'Công Ty TNHH Truyền Thông Liên Việt', 'cong-ty-tnhh-truyen-thong-lien-viet', '', '', '194/7 trần bá giao, p5, gò vấp', '0986234123', 3, 3, NULL, 'Công Ty TNHH Truyền Thông Liên Việt được thành lập năm 2009, chuyên thiết kế, in ấn, thi công các hạng mục bảng hiệu, hộp đèn, quầy kệ siêu thi, sản xuất hộp quà gỗ, POSM\r\n\r\nCác nhãn hàng hàng tiêu biểu công ty đã thi công trong nhiều năm qua gồm: Bia Budweiser, Beck’s, Corona, Hoegaarden, Sơn Kansai, Sơn Alphanam, Thuốc lá Camel, Rượu Johnnie Walker, Yến Sào Khánh Hòa, Thiết bị vệ sinh Inax, Petrovietnam, Starpint…..', '4537825878', 'www.truyenthonglienviet.com', 'Vi Văn Đại', 'daivv@dienkim.com', '0988765123', 6, 1, 0, '2018-04-06 02:10:27', '2018-04-08 16:37:40'),
(7, 'yakultvn@dienkim.com', '$2y$10$PkM12SsRMUVqiKWlE.V8jeMLw/MZQEIsh4jdZQB5ufBTbd3kd2vua', 'Công ty TNHH Yakult Việt Nam', 'cong-ty-tnhh-yakult-viet-nam', '', '', '65 Phạm Ngũ Lão 8', '0967123456', 23, 3, 'logo-2-58pxknai6erd.png', 'Yakult là công ty được thành lập bởi Giáo sư, Bác sĩ người Nhật từ hơn 80 năm trước. Hiện có mặt tại 38 quốc gia và vùng lãnh thổ trên toàn thế giới.\r\nCông ty mẹ: Yakult Honsha Co., Ltd. \r\nNăm thành lập: 1935. \r\nĐịa chỉ: 1-19, Higashi-Shinbashi, 1-chome, Minato-ku, Tokyo, 105-8660 Nhật Bản.\r\nCông ty TNHH Yakult Việt Nam.\r\nNăm thành lập: 2006.\r\nĐịa chỉ:\r\nNhà Máy: Số 5 Đại lộ Tự Do, KCN Vsip I, p.Bình Hòa, TX. Thuận An, Bình Dương.\r\nVP chính: Số 29-30 Đường Song Hành, P.An Phú, Q.2, Tp.HCM.\r\nSản phẩm Yakult do Công ty sản xuất đã được bán rộng rãi tại tất cả các thành phố lớn tại Việt Nam. Chỉ với một chai dung tích nhỏ 65ml nhưng lại chứa đến 6,5 tỷ khuẩn Lactobacillus casei Shirota, do vậy, nếu duy trì uống Yakult thường xuyên sẽ giúp cải thiện đường ruột, từ đó sẽ giúp cơ thể có khả năng đề kháng tốt hơn. \r\nHiện sản phẩm Yakult đã có mặt ở hầu hết các siêu thị và các cửa hàng bán lẻ khắp các tỉnh thành Việt Nam. Ngoài ra, Yakult còn được phân phối trực tiếp đến tận nhà của khách hàng qua hệ thống giao hàng Yakult Lady.\r\nNhà máy chúng tôi luôn duy trì qui trình sản xuất với tiêu chuẩn chất lượng cao nhất, áp dụng qui trình sản xuất giống như Nhà máy Yakult ở Nhật Bản. Yakult không chỉ cam kết đạt chất lượng sản phẩm cao nhất mà còn cam kết về việc bảo vệ môi trường đảm bảo sức khỏe và an toàn nơi làm việc.\r\nCô nàng “họa mi tóc nâu” Mỹ Tâm vừa cùng Yakult “về chung một nhà” với vai trò đại sứ thương hiệu đấy!', '87377875782', 'www.yakult.vn', 'Lưu Mạnh Hà', 'hoancn8477@dienkim.com', '0988157998', 2, 1, NULL, '2018-04-06 02:30:04', '2018-04-21 10:19:32'),
(8, 'gifukogyo@dienkim.com', '$2y$10$ST7ybxlhlJ5n5uPoBgAhOug8othgoL7Yb/JHG5ZdM7C9RCENgHtsy', 'Công ty TNHH Gifu Kogyo Vietnam', 'cong-ty-tnhh-gifu-kogyo-vietnam', '', '', 'Lầu 1, P14, Nhà 6A, Đường 3, Công Viên Phần Mềm Quang Trung, Phường Tân Chánh Hiệp, Quận 12', '0977222333', 46, 3, 'logo-7-wgsax870zvu2.png', 'Là công ty 100% vốn Nhật Bản chuyên thiết kế, thực hiện hiện các bản vẽ kỹ thuật: CAD/CAM . Giàu kinh nghiệm trong các lĩnh vực đường hầm, cầu...\r\nNgoài ra công ty còn cung cấp các phần mềm chuyên dụng, hổ trợ doanh nghiệp; thiết kế website...', '4587877878', 'www.gkv.vn', 'Trần Đức Chính', 'chinhtd@dienkim.com', '0966123321', 3, 1, 0, '2018-04-16 10:23:40', '2018-04-16 10:34:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `experience`
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
-- Đang đổ dữ liệu cho bảng `experience`
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
-- Cấu trúc bảng cho bảng `group_member`
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
-- Đang đổ dữ liệu cho bảng `group_member`
--

INSERT INTO `group_member` (`id`, `fullname`, `alias`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', 1, '2016-12-17 05:05:18', '2018-04-16 02:47:32'),
(2, 'Chăm sóc khách hàng', 'cham-soc-khach-hang', 2, '2018-04-06 07:51:51', '2018-04-14 02:26:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_privilege`
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
-- Đang đổ dữ liệu cho bảng `group_privilege`
--

INSERT INTO `group_privilege` (`id`, `group_member_id`, `privilege_id`, `created_at`, `updated_at`) VALUES
(4805, 2, 157, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4806, 2, 158, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4807, 2, 159, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4808, 2, 160, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4809, 2, 161, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4810, 2, 176, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4811, 2, 177, '2018-04-14 02:26:52', '2018-04-14 02:26:52'),
(4812, 1, 1, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4813, 1, 2, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4814, 1, 4, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4815, 1, 5, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4816, 1, 18, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4817, 1, 19, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4818, 1, 24, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4819, 1, 25, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4820, 1, 43, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4821, 1, 44, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4822, 1, 49, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4823, 1, 50, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4824, 1, 55, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4825, 1, 56, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4826, 1, 61, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4827, 1, 62, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4828, 1, 67, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4829, 1, 68, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4830, 1, 79, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4831, 1, 80, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4832, 1, 85, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4833, 1, 86, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4834, 1, 103, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4835, 1, 104, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4836, 1, 105, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4837, 1, 106, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4838, 1, 107, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4839, 1, 108, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4840, 1, 109, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4841, 1, 110, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4842, 1, 115, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4843, 1, 116, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4844, 1, 121, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4845, 1, 122, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4846, 1, 123, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4847, 1, 124, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4848, 1, 125, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4849, 1, 126, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4850, 1, 127, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4851, 1, 128, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4852, 1, 129, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4853, 1, 130, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4854, 1, 131, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4855, 1, 132, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4856, 1, 133, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4857, 1, 134, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4858, 1, 135, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4859, 1, 136, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4860, 1, 137, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4861, 1, 138, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4862, 1, 139, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4863, 1, 140, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4864, 1, 141, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4865, 1, 142, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4866, 1, 143, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4867, 1, 144, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4868, 1, 145, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4869, 1, 146, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4870, 1, 151, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4871, 1, 152, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4872, 1, 153, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4873, 1, 154, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4874, 1, 155, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4875, 1, 156, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4876, 1, 157, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4877, 1, 158, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4878, 1, 159, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4879, 1, 160, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4880, 1, 161, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4881, 1, 162, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4882, 1, 163, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4883, 1, 164, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4884, 1, 165, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4885, 1, 166, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4886, 1, 167, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4887, 1, 168, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4888, 1, 169, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4889, 1, 170, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4890, 1, 171, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4891, 1, 172, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4892, 1, 173, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4893, 1, 174, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4894, 1, 175, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4895, 1, 176, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4896, 1, 177, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4897, 1, 178, '2018-04-16 02:47:32', '2018-04-16 02:47:32'),
(4898, 1, 179, '2018-04-16 02:47:32', '2018-04-16 02:47:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
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
-- Cấu trúc bảng cho bảng `invoice_detail`
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
-- Cấu trúc bảng cho bảng `job`
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
-- Đang đổ dữ liệu cho bảng `job`
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
-- Cấu trúc bảng cho bảng `literacy`
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
-- Đang đổ dữ liệu cho bảng `literacy`
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
-- Cấu trúc bảng cho bảng `marriage`
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
-- Đang đổ dữ liệu cho bảng `marriage`
--

INSERT INTO `marriage` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Độc thân', 'doc-than', 1, 1, '2018-04-05 04:00:57', '2018-04-05 04:00:57'),
(2, 'Đã có gia đình', 'da-co-gia-dinh', 2, 1, '2018-04-05 04:01:28', '2018-04-05 04:01:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
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

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `fullname`, `alias`, `parent_id`, `menu_type_id`, `level`, `menu_class`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(57, 'Trang chủ', 'trang-chu', 0, 5, 0, NULL, 1, 1, '2018-01-10 07:14:21', '2018-01-10 07:14:21'),
(61, 'Liên hệ', 'lien-he', 0, 5, 0, NULL, 3, 1, '2018-01-10 07:15:34', '2018-03-04 12:48:59'),
(340, 'Laptop', 'laptop', 0, 1, 0, '', 1, 1, '2018-02-26 07:47:48', '2018-02-28 02:00:27'),
(341, 'Máy tính', 'may-tinh', 0, 1, 0, '', 2, 1, '2018-02-26 07:47:58', '2018-02-28 02:00:31'),
(345, 'Phụ kiện máy tính', 'phu-kien-may-tinh', 0, 1, 0, '', 6, 1, '2018-02-26 07:48:46', '2018-02-26 07:48:46'),
(346, 'Loa âm thanh', 'loa-am-thanh', 0, 1, 0, '', 7, 1, '2018-02-26 07:48:59', '2018-02-28 04:02:28'),
(361, 'Laptop', 'laptop', 0, 8, 0, '', 1, 1, '2018-02-28 07:00:20', '2018-02-28 07:00:20'),
(362, 'Máy tính', 'may-tinh', 0, 8, 0, '', 2, 1, '2018-02-28 07:00:28', '2018-02-28 07:00:28'),
(366, 'Phụ kiện máy tính', 'phu-kien-may-tinh', 0, 8, 0, '', 6, 1, '2018-02-28 07:01:08', '2018-02-28 07:01:08'),
(367, 'Loa âm thanh', 'loa-am-thanh', 0, 8, 0, '', 7, 1, '2018-02-28 07:01:17', '2018-02-28 07:01:17'),
(372, 'Chính sách giao hàng', 'chinh-sach-giao-hang', 0, 9, 0, '', 1, 1, '2018-02-28 07:25:53', '2018-02-28 07:25:53'),
(373, 'Đổi trả bảo hành', 'doi-tra-bao-hanh', 0, 9, 0, '', 2, 1, '2018-02-28 07:26:05', '2018-02-28 07:26:05'),
(374, 'Hướng dẫn mua hàng', 'huong-dan-mua-hang', 0, 9, 0, '', 3, 1, '2018-02-28 07:26:16', '2018-02-28 07:26:16'),
(375, 'Quy chế hoạt động', 'quy-che-hoat-dong', 0, 9, 0, '', 4, 1, '2018-02-28 07:26:27', '2018-02-28 07:26:27'),
(376, 'Giới thiệu', 'gioi-thieu', 0, 9, 0, '', 5, 1, '2018-02-28 07:26:39', '2018-02-28 07:26:39'),
(377, 'Liên hệ', 'lien-he', 0, 9, 0, '', 6, 1, '2018-02-28 07:26:56', '2018-02-28 07:27:00'),
(382, 'Đời sống số', 'doi-song-so', 0, 3, 0, '', 1, 1, '2018-02-28 08:10:40', '2018-02-28 08:10:40'),
(383, 'Sản phẩm', 'san-pham', 0, 3, 0, '', 2, 1, '2018-02-28 08:10:48', '2018-02-28 08:10:48'),
(387, 'Kinh nghiệm', 'kinh-nghiem-laptop', 0, 3, 0, '', 5, 1, '2018-02-28 08:11:39', '2018-02-28 08:11:42'),
(388, 'Laptop', 'laptop', 0, 10, 0, '', 1, 1, '2018-02-28 16:53:11', '2018-02-28 16:53:11'),
(389, 'Máy tính', 'may-tinh', 0, 10, 0, '', 2, 1, '2018-02-28 16:53:20', '2018-02-28 16:53:20'),
(393, 'Phụ kiện máy tính', 'phu-kien-may-tinh', 0, 10, 0, '', 6, 1, '2018-02-28 16:53:51', '2018-02-28 16:53:51'),
(394, 'Loa âm thanh', 'loa-am-thanh', 0, 10, 0, '', 7, 1, '2018-02-28 16:54:01', '2018-02-28 16:54:01'),
(406, 'Sản phẩm', 'nen-mua-may-tinh-xach-tay-cua-hang-nao', 0, 5, 0, '', 2, 1, '2018-03-04 12:48:56', '2018-03-19 10:34:58'),
(407, 'Laptop', 'laptop', 406, 5, 1, '', 1, 1, '2018-03-04 12:49:11', '2018-03-04 12:49:11'),
(408, 'Máy tính', 'may-tinh', 406, 5, 1, '', 2, 1, '2018-03-04 12:49:22', '2018-03-04 12:49:22'),
(412, 'Phụ kiện máy tính', 'phu-kien-may-tinh', 406, 5, 1, '', 6, 1, '2018-03-04 12:50:11', '2018-03-04 12:50:11'),
(413, 'Loa âm thanh', 'loa-am-thanh', 406, 5, 1, '', 7, 1, '2018-03-04 12:50:22', '2018-03-04 12:50:22'),
(414, 'Tin tức', 'kinh-nghiem-laptop', 0, 9, 0, '', 7, 1, '2018-03-19 11:41:25', '2018-03-19 11:41:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_type`
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

--
-- Đang đổ dữ liệu cho bảng `menu_type`
--

INSERT INTO `menu_type` (`id`, `fullname`, `theme_location`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'MainMenu', 'main-menu', 1, 1, '2017-12-15 03:37:06', '2018-02-22 17:15:43'),
(3, 'Tin tức sự kiện', 'ttsk', 1, 3, '2018-01-03 04:22:54', '2018-02-28 07:58:31'),
(5, 'MobileMenu', 'mobile-menu', 1, 5, '2018-01-09 19:31:48', '2018-01-09 19:31:48'),
(8, 'Danh mục sản phẩm', 'danhmucspfooter', 1, 4, '2018-02-28 06:56:55', '2018-02-28 06:59:40'),
(9, 'Hỗ trợ khách hàng', 'htkh', 1, 6, '2018-02-28 07:19:49', '2018-02-28 07:25:08'),
(10, 'Sản phẩm', 'dmsp-left', 1, 6, '2018-02-28 16:52:58', '2018-02-28 16:52:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `module_item`
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

--
-- Đang đổ dữ liệu cho bảng `module_item`
--

INSERT INTO `module_item` (`id`, `fullname`, `item_id`, `position`, `component`, `setting`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Sản phẩm nổi bật', '[{\"id\":23,\"sort_order\":23},{\"id\":24,\"sort_order\":24},{\"id\":25,\"sort_order\":25},{\"id\":26,\"sort_order\":26},{\"id\":27,\"sort_order\":27},{\"id\":28,\"sort_order\":28}]', 'san-pham-noi-bat', 'product', NULL, 1, 1, '2018-03-02 18:37:45', '2018-03-02 18:37:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `organization`
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
-- Cấu trúc bảng cho bảng `page`
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

--
-- Đang đổ dữ liệu cho bảng `page`
--

INSERT INTO `page` (`id`, `fullname`, `alias`, `theme_location`, `image`, `intro`, `content`, `description`, `meta_keyword`, `meta_description`, `count_view`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Công Ty TNHH VIDOCO', 'cong-ty-tnhh-vidoco', 'intro-footer', NULL, '', '<p>THƯƠNG HIỆU LAPTOP FHP</p>\n\n<p>Điện thoại: 0949.027.720<br />\nEmail: vidoco.vn@gmail.com<br />\nWebsite:http://fhp.com.vn/</p>', '', '', '', NULL, 6, 1, '2017-12-28 04:10:41', '2018-03-20 04:21:40'),
(2, 'Về chúng tôi', 've-chung-toi', 'about-us-footer', NULL, '', '<p>&quot;GreenEcoLife cam kết tất cả quyền lợi d&agrave;nh cho kh&aacute;ch h&agrave;ng&quot;</p>', '', '', '', NULL, 2, 1, '2017-12-28 04:54:45', '2018-01-14 06:43:47'),
(4, 'Về Công Ty TNHH GreeneCoLife', 've-cong-ty-tnhh-greenecolife', 'introduce', 'conmochieu-10.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '<p style=\"text-align:justify\"><span style=\"font-size:24px\"><strong>GỖ NHẬP KHẨU: GỖ SỒI, GỖ &Oacute;C CH&Oacute;, GỖ TẦN B&Igrave;</strong></span></p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><em>Giới thiệu chung:</em></span></p>\n\n<p style=\"text-align:justify\">C&ocirc;ng ty tnhh GreenEcoLife (GEL), l&agrave; nh&agrave; nhập khẩu v&agrave; ph&acirc;n phối gỗ nguy&ecirc;n liệu Mỹ: gỗ &oacute;c ch&oacute;, gỗ sồi, gỗ tần b&igrave;, v&aacute;n s&agrave;n, &hellip;</p>\n\n<p style=\"text-align:justify\">Năm 2012, với nhu cầu cần rất nhiều về nguồn gỗ nguy&ecirc;n liệu chất lượng cho lĩnh vực sản xuất nội thất gỗ cao cấp của Việt Nam. GreenEcoLife Việt Nam ra đời từ đ&oacute;.</p>\n\n<p style=\"text-align:justify\">Hiện n&agrave;y, C&ocirc;ng ty tnhh GreenEcoLife (GEL) l&agrave; một trong c&aacute;c nh&agrave; nhập khẩu v&agrave; cung cấp gỗ nguy&ecirc;n liệu h&agrave;ng đầu tại khu vực miền Nam về: gỗ sồi, gỗ &oacute;c ch&oacute;, gỗ tần b&igrave;, &hellip;</p>\n\n<p style=\"text-align:justify\"><span style=\"font-size:18px\"><em>C&aacute;c sản phẩm gỗ nhập khẩu GreenEcoLife Việt Nam:</em></span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/gioi-thieu-go-soi-trang-.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh : Gỗ sồi trắng</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/gioi-thieu-go-oc-cho.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh : Gỗ &oacute;c ch&oacute;</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"/upload/gioi-thieu-go-tan-bi.jpg\" /></p>\n\n<p style=\"text-align:center\"><em>H&igrave;nh ảnh : Gỗ tần b&igrave;</em></p>\n\n<p style=\"text-align:center\">&nbsp;</p>\n\n<p>C&aacute;c đối t&aacute;c v&agrave; kh&aacute;ch h&agrave;ng của C&ocirc;ng ty tnhh GreenEcoLife (GEL) chủ yếu l&agrave;: c&ocirc;ng ty thương mại, xưởng sản xuất, nội thất, c&ocirc;ng ty thiết kế x&acirc;y dựng, &hellip;.</p>\n\n<p>Hiện nay, với nguồn gỗ tự nhi&ecirc;n ng&agrave;y c&agrave;ng khan hiếm, gi&aacute; gỗ nguy&ecirc;n liệu tự nhi&ecirc;n ng&agrave;y c&agrave;ng bị đẩy l&ecirc;n cao, c&ugrave;ng với rất nhiều c&aacute;c c&ocirc;ng ty nhập khẩu gỗ h&igrave;nh th&agrave;nh tr&ecirc;n thị trường, chất lượng gỗ cũng kh&aacute;c nhau, &nbsp;th&igrave; Greenecolife Việt Nam sẽ l&agrave; sự lựa chọn ho&agrave;n hảo về cung cấp gỗ nguy&ecirc;n liệu d&agrave;nh cho qu&yacute; xưởng sản xuất gỗ, qu&yacute; c&ocirc;ng ty thiết kế nội thất với chất lượng gỗ nguy&ecirc;n liệu tốt v&agrave; gi&aacute; cả phải chăng.</p>', '', 'metakeyword giới thiệu', 'metadescription giới thiệu', 234, 5, 0, '2018-01-03 10:35:10', '2018-03-21 03:07:25'),
(5, 'Thông tin liên hệ', 'thong-tin-lien-he', 'thong-tin-lien-he-widget', NULL, '', '<h2><span style=\"color:#2980b9\"><strong>C&Ocirc;NG TY TNHH GREENECOLIFE</strong></span></h2>\n\n<p><em><strong>Vp Giao dịch:</strong></em> 27/13/8 Đường số 27, P.Hiệp B&igrave;nh Ch&aacute;nh, Q.Thủ Đức</p>\n\n<p><em><strong>Điện thoại:</strong></em> 0902.90.74.75</p>\n\n<p><em><strong>Email:</strong></em> gellumber@gmail.com</p>\n\n<p><em><strong>Website:</strong></em> http://greenecolife.vn</p>', '', '', '', NULL, 1, 0, '2018-01-14 16:13:12', '2018-03-21 03:09:28'),
(6, 'Fanpage', 'fanpage', 'fanpage-footer', NULL, '<div class=\"fb-page\" data-href=\"https://www.facebook.com/dcmobilecomputer/\" data-tabs=\"timeline\" data-width=\"250\" data-height=\"200\" data-small-header=\"true\" data-adapt-container-width=\"true\" data-hide-cover=\"false\" data-show-facepile=\"true\"><blockquote cite=\"https://www.facebook.com/dcmobilecomputer/\" class=\"fb-xfbml-parse-ignore\"><a href=\"https://www.facebook.com/gonguyenlieumy/\">Công ty tnhh Greenecolife</a></blockquote></div>', '', '', '', '', NULL, 7, 1, '2018-01-19 02:31:15', '2018-03-21 03:07:54'),
(7, 'Tầm nhìn', 'tam-nhin', 'tam-nhin-home-content', 'conmochieu-1.png', 'Trở thành công ty đứng đầu về hệ thống phân phối rộng khắp Việt Nam trong những năm đầu tiên.\nTầm nhìn đến 2030: \"Trở thành 1 trong 10 công ty phát triển Bất động sản tốt nhất Đông Nam Á”', '<p style=\"text-align:justify\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '', '', '', 31, 1, 1, '2018-01-19 09:04:27', '2018-01-22 10:25:53'),
(8, 'Sứ mệnh', 'su-menh', 'su-menh-hand-content', 'conmochieu-2.png', 'Cung cấp sản phẩm và dịch vụ ưu việt, nâng cao giá trị , chất lượng cuộc sống', '<p style=\"text-align:justify\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '', '', '', 10, 1, 1, '2018-01-19 09:04:52', '2018-01-22 08:56:14'),
(9, 'Giá trị cốt lõi', 'gia-tri-cot-loi', 'gia-tri-cot-loi-hand-content', 'conmochieu-3.png', 'Khát vọng - Chính trực - Chuyên nghiệp - Nhân văn\nVới nhiều năm kinh nghiệm hoạt động trong lĩnh vực bất động sản và đội ngũ nhân viên chuyên nghiệp, nhiệt tình, có trình độ cao, luôn lấy chữ tín làm trọng.', '<p style=\"text-align:justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', '', '', '', 6, 1, 1, '2018-01-19 09:05:26', '2018-01-22 08:56:16'),
(10, 'Triết lý kinh doanh', 'triet-ly-kinh-doanh', 'triet-ly-kinh-doanh-hand-content', 'conmochieu-4.png', 'Đối tác, khách hàng là giá trị cơ bản của bất kỳ doanh nghiệp nào, là lý do duy nhất để doanh nghiệp tồn tại và phát triển. Chính sách “khách hàng là trung tâm” chỉ lối cho mọi hoạt động của công ty.', '<p style=\"text-align:justify\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '', '', '', 5, 1, 1, '2018-01-19 09:05:56', '2018-01-22 08:56:18'),
(11, 'Quản lý bất động sản', 'quan-ly-bat-dong-san', 'service-left', 'conmochieu-6.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '<p style=\"text-align:justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', '', '', '', 25, 1, 1, '2018-01-19 16:08:40', '2018-01-23 02:08:00'),
(12, 'Cho thuê căn hộ', 'cho-thue-can-ho', 'service-center', 'conmochieu-5.png', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '<p style=\"text-align:justify\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '', '', '', 9, 1, 1, '2018-01-19 16:09:30', '2018-01-22 08:56:23'),
(13, 'Bán bất động sản', 'ban-bat-dong-san', 'service-right', 'conmochieu-4.png', 'Cras et fringilla neque. Donec vulputate ornare placerat. Proin elit eros, egestas vitae mauris in, mattis tincidunt ipsum. Phasellus sodales, erat sit amet porta pretium, ligula dui convallis leo, semper varius est ipsum semper turpis. Sed id velit tellus. Sed eu metus interdum, fringilla lacus ac, finibus dolor. Maecenas tempus dolor vel tortor accumsan feugiat. Proin in tellus tristique, dignissim nunc vel, gravida mauris. In sed augue viverra, aliquet quam sit amet, fringilla risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla lobortis, ex nec pulvinar cursus, risus turpis ornare tellus, a facilisis augue enim sed tellus. Quisque lacinia vel dolor ac porta. Praesent hendrerit dictum velit, sodales sagittis leo interdum quis.', '<p style=\"text-align:justify\">Aliquam cursus elit ut commodo tristique. Curabitur at elit scelerisque, consequat dolor vel, egestas ipsum. Sed auctor venenatis quam a ultricies. Quisque vehicula gravida tristique. Maecenas interdum, mi vel pellentesque laoreet, nisl diam sollicitudin urna, ac dictum erat purus sit amet purus. In facilisis consectetur rutrum. Curabitur vitae est a libero volutpat tristique eget a erat. Vivamus in eros dignissim erat congue maximus. Etiam euismod nec metus nec volutpat. Morbi et scelerisque orci. Donec nisl justo, varius sit amet pharetra quis, lacinia in lacus. Nulla cursus vulputate urna vitae mattis. Proin ultrices dignissim felis, eu viverra massa viverra ut. Praesent eu euismod mauris. Pellentesque in lobortis felis, vel egestas erat. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>\n\n<p style=\"text-align:justify\">Integer elementum, tortor quis egestas rutrum, libero arcu egestas orci, dapibus ornare enim risus sed ex. Aliquam congue laoreet nunc eu varius. Duis ullamcorper urna ac nunc sagittis mattis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris in nibh non ligula rutrum ultrices at in velit. Nullam tempus dui et eros vestibulum, vitae rhoncus risus facilisis. In eu iaculis mi, id convallis enim. Etiam dignissim lacus elit, eget efficitur dolor auctor ac. Aenean condimentum congue iaculis. Curabitur eget ex tincidunt, scelerisque diam sed, fermentum ligula. Nullam imperdiet, risus elementum malesuada sagittis, massa odio congue eros, vitae interdum nisi dolor ut orci.</p>', '', '', '', 9, 1, 1, '2018-01-19 16:10:20', '2018-01-22 08:56:24'),
(14, 'Call us free', 'call-us-free', 'top-info', NULL, '', '<p style=\"text-align:center\">Call us free on 0800 255 0498</p>\n\n<p style=\"text-align:center\">or 0161 85 00 88 4</p>\n\n<p style=\"text-align:center\">Monday to Friday 8.30am to 5.30pm</p>', '', '', '', NULL, 1, 1, '2018-01-25 03:04:04', '2018-01-25 03:04:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_method`
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
-- Đang đổ dữ liệu cho bảng `payment_method`
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
-- Cấu trúc bảng cho bảng `persistences`
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
-- Đang đổ dữ liệu cho bảng `persistences`
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
(912, 1, 'h7f1gTwxVFZJ650vk5K048M7Nj59YIcu', '2018-04-15 18:19:53', '2018-04-15 18:19:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photo`
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
-- Cấu trúc bảng cho bảng `post_param`
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
-- Đang đổ dữ liệu cho bảng `post_param`
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
-- Cấu trúc bảng cho bảng `privilege`
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
-- Đang đổ dữ liệu cho bảng `privilege`
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
(179, 'rank-form', 'rank', 'form', 1, '2018-04-16 02:47:23', '2018-04-16 02:47:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `probationary`
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
-- Đang đổ dữ liệu cho bảng `probationary`
--

INSERT INTO `probationary` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhận việc ngay', 'nhan-viec-ngay', 1, 1, '2018-04-12 07:03:49', '2018-04-12 07:03:49'),
(2, '1 tháng', '1-thang', 1, 1, '2018-04-12 07:03:57', '2018-04-12 07:03:57'),
(3, '2 tháng', '2-thang', 1, 1, '2018-04-12 07:04:04', '2018-04-12 07:04:04'),
(4, '3 tháng', '3-thang', 1, 1, '2018-04-12 07:04:10', '2018-04-12 07:04:10'),
(5, 'Trao đổi trực tiếp khi phỏng vấn', 'trao-doi-truc-tiep-khi-phong-van', 1, 1, '2018-04-12 07:04:25', '2018-04-12 07:04:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
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

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `code`, `fullname`, `meta_keyword`, `meta_description`, `alias`, `image`, `status`, `child_image`, `price`, `sale_price`, `intro`, `detail`, `technical_detail`, `video_id`, `count_view`, `category_id`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, '128746935', 'Lenovo IdeaPad 120S 11IAP N3350 (81A40072VN)', 'metakeyword Lenovo IdeaPad', 'metadescription Lenovo IdeaPad', 'lenovo-ideapad-120s-11iap-n3350-81a40072vn', 'laptop-1.png', 1, '[\"laptop-2.png\",\"laptop-3.png\",\"laptop-4.png\"]', '5190000.00', '4600000.00', 'giới thiệu Lenovo IdeaPad', '<p>chi tiết&nbsp;Lenovo IdeaPad</p>', '', '', 39, 1, 1, '2018-02-27 03:25:36', '2018-03-24 17:50:03'),
(2, '781234596', 'Acer Aspire ES1 432 N3350', 'metakeyword Acer Aspire ES1 432 N3350', 'metadescription Acer Aspire ES1 432 N3350', 'acer-aspire-es1-432-n3350', 'laptop-2.png', 1, '[\"laptop-1.png\",\"laptop-3.png\",\"laptop-4.png\"]', '6290000.00', '0.00', 'giới thiệu Acer Aspire ES1 432 N3350', '<p>chi tiết&nbsp;Acer Aspire ES1 432 N3350</p>', '', '', 33, 1, 2, '2018-02-27 04:11:33', '2018-03-24 17:48:58'),
(3, '138796452', 'Asus X441NA N4200 (GA070T)', 'metakeyword Asus X441NA N4200 (GA070T)', 'metadescription Asus X441NA N4200 (GA070T)', 'asus-x441na-n4200-ga070t', 'laptop-3.png', 1, '[\"laptop-1.png\",\"laptop-2.png\",\"laptop-4.png\"]', '7490000.00', '0.00', 'giới thiệu Asus X441NA N4200 (GA070T)', '<p>chi tiết&nbsp;Asus X441NA N4200 (GA070T)</p>', '', '', 32, 1, 3, '2018-02-27 04:13:15', '2018-03-24 17:48:55'),
(4, '476285319', 'Acer ES1 533 N4200 (NX.GFTSV.003)', 'metakeyword Acer ES1 533 N4200 (NX.GFTSV.003)', 'metadescription Acer ES1 533 N4200 (NX.GFTSV.003)', 'acer-es1-533-n4200-nxgftsv003', 'laptop-4.png', 1, '[\"laptop-1.png\",\"laptop-2.png\",\"laptop-3.png\"]', '7490000.00', '0.00', 'giới thiệu Acer ES1 533 N4200 (NX.GFTSV.003)', '<p>chi tiết&nbsp;Acer ES1 533 N4200 (NX.GFTSV.003)</p>', '', '', 36, 1, 4, '2018-02-27 04:14:16', '2018-03-24 18:16:31'),
(5, '719853246', 'Acer ES1 533 P6L2 N4200 (NX.GFTSV.008)', 'metakeyword Acer ES1 533 P6L2 N4200 (NX.GFTSV.008)', 'metadescription Acer ES1 533 P6L2 N4200 (NX.GFTSV.008)', 'acer-es1-533-p6l2-n4200-nxgftsv008', 'laptop-5.png', 1, '[\"laptop-1.png\",\"laptop-2.png\",\"laptop-3.png\"]', '7490000.00', '0.00', 'giới thiệu Acer ES1 533 P6L2 N4200 (NX.GFTSV.008)', '<p>chi tiết&nbsp;Acer ES1 533 P6L2 N4200 (NX.GFTSV.008)</p>', '', '', 35, 1, 5, '2018-02-27 04:16:35', '2018-03-24 18:16:00'),
(6, '415723689', 'HP 15 bs578TU N3710 (2LR89PA)', 'metakeyword HP 15 bs578TU N3710 (2LR89PA)', 'metadescription HP 15 bs578TU N3710 (2LR89PA)', 'hp-15-bs578tu-n3710-2lr89pa', 'laptop-6.png', 1, '[\"laptop-1.png\",\"laptop-2.png\",\"laptop-3.png\"]', '7690000.00', '0.00', 'giới thiệu HP 15 bs578TU N3710 (2LR89PA)', '<p>chi tiết&nbsp;HP 15 bs578TU N3710 (2LR89PA)</p>', '', '', 37, 1, 6, '2018-02-27 04:17:44', '2018-03-26 11:06:33'),
(7, '419327658', 'Lenovo Ideapad 320 14ISK i3 6006 (80XG0083VN)', 'metakeyword Lenovo Ideapad 320 14ISK i3 6006 (80XG0083VN)', 'metadescription Lenovo Ideapad 320 14ISK i3 6006 (80XG0083VN)', 'lenovo-ideapad-320-14isk-i3-6006-80xg0083vn', 'laptop-7.png', 1, '[\"laptop-1.png\",\"laptop-2.png\",\"laptop-3.png\"]', '8990000.00', '0.00', 'giới thiệu Lenovo Ideapad 320 14ISK i3 6006 (80XG0083VN)', '<p>chi tiết&nbsp;Lenovo Ideapad 320 14ISK i3 6006 (80XG0083VN)</p>', '', '', 39, 1, 7, '2018-02-27 04:18:58', '2018-03-27 03:52:53'),
(8, '924175638', 'Lenovo IdeaPad 110 15ISK i3 6006U (80UD018KVN)', 'metakeyword Lenovo IdeaPad 110 15ISK i3 6006U (80UD018KVN)', 'metadescription Lenovo IdeaPad 110 15ISK i3 6006U (80UD018KVN)', 'lenovo-ideapad-110-15isk-i3-6006u-80ud018kvn', 'laptop-8.png', 1, '[\"laptop-1.png\",\"laptop-2.png\",\"laptop-3.png\"]', '9290000.00', '0.00', 'giới thiệu Lenovo IdeaPad 110 15ISK i3 6006U (80UD018KVN)', '<p>chi tiết&nbsp;Lenovo IdeaPad 110 15ISK i3 6006U (80UD018KVN)</p>', '', '', 35, 1, 8, '2018-02-27 04:20:39', '2018-03-27 04:57:27'),
(9, '352461897', 'Asus TP203NAH N4200 (BP052T)', 'metakeyword Asus TP203NAH N4200 (BP052T)', 'metadescription Asus TP203NAH N4200 (BP052T)', 'asus-tp203nah-n4200-bp052t', 'laptop-9.png', 1, '[\"laptop-1.png\",\"laptop-2.png\",\"laptop-3.png\"]', '9890000.00', '0.00', 'giới thiệu Asus TP203NAH N4200 (BP052T)', '<p>chi tiết&nbsp;Asus TP203NAH N4200 (BP052T)</p>', NULL, NULL, 50, 1, 9, '2018-02-27 05:02:45', '2018-03-27 07:56:57'),
(10, '328519647', 'HP 15 bs571TU i3 6006U (2JQ68PA)', 'metakeyword HP 15 bs571TU i3 6006U (2JQ68PA)', 'metadescription HP 15 bs571TU i3 6006U (2JQ68PA)', 'hp-15-bs571tu-i3-6006u-2jq68pa', 'laptop-10.png', 1, '[\"laptop-4.png\",\"laptop-5.png\",\"laptop-6.png\"]', '10490000.00', '0.00', 'giới thiệu HP 15 bs571TU i3 6006U (2JQ68PA)', '<p>chi tiết&nbsp;HP 15 bs571TU i3 6006U (2JQ68PA)</p>', NULL, NULL, 62, 1, 10, '2018-02-27 05:03:46', '2018-03-28 09:09:01'),
(11, '971358246', 'Máy tính để bàn ACER ASPIRE ATC-780 DT.B59SV.002', 'metakeyword Máy tính để bàn ACER ASPIRE ATC-780 DT.B59SV.002', 'metadescription Máy tính để bàn ACER ASPIRE ATC-780 DT.B59SV.002', 'may-tinh-de-ban-acer-aspire-atc-780-dtb59sv002', 'may-bo-1.png', 1, '[\"may-bo-2.png\",\"may-bo-3.png\",\"may-bo-4.png\"]', '8490000.00', '0.00', 'giới thiệu Máy tính để bàn ACER ASPIRE ATC-780 DT.B59SV.002', '<p>chi tiết&nbsp;M&aacute;y t&iacute;nh để b&agrave;n ACER ASPIRE ATC-780 DT.B59SV.002</p>', NULL, NULL, 36, 12, 11, '2018-02-27 17:49:34', '2018-03-27 02:03:13'),
(12, '849162357', 'Máy tính để bàn ACER ASPIRE TC-780 (DT.B89SV.008)', 'metakeyword ACER ASPIRE TC-780 (DT.B89SV.008)', 'metadescription ACER ASPIRE TC-780 (DT.B89SV.008)', 'may-tinh-de-ban-acer-aspire-tc-780-dtb89sv008', 'may-bo-2.png', 1, '[\"may-bo-1.png\",\"may-bo-3.png\",\"may-bo-4.png\",\"may-bo-5.png\"]', '8690000.00', '0.00', 'giới thiệu ACER ASPIRE TC-780 (DT.B89SV.008)', '<p>chi tiết&nbsp;ACER ASPIRE TC-780 (DT.B89SV.008)</p>', NULL, NULL, 31, 12, 12, '2018-02-27 17:51:40', '2018-03-24 08:47:43'),
(13, '179526348', 'Máy tính để bàn DELL VOSTRO 3268 (CORE I5)', 'metakeyword DELL VOSTRO 3268 (CORE I5)', 'metadescription DELL VOSTRO 3268 (CORE I5)', 'may-tinh-de-ban-dell-vostro-3268-core-i5', 'may-bo-3.png', 1, '[\"may-bo-4.png\",\"may-bo-5.png\",\"may-bo-6.png\"]', '11490000.00', '0.00', 'giới thiệu DELL VOSTRO 3268 (CORE I5)', '<p>chi tiết&nbsp;DELL VOSTRO 3268 (CORE I5)</p>', NULL, NULL, 31, 12, 13, '2018-02-27 17:56:08', '2018-03-27 10:00:35'),
(14, '329156847', 'Máy tính để bàn ACER ASPIRE TC-780', 'metakeyword ACER ASPIRE TC-780 (COREi3/RAM4GB/HDD1TB)', 'metadescription ACER ASPIRE TC-780 (COREi3/RAM4GB/HDD1TB)', 'may-tinh-de-ban-acer-aspire-tc-780', 'may-bo-4.png', 1, '[\"may-bo-1.png\",\"may-bo-2.png\",\"may-bo-3.png\"]', '8490000.00', '0.00', 'giới thiệu ACER ASPIRE TC-780 (COREi3/RAM4GB/HDD1TB)', '<p>chi tiết&nbsp;ACER ASPIRE TC-780 (COREi3/RAM4GB/HDD1TB)</p>', NULL, NULL, 43, 12, 14, '2018-02-27 17:57:52', '2018-03-27 03:03:26'),
(15, '489257361', 'Máy tính để bàn ACER ASPIRE TC-780 (DT.B89SV.005)', '', '', 'may-tinh-de-ban-acer-aspire-tc-780-dtb89sv005', 'may-bo-5.png', 1, NULL, '8590000.00', '0.00', '', '', NULL, NULL, 41, 12, 15, '2018-02-27 18:06:27', '2018-03-27 15:51:25'),
(16, '657428319', 'Máy tính để bàn FPT ELEAD NK930 6811', 'metakeyword FPT ELEAD NK930 6811', 'metadescription FPT ELEAD NK930 6811', 'may-tinh-de-ban-fpt-elead-nk930-6811', 'may-bo-6.png', 1, '[\"may-bo-1.png\",\"may-bo-2.png\",\"may-bo-3.png\"]', '7290000.00', '0.00', 'giới thiệu FPT ELEAD NK930 6811', '<p>chi tiết&nbsp;ACER ASPIRE TC-780 (DT.B89SV.005)</p>', NULL, NULL, 36, 12, 16, '2018-02-27 18:08:03', '2018-03-26 15:03:57'),
(35, '163597842', 'Tai Nghe PHILIPS SHE1350', 'metakeyword Miếng Dán Màn Hình Laptop 15.5\"', 'metadescription Miếng Dán Màn Hình Laptop 15.5\"', 'tai-nghe-philips-she1350', 'pk-may-tinh-1.png', 1, '[\"pk-may-tinh-2.png\",\"pk-may-tinh-3.png\",\"pk-may-tinh-4.png\"]', '49000.00', '0.00', 'giới thiệu Miếng Dán Màn Hình Laptop 15.5\"', '<p>chi tiết&nbsp;Miếng D&aacute;n M&agrave;n H&igrave;nh Laptop 15.5&quot;</p>', NULL, NULL, 31, 16, 35, '2018-02-28 03:40:45', '2018-03-27 07:06:19'),
(36, '324759816', 'Chuột KD KONIG KN915', 'metakeyword CHUỘT KD KONIG KN915', 'metadescription CHUỘT KD KONIG KN915', 'chuot-kd-konig-kn915', 'pk-may-tinh-2.png', 1, '[\"pk-may-tinh-1.png\",\"pk-may-tinh-3.png\",\"pk-may-tinh-4.png\"]', '89000.00', '0.00', 'giới thiệu CHUỘT KD KONIG KN915', '<p>chi tiết&nbsp;CHUỘT KD KONIG KN915</p>', NULL, NULL, 34, 16, 36, '2018-02-28 03:44:03', '2018-03-24 17:49:20'),
(37, '315294876', 'USB SANDISK 8GB CZ50 CRUZER GLIDE', 'metakeyword USB SANDISK 8GB CZ50 CRUZER GLIDE', 'metadescription USB SANDISK 8GB CZ50 CRUZER GLIDE', 'usb-sandisk-8gb-cz50-cruzer-glide', 'pk-may-tinh-3.png', 1, '[\"pk-may-tinh-1.png\",\"pk-may-tinh-2.png\",\"pk-may-tinh-4.png\"]', '89000.00', '0.00', 'giới thiệu USB SANDISK 8GB CZ50 CRUZER GLIDE', '<p>chi tiết&nbsp;USB SANDISK 8GB CZ50 CRUZER GLIDE</p>', NULL, NULL, 29, 16, 37, '2018-02-28 03:45:18', '2018-03-26 11:09:07'),
(38, '589643127', 'Ổ Cứng Di Động 8GB CZ50 CRUZER BLADE USB 2.0 SANDISK', 'metakeyword Ổ CỨNG DI ĐỘNG 8GB CZ50 CRUZER BLADE USB 2.0 SANDISK', 'metadescription Ổ CỨNG DI ĐỘNG 8GB CZ50 CRUZER BLADE USB 2.0 SANDISK', 'o-cung-di-dong-8gb-cz50-cruzer-blade-usb-20-sandisk', 'pk-may-tinh-4.png', 1, '[\"pk-may-tinh-1.png\",\"pk-may-tinh-2.png\",\"pk-may-tinh-3.png\"]', '89000.00', '0.00', 'giới thiệu Ổ CỨNG DI ĐỘNG 8GB CZ50 CRUZER BLADE USB 2.0 SANDISK', '<p>chi tiết&nbsp;Ổ CỨNG DI ĐỘNG 8GB CZ50 CRUZER BLADE USB 2.0 SANDISK</p>', NULL, NULL, 34, 16, 38, '2018-02-28 03:47:44', '2018-03-26 14:29:13'),
(39, '967324158', 'Miếng Dán Màn Hình LAPTOP 15.5\"', 'metakeyword Tai Nghe PHILIPS SHE1350', 'metadescription Tai Nghe PHILIPS SHE1350', 'mieng-dan-man-hinh-laptop-155', 'pk-may-tinh-5.png', 1, '[\"pk-may-tinh-2.png\",\"pk-may-tinh-3.png\",\"pk-may-tinh-4.png\"]', '49000.00', '0.00', 'giới thiệu Tai Nghe PHILIPS SHE1350', '<p>chi tiết&nbsp;Tai Nghe PHILIPS SHE1350</p>', NULL, NULL, 32, 16, 39, '2018-02-28 03:50:58', '2018-03-24 17:49:14'),
(40, '183954762', 'Headphone A4 TECH HS - 12', 'metakeyword HEADPHONE A4 TECH HS - 12', 'metadescription HEADPHONE A4 TECH HS - 12', 'headphone-a4-tech-hs-12', 'pk-may-tinh-6.png', 1, '[\"pk-may-tinh-3.png\",\"pk-may-tinh-4.png\",\"pk-may-tinh-5.png\"]', '50000.00', '0.00', 'giới thiệu HEADPHONE A4 TECH HS - 12', '<p>chi tiết&nbsp;HEADPHONE A4 TECH HS - 12</p>', NULL, NULL, 35, 16, 40, '2018-02-28 03:52:21', '2018-03-24 17:49:11'),
(41, '134682795', 'Loa ARIRANG JANT I', 'metakeyword Loa ARIRANG JANT I', 'metadescription Loa ARIRANG JANT I', 'loa-arirang-jant-i', 'loa-1.png', 1, '[\"loa-2.png\",\"loa-3.png\",\"loa-4.png\"]', '1990000.00', '0.00', 'giới thiệu Loa ARIRANG JANT I', '<p>chi tiết&nbsp;Loa ARIRANG JANT I</p>', NULL, NULL, 36, 17, 41, '2018-02-28 04:30:37', '2018-03-26 22:05:31'),
(42, '827963415', 'Loa RINTON RT-705', 'metakeyword Loa RINTON RT-705', 'metadescription Loa RINTON RT-705', 'loa-rinton-rt-705', 'loa-2.png', 1, '[\"loa-1.png\",\"loa-2.png\",\"loa-4.png\"]', '2490000.00', '0.00', 'giới thiệu Loa RINTON RT-705', '<p>chi tiết&nbsp;Loa RINTON RT-705</p>', NULL, NULL, 33, 17, 42, '2018-02-28 04:32:19', '2018-03-26 07:30:28'),
(43, '831425769', 'Máy Tăng Âm RINTON PA-7600', 'metakeyword MÁY TĂNG ÂM RINTON PA-7600', 'metadescription MÁY TĂNG ÂM RINTON PA-7600', 'may-tang-am-rinton-pa-7600', 'loa-3.png', 1, '[\"loa-1.png\",\"loa-2.png\",\"loa-4.png\"]', '2690000.00', '0.00', 'giới thiệu MÁY TĂNG ÂM RINTON PA-7600', '<p>chi tiết&nbsp;M&Aacute;Y TĂNG &Acirc;M RINTON PA-7600</p>', NULL, NULL, 35, 17, 43, '2018-02-28 04:36:15', '2018-03-26 18:23:47'),
(44, '928475136', 'Máy Tăng Âm ARIRANG SPA 203 III', 'metakeyword MÁY TĂNG ÂM ARIRANG SPA 203 III', 'metadescription MÁY TĂNG ÂM ARIRANG SPA 203 III', 'may-tang-am-arirang-spa-203-iii', 'loa-4.png', 1, '[\"loa-1.png\",\"loa-2.png\",\"loa-3.png\"]', '2490000.00', '0.00', 'giới thiệu MÁY TĂNG ÂM ARIRANG SPA 203 III', '<p>chi tiết&nbsp;M&Aacute;Y TĂNG &Acirc;M ARIRANG SPA 203 III</p>', NULL, NULL, 36, 17, 44, '2018-02-28 04:37:28', '2018-03-26 06:23:58'),
(45, '519438267', 'Loa Kéo RINTON PL-1', 'metakeyword Loa Kéo RINTON PL-1', 'metadescription Loa Kéo RINTON PL-1', 'loa-keo-rinton-pl-1', 'loa-5.png', 1, '[\"loa-2.png\",\"loa-3.png\",\"loa-4.png\"]', '4790000.00', '0.00', 'giới thiệu Loa Kéo RINTON PL-1', '<p>chi tiết&nbsp;Loa K&eacute;o RINTON PL-1</p>', NULL, NULL, 38, 17, 45, '2018-02-28 04:42:31', '2018-03-28 09:36:57'),
(46, '387621594', 'Loa BOSE ACOUSTIMASS 6 SERIES V', 'metakeyword LOA BOSE ACOUSTIMASS 6 SERIES V', 'metadescription LOA BOSE ACOUSTIMASS 6 SERIES V', 'loa-bose-acoustimass-6-series-v', 'loa-6.png', 1, '[\"loa-1.png\",\"loa-2.png\",\"loa-3.png\"]', '18760000.00', '0.00', 'giới thiệu LOA BOSE ACOUSTIMASS 6 SERIES V', '<p>chi tiết&nbsp;LOA BOSE ACOUSTIMASS 6 SERIES V</p>', NULL, NULL, 35, 17, 46, '2018-02-28 04:44:11', '2018-03-26 17:11:55'),
(47, '579241683', 'Dell Latitude E6530 Core i7 3620M', 'Laptop Dell Latitude E6530 Core i7 3620M Ram 4G HDD 250G 15.6\" VGA ON', 'Laptop cũ Dell Laitutde E6530 i7 là dòng laptop chuyên gam và đồ họa. Có thể nói đây là dòng máy có cấu hình siêu mạnh. Hình dáng và cấu hình của nó phù hợp với game thủ và các chuyên viên IT. Máy được bọc nhôm nguyên khối theo tiêu chuẩn của quân đội Mỹ. Đây là dòng máy cao cấp của Dell ', 'dell-latitude-e6530-core-i7-3620m', 'laptop-cu-dell-latitude-e6530-i7-1.png', 1, NULL, '8000000.00', '0.00', '', '<p style=\"text-align:justify\"><strong>Laptop cũ Dell Latitude E6530 i7</strong>&nbsp;l&agrave; d&ograve;ng doanh nh&acirc;n cao cấp. Tuy nhi&ecirc;n hiện nay ch&uacute;ng được d&ugrave;ng nhiều cho c&aacute;c kĩ thuật vi&ecirc;n, lập tr&igrave;nh vi&ecirc;n, IT hay game thủ. Thiết kế kh&aacute; l&agrave; bắt mắt theo kiểu d&aacute;ng cho doanh nh&acirc;n. Tuy vậy th&igrave; k&iacute;ch cỡ, khối lượng cũng như cấu h&igrave;nh của n&oacute; thi ph&ugrave; hợp cho IT hơn l&agrave; doanh nh&acirc;n. D&ograve;ng laptop Dell E6530 i7 n&agrave;y c&oacute; gi&aacute; xuất xưởng l&agrave; cực k&igrave; cao, nhưng bạn chỉ cần bỏ ra 1/3 chi ph&iacute; l&agrave; c&oacute; thể sở hữu 1 chiếc m&aacute;y cực đỉnh. Những chiếc laptop cũ đang cực k&igrave; được ưa chuộng tại Việt Nam.N&oacute;i về khả năng của<strong>&nbsp;laptop cũ Dell Latitude E6530 i7</strong>&nbsp;th&igrave; phải n&oacute;i đến khả năng xử l&yacute; đồ họa cực đỉnh c&ugrave;ng khả năng chơi game ở cấu h&igrave;nh cao v&ocirc; c&ugrave;ng mượt m&agrave;. Đương nhi&ecirc;n 1 chiếc&nbsp;laptop&nbsp;mạnh như thế n&agrave;y th&igrave; chuyện văn ph&ograve;ng, học tập, nghi&ecirc;n cứu, chơi game l&agrave; rất b&igrave;nh thường. Tuy nhi&ecirc;n để thấy hết khả năng ưu việt của chiếc laptop th&igrave; ch&uacute;ng ta sẽ cho n&oacute; ở đ&uacute;ng cấu h&igrave;nh. Cấu h&igrave;nh chuẩn của laptop cũ Dell Latitude E6530 i7:<br />\n<br />\n- Cấu h&igrave;nh 1: Core i7 3620M Ram 8G HDD 500G M&agrave;n h&igrave;nh 15.6&quot; full HD trị gi&aacute; 9.5 triệu đồng<br />\n- Cấu h&igrave;nh 3: Core i7 3620M Ram 16G HDD 1TB M&agrave;n h&igrave;nh 15.6&quot; full HD trị gi&aacute; 11.5 triệu đồng<br />\n<br />\nKhi n&oacute;i về&nbsp;<strong>laptop cũ Dell Latitude E6530 i7</strong>&nbsp;người ta kh&ocirc;ng c&ograve;n từ g&igrave; để n&oacute;i về cấu h&igrave;nh m&aacute;y n&agrave;y ngo&agrave;i 1 chữ: khủng. Chiếc m&aacute;y si&ecirc;u khủng n&agrave;y cho bạn trải nghiệm ho&agrave;n to&agrave;n tuyệt vời. Muốn chơi game nặng như Li&ecirc;n Minh Huyền Thoại, Fifa online 3, Battleground, CF, V&otilde; L&acirc;m... Hay đồ họa nặng như 3Dmax, 3D, Corel, Photoshop, autocad, dựng phim...Đương nhi&ecirc;n đi k&egrave;m với m&aacute;y si&ecirc;u khủng th&igrave; cần c&oacute; những phần qu&agrave; si&ecirc;u khủng.<br />\n<br />\nTham khảo th&ecirc;m những mẫu&nbsp;<strong>laptop cũ</strong>&nbsp;của DC mobile<br />\n&nbsp;</p>\n\n<h3 style=\"text-align:justify\"><strong>Khi mua&nbsp;laptop cũ Dell Latitude E6530 i7 tại DC mobile bạn sẽ được tặng k&egrave;m:</strong></h3>\n\n<p style=\"text-align:justify\">1 balo cao cấp trị gi&aacute; 300.000 đồng</p>\n\n<p style=\"text-align:justify\">1 bộ vệ sinh m&agrave;n h&igrave;nh 6 m&oacute;n trị gi&aacute; 69.000 đồng</p>\n\n<p style=\"text-align:justify\">3 th&aacute;ng bảo h&agrave;nh nguy&ecirc;n m&aacute;y</p>\n\n<p style=\"text-align:justify\">G&oacute;i vệ sinh v&agrave; thay keo tản nhiệt 1 năm trị gi&aacute; 100.000 đồng.</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<h3 style=\"text-align:justify\"><strong>Kh&aacute;ch h&agrave;ng c&oacute; thể chọn c&aacute;c cấu h&igrave;nh mạnh hơn nh&eacute;</strong></h3>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Ram 4G n&acirc;ng l&ecirc;n 8G th&ecirc;m 500k<br />\n<br />\nVGA ON l&ecirc;n VGA rời NVS 5200M th&ecirc;m 300k</p>\n\n<p style=\"text-align:justify\"><strong>Cấu h&igrave;nh 1:</strong>&nbsp;Core i7 3620m - Ram 4g - hdd 250g&nbsp;=&nbsp;<em>8.000.000vnd</em></p>\n\n<p style=\"text-align:justify\"><strong>Cấu h&igrave;nh 2:</strong>&nbsp;Core i7 3620m - Ram 4g - hdd 320g&nbsp;=&nbsp;<em>8.200.000vnd</em></p>\n\n<p style=\"text-align:justify\"><strong>Cấu h&igrave;nh 3:</strong>&nbsp;Core i7 3620m - Ram 4g - hdd 500g =&nbsp;<em>8.500.000vnd</em></p>\n\n<p style=\"text-align:justify\"><strong>Cấu h&igrave;nh 4:</strong>&nbsp;Core i7 3620m - Ram 4g -&nbsp;<strong>SSD 120g</strong>&nbsp;=&nbsp;<em>9.000.000vnd</em></p>\n\n<p style=\"text-align:justify\"><strong>Cấu h&igrave;nh 5:</strong>&nbsp;Core i7 3620m - Ram 4g -&nbsp;<strong>SSD 240g</strong>&nbsp;=&nbsp;<em>10.000.000vnd</em><br />\n<br />\nH&atilde;y đến với&nbsp;<strong>DC mobile</strong>&nbsp;để xem m&aacute;y trực tiếp hoặc c&oacute; thể gọi v&agrave;o hotline để đặt h&agrave;ng nh&eacute;. Ch&uacute;ng t&ocirc;i c&oacute; hệ thống giao h&agrave;ng to&agrave;n quốc chỉ cần kh&aacute;ch h&agrave;ng đặt h&agrave;ng l&agrave; sẽ c&oacute; người giao tận tay cho qu&yacute; kh&aacute;ch. Nếu cần th&ecirc;m th&ocirc;ng tin c&oacute; thể chat với chuy&ecirc;n vi&ecirc;n tư vấn để chọn m&aacute;y ph&ugrave; hợp nh&eacute;.&nbsp;<br />\n<br />\nH&igrave;nh ảnh thực tế của&nbsp;<strong>laptop cũ Dell Latitude E6530 i7</strong><br />\n&nbsp;</p>\n\n<p style=\"text-align:justify\"><img alt=\"Laptop Dell Latitude E6530 i7\" src=\"https://dcmobile.vn/uploads/shops/laptop-dell/latitude/e6530/laptop-dell-latitude-e6530-i7.jpg\" style=\"height:605px; width:800px\" /></p>\n\n<p style=\"text-align:justify\">laptop Dell Latitude E6530 i7</p>\n\n<p style=\"text-align:justify\"><img alt=\"Laptop Dell Latitude E6530 i7\" src=\"https://dcmobile.vn/uploads/shops/laptop-dell/latitude/e6530/laptop-dell-latitude-e6530-i7-3.jpg\" style=\"height:602px; width:800px\" /></p>\n\n<p style=\"text-align:justify\">Laptop Dell Latitude E6530 i7</p>\n\n<p style=\"text-align:justify\"><img alt=\"Laptop Dell Latitude E6530 i7 \" src=\"https://dcmobile.vn/uploads/shops/laptop-dell/latitude/e6530/laptop-dell-latitude-e6530-i7-1.jpg\" style=\"height:609px; width:800px\" /></p>\n\n<p style=\"text-align:justify\">Laptop Dell Latitude E6530 i7</p>\n\n<p style=\"text-align:justify\"><img alt=\"laptop Dell Latitude E6530 i7\" src=\"https://dcmobile.vn/uploads/shops/laptop-dell/latitude/e6530/laptop-dell-latitude-e6530-i7-2.jpg\" style=\"height:629px; width:800px\" /></p>\n\n<p style=\"text-align:justify\">Laptop Dell Latitude E6530 i7</p>', '<h2 style=\"text-align:justify\"><strong>Th&ocirc;ng số kỹ thuật&nbsp;laptop cũ Dell Latitude E6530 i7</strong></h2>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong>CPU:</strong>&nbsp;Intel&nbsp;<strong>Core i7</strong><strong>&nbsp;362</strong><strong>0m&nbsp;3.0</strong><strong>Ghz&nbsp;</strong>turbo boost<strong>&nbsp;3.2GHz</strong>,&nbsp;3M Cache&nbsp;Ivy&nbsp;Brigde&nbsp;(thế hệ 3) Xử l&yacute; si&ecirc;u&nbsp;nhanh</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong>Ram:&nbsp;4G</strong>&nbsp;ddr3&nbsp;bus 1600 Mhz<strong>&nbsp;</strong>(n&acirc;ng cấp l&ecirc;n 8G&nbsp;th&ecirc;m 500k)</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong>HDD: 250G</strong>&nbsp;(n&acirc;ng cấp l&ecirc;n HDD lớn hơn &nbsp;hoặc SSD thoải m&aacute;i)</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Card m&agrave;n h&igrave;nh<strong>&nbsp;Onboad</strong>:&nbsp;<strong>Intel HD 4400 up to 2.1G</strong>&nbsp;- m&aacute;t, tiết kiệm pin, bền v&agrave; ổn định</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong>Độ lớn m&agrave;n h&igrave;nh:</strong>&nbsp;<strong>15.6&nbsp;inch LED Full HD (1920*1080)</strong>-&nbsp;s&aacute;ng đẹp, phủ lớp&nbsp;chống ch&oacute;i d&agrave;nh cho doanh nh&acirc;n</p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Option gồm c&oacute;:&nbsp;<strong>WC Camera,</strong>&nbsp; DVD, Display port(xuất&nbsp;HDMi), Vga out, Lan, SD, SC PCi, Wifi chuẩn N,<strong>&nbsp;</strong></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\"><strong>Sạc zin, Pin&nbsp;zin 6&nbsp;cell, 9 cell</strong></p>\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n<p style=\"text-align:justify\">Win7 pro theo m&aacute;y, c&oacute; thể&nbsp;c&agrave;i Win 10 bản quyền nh</p>', '', 64, 1, 47, '2018-03-08 08:07:46', '2018-03-28 05:08:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile`
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
  `status_search` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `profile`
--

INSERT INTO `profile` (`id`, `fullname`, `alias`, `literacy_id`, `experience_id`, `rank_present_id`, `rank_offered_id`, `salary`, `file_attached`, `candidate_id`, `career_goal`, `status_search`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhân viên kinh doanh website , tên miền , hosting', 'nhan-vien-kinh-doanh-website-ten-mien-hosting', 5, 4, 3, 4, 17000000, 'ke-hoach-tmdtx-4bu8ydesm103.docx', 5, 'Mục tiêu nghề nghiệp là phần không thể thiếu trong mỗi CV. Đó là một bản mô tả ngắn gọn giúp nhà tuyển dụng nắm khái quát về bản thân và lộ trình công việc của bạn, từ đó cân nhắc về mức độ phù hợp của bạn đối với vị trí ứng tuyển.', 1, 0, '2018-04-16 05:05:40', '2018-04-21 09:46:28'),
(10, 'Nhân viên kinh doanh vé máy bay', 'nhan-vien-kinh-doanh-ve-may-bay', 2, 5, 3, 6, 8000000, 'ke-hoach-tmdtx-yz7a8oqlh2ib.xlsx', 5, NULL, 1, 1, '2018-04-16 10:12:19', '2018-04-17 03:51:48'),
(11, 'Nhân viên dạy tiếng anh', 'nhan-vien-day-tieng-anh', 6, 6, 4, 4, 8000000, 'wordpress-laravelx-ntsarleuf0cp.docx', 5, NULL, 1, 1, '2018-04-16 10:14:15', '2018-04-17 03:51:47'),
(12, 'Nhân viên dạy tiếng Nga', 'nhan-vien-day-tieng-nga', 5, 6, 3, 5, 8000000, 'wordpress-laravelx-z2wvye1l3b4s.docx', 5, NULL, 1, 1, '2018-04-16 10:18:40', '2018-04-17 03:51:49'),
(13, 'Nhân viên kế toán 834', 'nhan-vien-ke-toan-834', 3, 3, 3, 4, 7000000, NULL, 5, NULL, 1, 0, '2018-04-17 03:38:34', '2018-04-17 03:47:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile_experience`
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
-- Đang đổ dữ liệu cho bảng `profile_experience`
--

INSERT INTO `profile_experience` (`id`, `company_name`, `person_title`, `month_from`, `year_from`, `month_to`, `year_to`, `currency`, `salary`, `job_description`, `achievement`, `profile_id`, `created_at`, `updated_at`) VALUES
(1, 'Công ty cổ phần giải pháp EZ', 'Nhân Viên Triển Khai Phần Mềm Và Quản Lý Khách Hàng', 2, 2002, 3, 2003, 'vnd', 7000000, '- Tư vấn quy trình vận hành và quản lý cửa hàng bằng phần mềm cho khách hàng trong ngành bán lẻ, nhà hàng.\r\n- Chịu trách nhiệm hướng dẫn khách hàng sử dụng phần mềm quản lý bán hàng theo đúng quy trình đã thống nhất.\r\n- Cảnh báo các lỗ hổng trong quản lý cửa hàng, kết hợp cùng chủ cửa hàng đảm bảo nhân viên luôn vận hành phần mềm đúng cách.\r\n- Hỗ trợ, chăm sóc, tạo dựng mối liên hệ với khách hàng sau bán hàng trực tiếp hoặc từ xa qua teamview.\r\n- Tư vấn bán hàng các gói dịch vụ, sản phẩm kèm theo khi khách hàng có nhu cầu mở rộng, nâng cấp.\r\n- Phát triển hệ thống tích điểm theo công nghệ Blockchain mới nhất của công ty.', '- Có khả năng học hỏi và thay đổi nhanh.\r\n- Giao tiếp tự tin, nhẹ nhàng, trình bày mạch lạc, rõ ràng, không nói lắp, nói ngọng.\r\n- Dễ mến, có khả năng tạo thiện cảm khi làm việc với khách hàng.\r\n- Biết nghĩ cho người khác.\r\n- Kiên nhẫn xử lý dứt điểm vấn đề.\r\n- Chăm chỉ, nhiệt tình.\r\n- Có kĩ năng sử dụng máy tính tốt.', 1, '2018-04-23 11:49:55', '2018-04-23 11:49:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profile_job`
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
-- Đang đổ dữ liệu cho bảng `profile_job`
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
-- Cấu trúc bảng cho bảng `profile_place`
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
-- Đang đổ dữ liệu cho bảng `profile_place`
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
-- Cấu trúc bảng cho bảng `project`
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
-- Cấu trúc bảng cho bảng `project_article`
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
-- Cấu trúc bảng cho bảng `project_member`
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
-- Đang đổ dữ liệu cho bảng `project_member`
--

INSERT INTO `project_member` (`id`, `project_id`, `member_id`, `created_at`, `updated_at`) VALUES
(1, 10, 4, '2018-01-07 14:09:20', '2018-01-07 14:09:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `province`
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
-- Đang đổ dữ liệu cho bảng `province`
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
-- Cấu trúc bảng cho bảng `rank`
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
-- Đang đổ dữ liệu cho bảng `rank`
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
-- Cấu trúc bảng cho bảng `recruitment`
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
-- Đang đổ dữ liệu cho bảng `recruitment`
--

INSERT INTO `recruitment` (`id`, `fullname`, `alias`, `quantity`, `sex_id`, `description`, `requirement`, `work_id`, `literacy_id`, `experience_id`, `salary_id`, `commission_from`, `commission_to`, `working_form_id`, `probationary_id`, `benefit`, `duration`, `employer_id`, `count_view`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhân Viên Kỹ Thuật Làm Việc Tại Hồ Chí Minh', 'nhan-vien-ky-thuat-lam-viec-tai-ho-chi-minh', 2, 3, '- Sửa chữa, bảo trì về thiết bị ngành nha. \n- Lắp đặt thiết bị\n- Các công việc cấp trên giao.', '- Tốt nghiệp trung cấp hoặc cao đẳng ngành kỹ thuật liên quan đến tự động hóa, cơ điện tử, điện tử. \n- Nhanh nhẹn, nhiệt tình,cẩn thận, có trách nhiệm trong công việc. \n- Ưu tiên có kinh nghiệm 1 năm trở lên.', 2, 5, 4, 4, 20, 30, 1, 3, '- Thu nhập hấp dẫn theo năng lực\n- Được đào tạo các kỹ năng làm việc chuyên nghiệp \n- Các chế độ khác đầy đủ theo quy định của Nhà nước và của Công ty. \n- Cơ hội được đào tạo tại nước ngoài.', '2018-04-25 00:00:00', 7, NULL, 1, '2018-04-15 09:57:30', '2018-04-16 07:18:27'),
(2, 'Nhân Viên Lái Xe Taxi Tải Tại Tp. Hcm (Thu Nhập 10 - 12 Triệu Đồng) [Thành Hưng]', 'nhan-vien-lai-xe-taxi-tai-tai-tp-hcm-thu-nhap-10-12-trieu-dong-thanh-hung', 100, 1, '- Lái xe taxi tải theo sự điều động của công ty \r\n- Làm việc tại Quận 12 hoặc Quận 7 và Nhà Bè TP.HCM\r\n- Chi tiết công việc sẽ trao đổi cụ thể khi phỏng vấn', '- Trung thực, chăm chỉ\r\n- Thông thạo đường phố Hồ Chí Minh\r\n- Số lượng tuyển 100 lái xe', 2, 6, 3, 5, 10, 30, 1, 2, '- Với nhiều chế độ ưu đãi. Không phải đóng thế chấp ban đầu. \r\n- Được chia doanh thu cao đến 50%\r\n- Bổ túc tay lái miễn phí. \r\n- Được hỗ trợ lương cơ bản 02 tháng đầu\r\n- Công việc nhiều, ổn định, thu nhập cao (thu nhập từ 10 - 12 triệu đồng/tháng). \r\n- Được hỗ trợ nhà ở miễn phí cho hộ khẩu ngoại tỉnh. \r\n- Được thưởng doanh thu cao hàng tháng, quý, năm. \r\n- Được công ty hỗ trợ 5 triệu đồng khi hết hạn hợp đồng chuyển công việc khác. \r\n- 100% được đóng BHXH, BHYT, BHTN theo Luật Lao động.', '2018-04-30 00:00:00', 7, NULL, 1, '2018-04-21 10:04:43', '2018-04-21 10:19:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `recruitment_job`
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
-- Đang đổ dữ liệu cho bảng `recruitment_job`
--

INSERT INTO `recruitment_job` (`id`, `recruitment_id`, `job_id`, `created_at`, `updated_at`) VALUES
(5, 1, 18, '2018-04-15 10:09:49', '2018-04-15 10:09:49'),
(12, 2, 2, '2018-04-21 10:13:46', '2018-04-21 10:13:46'),
(13, 2, 4, '2018-04-21 10:13:46', '2018-04-21 10:13:46'),
(14, 2, 6, '2018-04-21 10:13:46', '2018-04-21 10:13:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `recruitment_place`
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
-- Đang đổ dữ liệu cho bảng `recruitment_place`
--

INSERT INTO `recruitment_place` (`id`, `recruitment_id`, `province_id`, `created_at`, `updated_at`) VALUES
(4, 1, 23, '2018-04-15 10:09:49', '2018-04-15 10:09:49'),
(11, 2, 2, '2018-04-21 10:13:46', '2018-04-21 10:13:46'),
(12, 2, 4, '2018-04-21 10:13:46', '2018-04-21 10:13:46'),
(13, 2, 6, '2018-04-21 10:13:46', '2018-04-21 10:13:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reminders`
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
-- Cấu trúc bảng cho bảng `roles`
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
-- Cấu trúc bảng cho bảng `role_users`
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
-- Cấu trúc bảng cho bảng `salary`
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
-- Đang đổ dữ liệu cho bảng `salary`
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
-- Cấu trúc bảng cho bảng `scale`
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
-- Đang đổ dữ liệu cho bảng `scale`
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
-- Cấu trúc bảng cho bảng `setting_system`
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
-- Đang đổ dữ liệu cho bảng `setting_system`
--

INSERT INTO `setting_system` (`id`, `fullname`, `alias`, `title`, `meta_keyword`, `meta_description`, `author`, `copyright`, `google_site_verification`, `google_analytics`, `logo_frontend`, `favicon`, `setting`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'settingsystem', 'setting-system', 'Laptop cũ giá rẻ uy tín, chất lượng nhất tại Tphcm | FHP', 'máy tính,  laptop cũ,', 'Bán lẻ máy tính, laptop cũ, mới trên toàn quốc, FHP là một trong những thương hiệu có tiếng lâu đời về các sản phẩm công nghệ như laptop cũ giá rẻ, phụ kiện laptop...', '', '', 'KlLQ51IBlGdopyRBTBG-QMPgj7Il9xduiEBGFkgo4nQ', 'UA-115473299-1', 'logo.png', 'favicon.ico', '[{\"field_name\":\"Số bài viết trên 1 trang\",\"field_code\":\"article_perpage\",\"field_value\":\"10\"},{\"field_name\":\"Độ rộng hình bài viết\",\"field_code\":\"article_width\",\"field_value\":\"400\"},{\"field_name\":\"Độ cao hình bài viết\",\"field_code\":\"article_height\",\"field_value\":\"250\"},{\"field_name\":\"Số sản phẩm trên 1 trang\",\"field_code\":\"product_perpage\",\"field_value\":\"32\"},{\"field_name\":\"Độ rộng hình sản phẩm\",\"field_code\":\"product_width\",\"field_value\":\"300\"},{\"field_name\":\"Độ cao hình sản phẩm\",\"field_code\":\"product_height\",\"field_value\":\"300\"},{\"field_name\":\"Đơn vị tiền tệ\",\"field_code\":\"currency_unit\",\"field_value\":\"vi_VN\"},{\"field_name\":\"MERCHANT_ID\",\"field_code\":\"merchant_id\",\"field_value\":\"36680\"},{\"field_name\":\"MERCHANT_PASS\",\"field_code\":\"merchant_pass\",\"field_value\":\"matkhauketnoi\"},{\"field_name\":\"RECEIVER\",\"field_code\":\"receiver\",\"field_value\":\"demo@nganluong.vn\"},{\"field_name\":\"Smtp host\",\"field_code\":\"smtp_host\",\"field_value\":\"smtp.gmail.com\"},{\"field_name\":\"Smtp port\",\"field_code\":\"smtp_port\",\"field_value\":\"465\"},{\"field_name\":\"Smtp authication\",\"field_code\":\"authentication\",\"field_value\":\"1\"},{\"field_name\":\"Encription\",\"field_code\":\"encription\",\"field_value\":\"ssl\"},{\"field_name\":\"Smtp username\",\"field_code\":\"smtp_username\",\"field_value\":\"dien.toannang@gmail.com\"},{\"field_name\":\"Smtp password\",\"field_code\":\"smtp_password\",\"field_value\":\"bjsdgetadsutdono\"},{\"field_name\":\"Email to\",\"field_code\":\"email_to\",\"field_value\":\"tichtacso.com@gmail.com\"},{\"field_name\":\"Contact person\",\"field_code\":\"contacted_person\",\"field_value\":\"Huỳnh Thúc Vinh\"},{\"field_name\":\"Trụ sở\",\"field_code\":\"address\",\"field_value\":\"50/2/59 Dương Quảng Hàm, Phường 5, Quận Gò Vấp\"},{\"field_name\":\"Hotline\",\"field_code\":\"telephone\",\"field_value\":\"0902.90.74.75\"},{\"field_name\":\"Facebook\",\"field_code\":\"facebook_url\",\"field_value\":\"https://www.facebook.com/nguyenvan.laptrinh\"},{\"field_name\":\"Twitter\",\"field_code\":\"twitter_url\",\"field_value\":\"https://twitter.com/\"},{\"field_name\":\"Google Plus\",\"field_code\":\"google_plus\",\"field_value\":\"https://plus.google.com/u/0/?hl=vi\"},{\"field_name\":\"Youtube\",\"field_code\":\"youtube_url\",\"field_value\":\"https://www.youtube.com/watch?v=kAcV7S3sySU\"},{\"field_name\":\"Instagram\",\"field_code\":\"instagram_url\",\"field_value\":\"http://flickr.com\"},{\"field_name\":\"Pinterest\",\"field_code\":\"pinterest_url\",\"field_value\":\"http://daidung.vn/\"},{\"field_name\":\"Map\",\"field_code\":\"map_url\",\"field_value\":\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.7765505259867!2d106.68751671435092!3d10.828404792286284!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528f0d3be7c47%3A0x3f95e11384c4817f!2zNTAgRMawxqFuZyBRdeG6o25nIEjDoG0sIHBoxrDhu51uZyA1LCBHw7IgVuG6pXAsIEjhu5MgQ2jDrSBNaW5oLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1515998374369\"},{\"field_name\":\"Giờ giao dịch\",\"field_code\":\"opened_time\",\"field_value\":\"7:00 - 22:30\"}]', 1, 1, '2017-12-03 07:45:35', '2018-04-05 01:41:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sex`
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
-- Đang đổ dữ liệu cho bảng `sex`
--

INSERT INTO `sex` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nam', 'nam', 1, 1, '2018-04-05 03:35:41', '2018-04-05 03:35:41'),
(2, 'Nữ', 'nu', 2, 1, '2018-04-05 03:35:48', '2018-04-05 03:35:53'),
(3, 'Không yêu cầu', 'khong-yeu-cau', 3, 1, '2018-04-12 06:35:12', '2018-04-12 07:11:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supporter`
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
-- Đang đổ dữ liệu cho bảng `supporter`
--

INSERT INTO `supporter` (`id`, `fullname`, `number_money`, `payment_method_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Nguyễn Thị Thu Hằng', '1000000', 1, 1, 1, '2018-01-07 17:32:50', '2018-01-07 17:47:21'),
(7, 'Trần Gia Lạc', '2000000', 2, 2, 1, '2018-01-07 18:02:15', '2018-01-08 07:19:18'),
(8, 'Lê Văn Đại', '2000000', 1, 3, 1, '2018-01-08 02:38:56', '2018-01-08 09:29:07'),
(9, 'Nguyễn Mạnh Hùng', '3000000', 2, 4, 1, '2018-01-08 02:39:19', '2018-01-08 02:39:19'),
(10, 'Trần Tiến Dư', '3000000', 2, 5, 1, '2018-01-08 02:39:35', '2018-01-08 02:39:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `throttle`
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
-- Đang đổ dữ liệu cho bảng `throttle`
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
(555, 1, 'user', NULL, '2018-04-15 18:19:46', '2018-04-15 18:19:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permissions`, `last_login`, `fullname`, `address`, `phone`, `image`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'diennk@dienkim.com', '$2y$10$hJkvWc.IvqSEoXnRj/b3nO7r5a6wiUXvRauDRiaoO/2guW5oOrNNe', NULL, '2018-04-15 18:19:53', 'Nguyễn Kim Điền', NULL, '0988162753', 'nguyen-kim-dien-292.png', 1, 1, '2017-11-12 07:23:56', '2018-04-15 18:19:53'),
(2, 'phucbtm', 'phucbtm@dienkim.com', '$2y$10$LN.mcmWoyQY1.AvMrEu.CeqYB0OrFPfTg.FAQ7qSdU/Sc13w/iy.K', NULL, '2018-04-15 08:29:28', 'Bùi Thị Mỹ Phúc', NULL, '0988162777', 'logo-3-6pnb19a7qygv.png', 2, 1, '2018-04-06 00:52:58', '2018-04-15 08:29:53'),
(3, 'dungnth', 'dungnth@dienkim.com', '$2y$10$06WqHjx5FB.AknXj2MPRceFHgn.WbKeeHLPzmlCfGJwIrIzuPKupG', NULL, '2018-04-15 08:27:23', 'Nguyễn Thị Hoàng Dung', NULL, '0988162781', 'logo-1-ju67i1ylo2f8.png', 3, 1, '2018-04-06 00:54:14', '2018-04-15 08:31:04'),
(4, 'thuyptt', 'thuyptt@dienkim.com', '$2y$10$IExbuIwqMRNyvA4ppYjVtOpobGtABTssSrEChbXURmludJyQTbQ3W', NULL, '2018-04-06 08:36:44', 'Phạm Thị Thanh Thủy', NULL, '0982778123', 'logo-2-ge30clh856td.png', 4, 1, '2018-04-06 00:55:07', '2018-04-06 08:36:44'),
(5, 'thuyttt', 'thuyttt@dienkim.com', '$2y$10$AA6KmOmb/IPF2RZyy3usc.GWvSfZmgNJySKEf65tUtxJ6e3hpp1lS', NULL, '2018-04-06 08:52:03', 'Trần Thị Thanh Thúy', NULL, '0923111222', 'logo-3-3e4tfsqz86h2.png', 5, 1, '2018-04-06 00:56:08', '2018-04-06 08:52:03'),
(6, 'thaoht', 'thaoht@dienkim.com', '$2y$10$HH42krxiiZhRfnaedbjw7exT3LpC5052NANqWiBIFH/As/Gvb5Soe', NULL, '2018-04-06 08:38:28', 'Hoàng Thị Hồng Thảo', NULL, '0944111333', 'logo-4-m30xjclwqpy7.png', 6, 1, '2018-04-06 00:57:12', '2018-04-06 08:38:28'),
(7, 'trangttt', 'trangttt@dienkim.com', '$2y$10$1YolHwegMnyr/ewwtr4t9OHy4apeBhARteyM0cJMxd3oP1rx2XdcO', NULL, '2018-04-06 08:38:44', 'Trần Thị Thu Trang', NULL, '0999123321', 'logo-4-k59pac0t2zg8.png', 7, 1, '2018-04-06 00:57:56', '2018-04-06 08:38:44'),
(8, 'kimly', 'kimly@dienkim.com', '$2y$10$J5v.WmXt1sULlh/vUAQRYek.kX5kl.M1sjb47IqpGR9XZHyMU5OGu', NULL, '2018-04-06 18:57:26', 'Trần Thị Kim Lý', NULL, '0988445223', 'logo-2-7bpmj9wy4xcl.png', 8, 1, '2018-04-06 18:34:42', '2018-04-11 01:00:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_group_member`
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
-- Đang đổ dữ liệu cho bảng `user_group_member`
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
-- Cấu trúc bảng cho bảng `video`
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
-- Đang đổ dữ liệu cho bảng `video`
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
-- Cấu trúc bảng cho bảng `work`
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
-- Đang đổ dữ liệu cho bảng `work`
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
-- Cấu trúc bảng cho bảng `working_form`
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
-- Đang đổ dữ liệu cho bảng `working_form`
--

INSERT INTO `working_form` (`id`, `fullname`, `alias`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhân viên chính thức', 'nhan-vien-chinh-thuc', 1, 1, '2018-04-12 07:02:39', '2018-04-12 07:02:39'),
(2, 'Nhân viên thời vụ', 'nhan-vien-thoi-vu', 1, 1, '2018-04-12 07:02:49', '2018-04-12 07:02:49'),
(3, 'Bán thời gian', 'ban-thoi-gian', 1, 1, '2018-04-12 07:02:58', '2018-04-12 07:02:58'),
(4, 'Làm thêm ngoài giờ', 'lam-them-ngoai-gio', 1, 1, '2018-04-12 07:03:07', '2018-04-12 07:03:07'),
(5, 'Thực tập và dự án', 'thuc-tap-va-du-an', 1, 1, '2018-04-12 07:03:31', '2018-04-12 07:03:31');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_article`
--
ALTER TABLE `category_article`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_banner`
--
ALTER TABLE `category_banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_param`
--
ALTER TABLE `category_param`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_video`
--
ALTER TABLE `category_video`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `group_member`
--
ALTER TABLE `group_member`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `group_privilege`
--
ALTER TABLE `group_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `literacy`
--
ALTER TABLE `literacy`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `marriage`
--
ALTER TABLE `marriage`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `module_item`
--
ALTER TABLE `module_item`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Chỉ mục cho bảng `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `post_param`
--
ALTER TABLE `post_param`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `probationary`
--
ALTER TABLE `probationary`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `profile_experience`
--
ALTER TABLE `profile_experience`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `profile_job`
--
ALTER TABLE `profile_job`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `profile_place`
--
ALTER TABLE `profile_place`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `project_article`
--
ALTER TABLE `project_article`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `project_member`
--
ALTER TABLE `project_member`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `recruitment`
--
ALTER TABLE `recruitment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `recruitment_job`
--
ALTER TABLE `recruitment_job`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `recruitment_place`
--
ALTER TABLE `recruitment_place`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Chỉ mục cho bảng `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `scale`
--
ALTER TABLE `scale`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `setting_system`
--
ALTER TABLE `setting_system`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `supporter`
--
ALTER TABLE `supporter`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `user_group_member`
--
ALTER TABLE `user_group_member`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `working_form`
--
ALTER TABLE `working_form`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `album`
--
ALTER TABLE `album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `article`
--
ALTER TABLE `article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `article_category`
--
ALTER TABLE `article_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category_article`
--
ALTER TABLE `category_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `category_banner`
--
ALTER TABLE `category_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `category_param`
--
ALTER TABLE `category_param`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `category_video`
--
ALTER TABLE `category_video`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `district`
--
ALTER TABLE `district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `employer`
--
ALTER TABLE `employer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `experience`
--
ALTER TABLE `experience`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `group_member`
--
ALTER TABLE `group_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `group_privilege`
--
ALTER TABLE `group_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4899;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `job`
--
ALTER TABLE `job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `literacy`
--
ALTER TABLE `literacy`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `marriage`
--
ALTER TABLE `marriage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- AUTO_INCREMENT cho bảng `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `module_item`
--
ALTER TABLE `module_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `page`
--
ALTER TABLE `page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=913;

--
-- AUTO_INCREMENT cho bảng `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `post_param`
--
ALTER TABLE `post_param`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT cho bảng `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT cho bảng `probationary`
--
ALTER TABLE `probationary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `profile_experience`
--
ALTER TABLE `profile_experience`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `profile_job`
--
ALTER TABLE `profile_job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `profile_place`
--
ALTER TABLE `profile_place`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `project_article`
--
ALTER TABLE `project_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `project_member`
--
ALTER TABLE `project_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `province`
--
ALTER TABLE `province`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `rank`
--
ALTER TABLE `rank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `recruitment`
--
ALTER TABLE `recruitment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `recruitment_job`
--
ALTER TABLE `recruitment_job`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `recruitment_place`
--
ALTER TABLE `recruitment_place`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `salary`
--
ALTER TABLE `salary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `scale`
--
ALTER TABLE `scale`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `setting_system`
--
ALTER TABLE `setting_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sex`
--
ALTER TABLE `sex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `supporter`
--
ALTER TABLE `supporter`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user_group_member`
--
ALTER TABLE `user_group_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `work`
--
ALTER TABLE `work`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `working_form`
--
ALTER TABLE `working_form`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
