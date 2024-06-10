-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 09:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paketjihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `detiltransaksis`
--

CREATE TABLE `detiltransaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detiltransaksis`
--

INSERT INTO `detiltransaksis` (`id`, `id_transaksi`, `id_produk`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(1, 16, 1, 2, 30000, '2024-05-26 22:02:27', '2024-05-26 22:02:27'),
(2, 17, 1, 1, 30000, '2024-05-26 22:08:04', '2024-05-26 22:08:04'),
(3, 18, 5, 2, 13000, '2024-05-26 22:11:13', '2024-05-26 22:11:13'),
(4, 19, 1, 2, 30000, '2024-05-26 22:12:32', '2024-05-26 22:12:32'),
(5, 21, 1, 1, 30000, '2024-05-26 22:14:58', '2024-05-26 22:14:58'),
(6, 21, 5, 1, 13000, '2024-05-26 22:15:06', '2024-05-26 22:15:06'),
(7, 22, 5, 1, 13000, '2024-05-26 22:16:25', '2024-05-26 22:16:25'),
(8, 25, 1, 1, 30000, '2024-05-26 22:23:23', '2024-05-26 22:23:23'),
(9, 26, 1, 3, 30000, '2024-05-26 22:25:27', '2024-05-26 22:25:27'),
(10, 27, 1, 1, 30000, '2024-06-02 18:30:06', '2024-06-02 18:30:06'),
(11, 28, 1, 1, 30000, '2024-06-03 23:55:33', '2024-06-03 23:55:33');

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
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_04_26_032120_create_produks_table', 1),
(7, '2024_04_26_032156_create_pelanggans_table', 1),
(8, '2024_04_26_032227_create_users_table', 1),
(9, '2024_04_26_032258_create_detiltransaksis_table', 1),
(10, '2024_04_26_033918_create_transaksis_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggans`
--

CREATE TABLE `pelanggans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggans`
--

INSERT INTO `pelanggans` (`id`, `nama`, `alamat`, `nohp`, `created_at`, `updated_at`) VALUES
(1, 'Celci', 'Tokyo', '1234', '2024-04-26 20:47:46', '2024-04-26 20:49:55'),
(2, 'Aditiya', 'Opak', '0808', '2024-04-27 07:03:55', '2024-04-27 07:04:24'),
(3, 'Fahri', 'Karang Baru', '0808', '2024-05-17 23:18:00', '2024-05-17 23:18:29'),
(4, 'Ahmadi Muslim', 'Paya Raja', '7777', '2024-06-03 23:57:11', '2024-06-03 23:57:11');

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

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `nama`, `stok`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'Voucher Telkomsel 7GB/7H', 95, 30000, '2024-04-26 20:52:57', '2024-06-03 23:55:41'),
(5, 'Voucher Axis 4GB/5H', 98, 13000, '2024-04-26 22:22:30', '2024-05-26 22:16:38'),
(6, 'Voucher Tri 4GB/3HR', 30, 12000, '2024-06-03 23:58:06', '2024-06-03 23:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `id_pelanggan` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `invoice`, `id_pelanggan`, `id_user`, `total`, `created_at`, `updated_at`) VALUES
(1, 'INV-1', 2, 1, 0, '2024-05-16 19:15:33', '2024-05-16 19:15:33'),
(2, 'INV-2', 2, 1, 0, '2024-05-17 05:48:41', '2024-05-17 05:48:41'),
(3, 'INV-3', 2, 1, 0, '2024-05-17 19:33:16', '2024-05-17 19:33:16'),
(4, 'INV-4', 2, 1, 0, '2024-05-17 22:40:43', '2024-05-17 22:40:43'),
(5, 'INV-5', 2, 1, 0, '2024-05-17 22:59:42', '2024-05-17 22:59:42'),
(6, 'INV-6', 2, 1, 0, '2024-05-17 23:01:46', '2024-05-17 23:01:46'),
(7, 'INV-7', 1, 1, 0, '2024-05-17 23:18:41', '2024-05-17 23:18:41'),
(8, 'INV-8', 2, 1, 0, '2024-05-17 23:44:31', '2024-05-17 23:44:31'),
(9, 'INV-9', 2, 1, 0, '2024-05-17 23:54:58', '2024-05-17 23:54:58'),
(10, 'INV-10', 2, 1, 0, '2024-05-26 19:33:00', '2024-05-26 19:33:00'),
(11, 'INV-11', 1, 1, 0, '2024-05-26 20:33:06', '2024-05-26 20:33:06'),
(12, 'INV-12', 1, 1, 0, '2024-05-26 21:02:16', '2024-05-26 21:02:16'),
(13, 'INV-13', 3, 1, 0, '2024-05-26 21:42:32', '2024-05-26 21:42:32'),
(14, 'INV-14', 3, 1, 0, '2024-05-26 21:43:15', '2024-05-26 21:43:15'),
(15, 'INV-15', 3, 1, 0, '2024-05-26 21:52:56', '2024-05-26 21:52:56'),
(16, 'INV-16', 1, 1, 60000, '2024-05-26 22:00:50', '2024-05-26 22:02:27'),
(17, 'INV-17', 3, 1, 30000, '2024-05-26 22:07:58', '2024-05-26 22:08:04'),
(18, 'INV-18', 2, 1, 26000, '2024-05-26 22:10:45', '2024-05-26 22:11:13'),
(19, 'INV-19', 2, 1, 60000, '2024-05-26 22:12:24', '2024-05-26 22:12:32'),
(20, 'INV-20', 1, 1, 0, '2024-05-26 22:14:14', '2024-05-26 22:14:14'),
(21, 'INV-21', 1, 1, 43000, '2024-05-26 22:14:51', '2024-05-26 22:15:06'),
(22, 'INV-22', 3, 1, 13000, '2024-05-26 22:16:15', '2024-05-26 22:16:25'),
(23, 'INV-23', 3, 1, 0, '2024-05-26 22:19:58', '2024-05-26 22:19:58'),
(24, 'INV-24', 2, 1, 0, '2024-05-26 22:22:15', '2024-05-26 22:22:15'),
(25, 'INV-25', 1, 1, 30000, '2024-05-26 22:23:11', '2024-05-26 22:23:23'),
(26, 'INV-26', 1, 1, 90000, '2024-05-26 22:25:14', '2024-05-26 22:25:27'),
(27, 'INV-27', 2, 1, 30000, '2024-06-02 18:29:43', '2024-06-02 18:30:06'),
(28, 'INV-28', 1, 1, 30000, '2024-06-03 23:55:26', '2024-06-03 23:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'jihan', 'jihan@gmail.com', '$2y$10$MV6T557pnMAAhEldfSS8nuJMSAZKKvxiOs/TSByw/.sbI4qFX/SPe', '2024-04-26 20:10:14', '2024-04-26 20:10:14'),
(2, 'Amy', 'amy@gmail.com', '$2y$10$usVEIDpkL/DJty/wPBPL5OreXWnEsJA0RowX4OSKAcSDEkusoqZue', '2024-04-26 20:47:05', '2024-04-26 20:47:05'),
(6, 'Ahmadi Muslim', 'ahmadi@gmail.com', '$2y$10$7J.4mUwENPh9d5ITayaiWeE5cODEFr3JWlahkXrpQckNh8yZg1l/y', '2024-04-26 22:27:27', '2024-04-26 22:27:27'),
(7, 'Alyzza', 'ijot@gmail.com', '$2y$10$XsW38XGDwQFqG4k1z.E3AOCEBcJr/9tTh5hgVwP5KUs1laGhPgp/W', '2024-04-27 07:04:55', '2024-04-27 07:04:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detiltransaksis`
--
ALTER TABLE `detiltransaksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detiltransaksis_id_transaksi_foreign` (`id_transaksi`),
  ADD KEY `detiltransaksis_id_produk_foreign` (`id_produk`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggans`
--
ALTER TABLE `pelanggans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaksis_invoice_unique` (`invoice`),
  ADD KEY `transaksis_id_pelanggan_foreign` (`id_pelanggan`),
  ADD KEY `transaksis_id_user_foreign` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detiltransaksis`
--
ALTER TABLE `detiltransaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pelanggans`
--
ALTER TABLE `pelanggans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detiltransaksis`
--
ALTER TABLE `detiltransaksis`
  ADD CONSTRAINT `detiltransaksis_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detiltransaksis_id_transaksi_foreign` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD CONSTRAINT `transaksis_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksis_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
