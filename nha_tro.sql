-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 04, 2024 lúc 04:00 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nha_tro`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id_cmt` int(11) NOT NULL,
  `id_tro` int(11) NOT NULL,
  `id_kh` int(11) NOT NULL,
  `noidung` varchar(255) DEFAULT NULL,
  `danhgia` int(2) NOT NULL,
  `is_update` int(2) DEFAULT 0,
  `ngayviet` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group`
--

CREATE TABLE `group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(70) NOT NULL COMMENT 'Vai trò'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `group`
--

INSERT INTO `group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Chủ trọ'),
(4, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `hoadon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tongtien` varchar(45) NOT NULL,
  `nhatro_id` int(11) NOT NULL,
  `trangthai` int(2) NOT NULL DEFAULT 0,
  `ngay_lap` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`hoadon_id`, `user_id`, `tongtien`, `nhatro_id`, `trangthai`, `ngay_lap`) VALUES
(1, 1, '6000000', 1, 0, '2024-07-04'),
(2, 4, '4500000', 5, 0, '2024-07-04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL COMMENT 'Họ và tên',
  `birthday` date DEFAULT NULL COMMENT 'Ngày/tháng/năm',
  `address` varchar(255) NOT NULL COMMENT 'Địa chỉ',
  `phone_number` varchar(20) NOT NULL COMMENT 'Số điện thoại',
  `gender` tinyint(1) NOT NULL COMMENT 'Giới tính'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `information`
--

INSERT INTO `information` (`id`, `user_id`, `full_name`, `birthday`, `address`, `phone_number`, `gender`) VALUES
(1, 1, 'Ngô Chí Hải', NULL, 'An Khánh, Ninh Kiều Cần Thơ', '0794366638', 0),
(2, 2, 'Lâm Hoàng Em', NULL, 'An Khánh, Ninh Kiều Cần Thơ', '', 0),
(3, 4, 'Thanh Huy', NULL, 'An Khánh, Ninh Kiều Cần Thơ', '', 0),
(4, 5, 'Thanh Hoài', NULL, 'An Khánh, Ninh Kiều Cần Thơ', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_nhatro`
--

CREATE TABLE `loai_nhatro` (
  `Loai_nhatro` varchar(50) NOT NULL,
  `Ten_nhatro` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_nhatro`
--

INSERT INTO `loai_nhatro` (`Loai_nhatro`, `Ten_nhatro`) VALUES
('CHDV', 'Căn hộ dịch vụ'),
('KTX', 'Ký túc xá'),
('NTCC', 'Nhà trọ cao cấp'),
('NTCN', 'Nhà trọ công nhân'),
('NTDH', 'Nhà trọ dài hạn'),
('NTGD', 'Nhà trọ gia đình'),
('NTNH', 'Nhà trọ ngắn hạn'),
('NTSV', 'Nhà trọ sinh viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhatro`
--

CREATE TABLE `nhatro` (
  `ma_tro` int(11) NOT NULL,
  `Ten` varchar(255) NOT NULL,
  `Diachi` varchar(255) NOT NULL,
  `thanhpho` int(11) DEFAULT NULL,
  `huyen` int(11) DEFAULT NULL,
  `phuong` int(11) DEFAULT NULL,
  `mieuta` varchar(250) DEFAULT NULL,
  `chu_id` int(11) DEFAULT NULL,
  `gia` float DEFAULT NULL,
  `sophongngu` int(11) DEFAULT NULL,
  `sophongtam` int(11) DEFAULT NULL,
  `dientich` int(4) DEFAULT NULL,
  `Loai_nhatro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhatro`
--

INSERT INTO `nhatro` (`ma_tro`, `Ten`, `Diachi`, `thanhpho`, `huyen`, `phuong`, `mieuta`, `chu_id`, `gia`, `sophongngu`, `sophongtam`, `dientich`, `Loai_nhatro`) VALUES
(1, 'Căn Hộ Dịch Vụ ngay Ngã Tư Hàng Xanh, Quận Bình Thạnh - Full Nội Thất', ' Đ. Xô Viết Nghệ Tĩnh', 2, 228, 410, 'Đầy đủ tiện nghi tủ lạnh, máy lạnh, nội thất cao cấp hiện đại.', 4, 6000000, 2, 1, 40, 'NTSV'),
(2, 'CHO THUÊ PHÒNG TRỌ GIÁ RẺ (GẦN ĐẦM SEN)', '110/46/7, Đ. Tô Hiệu', 2, 230, 435, '﻿﻿Tiện ích trong phòng: Máy lạnh, tủ lạnh, toilet trong phòng, cửa sổ ban c', 2, 3000000, 1, 1, 25, 'NTSV'),
(3, 'Cho thuê phòng trọ mới sửa 7/2023 Đường Lương Thế Vinh, Phường Tân Thới Hòa, Quận Tân Phú (gần Đầm Sen)', '48/13, Đ. Lương Thế Vinh', 2, 230, 436, 'Giá Phòng từ 1800k. Đang còn phòng 1800K đến xem đảm bảo ưng ý, cam kết hình đúng với thực tế.\r\nPhòng mới sửa chữa 7/2023, địa chỉ 48/13 Lương Thế Vin', 5, 1800000, 1, 1, 30, 'NTSV'),
(4, 'PHÒNG TRỌ ĐỐI DIỆN KS 5 SAO TÂN SƠN NHẤT MỚI XÂY RẤT ĐẸP - GẦN CÔNG VIÊN HOÀNG VĂN THỤ', '205/10A-B, Đ. Hoàng Văn Thụ', 2, 229, 418, ' Phòng đẹp nằm ngay trung tâm quận Phú Nhuận (xem hình thật). View trước là đối diện Khách Sạn 3* Tân Sơn Nhất, View sau là đường Nguyễn Văn Trỗi.\r\nĐầ', 1, 3700000, 2, 1, 50, 'NTSV'),
(5, 'Chính chủ cho thuê căn hộ mini cao cấp tại Ninh Kiều, Cần Thơ', 'Nhà 46A, Đ. Cao Thắng', 1, 201, 109, 'Đầy đủ tiện nghi tủ lạnh, máy lạnh.\r\nVị trí đắc địa ở Nhà 46A Đường Cao Thắng đi bộ ra chợ, bến xe buýt, cách Ga tàu tr\r\n', 4, 4500000, 2, 1, 60, 'NTCC'),
(6, 'NHÀ TRỌ AN NINH, GIÁ SINH VIÊN', '557/31A Trần Quang Diệu, Phường An Thới, Quận Bình Thuỷ, Cần Thơ', 1, 204, 109, 'Phòng gạch ốp hết tường, trần la phong, tầng trệt & gác lửng có cửa sổ. Rộng rãi, thoáng mát, sạch sẽ.\r\n\r\n- Có tủ bếp, kệ chén, quạt treo tường tầng t', 4, 4500000, 2, 1, 60, 'NTCC'),
(7, 'Nhà trọ đẹp có nội thất, hẻm 112 đường 3/2, Hưng Lợi, Ninh Kiều (gần trường Đại Học Cần Thơ)', '3/2, Phường Hưng Lợi, Quận Ninh Kiều, Cần Thơ', 1, 201, 109, 'CHO THUÊ PHÒNG TRỌ CAO CẤP, KIỂU MINI HOUSE, ĐẦY ĐỦ NỘI THẤT\r\n\r\nGIÁ: 3 Triệu/ Căn\r\n\r\n- Diện tích: 28m2\r\n\r\n- Mổi căn trệt lững, rộng rải thoáng mát, trần thạch cao, gạch dán full phòng rất sạch sẻ..tủ bếp, cửa phòng gổ tự nhiên...', 4, 3000000, 2, 1, 28, 'NTCC'),
(8, 'Cho thuê phòng trọ dài hạn cho sinh viên', '273 Nguyễn Văn Linh, Phường Long Tuyền, Quận Bình Thuỷ, Cần Thơ', 1, 204, 109, 'CHO THUÊ PHÒNG TRỌ CAO CẤP, KIỂU MINI HOUSE, ĐẦY ĐỦ NỘI THẤT\r\n\r\nGIÁ: 3 Triệu/ Căn\r\n\r\n- Diện tích: 28m2\r\n\r\n- Mổi căn trệt lững, rộng rải thoáng mát, trần thạch cao, gạch dán full phòng rất sạch sẻ..tủ bếp, cửa phòng gổ tự nhiên...', 4, 2500000, 2, 1, 35, 'NTSV'),
(9, 'Cho thuê phòng trọ mới xây, 2tr/tháng, tại KDC Bình Nhựt', ' KDC Bình Nhựt Võ Văn Kiệt, Quận Bình Thuỷ, Cần Thơ', 1, 204, 109, 'Giá 2.000.000/ tháng, cọc 1, HĐ dài lâu\r\n\r\nĐịa chỉ: KDC Bình Nhựt,\r\n\r\nDT: 30m2, gác rộng\r\n\r\nĐiện nước tính giá nhà nước\r\n\r\nLH 0935 854 052', 5, 2500000, 2, 1, 30, 'NTCN'),
(10, 'Cho thuê nhà 60m2, giá 1 triệu 2, nhà cấp 4', 'Phường Hưng Thạnh, Quận Cái Răng, Cần Thơ', 1, 203, 109, 'Nhà trọ Hưng Thạnh 60m2, 30m2 1tr200 gần cầu xẻo chàm Hưng Thạnh Cái Răng TP Cần Thơ\r\n\r\nGiá: 1tr200 1 tháng\r\n\r\nVừa xây dựng xong hiện trống 4 phòng\r\n\r\nDiện tích: 60m², 30m²\r\n\r\nThời gian đi lại tự do', 5, 2500000, 2, 1, 60, 'NTCN'),
(11, 'Phòng trọ giá rẻ quận ninh kiều, cần thơ', '152j7/16 khu vực 1 Đường Nguyễn Văn Cừ, Phường An Khánh, Quận Ninh Kiều, Cần Thơ', 1, 201, 109, 'Dãy phòng trọ của mình còn một phòng trống do bạn sinh viên y dược mới trả, đã được sơn sửa lại mới. Khu trọ nằm trong hẻm liên tổ 14-20 dưới chân cầu rạch ngỗng( đường nguyễn văn cừ), cách đường 50m. Phòng thoáng mát, có gác đúc, kệ bếp, nhà vệ sinh', 5, 2500000, 1, 1, 14, 'NTCN'),
(12, 'CHO THUÊ PHÒNG TRỌ DÀNH CHO SINH VIÊN', 'Lộ Ngân Hàng , ngang cafe Hapy 3 , Đường Nguyễn Văn Cừ, Phường An Khánh, Quận Ninh Kiều, Cần Thơ', 1, 201, 109, 'Nhà trọ dành cho sinh viên giá ưu đãi :1.500k/tháng/Phòng đôi\r\n\r\nPhòng đôi như hộ gia đình gồm 2 phòng riêng biệt :\r\n\r\n*Phòng bếp + nhà vệ sinh tiện nghi rộng rãi 14m2', 5, 1500000, 1, 1, 14, 'NTSV'),
(13, 'Cho Thuê Phòng Trọ 22m Giá Rẻ TT TP. Cần Thơ', '83 Đường Trần Việt Châu, Phường An Hòa, Quận Ninh Kiều, Cần Thơ', 1, 201, 109, 'Cho thuê phòng trọ 22m2 trần cao 4m cửa sổ rộng 4m2 thông thoáng giá chỉ 1,6 triệu, nước 100k/ người, điện 3500₫/kw.\r\n\r\nMiễn phí máy giặc, máy tắm nước nóng, wifi, rác , sử dụng bếp đều miễn phí.\r\n\r\nVị trí phòng tầng trệt nằm gần cuối nhà mặt tiền rộ', 5, 1500000, 1, 1, 22, 'NTCC'),
(14, 'Phòng trọ mới xây , sạch sẽ . An ninh tốt , quận ninh kiều', '1 18, Phường An Khánh, Quận Ninh Kiều, Cần Thơ', 1, 201, 109, 'Phòng cho thuê , an ninh tốt , gần trường đại học y dược Cần thơ. Phường An Khánh quận Ninh kiều . Cho thuê lâu dài , phòng mới xây , có máy lạnh , ban công thoáng\r\n\r\n1 phòng trung giá 1 triệu 8 .\r\n\r\n1 phòng gác nhỏ giá: 1,1 triệu . Chính chủ cho thu', 5, 1800000, 1, 1, 22, 'NTCC'),
(15, 'CHO THUÊ PHÒNG ĐẦY ĐỦ TIỆN NGHI NGẮN HẠN & DÀI HẠN - Đường Võ Nguyên Giáp, Cái Răng, Cần Thơ', 'nhà nghỉ quê hương Đường số 9, Phường Phú Thứ, Quận Cái Răng, Cần Thơ', 1, 201, 109, 'Với diện tích khoảng 40m2- (2 giường/4 người/phòng) .Có chỗ dậu xe oto, KV An Ninh, gần chợ siêu thị, mất 10phút về trung tâm Ninh Kiều\r\n\r\n- Tiện nghi trang bị sẵn như: tivi, tủ lạnh mini, máy lạnh, máy nước nóng, tủ quần áo, bàn ngồi thư giãn, wifi.', 5, 5000000, 1, 1, 40, 'NTGD'),
(16, 'Phòng trọ giá rẻ, 1tr1/tháng, ngay khu Yên Hòa, Cái Răng', ' 33/4 Nguyễn Việt Dũng, Phường Lê Bình, Quận Cái Răng, Cần Thơ', 1, 201, 109, 'Đang trống 2 phòng giá thuê 1tr1/tháng tại 33/4 Yên Hoà, Đường Nguyễn Việt Dũng, phường Lê Bình, quận Cái Răng\r\n\r\nLiên hệ: 0907223760\r\n\r\nCửa Hàng Sơn Thịnh Phát - Trọ Thịnh Phát', 5, 1100000, 1, 1, 15, 'NTGD'),
(17, 'Nhà trọ mới xây, mát mẻ, sạch sẽ 1tr6 giảm còn 1tr4, 16m2 đường Trương Vĩnh Nguyên, Cái Răng', 'Quận Cái Răng, Cần Thơ', 1, 201, 109, 'Đang trống 2 phòng giá thuê 1tr1/tháng tại 33/4 Yên Hoà, Đường Nguyễn Việt Dũng, phường Lê Bình, quận Cái Răng\r\n\r\nLiên hệ: 0907223760\r\n\r\nCửa Hàng Sơn Thịnh Phát - Trọ Thịnh Phát', 5, 1400000, 1, 1, 15, 'NTCN'),
(18, 'Phòng trọ 1tr2, mới xây, sạch sẽ đường Xóm Chài, Hưng Phú, Cái Răng, Cần Thơ', 'Phường Hưng Phú, Quận Cái Răng, Cần Thơ', 1, 203, 203, 'Giá thuê 1.200.000/ tháng. Địa chỉ Xóm Chài, Hưng Phú 1\r\n\r\nDT: 24m2\r\n\r\nĐiện 4.000, nước 12.000\r\n\r\nĐường ô tô', 5, 1200000, 1, 1, 15, 'NTCN'),
(19, 'Cho thuê nhà trọ gia đình ở hoặc buôn bán', ' 9G/4-9H/4 4, Phường Hưng Thạnh, Quận Cái Răng, Cần Thơ', 1, 203, 203, 'Phòng trọ sạch sẽ thoáng mát yên tĩnh nằm sau khu dân cư nam long gần đường lớn có trường học chợ hàng quán, công viên, wifi free, phòng phù hợp ở hoạc buôn bán có 1 trệt 1 lửng (cọc trc 2 tháng)', 5, 2500000, 1, 1, 15, 'NTCN'),
(20, 'Cho thuê nhà trọ gia đình ở hoặc buôn bán', '9G/4-9H/4 4, Phường Hưng Thạnh, Quận Cái Răng, Cần Thơ', 1, 203, 203, 'Phòng trọ sạch sẽ thoáng mát yên tĩnh nằm sau khu dân cư nam long gần đường lớn có trường học chợ hàng quán, công viên, wifi free, phòng phù hợp ở hoạc buôn bán có 1 trệt 1 lửng (cọc trc 2 tháng)', 5, 2500000, 1, 1, 15, 'NTCN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhatro_anh`
--

CREATE TABLE `nhatro_anh` (
  `ma_anh` int(11) NOT NULL,
  `ma_tro` int(11) NOT NULL,
  `image_url_1` varchar(255) DEFAULT NULL,
  `image_url_2` varchar(255) DEFAULT NULL,
  `image_url_3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhatro_anh`
--

INSERT INTO `nhatro_anh` (`ma_anh`, `ma_tro`, `image_url_1`, `image_url_2`, `image_url_3`) VALUES
(1, 1, 'uploads/Tro1-h1.png', 'uploads/Tro1-h2.png', 'uploads/Tro1-h3.png'),
(2, 2, 'uploads/Tro2-h1.png', 'uploads/Tro2-h2.png', 'uploads/Tro2-h3.png'),
(3, 3, 'uploads/Tro3-h1.png', 'uploads/Tro3-h2.png', 'uploads/Tro3-h3.png'),
(5, 4, 'uploads/Tro4-h1.png', 'uploads/Tro4-h2.png', 'uploads/Tro4-h3.png'),
(6, 5, 'uploads/Tro5-h1.png', 'uploads/Tro5-h2.png', 'uploads/Tro5-h3.png'),
(7, 6, 'uploads/Tro6-h1.png', 'uploads/Tro6-h2.png', 'uploads/Tro6-h3.png'),
(8, 7, 'uploads/Tro7-h1.png', 'uploads/Tro7-h2.png', 'uploads/Tro7-h3.png'),
(9, 8, 'uploads/Tro8-h1.png', 'uploads/Tro8-h2.png', 'uploads/Tro8-h3.png'),
(10, 9, 'uploads/Tro9-h1.png', 'uploads/Tro9-h2.png', 'uploads/Tro9-h3.png'),
(11, 10, 'uploads/Tro10-h1.png', 'uploads/Tro10-h2.png', 'uploads/Tro10-h3.png'),
(12, 11, 'uploads/Tro11-h1.png', 'uploads/Tro11-h2.png', 'uploads/Tro11-h3.png'),
(13, 12, 'uploads/Tro12-h1.png', 'uploads/Tro12-h2.png', 'uploads/Tro12-h3.png'),
(14, 13, 'uploads/Tro13-h1.png', 'uploads/Tro13-h2.png', 'uploads/Tro13-h3.png'),
(15, 14, 'uploads/Tro14-h1.png', 'uploads/Tro14-h2.png', 'uploads/Tro14-h3.png'),
(16, 15, 'uploads/Tro15-h1.png', 'uploads/Tro15-h2.png', 'uploads/Tro15-h3.png'),
(17, 16, 'uploads/Tro16-h1.png', 'uploads/Tro16-h2.png', 'uploads/Tro16-h3.png'),
(18, 17, 'uploads/Tro17-h1.png', 'uploads/Tro17-h2.png', 'uploads/Tro17-h3.png'),
(19, 18, 'uploads/Tro18-h1.png', 'uploads/Tro18-h2.png', 'uploads/Tro18-h3.png'),
(20, 19, 'uploads/Tro19-h1.png', 'uploads/Tro19-h2.png', 'uploads/Tro19-h3.png'),
(21, 20, 'uploads/Tro20-h1.png', 'uploads/Tro20-h2.png', 'uploads/Tro20-h3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuong`
--

CREATE TABLE `phuong` (
  `phuong_id` int(11) NOT NULL,
  `qh_id` int(11) NOT NULL,
  `p_ten` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `phuong`
--

INSERT INTO `phuong` (`phuong_id`, `qh_id`, `p_ten`) VALUES
(101, 201, 'Cai Khe'),
(102, 201, 'An Hoa'),
(103, 201, 'Thoi Binh'),
(104, 201, 'An Nghiep'),
(105, 201, 'An Cu'),
(106, 201, 'An Hoi'),
(107, 201, 'Tan An'),
(108, 201, 'An Lac'),
(109, 201, 'An Phu'),
(110, 201, 'Xuan Khanh'),
(111, 201, 'Hung Loi'),
(112, 201, 'An Binh'),
(113, 202, 'Thot Not'),
(114, 202, 'Thoi Thuan'),
(115, 202, 'Thuan An'),
(116, 202, 'Trung Nhut'),
(117, 202, 'Thanh Hoa'),
(118, 202, 'Trung Kien'),
(119, 202, 'Thuan Hung'),
(120, 202, 'Tan Hung'),
(121, 202, 'Tan Loc'),
(122, 203, 'Ba Lang'),
(123, 203, 'Hung Phu'),
(124, 203, 'Hung Thanh'),
(125, 203, 'Le Binh'),
(126, 203, 'Phu Thu'),
(127, 203, 'Tan Phu'),
(128, 203, 'Thuong Thanh'),
(129, 204, 'Tra Noc'),
(130, 204, 'Tra An'),
(131, 204, 'An Thoi'),
(132, 204, 'Bui Huu NGhia'),
(133, 204, 'Thoi An Dong'),
(134, 204, 'Binh Thuy'),
(135, 204, 'Long Tuyen'),
(136, 204, 'Long Hoa'),
(137, 205, 'Dong Hiep'),
(138, 205, 'Dong Thang'),
(139, 205, 'Thanh Phu'),
(140, 205, 'Thoi Dong'),
(141, 205, 'Thoi Hung'),
(142, 205, 'Thoi Xuan'),
(143, 205, 'Trung An'),
(144, 205, 'Trung Hung'),
(145, 205, 'Trung Thanh'),
(146, 206, 'Ben Nghe'),
(147, 206, 'Co Giang'),
(148, 206, 'Ben Thanh'),
(149, 206, 'Cau Kho'),
(150, 206, 'Da Kao'),
(151, 206, 'Cau Ong Lanh'),
(152, 206, 'Nguyen Thai Binh'),
(153, 206, 'Nguyen Cu Trinh'),
(154, 206, 'Pham Ngu Lao'),
(155, 206, 'Tan Dinh'),
(156, 207, 'An Khanh'),
(157, 207, 'An Loi Dong'),
(158, 207, 'An Phu'),
(159, 207, 'Binh An'),
(160, 207, 'Binh Khanh'),
(161, 207, 'Binh Trung Dong'),
(162, 207, 'Binh Trung Tay'),
(163, 207, 'Cat Lai'),
(164, 207, 'Thanh My Loi'),
(165, 207, 'Thao Dien'),
(166, 207, 'Thu Thiem'),
(167, 208, 'Phuong 1'),
(168, 208, 'Phuong 2'),
(169, 208, 'Phuong 3'),
(170, 208, 'Phuong 4'),
(171, 208, 'Phuong 5'),
(172, 208, 'Phuong 9'),
(173, 208, 'Phuong 10'),
(174, 208, 'Phuong 11'),
(175, 208, 'Phuong 12'),
(176, 208, 'Phuong 13'),
(177, 208, 'Phuong 14'),
(178, 208, 'Vo Thi Sau'),
(179, 209, 'Phuong 1'),
(180, 209, 'Phuong 2'),
(181, 209, 'Phuong 3'),
(182, 209, 'Phuong 4'),
(183, 209, 'Phuong 5'),
(184, 209, 'Phuong 6'),
(185, 209, 'Phuong 7'),
(186, 209, 'Phuong 8'),
(187, 209, 'Phuong 9'),
(188, 209, 'Phuong 10'),
(189, 209, 'Phuong 11'),
(190, 209, 'Phuong 12'),
(191, 209, 'Phuong 13'),
(192, 209, 'Phuong 14'),
(193, 210, 'Phuong 1'),
(194, 210, 'Phuong 2'),
(195, 210, 'Phuong 3'),
(196, 210, 'Phuong 4'),
(197, 210, 'Phuong 5'),
(198, 210, 'Phuong 6'),
(199, 210, 'Phuong 7'),
(200, 210, 'Phuong 8'),
(201, 210, 'Phuong 9'),
(202, 210, 'Phuong 10'),
(203, 210, 'Phuong 11'),
(204, 210, 'Phuong 12'),
(205, 210, 'Phuong 13'),
(206, 210, 'Phuong 14'),
(207, 210, 'Phuong 15'),
(208, 210, 'Phuong 16'),
(210, 212, 'U Minh'),
(211, 212, 'Khanh An'),
(212, 212, 'Khanh Lam'),
(213, 212, 'Nguyen Phich'),
(214, 212, 'Khanh Hoi'),
(215, 212, 'Khanh Tien'),
(216, 212, 'Khanh Hoa'),
(217, 212, 'Khanh Thuan'),
(218, 213, 'Thi Tran Nam Can'),
(219, 213, 'Ham Rong'),
(220, 213, 'Hiep Tung'),
(221, 213, 'Dat Moi'),
(222, 213, 'Lam Hai'),
(223, 213, 'Hang Vinh'),
(224, 213, 'Tam Giang'),
(225, 213, 'Tam Giang Dong'),
(226, 214, 'Phuong 1'),
(227, 214, 'Phuong 2'),
(228, 214, 'Phuong 4'),
(229, 214, 'Phuong 5'),
(230, 214, 'Phuong 6'),
(231, 214, 'Phuong 7'),
(232, 214, 'Phuong 8'),
(233, 214, 'Phuong 9'),
(234, 214, 'Tan Thanh'),
(235, 214, 'Tan Xuyen'),
(236, 214, 'An Xuyen'),
(237, 214, 'Tan Thanh'),
(238, 214, 'Tac Van'),
(239, 214, 'Dinh Binh'),
(240, 214, 'Hoa Thanh'),
(241, 214, 'Ly Van Lam'),
(242, 214, 'Hoa Tan'),
(243, 211, 'Phuong 1'),
(244, 211, 'Phuong 2'),
(245, 211, 'Phuong 3'),
(246, 211, 'Phuong 4'),
(247, 211, 'Phuong 5'),
(248, 211, 'Phuong 6'),
(249, 211, 'Phuong 7'),
(250, 211, 'Phuong 8'),
(251, 211, 'Phuong 9'),
(252, 211, 'Phuong 10'),
(253, 211, 'Phuong 11'),
(254, 211, 'Phuong 12'),
(255, 211, 'Phuong 13'),
(256, 211, 'Quan 14'),
(257, 211, 'Quan 15'),
(258, 211, 'Quan 16'),
(259, 215, 'Ngoc Chanh'),
(260, 215, 'Nguyen Huan'),
(261, 215, 'Quach Pham'),
(262, 215, 'Quach Pham Bac'),
(263, 215, 'Ta An Khuong'),
(264, 215, 'Ta An Khuong Dong'),
(265, 215, 'Ta An Khuong Nam'),
(266, 215, 'Tan Dan'),
(267, 215, 'Tan Duyet'),
(268, 215, 'Tan Duc'),
(269, 215, 'Tan Thuan'),
(270, 215, 'Tan Tien'),
(271, 215, 'Tan Trung'),
(272, 215, 'Thanh Tung'),
(273, 215, 'Tran Phan'),
(274, 216, 'Luong The Tran'),
(275, 216, 'Thanh Phu'),
(276, 216, 'Phu Hung'),
(277, 216, 'Hung My'),
(278, 216, 'Tan Hung'),
(279, 216, 'Hoa My'),
(280, 216, 'Tan Hung Dong'),
(281, 216, 'Dong Thoi'),
(282, 216, 'Dong Hung'),
(283, 216, 'Tran Thoi'),
(284, 217, 'Hieu Nghia'),
(285, 217, 'Hieu Nhon'),
(286, 217, 'Hieu Phung'),
(287, 217, 'Hieu Thanh'),
(288, 217, 'Hieu Thuan'),
(289, 217, 'Quoi An'),
(290, 217, 'Quoi Thien'),
(291, 217, 'Tan An Luong'),
(292, 217, 'Tan Quoi Trung'),
(293, 217, 'Thanh Binh'),
(294, 217, 'Trung An'),
(295, 217, 'Trung Chanh'),
(296, 217, 'Trung Hiep'),
(297, 217, 'Trung Hieu'),
(298, 217, 'Trung Ngai'),
(299, 217, 'Trung Nghia'),
(300, 217, 'Trung Thanh'),
(301, 217, 'Trung Thanh Dong'),
(302, 217, 'Trung Thanh Tay'),
(303, 218, 'An Binh'),
(304, 218, 'Binh Hoa Phuoc'),
(305, 218, 'Dong Phu'),
(306, 218, 'Hoa Ninh'),
(307, 218, 'Hoa Phu'),
(308, 218, 'Loc Hoa'),
(309, 218, 'Long An'),
(310, 218, 'Long Phuoc'),
(311, 218, 'Phu Duc'),
(312, 218, 'Phuoc Hau'),
(313, 218, 'Tan Hanh'),
(314, 218, 'Thanh Duc'),
(315, 218, 'Thanh Quoi'),
(316, 218, 'Phu Quoi'),
(317, 219, 'Luc Si Thanh'),
(318, 219, 'Phu Thanh'),
(319, 219, 'Thien My'),
(320, 219, 'Tan My'),
(321, 219, 'Tra Con'),
(322, 219, 'Xuan Hiep'),
(323, 219, 'Hoa Binh'),
(324, 219, 'Nhon Binh'),
(325, 219, 'Thoi Hoa'),
(326, 219, 'Huu Thanh'),
(327, 219, 'Thuan Thoi'),
(328, 219, 'Vinh Xuan'),
(329, 219, 'Tich Thien'),
(330, 219, 'Thi Tran Tra On'),
(331, 220, 'Phuong 1'),
(332, 220, 'Phuong 2'),
(333, 220, 'Phuong 3'),
(334, 220, 'Phuong 4'),
(335, 220, 'Phuong 5'),
(336, 220, 'Phuong 8'),
(337, 220, 'Phuong 9'),
(338, 220, 'Tan Hoa'),
(339, 220, 'Tan Hoi'),
(340, 220, 'Tan Ngai'),
(341, 220, 'Truong An'),
(342, 221, 'Cai Von'),
(343, 221, 'Thanh Phuoc'),
(344, 221, 'Dong Thuan'),
(345, 221, 'Thuan An'),
(346, 221, 'Dong Thanh'),
(347, 221, 'Dong Binh'),
(348, 221, 'My Hoa'),
(349, 221, 'Dong Thanh'),
(350, 222, 'Phuong 1'),
(351, 222, 'Phuong 2'),
(352, 222, 'BLao'),
(353, 222, 'Loc Phat'),
(354, 222, 'Loc Son'),
(355, 222, 'Loc Tien'),
(356, 222, 'Dai Lao'),
(357, 222, 'DamBri'),
(358, 222, 'Loc Chau'),
(359, 222, 'Loc Nga'),
(360, 222, 'Loc Thanh'),
(361, 223, 'Da Ploa'),
(362, 223, 'Tà Nung'),
(363, 223, 'Trạm Hành'),
(364, 223, 'Xuân Thọ'),
(365, 223, 'Xuân Trường'),
(366, 223, 'Phường 1'),
(367, 223, 'Phường 2'),
(368, 224, 'BLa'),
(369, 224, 'Loc An'),
(370, 224, 'Loc Bac'),
(371, 224, 'Loc Bao'),
(372, 224, 'Loc Duc'),
(373, 224, 'Loc Lam'),
(374, 224, 'Loc Nam'),
(375, 224, 'Loc Ngai'),
(376, 224, 'Loc Phu'),
(377, 224, 'Loc Quang'),
(378, 224, 'Loc Tan'),
(379, 224, 'Loc Thanh'),
(380, 224, 'Tan Lac'),
(381, 225, 'Cat Tien'),
(382, 225, 'Phuoc Cat'),
(383, 225, 'Dong Nai Thuong'),
(384, 225, 'Duc Pho'),
(385, 225, 'Gia Vien'),
(386, 225, 'Nam Ninh'),
(387, 225, 'Phuoc Cat 2'),
(388, 225, 'Quang Ngai'),
(389, 225, 'Tien Hoang'),
(390, 227, 'An Lac'),
(391, 227, 'An Lac A'),
(392, 227, 'Binh Hung Hoa'),
(393, 227, 'Binh Hung HoaA'),
(394, 227, 'Binh Hung HoaB'),
(395, 227, 'Binh Tri Dong'),
(396, 227, 'Binh Tri DongA'),
(397, 227, 'Binh Tri DongB'),
(398, 227, 'Tan Tao'),
(399, 227, 'Tan Tao A'),
(400, 228, 'Phuong 1'),
(401, 228, 'Phuong 2'),
(402, 228, 'Phuong 3'),
(403, 228, 'Phuong 5'),
(404, 228, 'Phuong 6'),
(405, 228, 'Phuong 7'),
(406, 228, 'Phuong 11'),
(407, 228, 'Phuong 12'),
(408, 228, 'Phuong 13'),
(409, 228, 'Phuong 14'),
(410, 228, 'Phuong 25'),
(411, 229, 'Phuong 1'),
(412, 229, 'Phuong 2'),
(413, 229, 'Phuong 3'),
(414, 229, 'Phuong 4'),
(415, 229, 'Phuong 5'),
(416, 229, 'Phuong 6'),
(417, 229, 'Phuong 7'),
(418, 229, 'Phuong 8'),
(419, 229, 'Phuong 9'),
(420, 229, 'Phuong 10'),
(421, 229, 'Phuong 11'),
(422, 229, 'Phuong 12'),
(423, 229, 'Phuong 13'),
(424, 229, 'Phuong 15'),
(425, 229, 'Phuong 17'),
(426, 230, 'Tan Son Nhat'),
(427, 230, 'Tay Thanh'),
(428, 230, 'Son Ky'),
(429, 230, 'Tan Quy'),
(430, 230, 'Tan Thanh'),
(431, 230, 'Phu Tho Hoa'),
(432, 230, 'Phu Thanh'),
(433, 230, 'Phu Trung'),
(434, 230, 'Hoa Thanh'),
(435, 230, 'Hiep Tan'),
(436, 230, 'Tan Thoi Hoa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quan_huyen`
--

CREATE TABLE `quan_huyen` (
  `qh_id` int(11) NOT NULL,
  `tp_id` int(11) NOT NULL,
  `qh_ten` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `quan_huyen`
--

INSERT INTO `quan_huyen` (`qh_id`, `tp_id`, `qh_ten`) VALUES
(201, 1, 'Ninh Kieu'),
(202, 1, 'Thot Not'),
(203, 1, 'Cai Rang'),
(204, 1, 'Binh Thuy'),
(205, 1, 'Co Do'),
(206, 2, 'Quan 1'),
(207, 2, 'Quan 2'),
(208, 2, 'Quan 3'),
(209, 2, 'Quan 5'),
(210, 2, 'Quan 11'),
(211, 2, 'Quan 10'),
(212, 4, 'U Minh'),
(213, 4, 'Nam Can'),
(214, 4, 'Thanh Pho Ca Mau'),
(215, 4, 'Dam Doi'),
(216, 4, 'Cai Nuoc'),
(217, 5, 'Vung Liem'),
(218, 5, 'Long Ho'),
(219, 5, 'Tra On'),
(220, 5, 'Thanh Pho Vinh Long'),
(221, 5, 'Binh Minh'),
(222, 3, 'Bao Loc'),
(223, 3, 'Da Lat'),
(224, 3, 'Bao Lam'),
(225, 3, 'Cat Tien'),
(226, 3, 'Di Linh'),
(227, 2, 'Binh Tan'),
(228, 2, 'Binh Thanh'),
(229, 2, 'Phu Nhuan'),
(230, 2, 'Tan Phu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_yeuthich`
--

CREATE TABLE `tbl_yeuthich` (
  `id` int(11) NOT NULL,
  `ma_tro` int(11) NOT NULL,
  `ip_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_yeuthich`
--

INSERT INTO `tbl_yeuthich` (`id`, `ma_tro`, `ip_address`) VALUES
(1, 5, '::1'),
(2, 5, '::1'),
(3, 5, '::1'),
(4, 0, '::1'),
(5, 5, '::1'),
(6, 4, '::1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanh_pho`
--

CREATE TABLE `thanh_pho` (
  `TP_ID` int(11) NOT NULL,
  `tp_ten` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `thanh_pho`
--

INSERT INTO `thanh_pho` (`TP_ID`, `tp_ten`) VALUES
(1, 'Can Tho'),
(2, 'HCM'),
(3, 'Lam Dong'),
(4, 'Ca Mau'),
(5, 'Vinh Long');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongke`
--

CREATE TABLE `thongke` (
  `id` int(11) NOT NULL,
  `ngaydang` date NOT NULL,
  `tongsonha` varchar(45) NOT NULL,
  `tongsonguoithue` varchar(45) NOT NULL,
  `tongdoanhthu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `thongke`
--

INSERT INTO `thongke` (`id`, `ngaydang`, `tongsonha`, `tongsonguoithue`, `tongdoanhthu`) VALUES
(1, '2024-06-21', '40', '40', '5000000'),
(2, '2024-06-23', '21', '21', '100000'),
(3, '2024-06-24', '22', '23', '3000000'),
(4, '2024-06-25', '25', '25', '200000'),
(5, '2024-06-04', '12', '12', '2444444'),
(6, '2024-06-26', '23', '23', '2000000'),
(7, '2024-06-22', '10', '10', '500000'),
(8, '2024-06-27', '24', '23', '2000000'),
(9, '2024-06-20', '12', '12', '2444444');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL COMMENT 'Tên người dùng',
  `pass` text NOT NULL COMMENT 'Mật khẩu',
  `gp` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `user_name`, `pass`, `gp`, `email`) VALUES
(1, 'chihai', '$2y$10$hYzOFnyIQJgbul/GG.D.benoPS.FACV943/WhtD9ckIEgLIMZ/aYu', 2, 'chihai@gmail.com'),
(2, 'hoangem', '$2y$10$hYzOFnyIQJgbul/GG.D.benoPS.FACV943/WhtD9ckIEgLIMZ/aYu', 2, 'hoangem@gmail.com'),
(4, 'thanhhuy', '$2y$10$hYzOFnyIQJgbul/GG.D.benoPS.FACV943/WhtD9ckIEgLIMZ/aYu', 1, 'thanhhuy@gmail.com'),
(5, 'thanhhoai', '$2y$10$hwoGazw9dL2kMw9088ZJtei02gkE3P0MvKq7LZEgvvJYCb9QcorGO', 2, 'thanhhoai@gmail.com'),
(6, 'haha', '$2y$10$hwoGazw9dL2kMw9088ZJtei02gkE3P0MvKq7LZEgvvJYCb9QcorGO', 1, 'haha@gmail.com'),
(7, 'huy', '$2y$10$hYzOFnyIQJgbul/GG.D.benoPS.FACV943/WhtD9ckIEgLIMZ/aYu', 2, 'huy@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeuthich`
--

CREATE TABLE `yeuthich` (
  `ma_yeutich` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ma_tro` int(11) DEFAULT NULL,
  `is_fav` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `yeuthich`
--

INSERT INTO `yeuthich` (`ma_yeutich`, `user_id`, `ma_tro`, `is_fav`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 4, 3, 0),
(4, 5, 3, 0),
(5, 4, 5, 0),
(6, 4, 4, 0),
(7, 4, 2, 0),
(8, 4, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeuthich1`
--

CREATE TABLE `yeuthich1` (
  `id_yt` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `ma_tro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_cmt`),
  ADD KEY `fk_nt_cmt` (`id_tro`),
  ADD KEY `fk_kh_cmt` (`id_kh`);

--
-- Chỉ mục cho bảng `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`hoadon_id`),
  ADD KEY `fk_nt_hd` (`nhatro_id`),
  ADD KEY `fk_user_hd` (`user_id`);

--
-- Chỉ mục cho bảng `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `loai_nhatro`
--
ALTER TABLE `loai_nhatro`
  ADD PRIMARY KEY (`Loai_nhatro`),
  ADD UNIQUE KEY `Ma_nhatro` (`Loai_nhatro`);

--
-- Chỉ mục cho bảng `nhatro`
--
ALTER TABLE `nhatro`
  ADD PRIMARY KEY (`ma_tro`),
  ADD KEY `Ma_nhatro` (`Loai_nhatro`),
  ADD KEY `fk_nt_p` (`phuong`),
  ADD KEY `fk_nt_qh` (`huyen`),
  ADD KEY `fk_nt_tp` (`thanhpho`),
  ADD KEY `fk_chutro` (`chu_id`);

--
-- Chỉ mục cho bảng `nhatro_anh`
--
ALTER TABLE `nhatro_anh`
  ADD PRIMARY KEY (`ma_anh`),
  ADD KEY `ma_tro` (`ma_tro`);

--
-- Chỉ mục cho bảng `phuong`
--
ALTER TABLE `phuong`
  ADD PRIMARY KEY (`phuong_id`),
  ADD KEY `fk_qh` (`qh_id`);

--
-- Chỉ mục cho bảng `quan_huyen`
--
ALTER TABLE `quan_huyen`
  ADD PRIMARY KEY (`qh_id`),
  ADD KEY `fk_tp` (`tp_id`);

--
-- Chỉ mục cho bảng `tbl_yeuthich`
--
ALTER TABLE `tbl_yeuthich`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thanh_pho`
--
ALTER TABLE `thanh_pho`
  ADD PRIMARY KEY (`TP_ID`);

--
-- Chỉ mục cho bảng `thongke`
--
ALTER TABLE `thongke`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_nguoidung_vaitro` (`gp`);

--
-- Chỉ mục cho bảng `yeuthich`
--
ALTER TABLE `yeuthich`
  ADD PRIMARY KEY (`ma_yeutich`),
  ADD KEY `ma_tro` (`ma_tro`),
  ADD KEY `fk_yt_tk` (`user_id`);

--
-- Chỉ mục cho bảng `yeuthich1`
--
ALTER TABLE `yeuthich1`
  ADD PRIMARY KEY (`id_yt`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `group`
--
ALTER TABLE `group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `hoadon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nhatro`
--
ALTER TABLE `nhatro`
  MODIFY `ma_tro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `nhatro_anh`
--
ALTER TABLE `nhatro_anh`
  MODIFY `ma_anh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `phuong`
--
ALTER TABLE `phuong`
  MODIFY `phuong_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT cho bảng `quan_huyen`
--
ALTER TABLE `quan_huyen`
  MODIFY `qh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT cho bảng `tbl_yeuthich`
--
ALTER TABLE `tbl_yeuthich`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `thanh_pho`
--
ALTER TABLE `thanh_pho`
  MODIFY `TP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `yeuthich`
--
ALTER TABLE `yeuthich`
  MODIFY `ma_yeutich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `yeuthich1`
--
ALTER TABLE `yeuthich1`
  MODIFY `id_yt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_kh_cmt` FOREIGN KEY (`id_kh`) REFERENCES `information` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nt_cmt` FOREIGN KEY (`id_tro`) REFERENCES `nhatro` (`ma_tro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `fk_nt_hd` FOREIGN KEY (`nhatro_id`) REFERENCES `nhatro` (`ma_tro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_hd` FOREIGN KEY (`user_id`) REFERENCES `information` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `nhatro`
--
ALTER TABLE `nhatro`
  ADD CONSTRAINT `fk_chutro` FOREIGN KEY (`chu_id`) REFERENCES `information` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nt_p` FOREIGN KEY (`phuong`) REFERENCES `phuong` (`phuong_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nt_qh` FOREIGN KEY (`huyen`) REFERENCES `quan_huyen` (`qh_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nt_tp` FOREIGN KEY (`thanhpho`) REFERENCES `thanh_pho` (`TP_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nhatro_ibfk_1` FOREIGN KEY (`Loai_nhatro`) REFERENCES `loai_nhatro` (`Loai_nhatro`);

--
-- Các ràng buộc cho bảng `nhatro_anh`
--
ALTER TABLE `nhatro_anh`
  ADD CONSTRAINT `nhatro_anh_ibfk_1` FOREIGN KEY (`ma_tro`) REFERENCES `nhatro` (`ma_tro`);

--
-- Các ràng buộc cho bảng `phuong`
--
ALTER TABLE `phuong`
  ADD CONSTRAINT `fk_qh` FOREIGN KEY (`qh_id`) REFERENCES `quan_huyen` (`qh_id`);

--
-- Các ràng buộc cho bảng `quan_huyen`
--
ALTER TABLE `quan_huyen`
  ADD CONSTRAINT `fk_tp` FOREIGN KEY (`tp_id`) REFERENCES `thanh_pho` (`TP_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_nguoidung_vaitro` FOREIGN KEY (`gp`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `yeuthich`
--
ALTER TABLE `yeuthich`
  ADD CONSTRAINT `fk_yt_tk` FOREIGN KEY (`user_id`) REFERENCES `information` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `yeuthich_ibfk_1` FOREIGN KEY (`ma_tro`) REFERENCES `nhatro` (`ma_tro`);

--
-- Các ràng buộc cho bảng `yeuthich1`
--
ALTER TABLE `yeuthich1`
  ADD CONSTRAINT `yeuthich1_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
