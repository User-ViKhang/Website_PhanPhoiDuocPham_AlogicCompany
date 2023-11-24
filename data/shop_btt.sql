-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 22, 2023 at 11:28 AM
-- Server version: 5.7.25
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_btt`
--

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `tendanhmuc` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tendanhmuc`) VALUES
(5, 'Thuốc kê đơn'),
(6, 'Thuốc tiêm'),
(7, 'Thuốc gây mê , tê'),
(8, 'Thuốc kháng sinh'),
(10, 'Thực phẩm chức năng'),
(11, 'Dịch truyền'),
(12, 'Sản phầm y khoa');

-- --------------------------------------------------------

--
-- Table structure for table `diachi`
--

CREATE TABLE `diachi` (
  `id` int(11) NOT NULL,
  `nguoidung_id` int(11) NOT NULL,
  `diachi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `macdinh` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `nguoidung_id` int(11) NOT NULL,
  `diachi_id` int(11) DEFAULT NULL,
  `ngay` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tongtien` float NOT NULL DEFAULT '0',
  `ghichu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donhangct`
--

CREATE TABLE `donhangct` (
  `id` int(11) NOT NULL,
  `donhang_id` int(11) NOT NULL,
  `mathang_id` int(11) NOT NULL,
  `dongia` float NOT NULL DEFAULT '0',
  `soluong` int(11) NOT NULL DEFAULT '1',
  `thanhtien` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mathang`
--

CREATE TABLE `mathang` (
  `id` int(11) NOT NULL,
  `tenmathang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mota` text COLLATE utf8_unicode_ci,
  `giagoc` float NOT NULL DEFAULT '0',
  `giaban` float NOT NULL DEFAULT '0',
  `soluongton` int(11) NOT NULL DEFAULT '0',
  `hinhanh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `danhmuc_id` int(11) NOT NULL,
  `luotxem` int(11) NOT NULL DEFAULT '0',
  `luotmua` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mathang`
--

INSERT INTO `mathang` (`id`, `tenmathang`, `mota`, `giagoc`, `giaban`, `soluongton`, `hinhanh`, `danhmuc_id`, `luotxem`, `luotmua`) VALUES
(22, 'Ciprofloxacin', '500mg', 200000, 250000, 100, 'images\\products\\CIPROFLOXACIN_500mg', 8, 0, 0),
(23, 'Metronidazole', '500mg (Thuốc kháng khuẩn và kháng nấm)', 40000, 45000, 100, 'images\\products\\Metronidazole_500mg', 5, 0, 0),
(24, 'Tetanea', 'Huyết thanh kháng uốn ván. Tetanea hộp 20 ống 1ml', 772800, 800000, 100, 'images\\products\\Tetanea_1ml', 6, 0, 0),
(25, 'Hepavax Gene 0.5ml', 'Vắc xin ngừa Viêm gan siêu vi B. HEPAVAX-GENE 0.5ml', 145000, 160000, 150, 'images\\products\\Hepavax Gene 0.5ml', 6, 0, 0),
(26, 'Forane 100ml', 'Forane 100ml,tác dụng gây mê trước khi phẫu thuật.', 950000, 1000000, 12, 'images\\products\\Forane_100ml', 7, 0, 0),
(27, 'MVVac 5ml', 'MVVac (Lọ 5ml), vacxin-MVVac Sởi, Việt Nam', 315000, 378000, 50, 'images\\products\\vacxin-MVVac', 6, 0, 0),
(28, 'Paracetamol 500mg', 'Paracetamol 500mg (Hộp 10 vỉ x 10 viên) là thuốc giảm đau và hạ sốt cho người lớn', 64000, 70000, 200, 'images\\products\\Paracetamol_500mg', 5, 0, 0),
(29, 'Clopidogrel 75 mg', 'Clopidogrel 75Mg hộp 3 vỉ x 10 viên. là thuốc chống đông và làm tan huyết khối, ức chế kết tập tiểu cầu', 244200, 250000, 150, 'images\\products\\clopidogrel-75mg', 5, 0, 0),
(30, 'Nature’s Way Vitamin Tổng Hợp Complete Daily Multivitamin', 'Nature’s Way Vitamin Tổng Hợp Complete Daily Multivitamin 200 Viên\r\nTrẻ em từ 6 đến 12 tuổi: 1 viên/ngày\r\nNgười lớn và trẻ em trên 12 tuổi: 2 viên/ngày', 205000, 220000, 100, 'images\\products\\Nature’s Way Vitamin', 10, 0, 0),
(31, 'One A Day Men\'s Multivitamin 50+', 'One A Day Men\'s Multivitamin 50+ 300 viên/hộp', 720000, 740000, 50, 'images\\products\\One A Day Men\'s Multivitamin 50+', 10, 0, 0),
(34, 'Nakomin extra oral', 'Thực phẩm hỗ trợ giảm thoái hóa khớp An Huy Nakomin Extra (Hộp 60 viên). Thực phẩm hỗ trợ giảm thoái hóa khớp An Huy Nakomin Extra bổ sung các dưỡng chất cho khớp, mô sụn khớp; hỗ trợ làm giảm viêm khớp, khô khớp, thoái hóa khớp.', 269000, 280000, 200, 'images\\products\\Nakomin_extra_oral', 10, 0, 0),
(36, 'Aminosteril 10% ', 'Chai 250ml,Thành phần gồm Lysine, L-Cystine, L-Alanine, L-Arginine, L-Glutamine, L-Methionin, L-Tryptophan, L-Valin, L-Phenylalanine, L-Prolin, L-Serin, Glycin (Acid Aminoacetic), L-Leucine, Acid Aspartic, L-Tyrosine, L-Ornithine, L-Threonine, Histidine, L-Isoleucine,', 165000, 180000, 100, 'images\\products\\aminosteril-250ml', 11, 0, 0),
(37, 'Albiomin 20% 50ml', 'Hộp 1 lọ 50mL.  được chỉ định để điều trị mất albumin, giảm thể tích máu', 1500000, 1550000, 25, 'images\\products\\ALBIOMIN_20%_50ML', 6, 0, 0),
(38, 'Aminosteril 500mg', 'Hộp 100 viên , thuốc kháng sinh', 100000, 110000, 500, 'images\\products\\Amoxicillin_500mg', 8, 0, 0),
(40, 'Klacid', 'Cốm pha hỗn dịch uống Klacid 125mg/5ml điều trị nhiễm khuẩn đường hô hấp (60ml)', 180000, 190000, 250, 'images\\products\\Klacid', 8, 0, 0),
(41, 'Khẩu trang N95', 'Khẩu Trang N95 Promask Có Van Thở (Hộp 5 cái) cao cấp', 90000, 95000, 100, 'images\\products\\N95', 12, 0, 0),
(42, 'Khâu trang y tế', 'Hộp 50 cái khâu trang 4 lớp', 15000, 20000, 300, 'images\\products\\Khautrangyte', 12, 0, 0),
(43, 'Panadol Extra', 'Panadol Extra 1 hộp(15 vỉ x 12 viên).\r\nParacetamol 500mg, Caffeine 65mg\r\n\r\nCông dụng: Giúp giảm triệu chứng đau, hạ sốt.\r\n\r\nĐối tượng sử dụng: Trẻ em 12 tuổi trở lên và người lớn.\r\n\r\nHình thức: Viên nén\r\n\r\nThương hiệu: Sanofi (Việt Nam)', 230000, 235000, 100, 'images\\products\\Panadol_Extra', 5, 0, 0),
(46, 'Lidocain', 'Gel Lidocain 10% Egis gây tê tại chỗ niêm mạc (38g)', 22000, 250000, 50, 'images\\products\\Lidocain', 7, 0, 0),
(47, 'Procaine hydrochloride', 'Procaine hydrochloride 60ml.Gây tê tiêm thấm và gây tê vùng, gây tê tủy sống, phong bế dây thần kinh giao cảm hoặc dây thần kinh ngoại biên để làm giảm đau trong một số trường hợp.', 800000, 850000, 50, 'images\\products\\Procaine_hydrochloride', 7, 0, 0),
(48, 'Bupivacaine Aguettant', 'Bupivacaine Aguettant 5mg/ml', 690000, 700000, 50, 'images\\products\\Bupivacaine_Aguettant', 7, 0, 0),
(49, 'Procaine hydrochloride', 'Procaine hydrochloride 60ml.Gây tê tiêm thấm và gây tê vùng, gây tê tủy sống, phong bế dây thần kinh giao cảm hoặc dây thần kinh ngoại biên để làm giảm đau trong một số trường hợp.', 800000, 850000, 50, 'images\\products\\Procaine_hydrochloride', 7, 0, 0),
(50, 'Abdala 50ml', 'Vaccine COVID-19 Abdala được sản xuất bởi công ty AICA Laboraries, Base Business Unit (BBU) AICA của Cuba.', 200000, 250000, 150, 'images\\products\\Abdala', 6, 0, 0),
(51, 'Typhim VI', 'Typhim VI 0,5ml.Vắc xin ngừa Thương Hàn', 150000, 175000, 50, 'images\\products\\Typhim_VI', 6, 0, 0),
(52, 'JEV', 'JEV 0.5ml, Vắc xin ngừa Viêm não nhật bản B', 60000, 75000, 30, 'images\\products\\JEV', 6, 0, 0),
(53, 'Vaxigrip (0,25ml)', 'Vaxigrip (0,25ml), Vắc xin ngừa Cúm', 60000, 70000, 60, 'images\\products\\VAXIGRIP', 6, 0, 0),
(54, 'Chloramphenicol 250mg', 'Thuốc Cloramphenicol 250mg Nghệ An Pharma điều trị nhiễm khuẩn (100 viên)', 110000, 120000, 50, 'images\\products\\Chloramphenicol', 8, 0, 0),
(55, 'Clarithromycin ', 'Thuốc Clarithromycin 500mg Tipharco điều trị nhiễm trùng đường hô hấp (10 viên)', 114000, 120000, 50, 'images\\products\\Clarithromycin', 8, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sodienthoai` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loai` tinyint(4) NOT NULL DEFAULT '3',
  `trangthai` tinyint(4) NOT NULL DEFAULT '1',
  `hinhanh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diachi`
--
ALTER TABLE `diachi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nguoidung_id` (`nguoidung_id`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nguoidung_id` (`nguoidung_id`),
  ADD KEY `diachi_id` (`diachi_id`);

--
-- Indexes for table `donhangct`
--
ALTER TABLE `donhangct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donhang_id` (`donhang_id`),
  ADD KEY `mathang_id` (`mathang_id`);

--
-- Indexes for table `mathang`
--
ALTER TABLE `mathang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `danhmuc_id` (`danhmuc_id`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `diachi`
--
ALTER TABLE `diachi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donhangct`
--
ALTER TABLE `donhangct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mathang`
--
ALTER TABLE `mathang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diachi`
--
ALTER TABLE `diachi`
  ADD CONSTRAINT `diachi_ibfk_1` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `donhangct`
--
ALTER TABLE `donhangct`
  ADD CONSTRAINT `donhangct_ibfk_1` FOREIGN KEY (`donhang_id`) REFERENCES `donhang` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `donhangct_ibfk_2` FOREIGN KEY (`mathang_id`) REFERENCES `mathang` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `mathang`
--
ALTER TABLE `mathang`
  ADD CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`danhmuc_id`) REFERENCES `danhmuc` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
