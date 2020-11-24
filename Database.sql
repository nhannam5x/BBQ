-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 22, 2020 lúc 09:51 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bbq`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `access` int(255) NOT NULL,
  `id_crew` int(255) NOT NULL,
  `status_account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(255) NOT NULL,
  `sum` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_crew` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

CREATE TABLE `bill_details` (
  `id_bill` int(255) NOT NULL,
  `id_member` int(255) NOT NULL,
  `id_crew` int(255) NOT NULL,
  `id_combo` int(255) NOT NULL,
  `id_sale` int(255) NOT NULL,
  `id_dish` int(255) NOT NULL,
  `sum` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity_combo` int(255) NOT NULL,
  `quantity_dish` int(255) NOT NULL,
  `name_dish` int(255) NOT NULL,
  `name_crew` int(255) NOT NULL,
  `status_bill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_table` int(255) NOT NULL,
  `id_menu` int(255) NOT NULL,
  `quantity_dish` int(255) NOT NULL,
  `id_dish` int(255) NOT NULL,
  `id_combo` int(255) NOT NULL,
  `status_waitting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `combo`
--

CREATE TABLE `combo` (
  `id_combo` int(255) NOT NULL,
  `name_combo` varchar(255) NOT NULL,
  `price_combo` int(255) NOT NULL,
  `status_combo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crew`
--

CREATE TABLE `crew` (
  `id_crew` int(255) NOT NULL,
  `name_crew` int(255) NOT NULL,
  `phone` int(255) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `position` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `salary` int(255) NOT NULL,
  `shift` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_crew` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dish`
--

CREATE TABLE `dish` (
  `id_dish` int(255) NOT NULL,
  `name_dish` int(255) NOT NULL,
  `price_dish` int(255) NOT NULL,
  `status_dish` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `name_member` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `quantity_table` int(255) NOT NULL,
  `summary` int(255) NOT NULL,
  `status_member` int(11) NOT NULL,
  `id_combo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id_combo` int(255) NOT NULL,
  `id_dish` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `storage`
--

CREATE TABLE `storage` (
  `id_product` int(255) NOT NULL,
  `quantity_product` int(255) NOT NULL,
  `status_product` int(8) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `name_supplier` varchar(255) NOT NULL,
  `phone` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier_details`
--

CREATE TABLE `supplier_details` (
  `id_supplier` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_product` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_waitting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table`
--

CREATE TABLE `table` (
  `id_table` int(11) NOT NULL,
  `id_customer` int(255) NOT NULL,
  `size_table` int(6) NOT NULL,
  `id_cart` int(255) NOT NULL,
  `status_table` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD KEY `id_crew` (`id_crew`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `id_bill` (`id_bill`),
  ADD KEY `id_bill_2` (`id_bill`),
  ADD KEY `id_crew` (`id_crew`);

--
-- Chỉ mục cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_bill` (`id_bill`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_crew` (`id_crew`),
  ADD KEY `id_combo` (`id_combo`),
  ADD KEY `id_sale` (`id_sale`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_table` (`id_table`),
  ADD KEY `id_cart` (`id_cart`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_combo` (`id_combo`);

--
-- Chỉ mục cho bảng `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`id_combo`),
  ADD KEY `id_combo` (`id_combo`);

--
-- Chỉ mục cho bảng `crew`
--
ALTER TABLE `crew`
  ADD PRIMARY KEY (`id_crew`),
  ADD KEY `id_crew` (`id_crew`);

--
-- Chỉ mục cho bảng `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id_dish`),
  ADD KEY `id_dish` (`id_dish`);

--
-- Chỉ mục cho bảng `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_combo` (`id_combo`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_combo` (`id_combo`);

--
-- Chỉ mục cho bảng `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Chỉ mục cho bảng `supplier_details`
--
ALTER TABLE `supplier_details`
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id_table`),
  ADD KEY `id_table` (`id_table`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_cart` (`id_cart`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `combo`
--
ALTER TABLE `combo`
  MODIFY `id_combo` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `crew`
--
ALTER TABLE `crew`
  MODIFY `id_crew` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dish`
--
ALTER TABLE `dish`
  MODIFY `id_dish` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `storage`
--
ALTER TABLE `storage`
  MODIFY `id_product` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `table`
--
ALTER TABLE `table`
  MODIFY `id_table` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
