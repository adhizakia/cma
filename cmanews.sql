-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Mar 2024 pada 16.06
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmanews`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `active`, `posting_date`, `updated_date`) VALUES
(1, 'Pendidikan', 'Berita tentang pendidikan', 1, '2024-02-11 08:34:46', NULL),
(2, 'Pariwisata', 'Berita tentang pariwisata', 1, '2024-02-11 08:35:11', NULL),
(3, 'Kuliner', 'Berita tentang makanan', 1, '2024-02-20 03:13:43', NULL),
(6, 'Pertambangan', 'Berita tentang tambang', 1, '2024-02-21 03:15:10', NULL),
(7, 'Politik', 'Tentang Politik', 0, '2024-03-01 02:20:39', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `offline_posts`
--

CREATE TABLE `offline_posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `analyze_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `source_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text NOT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `posted_by` varchar(255) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `offline_posts`
--

INSERT INTO `offline_posts` (`id`, `category_id`, `analyze_id`, `title`, `slug`, `source_id`, `date`, `description`, `view_counter`, `active`, `posted_by`, `last_updated_by`, `posting_date`, `updated_date`) VALUES
(310, 1, 126, 'Jadwal Samsat Keliling Karanganyar Hari Ini 2 Maret 2024', 'jadwal_samsat_keliling_karanganyar_hari_ini_1_maret_2024', 2, '2024-03-01', '<p style=\"outline-style: initial; outline-width: 0px; margin-bottom: 30px; font-size: 1.1rem; line-height: 2; color: rgb(10, 22, 51); font-family: Slimbach;\"><span style=\"outline-style: initial; outline-width: 0px; font-weight: bolder;\">Solopos.com, KARANGANYAR —&nbsp;</span>Untuk mendorong pendapatan daerah serta memudahkan masyarakat membayar pajak kendaraan bermotor, UPPD/Samsat Karanganyar mengadakan layanan keliling di sejumlah daerah.</p><p style=\"outline-style: initial; outline-width: 0px; margin-bottom: 30px; font-size: 1.1rem; line-height: 2; color: rgb(10, 22, 51); font-family: Slimbach;\">Berikut ini informasi jadwal Samsat Keliling Karanganyar hari ini, Jumat (1/3/2024), yang dikutip&nbsp;<em style=\"outline-style: initial; outline-width: 0px;\">Solopos.com</em>&nbsp;dari akun Instagram</p>', 5, 1, 'admin', NULL, '2024-03-01 01:23:28', NULL),
(311, 1, 127, 'PDIP Taati Aturan Main Parpol dalam Penghitungan Suara', 'pdip_taati_aturan_main_parpol_dalam_penghitungan_suara', 1, '2024-03-17', 'Deskripsi contoh untuk simulasi update.', 1, 1, 'Admin', 'Admin', '2024-03-16 17:00:00', '2024-03-17 12:31:38'),
(313, 1, 129, 'Baca Artikel Baru Lagi', 'baca_artikel_baru_lagi', 1, '2024-04-09', '<p><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Sementara itu dilansir Al Arabiya, Netanyahu mengatakan tidak akan pernah melupakan serangan Hamas pada 7 Oktober 2023 lalu. Netanyahu menegaskan kembali bahwa Israel akan melanjutkan serangannya di Gaza, termasuk di kota Rafah, dan mengevakuasi warga sipil dari zona pertempuran.</span><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Baca artikel detiknews, \"Dikecam Berbagai Negara, Netanyahu Tetap Luncurkan Serangan ke Rafah\" selengkapnya </span><a href=\"https://news.detik.com/internasional/d-7246591/dikecam-berbagai-negara-netanyahu-tetap-luncurkan-serangan-ke-rafah\" style=\"background: rgb(255, 255, 255); color: rgb(0, 0, 0); transition: color 0.3s ease-in-out 0s, background 0.3s ease-in-out 0s, opacity 0.3s ease-in-out 0s; font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">https://news.detik.com/internasional/d-7246591/dikecam-berbagai-negara-netanyahu-tetap-luncurkan-serangan-ke-rafah</a><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">.</span><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Download Apps Detikcom Sekarang https://apps.detik.com/detik/</span><br></p>', 6, 1, 'admin', 'Admin', '2024-03-17 12:40:42', '2024-03-17 14:57:37'),
(314, 1, 130, 'Mark Zuckerberg dan Jeff Bezos Jual Saham Miliaran Dolar, Ada Apa?  Baca artikel detikinet, ', 'mark_zuckerberg_dan_jeff_bezos_jual_saham_miliaran_dolar,_ada_apa?__baca_artikel_detikinet,_', 1, '2024-03-17', '<p><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Baca artikel detikinet, \"Mark Zuckerberg dan Jeff Bezos Jual Saham Miliaran Dolar, Ada Apa?\" selengkapnya </span><a href=\"https://inet.detik.com/business/d-7246441/mark-zuckerberg-dan-jeff-bezos-jual-saham-miliaran-dolar-ada-apa\" style=\"background: rgb(255, 255, 255); color: rgb(0, 0, 0); transition: color 0.3s ease-in-out 0s, background 0.3s ease-in-out 0s, opacity 0.3s ease-in-out 0s; font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">https://inet.detik.com/business/d-7246441/mark-zuckerberg-dan-jeff-bezos-jual-saham-miliaran-dolar-ada-apa</a><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">.</span><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><br style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\"><span style=\"font-family: Helvetica-FF, Arial, Tahoma, sans-serif; font-size: 16px;\">Download Apps Detikcom Sekarang https://apps.detik.com/detik/</span><br></p>', NULL, 1, 'admin', 'Admin', '2024-03-17 12:42:13', '2024-03-17 13:52:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `offline_post_analyze`
--

CREATE TABLE `offline_post_analyze` (
  `id` int(11) NOT NULL,
  `positive` int(11) NOT NULL,
  `negative` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `offline_post_analyze`
--

INSERT INTO `offline_post_analyze` (`id`, `positive`, `negative`, `total`, `result`, `timestamp`) VALUES
(78, 0, 1, 1, 'Negatif', '2024-02-11 12:14:30'),
(79, 1, 2, 2, 'Negatif', '2024-02-11 12:19:32'),
(80, 1, 7, 7, 'Negatif', '2024-02-11 16:14:42'),
(81, 3, 2, 3, 'Positif', '2024-02-11 16:16:21'),
(85, 3, 5, 2, '', '2024-02-12 12:21:22'),
(86, 4, 4, 3, '', '2024-02-12 12:22:11'),
(87, 0, 2, 0, 'Positif', '2024-02-12 13:48:16'),
(88, 2, 2, 3, '', '2024-02-12 13:53:33'),
(89, 2, 0, 5, '', '2024-02-13 00:44:22'),
(90, 2, 2, 3, '', '2024-02-15 06:08:53'),
(91, 4, 1, 4, 'Positif', '2024-02-16 01:48:20'),
(92, 2, 2, 3, '', '2024-02-16 01:58:07'),
(93, 2, 1, 3, '', '2024-02-16 01:59:42'),
(94, 1, 1, 3, '', '2024-02-16 02:03:39'),
(95, 1, 1, 3, '', '2024-02-16 02:05:40'),
(96, 1, 1, 3, '', '2024-02-16 02:11:45'),
(97, 1, 1, 3, '', '2024-02-16 02:15:08'),
(98, 1, 1, 3, '', '2024-02-16 02:15:34'),
(99, 2, 1, 3, '', '2024-02-16 02:16:35'),
(100, 2, 1, 3, '', '2024-02-17 04:31:22'),
(101, 1, 1, 3, '', '2024-02-17 05:26:37'),
(102, 1, 1, 3, '', '2024-02-17 05:27:45'),
(103, 1, 2, 2, 'Negatif', '2024-02-17 05:29:46'),
(104, 1, 2, 2, 'Negatif', '2024-02-17 07:59:13'),
(105, 0, 3, 0, 'Positif', '2024-02-17 08:13:09'),
(106, 0, 3, 0, 'Positif', '2024-02-17 08:13:17'),
(107, 0, 3, 0, 'Positif', '2024-02-17 08:17:55'),
(108, 0, 3, 0, 'Positif', '2024-02-17 08:19:11'),
(109, 0, 3, 0, 'Positif', '2024-02-17 08:27:03'),
(110, 1, 4, 1, 'Positif', '2024-02-20 03:31:16'),
(111, 0, 1, 0, 'Positif', '2024-02-20 03:32:13'),
(112, 0, 3, 0, 'Positif', '2024-02-20 07:29:38'),
(113, 3, 10, 1, '', '2024-02-20 07:32:05'),
(114, 1, 5, 1, 'Positif', '2024-02-20 15:04:42'),
(115, 2, 2, 3, '', '2024-02-21 02:13:24'),
(116, 1, 4, 1, 'Positif', '2024-02-21 03:07:55'),
(117, 2, 5, 1, '', '2024-02-23 00:31:27'),
(118, 0, 1, 0, 'Positif', '2024-02-23 01:14:18'),
(119, 10, 12, 2, '', '2024-02-23 02:41:03'),
(120, 0, 1, 0, 'Positif', '2024-02-25 16:53:35'),
(121, 0, 1, 0, 'Positif', '2024-02-25 17:14:22'),
(122, 0, 1, 0, 'Positif', '2024-02-27 05:08:17'),
(123, 0, 1, 0, 'Positif', '2024-02-27 06:02:00'),
(124, 22, 14, 3, '', '2024-02-29 12:05:50'),
(125, 0, 5, 0, 'Positif', '2024-02-29 22:59:11'),
(126, 7, 3, 4, '', '2024-03-01 01:23:28'),
(127, 9, 19, 2, '', '2024-03-01 02:07:25'),
(128, 14, 16, 2, '', '2024-03-01 02:23:06'),
(129, 3, 18, 1, '', '2024-03-17 12:40:42'),
(130, 2, 9, 1, '', '2024-03-17 12:42:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `offline_post_images`
--

CREATE TABLE `offline_post_images` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `offline_post_images`
--

INSERT INTO `offline_post_images` (`id`, `post_id`, `name`, `serial_number`, `url`, `posting_date`, `updated_date`) VALUES
(80, 310, 'atas2.jpg', 1, 'postimages/atas2.jpg', '2024-03-01 01:23:28', NULL),
(84, 311, 'WIN_20240129_15_10_03_Pro.jpg', 1, 'postimages/WIN_20240129_15_10_03_Pro.jpg', '2024-03-17 10:48:43', '2024-03-17 12:31:38'),
(92, 314, 'backButton.png', 1, 'postimages/d3b4b389a961cdd52efacdc8ff96c60f.png', '2024-03-17 13:52:06', NULL),
(93, 314, '', 2, 'postimages/d41d8cd98f00b204e9800998ecf8427e.', '2024-03-17 13:52:06', NULL),
(97, 313, 'option3.png', 1, 'postimages/af931d2c7d3b45d99f32f97e02b63bc9.png', '2024-03-17 14:57:37', NULL),
(98, 313, 'option4.gif', 2, 'postimages/47d9f15f575cda25f78f2ead4a17c639.gif', '2024-03-17 14:57:37', NULL),
(99, 313, '', 3, 'postimages/d41d8cd98f00b204e9800998ecf8427e.', '2024-03-17 14:57:37', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `online_posts`
--

CREATE TABLE `online_posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `analyze_id` int(11) NOT NULL,
  `link` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text NOT NULL,
  `view_counter` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `online_posts`
--

INSERT INTO `online_posts` (`id`, `category_id`, `analyze_id`, `link`, `title`, `date`, `description`, `view_counter`, `active`, `admin`, `posting_date`) VALUES
(54, 2, 121, 'https://soloraya.solopos.com/hujan-siang-sampai-sore-ini-di-klaten-simak-prakiraan-cuaca-jumat-23-februari-1869218?_gl=1*1mhf90b*_ga*MzM1OTExNzcwLjE3MDQ3NzIwMTg.*_ga_N48JD3Q0D2*MTcwODY0NzkzNy4xMy4xLjE3MDg2NDgzNjUuMC4wLjE0MDc0MjA3OTQ.', 'Hujan Siang sampai Sore Ini di Klaten, Simak Prakiraan Cuaca Jumat 23 Februari - Solopos.com | Panduan Informasi dan Inspirasi', '2024-02-23', 'Solopos.com, KLATEN — Prakiraan cuaca wilayah Klaten bakal hujan pada siang hingga sore hari ini, Jumat (23/2/2024). Badan Meteorologi Klimatologi dan Geofisika atau BMKG menginformasikan hujan turun dengan intensitas sedang.\nSuhu udara relatif hangat dengan suhu terendah menurut laman resmi BMKG yaitu 25 derajat Celsius pada pagi hari sedangkan suhu tertinggi mencapai 31 derajat Celsius pada siang hari.\r\n                                                                                            \nPromosi\r\n                                    PT Pegadaian Raih 25 Juta Nasabah, Sebagian Besar Kaum Perempuan\r\n                                \r\n                                \nPergerakan angin terpantau dari barat dan barat daya sepanjang hari dengan kecepatan 10-20 km/jam. BMKG menyampaikan informasi prakiraan cuaca melalui laman resminya setiap hari dengan pembaruan per tiga jam dimulai pada pukul 01.00 WIB.\r\n                            \nKlaten berawan pada prakiraan cuaca dini hari itu dengan suhu udara 26 derajat Celsius. Tingkat kelembapan udara tinggi mencapai 85% sementara angin terpantau tenang.\nCuaca juga berawan pada pukul 04.00 WIB. Suhu udara bertahan di angka 26 derajat Celsius sementara tingkat kelembapan udara naik jadi 90%. Angin terpantau masih tenang.\nPada pagi hari pukul 07.00 WIB, cuaca juga berawan dengan suhu udara turun jadi 25 derajat Celsius sementara tingkat kelembapan udara turun jadi 80%. Angin menampakkan pergerakan dari arah barat dengan kecepatan 10 km/jam.\nMenjelang siang pukul 10.00 WIB, cuaca masih berawan dengan suhu udara naik jadi 29 derajat Celsius dan tingkat kelembapan udara turun jadi 70%. Angin tetap dari barat dengan kecepatan 20 km/jam.\r\n                            \nPrakiraan cuaca Klaten berubah jadi hujan sedang pada siang hari pukul 13.00 WIB. Suhu udara naik ke titik tertinggi yakni 31 derajat Celsius dan tingkat kelembapan udara turun jadi 65%. Angin berubah arah dari barat daya dengan kecepatan 20 km/jam.\nHujan masih mengguyur dengan intensitas sedang pada sore hari pukul 16.00 WIB. Suhu udara turun jadi 28 derajat Celsius dan tingkat kelembapan udara naik ke angka 70%. Angin juga dari barat daya dengan kecepatan 20 km/jam.\nBergeser ke malam hari pukul 19.00 WIB, hujan sudah reda dan langit kembali mendung. Suhu udara bertahan di angka 28 derajat Celsius sementara tingkat kelembapan udara naik jadi 75%. Angin lanjut dari barat daya dengan kecepatan 10 km/jam.\nTerakhir pukul 22.00 WIB, cuaca tetap berawan dengan suhu udara turun jadi 27 derajat Celsius. Tingkat kelembapan udara naik jadi 85% dan angin terpantau dari barat daya dengan kecepatan 10 km/jam.\r\n                            \n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', 219, 1, NULL, '2024-03-17 15:02:47'),
(55, 1, 122, 'https://travel.detik.com/travel-news/d-7218498/rahasia-menyeramkan-di-balik-pesta-es-krim-kru-kapal-pesiar', 'Rahasia Menyeramkan di Balik Pesta Es Krim Kru Kapal Pesiar', '2024-03-02', 'Ada rahasia yang cukup menyeramkan di balik pesta es krim yang digelar kru kapal pesiar saat sedang berlayar. Apa rahasianya?\nTak banyak yang tahu jika kru kapal pesiar ternyata kerap mengadakan pesta es krim. Saat sedang tak bekerja, mereka akan berpesta dan makan es krim secara bersama-sama.\nRupanya, ada fakta mengejutkan di balik fenomena itu. Salah satu kru kapal pesiar bernama Dara Tucker, membuat sebuah pengakuan di video TikToknya untuk menjelaskan hal tersebut.\nADVERTISEMENT\r\n\nSCROLL TO CONTINUE WITH CONTENT\r\n\nMenurut cerita Dara, pesta es krim yang dilakukan para kru kapal pesiar bukan semata-mata cara untuk bersenang-senang, atau untuk menghabiskan waktu saja.\nKru kapal pesiar sengaja menggelar pesta es krim supaya menghabiskan stok agar ruang penyimpanan di freezer mereka jadi sedikit lebih lega.\nLantas, apa gunanya jika ruangan di freezer kapal pesiar jadi lebih lega? Ya benar, untuk menyimpan jenazah manusia, baik itu wisatawan atau kru yang tiba-tiba meninggal dunia di atas kapal pesiar yang sedang berlayar.\n\"Jika kru kapal pesiar tiba-tiba membagi-bagikan es krim kepada para penumpang, itu artinya orang meninggal di kapal pesiar lebih banyak dibandingkan dengan ruangan yang tersedia di kamar mayat,\" ujar Dara lewat akun TikToknya @darastarrtucker.\n\"Jika ada lebih dari 7 orang yang meninggal dunia di atas kapal pesiar, maka kami akan menyimpan tubuh mereka di freezer. Artinya, kami membutuhkan ruang lebih lega di sana. Jadi kami akan mengeluarkan stok es krim, agar freezer kami muat untuk menyimpan jenazah manusia,\" imbuh mantan penyanyi di kapal pesiar itu.\nMendengar pengakuan Dara, banyak Tiktoker yang tidak percaya jika kapal pesiar punya kamar mayat dan jenazah yang tidak muat disimpan di sana akan disimpan di freezer.\nNamun, banyak mantan kru kapal pesiar yang membenarkan pengakuan Dara. Banyak orang yang tidak tahu bahwa di dalam kapal pesiar ada kamar mayat untuk menyimpan jenazah orang yang meninggal dunia saat kapal sedang berlayar.\n\"Kru medis kapal pesiar di sini. Saya bisa mengonfirmasi ada hubungan antara kamar mayat dan es krim,\" balas Tiktoker bernama Cory Bucker.\n\"Mantan pelaut di sini, yes. Cerita itu sangat akurat. Terkadang kami memang membutuhkan ruangan lebih lega di freezer,\" balas Tiktoker lainnya.\n\"Itu (kematian) bisa juga terjadi di kapal militer juga. Kami tidak punya kamar mayat, jadi jika kru kapal makan enak, itu berari stok makanan di freezer sedang dikeluarkan agar ada ruang tersisa,\" timpal yang lain.', 220, 1, NULL, '2024-03-17 15:02:47'),
(56, 1, 123, 'https://soloraya.solopos.com/jadi-anggota-dprd-karanganyar-termuda-mubarok-janji-kritis-bawa-suara-warga-1873424', 'Jadi Anggota DPRD Karanganyar Termuda, Mubarok Janji Kritis Bawa Suara Warga - Solopos.com | Panduan Informasi dan Inspirasi', '2024-03-01', 'Solopos.com, KARANGANYAR — Kalangan anak muda akan mewarnai wajah DPRD Kabupaten Karanganyar periode 2024-2029. Tak dimungkiri, kaum milenial dan generasi Z turut meramaikan pencalonan anggota legislatif di Pemilu 2024. Mereka mampu bertarung dengan para politikus senior hingga lolos ke parlemen.\nSalah satunya adalah calon legislatif (caleg) dari Partai Demokrat yang maju di Dapil Karanganyar 1, Muhammad Mubarok. Berdasarkan perhitungan suara tingkat PPK, perwakilan kaum milenial dan gen Z ini meraup 9.860 suara by name plus suara partai. Mubarok disebut-sebut bakal menjadi anggota DPRD Karanganyar termuda, di usia 23 tahun. Ia mengalahkan Ketua DPD II Partai Golkar Karanganyar, Ilyas Akbar Almadani, dalam hal usia. Ilyas bakal berusia 26 tahun pada Mei nanti.\r\n                                                                                            \nPromosi\r\n                                    Pegadaian Bareng Forsepsi Bersih-bersih Sampah di Pantai Pangandaran\r\n                                \r\n                                \nSaat berbincang dengan Solopos.com, Mubarok awalnya tak tertarik dengan dunia politik. Ia masih apatis terhadap politik. “Jadi memang di pikiran saya itu dulu politik buruk. Lalu saya kok tertarik terjun ke politik dan ingin merubah stigma itu,” kata dia, Kamis (29/2/2024).\r\n                            \nMubarok pun dilirik Partai Demokrat dan diminta bergabung dalam partai besutan mantan Presiden Susilo Bambang Yudhoyono (SBY) tersebut. Ia lantas mendaftarkan diri sebagai caleg Partai Demokrat di Dapil I meliputi Karanganyar, Matesih, dan Mojogedang.\nIa menempati nomor urut paling buncit, 10. Meski begitu, tak lantas menyurutkan semangatnya bersaing meraih kursi legislatif. Ia mengandalkan basis massa anak muda hingga akhirnya mampu membawanya melenggang ke parlemen.\n“Cukup berat waktu itu. Saya ini kan pendatang baru. Kompetitor datang tidak hanya dari internal partai, tapi juga politikus senior yang sudah punya massa,” kata Mubarok.\nDengan kegigihan dan ketekunannya, ia pergi door to door ke masyarakat. “Paseduluran Saklawase” (bersaudara selamanya) menjadi tagline yang dibawanya. Ia meyakinkan basis massanya bahwa dirinya tidak hanya datang di saat menjelang pemilu, namun selamanya akan ada untuk masyarakat.\r\n                            \n“Alhamdulillah saya diterima baik dan dipercaya masyarakat. Kepercayaan ini menjadi pegangan saya agar menjadi wakil rakyat yang amanah,” kata putra pemilik warung makan Beti di Tasikmadu, Karanganyar ini.\nMubarok merupakan anak pasangan Betty Sumardani dan Sunartomo yang akrab dipanggil Mas Lawas. Ia merupakan Sarjana Teknik Informatika lulusan Universitas Muhammadiyah Surakarta (UMS) yang diwisuda pada September 2023.\nIa tak ingin jadi anggota Dewan yang hanya duduk dan diam. Mubarok berjanji kritis menyuarakan aspirasi masyarakat. “Tentu saya akan vokal dan kritis menyuarakan aspirasi masyarakat. Ini juga cara saya menjaga hubungan selawase yang diambil dari nama ayah saya itu,” katanya.\nSelain Mubarok, caleg terpilih dari kalangan anak muda juga datang dari putra mantan Bupati Karanganyar Juliyatmono, Ilyas Akbar Almadani. Ilyas lolos dengan perolehan 9.321 suara di Dapil V Karanganyar.\r\n                            \n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com\n© 2007-2024, Solopos Digital Media - Panduan Informasi & Inspirasi. All rights reserved.', NULL, 1, NULL, '2024-03-01 02:10:32'),
(57, 2, 124, 'https://bisnis.solopos.com/jelang-akhir-pekan-siap-jalan-jalan-cek-jadwal-krl-solo-jogja-hari-ini-1874052?_gl=1*1wge3rn*_ga*MzM1OTExNzcwLjE3MDQ3NzIwMTg.*_ga_N48JD3Q0D2*MTcwOTI1ODQyNS4yMi4xLjE3MDkyNTk4MjMuMC4wLjc5NjM2MDc5OA..', 'Jelang Akhir Pekan Siap Jalan-Jalan, Cek Jadwal KRL Solo-Jogja Hari Ini - Solopos.com | Panduan Informasi dan Inspirasi', '2024-03-01', 'Solopos.com, SOLO –  Untuk melakukan perjalanan atau sekadar jalan-jalan dengan nyaman dan aman ke Jogja dari Solo atau sebaliknya cek dulu jadwal perjalanan KRL atau Commuter Line Solo-Jogja hari ini, Jumat (1/3/2024).\nJarak Jogja-Solo sekitar 60 kilometer biasanya ditempuh sekitar 2 jam dengan kendaraan pribadi namun dengan KRL hanya membutuhkan waktu sekitar 1 jam.\r\n                                                                                            \nSebelum melakukan perjalanan menggunakan KRL Solo-Jogja, pastikan Anda telah memiliki tiket KRL. Saat ini, tiket KRL dapat berupa kartu multi trip (KMT) atau kartu uang elektronik dari bank, seperti e-money Mandiri.\r\n                            \nMengutip dari laman resmi commuter line Harga tiket KRL Solo-Jogja adalah Rp8000, harga tersebut merupakan harga untuk sekali naik. Bagi yang belum memiliki KMT, tiket dapat dibeli di loket stasiun dengan harga Rp30.000, dengan minimal isi saldo Rp10.000.\nSelain lewat loket stasiun penumpang dapat melakukan pengisian saldo KMT melalui vending machine dan minimarket yang telah bekerja sama dengan PT Kereta Commuter Indonesia.\nAnda juga bisa membeli tiket secara online melalui aplikasi C-Acces. Setiap akun hanya dibatasi untuk membeli tiket KRL Solo-Jogja pada hari yang sama dengan maksimal pembelian 4 tiket untuk 4 penumpang.\nJadwal KRL Solo-Jogja hari ini, Jumat (1/3/2024):\r\n                            \nBerangkat pukul 05.30 WIB, 06.50 WIB, 07.40 WIB, 08.50 WIB, 10.25 WIB, 11.55 WIB, 13.05 WIB, 15.20 WIB, 16.30 WIB, 17.45 WIB, 20.16 WIB, 22.35 WIB\nBerangkat pukul 05.36 WIB, 06.55 WIB, 07.46 WIB, 08.55 WIB, 10.31 WIB, 12.00 WIB, 13.11 WIB, 15.25 WIB, 16.35 WIB, 17.50 WIB, 20.21 WIB, 22.42 WIB\nBerangkat pukul 05.43 WIB, 07.02 WIB, 07.53 WIB, 09.02 WIB, 10.38 WIB, 12.07 WIB, 13.18 WIB, 15.32 WIB, 16.42 WIB, 17.57 WIB, 20.28 WIB, 22.49 WIB\nBerangkat pukul 05.51 WIB, 07.10 WIB, 08.01 WIB, 09.10 WIB, 10.46 WIB, 12.15 WIB, 13.26 WIB, 15.40 WIB, 16.50 WIB, 18.05 WIB, 20.36 WIB, 22.57 WIB\r\n                            \nBerangkat pukul 05.58 WIB, 07.17 WIB, 08.08 WIB, 09.17 WIB, 10.53 WIB, 12.22 WIB, 13.33 WIB, 15.47 WIB, 16.57 WIB, 18.12 WIB, 20.43 WIB, 23.04 WIB\nBerangkat pukul 06.05 WIB, 07.24 WIB, 08.16 WIB, 09.24 WIB, 11.01 WIB, 12.29 WIB, 13.41 WIB, 15.54 WIB, 17.04 WIB, 18.19 WIB, 20.50 WIB, 23.12 WIB\nBerangkat pukul 06.14 WIB, 07.33 WIB, 08.25 WIB, 09.33 WIB, 11.10 WIB, 12.38 WIB, 13.50 WIB, 16.03 WIB, 17.13 WIB, 18.28 WIB, 20.59 WIB, 23.12 WIB\nBerangkat pukul 06.21 WIB, 07.40 WIB, 08.32 WIB, 09.40 WIB, 11.17 WIB, 12.45 WIB, 13.57 WIB, 16.10 WIB, 17.20 WIB, 18.35 WIB, 21.06 WIB, 23.28 WIB\nBerangkat pukul 06.27 WIB, 07.46 WIB, 08.38 WIB, 09.46 WIB, 11.24 WIB, 12.51 WIB, 14.16 WIB, 16.16 WIB, 17.26 WIB, 18.41 WIB, 21.12 WIB, 23.35 WIB\nBerangkat pukul 06.34 WIB, 07.53 WIB, 08.45 WIB, 09.53 WIB, 11.32 WIB, 12.58 WIB, 14.23 WIB, 16.23 WIB, 17.34 WIB, 18.48 WIB, 21.19 WIB, 23.42 WIB\nBerangkat pukul 06.40 WIB, 08.04 WIB, 08.53 WIB, 09.59 WIB, 11.39 WIB, 13.07 WIB, 14.30 WIB, 16.30 WIB, 17.41 WIB, 18.56 WIB, 21.27 WIB, 23.50 WIB\nBerangkat pukul 06.46 WIB, 08.10 WIB, 08.59 WIB, 10.05 WIB, 11.45 WIB, 13.12 WIB, 14.35 WIB, 16.36 WIB, 17.47 WIB, 19.02 WIB, 21.33 WIB, 23.56 WIB\nTiba pukul 06.51 WIB, 08.15 WIB, 09.04 WIB, 10.10 WIB, 11.50 WIB, 13.17 WIB, 14.40 WIB, 16.41 WIB, 17.52 WIB, 19.07 WIB, 21.38 WIB, 00.01 WIB\n Koran Solopos \n Berita Populer \n                                    Perusahaan :  PT. Aksara Solopos\r\n                                \n                                     Alamat:  Jl. Adisucipto 190 Solo\r\n                                \n                                     Email :  redaksi@solopos.co.id\r\n                                \n                                     Telp :  (+62) 0271 724 811\r\n                                \n                                    Jl. Adisucipto 190 Solo, Jawa Tengah\r\n                                \nDengan berlangganan, anda menyetujui Kebijakan Privasi Solopos.com', NULL, 1, NULL, '2024-03-01 02:24:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `online_post_analyze`
--

CREATE TABLE `online_post_analyze` (
  `id` int(11) NOT NULL,
  `positive` int(11) NOT NULL,
  `negative` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `online_post_analyze`
--

INSERT INTO `online_post_analyze` (`id`, `positive`, `negative`, `total`, `result`, `timestamp`) VALUES
(94, 19, 22, 2, '', '2024-02-19 12:43:58'),
(95, 19, 22, 2, '', '2024-02-19 12:47:47'),
(96, 19, 22, 2, '', '2024-02-19 12:50:13'),
(97, 19, 22, 2, '', '2024-02-19 12:50:25'),
(98, 19, 22, 2, '', '2024-02-19 12:51:25'),
(99, 19, 22, 2, '', '2024-02-19 12:52:54'),
(100, 19, 22, 2, '', '2024-02-19 13:05:39'),
(101, 56, 42, 3, '', '2024-02-19 13:06:27'),
(102, 56, 42, 3, '', '2024-02-19 13:18:54'),
(103, 56, 42, 3, '', '2024-02-19 14:15:07'),
(104, 15, 26, 2, '', '2024-02-19 14:33:30'),
(105, 6, 15, 1, '', '2024-02-20 00:43:38'),
(106, 20, 13, 3, '', '2024-02-20 02:16:24'),
(107, 18, 24, 2, '', '2024-02-20 03:41:35'),
(108, 18, 24, 2, '', '2024-02-20 03:46:22'),
(109, 18, 24, 2, '', '2024-02-20 03:48:04'),
(110, 76, 110, 2, '', '2024-02-20 07:06:15'),
(111, 76, 110, 2, '', '2024-02-20 07:07:55'),
(112, 18, 24, 2, '', '2024-02-20 13:46:02'),
(113, 15, 34, 2, '', '2024-02-20 13:47:45'),
(114, 12, 5, 4, '', '2024-02-21 02:19:20'),
(115, 23, 8, 4, '', '2024-02-21 02:25:18'),
(116, 23, 8, 4, '', '2024-02-21 02:30:52'),
(117, 23, 8, 4, '', '2024-02-21 02:33:49'),
(118, 23, 8, 4, '', '2024-02-21 02:35:08'),
(119, 35, 27, 3, '', '2024-02-21 03:10:51'),
(120, 47, 40, 3, '', '2024-02-22 18:26:10'),
(121, 23, 16, 3, '', '2024-02-23 00:33:26'),
(122, 20, 29, 2, '', '2024-02-29 23:00:41'),
(123, 43, 45, 2, '', '2024-03-01 02:10:32'),
(124, 21, 18, 3, '', '2024-03-01 02:24:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `online_post_images`
--

CREATE TABLE `online_post_images` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `serial_number` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `online_post_images`
--

INSERT INTO `online_post_images` (`id`, `post_id`, `name`, `serial_number`, `url`, `posting_date`, `updated_date`) VALUES
(47, 38, 'adhi.jpg', 1, 'postimages/adhi.jpg', '2024-02-19 14:15:07', NULL),
(48, 38, 'backButton.png', 2, 'postimages/backButton.png', '2024-02-19 14:15:07', NULL),
(49, 39, 'WIN_20240129_15_09_56_Pro.jpg', 1, 'postimages/WIN_20240129_15_09_56_Pro.jpg', '2024-02-19 14:33:30', NULL),
(50, 40, 'WIN_20240129_15_09_55_Pro.jpg', 1, 'postimages/WIN_20240129_15_09_55_Pro.jpg', '2024-02-20 00:43:38', NULL),
(51, 41, 'gibran-rakabuming-raka-saat-menghadiri-konser-rakyat.jpg', 1, 'postimages/gibran-rakabuming-raka-saat-menghadiri-konser-rakyat.jpg', '2024-02-20 02:16:24', NULL),
(52, 42, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 03:41:35', NULL),
(53, 43, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 03:46:22', NULL),
(54, 44, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 03:48:04', NULL),
(55, 45, 'Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', 1, 'postimages/Caleg-DPR-RI-Dapil-Jateng-IV-Rinto-Subekti.jpg', '2024-02-20 13:46:02', NULL),
(56, 46, 'Ilustrasi-korupsi-suap.jpg', 1, 'postimages/Ilustrasi-korupsi-suap.jpg', '2024-02-20 13:47:45', NULL),
(57, 47, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:19:20', NULL),
(58, 48, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:25:18', NULL),
(59, 49, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:30:52', NULL),
(60, 50, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:33:49', NULL),
(61, 51, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 02:35:08', NULL),
(62, 52, 'Resize_20230925_055603_3575.webp', 1, 'postimages/Resize_20230925_055603_3575.webp', '2024-02-21 03:10:51', NULL),
(63, 53, 'arpit-bansal-bird-4k_14.png', 1, 'postimages/arpit-bansal-bird-4k_14.png', '2024-02-22 18:26:10', NULL),
(64, 54, 'XJYfo7a6B7jaL3bN6FC6U_shopeepaylogoorangehorizontal.png', 1, 'postimages/XJYfo7a6B7jaL3bN6FC6U_shopeepaylogoorangehorizontal.png', '2024-02-23 00:33:26', NULL),
(65, 55, 'kra.jpg', 1, 'postimages/kra.jpg', '2024-02-29 23:00:41', NULL),
(66, 56, 'backButton.png', 1, 'postimages/backButton.png', '2024-03-01 02:10:32', NULL),
(67, 57, 'protection.png', 1, 'postimages/protection.png', '2024-03-01 02:24:36', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sources`
--

CREATE TABLE `sources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sources`
--

INSERT INTO `sources` (`id`, `name`, `description`, `active`, `posting_date`, `updated_date`) VALUES
(1, 'karanganyar.com', 'Berita tentang politik di Karanganyar', 1, '2024-02-20 14:19:55', NULL),
(2, 'solopos.com', 'Berita tentang Surakarta dan sekitarnya', 1, '2024-02-20 14:20:17', NULL),
(5, 'liputan6.com', 'Berita nasional', 1, '2024-02-21 03:15:39', NULL),
(6, 'cnnnews.com', 'berita dari cnn', 1, '2024-03-01 02:11:54', NULL),
(7, 'tribun.com', 'ini tribun', 0, '2024-03-01 02:21:21', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) DEFAULT NULL,
  `AdminPassword` varchar(255) DEFAULT NULL,
  `AdminEmailId` varchar(255) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 'phpgurukulofficial@gmail.com', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET latin1 DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(1, 'Pendidikan', 'Berita tentang pendidikan', '2024-02-01 02:51:31', '2024-02-01 03:51:44', 1),
(2, 'Pariwisata', 'Berita tentang pariwisata', '2024-02-01 02:52:09', NULL, 1),
(3, 'Kuliner', 'Berita tentang makanan', '2024-02-16 01:46:49', NULL, 1),
(4, 'Industri', 'berita mengenai industri di kabupaten karanganyar', '2024-02-17 04:34:36', '2024-02-17 04:54:49', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblposts_offline`
--

CREATE TABLE `tblposts_offline` (
  `id` int(11) NOT NULL,
  `id_analyze` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostAnalyze` varchar(255) NOT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL,
  `viewCounter` int(11) DEFAULT NULL,
  `postedBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `offline_posts`
--
ALTER TABLE `offline_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`,`analyze_id`),
  ADD KEY `analyze_id` (`analyze_id`);

--
-- Indeks untuk tabel `offline_post_analyze`
--
ALTER TABLE `offline_post_analyze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `offline_post_images`
--
ALTER TABLE `offline_post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indeks untuk tabel `online_posts`
--
ALTER TABLE `online_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`,`analyze_id`);

--
-- Indeks untuk tabel `online_post_analyze`
--
ALTER TABLE `online_post_analyze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `online_post_images`
--
ALTER TABLE `online_post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indeks untuk tabel `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminUserName` (`AdminUserName`);

--
-- Indeks untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tblposts_offline`
--
ALTER TABLE `tblposts_offline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postcatid` (`CategoryId`),
  ADD KEY `subadmin` (`postedBy`),
  ADD KEY `id_analyze` (`id_analyze`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `offline_posts`
--
ALTER TABLE `offline_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT untuk tabel `offline_post_analyze`
--
ALTER TABLE `offline_post_analyze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT untuk tabel `offline_post_images`
--
ALTER TABLE `offline_post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT untuk tabel `online_posts`
--
ALTER TABLE `online_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `online_post_analyze`
--
ALTER TABLE `online_post_analyze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT untuk tabel `online_post_images`
--
ALTER TABLE `online_post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT untuk tabel `sources`
--
ALTER TABLE `sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tblposts_offline`
--
ALTER TABLE `tblposts_offline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `offline_posts`
--
ALTER TABLE `offline_posts`
  ADD CONSTRAINT `offline_posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_posts_ibfk_2` FOREIGN KEY (`analyze_id`) REFERENCES `offline_post_analyze` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `offline_post_images`
--
ALTER TABLE `offline_post_images`
  ADD CONSTRAINT `offline_post_images_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `offline_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tblposts_offline`
--
ALTER TABLE `tblposts_offline`
  ADD CONSTRAINT `postcatid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subadmin` FOREIGN KEY (`postedBy`) REFERENCES `tbladmin` (`AdminUserName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tblposts_offline_ibfk_1` FOREIGN KEY (`id_analyze`) REFERENCES `offline_post_analyze` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
