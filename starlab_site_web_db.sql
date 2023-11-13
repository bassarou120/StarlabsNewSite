-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 13 nov. 2023 à 08:08
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `starlab_site_web_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, '6CPEUGL0cYffDTYbYGeXsq38GMZZgey5', 1, '2023-11-08 01:54:51', '2023-11-08 01:54:51', '2023-11-08 01:54:51'),
(2, 2, '4uBUtr5nUxzbXLXM2OnM0gH6eyPVmi2I', 1, '2023-11-08 01:54:51', '2023-11-08 01:54:51', '2023-11-08 01:54:51');

-- --------------------------------------------------------

--
-- Structure de la table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT '0',
  `dismissible` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `announcements_translations`
--

CREATE TABLE `announcements_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcements_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'Bassarou Yacoubou', 'info', '2023-11-09 15:35:39', '2023-11-09 15:35:39');

-- --------------------------------------------------------

--
-- Structure de la table `bs_packages`
--

CREATE TABLE `bs_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annual_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `features` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bs_packages_translations`
--

CREATE TABLE `bs_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bs_packages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bs_services`
--

CREATE TABLE `bs_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bs_services_translations`
--

CREATE TABLE `bs_services_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bs_services_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bs_service_categories`
--

CREATE TABLE `bs_service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bs_service_categories_translations`
--

CREATE TABLE `bs_service_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bs_service_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `careers`
--

CREATE TABLE `careers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `careers_translations`
--

CREATE TABLE `careers_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `careers_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories_translations`
--

CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cities_translations`
--

CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `countries_translations`
--

CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_1', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(2, 'widget_total_2', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(3, 'widget_total_themes', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(4, 'widget_total_3', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(5, 'widget_total_4', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(6, 'widget_total_users', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(7, 'widget_total_pages', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(8, 'widget_total_plugins', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(9, 'widget_analytics_general', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(10, 'widget_analytics_page', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(11, 'widget_analytics_browser', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(12, 'widget_analytics_referrer', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(13, 'widget_posts_recent', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(14, 'widget_audit_logs', '2023-11-09 15:35:39', '2023-11-09 15:35:39'),
(15, 'widget_ecommerce_report_general', '2023-11-09 15:35:39', '2023-11-09 15:35:39');

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_brands`
--

CREATE TABLE `ec_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_brands_translations`
--

CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_cart`
--

CREATE TABLE `ec_cart` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_currencies`
--

CREATE TABLE `ec_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `decimals` tinyint(3) UNSIGNED DEFAULT '0',
  `order` int(10) UNSIGNED DEFAULT '0',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ec_currencies`
--

INSERT INTO `ec_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 2, 0, 1, 1, '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(2, 'EUR', '€', 0, 2, 1, 0, 0.91, '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(3, 'VND', '₫', 0, 0, 2, 0, 23717.5, '2023-11-08 01:55:01', '2023-11-08 01:55:01');

-- --------------------------------------------------------

--
-- Structure de la table `ec_customers`
--

CREATE TABLE `ec_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_customer_addresses`
--

CREATE TABLE `ec_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_customer_password_resets`
--

CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_customer_recently_viewed_products`
--

CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_customer_used_coupons`
--

CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_discounts`
--

CREATE TABLE `ec_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_discount_customers`
--

CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_discount_products`
--

CREATE TABLE `ec_discount_products` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_discount_product_categories`
--

CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_discount_product_collections`
--

CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_collection_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_flash_sales`
--

CREATE TABLE `ec_flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_flash_sales_translations`
--

CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_flash_sale_products`
--

CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_global_options`
--

CREATE TABLE `ec_global_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_global_options_translations`
--

CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_options_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_global_option_value`
--

CREATE TABLE `ec_global_option_value` (
  `option_id` bigint(20) UNSIGNED NOT NULL COMMENT 'option id',
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int(11) NOT NULL DEFAULT '9999',
  `affect_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_global_option_value_translations`
--

CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_option_value_id` bigint(20) UNSIGNED NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_grouped_products`
--

CREATE TABLE `ec_grouped_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `fixed_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_invoices`
--

CREATE TABLE `ec_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_invoice_items`
--

CREATE TABLE `ec_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_options`
--

CREATE TABLE `ec_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_options_translations`
--

CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_options_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_option_value`
--

CREATE TABLE `ec_option_value` (
  `option_id` bigint(20) UNSIGNED NOT NULL COMMENT 'option id',
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int(11) NOT NULL DEFAULT '9999',
  `affect_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_option_value_translations`
--

CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_option_value_id` bigint(20) UNSIGNED NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_orders`
--

CREATE TABLE `ec_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_order_addresses`
--

CREATE TABLE `ec_order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_order_histories`
--

CREATE TABLE `ec_order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_order_product`
--

CREATE TABLE `ec_order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int(11) NOT NULL DEFAULT '0',
  `license_code` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_order_referrals`
--

CREATE TABLE `ec_order_referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_order_returns`
--

CREATE TABLE `ec_order_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Order ID',
  `store_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_order_return_items`
--

CREATE TABLE `ec_order_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_return_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Order product id',
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_order_tax_information`
--

CREATE TABLE `ec_order_tax_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_tax_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_products`
--

CREATE TABLE `ec_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_variation` tinyint(4) NOT NULL DEFAULT '0',
  `sale_type` tinyint(4) NOT NULL DEFAULT '0',
  `price` double UNSIGNED DEFAULT NULL,
  `sale_price` double UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_by_id` bigint(20) UNSIGNED DEFAULT '0',
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `generate_license_code` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_products_translations`
--

CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_attributes`
--

CREATE TABLE `ec_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_attributes_translations`
--

CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_attribute_sets`
--

CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_comparable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_attribute_sets_translations`
--

CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_categories`
--

CREATE TABLE `ec_product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_categories_translations`
--

CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_categorizables`
--

CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_category_product`
--

CREATE TABLE `ec_product_category_product` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_collections`
--

CREATE TABLE `ec_product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_collections_translations`
--

CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_collection_products`
--

CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_cross_sale_relations`
--

CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint(20) UNSIGNED NOT NULL,
  `to_product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_files`
--

CREATE TABLE `ec_product_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_labels`
--

CREATE TABLE `ec_product_labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_labels_translations`
--

CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_label_products`
--

CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_related_relations`
--

CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint(20) UNSIGNED NOT NULL,
  `to_product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_tags`
--

CREATE TABLE `ec_product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_tags_translations`
--

CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_tag_product`
--

CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_up_sale_relations`
--

CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint(20) UNSIGNED NOT NULL,
  `to_product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_variations`
--

CREATE TABLE `ec_product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `configurable_product_id` bigint(20) UNSIGNED NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_variation_items`
--

CREATE TABLE `ec_product_variation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_views`
--

CREATE TABLE `ec_product_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `views` int(11) NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '2023-11-08'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_product_with_attribute_set`
--

CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_reviews`
--

CREATE TABLE `ec_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_shipments`
--

CREATE TABLE `ec_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_shipment_histories`
--

CREATE TABLE `ec_shipment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_shipping`
--

CREATE TABLE `ec_shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_shipping_rules`
--

CREATE TABLE `ec_shipping_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_shipping_rule_items`
--

CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_rule_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_store_locators`
--

CREATE TABLE `ec_store_locators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_taxes`
--

CREATE TABLE `ec_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_tax_products`
--

CREATE TABLE `ec_tax_products` (
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_tax_rules`
--

CREATE TABLE `ec_tax_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ec_wish_lists`
--

CREATE TABLE `ec_wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faqs_translations`
--

CREATE TABLE `faqs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faq_categories_translations`
--

CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

CREATE TABLE `languages` (
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lang_order` int(11) NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` bigint(20) UNSIGNED NOT NULL,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `alt`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'account', 'account', 1, 'image/png', 10686, 'general/account.png', '[]', '2023-11-08 01:54:51', '2023-11-08 01:54:51', NULL),
(2, 0, 'answer', 'answer', 1, 'image/png', 29926, 'general/answer.png', '[]', '2023-11-08 01:54:51', '2023-11-08 01:54:51', NULL),
(3, 0, 'apple', 'apple', 1, 'image/png', 892, 'general/apple.png', '[]', '2023-11-08 01:54:51', '2023-11-08 01:54:51', NULL),
(4, 0, 'appstore-btn', 'appstore-btn', 1, 'image/png', 841, 'general/appstore-btn.png', '[]', '2023-11-08 01:54:51', '2023-11-08 01:54:51', NULL),
(5, 0, 'automated', 'automated', 1, 'image/png', 7006, 'general/automated.png', '[]', '2023-11-08 01:54:51', '2023-11-08 01:54:51', NULL),
(6, 0, 'banner-authentication', 'banner-authentication', 1, 'image/png', 87110, 'general/banner-authentication.png', '[]', '2023-11-08 01:54:51', '2023-11-08 01:54:51', NULL),
(7, 0, 'banner-blog', 'banner-blog', 1, 'image/png', 14312, 'general/banner-blog.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(8, 0, 'banner-career', 'banner-career', 1, 'image/png', 56285, 'general/banner-career.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(9, 0, 'banner-help-center-1', 'banner-help-center-1', 1, 'image/png', 17518, 'general/banner-help-center-1.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(10, 0, 'banner-help-center-2', 'banner-help-center-2', 1, 'image/png', 37388, 'general/banner-help-center-2.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(11, 0, 'banner-homepage-10', 'banner-homepage-10', 1, 'image/png', 12074, 'general/banner-homepage-10.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(12, 0, 'banner-homepage-3', 'banner-homepage-3', 1, 'image/png', 15479, 'general/banner-homepage-3.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(13, 0, 'banner-homepage-5', 'banner-homepage-5', 1, 'image/png', 15567, 'general/banner-homepage-5.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(14, 0, 'banner-homepage-6', 'banner-homepage-6', 1, 'image/png', 14559, 'general/banner-homepage-6.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(15, 0, 'banner-homepage-7-1', 'banner-homepage-7-1', 1, 'image/png', 5298, 'general/banner-homepage-7-1.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(16, 0, 'banner-homepage-7-2', 'banner-homepage-7-2', 1, 'image/png', 5665, 'general/banner-homepage-7-2.png', '[]', '2023-11-08 01:54:52', '2023-11-08 01:54:52', NULL),
(17, 0, 'banner-homepage-7-3', 'banner-homepage-7-3', 1, 'image/png', 5805, 'general/banner-homepage-7-3.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(18, 0, 'banner-homepage-7-4', 'banner-homepage-7-4', 1, 'image/png', 4515, 'general/banner-homepage-7-4.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(19, 0, 'banner-homepage-7-5', 'banner-homepage-7-5', 1, 'image/png', 4985, 'general/banner-homepage-7-5.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(20, 0, 'banner-homepage-7-6', 'banner-homepage-7-6', 1, 'image/png', 4985, 'general/banner-homepage-7-6.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(21, 0, 'banner-homepage-9', 'banner-homepage-9', 1, 'image/png', 12736, 'general/banner-homepage-9.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(22, 0, 'banner-how-to-start', 'banner-how-to-start', 1, 'image/png', 35534, 'general/banner-how-to-start.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(23, 0, 'banner-product-1', 'banner-product-1', 1, 'image/png', 36859, 'general/banner-product-1.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(24, 0, 'banner-product', 'banner-product', 1, 'image/png', 9606, 'general/banner-product.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(25, 0, 'banner-services', 'banner-services', 1, 'image/png', 14751, 'general/banner-services.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(26, 0, 'banner-term-and-conditions', 'banner-term-and-conditions', 1, 'image/png', 17696, 'general/banner-term-and-conditions.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(27, 0, 'banner', 'banner', 1, 'image/png', 11779, 'general/banner.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(28, 0, 'bg-banner-secondary', 'bg-banner-secondary', 1, 'image/png', 8476, 'general/bg-banner-secondary.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(29, 0, 'bg-faqs', 'bg-faqs', 1, 'image/png', 5942, 'general/bg-faqs.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(30, 0, 'box-image-1', 'box-image-1', 1, 'image/png', 59030, 'general/box-image-1.png', '[]', '2023-11-08 01:54:53', '2023-11-08 01:54:53', NULL),
(31, 0, 'box-image-2', 'box-image-2', 1, 'image/png', 55841, 'general/box-image-2.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(32, 0, 'brand-services-1', 'brand-services-1', 1, 'image/png', 1588, 'general/brand-services-1.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(33, 0, 'brand-services-2', 'brand-services-2', 1, 'image/png', 3425, 'general/brand-services-2.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(34, 0, 'brand-services-3', 'brand-services-3', 1, 'image/png', 6740, 'general/brand-services-3.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(35, 0, 'branding-image', 'branding-image', 1, 'image/png', 12695, 'general/branding-image.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(36, 0, 'branding-img-1', 'branding-img-1', 1, 'image/png', 11749, 'general/branding-img-1.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(37, 0, 'branding-img-2', 'branding-img-2', 1, 'image/png', 6921, 'general/branding-img-2.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(38, 0, 'certify', 'certify', 1, 'image/png', 2081, 'general/certify.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(39, 0, 'chart-homepage-5', 'chart-homepage-5', 1, 'image/png', 6379, 'general/chart-homepage-5.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(40, 0, 'chart', 'chart', 1, 'image/png', 3879, 'general/chart.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(41, 0, 'chart1', 'chart1', 1, 'image/png', 4853, 'general/chart1.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(42, 0, 'chart2', 'chart2', 1, 'image/png', 4208, 'general/chart2.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(43, 0, 'connect-with-us-1', 'connect-with-us-1', 1, 'image/png', 41732, 'general/connect-with-us-1.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(44, 0, 'connect-with-us-2', 'connect-with-us-2', 1, 'image/png', 41732, 'general/connect-with-us-2.png', '[]', '2023-11-08 01:54:54', '2023-11-08 01:54:54', NULL),
(45, 0, 'connect-with-us-3', 'connect-with-us-3', 1, 'image/png', 41732, 'general/connect-with-us-3.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(46, 0, 'contact-banner', 'contact-banner', 1, 'image/png', 11974, 'general/contact-banner.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(47, 0, 'customer', 'customer', 1, 'image/png', 23290, 'general/customer.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(48, 0, 'follower', 'follower', 1, 'image/png', 57770, 'general/follower.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(49, 0, 'google-play-btn', 'google-play-btn', 1, 'image/png', 987, 'general/google-play-btn.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(50, 0, 'google', 'google', 1, 'image/png', 892, 'general/google.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(51, 0, 'hero-1', 'hero-1', 1, 'image/png', 24885, 'general/hero-1.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(52, 0, 'hero-2', 'hero-2', 1, 'image/png', 24885, 'general/hero-2.png', '[]', '2023-11-08 01:54:55', '2023-11-08 01:54:55', NULL),
(53, 0, 'hero-3', 'hero-3', 1, 'image/png', 24885, 'general/hero-3.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(54, 0, 'hero-banner', 'hero-banner', 1, 'image/png', 11140, 'general/hero-banner.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(55, 0, 'human1', 'human1', 1, 'image/png', 9230, 'general/human1.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(56, 0, 'human2', 'human2', 1, 'image/png', 9230, 'general/human2.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(57, 0, 'human3', 'human3', 1, 'image/png', 9230, 'general/human3.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(58, 0, 'image-branding', 'image-branding', 1, 'image/png', 10988, 'general/image-branding.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(59, 0, 'img-financial', 'img-financial', 1, 'image/png', 8168, 'general/img-financial.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(60, 0, 'img-marketing', 'img-marketing', 1, 'image/png', 49951, 'general/img-marketing.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(61, 0, 'img-project', 'img-project', 1, 'image/png', 11699, 'general/img-project.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(62, 0, 'img-project2', 'img-project2', 1, 'image/png', 11565, 'general/img-project2.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(63, 0, 'img-tab-1', 'img-tab-1', 1, 'image/png', 11929, 'general/img-tab-1.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(64, 0, 'img-tab-2', 'img-tab-2', 1, 'image/png', 48363, 'general/img-tab-2.png', '[]', '2023-11-08 01:54:56', '2023-11-08 01:54:56', NULL),
(65, 0, 'img-tab-3', 'img-tab-3', 1, 'image/png', 6921, 'general/img-tab-3.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(66, 0, 'img-tab-4', 'img-tab-4', 1, 'image/png', 12736, 'general/img-tab-4.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(67, 0, 'img-video-2', 'img-video-2', 1, 'image/png', 51683, 'general/img-video-2.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(68, 0, 'intro-video-product', 'intro-video-product', 1, 'image/png', 56988, 'general/intro-video-product.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(69, 0, 'intro-video', 'intro-video', 1, 'image/png', 12239, 'general/intro-video.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(70, 0, 'job-details-thumb', 'job-details-thumb', 1, 'image/png', 34862, 'general/job-details-thumb.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(71, 0, 'members', 'members', 1, 'image/png', 11734, 'general/members.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(72, 0, 'newsletter-image', 'newsletter-image', 1, 'image/png', 6353, 'general/newsletter-image.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(73, 0, 'phone-app', 'phone-app', 1, 'image/png', 7837, 'general/phone-app.png', '[]', '2023-11-08 01:54:57', '2023-11-08 01:54:57', NULL),
(74, 0, 'phone1', 'phone1', 1, 'image/png', 7205, 'general/phone1.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(75, 0, 'phone2', 'phone2', 1, 'image/png', 7837, 'general/phone2.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(76, 0, 'plants-1', 'plants-1', 1, 'image/png', 4607, 'general/plants-1.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(77, 0, 'plants', 'plants', 1, 'image/png', 11522, 'general/plants.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(78, 0, 'platform-social', 'platform-social', 1, 'image/png', 8400, 'general/platform-social.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(79, 0, 'product-feature', 'product-feature', 1, 'image/png', 36859, 'general/product-feature.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(80, 0, 'question1', 'question1', 1, 'image/png', 36770, 'general/question1.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(81, 0, 'question2', 'question2', 1, 'image/png', 19413, 'general/question2.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(82, 0, 'question3', 'question3', 1, 'image/png', 16747, 'general/question3.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(83, 0, 'social-homepage', 'social-homepage', 1, 'image/png', 7251, 'general/social-homepage.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(84, 0, 'testimonial', 'testimonial', 1, 'image/png', 3290, 'general/testimonial.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(85, 0, 'testimonial1', 'testimonial1', 1, 'image/png', 3290, 'general/testimonial1.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(86, 0, 'we-what-offer-1', 'we-what-offer-1', 1, 'image/png', 15025, 'general/we-what-offer-1.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(87, 0, 'we-what-offer-2', 'we-what-offer-2', 1, 'image/png', 19357, 'general/we-what-offer-2.png', '[]', '2023-11-08 01:54:58', '2023-11-08 01:54:58', NULL),
(88, 0, 'we-what-offer-3', 'we-what-offer-3', 1, 'image/png', 15025, 'general/we-what-offer-3.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(89, 0, 'author', 'author', 2, 'image/png', 2775, 'accounts/author.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(90, 0, 'author2', 'author2', 2, 'image/png', 4211, 'accounts/author2.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(91, 0, 'author3', 'author3', 2, 'image/png', 2482, 'accounts/author3.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(92, 0, '404', '404', 3, 'image/png', 17884, 'icons/404.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(93, 0, 'bg-plan', 'bg-plan', 3, 'image/png', 2708, 'icons/bg-plan.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(94, 0, 'boat-circle', 'boat-circle', 3, 'image/jpeg', 29044, 'icons/boat-circle.jpg', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(95, 0, 'brand-identity', 'brand-identity', 3, 'image/png', 1802, 'icons/brand-identity.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(96, 0, 'building', 'building', 3, 'image/png', 529, 'icons/building.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(97, 0, 'business-strategy', 'business-strategy', 3, 'image/png', 1925, 'icons/business-strategy.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(98, 0, 'business', 'business', 3, 'image/png', 662, 'icons/business.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(99, 0, 'case-study', 'case-study', 3, 'image/png', 16153, 'icons/case-study.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(100, 0, 'certification', 'certification', 3, 'image/png', 481, 'icons/certification.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(101, 0, 'certify', 'certify', 3, 'image/png', 5006, 'icons/certify.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(102, 0, 'chart-1', 'chart-1', 3, 'image/png', 1305, 'icons/chart-1.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(103, 0, 'coming-soon', 'coming-soon', 3, 'image/png', 28613, 'icons/coming-soon.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(104, 0, 'conference', 'conference', 3, 'image/png', 505, 'icons/conference.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(105, 0, 'creation', 'creation', 3, 'image/png', 755, 'icons/creation.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(106, 0, 'cross-platform', 'cross-platform', 3, 'image/png', 2010, 'icons/cross-platform.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(107, 0, 'digital-marketing', 'digital-marketing', 3, 'image/png', 3631, 'icons/digital-marketing.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(108, 0, 'dispersal', 'dispersal', 3, 'image/png', 539, 'icons/dispersal.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(109, 0, 'document', 'document', 3, 'image/png', 2398, 'icons/document.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(110, 0, 'earth', 'earth', 3, 'image/png', 2308, 'icons/earth.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(111, 0, 'facebook', 'facebook', 3, 'image/png', 520, 'icons/facebook.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(112, 0, 'fly', 'fly', 3, 'image/png', 1014, 'icons/fly.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(113, 0, 'forums', 'forums', 3, 'image/png', 3885, 'icons/forums.png', '[]', '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(114, 0, 'free', 'free', 3, 'image/png', 1302, 'icons/free.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(115, 0, 'headphone', 'headphone', 3, 'image/png', 1556, 'icons/headphone.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(116, 0, 'icon1', 'icon1', 3, 'image/png', 1638, 'icons/icon1.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(117, 0, 'icon2', 'icon2', 3, 'image/png', 2524, 'icons/icon2.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(118, 0, 'icon3', 'icon3', 3, 'image/png', 1407, 'icons/icon3.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(119, 0, 'icon4', 'icon4', 3, 'image/png', 1895, 'icons/icon4.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(120, 0, 'icon5', 'icon5', 3, 'image/png', 1073, 'icons/icon5.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(121, 0, 'icon6', 'icon6', 3, 'image/png', 1954, 'icons/icon6.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(122, 0, 'icon7', 'icon7', 3, 'image/png', 1503, 'icons/icon7.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(123, 0, 'icon8', 'icon8', 3, 'image/png', 1739, 'icons/icon8.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(124, 0, 'identity', 'identity', 3, 'image/png', 420, 'icons/identity.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(125, 0, 'img1', 'img1', 3, 'image/png', 1525, 'icons/img1.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(126, 0, 'img2', 'img2', 3, 'image/png', 1565, 'icons/img2.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(127, 0, 'img3', 'img3', 3, 'image/png', 1533, 'icons/img3.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(128, 0, 'instagram', 'instagram', 3, 'image/png', 591, 'icons/instagram.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(129, 0, 'knowledge', 'knowledge', 3, 'image/png', 1160, 'icons/knowledge.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(130, 0, 'line', 'line', 3, 'image/png', 144, 'icons/line.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(131, 0, 'linkedin', 'linkedin', 3, 'image/png', 579, 'icons/linkedin.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(132, 0, 'money', 'money', 3, 'image/png', 3380, 'icons/money.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(133, 0, 'payment', 'payment', 3, 'image/png', 2599, 'icons/payment.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(134, 0, 'personal', 'personal', 3, 'image/png', 1093, 'icons/personal.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(135, 0, 'persuasion', 'persuasion', 3, 'image/png', 862, 'icons/persuasion.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(136, 0, 'phone', 'phone', 3, 'image/png', 1635, 'icons/phone.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(137, 0, 'report', 'report', 3, 'image/png', 4680, 'icons/report.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(138, 0, 'research', 'research', 3, 'image/png', 546, 'icons/research.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(139, 0, 'social-media', 'social-media', 3, 'image/png', 2207, 'icons/social-media.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(140, 0, 'social', 'social', 3, 'image/png', 2795, 'icons/social.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(141, 0, 'standard', 'standard', 3, 'image/png', 1743, 'icons/standard.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(142, 0, 'support', 'support', 3, 'image/png', 3150, 'icons/support.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(143, 0, 'sync', 'sync', 3, 'image/png', 8465, 'icons/sync.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(144, 0, 'trial-plan', 'trial-plan', 3, 'image/png', 1271, 'icons/trial-plan.png', '[]', '2023-11-08 01:55:00', '2023-11-08 01:55:00', NULL),
(145, 0, 'twitter', 'twitter', 3, 'image/png', 791, 'icons/twitter.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(146, 0, 'unlimited', 'unlimited', 3, 'image/png', 15292, 'icons/unlimited.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(147, 0, 'user', 'user', 3, 'image/png', 15493, 'icons/user.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(148, 0, 'we-do', 'we-do', 3, 'image/png', 15521, 'icons/we-do.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(149, 0, 'write', 'write', 3, 'image/png', 14653, 'icons/write.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(150, 0, 'favicon', 'favicon', 4, 'image/png', 2341, 'logo/favicon.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(151, 0, 'finger', 'finger', 4, 'image/png', 1922, 'logo/finger.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(152, 0, 'logo-circle', 'logo-circle', 4, 'image/png', 5514, 'logo/logo-circle.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(153, 0, 'logo-white', 'logo-white', 4, 'image/png', 7574, 'logo/logo-white.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL),
(154, 0, 'logo', 'logo', 4, 'image/png', 2365, 'logo/logo.png', '[]', '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'general', 'general', 0, '2023-11-08 01:54:51', '2023-11-08 01:54:51', NULL),
(2, 0, 'accounts', 'accounts', 0, '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(3, 0, 'icons', 'icons', 0, '2023-11-08 01:54:59', '2023-11-08 01:54:59', NULL),
(4, 0, 'logo', 'logo', 0, '2023-11-08 01:55:01', '2023-11-08 01:55:01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `meta_key`, `meta_value`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 'header_breadcrumb_style', '[\"default\"]', 22, 'Botble\\Page\\Models\\Page', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(2, 'header_breadcrumb_style', '[\"default\"]', 23, 'Botble\\Page\\Models\\Page', '2023-11-08 01:55:01', '2023-11-08 01:55:01');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2022_04_20_100851_add_index_to_media_table', 1),
(17, '2022_04_20_101046_add_index_to_menu_table', 1),
(18, '2022_07_10_034813_move_lang_folder_to_root', 1),
(19, '2022_08_04_051940_add_missing_column_expires_at', 1),
(20, '2022_09_01_000001_create_admin_notifications_tables', 1),
(21, '2022_10_14_024629_drop_column_is_featured', 1),
(22, '2022_11_18_063357_add_missing_timestamp_in_table_settings', 1),
(23, '2022_12_02_093615_update_slug_index_columns', 1),
(24, '2023_01_30_024431_add_alt_to_media_table', 1),
(25, '2023_02_16_042611_drop_table_password_resets', 1),
(26, '2023_04_23_005903_add_column_permissions_to_admin_notifications', 1),
(27, '2023_05_10_075124_drop_column_id_in_role_users_table', 1),
(28, '2023_08_03_041207_remove_unused_plugins', 1),
(29, '2023_08_06_070140_fix_shortcode_name', 1),
(30, '2019_06_24_211801_create_career_table', 2),
(31, '2023_07_25_072632_create_business_services_tables', 3),
(32, '2023_08_09_035520_activate_business_services_plugin', 1),
(33, '2023_08_10_030324_migrate_old_shortcodes', 1),
(34, '2023_08_21_090810_make_page_content_nullable', 1),
(35, '2023_09_14_021936_update_index_for_slugs_table', 1),
(36, '2023_08_11_060908_create_announcements_table', 4),
(37, '2015_06_29_025744_create_audit_history', 5),
(38, '2015_06_18_033822_create_blog_table', 6),
(39, '2021_02_16_092633_remove_default_value_for_author_type', 6),
(40, '2021_12_03_030600_create_blog_translations', 6),
(41, '2022_04_19_113923_add_index_to_table_posts', 6),
(42, '2023_08_29_074620_make_column_author_id_nullable', 6),
(43, '2016_06_17_091537_create_contacts_table', 7),
(44, '2020_03_05_041139_create_ecommerce_tables', 8),
(45, '2021_01_01_044147_ecommerce_create_flash_sale_table', 8),
(46, '2021_01_17_082713_add_column_is_featured_to_product_collections_table', 8),
(47, '2021_01_18_024333_add_zip_code_into_table_customer_addresses', 8),
(48, '2021_02_18_073505_update_table_ec_reviews', 8),
(49, '2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers', 8),
(50, '2021_03_10_025153_change_column_tax_amount', 8),
(51, '2021_03_20_033103_add_column_availability_to_table_ec_products', 8),
(52, '2021_04_28_074008_ecommerce_create_product_label_table', 8),
(53, '2021_05_31_173037_ecommerce_create_ec_products_translations', 8),
(54, '2021_08_17_105016_remove_column_currency_id_in_some_tables', 8),
(55, '2021_08_30_142128_add_images_column_to_ec_reviews_table', 8),
(56, '2021_10_04_030050_add_column_created_by_to_table_ec_products', 8),
(57, '2021_10_05_122616_add_status_column_to_ec_customers_table', 8),
(58, '2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses', 8),
(59, '2021_11_23_071403_correct_languages_for_product_variations', 8),
(60, '2021_11_28_031808_add_product_tags_translations', 8),
(61, '2021_12_01_031123_add_featured_image_to_ec_products', 8),
(62, '2022_01_01_033107_update_table_ec_shipments', 8),
(63, '2022_02_16_042457_improve_product_attribute_sets', 8),
(64, '2022_03_22_075758_correct_product_name', 8),
(65, '2022_04_19_113334_add_index_to_ec_products', 8),
(66, '2022_04_28_144405_remove_unused_table', 8),
(67, '2022_05_05_115015_create_ec_customer_recently_viewed_products_table', 8),
(68, '2022_05_18_143720_add_index_to_table_ec_product_categories', 8),
(69, '2022_06_16_095633_add_index_to_some_tables', 8),
(70, '2022_06_30_035148_create_order_referrals_table', 8),
(71, '2022_07_24_153815_add_completed_at_to_ec_orders_table', 8),
(72, '2022_08_14_032836_create_ec_order_returns_table', 8),
(73, '2022_08_14_033554_create_ec_order_return_items_table', 8),
(74, '2022_08_15_040324_add_billing_address', 8),
(75, '2022_08_30_091114_support_digital_products_table', 8),
(76, '2022_09_13_095744_create_options_table', 8),
(77, '2022_09_13_104347_create_option_value_table', 8),
(78, '2022_10_05_163518_alter_table_ec_order_product', 8),
(79, '2022_10_12_041517_create_invoices_table', 8),
(80, '2022_10_12_142226_update_orders_table', 8),
(81, '2022_10_13_024916_update_table_order_returns', 8),
(82, '2022_10_21_030830_update_columns_in_ec_shipments_table', 8),
(83, '2022_10_28_021046_update_columns_in_ec_shipments_table', 8),
(84, '2022_11_16_034522_update_type_column_in_ec_shipping_rules_table', 8),
(85, '2022_11_19_041643_add_ec_tax_product_table', 8),
(86, '2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table', 8),
(87, '2022_12_17_041532_fix_address_in_order_invoice', 8),
(88, '2022_12_26_070329_create_ec_product_views_table', 8),
(89, '2023_01_04_033051_fix_product_categories', 8),
(90, '2023_01_09_050400_add_ec_global_options_translations_table', 8),
(91, '2023_01_10_093754_add_missing_option_value_id', 8),
(92, '2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table', 8),
(93, '2023_01_26_021854_add_ec_customer_used_coupons_table', 8),
(94, '2023_02_08_015900_update_options_column_in_ec_order_product_table', 8),
(95, '2023_02_27_095752_remove_duplicate_reviews', 8),
(96, '2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table', 8),
(97, '2023_04_21_082427_create_ec_product_categorizables_table', 8),
(98, '2023_05_03_011331_add_missing_column_price_into_invoice_items_table', 8),
(99, '2023_05_17_025812_fix_invoice_issue', 8),
(100, '2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields', 8),
(101, '2023_05_27_144611_fix_exchange_rate_setting', 8),
(102, '2023_06_22_084331_add_generate_license_code_to_ec_products_table', 8),
(103, '2023_06_30_042512_create_ec_order_tax_information_table', 8),
(104, '2023_07_14_022724_remove_column_id_from_ec_product_collection_products', 8),
(105, '2023_08_09_012940_remove_column_status_in_ec_product_attributes', 8),
(106, '2023_08_15_064505_create_ec_tax_rules_table', 8),
(107, '2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable', 8),
(108, '2023_08_22_094114_drop_unique_for_barcode', 8),
(109, '2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table', 8),
(110, '2023_09_07_094312_add_index_to_product_sku_and_translations', 8),
(111, '2023_09_19_024955_create_discount_product_categories_table', 8),
(112, '2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table', 8),
(113, '2018_07_09_221238_create_faq_table', 9),
(114, '2021_12_03_082134_create_faq_translations', 9),
(115, '2016_10_03_032336_create_languages_table', 10),
(116, '2023_09_14_022423_add_index_for_language_table', 10),
(117, '2021_10_25_021023_fix-priority-load-for-language-advanced', 11),
(118, '2021_12_03_075608_create_page_translations', 11),
(119, '2023_07_06_011444_create_slug_translations_table', 11),
(120, '2019_11_18_061011_create_country_table', 12),
(121, '2021_12_03_084118_create_location_translations', 12),
(122, '2021_12_03_094518_migrate_old_location_data', 12),
(123, '2021_12_10_034440_switch_plugin_location_to_use_language_advanced', 12),
(124, '2022_01_16_085908_improve_plugin_location', 12),
(125, '2022_08_04_052122_delete_location_backup_tables', 12),
(126, '2023_04_23_061847_increase_state_translations_abbreviation_column', 12),
(127, '2023_07_26_041451_add_more_columns_to_location_table', 12),
(128, '2023_07_27_041451_add_more_columns_to_location_translation_table', 12),
(129, '2023_08_15_073307_drop_unique_in_states_cities_translations', 12),
(130, '2023_10_21_065016_make_state_id_in_table_cities_nullable', 12),
(131, '2017_10_24_154832_create_newsletter_table', 13),
(132, '2017_05_18_080441_create_payment_tables', 14),
(133, '2021_03_27_144913_add_customer_type_into_table_payments', 14),
(134, '2021_05_24_034720_make_column_currency_nullable', 14),
(135, '2021_08_09_161302_add_metadata_column_to_payments_table', 14),
(136, '2021_10_19_020859_update_metadata_field', 14),
(137, '2022_06_28_151901_activate_paypal_stripe_plugin', 14),
(138, '2022_07_07_153354_update_charge_id_in_table_payments', 14),
(139, '2022_11_02_092723_team_create_team_table', 15),
(140, '2018_07_09_214610_create_testimonial_table', 16),
(141, '2021_12_03_083642_create_testimonials_translations', 16),
(142, '2016_10_07_193005_create_translations_table', 17);

-- --------------------------------------------------------

--
-- Structure de la table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Homepage 1', '<div>[hero-banner title=\"The data layer between your {{ business }} and its potential.\" subtitle=\"Optimize write performance with a document data model that maps to your application’s access patterns. Meet a wide range of query requirements via a single query API that supports everything from simple lookups to complex processing pipelines for data analytics and transformations.\" banner_primary=\"general/hero-banner.png\" button_primary_label=\"Download App\" button_primary_url=\"/app\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\"][/hero-banner]</div><div>[featured-brands title=\"Loved By Developers, Trusted By Enterprises\" subtitle=\"We helped these brands turn online assessments into success stories. Join them. Elevate your testing.\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"yes\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"yes\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"yes\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"yes\" style=\"style-1\"][/featured-brands]</div><div>[services title=\"What We Offer\" subtitle=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" button_secondary_label=\"Learn more\" service_ids=\"1,2,3,4,5,6\" style=\"style-1\"][/services]</div><div>[intro-video title=\"Integrate with over 1,000 project management apps\" image=\"general/intro-video.png\" tag=\"Business\" youtube_video_url=\"https://www.youtube.com/watch?v=oRI37cOPBQQ\" icon_image=\"icons/bg-plan.png\"][/intro-video]</div><div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"icons/bg-plan.png\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"pricing\" style=\"style-1\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[faqs title=\"Frequently asked questions\" subtitle=\"Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help\" button_primary_label=\"Contact Us\" button_primary_url=\"contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"contact\" image=\"general/bg-faqs.png\" faq_category_ids=\"1,2,3,4\"][/faqs]</div><div>[testimonials title=\"What our customers are saying\" subtitle=\"Hear from our users who have saved thousands on their Startup and SaaS solution spend\" image=\"general/plants-1.png\" limit=\"4\"][/testimonials]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"blog\" type=\"featured\" limit=\"5\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(2, 'Homepage 2', '<div>[hero-banner title=\"Iori dashboard will help your payments fast and secure\" subtitle=\"Social media networks are open to all. Social media is typically used for social interaction and access to news and information, and decision making.\" banner_primary=\"general/banner.png\" button_secondary_label=\"Learn more\" platform_google_play_logo=\"general/appstore-btn.png\" platform_apple_store_logo=\"general/google-play-btn.png\" style=\"style-2\"][/hero-banner]</div><div>[featured-brands title=\"Loved By Developers, Trusted By Enterprises\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"yes\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"yes\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"yes\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"yes\" style=\"style-2\"][/featured-brands]</div><div>[why-choose-us title=\"See why we are trusted the world over\" subtitle=\"Why choose us?\" description=\"Necessary to deliver white glove, fully managed campaigns that surpass industry benchmarks.Take your career to next level. Apply to our team and see what we can do together. You’re good enough. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature Id pro doctus mediocrem erroribus, diam nostro sed cu. Ea pri graeco tritani partiendo. Omittantur No tale choro fastidii his, pri cu epicuri perpetua. Enim dictas omittantur et duo, vocent lucilius quaestio mea ex. Ex illum officiis id\" button_primary_label=\"Download App\" button_primary_url=\"/app\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" quantity=\"4\" title_1=\"Social followers\" data_1=\"469k\" title_2=\" Happy Clients\" data_2=\"5000+\" color_2=\"bg-brand-2\" title_3=\" Project Done\" data_3=\"756+\" color_3=\"bg-2\" title_4=\"Client Satisfaction\" data_4=\"100%\" color_4=\"bg-4\"][/why-choose-us]</div><div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"logo/finger.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"/pricing\" style=\"style-1\" package_ids=\"1,2,4\"][/pricing-plan]</div><div>[testimonials title=\"What our customers are saying\" subtitle=\"Hear from our users who have saved thousands on their Startup and SaaS solution spend\" image=\"general/customer.png\" limit=\"4\" style=\"style-2\"][/testimonials]</div><div>[get-in-touch title=\"Want to talk to a marketing expert?\" subtitle=\"Get In Touch\" description=\"You need to create an account to find the best and preferred job. lorem Ipsum is simply dummy text of the printing and typesetting industry the standard dummy text ever took.\" image=\"general/img-marketing.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\"][/get-in-touch]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aeneas velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div><div>[how-to-start title=\"Bring your target users together on social media\" subtitle=\"How to start ?\" image=\"general/banner-how-to-start.png\" image_icon_primary=\"icons/certify.png\" image_icon_secondary=\"icons/fly.png\" quantity=\"3\" title_1=\"Create an account\" description_1=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" title_2=\"Build your founding team\" description_2=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" title_3=\"Launch and Scale\" description_3=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\"][/how-to-start]</div><div>[marketing-features title=\"Take your social media marketing prowess to the next level\" quantity=\"6\" title_1=\"Cross-Platform\" icon_image_1=\"icons/cross-platform.png\" description_1=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_1=\"Learn More\" url_1=\"/contact\" type_1=\"enterprise\" title_2=\"Social Media\" icon_image_2=\"icons/cross-platform.png\" description_2=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe\" label_2=\"Learn More\" url_2=\"/contact\" type_2=\"personal\" title_3=\"Brand Identity\" icon_image_3=\"icons/social-media.png\" description_3=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_3=\"Learn More\" url_3=\"/contact\" type_3=\"enterprise\" title_4=\"Customer Service\" icon_image_4=\"icons/trial-plan.png\" description_4=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_4=\"Learn More\" url_4=\"/contact\" type_4=\"personal\" title_5=\"Social advertising\" icon_image_5=\"icons/standard.png\" description_5=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_5=\"Learn More\" url_5=\"/contact\" type_5=\"personal\" title_6=\"Content creation\" icon_image_6=\"icons/business.png\" description_6=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_6=\"Learn More\" url_6=\"/contact\" type_6=\"enterprise\"][/marketing-features]</div><div>[what-we-do title=\"We facilitate the creation of strategy and design\" subtitle=\"What We Do, What You Get\" button_primary_label=\"Download App\" button_primary_url=\"/contact\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" quantity=\"5\" title_1=\"Smart Installation Tools\" icon_image_1=\"icons/we-do.png\" description_1=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_1=\"Learn More\" url_1=\"/contact\" title_2=\"Manage budgets and resources\" icon_image_2=\"icons/case-study.png\" description_2=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_2=\"Learn More\" url_2=\"/contact\" title_3=\" Employee Assessments\" icon_image_3=\"icons/write.png\" description_3=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_3=\"Learn More\" url_3=\"/contact\" title_4=\" Collaborative to the core.\" icon_image_4=\"icons/user.png\" description_4=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_4=\"Learn More\" url_4=\"/contact\" title_5=\" Unlimited ways to work\" icon_image_5=\"icons/unlimited.png\" description_5=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_5=\"Learn More\" url_5=\"/contact\"][/what-we-do]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(3, 'Homepage 3', '<div>[hero-banner title=\"Grow your online business now\" subtitle=\"Get Started\" banner_primary=\"general/banner-homepage-3.png\" banner_image_1=\"general/chart2.png\" banner_image_2=\"general/chart1.png\" banner_image_3=\"general/chart.png\" button_primary_label=\"Play Video\" button_primary_url=\"contact\" style=\"style-3\"][/hero-banner]</div><div>[featured-brands quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"yes\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"yes\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"yes\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"yes\" style=\"style-3\"][/featured-brands]</div><div>[what-we-do title=\"We facilitate the creation of strategy and design\" subtitle=\"What We Do, What You Get\" button_primary_label=\"Download App\" button_primary_url=\"/contact\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" quantity=\"5\" title_1=\"Smart Installation Tools\" icon_image_1=\"icons/we-do.png\" description_1=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_1=\"Learn More\" url_1=\"/contact\" title_2=\"Manage budgets and resources\" icon_image_2=\"icons/case-study.png\" description_2=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_2=\"Learn More\" url_2=\"/contact\" title_3=\" Employee Assessments\" icon_image_3=\"icons/write.png\" description_3=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_3=\"Learn More\" url_3=\"/contact\" title_4=\" Collaborative to the core.\" icon_image_4=\"icons/user.png\" description_4=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_4=\"Learn More\" url_4=\"/contact\" title_5=\" Unlimited ways to work\" icon_image_5=\"icons/unlimited.png\" description_5=\"Your site is not complete with only landings. Get essential inner pages using our ready demos.\" label_5=\"Learn More\" url_5=\"/contact\"][/what-we-do]</div><div>[site-statistics title=\"See why we are trusted the world over\" quantity=\"4\" title_1=\"Social followers\" data_1=\"469\" unit_1=\"K\" title_2=\"Happy Clients\" data_2=\"255\" unit_2=\"K+\" title_3=\"Project Done\" data_3=\"756\" unit_3=\"K\" title_4=\"Global branch\" data_4=\"120\"][/site-statistics]</div><div>[how-it-work title=\"Grow your online business now\" subtitle=\"How it work\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go. \" button_primary_label=\"Download App\" button_primary_url=\"/app\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" quantity=\"8\" title_1=\"Cross-Platform\" description_1=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" icon_image_1=\"icons/cross-platform.png\" label_1=\"Learn More\" url_1=\"/contact\" display_1=\"show_full\" title_2=\"Social Media\" description_2=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" icon_image_2=\"icons/social-media.png\" label_2=\"Learn More\" url_2=\"/contact\" display_2=\"show_full\" title_3=\"Certification\" icon_image_3=\"icons/certification.png\" url_3=\"/contact\" display_3=\"show_title\" title_4=\"Conference\" icon_image_4=\"icons/conference.png\" url_4=\"/contact\" display_4=\"show_title\" title_5=\"Research\" icon_image_5=\"icons/research.png\" url_5=\"/contact\" display_5=\"show_title\" title_6=\"Dispersal\" icon_image_6=\"icons/cross-platform.png\" url_6=\"/contact\" display_6=\"show_title\" title_7=\"Enterprise\" icon_image_7=\"icons/research.png\" url_7=\"/contact\" display_7=\"show_title\" title_8=\"Team Building\" icon_image_8=\"general/img-marketing.png\" url_8=\"/contact\" display_8=\"show_title\"][/how-it-work]</div><div>[testimonials title=\"What our clients say about us\" subtitle=\"Testimonials\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go.\" limit=\"4\" style=\"style-3\"][/testimonials]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(4, 'Homepage 4', '<div>[hero-banner title=\"Start for free Pay as you Grow\" subtitle=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss.\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" platform_google_play_logo=\"general/google.png\" platform_google_play_url=\"https://play.google.com/store/games\" platform_apple_store_logo=\"general/apple.png\" platform_apple_store_url=\"https://www.apple.com/vn/app-store/\" style=\"style-5\"][/hero-banner]</div><div>[featured-brands title=\"Loved By Developers Trusted By Enterprises\" subtitle=\"We helped these brands turn online assessments into success stories.\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"yes\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"yes\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"yes\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"yes\" style=\"style-4\"][/featured-brands]</div><div>[branding-block title=\"Build your brand and reach out to social followers\" subtitle=\"Branding\" description=\"Sharing content online allows you to craft an online persona that reflects your personal values and professional skills. Even if you only use social media occasionally, what you create, share or react to feeds into this public narrative. How you conduct yourself online is now just as important as your behavior offline especially when it comes to your digital marketing career.\" image=\"general/follower.png\" logo=\"icons/certify.png\" button_primary_label=\"Download App\" button_primary_url=\"https://www.apple.com/sg/app-store/\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" quantity=\"6\" title_1=\"Send & Schedule Posts\" title_2=\"Push Notification\" title_3=\"Online Visitors\" title_4=\"Live Chat Request\" title_5=\"Create fully integrated campaigns\" title_6=\"Directly send or schedule posts\"][/branding-block]</div><div>[site-statistics title=\"See why we are trusted the world over\" quantity=\"4\" title_1=\"Social followers\" data_1=\"469\" unit_1=\"K\" title_2=\"Happy Clients\" data_2=\"255\" unit_2=\"K+\" title_3=\"Project Done\" data_3=\"756\" unit_3=\"K\" title_4=\"Global branch\" data_4=\"120\"][/site-statistics]</div><div>[services title=\"What We Offer\" subtitle=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" button_primary_label=\"Download App\" button_primary_url=\"https://www.apple.com/sg/app-store/\" button_secondary_label=\"Learn more\" button_secondary_url=\"contact\" service_ids=\"1,2,3,4,5,6\" style=\"style-2\"][/services]</div><div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"icons/bg-plan.png\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"pricing\" style=\"style-1\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[faqs title=\"Frequently asked questions\" subtitle=\"Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help\" button_primary_label=\"Contact Us\" button_primary_url=\"contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"contact\" image=\"general/bg-faqs.png\" faq_category_ids=\"1,2,3,4\"][/faqs]</div><div>[intro-video title=\"Integrate with over 1,000 project management apps\" subtitle=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \" image=\"general/img-video-2.png\" tag=\"Business\" youtube_video_url=\"https://www.youtube.com/watch?v=oRI37cOPBQQ\" icon_image=\"icons/bg-plan.png\" style=\"style-2\"][/intro-video]</div><div>[testimonials title=\"What our customers are saying\" subtitle=\"Hear from our users who have saved thousands on their Startup and SaaS solution spend\" image=\"general/customer.png\" limit=\"4\" style=\"style-2\"][/testimonials]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(5, 'Homepage 5', '<div>[hero-banner title=\"#1 Intelligence Software to Accelerate Your SaaS Sales\" subtitle=\"Great sales platform\" description=\"We’re lively, not corporate. We have the energy and boldness of a startup and the expertise and pragmatism of a scale-up. All in one place.\" top_description=\"Discover powerful features to boost your productivit. You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.\" banner_primary=\"general/banner-homepage-5.png\" quantity=\"2\" title_1=\"Connected\" url_1=\"/contact\" image_1=\"icons/free.png\" description_1=\"We come together wherever we are – across time zones, regions, offices and screens. You will receive support from your teammates anytime and anywhere.\" title_2=\"Flexible\" url_2=\"/contact\" image_2=\"icons/identity.png\" description_2=\"We believe in your freedom to work when and how you work best, to help us all thrive. Only freedom and independent work can bring out the best in you.\" style=\"style-6\"][/hero-banner]</div><div>[featured-brands quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"yes\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"yes\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"yes\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"yes\" style=\"style-5\"][/featured-brands]</div><div>[marketing-features title=\"Take your social media marketing prowess to the next level\" style=\"style-2\" quantity=\"6\" title_1=\"Cross-Platform\" icon_image_1=\"icons/cross-platform.png\" description_1=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_1=\"Learn More\" url_1=\"/contact\" type_1=\"enterprise\" title_2=\"Social Media\" icon_image_2=\"icons/cross-platform.png\" description_2=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe\" label_2=\"Learn More\" url_2=\"/contact\" type_2=\"personal\" title_3=\"Brand Identity\" icon_image_3=\"icons/social-media.png\" description_3=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_3=\"Learn More\" url_3=\"/contact\" type_3=\"enterprise\" title_4=\"Customer Service\" icon_image_4=\"icons/trial-plan.png\" description_4=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_4=\"Learn More\" url_4=\"/contact\" type_4=\"personal\" title_5=\"Social advertising\" icon_image_5=\"icons/standard.png\" description_5=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_5=\"Learn More\" url_5=\"/contact\" type_5=\"personal\" title_6=\"Content creation\" icon_image_6=\"icons/business.png\" description_6=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_6=\"Learn More\" url_6=\"/contact\" type_6=\"enterprise\"][/marketing-features]</div><div>[business-strategy title=\"Integrate with over 1,000 project management apps\" subtitle=\"Business\" image=\"general/img-project.png\" icon_image=\"general/chart-homepage-5.png\" description=\"Business\" quantity=\"6\" title_1=\"Happy Clients\" title_2=\"Project Done\" title_3=\"Global branch\" title_4=\"Create task dependencies\" title_5=\"hare files, discuss\" title_6=\"Track time spent on each project\" counter_number_1=\"17\" counter_label_1=\"Happy Clients\" counter_number_2=\"516\" counter_label_2=\"Project Done\" counter_number_3=\"68\" counter_label_3=\"Global branch\"][/business-strategy]</div><div>[grow-business title=\"Grow your online business now\" subtitle=\"Business\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go\" image=\"general/img-project2.png\" icon_image=\"logo/finger.png\" button_primary_label=\"Download App\" button_primary_url=\"/app\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\"][/grow-business]</div><div>[site-statistics title=\"See why we are trusted the world over\" quantity=\"4\" title_1=\"Social followers\" data_1=\"469\" unit_1=\"K\" title_2=\"Happy Clients\" data_2=\"255\" unit_2=\"K+\" title_3=\"Project Done\" data_3=\"756\" unit_3=\"K\" title_4=\"Global branch\" data_4=\"120\"][/site-statistics]</div><div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"general/icons/bg-plan.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"/pricing\" style=\"style-2\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"blog\" type=\"featured\" limit=\"5\"][/from-our-blog]</div><div>[featured-services quantity=\"3\" title_1=\"Knowledge Base\" description_1=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_1=\"icons/document.png\" action_1=\"/contact\" label_1=\"Get Started\" title_2=\"Community Forums\" description_2=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_2=\"icons/forums.png\" action_2=\"/contact\" label_2=\"Get Started\" title_3=\"Documentation\" description_3=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_3=\"icons/knowledge.png\" action_3=\"/contact\" label_3=\"Get Started\"][/featured-services]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(6, 'Homepage 6', '<div>[hero-banner title=\"Innovative Solution to Move Your Business Forward\" subtitle=\"Think. Creative. Solve\" description=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss.\" banner_primary=\"general/banner-homepage-6.png\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" platform_google_play_logo=\"general/google.png\" platform_google_play_url=\"https://play.google.com/store\" platform_apple_store_logo=\"general/apple.png\" platform_apple_store_url=\"https://www.apple.com/store\" quantity=\"2\" image_1=\"general/testimonial.png\" image_2=\"general/testimonial1.png\" style=\"style-7\"][/hero-banner]</div><div>[featured-brands quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"yes\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"yes\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"yes\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"yes\" style=\"style-5\"][/featured-brands]</div><div>[connect-with-us title=\"Crafting human connection through digital experience\" description=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" button_label=\"Contact Us\" button_url=\"/contact\" quantity=\"3\" title_1=\"Cross Platform\" image_1=\"general/connect-with-us-1.png\" description_1=\"Aut architecto consequatur sit error nemo sed dolorum suscipit 33 impedit dignissimos ut velit blanditiis qui quos magni id dolore dignissimos. Sit ipsa consectetur et sint harum et dicta consequuntur id cupiditate perferendis qui quisquam enim. Vel autem illo id error excepturi est dolorum voluptas qui maxime consequatur et culpa quibusdam in iusto vero sit amet Quis.\" title_2=\"Cross Platform\" image_2=\"general/connect-with-us-2.png\" description_2=\"Vel tenetur officiis ab reiciendis dolor aut quae doloremque est ipsum natus et consequatur animi aut sunt dolores ut quasi rerum. Aut velit velit id quasi velit eum reiciendis laudantium quo galisum incidunt aut velit animi hic temporibus blanditiis sit odit iure. Eum laborum dolores ea molestias fuga qui temporibus accusantium qui soluta aliquid ab vero soluta.\" title_3=\"Cross Platform\" image_3=\"general/connect-with-us-3.png\" description_3=\"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature Id pro doctus mediocrem erroribus, diam nostro sed cu. Ea pri graeco tritani partiendo. Omittantur No tale choro fastidii his, pri cu epicuri perpetua. Enim dictas omittantur et duo, vocent lucilius quaestio mea ex. Ex illum officiis id.\"][/connect-with-us]</div><div>[services title=\"What We Offer\" subtitle=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" button_primary_label=\"Download App\" button_primary_url=\"https://www.apple.com/sg/app-store/\" button_secondary_label=\"Learn more\" button_secondary_url=\"contact\" service_ids=\"1,2,3,4,5,6\" style=\"style-3\"][/services]</div><div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"icons/bg-plan.png\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"pricing\" style=\"style-1\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[get-in-touch title=\"Want to talk to a marketing expert?\" subtitle=\"Get In Touch\" description=\"You need to create an account to find the best and preferred job. lorem Ipsum is simply dummy text of the printing and typesetting industry the standard dummy text ever took.\" image=\"general/img-marketing.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\"][/get-in-touch]</div><div>[faqs title=\"Frequently asked questions\" subtitle=\"Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help\" faq_category_ids=\"1,2,3,4\" style=\"style-2\" quantity=\"3\" image_1=\"accounts/author.png\" image_2=\"accounts/author2.png\" image_3=\"accounts/author3.png\"][/faqs]</div><div>[featured-services quantity=\"3\" title_1=\"Knowledge Base\" description_1=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_1=\"icons/knowledge.png\" action_1=\"/contact\" label_1=\"Get Started\" title_2=\"Community Forums\" description_2=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_2=\"icons/forums.png\" action_2=\"/contact\" label_2=\"Get Started\" title_3=\"Documentation\" description_3=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_3=\"icons/document.png\" action_3=\"/contact\" label_3=\"Get Started\"][/featured-services]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(7, 'Homepage 7', '<div>[hero-banner title=\"We take care of your business to grow\" subtitle=\"Think. Creative. Solve\" description=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss.\" customer_ids=\"2,5\" customer_description=\"Join thousands of users in using the iori platform!\" quantity=\"6\" image_1=\"general/banner-homepage-7-1.png\" image_2=\"general/banner-homepage-7-2.png\" image_3=\"general/banner-homepage-7-3.png\" image_4=\"general/banner-homepage-7-4.png\" image_5=\"general/banner-homepage-7-5.png\" image_6=\"general/banner-homepage-7-6.png\" style=\"style-8\"][/hero-banner]</div><div>[featured-brands-with-counter title=\"See why we are trusted the world over\" quantity=\"6,6\" number_1=\"753\" name_1=\"Project Done\" number_2=\"100\" name_2=\"Global branch\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/4.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/6.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"yes\" title_5=\"Reedelsevier\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"yes\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"yes\"][/featured-brands-with-counter]</div><div>[technology-block block_left_title=\"Financial Management\" block_left_description=\"Track, manage, and control your expenses. The only financial management tool you’ll ever need.\" google_play_logo=\"general/google.png\" google_play_url=\"https://play.google.com/store\" apple_store_logo=\"general/apple.png\" apple_store_url=\"https://www.apple.com/store\" block_left_image=\"general/img-financial.png\" block_right_title=\"Automated Platform\" block_right_description=\"Synchronize and automate all your business in the cloud. Save time and effort, enjoy great vacations.\" button_label=\"Get Started Now\" button_url=\"/contact\" block_right_image=\"general/automated.png\"][/technology-block]</div><div>[how-to-start title=\"Bring your target users together on social media\" subtitle=\"IORI Business Platform\" image=\"general/banner-how-to-start.png\" image_icon_primary=\"icons/certify.png\" image_icon_secondary=\"icons/fly.png\" style=\"style-2\" quantity=\"3\" title_1=\"Create an account\" description_1=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" title_2=\"Build your founding team\" description_2=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" title_3=\"Launch and Scale\" description_3=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\"][/how-to-start]</div><div>[branding-block title=\"Business can also be simple\" subtitle=\"Automatic Tools\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go.\" image=\"general/branding-image.png\" logo=\"general/testimonial1.png\" button_primary_label=\"Download App\" button_primary_url=\"https://play.google.com/store\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" counter_title=\"Happy Clients\" counter_data=\"25\" counter_unit=\"K+\" quantity=\"6\" title_1=\"Task tracking\" title_2=\"Task visualization\" title_3=\"Meet deadlines faster\" title_4=\"Create task dependencies\" title_5=\"hare files, discuss\" title_6=\"Track time spent on each project\" style=\"style-2\"][/branding-block]</div><div>[featured-services quantity=\"3\" title_1=\"Payment\" description_1=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_1=\"icons/payment.png\" action_1=\"/contact\" label_1=\"Learn More\" title_2=\"Save money\" description_2=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_2=\"icons/money.png\" action_2=\"/contact\" label_2=\"Learn More\" title_3=\"Quick support\" description_3=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_3=\"icons/support.png\" action_3=\"/contact\" label_3=\"Learn More\" style=\"style-2\"][/featured-services]</div><div>[teams title=\"Meet the amazing team behind Iori\" subtitle=\"Our leadership team\" team_ids=\"1,2,3,5\"][/teams]</div><div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"icons/bg-plan.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"/pricing\" style=\"style-2\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[testimonials title=\"What our loving users are saying about us\" limit=\"5\" style=\"style-5\"][/testimonials]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(8, 'Homepage 8', '<div>[banner-hero-with-teams title=\"Think. Creative. Solve\" subtitle=\"Innovative Solution to Move Your Business Forward\" description=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss.\" google_play_logo=\"general/google.png\" google_play_url=\"https://play.google.com/store\" apple_store_logo=\"general/apple.png\" apple_store_url=\"https://www.apple.com/store\" team_ids=\"1,2,3,4,5\"][/banner-hero-with-teams]</div><div>[why-using-your-app title=\"Our app is great for individuals, startups and enterprises. It have never been easier to manage your finances\" subtitle=\"Why using our app\" description=\"Eos eveniet nesciunt et accusamus suscipit est magnam consequatur aut quisquam perferendis a reprehenderit quis aut voluptatem repellat est beatae reiciendis? Cum omnis corrupti cum incidunt veritatis vel libero provident aut reiciendis animi ut quod quaerat et velit animi et omnis illo. Sit quae harum eos incidunt sequi eum iste fugit ex omnis aliquam a explicabo quam.\" image_1=\"general/phone1.png\" image_2=\"general/phone2.png\" testimonial_id=\"1\"][/why-using-your-app]</div><div>[featured-brands title=\"Loved By Developers, Trusted By Enterprises\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-2\"][/featured-brands]</div><div>[business-statistics title=\"Our app is great for individuals, startups and enterprises. It have never been easier to manage your finances\" subtitle=\"Why using our app\" description=\"Eos eveniet nesciunt et accusamus suscipit est magnam consequatur aut quisquam perferendis a reprehenderit quis aut voluptatem repellat est beatae reiciendis? Cum omnis corrupti cum incidunt veritatis vel libero provident aut reiciendis animi ut quod quaerat et velit animi et omnis illo. Sit quae harum eos incidunt sequi eum iste fugit ex omnis aliquam a explicabo quam.\" image_1=\"general/chart.png\" image_2=\"general/chart1.png\" image_3=\"general/chart2.png\" testimonial_ids=\"1,3\" quantity=\"3\" title_1=\"Project Done\" data_1=\"592\" unit_1=\"+\" title_2=\"Social followers\" data_2=\"242\" unit_2=\"K\" title_3=\"Happy Clients\" data_3=\"12\" unit_3=\"K+\"][/business-statistics]</div><div>[everything-will-become-one title=\"Everything will become One\" subtitle=\"Iori Platformlets you take control of your money, balance your income and expenses, and understand where your money goes.\" image=\"general/phone-app.png\" quantity=\"8\" title_1=\"Total control\" image_1=\"icons/icon1.png\" description_1=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\" title_2=\"Rapid experimentation\" image_2=\"icons/icon2.png\" description_2=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\" title_3=\"Secure transfer\" image_3=\"icons/icon3.png\" description_3=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\" title_4=\"Activity statistics\" image_4=\"icons/icon4.png\" description_4=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\" title_5=\"Track your spending\" image_5=\"icons/icon5.png\" description_5=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\" title_6=\"Fast Response\" image_6=\"icons/icon6.png\" description_6=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\" title_7=\"AI automation\" image_7=\"icons/icon7.png\" description_7=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\" title_8=\"Budget that works\" image_8=\"icons/icon8.png\" description_8=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada felis eget finibus placerat. Aliquam sit amet vestibulum felis, sit amet porta neque\"][/everything-will-become-one]</div><div>[featured-services title=\"Why You Should Consider Installing\" subtitle=\"We’re lively, not corporate. We have the energy and boldness of a startup and the expertise and pragmatism of a scale-up. All in one place.\" quantity=\"4\" title_1=\"Connected\" description_1=\"We come together wherever we are – across time zones, regions, offices and screens. You will receive support from your teammates anytime and anywhere.\" image_1=\"icons/free.png\" action_1=\"/contact\" title_2=\"Inclusive\" description_2=\"Our teams reflect the rich diversity of our world, with equitable access to opportunity for everyone. No matter where you come from\" image_2=\"icons/cross-platform.png\" action_2=\"/contact\" title_3=\"Flexible\" description_3=\"We believe in your freedom to work when and how you work best, to help us all thrive. Only freedom and independent work can bring out the best in you.\" image_3=\"icons/identity.png\" action_3=\"/contact\" title_4=\"Persuasion\" description_4=\"Knowing that there is real value to be gained from helping people to simplify whatever it is that they do and bring.\" image_4=\"icons/persuasion.png\" action_4=\"/contact\" style=\"style-3\"][/featured-services]</div><div>[testimonials title=\"What our customers are saying\" subtitle=\"Hear from our users who have saved thousands on their Startup and SaaS solution spend.\" limit=\"5\" style=\"style-6\"][/testimonials]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01');
INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Homepage 9', '<div>[hero-banner title=\"Promotes your business no matter what you do\" subtitle=\"Get Started\" youtube_video_url=\"https://www.youtube.com/watch?v=v2qeqkKgw7U\" description=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss. banner_primary=\"general/banner-homepage-9.png\" button_youtube_label=\"Play video\" customer_ids=\"2,4,5,7,9\" customer_description=\"Join thousands of users in using the iori platform!\" quantity=\"3\" title_1=\"Unlimited design & dev requests\" title_2=\"No Card. No Contract. Cancel anytime\" title_3=\"Monthly flat-rate. Support 24/7\" style=\"style-9\"][/hero-banner]</div><div>[technology-block title=\"Crafting human connection through digital experience\" description=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" block_left_title=\"Social Media Platform\" block_left_description=\"Manage your media channels professionally and efficiently. Real-time and automatic reporting system.\" google_play_logo=\"general/google.png\" google_play_url=\"https://play.google.com/store\" apple_store_logo=\"general/apple.png\" apple_store_url=\"https://www.apple.com/vn/app-store/\" block_left_image=\"general/social-homepage.png\" block_right_title=\"Automated Platform\" block_right_description=\"Synchronize and automate all your business in the cloud. Save time and effort, enjoy great vacations.\" button_label=\"Get Started Now\" button_url=\"/contact\" block_right_image=\"general/platform-social.png\"][/technology-block]</div><div>[branding-block title=\"Business can also be simple\" subtitle=\"Automatic Tools\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go.\" image=\"general/image-branding.png\" logo=\"general/testimonial.png\" button_primary_label=\"Help Center\" button_primary_url=\"/contact\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" counter_title=\"Happy Clients\" counter_data=\"25\" counter_unit=\"K+\" quantity=\"6\" title_1=\"Task tracking\" title_2=\"Task visualization\" title_3=\"Meet deadlines faster\" title_4=\"Create task dependencies\" title_5=\"hare files, discuss\" title_6=\"Track time spent on each project\" style=\"style-3\"][/branding-block]</div><div>[marketing-features title=\"Take your social media marketing prowess to the next level\" quantity=\"6\" title_1=\"Cross-Platform\" icon_image_1=\"icons/cross-platform.png\" description_1=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_1=\"Learn More\" url_1=\"/contact\" type_1=\"enterprise\" title_2=\"Social Media\" icon_image_2=\"icons/cross-platform.png\" description_2=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe\" label_2=\"Learn More\" url_2=\"/contact\" type_2=\"personal\" title_3=\"Brand Identity\" icon_image_3=\"icons/social-media.png\" description_3=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_3=\"Learn More\" url_3=\"/contact\" type_3=\"enterprise\" title_4=\"Customer Service\" icon_image_4=\"icons/trial-plan.png\" description_4=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_4=\"Learn More\" url_4=\"/contact\" type_4=\"personal\" title_5=\"Social advertising\" icon_image_5=\"icons/standard.png\" description_5=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_5=\"Learn More\" url_5=\"/contact\" type_5=\"personal\" title_6=\"Content creation\" icon_image_6=\"icons/business.png\" description_6=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" label_6=\"Learn More\" url_6=\"/contact\" type_6=\"enterprise\"][/marketing-features]</div><div>[featured-brands title=\"Loved By Developers, Trusted By Enterprises\" subtitle=\"We helped these brands turn online assessments into success stories. Join them. Elevate your testing.\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-6\"][/featured-brands]</div><div>[banner-with-newsletter-form title=\"Start for free Pay as you Grow\" subtitle=\"Get Started\" description=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss.\" show_newsletter_form=\"0,1\" subtitle_platform=\"Available on\" google_play_logo=\"general/google.png\" google_play_url=\"https://play.google.com/store\" apple_store_logo=\"general/apple.png\" apple_store_url=\"https://www.apple.com/store\" button_url=\"/contact\" button_label=\"Learn more\"][/banner-with-newsletter-form]</div><div>[faqs title=\"Frequently asked questions\" subtitle=\"Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help\" faq_category_ids=\"1,2,3,4\" style=\"style-3\" quantity=\"1\"][/faqs]</div><div>[featured-services quantity=\"3\" title_1=\"Knowledge Base\" description_1=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_1=\"icons/knowledge.png\" action_1=\"/contact\" label_1=\"Get Started\" title_2=\"Community Forums\" description_2=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_2=\"icons/forums.png\" action_2=\"/contact\" label_2=\"Get Started\" title_3=\"Documentation\" description_3=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_3=\"icons/document.png\" action_3=\"/contact\" label_3=\"Get Started\"][/featured-services]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(10, 'Homepage 10', '<div>[hero-banner-with-site-statistics title=\"We Are Leading Digital University\" description=\"Enable highly motivating non-cash micropayments and offer in-demand prepaid solutions – with a single connection.\" banner_image=\"general/banner-homepage-10.png\" button_primary_url=\"https://play.google.com/store\" button_primary_label=\"Download App\" button_secondary_url=\"/contact\" button_secondary_label=\"Lean More\" quantity=\"4\" title_1=\"Social followers\" data_1=\"469\" unit_1=\"K\" title_2=\"Happy Clients\" data_2=\"25\" unit_2=\"K+\" title_3=\"Project Done\" data_3=\"756\" unit_3=\"+\" title_4=\"Global branch\" data_4=\"100\" unit_4=\"+\"][/hero-banner-with-site-statistics]</div><div>[explore-network title=\"Ready to capture every wonderful moment\" subtitle=\"EXPLORE NETWORK\" quantity=\"4\" key_1=\"Digital Cameras\" title_1=\" Integrate with over 1,000 project management apps\" subtitle_1=\"Business\" description_1=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book\" image_1=\"general/img-tab-1.png\" checklists_1=\"Task tracking,Create task dependencies,Task visualization,hare files, discuss\" key_2=\"Mirrorless Camera\" title_2=\"Integrate with over 1,000 project management apps\" subtitle_2=\"Business\" description_2=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book\" image_2=\"general/img-tab-2.png\" checklists_2=\"Task tracking,Create task dependencies,Task visualization\" key_3=\"Travel Camera\" title_3=\"Integrate with over 1,000 project management apps\" subtitle_3=\"Business\" description_3=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book\" image_3=\"general/img-tab-3.png\" checklists_3=\"Task tracking,Create task dependencies,Task visualization\" key_4=\"Camera Flashes\" title_4=\"Integrate with over 1,000 project management apps\" subtitle_4=\"Business\" description_4=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book\" image_4=\"general/img-tab-4.png\" checklists_4=\"Task tracking,Create task dependencies,Task visualization\"][/explore-network]</div><div>[featured-brands title=\"Loved By Developers, Trusted By Enterprises\" subtitle=\"We helped these brands turn online assessments into success stories. Join them. Elevate your testing.\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-5\"][/featured-brands]</div><div>[branding-block title=\"Build your brand and reach out to social followers\" subtitle=\"Branding\" description=\"Sharing content online allows you to craft an online persona that reflects your personal values and professional skills. Even if you only use social media occasionally, what you create, share or react to feeds into this public narrative. How you conduct yourself online is now just as important as your behavior offline especially when it comes to your digital marketing career.\" image=\"general/branding-img-1.png\" logo=\"general/branding-img-2.png\" button_primary_label=\"Download App\" button_primary_url=\"https://play.google.com/store\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" quantity=\"6\" title_1=\"Send & Schedule Posts\" title_2=\"Send & Schedule Posts\" title_3=\"Create fully integrated campaigns\" title_4=\"Push Notification\" title_5=\"Online Visitors\" title_6=\"Directly send or schedule posts\" style=\"style-4\"][/branding-block]</div><div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"icons/bg-plan.png\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"pricing\" style=\"style-1\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[testimonials title=\"What our customers are saying\" subtitle=\"Hear from our users who have saved thousands on their Startup and SaaS solution spend\" image=\"general/customer.png\" limit=\"4\" style=\"style-2\"][/testimonials]</div><div>[intro-video title=\"Integrate with over 1,000 project management apps\" image=\"general/intro-video.png\" tag=\"Business\" youtube_video_url=\"https://www.youtube.com/watch?v=oRI37cOPBQQ\" icon_image=\"icons/bg-plan.png\"][/intro-video]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(11, 'Homepage 11', '<div>[banner-slider google_play_logo=\"general/google.png\" google_play_url=\"https://play.google.com/store\" apple_store_logo=\"general/apple.png\" apple_store_url=\"https://www.apple.com/store\" quantity=\"3\" title_1=\"Bring your target users together on social media\" description_1=\"Duis justo nulla, pulvinar at dolor dapibus, finibus cursus massa. Praesent quam diam, faucibus tristique enim in, rhoncus aliquam lorem. Vestibulum vestibulum pellentesque nunc sit amet ullamcorper. Praesent ligula felis\" image_1=\"general/hero-1.png\" title_2=\"Let’s make something great together.\" description_2=\"Duis justo nulla, pulvinar at dolor dapibus, finibus cursus massa. Praesent quam diam, faucibus tristique enim in, rhoncus aliquam lorem. Vestibulum vestibulum pellentesque nunc sit amet ullamcorper. Praesent ligula felis\" image_2=\"general/hero-2.png\" title_3=\"Use flexible components to build an app quickly\" description_3=\"Duis justo nulla, pulvinar at dolor dapibus, finibus cursus massa. Praesent quam diam, faucibus tristique enim in, rhoncus aliquam lorem. Vestibulum vestibulum pellentesque nunc sit amet ullamcorper. Praesent ligula felis\" image_3=\"general/hero-3.png\"][/banner-slider]</div><div>[site-statistics title=\"See why we are trusted the world over\" description=\"Et quaerat deserunt et numquam voluptatem et laborum consectetur non consequatur temporibus ea repellat nihil vel consectetur dolores et rerum voluptas. Nam voluptas reiciendis non laborum perspiciatis eum omnis cumque ab impedit earum ex quos porro sit dolorem cupiditate ut ducimus autem.\" quantity=\"4\" title_1=\"Social followers\" data_1=\"469\" unit_1=\"K\" title_2=\"Happy Clients\" data_2=\"255\" unit_2=\"K+\" title_3=\"Project Done\" data_3=\"756\" unit_3=\"K\" title_4=\"Global branch\" data_4=\"120\" style=\"style-2\"][/site-statistics]</div><div>[services title=\"What We Offer\" subtitle=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" service_ids=\"1,2,3,4,5,6\" style=\"style-4\"][/services]</div><div>[dual-intro-video quantity=\"2\" title_1=\" Integrate with over 1,000 project management apps\" subtitle_1=\"Business\" description_1=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\" image_1=\"general/intro-video.png\" youtube_video_url_1=\"https://www.youtube.com/watch?v=yCh9OVLI0SU\" button_label_1=\"Play video\" title_2=\"Integrate with over 1,000 project management apps\" subtitle_2=\"Business\" description_2=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\" image_2=\"general/intro-video.png\" youtube_video_url_2=\"https://www.youtube.com/watch?v=yCh9OVLI0SU\" button_label_2=\"Play video\"][/dual-intro-video]</div><div>[testimonials title=\"What our loving users are saying about us\" limit=\"5\" style=\"style-5\"][/testimonials]</div><div>[faqs title=\"Frequently asked questions\" subtitle=\"Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help\" faq_category_ids=\"1,2,3,4\" style=\"style-3\" quantity=\"1\"][/faqs]</div><div>[featured-services quantity=\"3\" title_1=\"Payment\" description_1=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_1=\"icons/payment.png\" action_1=\"/contact\" label_1=\"Learn More\" title_2=\"Save money\" description_2=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_2=\"icons/money.png\" action_2=\"/contact\" label_2=\"Learn More\" title_3=\"Quick support\" description_3=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_3=\"icons/support.png\" action_3=\"/contact\" label_3=\"Learn More\" style=\"style-2\"][/featured-services]</div><div>[teams title=\"Meet the amazing team behind Iori\" subtitle=\"Our leadership team\" team_ids=\"1,2,3,5\"][/teams]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(12, 'Homepage 12', '<div>[hero-banner title=\" Think. Creative. Solve Innovative Solution to Move Your Business Forward\" subtitle=\"Think. Creative. Solve\" description=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss.\" banner_primary=\"general/members.png\" quantity=\"6\" style=\"style-10\"][/hero-banner]</div><div>[featured-brands title=\"Loved By Developers, Trusted By Enterprises\" subtitle=\"We helped these brands turn online assessments into success stories. Join them. Elevate your testing.\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-7\"][/featured-brands]</div><div>[connect-with-us title=\"Crafting human connection through digital experience\" description=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den. Professional in their craft! All products were super amazing with strong attention to details, comps and overall vibe.\" button_label=\"Contact us\" button_url=\"/contact\" quantity=\"3\" title_1=\"Cross Platform\" image_1=\"general/human1.png\" description_1=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den\" title_2=\"Cross Platform\" image_2=\"general/human2.png\" description_2=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den.\" title_3=\"Cross Platform\" image_3=\"general/human3.png\" description_3=\"Discover powerful features to boost your productivity. You are always welcome to visit our little den.\"][/connect-with-us]</div><div>[how-to-start title=\"Bring your target users together on social media\" subtitle=\"IORI Business Platform\" image=\"general/banner-how-to-start.png\" image_icon_primary=\"icons/certify.png\" image_icon_secondary=\"icons/fly.png\" style=\"style-2\" quantity=\"3\" title_1=\"Create an account\" description_1=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" title_2=\"Build your founding team\" description_2=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" title_3=\"Launch and Scale\" description_3=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\"][/how-to-start]</div><div>[take-the-control title=\"Create a free account today.\" subtitle=\"Take the control\" image=\"general/account.png\" title_counter=\"Social followers\" data_counter=\"469\" unit_counter=\"K\" quantity=\"2\" title_1=\"Personal\" image_1=\"icons/personal.png\" description_1=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\" title_2=\"Personal\" image_2=\"icons/building.png\" description_2=\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\"][/take-the-control]</div><div>[step-block title=\"Core values\" subtitle=\"We break down barriers so teams can focus on what matters – working together to create products their customers love.\" button_label=\"Get Started Now\" button_url=\"/contact\" quantity=\"6\" title_1=\"Customers First\" description_1=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers\" title_2=\"Act With Integrity\" description_2=\"We’re honest, transparent and committed to doing what’s best for our customers and our company. We openly collaborate in pursuit of the truth. We have no tolerance for politics, hidden agendas or passive-aggressive behavior.\" title_3=\"Make a Difference Every Day\" description_3=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.\" title_4=\"Think Big\" description_4=\"Being the world’s leading commerce platform requires unrivaled vision, innovation and execution. We never settle. We challenge our ideas of what’s possible in order to better meet the needs of our customers.\" title_5=\" Do the right thing\" description_5=\"Integrity is the foundation for everything we do. We are admired and respected for our commitment to honesty, trust, and transparency.\" title_6=\"Stronger united\" description_6=\"We’ve created a positive and inclusive culture that fosters open, honest, and meaningful relationships.\"][/step-block]</div><div>[get-in-touch title=\"Want to talk to a marketing expert?\" subtitle=\"Get In Touch\" description=\"You need to create an account to find the best and preferred job. lorem Ipsum is simply dummy text of the printing and typesetting industry the standard dummy text ever took.\" image=\"general/img-marketing.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\"][/get-in-touch]</div><div>[featured-services quantity=\"3\" title_1=\"Daily Updates\" description_1=\"Share updates instantly within our project management software, and get the entire team collaborating\" image_1=\"icons/sync.png\" action_1=\"/contact\" label_1=\"Learn more\" title_2=\"24/7 Support\" description_2=\"Share updates instantly within our project management software, and get the entire team collaborating\" image_2=\"icons/boat-circle.jpg\" action_2=\"/contact\" label_2=\"Learn more\" title_3=\"Weekly Reports\" description_3=\"Share updates instantly within our project management software, and get the entire team collaborating\" image_3=\"icons/report.png\" action_3=\"/contact\" label_3=\"Learn more\" style=\"style-4\"][/featured-services]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(13, 'About Us', '<div>[who-are-you title=\"We are a digital agency that tackles all your online challenges.\" subtitle=\"Who we are\" description=\"Social media networks are open to all. Social media is typically used for social interation and access to news and information, and decision making.\" quantity=\"5\" title_1=\"Social followers\" image_1=\"icons/identity.png\" data_1=\"469\" unit_1=\"K+\" title_2=\"Happy Clients\" image_2=\"icons/cross-platform.png\" data_2=\"25\" unit_2=\"K+\" title_3=\"Project Done\" image_3=\"icons/conference.png\" data_3=\"756\" unit_3=\"+\" title_4=\"Global branch\" image_4=\"icons/certification.png\" data_4=\"100\" unit_4=\"+\" title_5=\"Conference\" image_5=\"icons/dispersal.png\" data_5=\"240\" unit_5=\"+\"][/who-are-you]</div><div>[testimonials limit=\"2\" style=\"style-4\"][/testimonials]</div><div>[information title=\" Core values\" subtitle=\"We break down barriers so teams can focus on what matters – working together to create products their customers love.\" quantity=\"6\" title_1=\"Customers First\" description_1=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.\" title_2=\"Act With Integrity\" description_2=\"We’re honest, transparent and committed to doing what’s best for our customers and our company. We openly collaborate in pursuit of the truth. We have no tolerance for politics, hidden agendas or passive-aggressive behavior.\" title_3=\" Make a Difference Every Day\" description_3=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.\" title_4=\"Think Big\" description_4=\"Being the world leading commerce platform requires unrivaled vision, innovation and execution. We never settle. We challenge our ideas of what’s possible in order to better meet the needs of our customers.\" title_5=\"Do the right thing\" description_5=\"Integrity is the foundation for everything we do. We are admired and respected for our commitment to honesty, trust, and transparency.\" title_6=\" Stronger united\" description_6=\"We’ve created a positive and inclusive culture that fosters open, honest, and meaningful relationships.\"][/information]</div><div>[box-story quantity=\"2\" title_1=\"Behind every brand is aninteresting story\" subtitle_1=\"OUR STORY\" description_1=\"Ea nostrum temporibus ex nulla totam qui galisum quae a adipisci modi. In exercitationem culpa sed blanditiis corrupti sit doloremque maxime eos iusto molestiae ex laborum nulla in quas dignissimos 33 dolorum quis.\" image_1=\"general/box-image-1.png\" title_2=\"We have a mission to help businesses grow the best with existing conditions\" subtitle_2=\"OUR MISSION\" description_2=\"Ea nostrum temporibus ex nulla totam qui galisum quae a adipisci modi. In exercitationem culpa sed blanditiis corrupti sit doloremque maxime eos iusto molestiae ex laborum nulla in quas dignissimos 33 dolorum quis. Est dolor autem et voluptate autem id enim optio vel incidunt alias.\" image_2=\"general/box-image-2.png\"][/box-story]</div><div>[teams team_ids=\"1,2,3,4,6\"][/teams]</div><div>[get-in-touch title=\"Want to talk to a marketing expert?\" subtitle=\"Get In Touch\" description=\"You need to create an account to find the best and preferred job. lorem Ipsum is simply dummy text of the printing and typesetting industry the standard dummy text ever took.\" image=\"general/img-marketing.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\"][/get-in-touch]</div><div>[testimonials title=\"What our clients say about us\" subtitle=\"Testimonials\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go.\" limit=\"3\" style=\"style-3\"][/testimonials]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(14, 'Blog', '<div>[hero-banner title=\"All the important insights, guidance and news you need to know.\" subtitle=\"Keep up-to-date with all our latest company news and business content. The latest news, tips and advice to help you run your business with less fuss\" banner_primary=\"general/banner-blog.png\" style=\"style-4\"][/hero-banner]</div><div>[featured-post title=\"Latest Articles\" category_ids=\"1,2,3,4,5,6\"][/featured-post]</div><div>[post-category title=\"E-Commerce\" category_id=\"1\" limit=\"5\"][/post-category]</div><div>[post-category title=\"Industry Use Cases\" category_id=\"6\" limit=\"5\" style=\"style-2\"][/post-category]</div><div>[post-category title=\"Marketing Strategy\" category_id=\"7\" limit=\"5\"][/post-category]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(15, 'Contact', '<div>[contact-page-banner title=\"We’d love to hear from you\" subtitle=\"Get in Touch\" description=\"Request a demo, ask a question, or get in touch here. If you’re interested in working at Iori Corporation, check out our {{careers page}}.\" button_label=\"Learn More\" button_url=\"/about-us\" banner=\"general/contact-banner.png\" quantity=\"2\" title_1=\"Appstore\" image_1=\"general/apple.png\" title_2=\"Googleplay\" image_2=\"general/google.png\"][/contact-page-banner]</div><div>[contact-information quantity=\"4\" title_1=\"Help & support\" email_1=\"support@archielite.com\" description_1=\"For help with a current product or service or refer to FAQs and developer tools\" image_1=\"icons/headphone.png\" title_2=\"Call Us\" phone_2=\"(+01) 234 567 89, (+01) 456 789 21\" description_2=\"Call us to speak to a member of our team.\" image_2=\"icons/phone.png\" title_3=\"Business Department\" phone_3=\"(+01) 789 456 23\" description_3=\"Contact the sales department about cooperation projects\" image_3=\"icons/chart-1.png\" title_4=\"Global branch\" phone_4=\"(+01) 456 789 23, (+01) 456 789 23\" description_4=\"Contact us to open our branches globally.\" image_4=\"icons/earth.png\"][/contact-information]</div><div>[contact-form title=\"Get in touch\" subtitle=\"Do you want to know more or contact our sales department?\" title_button=\"Send Message\" quantity=\"3\" heading_1=\"Visit the Knowledge Base\" description_1=\"Browse customer support articles and step-by-step instructions for specific features.\" icon_1=\"icons/img1.png\" heading_2=\"Watch Product Videos\" description_2=\"Watch our video tutorials for visual walkthrough on how to use our features.\" icon_2=\"icons/img2.png\" heading_3=\"Get in touch with Sales\" description_3=\"Let us talk about how we can help your enterprise.\" icon_3=\"icons/img3.png\"][/contact-form]</div><div>[faqs title=\"Frequently asked questions\" subtitle=\"Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help\" button_label=\"Contact Us\" button_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"contact\" faq_category_ids=\"1,2,3,4\" style=\"style-1\" quantity=\"1\"][/faqs]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(16, 'Coming Soon', '<div>[coming-soon title=\"We are coming soon\" subtitle=\"Under Construction\" description=\"Our design projects are fresh and simple and will benefit your business greatly. Learn more about our work!\" time=\"2025-05-19\" enable_snow_effect=\"0\" background_image=\"icons/coming-soon.png\"][/coming-soon]</div><div>[contact-information quantity=\"4\" title_1=\"Help & support\" email_1=\"support@archielite.com\" description_1=\"For help with a current product or service or refer to FAQs and developer tools\" image_1=\"icons/headphone.png\" title_2=\"Call Us\" phone_2=\"(+01) 234 567 89, (+01) 456 789 21\" description_2=\"Call us to speak to a member of our team.\" image_2=\"icons/phone.png\" title_3=\"Business Department\" phone_3=\"(+01) 789 456 23\" description_3=\"Contact the sales department about cooperation projects\" image_3=\"icons/chart-1.png\" title_4=\"Global branch\" phone_4=\"(+01) 456 789 23, (+01) 456 789 23\" description_4=\"Contact us to open our branches globally.\" image_4=\"icons/earth.png\"][/contact-information]</div>', 1, NULL, 'default', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(17, 'Services', '<div>[hero-banner title=\"Advanced analytics to grow your business\" subtitle=\"Available on\" description=\"Collaborate, plan projects and manage resources with powerful features that your whole team can use. The latest news, tips and advice to help you run your business with less fuss.\" banner_primary=\"general/banner-services.png\" platform_google_play_logo=\"general/google.png\" platform_google_play_url=\"https://play.google.com/store/\" platform_apple_store_logo=\"general/apple.png\" platform_apple_store_url=\"https://apps.apple.com/vn/app/apple-store\" quantity=\"6\" style=\"style-11\"][/hero-banner]</div><div>[services title=\"What We Offer\" subtitle=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" button_primary_label=\"Download App\" button_primary_url=\"https://www.apple.com/sg/app-store/\" button_secondary_label=\"Learn more\" button_secondary_url=\"contact\" service_ids=\"1,2,3,4,5,6\" style=\"style-3\"][/services]</div><div>[branding-block title=\"Business can also be simple\" subtitle=\"Automatic Tools\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go.\" image=\"general/brand-services-1.png\" image_1=\"general/brand-services-2.png\" image_2=\"general/brand-services-3.png\" logo=\"general/testimonial1.png\" button_primary_label=\"Download App\" button_primary_url=\"https://play.google.com/store\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\" counter_title=\"Happy Clients\" counter_data=\"25\" counter_unit=\"K+\" counter_title_1=\"Social followers\" counter_data_1=\"125\" counter_unit_1=\"K\" quantity=\"6\" title_1=\"Task tracking\" title_2=\"Task visualization\" title_3=\"Meet deadlines faster\" title_4=\"Create task dependencies\" title_5=\"hare files, discuss\" title_6=\"Track time spent on each project\" style=\"style-5\"][/branding-block]</div><div>[pricing-plan title=\"Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"icons/bg-plan.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"/pricing\" style=\"style-2\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(18, 'Help Center', '<div>[banner-hero-with-search title=\"How can we help you?\" subtitle=\"Support Center\" suggested=\"guest users, create account, invoice, security\" description=\"Search here to get answers to your questions\" image_1=\"general/banner-help-center-1.png\" image_2=\"general/banner-help-center-2.png\"][/banner-hero-with-search]</div><div>[featured-services quantity=\"3\" title_1=\"Knowledge Base\" description_1=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_1=\"icons/document.png\" action_1=\"/contact\" label_1=\"Get Started\" title_2=\"Community Forums\" description_2=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_2=\"icons/forums.png\" action_2=\"/contact\" label_2=\"Get Started\" title_3=\"Documentation\" description_3=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus\" image_3=\"icons/knowledge.png\" action_3=\"/contact\" label_3=\"Get Started\"][/featured-services]</div><div>[services title=\"What We Offer\" subtitle=\"What makes us different from others? We give holistic solutions with strategy, design & technology.\" button_primary_label=\"Download App\" button_primary_url=\"https://www.apple.com/sg/app-store/\" button_secondary_label=\"Learn more\" button_secondary_url=\"contact\" service_ids=\"1,2,3,4,5,6\" style=\"style-3\"][/services]</div><div>[from-community-forums title=\"From Community Forums\" subtitle=\"Updated on September 24, 2023\" quantity=\"6\" title_1=\" Announcements\" description_1=\"Seamless importing and round-tripping of Microsoft Project plans, Excel files & CSV files.\" image_1=\"icons/cross-platform.png\" topics_1=\"3\" comments_1=\"16\" account_1=\"1\" title_2=\"iori User Feedback\" description_2=\"Seamless importing and round-tripping of Microsoft Project plans, Excel files & CSV files.\" image_2=\"icons/creation.png\" topics_2=\"3\" comments_2=\"19\" account_2=\"3\" title_3=\"Technology support center\" description_3=\"Seamless importing and round-tripping of Microsoft Project plans, Excel files & CSV files.\" image_3=\"icons/cross-platform.png\" topics_3=\"5\" comments_3=\"9\" account_3=\"1\" title_4=\" Product Support\" description_4=\"Seamless importing and round-tripping of Microsoft Project plans, Excel files & CSV files.\" image_4=\"icons/cross-platform.png\" topics_4=\"5\" comments_4=\"7\" account_4=\"3\" title_5=\" Cognitive Solution\" description_5=\"Seamless importing and round-tripping of Microsoft Project plans, Excel files & CSV files.\" image_5=\"icons/cross-platform.png\" topics_5=\"6\" comments_5=\"2\" account_5=\"4\" title_6=\"Market research\" description_6=\"Seamless importing and round-tripping of Microsoft Project plans, Excel files & CSV files.\" image_6=\"icons/certification.png\" topics_6=\"2\" comments_6=\"1\" account_6=\"5\"][/from-community-forums]</div><div>[get-in-touch title=\"Can’t find an answer?\" subtitle=\"More help\" description=\"Make use of a qualified tutor to get the answer\" image=\"general/answer.png\" button_primary_label=\"Asked a Question\" button_primary_url=\"/help-center\" button_secondary_label=\"Contact Us\" button_secondary_url=\"/contact\"][/get-in-touch]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(19, 'Pricing', '<div>[pricing-plan title=\"Finger Choose The Best Plan\" subtitle=\"Pick your plan. Change whenever you want. No switching fees between packages\" icon_image=\"icons/bg-plan.png\" button_secondary_label=\"Compare Plans\" button_secondary_url=\"pricing\" style=\"style-1\" package_ids=\"1,2,3,4\"][/pricing-plan]</div><div>[compare-plans quantity=\"6\" title_1=\"Requests Quota\" free_1=\"50k Requests/Day\" standard_1=\"100k Requests/Day\" business_1=\"500k Requests/Day\" enterprise_1=\"Unlimited\" title_2=\"Account Acess\" free_2=\"35\" standard_2=\"85\" business_2=\"120\" enterprise_2=\"Unlimited\" title_3=\"Service Analystic\" business_3=\"true\" enterprise_3=\"true\" title_4=\"Achive Nodes\" business_4=\"true\" enterprise_4=\"true\" title_5=\"Enriched APIs\" business_5=\"true\" title_6=\"Rosetta APIs\" business_6=\"true\" enterprise_6=\"true\"][/compare-plans]</div><div>[featured-services quantity=\"3\" title_1=\"Daily Updates\" description_1=\"Share updates instantly within our project management software, and get the entire team collaborating\" image_1=\"icons/sync.png\" action_1=\"/contact\" label_1=\"Learn more\" title_2=\"24/7 Support\" description_2=\"Share updates instantly within our project management software, and get the entire team collaborating\" image_2=\"icons/boat-circle.jpg\" action_2=\"/contact\" label_2=\"Learn more\" title_3=\"Weekly Reports\" description_3=\"Share updates instantly within our project management software, and get the entire team collaborating\" image_3=\"icons/report.png\" action_3=\"/contact\" label_3=\"Learn more\" style=\"style-4\"][/featured-services]</div><div>[faqs title=\"Frequently asked questions\" subtitle=\"Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help\" button_primary_label=\"Contact Us\" button_primary_url=\"contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"contact\" image=\"general/bg-faqs.png\" faq_category_ids=\"1,2,3,4\"][/faqs]</div><div>[testimonials title=\"What our customers are saying\" subtitle=\"Hear from our users who have saved thousands on their Startup and SaaS solution spend.\" limit=\"5\" style=\"style-6\"][/testimonials]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(20, 'Teams', '<div>[banner-hero-with-teams title=\"Customers Love Our Creative Team, and So Will You\" description=\"“Highly recommend Iori Agency! They guide us on marketing initiatives and develop great strategies to increase our return on investment. The agency is excellent at being cooperative and responding quickly.”\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\" team_ids=\"1,2,3,4,5\" style=\"style-2\"][/banner-hero-with-teams]</div><div>[featured-brands quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-3\"][/featured-brands]</div><div>[teams title=\"Meet the amazing team behind Iori\" subtitle=\"Our leadership team\" team_ids=\"1,2,3,5\"][/teams]</div><div>[board-members title=\"Together we are strong\" subtitle=\"Board members\" team_ids=\"6,7,8,9\"][/board-members]</div><div>[have-a-question title=\"Have a question? Our team is happy to help you\" description=\"Access advanced order types including limit, market, stop limit and dollar cost averaging. Track your total asset holdings, values and equity over time. Monitor markets, manage your portfolio, and trade crypto on the go.\" image_1=\"general/question1.png\" image_2=\"general/question2.png\" image_3=\"general/question3.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Learn more\" button_secondary_url=\"/contact\"][/have-a-question]</div><div>[step-block title=\"Core values\" subtitle=\"We break down barriers so teams can focus on what matters – working together to create products their customers love.\" button_label=\"JOIN OUR TEAM TODAY\" button_url=\"/contact\" quantity=\"6\" title_1=\"Customers First\" description_1=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers\" title_2=\"Act With Integrity\" description_2=\"We’re honest, transparent and committed to doing what’s best for our customers and our company. We openly collaborate in pursuit of the truth. We have no tolerance for politics, hidden agendas or passive-aggressive behavior.\" title_3=\"Make a Difference Every Day\" description_3=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.\" title_4=\"Think Big\" description_4=\"Being the world’s leading commerce platform requires unrivaled vision, innovation and execution. We never settle. We challenge our ideas of what’s possible in order to better meet the needs of our customers.\" title_5=\" Do the right thing\" description_5=\"Integrity is the foundation for everything we do. We are admired and respected for our commitment to honesty, trust, and transparency.\" title_6=\"Stronger united\" description_6=\"We’ve created a positive and inclusive culture that fosters open, honest, and meaningful relationships.\"][/step-block]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01');
INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(21, 'Term and Conditions', '<div>[term-and-conditions title=\"Terms and Conditions\" subtitle=\"Amet nulla facilisi morbi tempus iaculis urna\" image=\"general/banner-term-and-conditions.png\" quantity=\"10\" title_1=\"Limitation of Liability\" description_1=\"Under no circumstances shall Archi Elite be liable for any direct, indirect, special, incidental or consequential damages, including, but not limited to, loss of data or profit, arising out of the use, or the inability to use, the materials on this site, even if Archi Elite or an authorized representative has been advised of the possibility of such damages. If your use of materials from this site results in the need for servicing, repair or correction of equipment or data, you assume any costs thereof.\" title_2=\"Licensing Policy\" description_2=\"Archi e WordPress plugins and themes are released under the GNU General Public License v2 or later. Please refer to licensing policy page for licensing details.\" title_3=\"Product Compatibility\" description_3=\"The products are developed to be compatible with the latest version of WordPress because we always strive to stay up-to-date with the latest version of WordPress. You might experience certain performance or functionality glitches with the products if you use any version prior to that.\" title_4=\"Delivery\" description_4=\"Your purchased product(s) information will be emailed to the email address (that you will provide) once we receive your payment. Even though this usually takes a few minutes, it may also take up to 24 hours. You can contact us through our contact page if you do not receive your email after waiting for this time period. You will also have access to your purchased products from your account in Archi Elite after logging in.\" title_5=\"Ownership\" description_5=\"All the products are the property of Archi Elite. So you may not claim ownership (intellectual or exclusive) over any of our products, modified or unmodified. Our products come ‘as is’, without any kind of warranty, either expressed or implied. Under no circumstances can our juridical person be accountable for any damages including, but not limited to, direct, indirect, special, incidental or consequential damages or other losses originating from the employment of or incapacity to use our products.\" title_6=\"Browser Compatibility\" description_6=\"We consider it our duty to offer a great experience across most major browsers, which is why our products support the latest modern web browsers including (but not limited to) Firefox, Safari, Chrome & Internet Explorer 9+. However, the performance may vary between different browsers, versions, and operating systems.\" title_7=\"Updates\" description_7=\"Our themes are constantly updated to be compatible with the latest stable version of WordPress. Please ensure that you always use the most current version of our themes.\" title_8=\"Theme Support\" description_8=\"Please refer to Help and Support Policy page for details.\" title_9=\"Price Changes\" description_9=\"Reserves the right to modify or suspend (temporarily or permanently) a subscription at any point of time and from time to time with or without any notice.\" title_10=\"Refund Policy\" description_10=\"Please refer to Refund Policy page for details.\"][/term-and-conditions]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(22, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'page-detail', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(23, 'Privacy policy', '<h3>EU Privacy policy</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'page-detail', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(24, 'Career Listing', '<div>[career-banner title=&quot;We&rsquo;re Always Searching For &lt;br&gt; Amazing People to Join Our Team.&quot; subtitle=&quot;Take a look at our current openings&quot; image=&quot;general/banner-career.png&quot; logo=&quot;general/certify.png&quot;][/career-banner]</div><div>[featured-services title=\"Why You Should Consider Applying\" subtitle=\"We`re lively, not corporate. We have the energy and boldness of a startup and the expertise and pragmatism of a scale-up. All in one place.\" quantity=\"4\" title_1=\"Connected\" description_1=\"We come together wherever we are – across time zones, regions, offices and screens. You will receive support from your teammates anytime and anywhere.\" image_1=\"icons/free.png\" action_1=\"/contact\" title_2=\"Inclusive\" description_2=\"Our teams reflect the rich diversity of our world, with equitable access to opportunity for everyone. No matter where you come from\" image_2=\"icons/cross-platform.png\" action_2=\"/contact\" title_3=\"Flexible\" description_3=\"We believe in your freedom to work when and how you work best, to help us all thrive. Only freedom and independent work can bring out the best in you.\" image_3=\"icons/identity.png\" action_3=\"/contact\" title_4=\"Persuasion\" description_4=\"Knowing that there is real value to be gained from helping people to simplify whatever it is that they do and bring.\" image_4=\"icons/persuasion.png\" action_4=\"/contact\" style=\"style-3\"][/featured-services]</div><div>[career-list title=&quot;Career Opportunities&quot; subtitle=&quot;Explore our open roles for working totally remotely, from the &lt;br&gt; office or somewhere in between.&quot; button_primary_label=&quot;Contact Us&quot; button_primary_url=&quot;/contact&quot; button_secondary_label=&quot;Learn More&quot; button_secondary_url=&quot;/job-listing&quot; career_ids=&quot;1,2,3,4,5,6&quot;][/career-list]</div><div>[step-block title=\"Core values\" subtitle=\"We break down barriers so teams can focus on what matters – working together to create products their customers love.\" button_label=\"Get Started Now\" button_url=\"/contact\" quantity=\"6\" title_1=\"Customers First\" description_1=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers\" title_2=\"Act With Integrity\" description_2=\"We’re honest, transparent and committed to doing what’s best for our customers and our company. We openly collaborate in pursuit of the truth. We have no tolerance for politics, hidden agendas or passive-aggressive behavior.\" title_3=\"Make a Difference Every Day\" description_3=\"Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.\" title_4=\"Think Big\" description_4=\"Being the world’s leading commerce platform requires unrivaled vision, innovation and execution. We never settle. We challenge our ideas of what’s possible in order to better meet the needs of our customers.\" title_5=\" Do the right thing\" description_5=\"Integrity is the foundation for everything we do. We are admired and respected for our commitment to honesty, trust, and transparency.\" title_6=\"Stronger united\" description_6=\"We’ve created a positive and inclusive culture that fosters open, honest, and meaningful relationships.\"][/step-block]</div><div>[featured-brands title=\"Loved By Developers Trusted By Enterprises\" subtitle=\"We helped these brands turn online assessments into success stories.\" quantity=\"6\" title_1=\"Cuebia\" image_1=\"product-categories/2.png\" url_1=\"https://www.cuebiq.com/\" is_open_new_tab_1=\"yes\" title_2=\"Factual\" image_2=\"product-categories/3.png\" url_2=\"http://factual.com\" is_open_new_tab_2=\"yes\" title_3=\"Kippa\" image_3=\"product-categories/5.png\" url_3=\"https://kippa.africa/\" is_open_new_tab_3=\"no\" title_4=\"PlaceIQ\" image_4=\"product-categories/8.png\" url_4=\"https://www.placeiq.com/\" is_open_new_tab_4=\"no\" image_5=\"product-categories/10.png\" url_5=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_5=\"no\" title_6=\"Versed\" image_6=\"product-categories/12.png\" url_6=\"https://www.reedelsevier.com.ph/\" is_open_new_tab_6=\"no\" style=\"style-4\"][/featured-brands]</div><div>[get-in-touch title=\"Want to talk to a marketing expert?\" subtitle=\"Get In Touch\" description=\"You need to create an account to find the best and preferred job. lorem Ipsum is simply dummy text of the printing and typesetting industry the standard dummy text ever took.\" image=\"general/img-marketing.png\" button_primary_label=\"Contact Us\" button_primary_url=\"/contact\" button_secondary_label=\"Support Center\" button_secondary_url=\"/contact\"][/get-in-touch]</div><div>[from-our-blog title=\"From our blog\" subtitle=\"Aenean velit nisl, aliquam eget diam eu, rhoncus tristique dolor. Aenean vulputate sodales urna ut vestibulum\" button_label=\"View all\" button_url=\"/blog\" type=\"featured\" limit=\"4\" style=\"style-2\"][/from-our-blog]</div>', 1, NULL, 'full-width', NULL, 'published', '2023-11-08 01:55:01', '2023-11-08 01:55:01');

-- --------------------------------------------------------

--
-- Structure de la table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts_translations`
--

CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post_categories`
--

CREATE TABLE `post_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post_tags`
--

CREATE TABLE `post_tags` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"plugins.business-services\":true,\"business-services.service-categories.index\":true,\"business-services.service-categories.create\":true,\"business-services.service-categories.edit\":true,\"business-services.service-categories.destroy\":true,\"business-services.services.index\":true,\"business-services.services.create\":true,\"business-services.services.edit\":true,\"business-services.services.destroy\":true,\"business-services.packages.index\":true,\"business-services.packages.create\":true,\"business-services.packages.edit\":true,\"business-services.packages.destroy\":true,\"careers.index\":true,\"careers.create\":true,\"careers.edit\":true,\"careers.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"plugins.ecommerce\":true,\"ecommerce.settings\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"shipping_methods.index\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.invoice-template.index\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"social-login.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}', 'Admin users role', 1, 1, 1, '2023-11-08 01:54:50', '2023-11-08 01:54:50');

-- --------------------------------------------------------

--
-- Structure de la table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2023-11-08 01:54:51', '2023-11-08 01:54:51');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2, 'api_enabled', '0', NULL, '2023-11-08 01:55:01'),
(3, 'activated_plugins', '[\"language\",\"language-advanced\",\"ai-writer\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"business-services\",\"captcha\",\"career\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"rss-feed\",\"shippo\",\"social-login\",\"sslcommerz\",\"stripe\",\"team\",\"testimonial\",\"translation\"]', NULL, '2023-11-08 01:55:01'),
(4, 'ai_writer_proxy_enable', '0', NULL, '2023-11-08 01:55:01'),
(5, 'ai_writer_proxy_protocol', NULL, NULL, NULL),
(6, 'ai_writer_proxy_ip', NULL, NULL, NULL),
(7, 'ai_writer_proxy_port', NULL, NULL, NULL),
(8, 'ai_writer_proxy_username', NULL, NULL, NULL),
(9, 'ai_writer_proxy_password', NULL, NULL, NULL),
(10, 'ai_writer_prompt_template', '[{\"title\":\"Product Content\",\"content\":\"You will be a marketer. I will give the information of the product, you will write an introductory article about that product, the article requires google seo standards and is highly persuasive to increase the rate of users closing orders.\\nParameters product:\"},{\"title\":\"Post Content\",\"content\":\"You will be a marketer. Articles about:\"}]', NULL, '2023-11-08 01:55:01'),
(11, 'ai_writer_openai_key', NULL, NULL, NULL),
(12, 'ai_writer_openai_temperature', '1', NULL, '2023-11-08 01:55:01'),
(13, 'ai_writer_openai_max_tokens', '2000', NULL, '2023-11-08 01:55:01'),
(14, 'ai_writer_openai_frequency_penalty', '0', NULL, '2023-11-08 01:55:01'),
(15, 'ai_writer_openai_presence_penalty', '0', NULL, '2023-11-08 01:55:01'),
(16, 'ai_writer_openai_models', '[\"gpt-3.5-turbo\"]', NULL, '2023-11-08 01:55:01'),
(17, 'ai_writer_openai_default_model', 'gpt-3.5-turbo', NULL, '2023-11-08 01:55:01'),
(18, 'ai_writer_spin_template', '[]', NULL, '2023-11-08 01:55:01'),
(23, 'language_hide_default', '1', NULL, '2023-11-08 01:55:01'),
(25, 'language_display', 'all', NULL, '2023-11-08 01:55:01'),
(26, 'language_hide_languages', '[]', NULL, '2023-11-08 01:55:01'),
(27, 'media_random_hash', '647e61f398feb92e85ee1b6c7130a87a', NULL, NULL),
(28, 'payment_cod_status', '1', NULL, NULL),
(29, 'payment_bank_transfer_status', '1', NULL, NULL),
(30, 'theme', 'iori', NULL, NULL),
(31, 'show_admin_bar', '1', NULL, NULL),
(32, 'language_switcher_display', 'dropdown', NULL, NULL),
(33, 'admin_favicon', 'logo/favicon.png', NULL, NULL),
(34, 'admin_logo', 'logo/logo-white.png', NULL, NULL),
(35, 'permalink-botble-blog-models-post', 'blog', NULL, NULL),
(36, 'permalink-botble-blog-models-category', 'blog', NULL, NULL),
(37, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, NULL),
(38, 'payment_bank_transfer_description', 'Please send money to our bank account: ACB - 69270 213 19.', NULL, NULL),
(39, 'payment_stripe_payment_type', 'stripe_checkout', NULL, NULL),
(40, 'plugins_ecommerce_customer_new_order_status', '0', NULL, NULL),
(41, 'plugins_ecommerce_admin_new_order_status', '0', NULL, NULL),
(42, 'ecommerce_is_enabled_support_digital_products', '1', NULL, NULL),
(43, 'ecommerce_load_countries_states_cities_from_location_plugin', '0', NULL, NULL),
(44, 'payment_bank_transfer_display_bank_info_at_the_checkout_success_page', '1', NULL, NULL),
(45, 'ecommerce_product_sku_format', 'IO-2443-[%S]', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'homepage-1', 1, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(2, 'homepage-2', 2, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(3, 'homepage-3', 3, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(4, 'homepage-4', 4, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(5, 'homepage-5', 5, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(6, 'homepage-6', 6, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(7, 'homepage-7', 7, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(8, 'homepage-8', 8, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(9, 'homepage-9', 9, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(10, 'homepage-10', 10, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(11, 'homepage-11', 11, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(12, 'homepage-12', 12, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(13, 'about-us', 13, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(14, 'blog', 14, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(15, 'contact', 15, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(16, 'coming-soon', 16, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(17, 'services', 17, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(18, 'help-center', 18, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(19, 'pricing', 19, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(20, 'teams', 20, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(21, 'term-and-conditions', 21, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(22, 'cookie-policy', 22, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(23, 'privacy-policy', 23, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(24, 'career-listing', 24, 'Botble\\Page\\Models\\Page', '', '2023-11-08 01:55:01', '2023-11-08 01:55:01');

-- --------------------------------------------------------

--
-- Structure de la table `slugs_translations`
--

CREATE TABLE `slugs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `states_translations`
--

CREATE TABLE `states_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags_translations`
--

CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `teams_translations`
--

CREATE TABLE `teams_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `testimonials_translations`
--

CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(12, 1, 'en', 'validation', 'accepted_if', 'The :attribute must be accepted when :other is :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(13, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(14, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(15, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(16, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(17, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(18, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(19, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(20, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(21, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(22, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(23, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(24, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(25, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(26, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(27, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(28, 1, 'en', 'validation', 'current_password', 'The password is incorrect.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(29, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(30, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(31, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(32, 1, 'en', 'validation', 'declined', 'The :attribute must be declined.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(33, 1, 'en', 'validation', 'declined_if', 'The :attribute must be declined when :other is :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(34, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(35, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(36, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(37, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(38, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(39, 1, 'en', 'validation', 'doesnt_start_with', 'The :attribute may not start with one of the following: :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(40, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(41, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(42, 1, 'en', 'validation', 'enum', 'The selected :attribute is invalid.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(43, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(44, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(45, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(46, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(47, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(48, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(49, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(50, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(51, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal to :value kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(52, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal to :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(53, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal to :value characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(54, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(55, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(56, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(57, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(58, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(59, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(60, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(61, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(62, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(63, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(64, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(65, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(66, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(67, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal to :value kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(68, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal to :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(69, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal to :value characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(70, 1, 'en', 'validation', 'mac_address', 'The :attribute must be a valid MAC address.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(71, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(72, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(73, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(74, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(75, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(76, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(77, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(78, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(79, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(80, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(81, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(82, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(83, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(84, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(85, 1, 'en', 'validation', 'password.letters', 'The :attribute must contain at least one letter.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(86, 1, 'en', 'validation', 'password.mixed', 'The :attribute must contain at least one uppercase and one lowercase letter.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(87, 1, 'en', 'validation', 'password.numbers', 'The :attribute must contain at least one number.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(88, 1, 'en', 'validation', 'password.symbols', 'The :attribute must contain at least one symbol.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(89, 1, 'en', 'validation', 'password.uncompromised', 'The given :attribute has appeared in a data leak. Please choose a different :attribute.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(90, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(91, 1, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(92, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(93, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(94, 1, 'en', 'validation', 'prohibits', 'The :attribute field prohibits :other from being present.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(95, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(96, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(97, 1, 'en', 'validation', 'required_array_keys', 'The :attribute field must contain entries for: :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(98, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(99, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(100, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(101, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(102, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(103, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(104, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(105, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(106, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(107, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(108, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(109, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(110, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(111, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid timezone.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(112, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(113, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-11-08 01:55:01', '2023-11-08 01:55:01'),
(114, 1, 'en', 'validation', 'url', 'The :attribute must be a valid URL.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(115, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(116, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(117, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(118, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(119, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(120, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(121, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(122, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(123, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(124, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(125, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(126, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(127, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(128, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(129, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(130, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(131, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(132, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(133, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(134, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(135, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(136, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(137, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(138, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(139, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(140, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(141, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(142, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(143, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(144, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(145, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(146, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(147, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(148, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(149, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(150, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(151, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(152, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(153, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(154, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(155, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(156, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(157, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(158, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(159, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(160, 1, 'en', 'core/acl/auth', 'settings.email.title', 'ACL', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(161, 1, 'en', 'core/acl/auth', 'settings.email.description', 'ACL email configuration', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(162, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(163, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(164, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(165, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(166, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(167, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(168, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(169, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(170, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(171, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(172, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(173, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(174, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(175, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(176, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(177, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(178, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(179, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(180, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(181, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(182, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(183, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(184, 1, 'en', 'core/acl/permissions', 'details', 'Details \":name\"', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(185, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(186, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(187, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(188, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(189, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(190, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(191, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(192, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(193, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(194, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(195, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(196, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(197, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(198, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(199, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(200, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(201, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(202, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(203, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(204, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(205, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(206, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(207, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(208, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(209, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(210, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(211, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(212, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(213, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(214, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(215, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(216, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(217, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(218, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(219, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(220, 1, 'en', 'core/acl/users', 'email', 'Email', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(221, 1, 'en', 'core/acl/users', 'role', 'Role', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(222, 1, 'en', 'core/acl/users', 'username', 'Username', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(223, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(224, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(225, 1, 'en', 'core/acl/users', 'message', 'Message', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(226, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(227, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(228, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(229, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(230, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(231, 1, 'en', 'core/acl/users', 'password', 'Password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(232, 1, 'en', 'core/acl/users', 'save', 'Save', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(233, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(234, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(235, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(236, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(237, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(238, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(239, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(240, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(241, 1, 'en', 'core/acl/users', 'close', 'Close', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(242, 1, 'en', 'core/acl/users', 'update', 'Update', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(243, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(244, 1, 'en', 'core/acl/users', 'users', 'Users', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(245, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(246, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(247, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(248, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(249, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(250, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(251, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(252, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(253, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(254, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(255, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(256, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(257, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(258, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(259, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(260, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(261, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(262, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(263, 1, 'en', 'core/base/base', 'yes', 'Yes', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(264, 1, 'en', 'core/base/base', 'no', 'No', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(265, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(266, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(267, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(268, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(269, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(270, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(271, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(272, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(273, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(274, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(275, 1, 'en', 'core/base/base', 'email_template.twig.tag.apply', 'The apply tag allows you to apply Twig filters', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(276, 1, 'en', 'core/base/base', 'email_template.twig.tag.for', 'Loop over each item in a sequence', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(277, 1, 'en', 'core/base/base', 'email_template.twig.tag.if', 'The if statement in Twig is comparable with the if statements of PHP', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(278, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(279, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(280, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(281, 1, 'en', 'core/base/base', 'image', 'Image', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(282, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2023-11-08 01:55:02', '2023-11-08 01:55:02'),
(283, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(284, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(285, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(286, 1, 'en', 'core/base/base', 'tools', 'Tools', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(287, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(288, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(289, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(290, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(291, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(292, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(293, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(294, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(295, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(296, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(297, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(298, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(299, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(300, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(301, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(302, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(303, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(304, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(305, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(306, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(307, 1, 'en', 'core/base/enums', 'system_updater_steps.download', 'Download update files', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(308, 1, 'en', 'core/base/enums', 'system_updater_steps.update_files', 'Update system files', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(309, 1, 'en', 'core/base/enums', 'system_updater_steps.update_database', 'Update databases', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(310, 1, 'en', 'core/base/enums', 'system_updater_steps.publish_core_assets', 'Publish core assets', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(311, 1, 'en', 'core/base/enums', 'system_updater_steps.publish_packages_assets', 'Publish packages assets', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(312, 1, 'en', 'core/base/enums', 'system_updater_steps.clean_up', 'Clean up system update files', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(313, 1, 'en', 'core/base/enums', 'system_updater_steps.done', 'System updated successfully', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(314, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.download', 'Downloading update files...', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(315, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.update_files', 'Updating system files...', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(316, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.update_database', 'Updating databases...', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(317, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.publish_core_assets', 'Publishing core assets...', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(318, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.publish_packages_assets', 'Publishing packages assets...', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(319, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.clean_up', 'Cleaning up system update files...', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(320, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.done', 'Done! Your browser will be refreshed in 30 seconds.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(321, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.download', 'Could not download update files', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(322, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.update_files', 'Could not update system files', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(323, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.update_database', 'Could not update databases', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(324, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.publish_core_assets', 'Could not publish core assets', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(325, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.publish_packages_assets', 'Could not publish packages assets', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(326, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.clean_up', 'Could not clean up system update files', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(327, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.download', 'Downloaded update files successfully.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(328, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.update_files', 'Updated system files successfully.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(329, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.update_database', 'Updated databases successfully.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(330, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.publish_core_assets', 'Published core assets successfully.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(331, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.publish_packages_assets', 'Published packages assets successfully.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(332, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.clean_up', 'Cleaned up system update files successfully.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(333, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(334, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(335, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(336, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(337, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(338, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(339, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(340, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\":link\">clicking here</a>.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(341, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(342, 1, 'en', 'core/base/errors', 'results_not_found', 'Results not found!', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(343, 1, 'en', 'core/base/errors', 'error_when_sending_email', 'Error when sending email. Something wrong with your email settings in Admin → Settings → Email, please check your settings again.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(344, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(345, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(346, 1, 'en', 'core/base/forms', 'save', 'Save & Exit', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(347, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(348, 1, 'en', 'core/base/forms', 'image', 'Image', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(349, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(350, 1, 'en', 'core/base/forms', 'create', 'Create', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(351, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(352, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(353, 1, 'en', 'core/base/forms', 'ok', 'OK', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(354, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(355, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(356, 1, 'en', 'core/base/forms', 'template', 'Template', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(357, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(358, 1, 'en', 'core/base/forms', 'file', 'File', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(359, 1, 'en', 'core/base/forms', 'content', 'Content', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(360, 1, 'en', 'core/base/forms', 'description', 'Description', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(361, 1, 'en', 'core/base/forms', 'name', 'Name', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(362, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(363, 1, 'en', 'core/base/forms', 'title', 'Title', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(364, 1, 'en', 'core/base/forms', 'value', 'Value', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(365, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(366, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(367, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(368, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(369, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(370, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(371, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2023-11-08 01:55:03', '2023-11-08 01:55:03');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(372, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(373, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(374, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(375, 1, 'en', 'core/base/forms', 'update', 'Update', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(376, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(377, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(378, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(379, 1, 'en', 'core/base/forms', 'order', 'Order', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(380, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(381, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(382, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(383, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(384, 1, 'en', 'core/base/forms', 'add', 'Add', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(385, 1, 'en', 'core/base/forms', 'link', 'Link', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(386, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(387, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(388, 1, 'en', 'core/base/forms', 'expand_all', 'Expand all', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(389, 1, 'en', 'core/base/forms', 'collapse_all', 'Collapse all', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(390, 1, 'en', 'core/base/forms', 'view_new_tab', 'Open in new tab', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(391, 1, 'en', 'core/base/forms', 'view_preview_image', 'View preview image', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(392, 1, 'en', 'core/base/forms', 'edit_item', 'Edit \":name\"', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(393, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(394, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(395, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(396, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(397, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(398, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(399, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(400, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(401, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(402, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(403, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(404, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(405, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(406, 1, 'en', 'core/base/layouts', 'home', 'Home', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(407, 1, 'en', 'core/base/layouts', 'search', 'Search', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(408, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(409, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(410, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(411, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(412, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(413, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(414, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(415, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(416, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(417, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2023-11-08 01:55:03', '2023-11-08 01:55:03'),
(418, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(419, 1, 'en', 'core/base/notices', 'error', 'Error!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(420, 1, 'en', 'core/base/notices', 'success', 'Success!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(421, 1, 'en', 'core/base/notices', 'info', 'Info!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(422, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(423, 1, 'en', 'core/base/notifications', 'notifications', 'Notifications', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(424, 1, 'en', 'core/base/notifications', 'mark_as_read', 'Mark as read', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(425, 1, 'en', 'core/base/notifications', 'clear', 'Clear', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(426, 1, 'en', 'core/base/notifications', 'no_notification_here', 'No notifications here', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(427, 1, 'en', 'core/base/notifications', 'please_check_again_later', 'Please check again later', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(428, 1, 'en', 'core/base/notifications', 'view_more', 'View more...', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(429, 1, 'en', 'core/base/notifications', 'view', 'View', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(430, 1, 'en', 'core/base/notifications', 'show_more', 'Show more', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(431, 1, 'en', 'core/base/notifications', 'show_less', 'Show less', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(432, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(433, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(434, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(435, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(436, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(437, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(438, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(439, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(440, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(441, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(442, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(443, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(444, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(445, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(446, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(447, 1, 'en', 'core/base/system', 'user.email', 'Email', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(448, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(449, 1, 'en', 'core/base/system', 'user.username', 'Username', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(450, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(451, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(452, 1, 'en', 'core/base/system', 'user.create', 'Create', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(453, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(454, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(455, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(456, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(457, 1, 'en', 'core/base/system', 'options.info', 'System information', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(458, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(459, 1, 'en', 'core/base/system', 'info.title', 'System information', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(460, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(461, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(462, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(463, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(464, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(465, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(466, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(467, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(468, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(469, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(470, 1, 'en', 'core/base/system', 'debug_mode_off', 'Debug Mode Off', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(471, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(472, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(473, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(474, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(475, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(476, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(477, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(478, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(479, 1, 'en', 'core/base/system', 'database', 'Database', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(480, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(481, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(482, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(483, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(484, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(485, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(486, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(487, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(488, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(489, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(490, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(491, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(492, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(493, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(494, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(495, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(496, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(497, 1, 'en', 'core/base/system', 'version', 'Version', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(498, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(499, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(500, 1, 'en', 'core/base/system', 'updater', 'System Updater', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(501, 1, 'en', 'core/base/system', 'zip', 'Zip Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(502, 1, 'en', 'core/base/system', 'iconv', 'Iconv Ext', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(503, 1, 'en', 'core/base/system', 'memory_limit', 'Memory limit', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(504, 1, 'en', 'core/base/system', 'max_execution_time', 'Max execution time (s)', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(505, 1, 'en', 'core/base/system', 'allow_url_fopen_enabled', 'allow_url_fopen enabled', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(506, 1, 'en', 'core/base/system', 'cleanup.title', 'Cleanup System', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(507, 1, 'en', 'core/base/system', 'cleanup.table.name', 'Table Name', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(508, 1, 'en', 'core/base/system', 'cleanup.table.count', 'Records', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(509, 1, 'en', 'core/base/system', 'cleanup.backup_alert', 'Please backup your database and script files before cleanup, it will clear your data in database.', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(510, 1, 'en', 'core/base/system', 'cleanup.messenger_choose_without_table', 'Please choose to ignore tables that do not want to be cleaned', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(511, 1, 'en', 'core/base/system', 'cleanup.messenger_confirm_cleanup', 'Are you sure you want to database cleanup action, it will clear your data in database?', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(512, 1, 'en', 'core/base/system', 'cleanup.submit_button', 'Cleanup', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(513, 1, 'en', 'core/base/system', 'cleanup.success_message', 'Cleaned data successfully', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(514, 1, 'en', 'core/base/system', 'cleanup.not_enabled_yet', 'This featured is not enabled yet. <br />Please add into .env: <code>CMS_ENABLED_CLEANUP_DATABASE=true</code> to enable this feature!', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(515, 1, 'en', 'core/base/tables', 'id', 'ID', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(516, 1, 'en', 'core/base/tables', 'name', 'Name', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(517, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(518, 1, 'en', 'core/base/tables', 'title', 'Title', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(519, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(520, 1, 'en', 'core/base/tables', 'order', 'Order', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(521, 1, 'en', 'core/base/tables', 'status', 'Status', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(522, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(523, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(524, 1, 'en', 'core/base/tables', 'description', 'Description', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(525, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(526, 1, 'en', 'core/base/tables', 'url', 'URL', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(527, 1, 'en', 'core/base/tables', 'author', 'Author', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(528, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(529, 1, 'en', 'core/base/tables', 'column', 'Column', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(530, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(531, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(532, 1, 'en', 'core/base/tables', 'views', 'Views', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(533, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(534, 1, 'en', 'core/base/tables', 'session', 'Session', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(535, 1, 'en', 'core/base/tables', 'activated', 'activated', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(536, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(537, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(538, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(539, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(540, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(541, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(542, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(543, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(544, 1, 'en', 'core/base/tables', 'export', 'Export', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(545, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(546, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(547, 1, 'en', 'core/base/tables', 'print', 'Print', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(548, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(549, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(550, 1, 'en', 'core/base/tables', 'display', 'Display', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(551, 1, 'en', 'core/base/tables', 'all', 'All', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(552, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(553, 1, 'en', 'core/base/tables', 'action', 'Actions', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(554, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(555, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(556, 1, 'en', 'core/base/tables', 'save', 'Save', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(557, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(558, 1, 'en', 'core/base/tables', 'to', 'to', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(559, 1, 'en', 'core/base/tables', 'in', 'in', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(560, 1, 'en', 'core/base/tables', 'records', 'records', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(561, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(562, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2023-11-08 01:55:04', '2023-11-08 01:55:04'),
(563, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(564, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(565, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(566, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(567, 1, 'en', 'core/base/tables', 'template', 'Template', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(568, 1, 'en', 'core/base/tables', 'email', 'Email', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(569, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(570, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(571, 1, 'en', 'core/base/tables', 'image', 'Image', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(572, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(573, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(574, 1, 'en', 'core/base/tables', 'please_select_record', 'Please select at least one record to perform this action!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(575, 1, 'en', 'core/base/tables', 'checkbox', 'Checkbox', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(576, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(577, 1, 'en', 'core/base/tabs', 'file', 'Files', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(578, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(579, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(580, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(581, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(582, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(583, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(584, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(585, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(586, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(587, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(588, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(589, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(590, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(591, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(592, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(593, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(594, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.today', 'Today', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(595, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.yesterday', 'Yesterday', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(596, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_week', 'This Week', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(597, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_7_days', 'Last 7 Days', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(598, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_month', 'This Month', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(599, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_30_days', 'Last 30 Days', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(600, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_year', 'This Year', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(601, 1, 'en', 'core/media/media', 'filter', 'Filter', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(602, 1, 'en', 'core/media/media', 'everything', 'Everything', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(603, 1, 'en', 'core/media/media', 'image', 'Image', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(604, 1, 'en', 'core/media/media', 'video', 'Video', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(605, 1, 'en', 'core/media/media', 'document', 'Document', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(606, 1, 'en', 'core/media/media', 'view_in', 'View in', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(607, 1, 'en', 'core/media/media', 'all_media', 'All media', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(608, 1, 'en', 'core/media/media', 'trash', 'Trash', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(609, 1, 'en', 'core/media/media', 'recent', 'Recent', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(610, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(611, 1, 'en', 'core/media/media', 'upload', 'Upload', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(612, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(613, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(614, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(615, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search in current folder', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(616, 1, 'en', 'core/media/media', 'sort', 'Sort', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(617, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(618, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(619, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(620, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(621, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(622, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(623, 1, 'en', 'core/media/media', 'actions', 'Actions', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(624, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(625, 1, 'en', 'core/media/media', 'insert', 'Insert', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(626, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(627, 1, 'en', 'core/media/media', 'create', 'Create', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(628, 1, 'en', 'core/media/media', 'rename', 'Rename', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(629, 1, 'en', 'core/media/media', 'crop', 'Crop', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(630, 1, 'en', 'core/media/media', 'close', 'Close', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(631, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(632, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(633, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(634, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(635, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(636, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(637, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(638, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(639, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(640, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(641, 1, 'en', 'core/media/media', 'alt_text', 'Alt text', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(642, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(643, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(644, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(645, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(646, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(647, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(648, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(649, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(650, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(651, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(652, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(653, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(654, 1, 'en', 'core/media/media', 'crop_success', 'Crop image successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(655, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(656, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(657, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(658, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(659, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(660, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(661, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(662, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(663, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(664, 1, 'en', 'core/media/media', 'file_too_big_readable_size', 'File too big. Max file upload is :size.', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(665, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(666, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(667, 1, 'en', 'core/media/media', 'failed_to_crop_image', 'The file cropping must be image type', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(668, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(669, 1, 'en', 'core/media/media', 'add', 'Add media', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(670, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(671, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(672, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(673, 1, 'en', 'core/media/media', 'javascript.alt', 'Alt text', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(674, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(675, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(676, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2023-11-08 01:55:05', '2023-11-08 01:55:05'),
(677, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(678, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(679, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(680, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(681, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(682, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(683, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(684, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(685, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(686, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(687, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(688, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(689, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(690, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(691, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(692, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(693, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(694, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(695, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links have been copied to clipboard', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(696, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(697, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(698, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(699, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(700, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.crop', 'Crop', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(701, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(702, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(703, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(704, 1, 'en', 'core/media/media', 'javascript.actions_list.file.alt_text', 'ALT text', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(705, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(706, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(707, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(708, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(709, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(710, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(711, 1, 'en', 'core/media/media', 'javascript.change_image', 'Change image', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(712, 1, 'en', 'core/media/media', 'javascript.delete_image', 'Delete image', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(713, 1, 'en', 'core/media/media', 'javascript.choose_image', 'Choose image', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(714, 1, 'en', 'core/media/media', 'javascript.preview_image', 'Preview image', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(715, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(716, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(717, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(718, 1, 'en', 'core/media/media', 'download_link', 'Download', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(719, 1, 'en', 'core/media/media', 'url', 'URL', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(720, 1, 'en', 'core/media/media', 'download_explain', 'Enter one URL per line.', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(721, 1, 'en', 'core/media/media', 'downloading', 'Downloading...', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(722, 1, 'en', 'core/media/media', 'prepare_file_to_download', 'Preparing file to download...', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(723, 1, 'en', 'core/media/media', 'update_alt_text_success', 'Update alt text successfully!', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(724, 1, 'en', 'core/media/media', 'cropper.height', 'Height', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(725, 1, 'en', 'core/media/media', 'cropper.width', 'Width', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(726, 1, 'en', 'core/media/media', 'cropper.aspect_ratio', 'Aspect ratio?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(727, 1, 'en', 'core/media/media', 'unable_to_write', 'Unable to write file. Please chmod folder \":folder\" to make it writeable!', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(728, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(729, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(730, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(731, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(732, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(733, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(734, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(735, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(736, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(737, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(738, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(739, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(740, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(741, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(742, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(743, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(744, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(745, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(746, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(747, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(748, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(749, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(750, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(751, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(752, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(753, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(754, 1, 'en', 'core/setting/setting', 'general.disable_cache_in_the_admin_panel', 'Disable cache in the admin panel?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(755, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(756, 1, 'en', 'core/setting/setting', 'general.enable_cache_site_map', 'Enable cache site map?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(757, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map (minutes)', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(758, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(759, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(760, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(761, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(762, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(763, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(764, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(765, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(766, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(767, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(768, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(769, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(770, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(771, 1, 'en', 'core/setting/setting', 'general.select', '— Select —', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(772, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(773, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(774, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Front site language direction', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(775, 1, 'en', 'core/setting/setting', 'general.admin_locale_direction', 'Admin language direction', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(776, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2023-11-08 01:55:06', '2023-11-08 01:55:06');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(777, 1, 'en', 'core/setting/setting', 'general.minutes', 'minutes', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(778, 1, 'en', 'core/setting/setting', 'general.datatables.title', 'Datatables', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(779, 1, 'en', 'core/setting/setting', 'general.datatables.description', 'Settings for datatables', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(780, 1, 'en', 'core/setting/setting', 'general.datatables.show_column_visibility', 'Default show column visibility?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(781, 1, 'en', 'core/setting/setting', 'general.datatables.show_export_button', 'Default show export button?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(782, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(783, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(784, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(785, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(786, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(787, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(788, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(789, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(790, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(791, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(792, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(793, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(794, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(795, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2023-11-08 01:55:06', '2023-11-08 01:55:06'),
(796, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(797, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(798, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(799, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(800, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(801, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(802, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(803, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(804, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(805, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(806, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(807, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(808, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(809, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(810, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(811, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(812, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(813, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(814, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(815, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(816, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(817, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(818, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(819, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(820, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(821, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(822, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(823, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(824, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(825, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(826, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(827, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(828, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(829, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(830, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(831, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(832, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(833, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(834, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(835, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(836, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(837, 1, 'en', 'core/setting/setting', 'media.aws_endpoint', 'AWS Endpoint (Optional)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(838, 1, 'en', 'core/setting/setting', 'media.r2_access_key_id', 'R2 Access Key ID', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(839, 1, 'en', 'core/setting/setting', 'media.r2_secret_key', 'R2 Secret Key', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(840, 1, 'en', 'core/setting/setting', 'media.r2_bucket', 'R2 Bucket', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(841, 1, 'en', 'core/setting/setting', 'media.r2_url', 'R2 URL', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(842, 1, 'en', 'core/setting/setting', 'media.r2_endpoint', 'R2 Endpoint', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(843, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(844, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(845, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(846, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(847, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(848, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(849, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(850, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(851, 1, 'en', 'core/setting/setting', 'media.wasabi_access_key_id', 'Wasabi Access Key ID', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(852, 1, 'en', 'core/setting/setting', 'media.wasabi_secret_key', 'Wasabi Secret Key', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(853, 1, 'en', 'core/setting/setting', 'media.wasabi_default_region', 'Wasabi Default Region', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(854, 1, 'en', 'core/setting/setting', 'media.wasabi_bucket', 'Wasabi Bucket', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(855, 1, 'en', 'core/setting/setting', 'media.wasabi_root', 'Wasabi Root', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(856, 1, 'en', 'core/setting/setting', 'media.default_placeholder_image', 'Default placeholder image', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(857, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(858, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(859, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(860, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(861, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(862, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(863, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(864, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(865, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(866, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(867, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(868, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(869, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(870, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(871, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(872, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(873, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(874, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(875, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(876, 1, 'en', 'core/setting/setting', 'media.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(877, 1, 'en', 'core/setting/setting', 'media.bunnycdn_hostname', 'Hostname', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(878, 1, 'en', 'core/setting/setting', 'media.bunnycdn_zone', 'Zone Name (The name of your storage zone)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(879, 1, 'en', 'core/setting/setting', 'media.bunnycdn_key', 'FTP & API Access Password (The storage zone API Access Password)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(880, 1, 'en', 'core/setting/setting', 'media.bunnycdn_region', 'Region (The storage zone region)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(881, 1, 'en', 'core/setting/setting', 'media.optional', 'Optional', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(882, 1, 'en', 'core/setting/setting', 'media.sizes', 'Media thumbnails sizes', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(883, 1, 'en', 'core/setting/setting', 'media.media_sizes_helper', 'Set width or height to 0 if you just want to crop by width or height. Need to click on \"Generate thumbnails\" to apply changes.', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(884, 1, 'en', 'core/setting/setting', 'media.width', 'Width', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(885, 1, 'en', 'core/setting/setting', 'media.height', 'Height', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(886, 1, 'en', 'core/setting/setting', 'media.default_size_value', 'Default: :size', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(887, 1, 'en', 'core/setting/setting', 'media.all', 'All', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(888, 1, 'en', 'core/setting/setting', 'media.media_folders_can_add_watermark', 'Add watermark for images in folders:', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(889, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize', 'Max upload filesize (MB)', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(890, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_placeholder', 'Default: :size, must less than :size.', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(891, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_helper', 'Your server allows to upload files maximum :size, you can change this value to limit upload filesize.', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(892, 1, 'en', 'core/setting/setting', 'media.image_processing_library', 'Image processing library', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(893, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(894, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(895, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(896, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(897, 1, 'en', 'core/setting/setting', 'template', 'Template', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(898, 1, 'en', 'core/setting/setting', 'description', 'Description', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(899, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(900, 1, 'en', 'core/setting/setting', 'send', 'Send', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(901, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(902, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(903, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(904, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(905, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(906, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(907, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(908, 1, 'en', 'core/setting/setting', 'saving', 'Saving...', '2023-11-08 01:55:07', '2023-11-08 01:55:07'),
(909, 1, 'en', 'core/setting/setting', 'emails_warning', 'You can add up to :count emails', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(910, 1, 'en', 'core/setting/setting', 'email_add_more', 'Add more', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(911, 1, 'en', 'core/setting/setting', 'generate', 'Generate', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(912, 1, 'en', 'core/setting/setting', 'generate_thumbnails', 'Generate thumbnails', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(913, 1, 'en', 'core/setting/setting', 'generate_thumbnails_success', 'Generate thumbnails successfully. :count files are generated!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(914, 1, 'en', 'core/setting/setting', 'generate_thumbnails_error', 'We are unable to regenerate thumbnail for these files :count files!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(915, 1, 'en', 'core/setting/setting', 'generate_thumbnails_description', 'Are you sure you want to re-generate thumbnails for all images? It will take time so please DO NOT leave this page, wait until it is finished.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(916, 1, 'en', 'core/setting/setting', 'enable_chunk_description', 'Chunk size upload is used to upload large file size.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(917, 1, 'en', 'core/setting/setting', 'watermark_description', 'WARNING: Watermark is just added to new uploaded images, it won\'t be added to existing images. Disable watermark won\'t remove watermark from existing images.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(918, 1, 'en', 'core/setting/setting', 'submit', 'Submit', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(919, 1, 'en', 'core/setting/setting', 'back', 'Back', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(920, 1, 'en', 'core/setting/setting', 'enter_sample_value', 'Enter sample values for testing', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(921, 1, 'en', 'core/setting/setting', 'preview', 'Preview', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(922, 1, 'en', 'core/setting/setting', 'media_size_width', ':size size width must be greater than 0', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(923, 1, 'en', 'core/setting/setting', 'media_size_height', ':size size height must be greater than 0', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(924, 1, 'en', 'core/setting/setting', 'cronjob.name', 'Cronjob', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(925, 1, 'en', 'core/setting/setting', 'cronjob.description', 'Cronjob allow you to automate certain commands or scripts on your site.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(926, 1, 'en', 'core/setting/setting', 'cronjob.is_not_ready', 'To run the cronjob, follow the instructions below.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(927, 1, 'en', 'core/setting/setting', 'cronjob.is_working', 'Congratulations! Your cronjob is running.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(928, 1, 'en', 'core/setting/setting', 'cronjob.is_not_working', 'Your cronjob is not running. Please check your server\'s cronjob.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(929, 1, 'en', 'core/setting/setting', 'cronjob.last_checked', 'Last checked at :time.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(930, 1, 'en', 'core/setting/setting', 'cronjob.copy_button', 'Copy', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(931, 1, 'en', 'core/setting/setting', 'cronjob.setup.name', 'Setting up the Cronjob', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(932, 1, 'en', 'core/setting/setting', 'cronjob.setup.connect_to_server', 'Connect to your server via SSH or any preferred method.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(933, 1, 'en', 'core/setting/setting', 'cronjob.setup.open_crontab', 'Open the crontab file using a text editor (e.g., `crontab -e`).', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(934, 1, 'en', 'core/setting/setting', 'cronjob.setup.add_cronjob', 'Add the above command to the crontab file and save it.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(935, 1, 'en', 'core/setting/setting', 'cronjob.setup.done', 'The cronjob will now run at every minute and execute the specified command.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(936, 1, 'en', 'core/setting/setting', 'cronjob.setup.learn_more', 'You can learn more about cronjob from the Laravel :documentation', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(937, 1, 'en', 'core/setting/setting', 'cronjob.setup.documentation', 'documentation', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(938, 1, 'en', 'core/setting/setting', 'cronjob.setup.copied', 'Copied', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(939, 1, 'en', 'core/table/table', 'operations', 'Operations', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(940, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(941, 1, 'en', 'core/table/table', 'display', 'Display', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(942, 1, 'en', 'core/table/table', 'all', 'All', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(943, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(944, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(945, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(946, 1, 'en', 'core/table/table', 'to', 'to', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(947, 1, 'en', 'core/table/table', 'in', 'in', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(948, 1, 'en', 'core/table/table', 'records', 'records', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(949, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(950, 1, 'en', 'core/table/table', 'no_record', 'No record', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(951, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(952, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(953, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(954, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(955, 1, 'en', 'core/table/table', 'delete', 'Delete', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(956, 1, 'en', 'core/table/table', 'close', 'Close', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(957, 1, 'en', 'core/table/table', 'contains', 'Contains', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(958, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(959, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(960, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(961, 1, 'en', 'core/table/table', 'value', 'Value', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(962, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(963, 1, 'en', 'core/table/table', 'reset', 'Reset', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(964, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(965, 1, 'en', 'core/table/table', 'apply', 'Apply', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(966, 1, 'en', 'core/table/table', 'filters', 'Filters', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(967, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(968, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(969, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(970, 1, 'en', 'core/table/table', 'invalid_bulk_action', 'Invalid bulk action', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(971, 1, 'en', 'core/table/table', 'confirm_bulk_action', 'Confirm to perform this action', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(972, 1, 'en', 'core/table/table', 'confirm_bulk_message', 'Are you sure you want to do this action? This cannot be undone.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(973, 1, 'en', 'core/table/table', 'yes', 'Yes', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(974, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(975, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(976, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(977, 1, 'en', 'core/table/table', 'search', 'Search...', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(978, 1, 'en', 'packages/api/api', 'settings', 'API Settings', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(979, 1, 'en', 'packages/api/api', 'save_settings', 'Save settings', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(980, 1, 'en', 'packages/api/api', 'setting_title', 'API settings', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(981, 1, 'en', 'packages/api/api', 'setting_description', 'Settings for API', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(982, 1, 'en', 'packages/api/api', 'api_enabled', 'API enabled?', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(983, 1, 'en', 'packages/get-started/get-started', 'welcome_title', 'Welcome to your admin dashboard!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(984, 1, 'en', 'packages/get-started/get-started', 'welcome_description', 'In a few short steps, you can have your new dashboard up and running!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(985, 1, 'en', 'packages/get-started/get-started', 'get_started', 'Get Started!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(986, 1, 'en', 'packages/get-started/get-started', 'customize_branding_title', 'Customize branding', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(987, 1, 'en', 'packages/get-started/get-started', 'customize_branding_description', 'Customize your site with colors, logo and subdomain to match your business unique branding and identity.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(988, 1, 'en', 'packages/get-started/get-started', 'colors', 'Colors', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(989, 1, 'en', 'packages/get-started/get-started', 'fonts', 'Fonts', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(990, 1, 'en', 'packages/get-started/get-started', 'primary_color', 'Primary color', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(991, 1, 'en', 'packages/get-started/get-started', 'primary_font', 'Primary font', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(992, 1, 'en', 'packages/get-started/get-started', 'setup_wizard_button', ':link to finish Quick setup Wizard!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(993, 1, 'en', 'packages/get-started/get-started', 'click_here', 'Click here', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(994, 1, 'en', 'packages/get-started/get-started', 'site_title', 'Site title', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(995, 1, 'en', 'packages/get-started/get-started', 'identify', 'Identify', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(996, 1, 'en', 'packages/get-started/get-started', 'logo', 'Logo', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(997, 1, 'en', 'packages/get-started/get-started', 'admin_logo', 'Admin logo', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(998, 1, 'en', 'packages/get-started/get-started', 'favicon', 'Favicon', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(999, 1, 'en', 'packages/get-started/get-started', 'admin_favicon', 'Admin favicon', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1000, 1, 'en', 'packages/get-started/get-started', 'next_step', 'Next step', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1001, 1, 'en', 'packages/get-started/get-started', 'site_ready_title', 'Your site is ready!', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1002, 1, 'en', 'packages/get-started/get-started', 'site_ready_description', 'Welcome to your new site! Your website has been created and populated with sample data. You are in the admin area of your site where you can set up everything else needed to complete your site.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1003, 1, 'en', 'packages/get-started/get-started', 'finish', 'Finish', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1004, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_title', 'Are you sure you want to exit the Quick Setup Wizard?', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1005, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_confirm', 'Yes, I\'ll finish it later', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1006, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_cancel', 'No, take me back to the wizard', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1007, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_title', 'Change default account info', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1008, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_description', 'The default account is using a weak password. You need to change it to a complex password for better security.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1009, 1, 'en', 'packages/get-started/get-started', 'username', 'Username', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1010, 1, 'en', 'packages/get-started/get-started', 'email', 'Email', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1011, 1, 'en', 'packages/get-started/get-started', 'password', 'Password', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1012, 1, 'en', 'packages/get-started/get-started', 'password_confirmation', 'Password confirmation', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1013, 1, 'en', 'packages/installer/installer', 'title', 'Installer', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1014, 1, 'en', 'packages/installer/installer', 'next', 'Next Step', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1015, 1, 'en', 'packages/installer/installer', 'back', 'Previous', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1016, 1, 'en', 'packages/installer/installer', 'finish', 'Install', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1017, 1, 'en', 'packages/installer/installer', 'installation', 'Installation', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1018, 1, 'en', 'packages/installer/installer', 'forms.errorTitle', 'The following errors occurred:', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1019, 1, 'en', 'packages/installer/installer', 'welcome.templateTitle', 'Welcome', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1020, 1, 'en', 'packages/installer/installer', 'welcome.title', 'Welcome', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1021, 1, 'en', 'packages/installer/installer', 'welcome.message', 'Before getting started, we need some information on the database. You will need to know the following items before proceeding.', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1022, 1, 'en', 'packages/installer/installer', 'welcome.next', 'Let\'s go', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1023, 1, 'en', 'packages/installer/installer', 'requirements.templateTitle', 'Step 1 | Server Requirements', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1024, 1, 'en', 'packages/installer/installer', 'requirements.title', 'Server Requirements', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1025, 1, 'en', 'packages/installer/installer', 'requirements.next', 'Check Permissions', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1026, 1, 'en', 'packages/installer/installer', 'permissions.templateTitle', 'Step 2 | Permissions', '2023-11-08 01:55:08', '2023-11-08 01:55:08'),
(1027, 1, 'en', 'packages/installer/installer', 'permissions.title', 'Permissions', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1028, 1, 'en', 'packages/installer/installer', 'permissions.next', 'Configure Environment', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1029, 1, 'en', 'packages/installer/installer', 'environment.wizard.templateTitle', 'Environment Settings', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1030, 1, 'en', 'packages/installer/installer', 'environment.wizard.title', 'Environment Settings', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1031, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.name_required', 'An environment name is required.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1032, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_label', 'Site title', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1033, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_placeholder', 'Site title', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1034, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_label', 'URL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1035, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_placeholder', 'URL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1036, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label', 'Database Connection', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1037, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_mysql', 'MySQL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1038, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_sqlite', 'SQLite', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1039, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_pgsql', 'PostgreSQL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1040, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_label', 'Database host', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1041, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_placeholder', 'Database host', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1042, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_label', 'Database port', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1043, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_placeholder', 'Database port', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1044, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_label', 'Database name', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1045, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_placeholder', 'Database name', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1046, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_label', 'Database username', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1047, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_placeholder', 'Database username', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1048, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_label', 'Database password', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1049, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_placeholder', 'Database password', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1050, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.buttons.install', 'Install', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1051, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_helper', 'If you use Laravel Sail, just change DB_HOST to DB_HOST=mysql. On some hosting DB_HOST can be localhost instead of 127.0.0.1', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1052, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.mysql', 'MySQL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1053, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.sqlite', 'SQLite', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1054, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.pgsql', 'PostgreSQL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1055, 1, 'en', 'packages/installer/installer', 'environment.success', 'Your .env file settings have been saved.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1056, 1, 'en', 'packages/installer/installer', 'environment.errors', 'Unable to save the .env file, Please create it manually.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1057, 1, 'en', 'packages/installer/installer', 'install', 'Install', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1058, 1, 'en', 'packages/installer/installer', 'final.title', 'Installation Finished', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1059, 1, 'en', 'packages/installer/installer', 'final.templateTitle', 'Installation Finished', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1060, 1, 'en', 'packages/installer/installer', 'final.finished', 'Application has been successfully installed.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1061, 1, 'en', 'packages/installer/installer', 'final.exit', 'Click here to exit', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1062, 1, 'en', 'packages/installer/installer', 'create_account', 'Create account', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1063, 1, 'en', 'packages/installer/installer', 'first_name', 'First name', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1064, 1, 'en', 'packages/installer/installer', 'last_name', 'Last name', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1065, 1, 'en', 'packages/installer/installer', 'username', 'Username', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1066, 1, 'en', 'packages/installer/installer', 'email', 'Email', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1067, 1, 'en', 'packages/installer/installer', 'password', 'Password', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1068, 1, 'en', 'packages/installer/installer', 'password_confirmation', 'Password confirmation', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1069, 1, 'en', 'packages/installer/installer', 'create', 'Create', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1070, 1, 'en', 'packages/installer/installer', 'install_success', 'Installed successfully!', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1071, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1072, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1073, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1074, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1075, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1076, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1077, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1078, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1079, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1080, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1081, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1082, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1083, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1084, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1085, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1086, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1087, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1088, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1089, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1090, 1, 'en', 'packages/menu/menu', 'title_placeholder', 'Title', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1091, 1, 'en', 'packages/menu/menu', 'icon_placeholder', 'Icon', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1092, 1, 'en', 'packages/menu/menu', 'url_placeholder', 'URL', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1093, 1, 'en', 'packages/menu/menu', 'css_class_placeholder', 'CSS class', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1094, 1, 'en', 'packages/menu/menu', 'menu_id', 'Menu ID', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1095, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1096, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1097, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1098, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space', 'Collapse white space', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1099, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space_description', 'This filter reduces bytes transmitted in an HTML file by removing unnecessary whitespace.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1100, 1, 'en', 'packages/optimize/optimize', 'elide_attributes', 'Elide attributes', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1101, 1, 'en', 'packages/optimize/optimize', 'elide_attributes_description', 'This filter reduces the transfer size of HTML files by removing attributes from tags when the specified value is equal to the default value for that attribute. This can save a modest number of bytes, and may make the document more compressible by canonicalizing the affected tags.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1102, 1, 'en', 'packages/optimize/optimize', 'inline_css', 'Inline CSS', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1103, 1, 'en', 'packages/optimize/optimize', 'inline_css_description', 'This filter transforms the inline \"style\" attribute of tags into classes by moving the CSS to the header.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1104, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch', 'Insert DNS prefetch', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1105, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch_description', 'This filter injects tags in the HEAD to enable the browser to do DNS prefetching.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1106, 1, 'en', 'packages/optimize/optimize', 'remove_comments', 'Remove comments', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1107, 1, 'en', 'packages/optimize/optimize', 'remove_comments_description', 'This filter eliminates HTML, JS and CSS comments. The filter reduces the transfer size of HTML files by removing the comments. Depending on the HTML file, this filter can significantly reduce the number of bytes transmitted on the network.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1108, 1, 'en', 'packages/optimize/optimize', 'remove_quotes', 'Remove quotes', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1109, 1, 'en', 'packages/optimize/optimize', 'remove_quotes_description', 'This filter eliminates unnecessary quotation marks from HTML attributes. While required by the various HTML specifications, browsers permit their omission when the value of an attribute is composed of a certain subset of characters (alphanumerics and some punctuation characters).', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1110, 1, 'en', 'packages/optimize/optimize', 'defer_javascript', 'Defer javascript', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1111, 1, 'en', 'packages/optimize/optimize', 'defer_javascript_description', 'Defers the execution of javascript in the HTML. If necessary cancel deferring in some script, use data-pagespeed-no-defer as script attribute to cancel deferring.', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1112, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1113, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1114, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1115, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1116, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1117, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1118, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1119, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1120, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1121, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1122, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1123, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1124, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1125, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1126, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1127, 1, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1128, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1129, 1, 'en', 'packages/plugin-management/marketplace', 'previous', '&laquo; Previous', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1130, 1, 'en', 'packages/plugin-management/marketplace', 'next', 'Next &raquo;', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1131, 1, 'en', 'packages/plugin-management/marketplace', 'showing', 'Showing', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1132, 1, 'en', 'packages/plugin-management/marketplace', 'to', 'to', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1133, 1, 'en', 'packages/plugin-management/marketplace', 'of', 'of', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1134, 1, 'en', 'packages/plugin-management/marketplace', 'results', 'results', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1135, 1, 'en', 'packages/plugin-management/marketplace', 'add_new', 'Add new', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1136, 1, 'en', 'packages/plugin-management/marketplace', 'installed', 'Installed', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1137, 1, 'en', 'packages/plugin-management/marketplace', 'install_now', 'Install now', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1138, 1, 'en', 'packages/plugin-management/marketplace', 'installing', 'Installing...', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1139, 1, 'en', 'packages/plugin-management/marketplace', 'detail', 'Details', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1140, 1, 'en', 'packages/plugin-management/marketplace', 'version', 'Version', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1141, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version', 'Minimum core version', '2023-11-08 01:55:09', '2023-11-08 01:55:09');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1142, 1, 'en', 'packages/plugin-management/marketplace', 'last_update', 'Last update', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1143, 1, 'en', 'packages/plugin-management/marketplace', 'compatible_version', 'Compatible with your version', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1144, 1, 'en', 'packages/plugin-management/marketplace', 'incompatible_version', 'Incompatible with your version', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1145, 1, 'en', 'packages/plugin-management/marketplace', 'deactivate', 'Deactivate', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1146, 1, 'en', 'packages/plugin-management/marketplace', 'activate', 'Activate', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1147, 1, 'en', 'packages/plugin-management/marketplace', 'activating', 'Activating...', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1148, 1, 'en', 'packages/plugin-management/marketplace', 'activated', 'Activated', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1149, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted', 'Connection Aborted', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1150, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted_description', 'Connection Aborted Description', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1151, 1, 'en', 'packages/plugin-management/marketplace', 'api_connect_error', 'Connect to Marketplace API Error, please contact support', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1152, 1, 'en', 'packages/plugin-management/marketplace', 'keyword', 'Keyword', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1153, 1, 'en', 'packages/plugin-management/marketplace', 'search', 'Search', '2023-11-08 01:55:09', '2023-11-08 01:55:09'),
(1154, 1, 'en', 'packages/plugin-management/marketplace', 'all', 'All', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1155, 1, 'en', 'packages/plugin-management/marketplace', 'featured', 'Featured', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1156, 1, 'en', 'packages/plugin-management/marketplace', 'popular', 'Popular', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1157, 1, 'en', 'packages/plugin-management/marketplace', 'top_rated', 'Top Rated', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1158, 1, 'en', 'packages/plugin-management/marketplace', 'install_plugin', 'Install plugin', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1159, 1, 'en', 'packages/plugin-management/marketplace', 'cancel', 'Cancel', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1160, 1, 'en', 'packages/plugin-management/marketplace', 'yes_install', ' Yes! Install', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1161, 1, 'en', 'packages/plugin-management/marketplace', 'message_alert', 'Are you sure you want to install this plugin?', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1162, 1, 'en', 'packages/plugin-management/marketplace', 'folder_permissions', 'Folder does not have permission to write file or the update file path could not be resolved, please contact support', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1163, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_failed', 'Unzip extraction failed', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1164, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_success', 'Download file extracted', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1165, 1, 'en', 'packages/plugin-management/marketplace', 'install_success', 'Installed plugin successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1166, 1, 'en', 'packages/plugin-management/marketplace', 'update_success', 'Updated plugin successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1167, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version_error', 'Cannot install this plugin. Minimum core version is :version.', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1168, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1169, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1170, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1171, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1172, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1173, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1174, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1175, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1176, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1177, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1178, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1179, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1180, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1181, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1182, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1183, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1184, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1185, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1186, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1187, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1188, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1189, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1190, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1191, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1192, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin has been removed!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1193, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1194, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1195, 1, 'en', 'packages/plugin-management/plugin', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1196, 1, 'en', 'packages/plugin-management/plugin', 'plugin_is_not_ready', 'Plugin :name is not ready to use', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1197, 1, 'en', 'packages/plugin-management/plugin', 'plugins_installed', 'Installed Plugins', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1198, 1, 'en', 'packages/plugin-management/plugin', 'plugins_add_new', 'Add new', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1199, 1, 'en', 'packages/plugin-management/plugin', 'update', 'Update', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1200, 1, 'en', 'packages/plugin-management/plugin', 'requirement_not_met', 'Plugin :plugin requires plugin(s): :required_plugins. Do you want to install them and activate :plugin now?', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1201, 1, 'en', 'packages/plugin-management/plugin', 'install', 'Install now', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1202, 1, 'en', 'packages/plugin-management/plugin', 'install_plugin', 'Install Plugin', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1203, 1, 'en', 'packages/plugin-management/plugin', 'minimum_core_version_not_met', 'Plugin :plugin requires :minimum_core_version version of core, but your core version is :current_core_version. Please upgrade your core to use this plugin!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1204, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1205, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1206, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1207, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1208, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1209, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1210, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1211, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1212, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1213, 1, 'en', 'packages/slug/slug', 'settings.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1214, 1, 'en', 'packages/slug/slug', 'settings.available_variables', 'Available variables', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1215, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1216, 1, 'en', 'packages/slug/slug', 'prefix_for', 'Prefix for :name', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1217, 1, 'en', 'packages/slug/slug', 'public_single_ending_url', 'Postfix for single page URL', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1218, 1, 'en', 'packages/slug/slug', 'current_year', 'Current year', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1219, 1, 'en', 'packages/slug/slug', 'current_month', 'Current month', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1220, 1, 'en', 'packages/slug/slug', 'current_day', 'Current day', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1221, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1222, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1223, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1224, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1225, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1226, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1227, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1228, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1229, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1230, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1231, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1232, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1233, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1234, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1235, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1236, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1237, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1238, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1239, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1240, 1, 'en', 'packages/theme/theme', 'custom_html', 'Custom HTML', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1241, 1, 'en', 'packages/theme/theme', 'custom_header_html', 'Header HTML', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1242, 1, 'en', 'packages/theme/theme', 'custom_header_html_placeholder', 'HTML in header of page, no special tags: script, style, iframe...', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1243, 1, 'en', 'packages/theme/theme', 'custom_body_html', 'Body HTML', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1244, 1, 'en', 'packages/theme/theme', 'custom_body_html_placeholder', 'HTML in body of page, no special tags: script, style, iframe...', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1245, 1, 'en', 'packages/theme/theme', 'custom_footer_html', 'Footer HTML', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1246, 1, 'en', 'packages/theme/theme', 'custom_footer_html_placeholder', 'HTML in footer of page, no special tags: script, style, iframe...', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1247, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1248, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1249, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2023-11-08 01:55:10', '2023-11-08 01:55:10'),
(1250, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1251, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1252, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1253, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1254, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1255, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1256, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1257, 1, 'en', 'packages/theme/theme', 'settings.redirect_404_to_homepage', 'Redirect all not found requests to homepage?', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1258, 1, 'en', 'packages/theme/theme', 'settings.show_guidelines', 'Show guidelines?', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1259, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1260, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1261, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1262, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1263, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1264, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1265, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1266, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1267, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1268, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1269, 1, 'en', 'packages/theme/theme', 'update_custom_html_success', 'Update custom HTML successfully!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1270, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1271, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1272, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1273, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1274, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1275, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1276, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1277, 1, 'en', 'packages/theme/theme', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1278, 1, 'en', 'packages/theme/theme', 'breadcrumb_enabled', 'Enable breadcrumb?', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1279, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1280, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1281, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1282, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1283, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1284, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1285, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1286, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1287, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1288, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1289, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1290, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1291, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1292, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1293, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1294, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1295, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1296, 1, 'en', 'packages/widget/widget', 'widget_menu', 'Simple Menu', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1297, 1, 'en', 'packages/widget/widget', 'widget_menu_description', 'Add a simple menu to your widget area.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1298, 1, 'en', 'packages/widget/widget', 'widget_menu_label', 'Label', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1299, 1, 'en', 'packages/widget/widget', 'widget_menu_attributes', 'Attributes', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1300, 1, 'en', 'packages/widget/widget', 'widget_menu_url', 'URL', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1301, 1, 'en', 'packages/widget/widget', 'widget_menu_is_open_new_tab', 'Is open new tab?', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1302, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1303, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1304, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1305, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1306, 1, 'en', 'plugins/ai-writer/ai-writer', 'name', 'AI Writer', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1307, 1, 'en', 'plugins/ai-writer/ai-writer', 'generate', 'AI Writer', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1308, 1, 'en', 'plugins/ai-writer/ai-writer', 'spin', 'Spin content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1309, 1, 'en', 'plugins/ai-writer/ai-writer', 'menu', 'AI Writer', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1310, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.page_title', 'AI Writer settings', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1311, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.generate', 'AI Writer', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1312, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.generate_description', 'AI Writer prompt parameter setting', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1313, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.generate_placeholder', 'Default prompt...', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1314, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.generate_default', 'Default prompt', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1315, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.generate_label', 'Prompt title', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1316, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.generate_content', 'Prompt content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1317, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.openai_key', 'API key', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1318, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.openai_model', 'API Models', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1319, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.openai_temperature', 'Temperature', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1320, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.openai_max_tokens', 'Max tokens', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1321, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.openai_frequency_penalty', 'Frequency penalty', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1322, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.openai_presence_penalty', 'Presence penalty', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1323, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy', 'Setup AI Writer proxy', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1324, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy_enable', 'Do you want to use proxy when calling ChatGPT API?', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1325, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy_description', 'Configure proxy to connect to ChatGPT api.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1326, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy_protocol', 'Proxy protocol', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1327, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy_username', 'Proxy username', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1328, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy_password', 'Proxy password', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1329, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy_ip', 'Proxy server ip', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1330, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.proxy_port', 'Proxy port', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1331, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.spin', 'Setting Spin', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1332, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.spin_description', 'Setting spin template', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1333, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.spin_template_title', 'Spin template title', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1334, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.spin_label', 'Spin template', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1335, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.spin_example', '{Pineapple|Fruit}\n{Flowers|Fresh flowers}', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1336, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.add_more', 'Add more', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1337, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.see_documentation', 'See documentation :link.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1338, 1, 'en', 'plugins/ai-writer/ai-writer', 'setting.editor_not_support', 'Currently, AI Writer plugin only supports CKEditor. Please go to Settings > General > Editor and select CKEditor.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1339, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.title', 'AI Writer', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1340, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.generate', 'Generate content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1341, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.spin', 'Spin content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1342, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.push', 'Push content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1343, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.choose_field', 'Choose form field', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1344, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.choose_template', 'Choose spin template', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1345, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.api_model', 'API model', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1346, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.prompt_type', 'Prompt type', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1347, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.prompt_label', 'Prompt message', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1348, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.prompt_placeholder', 'Prompt message...', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1349, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.preview_label', 'Preview content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1350, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.preview_placeholder', 'Preview content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1351, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.spin_placeholder', 'Spin template', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1352, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.request_output_format', 'Presented in HTML for WYSIWYG editors.', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1353, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.language', 'Language', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1354, 1, 'en', 'plugins/ai-writer/ai-writer', 'form.copied', 'Copied content!', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1355, 1, 'en', 'plugins/ai-writer/ai-writer', 'error.incomplete_returned_content', 'Incomplete returned content', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1356, 1, 'en', 'plugins/ai-writer/ai-writer', 'error.occurred_while_processing_api', 'An error occurred while processing the api', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1357, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1358, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1359, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1360, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1361, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1362, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1363, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1364, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1365, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1366, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1367, 1, 'en', 'plugins/analytics/analytics', 'property_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-11-08 01:55:11', '2023-11-08 01:55:11'),
(1368, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1369, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1370, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a Google Analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1371, 1, 'en', 'plugins/analytics/analytics', 'property_id_is_invalid', 'Property ID is invalid. Check this: https://developers.google.com/analytics/devguides/reporting/data/v1/property-id', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1372, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1373, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1374, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id', 'Google tag ID', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1375, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id_placeholder', 'Example: G-76NX8HY29D', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1376, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id', 'Property ID for GA4', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1377, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id_description', 'Google Analytics Property ID (GA4)', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1378, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1379, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1380, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1381, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1382, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1383, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1384, 1, 'en', 'plugins/analytics/analytics', 'missing_library_warning', 'Analytics plugin error: Missing third-party libraries, please run \"composer update\" to install them.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1385, 1, 'en', 'plugins/announcement/announcements', 'name', 'Announcements', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1386, 1, 'en', 'plugins/announcement/announcements', 'enums.announce_placement.top', 'Top', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1387, 1, 'en', 'plugins/announcement/announcements', 'enums.announce_placement.bottom', 'Fixed at bottom', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1388, 1, 'en', 'plugins/announcement/announcements', 'enums.announce_placement.popup', 'Popup', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1389, 1, 'en', 'plugins/announcement/announcements', 'enums.announce_placement.theme', 'Theme built-in', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1390, 1, 'en', 'plugins/announcement/announcements', 'enums.text_alignment.start', 'Start', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1391, 1, 'en', 'plugins/announcement/announcements', 'enums.text_alignment.center', 'Center', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1392, 1, 'en', 'plugins/announcement/announcements', 'validation.font_size', 'Font size must be a valid CSS font size value.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1393, 1, 'en', 'plugins/announcement/announcements', 'validation.text_color', 'Text color must be a valid hex color value.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1394, 1, 'en', 'plugins/announcement/announcements', 'create', 'Create new announcement', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1395, 1, 'en', 'plugins/announcement/announcements', 'add_new', 'Add new', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1396, 1, 'en', 'plugins/announcement/announcements', 'settings.name', 'Settings', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1397, 1, 'en', 'plugins/announcement/announcements', 'settings.description', 'Manage announcement settings', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1398, 1, 'en', 'plugins/announcement/announcements', 'background_color', 'Background color', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1399, 1, 'en', 'plugins/announcement/announcements', 'font_size', 'Font size', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1400, 1, 'en', 'plugins/announcement/announcements', 'font_size_help', 'Leave empty to use default. Example: 1rem, 1em, 12px, ...', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1401, 1, 'en', 'plugins/announcement/announcements', 'text_color', 'Text color', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1402, 1, 'en', 'plugins/announcement/announcements', 'start_date', 'Start date', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1403, 1, 'en', 'plugins/announcement/announcements', 'end_date', 'End date', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1404, 1, 'en', 'plugins/announcement/announcements', 'has_action', 'Has action?', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1405, 1, 'en', 'plugins/announcement/announcements', 'action_label', 'Action label', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1406, 1, 'en', 'plugins/announcement/announcements', 'action_url', 'Action URL', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1407, 1, 'en', 'plugins/announcement/announcements', 'action_open_new_tab', 'Open in new tab?', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1408, 1, 'en', 'plugins/announcement/announcements', 'dismissible_label', 'Allow user to dismiss announcement?', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1409, 1, 'en', 'plugins/announcement/announcements', 'placement', 'Placement', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1410, 1, 'en', 'plugins/announcement/announcements', 'text_alignment', 'Text alignment', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1411, 1, 'en', 'plugins/announcement/announcements', 'is_active', 'Is active?', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1412, 1, 'en', 'plugins/announcement/announcements', 'is_available', 'Is available', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1413, 1, 'en', 'plugins/announcement/announcements', 'max_width', 'Max width', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1414, 1, 'en', 'plugins/announcement/announcements', 'max_width_help', 'Leave empty to use default value. Example: 100%, 500px, ...', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1415, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1416, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1417, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1418, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1419, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1420, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1421, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1422, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1423, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1424, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1425, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1426, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1427, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1428, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1429, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1430, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1431, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1432, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1433, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1434, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1435, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1436, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1437, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1438, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1439, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1440, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1441, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1442, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1443, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1444, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1445, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1446, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1447, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1448, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1449, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1450, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1451, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1452, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1453, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1454, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1455, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1456, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1457, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1458, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1459, 1, 'en', 'plugins/backup/backup', 'proc_open_disabled_error', 'Function <strong>proc_open()</strong> has been disabled so the system cannot backup the database. Please contact your hosting provider to enable it.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1460, 1, 'en', 'plugins/backup/backup', 'database_backup_not_existed', 'Backup database is not existed!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1461, 1, 'en', 'plugins/backup/backup', 'uploads_folder_backup_not_existed', 'Backup uploads folder is not existed!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1462, 1, 'en', 'plugins/backup/backup', 'important_message1', 'This is a simple backup feature, it is a solution for you if your site has < 1GB data and can be used for quickly backup your site.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1463, 1, 'en', 'plugins/backup/backup', 'important_message2', 'If you have more than 1GB images/files in local storage, you should use backup feature of your hosting or VPS.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1464, 1, 'en', 'plugins/backup/backup', 'important_message3', 'To backup your database, function <strong>proc_open()</strong> or <strong>system()</strong> must be enabled. Contact your hosting provider to enable it if it is disabled.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1465, 1, 'en', 'plugins/backup/backup', 'important_message4', 'It is not a full backup, it is just back up uploaded files and your database.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1466, 1, 'en', 'plugins/backup/backup', 'important_message_pgsql1', 'Currently, we cannot backup <strong>PostgreSQL</strong> database on the web due to PostgreSQL doesnt have option to enter database password directly when exporting database.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1467, 1, 'en', 'plugins/backup/backup', 'important_message_pgsql2', 'You can run a command <strong>php artisan cms:backup:create {name}</strong> to generate the backup or <strong>php artisan cms:backup:restore</strong> to restore the latest backup.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1468, 1, 'en', 'plugins/backup/backup', 'cannot_restore_database', 'Cannot restore database. The database backup is missing!', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1469, 1, 'en', 'plugins/backup/backup', 'database_driver_not_supported', 'Database driver is not supported.', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1470, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1471, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1472, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1473, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1474, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1475, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1476, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1477, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1478, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1479, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1480, 1, 'en', 'plugins/blog/base', 'settings.title', 'Blog', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1481, 1, 'en', 'plugins/blog/base', 'settings.description', 'Settings for Blog', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1482, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema', 'Enable Blog Post Schema?', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1483, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema_description', 'Learn more: https://schema.org/Article', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1484, 1, 'en', 'plugins/blog/base', 'settings.schema_type', 'Schema type', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1485, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1486, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1487, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1488, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1489, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1490, 1, 'en', 'plugins/blog/categories', 'total_posts', 'Total posts: :total', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1491, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1492, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1493, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1494, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2023-11-08 01:55:12', '2023-11-08 01:55:12');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1495, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1496, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1497, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1498, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1499, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1500, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1501, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1502, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1503, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1504, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1505, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1506, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2023-11-08 01:55:12', '2023-11-08 01:55:12'),
(1507, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1508, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1509, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1510, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1511, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1512, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1513, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1514, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1515, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1516, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1517, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1518, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1519, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1520, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1521, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1522, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1523, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1524, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1525, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1526, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1527, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1528, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1529, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1530, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1531, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1532, 1, 'en', 'plugins/business-services/business-services', 'name', 'Business Services', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1533, 1, 'en', 'plugins/business-services/business-services', 'settings.success_message', 'Settings has been saved successfully!', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1534, 1, 'en', 'plugins/business-services/business-services', 'service_category.name', 'Service Categories', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1535, 1, 'en', 'plugins/business-services/business-services', 'service_category.create', 'Create Service Category', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1536, 1, 'en', 'plugins/business-services/business-services', 'service.name', 'Services', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1537, 1, 'en', 'plugins/business-services/business-services', 'service.create', 'Create Service', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1538, 1, 'en', 'plugins/business-services/business-services', 'package.name', 'Packages', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1539, 1, 'en', 'plugins/business-services/business-services', 'package.create', 'Create Package', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1540, 1, 'en', 'plugins/business-services/business-services', 'image', 'Image', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1541, 1, 'en', 'plugins/business-services/business-services', 'category', 'Category', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1542, 1, 'en', 'plugins/business-services/business-services', 'duration', 'Duration', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1543, 1, 'en', 'plugins/business-services/business-services', 'price', 'Price', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1544, 1, 'en', 'plugins/business-services/business-services', 'annual_price', 'Annual price', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1545, 1, 'en', 'plugins/business-services/business-services', 'form.none', 'None', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1546, 1, 'en', 'plugins/business-services/business-services', 'form.images', 'Images', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1547, 1, 'en', 'plugins/business-services/business-services', 'form.name_placeholder', 'Enter name', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1548, 1, 'en', 'plugins/business-services/business-services', 'form.is_featured', 'Is featured?', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1549, 1, 'en', 'plugins/business-services/business-services', 'form.price_placeholder', 'Enter price', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1550, 1, 'en', 'plugins/business-services/business-services', 'form.annual_price_placeholder', 'Enter annual price', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1551, 1, 'en', 'plugins/business-services/business-services', 'form.features', 'Features', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1552, 1, 'en', 'plugins/business-services/business-services', 'form.features_help_block', 'Separate by new line (+ is included, - is not included)', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1553, 1, 'en', 'plugins/business-services/business-services', 'form.features_placeholder', 'Example:\n+ 15-Days Shipping World Wide\n+ Free Bubble Warp\n- 24/7 Support\n        ', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1554, 1, 'en', 'plugins/business-services/business-services', 'form.description_placeholder', 'Enter description', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1555, 1, 'en', 'plugins/business-services/business-services', 'is_popular', 'Is popular?', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1556, 1, 'en', 'plugins/business-services/business-services', 'enums.package_durations.hourly', 'Hourly', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1557, 1, 'en', 'plugins/business-services/business-services', 'enums.package_durations.daily', 'Daily', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1558, 1, 'en', 'plugins/business-services/business-services', 'enums.package_durations.weekly', 'Weekly', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1559, 1, 'en', 'plugins/business-services/business-services', 'enums.package_durations.monthly', 'Monthly', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1560, 1, 'en', 'plugins/business-services/business-services', 'enums.package_durations.annually', 'Annually', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1561, 1, 'en', 'plugins/business-services/business-services', 'enums.package_durations.quarterly', 'Quarterly', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1562, 1, 'en', 'plugins/business-services/business-services', 'enums.quote_statuses.read', 'Read', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1563, 1, 'en', 'plugins/business-services/business-services', 'enums.quote_statuses.unread', 'Unread', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1564, 1, 'en', 'plugins/business-services/business-services', 'edit_this_service', 'Edit this service', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1565, 1, 'en', 'plugins/business-services/business-services', 'edit_this_service_category', 'Edit this service category', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1566, 1, 'en', 'plugins/business-services/business-services', 'edit_this_package', 'Edit this package', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1567, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1568, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1569, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1570, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1571, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1572, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1573, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1574, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1575, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1576, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1577, 1, 'en', 'plugins/captcha/captcha', 'numbers.0', 'Zero', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1578, 1, 'en', 'plugins/captcha/captcha', 'numbers.1', 'One', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1579, 1, 'en', 'plugins/captcha/captcha', 'numbers.2', 'Two', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1580, 1, 'en', 'plugins/captcha/captcha', 'numbers.3', 'Three', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1581, 1, 'en', 'plugins/captcha/captcha', 'numbers.4', 'Four', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1582, 1, 'en', 'plugins/captcha/captcha', 'numbers.5', 'Five', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1583, 1, 'en', 'plugins/captcha/captcha', 'numbers.6', 'Six', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1584, 1, 'en', 'plugins/captcha/captcha', 'numbers.7', 'Seven', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1585, 1, 'en', 'plugins/captcha/captcha', 'numbers.8', 'Eight', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1586, 1, 'en', 'plugins/captcha/captcha', 'numbers.9', 'Nine', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1587, 1, 'en', 'plugins/captcha/captcha', 'numbers.10', 'Ten', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1588, 1, 'en', 'plugins/captcha/captcha', 'numbers.11', 'Eleven', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1589, 1, 'en', 'plugins/captcha/captcha', 'numbers.12', 'Twelve', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1590, 1, 'en', 'plugins/captcha/captcha', 'operands.+', 'plus', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1591, 1, 'en', 'plugins/captcha/captcha', 'operands.-', 'minus', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1592, 1, 'en', 'plugins/captcha/captcha', 'operands.*', 'times', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1593, 1, 'en', 'plugins/captcha/captcha', 'operands./', 'divided by', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1594, 1, 'en', 'plugins/career/career', 'name', 'Careers', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1595, 1, 'en', 'plugins/career/career', 'create', 'New career', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1596, 1, 'en', 'plugins/career/career', 'location', 'Location', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1597, 1, 'en', 'plugins/career/career', 'salary', 'Salary', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1598, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1599, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1600, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1601, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1602, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1603, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1604, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1605, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1606, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1607, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1608, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1609, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1610, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2023-11-08 01:55:13', '2023-11-08 01:55:13'),
(1611, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1612, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1613, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1614, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1615, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1616, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1617, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1618, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1619, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1620, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1621, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1622, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1623, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1624, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1625, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1626, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1627, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1628, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1629, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1630, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1631, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1632, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1633, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1634, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1635, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1636, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1637, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1638, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1639, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1640, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1641, 1, 'en', 'plugins/contact/contact', 'settings.title', 'Contact', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1642, 1, 'en', 'plugins/contact/contact', 'settings.description', 'Settings for contact plugin', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1643, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords', 'Blacklist keywords', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1644, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_placeholder', 'keywords...', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1645, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_helper', 'Blacklist contact requests if it includes those keywords in the content field (separate by comma).', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1646, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains', 'Blacklist email domains', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1647, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_placeholder', 'domain...', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1648, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_helper', 'Blacklist contact requests if the email domain is in blacklist domains (separate by comma).', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1649, 1, 'en', 'plugins/contact/contact', 'settings.enable_math_captcha', 'Enable math captcha?', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1650, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1651, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1652, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1653, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1654, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1655, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1656, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1657, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1658, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1659, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1660, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1661, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1662, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1663, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1664, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1665, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1666, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1667, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.style', 'Style', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1668, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.full_width', 'Full width', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1669, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.minimal', 'Minimal', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1670, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1671, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1672, 1, 'en', 'plugins/ecommerce/addresses', 'address', 'Address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1673, 1, 'en', 'plugins/ecommerce/addresses', 'addresses', 'Addresses', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1674, 1, 'en', 'plugins/ecommerce/addresses', 'address_placeholder', 'Enter address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1675, 1, 'en', 'plugins/ecommerce/addresses', 'zip', 'Zip code', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1676, 1, 'en', 'plugins/ecommerce/addresses', 'zip_placeholder', 'Enter zip code', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1677, 1, 'en', 'plugins/ecommerce/addresses', 'city', 'City', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1678, 1, 'en', 'plugins/ecommerce/addresses', 'city_placeholder', 'Enter city', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1679, 1, 'en', 'plugins/ecommerce/addresses', 'state', 'State', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1680, 1, 'en', 'plugins/ecommerce/addresses', 'state_placeholder', 'Enter state', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1681, 1, 'en', 'plugins/ecommerce/addresses', 'country', 'Country', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1682, 1, 'en', 'plugins/ecommerce/addresses', 'use_this_address_as_default', 'Use this address as default', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1683, 1, 'en', 'plugins/ecommerce/addresses', 'name', 'Full name', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1684, 1, 'en', 'plugins/ecommerce/addresses', 'name_placeholder', 'Enter name', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1685, 1, 'en', 'plugins/ecommerce/addresses', 'phone', 'Phone', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1686, 1, 'en', 'plugins/ecommerce/addresses', 'phone_placeholder', 'Enter phone', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1687, 1, 'en', 'plugins/ecommerce/addresses', 'email', 'Email', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1688, 1, 'en', 'plugins/ecommerce/addresses', 'email_placeholder', 'Enter email', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1689, 1, 'en', 'plugins/ecommerce/addresses', 'select_state', 'Select state...', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1690, 1, 'en', 'plugins/ecommerce/addresses', 'select_city', 'Select city...', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1691, 1, 'en', 'plugins/ecommerce/addresses', 'select_country', 'Select country...', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1692, 1, 'en', 'plugins/ecommerce/addresses', 'add_address', 'Add Address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1693, 1, 'en', 'plugins/ecommerce/addresses', 'new_address', 'New address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1694, 1, 'en', 'plugins/ecommerce/addresses', 'edit_address', 'Edit address', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1695, 1, 'en', 'plugins/ecommerce/addresses', 'action', 'Action', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1696, 1, 'en', 'plugins/ecommerce/addresses', 'add', 'Add', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1697, 1, 'en', 'plugins/ecommerce/addresses', 'save', 'Save', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1698, 1, 'en', 'plugins/ecommerce/addresses', 'no_data', 'No data to display', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1699, 1, 'en', 'plugins/ecommerce/addresses', 'no_option', 'No option', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1700, 1, 'en', 'plugins/ecommerce/brands', 'name', 'Brands', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1701, 1, 'en', 'plugins/ecommerce/brands', 'create', 'New brand', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1702, 1, 'en', 'plugins/ecommerce/brands', 'edit', 'Edit brand', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1703, 1, 'en', 'plugins/ecommerce/brands', 'form.name', 'Name', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1704, 1, 'en', 'plugins/ecommerce/brands', 'form.name_placeholder', 'Brand\'s name (Maximum 255 characters)', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1705, 1, 'en', 'plugins/ecommerce/brands', 'form.description', 'Description', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1706, 1, 'en', 'plugins/ecommerce/brands', 'form.description_placeholder', 'Short description for brand (Maximum 400 characters)', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1707, 1, 'en', 'plugins/ecommerce/brands', 'form.website', 'Website', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1708, 1, 'en', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1709, 1, 'en', 'plugins/ecommerce/brands', 'form.is_featured', 'Is featured', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1710, 1, 'en', 'plugins/ecommerce/brands', 'logo', 'Logo', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1711, 1, 'en', 'plugins/ecommerce/brands', 'website', 'Website', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1712, 1, 'en', 'plugins/ecommerce/brands', 'notices.no_select', 'Please select at least one record to take this action!', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1713, 1, 'en', 'plugins/ecommerce/brands', 'notices.update_success_message', 'Update successfully', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1714, 1, 'en', 'plugins/ecommerce/brands', 'cannot_delete', 'Brand could not be deleted', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1715, 1, 'en', 'plugins/ecommerce/brands', 'brand_deleted', 'Brand deleted', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1716, 1, 'en', 'plugins/ecommerce/brands', 'menu', 'Brands', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1717, 1, 'en', 'plugins/ecommerce/brands', 'no_brand', 'No brand', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1718, 1, 'en', 'plugins/ecommerce/brands', 'intro.title', 'Manage brands', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1719, 1, 'en', 'plugins/ecommerce/brands', 'intro.description', 'Manage product brands such as Nike, Adidas, Bitis ...', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1720, 1, 'en', 'plugins/ecommerce/brands', 'intro.button_text', 'Create brand', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1721, 1, 'en', 'plugins/ecommerce/bulk-import', 'name', 'Bulk Import', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1722, 1, 'en', 'plugins/ecommerce/bulk-import', 'loading_text', 'Importing', '2023-11-08 01:55:14', '2023-11-08 01:55:14'),
(1723, 1, 'en', 'plugins/ecommerce/bulk-import', 'imported_successfully', 'Imported successfully.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1724, 1, 'en', 'plugins/ecommerce/bulk-import', 'please_choose_the_file_mime', 'Please choose the file mime :types', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1725, 1, 'en', 'plugins/ecommerce/bulk-import', 'please_choose_the_file', 'Please choose the file', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1726, 1, 'en', 'plugins/ecommerce/bulk-import', 'start_import', 'Start Import', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1727, 1, 'en', 'plugins/ecommerce/bulk-import', 'note', 'Note!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1728, 1, 'en', 'plugins/ecommerce/bulk-import', 'warning_before_importing', 'If this is your first time using this feature, please read the documentation or contact the Administrator for access to the correct functionality!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1729, 1, 'en', 'plugins/ecommerce/bulk-import', 'results', 'Result: :success successes, :failed failures', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1730, 1, 'en', 'plugins/ecommerce/bulk-import', 'failures', 'Failures', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1731, 1, 'en', 'plugins/ecommerce/bulk-import', 'tables.import', 'Import', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1732, 1, 'en', 'plugins/ecommerce/bulk-import', 'template', 'Template', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1733, 1, 'en', 'plugins/ecommerce/bulk-import', 'rules', 'Rules', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1734, 1, 'en', 'plugins/ecommerce/bulk-import', 'choose_file_with_mime', 'Choose file with mime: (:types)', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1735, 1, 'en', 'plugins/ecommerce/bulk-import', 'choose_file', 'Choose file', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1736, 1, 'en', 'plugins/ecommerce/bulk-import', 'menu', 'Import products', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1737, 1, 'en', 'plugins/ecommerce/bulk-import', 'download-csv-file', 'Download CSV template', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1738, 1, 'en', 'plugins/ecommerce/bulk-import', 'download-excel-file', 'Download Excel template', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1739, 1, 'en', 'plugins/ecommerce/bulk-import', 'downloading', 'Downloading...', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1740, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.input_error', 'Input error', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1741, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.number_not_allowed', 'Number is not allowed!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1742, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.allowed_input', 'Allowed input', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1743, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.prompt_decimal', 'Only numbers or decimals are accepted and greater than or equal to :min.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1744, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.prompt_whole_number', 'Only numbers are accepted and greater than or equal to :min.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1745, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.prompt_list', 'Please pick a value from the drop-down list.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1746, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.pick_from_list', 'Pick from list', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1747, 1, 'en', 'plugins/ecommerce/bulk-import', 'export.template.value_not_in_list', 'Value is not in list.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1748, 1, 'en', 'plugins/ecommerce/bulk-import', 'import_failed_description', 'Import failed, please check the errors below!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1749, 1, 'en', 'plugins/ecommerce/bulk-import', 'column', 'Column', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1750, 1, 'en', 'plugins/ecommerce/bulk-import', 'row', 'Row', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1751, 1, 'en', 'plugins/ecommerce/bulk-import', 'attribute', 'Attribute', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1752, 1, 'en', 'plugins/ecommerce/bulk-import', 'errors', 'Errors', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1753, 1, 'en', 'plugins/ecommerce/bulk-import', 'import_types.name', 'Import type', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1754, 1, 'en', 'plugins/ecommerce/bulk-import', 'import_types.all', 'All', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1755, 1, 'en', 'plugins/ecommerce/bulk-import', 'import_types.products', 'Products', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1756, 1, 'en', 'plugins/ecommerce/bulk-import', 'import_types.variations', 'Variations', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1757, 1, 'en', 'plugins/ecommerce/bulk-import', 'import_products', 'Import products', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1758, 1, 'en', 'plugins/ecommerce/currency', 'currencies', 'Currencies', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1759, 1, 'en', 'plugins/ecommerce/currency', 'setting_description', 'List of currencies using on website', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1760, 1, 'en', 'plugins/ecommerce/currency', 'name', 'Name', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1761, 1, 'en', 'plugins/ecommerce/currency', 'symbol', 'Symbol', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1762, 1, 'en', 'plugins/ecommerce/currency', 'number_of_decimals', 'Number of decimals', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1763, 1, 'en', 'plugins/ecommerce/currency', 'exchange_rate', 'Exchange rate', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1764, 1, 'en', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'Position of symbol', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1765, 1, 'en', 'plugins/ecommerce/currency', 'is_default', 'Is default?', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1766, 1, 'en', 'plugins/ecommerce/currency', 'remove', 'Remove', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1767, 1, 'en', 'plugins/ecommerce/currency', 'new_currency', 'Add a new currency', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1768, 1, 'en', 'plugins/ecommerce/currency', 'save_settings', 'Save settings', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1769, 1, 'en', 'plugins/ecommerce/currency', 'before_number', 'Before number', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1770, 1, 'en', 'plugins/ecommerce/currency', 'after_number', 'After number', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1771, 1, 'en', 'plugins/ecommerce/currency', 'require_at_least_one_currency', 'The system requires at least one currency!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1772, 1, 'en', 'plugins/ecommerce/currency', 'enable_auto_detect_visitor_currency', 'Enable auto-detect visitor currency?', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1773, 1, 'en', 'plugins/ecommerce/currency', 'auto_detect_visitor_currency_description', 'It detects visitor currency based on browser language. It will override default currency selection.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1774, 1, 'en', 'plugins/ecommerce/currency', 'add_space_between_price_and_currency', 'Add a space between price and currency?', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1775, 1, 'en', 'plugins/ecommerce/currency', 'invalid_currency_name', 'Invalid currency code, it must be in :currencies.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1776, 1, 'en', 'plugins/ecommerce/currency', 'instruction', 'Please check list currency code here: https://en.wikipedia.org/wiki/ISO_4217', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1777, 1, 'en', 'plugins/ecommerce/currency', 'code', 'Code', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1778, 1, 'en', 'plugins/ecommerce/currency', 'api_key', 'API exchange rates key', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1779, 1, 'en', 'plugins/ecommerce/currency', 'update_currency_rates', 'Update currency rates', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1780, 1, 'en', 'plugins/ecommerce/currency', 'clear_cache_rates', 'Clear cache rates', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1781, 1, 'en', 'plugins/ecommerce/currency', 'no_api_key', 'No API key', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1782, 1, 'en', 'plugins/ecommerce/currency', 'api_key_helper', 'Get exchange rate API key on :link', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1783, 1, 'en', 'plugins/ecommerce/currency', 'use_exchange_rate_from_api', 'Use exchange rate from API?', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1784, 1, 'en', 'plugins/ecommerce/currency', 'clear_cache_rates_successfully', 'Clear cache currency rates successfully.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1785, 1, 'en', 'plugins/ecommerce/customer', 'name', 'Customers', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1786, 1, 'en', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1787, 1, 'en', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1788, 1, 'en', 'plugins/ecommerce/customer', 'email', 'Email', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1789, 1, 'en', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1790, 1, 'en', 'plugins/ecommerce/customer', 'password', 'Password', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1791, 1, 'en', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1792, 1, 'en', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1793, 1, 'en', 'plugins/ecommerce/customer', 'intro.title', 'Manage customers', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1794, 1, 'en', 'plugins/ecommerce/customer', 'intro.description', 'When a customer buy your product(s), you will know their order histories.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1795, 1, 'en', 'plugins/ecommerce/customer', 'intro.button_text', 'Create customer', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1796, 1, 'en', 'plugins/ecommerce/customer', 'phone', 'Phone', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1797, 1, 'en', 'plugins/ecommerce/customer', 'phone_placeholder', 'Phone', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1798, 1, 'en', 'plugins/ecommerce/customer', 'avatar', 'Avatar', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1799, 1, 'en', 'plugins/ecommerce/customer', 'dob', 'Date of birth', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1800, 1, 'en', 'plugins/ecommerce/customer', 'statuses.activated', 'Activated', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1801, 1, 'en', 'plugins/ecommerce/customer', 'statuses.locked', 'Locked', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1802, 1, 'en', 'plugins/ecommerce/customer', 'email_verified', 'Email verified?', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1803, 1, 'en', 'plugins/ecommerce/customer', 'verify_email.confirm_heading', 'Verify email confirmation', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1804, 1, 'en', 'plugins/ecommerce/customer', 'verify_email.confirm_description', 'Are you sure you want to verify email this customer?', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1805, 1, 'en', 'plugins/ecommerce/customer', 'verify_email.notification', 'This customer is not verified email yet? :approve_link to verify email.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1806, 1, 'en', 'plugins/ecommerce/customer', 'verify_email.approve_here', 'click here', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1807, 1, 'en', 'plugins/ecommerce/customer', 'verify_email.confirm_button', 'Verify', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1808, 1, 'en', 'plugins/ecommerce/discount', 'name', 'Discounts', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1809, 1, 'en', 'plugins/ecommerce/discount', 'create', 'Create discount', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1810, 1, 'en', 'plugins/ecommerce/discount', 'edit', 'Edit discount', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1811, 1, 'en', 'plugins/ecommerce/discount', 'invalid_coupon', 'This coupon is invalid or expired!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1812, 1, 'en', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'Cannot use this coupon in the same time with other discount program!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1813, 1, 'en', 'plugins/ecommerce/discount', 'not_used', 'This coupon is not used yet!', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1814, 1, 'en', 'plugins/ecommerce/discount', 'detail', 'Detail', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1815, 1, 'en', 'plugins/ecommerce/discount', 'used', 'Used', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1816, 1, 'en', 'plugins/ecommerce/discount', 'intro.title', 'Manage discount/coupon code', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1817, 1, 'en', 'plugins/ecommerce/discount', 'intro.description', 'Create coupon code or promotion for your products.', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1818, 1, 'en', 'plugins/ecommerce/discount', 'intro.button_text', 'Create discount', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1819, 1, 'en', 'plugins/ecommerce/discount', 'expired', 'Expired', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1820, 1, 'en', 'plugins/ecommerce/discount', 'discount_promotion', 'Discount promotion', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1821, 1, 'en', 'plugins/ecommerce/discount', 'can', 'can', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1822, 1, 'en', 'plugins/ecommerce/discount', 'cannot', 'cannot', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1823, 1, 'en', 'plugins/ecommerce/discount', 'use_with_promotion', 'be used with promotion', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1824, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_title_required_if', 'Please enter the name of the promotion', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1825, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_code_required_if', 'Please enter the promotion code', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1826, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_value_required', 'Amount must be greater than 0', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1827, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_validate_target_required', 'No object selected for promotion', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1828, 1, 'en', 'plugins/ecommerce/discount', 'enums.type-options.amount', 'Amount - Fixed', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1829, 1, 'en', 'plugins/ecommerce/discount', 'enums.type-options.percentage', 'Discount %', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1830, 1, 'en', 'plugins/ecommerce/discount', 'enums.type-options.shipping', 'Free shipping', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1831, 1, 'en', 'plugins/ecommerce/discount', 'enums.type-options.same-price', 'Same price', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1832, 1, 'en', 'plugins/ecommerce/discount', 'enums.types.coupon', 'Coupon', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1833, 1, 'en', 'plugins/ecommerce/discount', 'enums.types.promotion', 'Promotion', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1834, 1, 'en', 'plugins/ecommerce/discount', 'enums.targets.all-orders', 'All orders', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1835, 1, 'en', 'plugins/ecommerce/discount', 'enums.targets.customer', 'Customer', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1836, 1, 'en', 'plugins/ecommerce/discount', 'enums.targets.amount-minimum-order', 'Minimum order amount', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1837, 1, 'en', 'plugins/ecommerce/discount', 'enums.targets.product-variant', 'Product variant', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1838, 1, 'en', 'plugins/ecommerce/discount', 'enums.targets.group-products', 'Product collections', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1839, 1, 'en', 'plugins/ecommerce/discount', 'enums.targets.specific-product', 'Specific product', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1840, 1, 'en', 'plugins/ecommerce/discount', 'discount', 'Discount', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1841, 1, 'en', 'plugins/ecommerce/discount', 'create_coupon_code', 'Create coupon code', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1842, 1, 'en', 'plugins/ecommerce/discount', 'create_discount_promotion', 'Create discount promotion', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1843, 1, 'en', 'plugins/ecommerce/discount', 'generate_coupon_code', 'Generate coupon code', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1844, 1, 'en', 'plugins/ecommerce/discount', 'customers_will_enter_this_coupon_code_when_they_checkout', 'Customers will enter this coupon code when they checkout', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1845, 1, 'en', 'plugins/ecommerce/discount', 'select_type_of_discount', 'Select type of discount', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1846, 1, 'en', 'plugins/ecommerce/discount', 'coupon_code', 'Coupon code', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1847, 1, 'en', 'plugins/ecommerce/discount', 'promotion', 'Promotion', '2023-11-08 01:55:15', '2023-11-08 01:55:15'),
(1848, 1, 'en', 'plugins/ecommerce/discount', 'can_be_used_with_promotion', 'Can be used with promotion?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1849, 1, 'en', 'plugins/ecommerce/discount', 'unlimited_coupon', 'Unlimited coupon?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1850, 1, 'en', 'plugins/ecommerce/discount', 'enter_number', 'Enter number', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1851, 1, 'en', 'plugins/ecommerce/discount', 'coupon_type', 'Coupon type', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1852, 1, 'en', 'plugins/ecommerce/discount', 'percentage_discount', 'Percentage discount (%)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1853, 1, 'en', 'plugins/ecommerce/discount', 'free_shipping', 'Free shipping', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1854, 1, 'en', 'plugins/ecommerce/discount', 'same_price', 'Same price', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1855, 1, 'en', 'plugins/ecommerce/discount', 'apply_for', 'apply for', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1856, 1, 'en', 'plugins/ecommerce/discount', 'all_orders', 'All orders', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1857, 1, 'en', 'plugins/ecommerce/discount', 'order_amount_from', 'Order amount from', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1858, 1, 'en', 'plugins/ecommerce/discount', 'product_collection', 'Product collection', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1859, 1, 'en', 'plugins/ecommerce/discount', 'product_category', 'Product category', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1860, 1, 'en', 'plugins/ecommerce/discount', 'product', 'Product', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1861, 1, 'en', 'plugins/ecommerce/discount', 'customer', 'Customer', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1862, 1, 'en', 'plugins/ecommerce/discount', 'variant', 'Variant', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1863, 1, 'en', 'plugins/ecommerce/discount', 'search_product', 'Search product', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1864, 1, 'en', 'plugins/ecommerce/discount', 'no_products_found', 'No products found!', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1865, 1, 'en', 'plugins/ecommerce/discount', 'search_customer', 'Search customer', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1866, 1, 'en', 'plugins/ecommerce/discount', 'no_customer_found', 'No customer found!', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1867, 1, 'en', 'plugins/ecommerce/discount', 'one_time_per_order', 'One time per order', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1868, 1, 'en', 'plugins/ecommerce/discount', 'one_time_per_product_in_cart', 'One time per product in cart', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1869, 1, 'en', 'plugins/ecommerce/discount', 'number_of_products', 'Number of products required to apply', '2023-11-08 01:55:16', '2023-11-08 01:55:16');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1870, 1, 'en', 'plugins/ecommerce/discount', 'selected_products', 'Selected products', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1871, 1, 'en', 'plugins/ecommerce/discount', 'selected_customers', 'Selected customers', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1872, 1, 'en', 'plugins/ecommerce/discount', 'time', 'Time', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1873, 1, 'en', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1874, 1, 'en', 'plugins/ecommerce/discount', 'end_date', 'End date', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1875, 1, 'en', 'plugins/ecommerce/discount', 'never_expired', 'Never expired?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1876, 1, 'en', 'plugins/ecommerce/discount', 'save', 'Save', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1877, 1, 'en', 'plugins/ecommerce/discount', 'enter_promotion_name', 'Enter promotion name', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1878, 1, 'en', 'plugins/ecommerce/discount', 'enter_coupon_name', 'Enter coupon name', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1879, 1, 'en', 'plugins/ecommerce/discount', 'cancel', 'Cancel', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1880, 1, 'en', 'plugins/ecommerce/discount', 'is', 'Is', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1881, 1, 'en', 'plugins/ecommerce/discount', 'when_shipping_fee_less_than', 'when shipping fee less than', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1882, 1, 'en', 'plugins/ecommerce/discount', 'minimum_order_amount_error', 'You are under :minimum_amount to apply the coupon, you must add :add_more more items to your cart', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1883, 1, 'en', 'plugins/ecommerce/discount', 'once_per_customer', 'Once per customer', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1884, 1, 'en', 'plugins/ecommerce/discount', 'you_need_login_to_use_coupon_code', 'You need to login to use this coupon code', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1885, 1, 'en', 'plugins/ecommerce/discount', 'you_used_coupon_code', 'You have already used this coupon code', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1886, 1, 'en', 'plugins/ecommerce/discount', 'customer_used_coupon_code', 'Customers who have used this discount code', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1887, 1, 'en', 'plugins/ecommerce/discount', 'apply_via_url', 'Apply via URL?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1888, 1, 'en', 'plugins/ecommerce/discount', 'apply_via_url_description', 'This setting will apply coupon code when customers access the URL with the parameter \"?coupon=code\".', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1889, 1, 'en', 'plugins/ecommerce/ecommerce', 'settings', 'Settings', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1890, 1, 'en', 'plugins/ecommerce/ecommerce', 'name', 'Ecommerce', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1891, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1892, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1893, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1894, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1895, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1896, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1897, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1898, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1899, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1900, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1901, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.title', 'Basic information', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1902, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.state', 'State', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1903, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.city', 'City', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1904, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.country', 'Country', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1905, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_gram', 'Gram (g)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1906, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_kilogram', 'Kilogram (kg)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1907, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_lb', 'Pound (lb)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1908, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.weight_unit_oz', 'Ounce (oz)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1909, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_cm', 'Centimeter (cm)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1910, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_m', 'Meter (m)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1911, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.height_unit_inch', 'Inch', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1912, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.store_locator_title', 'Store locators', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1913, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.store_locator_description', 'All the lists of your chains, main stores, branches, etc. The locations can be used to track sales and to help us configure tax rates to charge when selling products.', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1914, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.phone', 'Phone', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1915, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email_address', 'Email', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1916, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.address', 'Address', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1917, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.is_primary', 'Primary?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1918, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.add_new', 'Add new', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1919, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.or', 'Or', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1920, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.change_primary_store', 'change default store locator', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1921, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.other_settings', 'Other settings', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1922, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.other_settings_description', 'Settings for cart, review...', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1923, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_cart', 'Enable shopping cart?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1924, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_tax', 'Enable tax?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1925, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.display_product_price_including_taxes', 'Display product price including taxes?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1926, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_review', 'Enable review?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1927, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_quick_buy_button', 'Enable quick buy button?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1928, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.quick_buy_target', 'Quick buy target page?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1929, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.checkout_page', 'Checkout page', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1930, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.cart_page', 'Cart page', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1931, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.add_location', 'Add location', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1932, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.edit_location', 'Edit location', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1933, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.delete_location', 'Delete location', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1934, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.change_primary_location', 'Change primary location', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1935, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.delete_location_confirmation', 'Are you sure you want to delete this location? This action cannot be undo.', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1936, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.save_location', 'Save location', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1937, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.accept', 'Accept', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1938, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.select_country', 'Select country...', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1939, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.zip_code_enabled', 'Enable Zip Code?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1940, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.thousands_separator', 'Thousands separator', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1941, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.decimal_separator', 'Decimal separator', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1942, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_period', 'Period (.)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1943, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_comma', 'Comma (,)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1944, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.separator_space', 'Space ( )', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1945, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.available_countries', 'Available countries', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1946, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.all', 'All', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1947, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.verify_customer_email', 'Verify customer\'s email?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1948, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.minimum_order_amount', 'Minimum order amount to place an order (:currency).', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1949, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_guest_checkout', 'Enable guest checkout?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1950, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.show_number_of_products', 'Show number of products in the product single', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1951, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.payment_method_cod_minimum_amount', 'Minimum order amount - :currency (Optional)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1952, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.review.max_file_size', 'Review max file size (MB)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1953, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.review.max_file_number', 'Review max file number', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1954, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.using_custom_font_for_invoice', 'Using custom font for invoice?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1955, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.invoice_font_family', 'Invoice font family (Only work for Latin language)', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1956, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_invoice_stamp', 'Enable invoice stamp?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1957, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.invoice_support_arabic_language', 'Support Arabic language in invoice?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1958, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.disable_order_invoice_until_order_confirmed', 'Disable order invoice until order confirmed?', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1959, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.vat_number', 'VAT number', '2023-11-08 01:55:16', '2023-11-08 01:55:16'),
(1960, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.tax_id', 'Tax ID', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1961, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_recaptcha_in_register_page', 'Enable Recaptcha in the registration page?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1962, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_math_captcha_in_register_page', 'Enable Math captcha in the registration page?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1963, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_recaptcha_in_register_page_description', 'Need to setup Captcha in Admin -> Settings -> General first.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1964, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.show_out_of_stock_products', 'Show out of stock products?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1965, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.default_tax_rate', 'Default tax rate', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1966, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.default_tax_rate_description', 'Important: it will be applied if no tax selected in product.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1967, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.how_to_display_product_variation_images', 'How to display product variation images?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1968, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.only_variation_images', 'Only variation images', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1969, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.variation_images_and_main_product_images', 'Variation images + main product images', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1970, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.load_countries_states_cities_from_location_plugin', 'Load countries, states, cities from plugin location?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1971, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.load_countries_states_cities_from_location_plugin_placeholder', 'After changing this option, you need to update all addresses again. You should set it once.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1972, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_wishlist', 'Enable wishlist?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1973, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_compare', 'Enable compare?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1974, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_order_tracking', 'Enable order tracking?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1975, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.recently_viewed.enable', 'Enable customer recently viewed products?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1976, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.recently_viewed.max', 'Maximum number of customer recently viewed products', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1977, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.recently_viewed.max_helper', 'If you set 0, it will save all products.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1978, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.search_products', 'Search products', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1979, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.search_products_description', 'Config rules to search products', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1980, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.search_for_an_exact_phrase', 'Search for an exact phrase?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1981, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.search_products_by', 'Search products by:', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1982, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.tracking_settings', 'Tracking settings', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1983, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.tracking_settings_description', 'Manage tracking: UTM, Facebook, Google Tag Manager...', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1984, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_facebook_pixel', 'Enable Facebook Pixel (Meta Pixel)?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1985, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.facebook_pixel_id', 'Facebook Pixel ID', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1986, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.facebook_pixel_helper', 'Go to https://developers.facebook.com/docs/meta-pixel to create Facebook Pixel.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1987, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_google_tag_manager', 'Enable Google Tag Manager?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1988, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.google_tag_manager_code', 'Google Tag Manager code', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1989, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.google_tag_manager_helper', 'Go to https://ads.google.com/aw/conversions to create Google Ads Conversions.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1990, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.webhook', 'Webhook', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1991, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.webhook_description', 'Send webhook when order placed.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1992, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.shipping', 'Shipping', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1993, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.shipping_description', 'Settings for shipping', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1994, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.hide_other_shipping_options_if_it_has_free_shipping', 'Hide other shipping options if it has free shipping in the list?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1995, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.order_placed_webhook_url', 'Order placed webhook URL (method: POST)', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1996, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.return_request', 'Return Request', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1997, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.return_request_description', 'Number of days a customer can request a return after the order is completed.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1998, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.returnable_days', 'Refundable days', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(1999, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.billing_address_enabled', 'Enable billing address?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2000, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.activate_custom_return_product_quantity', 'Activate custom return product quantity?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2001, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.allow_partial_return', 'Allow partial return?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2002, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.allow_partial_return_description', 'Customer can return a few products, do not need to return all products in an order.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2003, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.activate_custom_return_product_quantity_description', 'Allow customer to change the quantity of the product they want to return.', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2004, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.digital_product', 'Digital product', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2005, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.digital_product_title', 'Is enabled to support the digital products?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2006, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.allow_guest_checkout_for_digital_products', 'Allow guest checkout for digital products?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2007, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_settings', 'Company settings', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2008, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_settings_description', 'Settings Company information for invoicing', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2009, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_name', 'Company name', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2010, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_address', 'Company address', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2011, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_zipcode', 'Company zipcode', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2012, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_email', 'Company email', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2013, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_phone', 'Company phone', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2014, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_logo', 'Company logo', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2015, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.company_tax_id', 'Company tax ID', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2016, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.invoice_code_prefix', 'Invoice code prefix', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2017, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.only_allow_customers_purchased_to_review', 'Only customers who have purchased the product can review the product?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2018, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_order_auto_confirmed', 'Auto confirm order?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2019, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.is_enabled_order_return', 'Is enabled order return?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2020, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.is_enabled_product_options', 'Is enabled product options?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2021, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.exchange_rate.choose_api_provider', 'Choose API provider', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2022, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.exchange_rate.select', '-- Select --', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2023, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.exchange_rate.provider.api_layer', 'API Layer', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2024, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.exchange_rate.provider.open_exchange_rate', 'Open Exchange Rates', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2025, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.exchange_rate.open_exchange_app_id', 'Open Exchange Rates App ID', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2026, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.display_bank_info_at_the_checkout_success_page', 'Display bank info at the checkout success page?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2027, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.mandatory_form_fields_at_checkout', 'Mandatory fields at the checkout page:', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2028, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.hide_form_fields_at_checkout', 'Hide customer fields at checkout page:', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2029, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.display_tax_fields_at_checkout_page', 'Display tax information fields at the checkout page?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2030, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_filter_products_by_brands', 'Enable filter products by brands?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2031, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_filter_products_by_tags', 'Enable filter products by tags?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2032, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.enable_filter_products_by_attributes', 'Enable filter products by attributes?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2033, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.use_city_field_as_field_text', 'Use city field as a free text field?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2034, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.auto_generate_product_sku', 'Auto generate SKU when creating product?', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2035, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.product_sku_format', 'SKU format', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2036, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.product_sku_format_helper', 'You can use %s (1 string character) or %d (1 digit) in the format to generate random string. Ex: SKU-%s%s%s-HN-%d%d%d', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2037, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_address', 'Store address', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2038, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_phone', 'Store phone', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2039, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_id', 'Order ID', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2040, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_token', 'Order token', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2041, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_name', 'Customer name', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2042, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_email', 'Customer email', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2043, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_phone', 'Customer phone', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2044, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_address', 'Customer address', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2045, 1, 'en', 'plugins/ecommerce/ecommerce', 'product_list', 'List products in order', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2046, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_note', 'Order note', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2047, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Payment detail', '2023-11-08 01:55:17', '2023-11-08 01:55:17'),
(2048, 1, 'en', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Shipping method', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2049, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_method', 'Payment method', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2050, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Standard & Format', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2051, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'Standards and formats are used to calculate things like product prices, shipping weights, and order times.', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2052, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Edit order code format (optional)', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2053, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'The default order code starts at: number. You can change the start or end string to create the order code you want, for example \"DH-: number\" or \": number-A\"', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2054, 1, 'en', 'plugins/ecommerce/ecommerce', 'start_with', 'Start with', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2055, 1, 'en', 'plugins/ecommerce/ecommerce', 'end_with', 'End with', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2056, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'Your order code will be shown', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2057, 1, 'en', 'plugins/ecommerce/ecommerce', 'weight_unit', 'Unit of weight', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2058, 1, 'en', 'plugins/ecommerce/ecommerce', 'height_unit', 'Unit length / height', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2059, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.name', 'Ecommerce', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2060, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.description', 'Theme options for Ecommerce', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2061, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.number_products_per_page', 'Number of products per page', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2062, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.number_of_cross_sale_product', 'Number of cross sale products in product detail page', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2063, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.max_price_filter', 'Maximum price to filter', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2064, 1, 'en', 'plugins/ecommerce/ecommerce', 'theme_options.logo_in_the_checkout_page', 'Logo in the checkout page (Default is the main logo)', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2065, 1, 'en', 'plugins/ecommerce/ecommerce', 'basic_settings', 'Basic settings', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2066, 1, 'en', 'plugins/ecommerce/ecommerce', 'advanced_settings', 'Advanced settings', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2067, 1, 'en', 'plugins/ecommerce/ecommerce', 'product_review_list', 'Product review list', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2068, 1, 'en', 'plugins/ecommerce/ecommerce', 'forms.duplicate', 'Duplicate', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2069, 1, 'en', 'plugins/ecommerce/ecommerce', 'forms.duplicate_success_message', 'Duplicate product successfully!', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2070, 1, 'en', 'plugins/ecommerce/ecommerce', 'duplicate_modal', 'Duplicate product', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2071, 1, 'en', 'plugins/ecommerce/ecommerce', 'duplicate_modal_description', 'Are you sure you want to duplicate this product?', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2072, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_title', 'Order confirmation', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2073, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_description', 'Send email confirmation to customer when an order placed', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2074, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_title', 'Order cancellation', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2075, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_description', 'Send to custom when they cancelled order', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2076, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'Delivering confirmation', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2077, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_description', 'Send to customer when order is delivering', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2078, 1, 'en', 'plugins/ecommerce/email', 'order_delivered_title', 'Order delivered', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2079, 1, 'en', 'plugins/ecommerce/email', 'order_delivered_description', 'Send to customer when order is delivered', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2080, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_title', 'Notice about new order', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2081, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_description', 'Send to administrators when an order placed', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2082, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_title', 'Order confirmation', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2083, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_description', 'Send to customer when they order was confirmed by admins', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2084, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_title', 'Payment confirmation', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2085, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Send to customer when their payment was confirmed', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2086, 1, 'en', 'plugins/ecommerce/email', 'order_recover_title', 'Incomplete order', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2087, 1, 'en', 'plugins/ecommerce/email', 'order_recover_description', 'Send to custom to remind them about incomplete orders', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2088, 1, 'en', 'plugins/ecommerce/email', 'view_order', 'View order', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2089, 1, 'en', 'plugins/ecommerce/email', 'link_go_to_our_shop', 'or <a href=\":link\">Go to our shop</a>', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2090, 1, 'en', 'plugins/ecommerce/email', 'order_number', 'Order number: <strong>:order_id</strong>', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2091, 1, 'en', 'plugins/ecommerce/email', 'order_information', 'Order information:', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2092, 1, 'en', 'plugins/ecommerce/email', 'order_return_request_title', 'Order return request', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2093, 1, 'en', 'plugins/ecommerce/email', 'order_return_request_description', 'Send to customer when they return order', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2094, 1, 'en', 'plugins/ecommerce/export', 'products.name', 'Export products', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2095, 1, 'en', 'plugins/ecommerce/export', 'products.title', 'Export Products (CSV)', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2096, 1, 'en', 'plugins/ecommerce/export', 'products.total_products', 'Total products', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2097, 1, 'en', 'plugins/ecommerce/export', 'products.total_variations', 'Total variations', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2098, 1, 'en', 'plugins/ecommerce/export', 'start_export', 'Start export', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2099, 1, 'en', 'plugins/ecommerce/export', 'exporting', 'Exporting...', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2100, 1, 'en', 'plugins/ecommerce/export', 'export', 'Export', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2101, 1, 'en', 'plugins/ecommerce/flash-sale', 'name', 'Flash sales', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2102, 1, 'en', 'plugins/ecommerce/flash-sale', 'create', 'New flash sale', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2103, 1, 'en', 'plugins/ecommerce/flash-sale', 'edit', 'Edit flash sale', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2104, 1, 'en', 'plugins/ecommerce/flash-sale', 'products', 'Products', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2105, 1, 'en', 'plugins/ecommerce/invoice-template', 'name', 'Invoice template', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2106, 1, 'en', 'plugins/ecommerce/invoice-template', 'setting', 'Invoice Settings', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2107, 1, 'en', 'plugins/ecommerce/invoice-template', 'setting_description', 'Settings for Invoice template', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2108, 1, 'en', 'plugins/ecommerce/invoice-template', 'setting_content', 'Content', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2109, 1, 'en', 'plugins/ecommerce/invoice-template', 'preview', 'Preview', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2110, 1, 'en', 'plugins/ecommerce/invoice-template', 'preview_heading', 'Preview Invoice template', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2111, 1, 'en', 'plugins/ecommerce/invoice', 'name', 'Invoices', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2112, 1, 'en', 'plugins/ecommerce/invoice', 'create', 'New invoice', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2113, 1, 'en', 'plugins/ecommerce/invoice', 'edit', 'Edit invoice', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2114, 1, 'en', 'plugins/ecommerce/invoice', 'print', 'Print Invoice', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2115, 1, 'en', 'plugins/ecommerce/invoice', 'download', 'Download Invoice', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2116, 1, 'en', 'plugins/ecommerce/invoice', 'heading', 'Invoice', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2117, 1, 'en', 'plugins/ecommerce/invoice', 'invoice_for_job', '', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2118, 1, 'en', 'plugins/ecommerce/invoice', 'table.code', 'Code', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2119, 1, 'en', 'plugins/ecommerce/invoice', 'table.amount', 'Amount', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2120, 1, 'en', 'plugins/ecommerce/invoice', 'detail.invoice_for', 'Invoice For', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2121, 1, 'en', 'plugins/ecommerce/invoice', 'detail.invoice_to', 'Invoice To', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2122, 1, 'en', 'plugins/ecommerce/invoice', 'detail.tax_id', 'Tax ID', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2123, 1, 'en', 'plugins/ecommerce/invoice', 'detail.code', 'Invoice Code', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2124, 1, 'en', 'plugins/ecommerce/invoice', 'detail.issue_at', 'Issue At', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2125, 1, 'en', 'plugins/ecommerce/invoice', 'detail.description', 'Description', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2126, 1, 'en', 'plugins/ecommerce/invoice', 'detail.qty', 'Qty', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2127, 1, 'en', 'plugins/ecommerce/invoice', 'detail.quantity', 'Quantity', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2128, 1, 'en', 'plugins/ecommerce/invoice', 'detail.amount', 'Amount', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2129, 1, 'en', 'plugins/ecommerce/invoice', 'detail.discount', 'Discount', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2130, 1, 'en', 'plugins/ecommerce/invoice', 'detail.grand_total', 'Grand Total', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2131, 1, 'en', 'plugins/ecommerce/invoice', 'detail.shipping_fee', 'Shipping Fee', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2132, 1, 'en', 'plugins/ecommerce/invoice', 'detail.sub_total', 'Sub Total', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2133, 1, 'en', 'plugins/ecommerce/invoice', 'detail.tax', 'Tax', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2134, 1, 'en', 'plugins/ecommerce/invoice', 'detail.total', 'Total', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2135, 1, 'en', 'plugins/ecommerce/invoice', 'detail.attributes', 'Attributes', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2136, 1, 'en', 'plugins/ecommerce/invoice', 'detail.product_options', 'Product options', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2137, 1, 'en', 'plugins/ecommerce/invoice', 'detail.license_code', 'License code', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2138, 1, 'en', 'plugins/ecommerce/invoice', 'total_amount', 'Total Amount', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2139, 1, 'en', 'plugins/ecommerce/invoice', 'payment_info', 'Payment Info', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2140, 1, 'en', 'plugins/ecommerce/invoice', 'payment_method', 'Payment Method', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2141, 1, 'en', 'plugins/ecommerce/invoice', 'payment_status', 'Payment Status', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2142, 1, 'en', 'plugins/ecommerce/invoice', 'generate_invoices', 'Generate Invoices', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2143, 1, 'en', 'plugins/ecommerce/invoice', 'generate_success_message', 'Generated :count invoices successfully', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2144, 1, 'en', 'plugins/ecommerce/invoice', 'generate_invoice', 'Generate invoice', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2145, 1, 'en', 'plugins/ecommerce/invoice', 'order', 'Order', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2146, 1, 'en', 'plugins/ecommerce/order', 'statuses.pending', 'Pending', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2147, 1, 'en', 'plugins/ecommerce/order', 'statuses.processing', 'Processing', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2148, 1, 'en', 'plugins/ecommerce/order', 'statuses.completed', 'Completed', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2149, 1, 'en', 'plugins/ecommerce/order', 'statuses.canceled', 'Canceled', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2150, 1, 'en', 'plugins/ecommerce/order', 'statuses.partial_returned', 'Partial returned', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2151, 1, 'en', 'plugins/ecommerce/order', 'statuses.returned', 'Returned', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2152, 1, 'en', 'plugins/ecommerce/order', 'return_statuses.pending', 'Pending', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2153, 1, 'en', 'plugins/ecommerce/order', 'return_statuses.processing', 'Processing', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2154, 1, 'en', 'plugins/ecommerce/order', 'return_statuses.completed', 'Completed', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2155, 1, 'en', 'plugins/ecommerce/order', 'return_statuses.canceled', 'Canceled', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2156, 1, 'en', 'plugins/ecommerce/order', 'menu', 'Orders', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2157, 1, 'en', 'plugins/ecommerce/order', 'create', 'Create an order', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2158, 1, 'en', 'plugins/ecommerce/order', 'cancel_error', 'The order is delivering or not completed', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2159, 1, 'en', 'plugins/ecommerce/order', 'cancel_success', 'You do cancel the order successful', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2160, 1, 'en', 'plugins/ecommerce/order', 'return_error', 'The order is delivering or not completed', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2161, 1, 'en', 'plugins/ecommerce/order', 'return_success', 'Requested product(s) return successfully!', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2162, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order', 'Incomplete orders', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2163, 1, 'en', 'plugins/ecommerce/order', 'order_id', 'Order ID', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2164, 1, 'en', 'plugins/ecommerce/order', 'product_id', 'Product ID', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2165, 1, 'en', 'plugins/ecommerce/order', 'customer_label', 'Customer', '2023-11-08 01:55:18', '2023-11-08 01:55:18'),
(2166, 1, 'en', 'plugins/ecommerce/order', 'tax_amount', 'Tax Amount', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2167, 1, 'en', 'plugins/ecommerce/order', 'shipping_amount', 'Shipping amount', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2168, 1, 'en', 'plugins/ecommerce/order', 'payment_method', 'Payment method', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2169, 1, 'en', 'plugins/ecommerce/order', 'payment_status_label', 'Payment status', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2170, 1, 'en', 'plugins/ecommerce/order', 'manage_orders', 'Manage orders', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2171, 1, 'en', 'plugins/ecommerce/order', 'order_intro_description', 'Once your store has orders, this is where you will process and track those orders.', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2172, 1, 'en', 'plugins/ecommerce/order', 'create_new_order', 'Create a new order', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2173, 1, 'en', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Manage incomplete orders', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2174, 1, 'en', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', 'Incomplete order is an order created when a customer adds a product to the cart, proceeds to fill out the purchase information but does not complete the checkout process.', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2175, 1, 'en', 'plugins/ecommerce/order', 'invoice_for_order', 'Invoice for order', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2176, 1, 'en', 'plugins/ecommerce/order', 'created', 'Created', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2177, 1, 'en', 'plugins/ecommerce/order', 'invoice', 'Invoice', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2178, 1, 'en', 'plugins/ecommerce/order', 'return', 'Order Return Request', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2179, 1, 'en', 'plugins/ecommerce/order', 'is_return', 'Return checkbox', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2180, 1, 'en', 'plugins/ecommerce/order', 'total_refund_amount', 'Total refund amount', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2181, 1, 'en', 'plugins/ecommerce/order', 'total_amount_can_be_refunded', 'Total amount can be refunded', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2182, 1, 'en', 'plugins/ecommerce/order', 'refund_reason', 'Refund reason', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2183, 1, 'en', 'plugins/ecommerce/order', 'products', 'product(s)', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2184, 1, 'en', 'plugins/ecommerce/order', 'default', 'Default', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2185, 1, 'en', 'plugins/ecommerce/order', 'system', 'System', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2186, 1, 'en', 'plugins/ecommerce/order', 'new_order_from', 'New order :order_id from :customer', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2187, 1, 'en', 'plugins/ecommerce/order', 'confirmation_email_was_sent_to_customer', 'The email confirmation was sent to customer', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2188, 1, 'en', 'plugins/ecommerce/order', 'create_order_from_payment_page', 'Order was created from checkout page', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2189, 1, 'en', 'plugins/ecommerce/order', 'create_order_from_admin_page', 'Order was created from admin page', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2190, 1, 'en', 'plugins/ecommerce/order', 'order_was_verified_by', 'Order was verified by %user_name%', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2191, 1, 'en', 'plugins/ecommerce/order', 'new_order', 'New order :order_id', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2192, 1, 'en', 'plugins/ecommerce/order', 'payment_was_confirmed_by', 'Payment was confirmed (amount :money) by %user_name%', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2193, 1, 'en', 'plugins/ecommerce/order', 'edit_order', 'Edit order :code', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2194, 1, 'en', 'plugins/ecommerce/order', 'confirm_order_success', 'Confirm order successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2195, 1, 'en', 'plugins/ecommerce/order', 'error_when_sending_email', 'There is an error when sending email', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2196, 1, 'en', 'plugins/ecommerce/order', 'sent_confirmation_email_success', 'Sent confirmation email successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2197, 1, 'en', 'plugins/ecommerce/order', 'order_was_sent_to_shipping_team', 'Order was sent to shipping team', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2198, 1, 'en', 'plugins/ecommerce/order', 'by_username', 'by %user_name%', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2199, 1, 'en', 'plugins/ecommerce/order', 'shipping_was_created_from', 'Shipping was created from order %order_id%', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2200, 1, 'en', 'plugins/ecommerce/order', 'shipping_was_canceled_success', 'Shipping was cancelled successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2201, 1, 'en', 'plugins/ecommerce/order', 'shipping_was_canceled_by', 'Shipping was cancelled by %user_name%', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2202, 1, 'en', 'plugins/ecommerce/order', 'update_shipping_address_success', 'Update shipping address successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2203, 1, 'en', 'plugins/ecommerce/order', 'order_was_canceled_by', 'Order was cancelled by %user_name%', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2204, 1, 'en', 'plugins/ecommerce/order', 'order_was_returned_by', 'Order was returned by %user_name%', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2205, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_success', 'Confirm payment successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2206, 1, 'en', 'plugins/ecommerce/order', 'refund_amount_invalid', 'Refund amount must be lower or equal :price', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2207, 1, 'en', 'plugins/ecommerce/order', 'number_of_products_invalid', 'Number of products refund is not valid!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2208, 1, 'en', 'plugins/ecommerce/order', 'cannot_found_payment_for_this_order', 'Cannot found payment for this order!', '2023-11-08 01:55:19', '2023-11-08 01:55:19');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2209, 1, 'en', 'plugins/ecommerce/order', 'refund_success_with_price', 'Refund success :price', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2210, 1, 'en', 'plugins/ecommerce/order', 'refund_success', 'Refund successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2211, 1, 'en', 'plugins/ecommerce/order', 'order_is_not_existed', 'Order is not existed!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2212, 1, 'en', 'plugins/ecommerce/order', 'reorder', 'Reorder', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2213, 1, 'en', 'plugins/ecommerce/order', 'sent_email_incomplete_order_success', 'Sent email to remind about incomplete order successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2214, 1, 'en', 'plugins/ecommerce/order', 'applied_coupon_success', 'Applied coupon \":code\" successfully!', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2215, 1, 'en', 'plugins/ecommerce/order', 'new_order_notice', 'You have <span class=\"bold\">:count</span> New Order(s)', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2216, 1, 'en', 'plugins/ecommerce/order', 'view_all', 'View all', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2217, 1, 'en', 'plugins/ecommerce/order', 'cancel_order', 'Cancel order', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2218, 1, 'en', 'plugins/ecommerce/order', 'order_canceled', 'Order canceled', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2219, 1, 'en', 'plugins/ecommerce/order', 'order_was_canceled_at', 'Order was canceled at', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2220, 1, 'en', 'plugins/ecommerce/order', 'return_order', 'Return order', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2221, 1, 'en', 'plugins/ecommerce/order', 'order_returned', 'Order returned', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2222, 1, 'en', 'plugins/ecommerce/order', 'order_was_returned_at', 'Order was returned at', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2223, 1, 'en', 'plugins/ecommerce/order', 'completed', 'Completed', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2224, 1, 'en', 'plugins/ecommerce/order', 'uncompleted', 'Uncompleted', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2225, 1, 'en', 'plugins/ecommerce/order', 'sku', 'SKU', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2226, 1, 'en', 'plugins/ecommerce/order', 'warehouse', 'Warehouse', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2227, 1, 'en', 'plugins/ecommerce/order', 'sub_amount', 'Sub amount', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2228, 1, 'en', 'plugins/ecommerce/order', 'coupon_code', 'Coupon code: \":code\"', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2229, 1, 'en', 'plugins/ecommerce/order', 'shipping_fee', 'Shipping fee', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2230, 1, 'en', 'plugins/ecommerce/order', 'tax', 'Tax', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2231, 1, 'en', 'plugins/ecommerce/order', 'refunded_amount', 'Refunded amount', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2232, 1, 'en', 'plugins/ecommerce/order', 'amount_received', 'The amount actually received', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2233, 1, 'en', 'plugins/ecommerce/order', 'download_invoice', 'Download invoice', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2234, 1, 'en', 'plugins/ecommerce/order', 'print_invoice', 'Print invoice', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2235, 1, 'en', 'plugins/ecommerce/order', 'add_note', 'Add note...', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2236, 1, 'en', 'plugins/ecommerce/order', 'order_was_confirmed', 'Order was confirmed', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2237, 1, 'en', 'plugins/ecommerce/order', 'confirm_order', 'Confirm order', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2238, 1, 'en', 'plugins/ecommerce/order', 'confirm', 'Confirm', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2239, 1, 'en', 'plugins/ecommerce/order', 'order_was_canceled', 'Order was canceled', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2240, 1, 'en', 'plugins/ecommerce/order', 'order_was_returned', 'Order was returned', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2241, 1, 'en', 'plugins/ecommerce/order', 'pending_payment', 'Pending payment', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2242, 1, 'en', 'plugins/ecommerce/order', 'payment_was_accepted', 'Payment :money was accepted', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2243, 1, 'en', 'plugins/ecommerce/order', 'payment_was_refunded', 'Payment was refunded', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2244, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment', 'Confirm payment', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2245, 1, 'en', 'plugins/ecommerce/order', 'refund', 'Refund', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2246, 1, 'en', 'plugins/ecommerce/order', 'all_products_are_not_delivered', 'All products are not delivered', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2247, 1, 'en', 'plugins/ecommerce/order', 'delivery', 'Delivery', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2248, 1, 'en', 'plugins/ecommerce/order', 'history', 'History', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2249, 1, 'en', 'plugins/ecommerce/order', 'order_number', 'Order number', '2023-11-08 01:55:19', '2023-11-08 01:55:19'),
(2250, 1, 'en', 'plugins/ecommerce/order', 'from', 'from', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2251, 1, 'en', 'plugins/ecommerce/order', 'status', 'Status', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2252, 1, 'en', 'plugins/ecommerce/order', 'successfully', 'Successfully', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2253, 1, 'en', 'plugins/ecommerce/order', 'transaction_type', 'Transaction\'s type', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2254, 1, 'en', 'plugins/ecommerce/order', 'staff', 'Staff', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2255, 1, 'en', 'plugins/ecommerce/order', 'refund_date', 'Refund date', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2256, 1, 'en', 'plugins/ecommerce/order', 'n_a', 'N\\A', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2257, 1, 'en', 'plugins/ecommerce/order', 'payment_date', 'Payment date', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2258, 1, 'en', 'plugins/ecommerce/order', 'payment_gateway', 'Payment gateway', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2259, 1, 'en', 'plugins/ecommerce/order', 'transaction_amount', 'Transaction amount', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2260, 1, 'en', 'plugins/ecommerce/order', 'resend', 'Resend', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2261, 1, 'en', 'plugins/ecommerce/order', 'default_store', 'Default store', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2262, 1, 'en', 'plugins/ecommerce/order', 'update_address', 'Update address', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2263, 1, 'en', 'plugins/ecommerce/order', 'have_an_account_already', 'Have an account already', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2264, 1, 'en', 'plugins/ecommerce/order', 'dont_have_an_account_yet', 'Don\'t have an account yet', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2265, 1, 'en', 'plugins/ecommerce/order', 'mark_payment_as_confirmed', 'Mark <span>:method</span> as confirmed', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2266, 1, 'en', 'plugins/ecommerce/order', 'resend_order_confirmation', 'Resend order confirmation', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2267, 1, 'en', 'plugins/ecommerce/order', 'resend_order_confirmation_description', 'Confirmation email will be sent to <strong>:email</strong>?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2268, 1, 'en', 'plugins/ecommerce/order', 'send', 'Send', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2269, 1, 'en', 'plugins/ecommerce/order', 'update', 'Update', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2270, 1, 'en', 'plugins/ecommerce/order', 'cancel_shipping_confirmation', 'Cancel shipping confirmation?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2271, 1, 'en', 'plugins/ecommerce/order', 'cancel_shipping_confirmation_description', 'Cancel shipping confirmation?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2272, 1, 'en', 'plugins/ecommerce/order', 'cancel_order_confirmation', 'Cancel order confirmation?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2273, 1, 'en', 'plugins/ecommerce/order', 'cancel_order_confirmation_description', 'Are you sure you want to cancel this order? This action cannot rollback', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2274, 1, 'en', 'plugins/ecommerce/order', 'return_order_confirmation', 'Return order confirmation?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2275, 1, 'en', 'plugins/ecommerce/order', 'return_order_confirmation_description', 'Are you sure you want to return this order? This action cannot rollback', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2276, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_confirmation_description', 'Processed by <strong>:method</strong>. Did you receive payment outside the system? This payment won\'t be saved into system and cannot be refunded', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2277, 1, 'en', 'plugins/ecommerce/order', 'save_note', 'Save note', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2278, 1, 'en', 'plugins/ecommerce/order', 'order_note', 'Order note', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2279, 1, 'en', 'plugins/ecommerce/order', 'order_note_placeholder', 'Note about order, ex: time or shipping instruction.', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2280, 1, 'en', 'plugins/ecommerce/order', 'order_amount', 'Order amount', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2281, 1, 'en', 'plugins/ecommerce/order', 'additional_information', 'Additional information', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2282, 1, 'en', 'plugins/ecommerce/order', 'notice_about_incomplete_order', 'Notice about incomplete order', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2283, 1, 'en', 'plugins/ecommerce/order', 'notice_about_incomplete_order_description', 'Remind email about uncompleted order will be send to <strong>:email</strong>?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2284, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order_description_1', 'An incomplete order is when a potential customer places items in their shopping cart, and goes all the way through to the payment page, but then doesn\'t complete the transaction.', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2285, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order_description_2', 'If you have contacted customers and they want to continue buying, you can help them complete their order by following the link:', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2286, 1, 'en', 'plugins/ecommerce/order', 'send_an_email_to_recover_this_order', 'Send an email to customer to recover this order', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2287, 1, 'en', 'plugins/ecommerce/order', 'see_maps', 'See maps', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2288, 1, 'en', 'plugins/ecommerce/order', 'one_or_more_products_dont_have_enough_quantity', 'One or more products don\'t have enough quantity!', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2289, 1, 'en', 'plugins/ecommerce/order', 'cannot_send_order_recover_to_mail', 'The email could not be found so it can\'t send a recovery email to the customer.', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2290, 1, 'en', 'plugins/ecommerce/order', 'payment_info', 'Payment Info', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2291, 1, 'en', 'plugins/ecommerce/order', 'payment_method_refund_automatic', 'Your customer will be refunded using :method automatically.', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2292, 1, 'en', 'plugins/ecommerce/order', 'order', 'Order', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2293, 1, 'en', 'plugins/ecommerce/order', 'order_information', 'Order information', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2294, 1, 'en', 'plugins/ecommerce/order', 'create_a_new_product', 'Create a new product', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2295, 1, 'en', 'plugins/ecommerce/order', 'out_of_stock', 'Out of stock', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2296, 1, 'en', 'plugins/ecommerce/order', 'products_available', 'product(s) available', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2297, 1, 'en', 'plugins/ecommerce/order', 'no_products_found', 'No products found!', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2298, 1, 'en', 'plugins/ecommerce/order', 'note', 'Note', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2299, 1, 'en', 'plugins/ecommerce/order', 'note_for_order', 'Note for order...', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2300, 1, 'en', 'plugins/ecommerce/order', 'amount', 'Amount', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2301, 1, 'en', 'plugins/ecommerce/order', 'add_discount', 'Add discount', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2302, 1, 'en', 'plugins/ecommerce/order', 'discount', 'Discount', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2303, 1, 'en', 'plugins/ecommerce/order', 'add_shipping_fee', 'Add shipping fee', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2304, 1, 'en', 'plugins/ecommerce/order', 'shipping', 'Shipping', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2305, 1, 'en', 'plugins/ecommerce/order', 'total_amount', 'Total amount', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2306, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_and_create_order', 'Confirm payment and create order', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2307, 1, 'en', 'plugins/ecommerce/order', 'paid', 'Paid', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2308, 1, 'en', 'plugins/ecommerce/order', 'pay_later', 'Pay later', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2309, 1, 'en', 'plugins/ecommerce/order', 'customer_information', 'Customer information', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2310, 1, 'en', 'plugins/ecommerce/order', 'create_new_customer', 'Create new customer', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2311, 1, 'en', 'plugins/ecommerce/order', 'no_customer_found', 'No customer found!', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2312, 1, 'en', 'plugins/ecommerce/order', 'customer', 'Customer', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2313, 1, 'en', 'plugins/ecommerce/order', 'orders', 'order(s)', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2314, 1, 'en', 'plugins/ecommerce/order', 'shipping_address', 'Shipping Address', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2315, 1, 'en', 'plugins/ecommerce/order', 'shipping_info', 'Shipping information', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2316, 1, 'en', 'plugins/ecommerce/order', 'billing_address', 'Billing Address', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2317, 1, 'en', 'plugins/ecommerce/order', 'see_on_maps', 'See on maps', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2318, 1, 'en', 'plugins/ecommerce/order', 'name', 'Name', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2319, 1, 'en', 'plugins/ecommerce/order', 'price', 'Price', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2320, 1, 'en', 'plugins/ecommerce/order', 'product_name', 'Product name', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2321, 1, 'en', 'plugins/ecommerce/order', 'total', 'Total', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2322, 1, 'en', 'plugins/ecommerce/order', 'action', 'Action', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2323, 1, 'en', 'plugins/ecommerce/order', 'add_product', 'Add product', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2324, 1, 'en', 'plugins/ecommerce/order', 'enter_free_text', 'Enter free text', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2325, 1, 'en', 'plugins/ecommerce/order', 'promotion_discount_amount', 'Promotion amount', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2326, 1, 'en', 'plugins/ecommerce/order', 'add', 'Add', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2327, 1, 'en', 'plugins/ecommerce/order', 'store', 'Store', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2328, 1, 'en', 'plugins/ecommerce/order', 'please_choose_product_option', 'Please choose product option', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2329, 1, 'en', 'plugins/ecommerce/order', 'sku_optional', 'SKU (optional)', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2330, 1, 'en', 'plugins/ecommerce/order', 'with_storehouse_management', 'With storehouse management?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2331, 1, 'en', 'plugins/ecommerce/order', 'quantity', 'Quantity', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2332, 1, 'en', 'plugins/ecommerce/order', 'allow_customer_checkout_when_this_product_out_of_stock', 'Allow customer checkout when this product out of stock?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2333, 1, 'en', 'plugins/ecommerce/order', 'address', 'Address', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2334, 1, 'en', 'plugins/ecommerce/order', 'phone', 'Phone', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2335, 1, 'en', 'plugins/ecommerce/order', 'country', 'Country', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2336, 1, 'en', 'plugins/ecommerce/order', 'state', 'State', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2337, 1, 'en', 'plugins/ecommerce/order', 'city', 'City', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2338, 1, 'en', 'plugins/ecommerce/order', 'zip_code', 'Zip code', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2339, 1, 'en', 'plugins/ecommerce/order', 'discount_based_on', 'Discount based on', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2340, 1, 'en', 'plugins/ecommerce/order', 'or_coupon_code', 'Or coupon code', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2341, 1, 'en', 'plugins/ecommerce/order', 'description', 'Description', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2342, 1, 'en', 'plugins/ecommerce/order', 'how_to_select_configured_shipping', 'How to select configured shipping?', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2343, 1, 'en', 'plugins/ecommerce/order', 'please_add_customer_information_with_the_complete_shipping_address_to_see_the_configured_shipping_rates', 'Please add customer information with the complete shipping address to see the configured shipping rates', '2023-11-08 01:55:20', '2023-11-08 01:55:20'),
(2344, 1, 'en', 'plugins/ecommerce/order', 'please_products_and_customer_address_to_see_the_shipping_rates', 'Please add products and customer information with the complete shipping address to see the configured shipping rates', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2345, 1, 'en', 'plugins/ecommerce/order', 'shipping_method_not_found', 'Shipping method not found', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2346, 1, 'en', 'plugins/ecommerce/order', 'free_shipping', 'Free shipping', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2347, 1, 'en', 'plugins/ecommerce/order', 'custom', 'Custom', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2348, 1, 'en', 'plugins/ecommerce/order', 'email', 'Email', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2349, 1, 'en', 'plugins/ecommerce/order', 'create_order', 'Create order', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2350, 1, 'en', 'plugins/ecommerce/order', 'close', 'Close', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2351, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_is_paid_for_this_order', 'Confirm payment is paid for this order', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2352, 1, 'en', 'plugins/ecommerce/order', 'payment_status_of_the_order_is_paid_once_the_order_has_been_created_you_cannot_change_the_payment_method_or_status', 'Payment status of the order is Paid. Once the order has been created, you cannot change the payment method or status', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2353, 1, 'en', 'plugins/ecommerce/order', 'select_payment_method', 'Select payment method', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2354, 1, 'en', 'plugins/ecommerce/order', 'cash_on_delivery_cod', 'Cash on delivery (COD)', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2355, 1, 'en', 'plugins/ecommerce/order', 'bank_transfer', 'Bank transfer', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2356, 1, 'en', 'plugins/ecommerce/order', 'paid_amount', 'Paid amount', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2357, 1, 'en', 'plugins/ecommerce/order', 'confirm_that_payment_for_this_order_will_be_paid_later', 'Confirm that payment for this order will be paid later', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2358, 1, 'en', 'plugins/ecommerce/order', 'payment_status_of_the_order_is_pending_once_the_order_has_been_created_you_cannot_change_the_payment_method_or_status', 'Payment status of the order is Pending. Once the order has been created, you cannot change the payment method or status', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2359, 1, 'en', 'plugins/ecommerce/order', 'pending_amount', 'Pending amount', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2360, 1, 'en', 'plugins/ecommerce/order', 'update_email', 'Update email', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2361, 1, 'en', 'plugins/ecommerce/order', 'save', 'Save', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2362, 1, 'en', 'plugins/ecommerce/order', 'cancel', 'Cancel', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2363, 1, 'en', 'plugins/ecommerce/order', 'create_a_new_order', 'Create a new order', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2364, 1, 'en', 'plugins/ecommerce/order', 'search_or_create_new_product', 'Search or create a new product', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2365, 1, 'en', 'plugins/ecommerce/order', 'search_or_create_new_customer', 'Search or create a new customer', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2366, 1, 'en', 'plugins/ecommerce/order', 'discount_description', 'Discount description', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2367, 1, 'en', 'plugins/ecommerce/order', 'cant_select_out_of_stock_product', 'Cannot select out of stock product!', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2368, 1, 'en', 'plugins/ecommerce/order', 'referral', 'Referral', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2369, 1, 'en', 'plugins/ecommerce/order', 'return_order_unique', 'Same :attribute already exists in a previous return request.', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2370, 1, 'en', 'plugins/ecommerce/order', 'total_return_amount', 'Total return amount', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2371, 1, 'en', 'plugins/ecommerce/order', 'change_return_order_status', 'Change return order status', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2372, 1, 'en', 'plugins/ecommerce/order', 'return_reason', 'Return reason', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2373, 1, 'en', 'plugins/ecommerce/order', 'referral_data.ip', 'IP', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2374, 1, 'en', 'plugins/ecommerce/order', 'referral_data.landing_domain', 'Landing domain', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2375, 1, 'en', 'plugins/ecommerce/order', 'referral_data.landing_page', 'Landing page', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2376, 1, 'en', 'plugins/ecommerce/order', 'referral_data.landing_params', 'Landing params', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2377, 1, 'en', 'plugins/ecommerce/order', 'referral_data.gclid', 'Gclid', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2378, 1, 'en', 'plugins/ecommerce/order', 'referral_data.fclid', 'Fclid', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2379, 1, 'en', 'plugins/ecommerce/order', 'referral_data.utm_source', 'UTM source', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2380, 1, 'en', 'plugins/ecommerce/order', 'referral_data.utm_campaign', 'UTM campaign', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2381, 1, 'en', 'plugins/ecommerce/order', 'referral_data.utm_medium', 'UTM medium', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2382, 1, 'en', 'plugins/ecommerce/order', 'referral_data.utm_term', 'UTM term', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2383, 1, 'en', 'plugins/ecommerce/order', 'referral_data.utm_content', 'UTM content', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2384, 1, 'en', 'plugins/ecommerce/order', 'referral_data.referral', 'Referral', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2385, 1, 'en', 'plugins/ecommerce/order', 'referral_data.referrer_url', 'Referral URL', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2386, 1, 'en', 'plugins/ecommerce/order', 'referral_data.referrer_domain', 'Referral domain', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2387, 1, 'en', 'plugins/ecommerce/order', 'order_address_types.shipping_address', 'Shipping address', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2388, 1, 'en', 'plugins/ecommerce/order', 'order_address_types.billing_address', 'Billing address', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2389, 1, 'en', 'plugins/ecommerce/order', 'order_return_reasons.damaged', 'Damaged product', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2390, 1, 'en', 'plugins/ecommerce/order', 'order_return_reasons.defective', 'Defective', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2391, 1, 'en', 'plugins/ecommerce/order', 'order_return_reasons.incorrect_item', 'Incorrect item', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2392, 1, 'en', 'plugins/ecommerce/order', 'order_return_reasons.arrived_late', 'Arrived late', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2393, 1, 'en', 'plugins/ecommerce/order', 'order_return_reasons.not_as_described', 'Not as described', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2394, 1, 'en', 'plugins/ecommerce/order', 'order_return_reasons.no_longer_want', 'No longer want', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2395, 1, 'en', 'plugins/ecommerce/order', 'order_return_reasons.other', 'Other', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2396, 1, 'en', 'plugins/ecommerce/order', 'order_return_reason', 'Return reason', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2397, 1, 'en', 'plugins/ecommerce/order', 'notices.update_return_order_status_error', 'Cannot update return order status! Maybe the return order status is not valid.', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2398, 1, 'en', 'plugins/ecommerce/order', 'notices.update_return_order_status_success', 'Update return order status successfully!', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2399, 1, 'en', 'plugins/ecommerce/order', 'order_return', 'Order returns', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2400, 1, 'en', 'plugins/ecommerce/order', 'edit_order_return', 'Edit order return :code', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2401, 1, 'en', 'plugins/ecommerce/order', 'order_return_items_count', 'Product item(s)', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2402, 1, 'en', 'plugins/ecommerce/order', 'new_order_notifications.new_order', 'New order', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2403, 1, 'en', 'plugins/ecommerce/order', 'new_order_notifications.view', 'View', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2404, 1, 'en', 'plugins/ecommerce/order', 'new_order_notifications.description', ':customer ordered :quantity :product', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2405, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_notifications.confirm_payment', 'Confirm payment', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2406, 1, 'en', 'plugins/ecommerce/order', 'confirm_payment_notifications.description', 'Order :order Payment was confirmed (amount :amount) by :by', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2407, 1, 'en', 'plugins/ecommerce/order', 'update_shipping_status_notifications.update_shipping_status', 'Update shipping status', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2408, 1, 'en', 'plugins/ecommerce/order', 'update_shipping_status_notifications.description', 'Order :order had changed shipping status :description', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2409, 1, 'en', 'plugins/ecommerce/order', 'cancel_order_notifications.cancel_order', 'Cancel order', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2410, 1, 'en', 'plugins/ecommerce/order', 'cancel_order_notifications.description', 'Order :order was cancelled by custom :customer', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2411, 1, 'en', 'plugins/ecommerce/order', 'return_order_notifications.return_order', 'Return order', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2412, 1, 'en', 'plugins/ecommerce/order', 'return_order_notifications.description', ':customer has requested return product(s)', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2413, 1, 'en', 'plugins/ecommerce/order', 'order_completed_notifications.order_completed', 'Order Completed', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2414, 1, 'en', 'plugins/ecommerce/order', 'order_completed_notifications.description', 'Order :order has been completed', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2415, 1, 'en', 'plugins/ecommerce/order', 'tax_info.name', 'Tax Information', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2416, 1, 'en', 'plugins/ecommerce/order', 'tax_info.update', 'Update tax information', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2417, 1, 'en', 'plugins/ecommerce/order', 'tax_info.update_success', 'Update tax information successfully!', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2418, 1, 'en', 'plugins/ecommerce/order', 'tax_info.company_name', 'Company name', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2419, 1, 'en', 'plugins/ecommerce/order', 'tax_info.company_address', 'Company address', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2420, 1, 'en', 'plugins/ecommerce/order', 'tax_info.company_tax_code', 'Company tax code', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2421, 1, 'en', 'plugins/ecommerce/order', 'tax_info.company_email', 'Company email', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2422, 1, 'en', 'plugins/ecommerce/order', 'mark_as_completed.name', 'Mark as completed', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2423, 1, 'en', 'plugins/ecommerce/order', 'mark_as_completed.modal_title', 'Mark order as completed', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2424, 1, 'en', 'plugins/ecommerce/order', 'mark_as_completed.modal_description', 'Are you sure you want to mark this order as completed? This will change the order status to completed and cannot be undone.', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2425, 1, 'en', 'plugins/ecommerce/order', 'mark_as_completed.success', 'Mark order as completed successfully!', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2426, 1, 'en', 'plugins/ecommerce/order', 'mark_as_completed.history', 'Order is marked as completed by :admin at :time', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2427, 1, 'en', 'plugins/ecommerce/order', 'generate_invoice', 'Generate invoice', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2428, 1, 'en', 'plugins/ecommerce/order', 'generated_invoice_successfully', 'Generated invoice successfully!', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2429, 1, 'en', 'plugins/ecommerce/payment', 'name', 'Payments', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2430, 1, 'en', 'plugins/ecommerce/payment', 'payment_method', 'Payment methods', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2431, 1, 'en', 'plugins/ecommerce/payment', 'view_payment', 'View payment #', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2432, 1, 'en', 'plugins/ecommerce/payment', 'charge_id', 'Charge ID', '2023-11-08 01:55:21', '2023-11-08 01:55:21'),
(2433, 1, 'en', 'plugins/ecommerce/payment', 'amount', 'Amount', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2434, 1, 'en', 'plugins/ecommerce/payment', 'currency', 'Currency', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2435, 1, 'en', 'plugins/ecommerce/payment', 'user', 'User', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2436, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_required', 'PayPal\'s name is required!', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2437, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_max', 'PayPal\'s name is too long!', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2438, 1, 'en', 'plugins/ecommerce/payment', 'status', 'Status', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2439, 1, 'en', 'plugins/ecommerce/payment', 'enabled', 'Enabled', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2440, 1, 'en', 'plugins/ecommerce/payment', 'disabled', 'Disabled', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2441, 1, 'en', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2442, 1, 'en', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2443, 1, 'en', 'plugins/ecommerce/payment', 'mode', 'Mode', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2444, 1, 'en', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2445, 1, 'en', 'plugins/ecommerce/payment', 'live', 'Live', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2446, 1, 'en', 'plugins/ecommerce/payment', 'enable_payment_log', 'Enable Payment Log', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2447, 1, 'en', 'plugins/ecommerce/payment', 'yes', 'Yes', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2448, 1, 'en', 'plugins/ecommerce/payment', 'no', 'No', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2449, 1, 'en', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2450, 1, 'en', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2451, 1, 'en', 'plugins/ecommerce/payment', 'action', 'Action', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2452, 1, 'en', 'plugins/ecommerce/payment', 'go_back', 'Go back', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2453, 1, 'en', 'plugins/ecommerce/payment', 'view', 'View', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2454, 1, 'en', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Cash on delivery (COD)', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2455, 1, 'en', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Via bank transfer', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2456, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_cart', 'Payment via card', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2457, 1, 'en', 'plugins/ecommerce/payment', 'card_number', 'Card number', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2458, 1, 'en', 'plugins/ecommerce/payment', 'full_name', 'Full name', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2459, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Payment via PayPal', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2460, 1, 'en', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2461, 1, 'en', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2462, 1, 'en', 'plugins/ecommerce/payment', 'details', 'Details', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2463, 1, 'en', 'plugins/ecommerce/payment', 'payer_name', 'Payer Name', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2464, 1, 'en', 'plugins/ecommerce/payment', 'email', 'Email', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2465, 1, 'en', 'plugins/ecommerce/payment', 'phone', 'Phone', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2466, 1, 'en', 'plugins/ecommerce/payment', 'country', 'Country', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2467, 1, 'en', 'plugins/ecommerce/payment', 'shipping_address', 'Shipping Address', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2468, 1, 'en', 'plugins/ecommerce/payment', 'payment_details', 'Payment Details', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2469, 1, 'en', 'plugins/ecommerce/payment', 'card', 'Card', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2470, 1, 'en', 'plugins/ecommerce/payment', 'address', 'Address', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2471, 1, 'en', 'plugins/ecommerce/payment', 'new_payment', 'Payment for order :id', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2472, 1, 'en', 'plugins/ecommerce/payment', 'payment_id', 'Payment ID', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2473, 1, 'en', 'plugins/ecommerce/payment', 'order', 'Order', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2474, 1, 'en', 'plugins/ecommerce/payment', 'add_payment', 'Add payment', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2475, 1, 'en', 'plugins/ecommerce/payment', 'add_new_payment', 'New payment', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2476, 1, 'en', 'plugins/ecommerce/payment', 'add', 'Add', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2477, 1, 'en', 'plugins/ecommerce/payment', 'no_data', 'No data to display', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2478, 1, 'en', 'plugins/ecommerce/payment', 'no_option', 'No option', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2479, 1, 'en', 'plugins/ecommerce/payment', 'edit_payment', 'Edit payment', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2480, 1, 'en', 'plugins/ecommerce/payment', 'save', 'Save', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2481, 1, 'en', 'plugins/ecommerce/prices', 'name', 'Price', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2482, 1, 'en', 'plugins/ecommerce/prices', 'create', 'New price', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2483, 1, 'en', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2484, 1, 'en', 'plugins/ecommerce/prices', 'list', 'List price', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2485, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2486, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2487, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2488, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2489, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2490, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2491, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2492, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2493, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2494, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2495, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2496, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2497, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2498, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2499, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2500, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2501, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2502, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2503, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2504, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2505, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2506, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2507, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2508, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2509, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2510, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2511, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2512, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2513, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2514, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2515, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2516, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2517, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2518, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2519, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2520, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2521, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2522, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2523, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2524, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2525, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2526, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2527, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2528, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'display_layout', 'Display Layout', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2529, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'searchable', 'Searchable', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2530, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'comparable', 'Comparable', '2023-11-08 01:55:22', '2023-11-08 01:55:22'),
(2531, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'use_in_product_listing', 'Used in product listing', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2532, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes_list', 'Attributes list', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2533, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'is_default', 'Is default?', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2534, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'title', 'Title', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2535, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'slug', 'Slug', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2536, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'color', 'Color', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2537, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'image', 'Image', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2538, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove', 'Remove', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2539, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_attribute', 'Add new attribute', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2540, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'use_image_from_product_variation', 'Use image from product variation (for Visual Swatch only)', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2541, 1, 'en', 'plugins/ecommerce/product-attributes', 'name', 'Product attributes', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2542, 1, 'en', 'plugins/ecommerce/product-attributes', 'create', 'New product attribute', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2543, 1, 'en', 'plugins/ecommerce/product-attributes', 'edit', 'Edit product attribute', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2544, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.title', 'Manage product attributes', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2545, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.description', 'Product attribute such as color, width, height ...', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2546, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'Create product attribute', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2547, 1, 'en', 'plugins/ecommerce/product-categories', 'name', 'Product categories', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2548, 1, 'en', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2549, 1, 'en', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2550, 1, 'en', 'plugins/ecommerce/product-categories', 'list', 'List product categories', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2551, 1, 'en', 'plugins/ecommerce/product-categories', 'none', 'None', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2552, 1, 'en', 'plugins/ecommerce/product-categories', 'menu', 'Product categories', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2553, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.title', 'Manage product categories', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2554, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.description', 'Such as clothes, shoes, bags, jewelry ...', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2555, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.button_text', 'Create product category', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2556, 1, 'en', 'plugins/ecommerce/product-categories', 'total_products', 'Total products: :total', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2557, 1, 'en', 'plugins/ecommerce/product-collections', 'name', 'Product collections', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2558, 1, 'en', 'plugins/ecommerce/product-collections', 'create', 'New product collection', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2559, 1, 'en', 'plugins/ecommerce/product-collections', 'edit', 'Edit product collection', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2560, 1, 'en', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2561, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.title', 'Manage product collections', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2562, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.description', 'Group your products into collections to make it easier for customers to find them by category.', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2563, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.button_text', 'Create product collection', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2564, 1, 'en', 'plugins/ecommerce/product-label', 'name', 'Product labels', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2565, 1, 'en', 'plugins/ecommerce/product-label', 'create', 'New product label', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2566, 1, 'en', 'plugins/ecommerce/product-label', 'edit', 'Edit product label', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2567, 1, 'en', 'plugins/ecommerce/product-label', 'color', 'Color', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2568, 1, 'en', 'plugins/ecommerce/product-label', 'color_placeholder', 'Example: #f0f0f0', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2569, 1, 'en', 'plugins/ecommerce/product-option', 'name', 'Product options', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2570, 1, 'en', 'plugins/ecommerce/product-option', 'options', 'Options', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2571, 1, 'en', 'plugins/ecommerce/product-option', 'create', 'New option', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2572, 1, 'en', 'plugins/ecommerce/product-option', 'edit', 'Edit option :name', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2573, 1, 'en', 'plugins/ecommerce/product-option', 'required', 'Is required?', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2574, 1, 'en', 'plugins/ecommerce/product-option', 'option_value', 'Option value', '2023-11-08 01:55:23', '2023-11-08 01:55:23');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2575, 1, 'en', 'plugins/ecommerce/product-option', 'option_type', 'Type', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2576, 1, 'en', 'plugins/ecommerce/product-option', 'label', 'Label', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2577, 1, 'en', 'plugins/ecommerce/product-option', 'price', 'Price', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2578, 1, 'en', 'plugins/ecommerce/product-option', 'price_type', 'Price Type', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2579, 1, 'en', 'plugins/ecommerce/product-option', 'percent', 'Percent', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2580, 1, 'en', 'plugins/ecommerce/product-option', 'fixed', 'Fixed', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2581, 1, 'en', 'plugins/ecommerce/product-option', 'label_placeholder', 'Please fill label', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2582, 1, 'en', 'plugins/ecommerce/product-option', 'affect_price_label', 'Please fill affect price', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2583, 1, 'en', 'plugins/ecommerce/product-option', 'add_new_row', 'Add new row', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2584, 1, 'en', 'plugins/ecommerce/product-option', 'add_new_option', 'Add new option', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2585, 1, 'en', 'plugins/ecommerce/product-option', 'select_global_option', 'Select Global Option', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2586, 1, 'en', 'plugins/ecommerce/product-option', 'add_global_option', 'Add Global Option', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2587, 1, 'en', 'plugins/ecommerce/product-option', 'please_select_option', 'Please select option', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2588, 1, 'en', 'plugins/ecommerce/product-option', 'add_to_cart_value_required', 'Option :value is required', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2589, 1, 'en', 'plugins/ecommerce/product-option', 'option_value_attribute', 'value :item of :value_key on option #:option_key', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2590, 1, 'en', 'plugins/ecommerce/product-option', 'option_name_attribute', 'Option :key', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2591, 1, 'en', 'plugins/ecommerce/product-option', 'option_type_attribute', 'Type of option :key', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2592, 1, 'en', 'plugins/ecommerce/product-option', 'option_value_name_attribute', 'Values of option :key', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2593, 1, 'en', 'plugins/ecommerce/product-option', 'please_choose_option_type', 'Please choose option type!', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2594, 1, 'en', 'plugins/ecommerce/product-tag', 'name', 'Product tags', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2595, 1, 'en', 'plugins/ecommerce/product-tag', 'create', 'New product tag', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2596, 1, 'en', 'plugins/ecommerce/product-tag', 'edit', 'Edit product tag', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2597, 1, 'en', 'plugins/ecommerce/products', 'name', 'Products', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2598, 1, 'en', 'plugins/ecommerce/products', 'create', 'New product', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2599, 1, 'en', 'plugins/ecommerce/products', 'create_product_type.physical', 'New physical product', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2600, 1, 'en', 'plugins/ecommerce/products', 'create_product_type.digital', 'New digital product', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2601, 1, 'en', 'plugins/ecommerce/products', 'edit', 'Edit product - :name', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2602, 1, 'en', 'plugins/ecommerce/products', 'form.name', 'Name', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2603, 1, 'en', 'plugins/ecommerce/products', 'form.name_placeholder', 'Product\'s name (Maximum 120 characters)', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2604, 1, 'en', 'plugins/ecommerce/products', 'form.description', 'Description', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2605, 1, 'en', 'plugins/ecommerce/products', 'form.description_placeholder', 'Short description for product (Maximum 400 characters)', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2606, 1, 'en', 'plugins/ecommerce/products', 'form.categories', 'Categories', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2607, 1, 'en', 'plugins/ecommerce/products', 'form.content', 'Content', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2608, 1, 'en', 'plugins/ecommerce/products', 'form.price', 'Price', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2609, 1, 'en', 'plugins/ecommerce/products', 'form.quantity', 'Quantity', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2610, 1, 'en', 'plugins/ecommerce/products', 'form.brand', 'Brand', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2611, 1, 'en', 'plugins/ecommerce/products', 'form.width', 'Width', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2612, 1, 'en', 'plugins/ecommerce/products', 'form.height', 'Height', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2613, 1, 'en', 'plugins/ecommerce/products', 'form.weight', 'Weight', '2023-11-08 01:55:23', '2023-11-08 01:55:23'),
(2614, 1, 'en', 'plugins/ecommerce/products', 'form.date.start', 'From date', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2615, 1, 'en', 'plugins/ecommerce/products', 'form.date.end', 'To date', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2616, 1, 'en', 'plugins/ecommerce/products', 'form.image', 'Images', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2617, 1, 'en', 'plugins/ecommerce/products', 'form.collections', 'Product collections', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2618, 1, 'en', 'plugins/ecommerce/products', 'form.labels', 'Labels', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2619, 1, 'en', 'plugins/ecommerce/products', 'form.price_sale', 'Price sale', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2620, 1, 'en', 'plugins/ecommerce/products', 'form.product_type.title', 'Product type', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2621, 1, 'en', 'plugins/ecommerce/products', 'form.product', 'Product', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2622, 1, 'en', 'plugins/ecommerce/products', 'form.total', 'Total', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2623, 1, 'en', 'plugins/ecommerce/products', 'form.sub_total', 'Subtotal', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2624, 1, 'en', 'plugins/ecommerce/products', 'form.shipping_fee', 'Shipping fee', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2625, 1, 'en', 'plugins/ecommerce/products', 'form.discount', 'Discount', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2626, 1, 'en', 'plugins/ecommerce/products', 'form.options', 'Options', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2627, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.height', 'Height', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2628, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.length', 'Length', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2629, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.title', 'Shipping', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2630, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.weight', 'Weight', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2631, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.wide', 'Wide', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2632, 1, 'en', 'plugins/ecommerce/products', 'form.barcode', 'Barcode (ISBN, UPC, GTIN, etc.) ', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2633, 1, 'en', 'plugins/ecommerce/products', 'form.barcode_placeholder', 'Enter barcode', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2634, 1, 'en', 'plugins/ecommerce/products', 'form.cost_per_item', 'Cost per item', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2635, 1, 'en', 'plugins/ecommerce/products', 'form.cost_per_item_placeholder', 'Enter cost per item', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2636, 1, 'en', 'plugins/ecommerce/products', 'form.cost_per_item_helper', 'Customers won\'t see this price.', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2637, 1, 'en', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Allow customer checkout when this product out of stock', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2638, 1, 'en', 'plugins/ecommerce/products', 'form.stock.in_stock', 'In stock', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2639, 1, 'en', 'plugins/ecommerce/products', 'form.stock.out_stock', 'Out stock', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2640, 1, 'en', 'plugins/ecommerce/products', 'form.stock.title', 'Stock status', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2641, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'No storehouse management', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2642, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'With storehouse management', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2643, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.title', 'Storehouse', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2644, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'Quantity', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2645, 1, 'en', 'plugins/ecommerce/products', 'form.tax', 'Tax', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2646, 1, 'en', 'plugins/ecommerce/products', 'form.taxes', 'Taxes', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2647, 1, 'en', 'plugins/ecommerce/products', 'form.is_default', 'Is default', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2648, 1, 'en', 'plugins/ecommerce/products', 'form.action', 'Action', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2649, 1, 'en', 'plugins/ecommerce/products', 'form.restock_quantity', 'Restock quantity', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2650, 1, 'en', 'plugins/ecommerce/products', 'form.remain', 'Remain', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2651, 1, 'en', 'plugins/ecommerce/products', 'form.choose_discount_period', 'Choose Discount Period', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2652, 1, 'en', 'plugins/ecommerce/products', 'form.cancel', 'Cancel', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2653, 1, 'en', 'plugins/ecommerce/products', 'form.no_results', 'No results!', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2654, 1, 'en', 'plugins/ecommerce/products', 'form.value', 'Value', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2655, 1, 'en', 'plugins/ecommerce/products', 'form.attribute_name', 'Attribute name', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2656, 1, 'en', 'plugins/ecommerce/products', 'form.add_more_attribute', 'Add more attribute', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2657, 1, 'en', 'plugins/ecommerce/products', 'form.continue', 'Continue', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2658, 1, 'en', 'plugins/ecommerce/products', 'form.add_new_attributes', 'Add new attributes', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2659, 1, 'en', 'plugins/ecommerce/products', 'form.add_new_attributes_description', 'Adding new attributes helps the product to have many options, such as size or color.', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2660, 1, 'en', 'plugins/ecommerce/products', 'form.create_product_variations', ':link to create product variations!', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2661, 1, 'en', 'plugins/ecommerce/products', 'form.tags', 'Tags', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2662, 1, 'en', 'plugins/ecommerce/products', 'form.write_some_tags', 'Write some tags', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2663, 1, 'en', 'plugins/ecommerce/products', 'form.variation_existed', 'This variation is existed.', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2664, 1, 'en', 'plugins/ecommerce/products', 'form.no_attributes_selected', 'No attributes selected!', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2665, 1, 'en', 'plugins/ecommerce/products', 'form.added_variation_success', 'Added variation successfully!', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2666, 1, 'en', 'plugins/ecommerce/products', 'form.updated_variation_success', 'Updated variation successfully!', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2667, 1, 'en', 'plugins/ecommerce/products', 'form.created_all_variation_success', 'Created all variations successfully!', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2668, 1, 'en', 'plugins/ecommerce/products', 'form.updated_product_attributes_success', 'Updated product attributes successfully!', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2669, 1, 'en', 'plugins/ecommerce/products', 'form.stock_status', 'Stock status', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2670, 1, 'en', 'plugins/ecommerce/products', 'form.auto_generate_sku', 'Auto generate SKU?', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2671, 1, 'en', 'plugins/ecommerce/products', 'form.featured_image', 'Featured image (optional)', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2672, 1, 'en', 'plugins/ecommerce/products', 'form.product_id', 'Product ID', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2673, 1, 'en', 'plugins/ecommerce/products', 'price', 'Price', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2674, 1, 'en', 'plugins/ecommerce/products', 'quantity', 'Quantity', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2675, 1, 'en', 'plugins/ecommerce/products', 'type', 'Type', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2676, 1, 'en', 'plugins/ecommerce/products', 'image', 'Thumbnail', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2677, 1, 'en', 'plugins/ecommerce/products', 'sku', 'SKU', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2678, 1, 'en', 'plugins/ecommerce/products', 'variation_sku', 'Variation SKU', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2679, 1, 'en', 'plugins/ecommerce/products', 'brand', 'Brand', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2680, 1, 'en', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2681, 1, 'en', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2682, 1, 'en', 'plugins/ecommerce/products', 'product_collections', 'Product collections', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2683, 1, 'en', 'plugins/ecommerce/products', 'products', 'Products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2684, 1, 'en', 'plugins/ecommerce/products', 'menu', 'Products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2685, 1, 'en', 'plugins/ecommerce/products', 'control.button_add_image', 'Add image', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2686, 1, 'en', 'plugins/ecommerce/products', 'price_sale', 'Sale price', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2687, 1, 'en', 'plugins/ecommerce/products', 'price_group_title', 'Manager product price', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2688, 1, 'en', 'plugins/ecommerce/products', 'store_house_group_title', 'Manager store house', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2689, 1, 'en', 'plugins/ecommerce/products', 'shipping_group_title', 'Manager shipping', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2690, 1, 'en', 'plugins/ecommerce/products', 'overview', 'Overview', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2691, 1, 'en', 'plugins/ecommerce/products', 'attributes', 'Attributes', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2692, 1, 'en', 'plugins/ecommerce/products', 'product_has_variations', 'Product has variations', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2693, 1, 'en', 'plugins/ecommerce/products', 'manage_products', 'Manage products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2694, 1, 'en', 'plugins/ecommerce/products', 'add_new_product', 'Add a new product', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2695, 1, 'en', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'Start by adding new products.', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2696, 1, 'en', 'plugins/ecommerce/products', 'edit_this_product', 'Edit this product', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2697, 1, 'en', 'plugins/ecommerce/products', 'delete', 'Delete', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2698, 1, 'en', 'plugins/ecommerce/products', 'related_products', 'Related products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2699, 1, 'en', 'plugins/ecommerce/products', 'cross_selling_products', 'Cross-selling products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2700, 1, 'en', 'plugins/ecommerce/products', 'up_selling_products', 'Up-selling products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2701, 1, 'en', 'plugins/ecommerce/products', 'grouped_products', 'Grouped products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2702, 1, 'en', 'plugins/ecommerce/products', 'search_products', 'Search products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2703, 1, 'en', 'plugins/ecommerce/products', 'selected_products', 'Selected products', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2704, 1, 'en', 'plugins/ecommerce/products', 'edit_variation_item', 'Edit', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2705, 1, 'en', 'plugins/ecommerce/products', 'variations_box_description', 'Click on \"Edit attribute\" to add/remove attributes of variation or click on \"Add new variation\" to add variation.', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2706, 1, 'en', 'plugins/ecommerce/products', 'save_changes', 'Save changes', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2707, 1, 'en', 'plugins/ecommerce/products', 'continue', 'Continue', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2708, 1, 'en', 'plugins/ecommerce/products', 'edit_attribute', 'Edit attribute', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2709, 1, 'en', 'plugins/ecommerce/products', 'select_attribute', 'Select attribute', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2710, 1, 'en', 'plugins/ecommerce/products', 'add_new_variation', 'Add new variation', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2711, 1, 'en', 'plugins/ecommerce/products', 'edit_variation', 'Edit variation', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2712, 1, 'en', 'plugins/ecommerce/products', 'generate_all_variations', 'Generate all variations', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2713, 1, 'en', 'plugins/ecommerce/products', 'generate_all_variations_confirmation', 'Are you sure you want to generate all variations for this product?', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2714, 1, 'en', 'plugins/ecommerce/products', 'delete_variation', 'Delete variation?', '2023-11-08 01:55:24', '2023-11-08 01:55:24'),
(2715, 1, 'en', 'plugins/ecommerce/products', 'delete_variation_confirmation', 'Are you sure you want to delete this variation? This action cannot be undo.', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2716, 1, 'en', 'plugins/ecommerce/products', 'delete_variations_confirmation', 'Are you sure you want to delete those variations? This action cannot be undo.', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2717, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_name_required', 'Please enter product\'s name', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2718, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price_max', 'The discount must be less than the original price', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2719, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_cost_per_item_max', 'The cost per item must be less than the original price', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2720, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price_required_if', 'Must enter a discount when you want to schedule a promotion', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2721, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_end_date_after', 'End date must be after start date', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2722, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_start_date_required_if', 'Discount start date cannot be left blank when scheduling is selected', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2723, 1, 'en', 'plugins/ecommerce/products', 'product_create_validate_sale_price', 'Discounts cannot be left blank when scheduling is selected', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2724, 1, 'en', 'plugins/ecommerce/products', 'stock_statuses.in_stock', 'In stock', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2725, 1, 'en', 'plugins/ecommerce/products', 'stock_statuses.out_of_stock', 'Out of stock', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2726, 1, 'en', 'plugins/ecommerce/products', 'stock_statuses.on_backorder', 'On backorder', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2727, 1, 'en', 'plugins/ecommerce/products', 'stock_status', 'Stock status', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2728, 1, 'en', 'plugins/ecommerce/products', 'processing', 'Processing...', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2729, 1, 'en', 'plugins/ecommerce/products', 'delete_selected_variations', 'Delete selected variations', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2730, 1, 'en', 'plugins/ecommerce/products', 'delete_variations', 'Delete variations', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2731, 1, 'en', 'plugins/ecommerce/products', 'category', 'Category', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2732, 1, 'en', 'plugins/ecommerce/products', 'product_price_flash_sale_warning', 'This product is in flash sale <strong>:name</strong> so its price is <strong>:price</strong>.', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2733, 1, 'en', 'plugins/ecommerce/products', 'product_price_discount_warning', 'This product is in discount <strong>:name</strong> so its price is <strong>:price</strong>.', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2734, 1, 'en', 'plugins/ecommerce/products', 'product_image', 'Product image', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2735, 1, 'en', 'plugins/ecommerce/products', 'product_name', 'Product name', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2736, 1, 'en', 'plugins/ecommerce/products', 'types.physical', 'Physical', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2737, 1, 'en', 'plugins/ecommerce/products', 'types.digital', 'Digital', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2738, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.title', 'Digital attachments', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2739, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.add', 'Add Attachment', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2740, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.file_name', 'File name', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2741, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.file_size', 'File size', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2742, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.unsaved', 'Unsaved', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2743, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.add_external_link', 'Add external link', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2744, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.enter_file_name', 'Enter file name', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2745, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.enter_external_link_download', 'Enter external link download', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2746, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.enter_file_size', 'Enter file size', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2747, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.external_link_download', 'External link download', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2748, 1, 'en', 'plugins/ecommerce/products', 'digital_attachments.generate_license_code_after_purchasing_product', 'Generate license code after purchasing this product?', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2749, 1, 'en', 'plugins/ecommerce/products', 'this_action_will_reload_page', 'This action will reload the page to update the data!', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2750, 1, 'en', 'plugins/ecommerce/products', 'select', 'Select', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2751, 1, 'en', 'plugins/ecommerce/products', 'set_this_variant_as_default', 'Set this variant as default', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2752, 1, 'en', 'plugins/ecommerce/products', 'download', 'Download', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2753, 1, 'en', 'plugins/ecommerce/reports', 'name', 'Report', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2754, 1, 'en', 'plugins/ecommerce/reports', 'widget.order.title', 'Orders', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2755, 1, 'en', 'plugins/ecommerce/reports', 'count.revenue', 'Today revenue', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2756, 1, 'en', 'plugins/ecommerce/reports', 'count.orders', 'Today orders', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2757, 1, 'en', 'plugins/ecommerce/reports', 'count.products', 'Total products', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2758, 1, 'en', 'plugins/ecommerce/reports', 'count.customers', 'Total customers', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2759, 1, 'en', 'plugins/ecommerce/reports', 'product_name', 'Product name', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2760, 1, 'en', 'plugins/ecommerce/reports', 'quantity', 'Quantity', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2761, 1, 'en', 'plugins/ecommerce/reports', 'revenue_statistics', 'Revenue statistics', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2762, 1, 'en', 'plugins/ecommerce/reports', 'top_selling_products', 'Top Selling Products', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2763, 1, 'en', 'plugins/ecommerce/reports', 'ranges.today', 'Today', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2764, 1, 'en', 'plugins/ecommerce/reports', 'ranges.this_week', 'This week', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2765, 1, 'en', 'plugins/ecommerce/reports', 'ranges.last_7_days', 'Last 7 days', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2766, 1, 'en', 'plugins/ecommerce/reports', 'ranges.last_30_days', 'Last 30 days', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2767, 1, 'en', 'plugins/ecommerce/reports', 'ranges.this_month', 'This month', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2768, 1, 'en', 'plugins/ecommerce/reports', 'ranges.this_year', 'This year', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2769, 1, 'en', 'plugins/ecommerce/reports', 'revenue_this_month', 'Revenue this month', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2770, 1, 'en', 'plugins/ecommerce/reports', 'order_processing_this_month', 'order(s) processing in this month', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2771, 1, 'en', 'plugins/ecommerce/reports', 'order_completed_this_month', 'order(s) completed in this month', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2772, 1, 'en', 'plugins/ecommerce/reports', 'product_will_be_out_of_stock', 'product(s) will be out of stock soon', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2773, 1, 'en', 'plugins/ecommerce/reports', 'product_out_of_stock', 'product(s) out of stock', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2774, 1, 'en', 'plugins/ecommerce/reports', 'sales_reports', 'Sales Reports', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2775, 1, 'en', 'plugins/ecommerce/reports', 'total_earnings', 'Total Earnings', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2776, 1, 'en', 'plugins/ecommerce/reports', 'recent_orders', 'Recent Orders', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2777, 1, 'en', 'plugins/ecommerce/reports', 'trending_products', 'Trending Products', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2778, 1, 'en', 'plugins/ecommerce/reports', 'statistics', 'Statistics', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2779, 1, 'en', 'plugins/ecommerce/reports', 'items_earning_sales', 'Items Earning Sales: :value', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2780, 1, 'en', 'plugins/ecommerce/reports', 'revenue', 'Revenue', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2781, 1, 'en', 'plugins/ecommerce/reports', 'orders', 'Orders', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2782, 1, 'en', 'plugins/ecommerce/reports', 'products', 'Products', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2783, 1, 'en', 'plugins/ecommerce/reports', 'customers', 'Customers', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2784, 1, 'en', 'plugins/ecommerce/reports', 'earnings', 'Earnings', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2785, 1, 'en', 'plugins/ecommerce/reports', 'views', 'Views', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2786, 1, 'en', 'plugins/ecommerce/reports', 'date_range_format_value', 'From :from to :to', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2787, 1, 'en', 'plugins/ecommerce/reports', 'select_range', 'Select Range', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2788, 1, 'en', 'plugins/ecommerce/reports', 'customers_chart', 'Customers', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2789, 1, 'en', 'plugins/ecommerce/reports', 'orders_chart', 'Orders', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2790, 1, 'en', 'plugins/ecommerce/reports', 'number_of_orders', 'Number of orders', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2791, 1, 'en', 'plugins/ecommerce/reports', 'number_of_customers', 'Number of customers', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2792, 1, 'en', 'plugins/ecommerce/review', 'name', 'Reviews', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2793, 1, 'en', 'plugins/ecommerce/review', 'add_review', 'Add review', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2794, 1, 'en', 'plugins/ecommerce/review', 'delete_review', 'Delete review', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2795, 1, 'en', 'plugins/ecommerce/review', 'create_review', 'Create Review', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2796, 1, 'en', 'plugins/ecommerce/review', 'please_select_rating', 'Please select rating', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2797, 1, 'en', 'plugins/ecommerce/review', 'comment', 'Comment', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2798, 1, 'en', 'plugins/ecommerce/review', 'approve', 'Approve', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2799, 1, 'en', 'plugins/ecommerce/review', 'approved', 'Approved', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2800, 1, 'en', 'plugins/ecommerce/review', 'disapprove', 'Disapprove', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2801, 1, 'en', 'plugins/ecommerce/review', 'disapproved', 'Disapproved', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2802, 1, 'en', 'plugins/ecommerce/review', 'product', 'Product', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2803, 1, 'en', 'plugins/ecommerce/review', 'user', 'User', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2804, 1, 'en', 'plugins/ecommerce/review', 'star', 'Star', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2805, 1, 'en', 'plugins/ecommerce/review', 'status', 'Status', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2806, 1, 'en', 'plugins/ecommerce/review', 'list_review', 'Customer reviews', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2807, 1, 'en', 'plugins/ecommerce/review', 'intro.title', 'Manage customer reviews', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2808, 1, 'en', 'plugins/ecommerce/review', 'intro.description', 'Customer reviews will be shown here and you can manage it to show/hide in product detail page.', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2809, 1, 'en', 'plugins/ecommerce/review', 'images', 'Images', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2810, 1, 'en', 'plugins/ecommerce/review', 'delete', 'Delete', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2811, 1, 'en', 'plugins/ecommerce/review', 'publish', 'Publish', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2812, 1, 'en', 'plugins/ecommerce/review', 'unpublish', 'Unpublish', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2813, 1, 'en', 'plugins/ecommerce/review', 'published_success', 'Review published successfully!', '2023-11-08 01:55:25', '2023-11-08 01:55:25'),
(2814, 1, 'en', 'plugins/ecommerce/review', 'unpublished_success', 'Review unpublished successfully!', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2815, 1, 'en', 'plugins/ecommerce/review', 'delete_modal.title', 'Delete review', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2816, 1, 'en', 'plugins/ecommerce/review', 'delete_modal.description', 'Are you sure you want to delete this review? This action cannot be undone!', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2817, 1, 'en', 'plugins/ecommerce/shipping', 'name', 'Shipping Rules', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2818, 1, 'en', 'plugins/ecommerce/shipping', 'shipping', 'Shipping', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2819, 1, 'en', 'plugins/ecommerce/shipping', 'title', 'Title', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2820, 1, 'en', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2821, 1, 'en', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2822, 1, 'en', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2823, 1, 'en', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2824, 1, 'en', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2825, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2826, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping :code', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2827, 1, 'en', 'plugins/ecommerce/shipping', 'status', 'Status', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2828, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_methods', 'Shipping methods', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2829, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping_method', 'Create shipping method', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2830, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'Edit shipping method', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2831, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Add shipping region', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2832, 1, 'en', 'plugins/ecommerce/shipping', 'country', 'Country', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2833, 1, 'en', 'plugins/ecommerce/shipping', 'state', 'State', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2834, 1, 'en', 'plugins/ecommerce/shipping', 'city', 'City', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2835, 1, 'en', 'plugins/ecommerce/shipping', 'address', 'Address', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2836, 1, 'en', 'plugins/ecommerce/shipping', 'phone', 'Phone', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2837, 1, 'en', 'plugins/ecommerce/shipping', 'email', 'Email', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2838, 1, 'en', 'plugins/ecommerce/shipping', 'zip_code', 'Zip code', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2839, 1, 'en', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2840, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2841, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2842, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.pending', 'Pending', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2843, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.arrange_shipment', 'Arrange shipment', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2844, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.ready_to_be_shipped_out', 'Ready to be shipped out', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2845, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2846, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2847, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2848, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2849, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2850, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2851, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2852, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2853, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2854, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2855, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2856, 1, 'en', 'plugins/ecommerce/shipping', 'delete', 'Delete', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2857, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_rules', 'Shipping Rules', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2858, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_rules_description', 'Rules to calculate shipping fee.', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2859, 1, 'en', 'plugins/ecommerce/shipping', 'select_country', 'Select country', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2860, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_rule', 'Add shipping rule', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2861, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_rate', 'Delete shipping rate for area', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2862, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_rate_confirmation', 'Are you sure you want to delete <strong class=\"region-price-item-label\"></strong> from this shipping area?', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2863, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_area', 'Delete shipping area', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2864, 1, 'en', 'plugins/ecommerce/shipping', 'delete_shipping_area_confirmation', 'Are you sure you want to delete shipping area <strong class=\"region-item-label\"></strong>?', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2865, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_fee_for_area', 'Add shipping fee for area', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2866, 1, 'en', 'plugins/ecommerce/shipping', 'confirm', 'Confirm', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2867, 1, 'en', 'plugins/ecommerce/shipping', 'save', 'Save', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2868, 1, 'en', 'plugins/ecommerce/shipping', 'greater_than', 'Greater than', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2869, 1, 'en', 'plugins/ecommerce/shipping', 'type', 'Type', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2870, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_rule_name', 'Name of shipping rule', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2871, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_fee', 'Shipping fee', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2872, 1, 'en', 'plugins/ecommerce/shipping', 'cancel', 'Cancel', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2873, 1, 'en', 'plugins/ecommerce/shipping', 'based_on_weight', 'Based on product\'s weight (:unit)', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2874, 1, 'en', 'plugins/ecommerce/shipping', 'based_on_price', 'Based on product\'s price', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2875, 1, 'en', 'plugins/ecommerce/shipping', 'shipment_canceled', 'Shipment was canceled', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2876, 1, 'en', 'plugins/ecommerce/shipping', 'at', 'At', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2877, 1, 'en', 'plugins/ecommerce/shipping', 'cash_on_delivery', 'Cash on delivery (COD)', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2878, 1, 'en', 'plugins/ecommerce/shipping', 'update_shipping_status', 'Update shipping status', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2879, 1, 'en', 'plugins/ecommerce/shipping', 'update_cod_status', 'Update COD status', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2880, 1, 'en', 'plugins/ecommerce/shipping', 'history', 'History', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2881, 1, 'en', 'plugins/ecommerce/shipping', 'shipment_information', 'Shipment information', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2882, 1, 'en', 'plugins/ecommerce/shipping', 'order_number', 'Order number', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2883, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_method', 'Shipping method', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2884, 1, 'en', 'plugins/ecommerce/shipping', 'select_shipping_method', 'Select shipping method', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2885, 1, 'en', 'plugins/ecommerce/shipping', 'cod_status', 'COD status', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2886, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_status', 'Shipping status', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2887, 1, 'en', 'plugins/ecommerce/shipping', 'customer_information', 'Customer information', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2888, 1, 'en', 'plugins/ecommerce/shipping', 'sku', 'SKU', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2889, 1, 'en', 'plugins/ecommerce/shipping', 'change_status_confirm_title', 'Confirm <span class=\"shipment-status-label\"></span> ?', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2890, 1, 'en', 'plugins/ecommerce/shipping', 'change_status_confirm_description', 'Are you sure you want to confirm <span class=\"shipment-status-label\"></span> for this shipment?', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2891, 1, 'en', 'plugins/ecommerce/shipping', 'accept', 'Accept', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2892, 1, 'en', 'plugins/ecommerce/shipping', 'weight_unit', 'Weight (:unit)', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2893, 1, 'en', 'plugins/ecommerce/shipping', 'updated_at', 'Last Update', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2894, 1, 'en', 'plugins/ecommerce/shipping', 'cod_amount', 'Cash on delivery amount (COD)', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2895, 1, 'en', 'plugins/ecommerce/shipping', 'cancel_shipping', 'Cancel shipping', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2896, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_address', 'Shipping address', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2897, 1, 'en', 'plugins/ecommerce/shipping', 'packages', 'Packages', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2898, 1, 'en', 'plugins/ecommerce/shipping', 'edit', 'Edit', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2899, 1, 'en', 'plugins/ecommerce/shipping', 'fee', 'Fee', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2900, 1, 'en', 'plugins/ecommerce/shipping', 'note', 'Note', '2023-11-08 01:55:26', '2023-11-08 01:55:26'),
(2901, 1, 'en', 'plugins/ecommerce/shipping', 'finish', 'Finish', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2902, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_fee_cod', 'Shipping fee/COD', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2903, 1, 'en', 'plugins/ecommerce/shipping', 'send_confirmation_email_to_customer', 'Send confirmation email to customer', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2904, 1, 'en', 'plugins/ecommerce/shipping', 'form_name', 'Name', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2905, 1, 'en', 'plugins/ecommerce/shipping', 'changed_shipping_status', 'Changed status of shipping to: :status. Updated by: %user_name%', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2906, 1, 'en', 'plugins/ecommerce/shipping', 'order_confirmed_by', 'Order confirmed by %user_name%', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2907, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_canceled_by', 'Shipping is cancelled by %user_name%', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2908, 1, 'en', 'plugins/ecommerce/shipping', 'update_shipping_status_success', 'Update shipping status successfully!', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2909, 1, 'en', 'plugins/ecommerce/shipping', 'update_cod_status_success', 'Updated COD status of shipping successfully!', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2910, 1, 'en', 'plugins/ecommerce/shipping', 'updated_cod_status_by', 'Updated COD status to :status . Updated by: %user_name%', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2911, 1, 'en', 'plugins/ecommerce/shipping', 'all', 'All', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2912, 1, 'en', 'plugins/ecommerce/shipping', 'error_when_adding_new_region', 'There is an error when adding new region!', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2913, 1, 'en', 'plugins/ecommerce/shipping', 'delivery', 'Delivery', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2914, 1, 'en', 'plugins/ecommerce/shipping', 'adjustment_price_of', 'Adjustment price of :key', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2915, 1, 'en', 'plugins/ecommerce/shipping', 'warehouse', 'Warehouse', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2916, 1, 'en', 'plugins/ecommerce/shipping', 'delivery_note', 'Delivery note', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2917, 1, 'en', 'plugins/ecommerce/shipping', 'shipments', 'Shipments', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2918, 1, 'en', 'plugins/ecommerce/shipping', 'order_id', 'Order ID', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2919, 1, 'en', 'plugins/ecommerce/shipping', 'not_available', 'Not available', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2920, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_amount', 'Shipping Amount', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2921, 1, 'en', 'plugins/ecommerce/shipping', 'additional_shipment_information', 'Additional shipment information', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2922, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_company_name', 'Shipping Company Name', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2923, 1, 'en', 'plugins/ecommerce/shipping', 'tracking_id', 'Tracking ID', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2924, 1, 'en', 'plugins/ecommerce/shipping', 'tracking_link', 'Tracking Link', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2925, 1, 'en', 'plugins/ecommerce/shipping', 'estimate_date_shipped', 'Estimate Date Shipped', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2926, 1, 'en', 'plugins/ecommerce/shipping', 'date_shipped', 'Date Shipped', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2927, 1, 'en', 'plugins/ecommerce/shipping', 'add_note', 'Add note...', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2928, 1, 'en', 'plugins/ecommerce/shipping', 'view_order', 'View Order :order_id', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2929, 1, 'en', 'plugins/ecommerce/shipping', 'rule.types.based_on_weight', 'Based on product\'s weight (:unit)', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2930, 1, 'en', 'plugins/ecommerce/shipping', 'rule.types.based_on_price', 'Based on product\'s price', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2931, 1, 'en', 'plugins/ecommerce/shipping', 'rule.types.based_on_zipcode', 'Based on zipcode', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2932, 1, 'en', 'plugins/ecommerce/shipping', 'rule.types.based_on_location', 'Based on location', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2933, 1, 'en', 'plugins/ecommerce/shipping', 'rule.types.unavailable', 'Unavailable', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2934, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.name', 'Shipping Rule Items', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2935, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.edit', 'Edit item', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2936, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.create', 'Create new item', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2937, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.delete', 'Delete shipping rule item', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2938, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.confirmation', 'Are you sure you want to delete shipping rule item <strong class=\"item-label\"></strong>?', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2939, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.load_data_table', 'Load data table (:total)', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2940, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.tables.shipping_rule', 'Shipping rule', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2941, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.tables.country', 'Country', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2942, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.tables.state', 'State', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2943, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.tables.city', 'City', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2944, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.tables.zip_code', 'Zip code', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2945, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.tables.adjustment_price', 'Adjustment price', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2946, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.tables.is_enabled', 'Is enabled?', '2023-11-08 01:55:27', '2023-11-08 01:55:27');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2947, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.country', 'Country', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2948, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.country_placeholder', 'Country', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2949, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.state', 'State', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2950, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.state_placeholder', 'State', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2951, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.city', 'City', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2952, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.city_placeholder', 'City', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2953, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.zip_code', 'Zip code', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2954, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.zip_code_placeholder', 'Zip code', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2955, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.adjustment_price', 'Adjustment price', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2956, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.adjustment_price_placeholder', 'Adjustment price', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2957, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.is_enabled', 'Is enabled?', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2958, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.shipping_rule', 'Shipping rule', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2959, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.forms.no_shipping_rule', 'No shipping rule', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2960, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.bulk-import.menu', 'Bulk import Shipping Rule Items', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2961, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.bulk-import.greater_than_or_equal', 'Only numbers or decimals are accepted and greater than or equal to :min.', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2962, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.bulk-import.less_than_or_equal', 'Only numbers or decimals are accepted and less than or equal to :max.', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2963, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.bulk-import.between', 'Only numbers or decimals are accepted and between :min and :max.', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2964, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.bulk-import.overwrite', 'Overwrite', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2965, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.bulk-import.add_new', 'Add new', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2966, 1, 'en', 'plugins/ecommerce/shipping', 'rule.item.bulk-import.skip', 'Skip', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2967, 1, 'en', 'plugins/ecommerce/shipping', 'rule.select_type', 'Select type', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2968, 1, 'en', 'plugins/ecommerce/shipping', 'rule.cannot_create_rule_type_for_this_location', 'Cannot create rule type \":type\" on this location!', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2969, 1, 'en', 'plugins/ecommerce/store-locator', 'name', 'Store locators', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2970, 1, 'en', 'plugins/ecommerce/store-locator', 'description', 'This address will appear on your invoice and will be used to calculate your shipping price.', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2971, 1, 'en', 'plugins/ecommerce/store-locator', 'shop_name', 'Shop name', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2972, 1, 'en', 'plugins/ecommerce/store-locator', 'phone', 'Phone', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2973, 1, 'en', 'plugins/ecommerce/store-locator', 'email', 'Email', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2974, 1, 'en', 'plugins/ecommerce/store-locator', 'state', 'State', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2975, 1, 'en', 'plugins/ecommerce/store-locator', 'city', 'City', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2976, 1, 'en', 'plugins/ecommerce/store-locator', 'country', 'Country', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2977, 1, 'en', 'plugins/ecommerce/store-locator', 'address', 'Address', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2978, 1, 'en', 'plugins/ecommerce/store-locator', 'primary_store_is', 'Primary store is', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2979, 1, 'en', 'plugins/ecommerce/store-locator', 'store_name', 'Store name', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2980, 1, 'en', 'plugins/ecommerce/store-locator', 'select_country', 'Select country...', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2981, 1, 'en', 'plugins/ecommerce/store-locator', 'default_shipping_location', 'Default shipping location', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2982, 1, 'en', 'plugins/ecommerce/store-locator', 'default_store', 'Default store', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2983, 1, 'en', 'plugins/ecommerce/store-locator', 'company', 'Company', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2984, 1, 'en', 'plugins/ecommerce/store-locator', 'zip_code', 'Zip Code', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2985, 1, 'en', 'plugins/ecommerce/tax', 'name', 'Taxes', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2986, 1, 'en', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2987, 1, 'en', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2988, 1, 'en', 'plugins/ecommerce/tax', 'title', 'Title', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2989, 1, 'en', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2990, 1, 'en', 'plugins/ecommerce/tax', 'priority', 'Priority', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2991, 1, 'en', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2992, 1, 'en', 'plugins/ecommerce/tax', 'default', 'Default', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2993, 1, 'en', 'plugins/ecommerce/tax', 'country', 'Country', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2994, 1, 'en', 'plugins/ecommerce/tax', 'state', 'State', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2995, 1, 'en', 'plugins/ecommerce/tax', 'city', 'City', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2996, 1, 'en', 'plugins/ecommerce/tax', 'zip_code', 'Zipcode', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2997, 1, 'en', 'plugins/ecommerce/tax', 'rules', 'Rules', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2998, 1, 'en', 'plugins/ecommerce/tax', 'tax', 'Tax', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(2999, 1, 'en', 'plugins/ecommerce/tax', 'rule.name', 'Tax rules', '2023-11-08 01:55:27', '2023-11-08 01:55:27'),
(3000, 1, 'en', 'plugins/ecommerce/tax', 'rule.create', 'Create a tax rule', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3001, 1, 'en', 'plugins/ecommerce/tax', 'rule.edit', 'Edit tax rule :title', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3002, 1, 'en', 'plugins/faq/faq-category', 'name', 'Categories', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3003, 1, 'en', 'plugins/faq/faq-category', 'create', 'New category', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3004, 1, 'en', 'plugins/faq/faq', 'name', 'FAQ', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3005, 1, 'en', 'plugins/faq/faq', 'create', 'New faq', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3006, 1, 'en', 'plugins/faq/faq', 'question', 'Question', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3007, 1, 'en', 'plugins/faq/faq', 'answer', 'Answer', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3008, 1, 'en', 'plugins/faq/faq', 'category', 'Category', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3009, 1, 'en', 'plugins/faq/faq', 'all', 'All', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3010, 1, 'en', 'plugins/faq/faq', 'faq_schema_config', 'FAQ schema configuration (:link)', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3011, 1, 'en', 'plugins/faq/faq', 'learn_more', 'Learn more', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3012, 1, 'en', 'plugins/faq/faq', 'settings.title', 'FAQ', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3013, 1, 'en', 'plugins/faq/faq', 'settings.description', 'Settings for FAQ', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3014, 1, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema', 'Enable FAQ Schema?', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3015, 1, 'en', 'plugins/faq/faq', 'settings.enable_faq_schema_description', 'Learn more: https://developers.google.com/search/docs/data-types/faqpage', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3016, 1, 'en', 'plugins/faq/faq', 'select_category', 'Select a category', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3017, 1, 'en', 'plugins/faq/faq', 'add_item', 'Add item', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3018, 1, 'en', 'plugins/language/language', 'name', 'Languages', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3019, 1, 'en', 'plugins/language/language', 'choose_language', 'Choose a language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3020, 1, 'en', 'plugins/language/language', 'select_language', 'Select language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3021, 1, 'en', 'plugins/language/language', 'choose_language_helper', 'You can choose a language in the list or directly edit it below.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3022, 1, 'en', 'plugins/language/language', 'language_name', 'Language name', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3023, 1, 'en', 'plugins/language/language', 'language_name_helper', 'The name is how it is displayed on your site (for example: English).', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3024, 1, 'en', 'plugins/language/language', 'locale', 'Locale', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3025, 1, 'en', 'plugins/language/language', 'locale_helper', 'Laravel Locale for the language (for example: <code>en</code>).', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3026, 1, 'en', 'plugins/language/language', 'language_code', 'Language code', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3027, 1, 'en', 'plugins/language/language', 'language_code_helper', 'Language code - preferably 2-letters ISO 639-1 (for example: en)', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3028, 1, 'en', 'plugins/language/language', 'text_direction', 'Text direction', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3029, 1, 'en', 'plugins/language/language', 'text_direction_helper', 'Choose the text direction for the language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3030, 1, 'en', 'plugins/language/language', 'left_to_right', 'Left to right', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3031, 1, 'en', 'plugins/language/language', 'right_to_left', 'Right to left', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3032, 1, 'en', 'plugins/language/language', 'flag', 'Flag', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3033, 1, 'en', 'plugins/language/language', 'flag_helper', 'Choose a flag for the language.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3034, 1, 'en', 'plugins/language/language', 'order', 'Order', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3035, 1, 'en', 'plugins/language/language', 'order_helper', 'Position of the language in the language switcher', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3036, 1, 'en', 'plugins/language/language', 'add_new_language', 'Add new language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3037, 1, 'en', 'plugins/language/language', 'code', 'Code', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3038, 1, 'en', 'plugins/language/language', 'default_language', 'Is default?', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3039, 1, 'en', 'plugins/language/language', 'actions', 'Actions', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3040, 1, 'en', 'plugins/language/language', 'translations', 'Translations', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3041, 1, 'en', 'plugins/language/language', 'edit', 'Edit', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3042, 1, 'en', 'plugins/language/language', 'edit_tooltip', 'Edit this language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3043, 1, 'en', 'plugins/language/language', 'delete', 'Delete', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3044, 1, 'en', 'plugins/language/language', 'delete_tooltip', 'Delete this language and all its associated data', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3045, 1, 'en', 'plugins/language/language', 'choose_default_language', 'Choose :language as default language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3046, 1, 'en', 'plugins/language/language', 'current_language', 'Current record\'s language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3047, 1, 'en', 'plugins/language/language', 'edit_related', 'Edit related language for this record', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3048, 1, 'en', 'plugins/language/language', 'add_language_for_item', 'Add other language version for this record', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3049, 1, 'en', 'plugins/language/language', 'settings', 'Settings', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3050, 1, 'en', 'plugins/language/language', 'language_hide_default', 'Hide default language from URL?', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3051, 1, 'en', 'plugins/language/language', 'language_display_flag_only', 'Flag only', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3052, 1, 'en', 'plugins/language/language', 'language_display_name_only', 'Name only', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3053, 1, 'en', 'plugins/language/language', 'language_display_all', 'Display all flag and name', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3054, 1, 'en', 'plugins/language/language', 'language_display', 'Language display', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3055, 1, 'en', 'plugins/language/language', 'switcher_display', 'Switcher language display', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3056, 1, 'en', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3057, 1, 'en', 'plugins/language/language', 'language_switcher_display_list', 'List', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3058, 1, 'en', 'plugins/language/language', 'current_language_edit_notification', 'You are editing \"<strong class=\"current_language_text\">:language</strong>\" version', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3059, 1, 'en', 'plugins/language/language', 'confirm-change-language', 'Confirm change language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3060, 1, 'en', 'plugins/language/language', 'confirm-change-language-message', 'Do you really want to change language to \"<strong class=\"change_to_language_text\"></strong>\" ? This action will be override \"<strong class=\"change_to_language_text\"></strong>\" version if it\'s existed!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3061, 1, 'en', 'plugins/language/language', 'confirm-change-language-btn', 'Confirm change', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3062, 1, 'en', 'plugins/language/language', 'hide_languages', 'Hide languages', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3063, 1, 'en', 'plugins/language/language', 'hide_languages_description', 'You can completely hide content in specific languages from visitors and search engines, but still view it yourself. This allows reviewing translations that are in progress.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3064, 1, 'en', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} All languages are currently displayed.|{1} :language is currently hidden to visitors.|[2, Inf] :language are currently hidden to visitors.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3065, 1, 'en', 'plugins/language/language', 'show_all', 'Show all', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3066, 1, 'en', 'plugins/language/language', 'change_language', 'Language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3067, 1, 'en', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Show item in default language if it is not existed in current language', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3068, 1, 'en', 'plugins/language/language', 'select_flag', 'Select a flag...', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3069, 1, 'en', 'plugins/language/language', 'delete_confirmation_message', 'Do you really want to delete this language? It also deletes all items in this language and cannot rollback!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3070, 1, 'en', 'plugins/language/language', 'added_already', 'This language was added already!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3071, 1, 'en', 'plugins/language/language', 'language_auto_detect_user_language', 'Auto detect user language?', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3072, 1, 'en', 'plugins/location/bulk-import', 'name', 'Bulk Import', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3073, 1, 'en', 'plugins/location/bulk-import', 'imported_successfully', 'Your locations have been imported successfully!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3074, 1, 'en', 'plugins/location/bulk-import', 'please_choose_the_file_mime', 'Please choose the file mime :types', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3075, 1, 'en', 'plugins/location/bulk-import', 'please_choose_the_file', 'Please choose the file', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3076, 1, 'en', 'plugins/location/bulk-import', 'start_import', 'Start Import', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3077, 1, 'en', 'plugins/location/bulk-import', 'note', 'Note!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3078, 1, 'en', 'plugins/location/bulk-import', 'warning_before_importing', 'If this is your first time using this feature, please read the documentation or contact the Administrator for access to the correct functionality!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3079, 1, 'en', 'plugins/location/bulk-import', 'results', 'Result: :success successes, :failed failures', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3080, 1, 'en', 'plugins/location/bulk-import', 'failures', 'Failures', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3081, 1, 'en', 'plugins/location/bulk-import', 'tables.import', 'Import', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3082, 1, 'en', 'plugins/location/bulk-import', 'template', 'Template', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3083, 1, 'en', 'plugins/location/bulk-import', 'rules', 'Rules', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3084, 1, 'en', 'plugins/location/bulk-import', 'choose_file_with_mime', 'Choose file with mime: (:types)', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3085, 1, 'en', 'plugins/location/bulk-import', 'choose_file', 'Choose file', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3086, 1, 'en', 'plugins/location/bulk-import', 'menu', 'Import locations', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3087, 1, 'en', 'plugins/location/bulk-import', 'download-csv-file', 'Download CSV template', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3088, 1, 'en', 'plugins/location/bulk-import', 'download-excel-file', 'Download Excel template', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3089, 1, 'en', 'plugins/location/bulk-import', 'downloading', 'Downloading...', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3090, 1, 'en', 'plugins/location/bulk-import', 'export.template.input_error', 'Input error', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3091, 1, 'en', 'plugins/location/bulk-import', 'export.template.number_not_allowed', 'Number is not allowed!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3092, 1, 'en', 'plugins/location/bulk-import', 'export.template.allowed_input', 'Allowed input', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3093, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_decimal', 'Only numbers or decimals are accepted and greater than or equal to :min.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3094, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_whole_number', 'Only numbers are accepted and greater than or equal to :min.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3095, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_list', 'Please pick a value from the drop-down list.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3096, 1, 'en', 'plugins/location/bulk-import', 'export.template.pick_from_list', 'Pick from list', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3097, 1, 'en', 'plugins/location/bulk-import', 'export.template.value_not_in_list', 'Value is not in list.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3098, 1, 'en', 'plugins/location/bulk-import', 'export.template.max_text_length', 'Max text length', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3099, 1, 'en', 'plugins/location/bulk-import', 'export.template.prompt_max_text_length', 'Only accept text with length less than or equal to :max.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3100, 1, 'en', 'plugins/location/bulk-import', 'import_failed_description', 'Import failed, please check the errors below!', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3101, 1, 'en', 'plugins/location/bulk-import', 'available_enable_multi_language', 'Only available when you enable \"Is Multi Language?\"', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3102, 1, 'en', 'plugins/location/bulk-import', 'import_type_required_if', 'The :attribute field is required when \"Import Type\" is :value.', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3103, 1, 'en', 'plugins/location/bulk-import', 'import_available_data', 'Import available data', '2023-11-08 01:55:28', '2023-11-08 01:55:28'),
(3104, 1, 'en', 'plugins/location/bulk-import', 'import', 'Import', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3105, 1, 'en', 'plugins/location/bulk-import', 'import_available_data_confirmation', 'Import available data confirmation', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3106, 1, 'en', 'plugins/location/bulk-import', 'import_available_data_confirmation_content', 'Do you really want to import states/cities for this country?', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3107, 1, 'en', 'plugins/location/bulk-import', 'upload_file_placeholder', 'Drag and drop file here or click to upload', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3108, 1, 'en', 'plugins/location/bulk-import', 'uploading', 'Uploading...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3109, 1, 'en', 'plugins/location/bulk-import', 'validating', 'Validating...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3110, 1, 'en', 'plugins/location/bulk-import', 'importing', 'Importing...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3111, 1, 'en', 'plugins/location/bulk-import', 'validating_message', 'Validating from :from to :to...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3112, 1, 'en', 'plugins/location/bulk-import', 'importing_message', 'Importing from :from to :to...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3113, 1, 'en', 'plugins/location/bulk-import', 'total_rows', 'You have imported :total rows successfully!', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3114, 1, 'en', 'plugins/location/city', 'name', 'Cities', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3115, 1, 'en', 'plugins/location/city', 'create', 'New city', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3116, 1, 'en', 'plugins/location/city', 'state', 'State', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3117, 1, 'en', 'plugins/location/city', 'select_state', 'Select state...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3118, 1, 'en', 'plugins/location/city', 'select_city', 'Select city...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3119, 1, 'en', 'plugins/location/city', 'country', 'Country', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3120, 1, 'en', 'plugins/location/city', 'select_country', 'Select country...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3121, 1, 'en', 'plugins/location/city', 'city', 'City', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3122, 1, 'en', 'plugins/location/country', 'name', 'Countries', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3123, 1, 'en', 'plugins/location/country', 'create', 'New country', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3124, 1, 'en', 'plugins/location/country', 'nationality', 'Nationality', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3125, 1, 'en', 'plugins/location/country', 'code', 'Country ISO code', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3126, 1, 'en', 'plugins/location/country', 'code_placeholder', 'ISO country code, uppercase. Ex: US.', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3127, 1, 'en', 'plugins/location/country', 'code_helper', 'Find country ISO code from here: https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3128, 1, 'en', 'plugins/location/location', 'name', 'Locations', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3129, 1, 'en', 'plugins/location/location', 'all_states', 'All states', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3130, 1, 'en', 'plugins/location/location', 'abbreviation', 'Abbreviation', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3131, 1, 'en', 'plugins/location/location', 'abbreviation_placeholder', 'E.g: CA', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3132, 1, 'en', 'plugins/location/location', 'exporting', 'Exporting', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3133, 1, 'en', 'plugins/location/location', 'total_country', 'Total countries', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3134, 1, 'en', 'plugins/location/location', 'total_state', 'Total states', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3135, 1, 'en', 'plugins/location/location', 'total_city', 'Total cities', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3136, 1, 'en', 'plugins/location/location', 'export_location', 'Export location', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3137, 1, 'en', 'plugins/location/location', 'start_export', 'Start exporting', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3138, 1, 'en', 'plugins/location/location', 'enums.import_type.country', 'Country', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3139, 1, 'en', 'plugins/location/location', 'enums.import_type.state', 'State', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3140, 1, 'en', 'plugins/location/location', 'enums.import_type.city', 'City', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3141, 1, 'en', 'plugins/location/state', 'name', 'States', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3142, 1, 'en', 'plugins/location/state', 'create', 'New state', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3143, 1, 'en', 'plugins/location/state', 'country', 'Country', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3144, 1, 'en', 'plugins/location/state', 'select_country', 'Select a country...', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3145, 1, 'en', 'plugins/location/state', 'state', 'State', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3146, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3147, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3148, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3149, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3150, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3151, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3152, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3153, 1, 'en', 'plugins/newsletter/newsletter', 'settings.title', 'Newsletter', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3154, 1, 'en', 'plugins/newsletter/newsletter', 'settings.description', 'Settings for newsletter (auto send newsletter email to SendGrid, Mailchimp... when someone register newsletter on website).', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3155, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_api_key', 'Mailchimp API Key', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3156, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list_id', 'Mailchimp List ID', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3157, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list', 'Mailchimp List', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3158, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_api_key', 'Sendgrid API Key', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3159, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list_id', 'Sendgrid List ID', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3160, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list', 'Sendgrid List', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3161, 1, 'en', 'plugins/newsletter/newsletter', 'settings.enable_newsletter_contacts_list_api', 'Enable newsletter contacts list API?', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3162, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3163, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3164, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3165, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3166, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3167, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3168, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3169, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3170, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3171, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3172, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3173, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3174, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3175, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3176, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3177, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Fast and safe online payment via PayPal.', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3178, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3179, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3180, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3181, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3182, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3183, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3184, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3185, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3186, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3187, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3188, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3189, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3190, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3191, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3192, 1, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3193, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3194, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3195, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3196, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3197, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3198, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3199, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3200, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3201, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3202, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3203, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3204, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3205, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2023-11-08 01:55:29', '2023-11-08 01:55:29'),
(3206, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3207, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3208, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3209, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3210, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3211, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3212, 1, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3213, 1, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3214, 1, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3215, 1, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3216, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3217, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3218, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3219, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3220, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3221, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3222, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3223, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3224, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3225, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3226, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3227, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3228, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3229, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3230, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3231, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3232, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3233, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3234, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3235, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3236, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3237, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3238, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3239, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3240, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3241, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3242, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3243, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3244, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3245, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3246, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3247, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3248, 1, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3249, 1, 'en', 'plugins/payment/payment', 'refunds.title', 'Refunds', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3250, 1, 'en', 'plugins/payment/payment', 'refunds.id', 'ID', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3251, 1, 'en', 'plugins/payment/payment', 'refunds.breakdowns', 'Breakdowns', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3252, 1, 'en', 'plugins/payment/payment', 'refunds.gross_amount', 'Gross amount', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3253, 1, 'en', 'plugins/payment/payment', 'refunds.paypal_fee', 'PayPal fee', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3254, 1, 'en', 'plugins/payment/payment', 'refunds.net_amount', 'Net amount', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3255, 1, 'en', 'plugins/payment/payment', 'refunds.total_refunded_amount', 'Total refunded amount', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3256, 1, 'en', 'plugins/payment/payment', 'refunds.create_time', 'Create time', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3257, 1, 'en', 'plugins/payment/payment', 'refunds.update_time', 'Update time', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3258, 1, 'en', 'plugins/payment/payment', 'refunds.status', 'Status', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3259, 1, 'en', 'plugins/payment/payment', 'refunds.description', 'Description', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3260, 1, 'en', 'plugins/payment/payment', 'refunds.refunded_at', 'Refunded at', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3261, 1, 'en', 'plugins/payment/payment', 'refunds.error_message', 'Error message', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3262, 1, 'en', 'plugins/payment/payment', 'view_response_source', 'View response source', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3263, 1, 'en', 'plugins/payment/payment', 'status_is_not_completed', 'Status is not COMPLETED', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3264, 1, 'en', 'plugins/payment/payment', 'cannot_found_capture_id', 'Can not found capture id with payment detail', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3265, 1, 'en', 'plugins/payment/payment', 'amount_refunded', 'Amount refunded', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3266, 1, 'en', 'plugins/payment/payment', 'amount_remaining', 'Amount remaining', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3267, 1, 'en', 'plugins/payment/payment', 'paid_at', 'Paid At', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3268, 1, 'en', 'plugins/payment/payment', 'invalid_settings', 'Settings for :name are invalid!', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3269, 1, 'en', 'plugins/payment/payment', 'view_transaction', 'Transaction \":charge_id\"', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3270, 1, 'en', 'plugins/payment/payment', 'payment_description', 'Pay for your order #:order_id at :site_url', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3271, 1, 'en', 'plugins/shippo/shippo', 'name', 'Shippo', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3272, 1, 'en', 'plugins/shippo/shippo', 'description', 'All of the Carriers and Stores You Need', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3273, 1, 'en', 'plugins/shippo/shippo', 'note_0', 'Before activating, please read the instructions below', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3274, 1, 'en', 'plugins/shippo/shippo', 'note_1', 'Need to use cities, states, countries from Admin -> Locations, <a href=\":link\" target=\"_blank\" rel=\"noopener noreferrer\">:link</a>', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3275, 1, 'en', 'plugins/shippo/shippo', 'note_2', 'Enabled \"Load countries, states, cities from plugin location?\" and \"Enable Zip Code?\" for Shippo to work correctly', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3276, 1, 'en', 'plugins/shippo/shippo', 'note_3', 'Update city, state, country with location plugin data, enter and check the address and zip code in \"<a href=\":link\" target=\"_blank\">Basic information</a>\"', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3277, 1, 'en', 'plugins/shippo/shippo', 'note_4', 'Vendor needs to update Company & Zip Code. Update city, state, country with location plugin data', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3278, 1, 'en', 'plugins/shippo/shippo', 'note_5', 'Shippo only allows to create transactions with shipment/rate within 24 hours, if more than 24 hours, please update the rate again', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3279, 1, 'en', 'plugins/shippo/shippo', 'note_6', 'COD payment method refer <a href=\":link\" target=\"_blank\" rel=\"noopener noreferrer\">here</a>', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3280, 1, 'en', 'plugins/shippo/shippo', 'configuration_instruction', 'Configuration instruction for :name', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3281, 1, 'en', 'plugins/shippo/shippo', 'configuration_requirement', 'To use :name, you need', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3282, 1, 'en', 'plugins/shippo/shippo', 'service_registration', 'Register with :name', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3283, 1, 'en', 'plugins/shippo/shippo', 'after_service_registration_msg', 'After registration at :name, you will have API Key', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3284, 1, 'en', 'plugins/shippo/shippo', 'enter_api_key', 'Enter API Key into the box in right hand', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3285, 1, 'en', 'plugins/shippo/shippo', 'please_provide_information', 'Please provide information', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3286, 1, 'en', 'plugins/shippo/shippo', 'sandbox_mode', 'Test mode', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3287, 1, 'en', 'plugins/shippo/shippo', 'activate', 'Activate', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3288, 1, 'en', 'plugins/shippo/shippo', 'disabled_in_demo_mode', 'You cannot update Shippo settings in demo mode!', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3289, 1, 'en', 'plugins/shippo/shippo', 'parcel', 'Parcel', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3290, 1, 'en', 'plugins/shippo/shippo', 'estimated_days', 'Estimated delivery in :day day(s)', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3291, 1, 'en', 'plugins/shippo/shippo', 'from_address', 'From address', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3292, 1, 'en', 'plugins/shippo/shippo', 'to_address', 'To address', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3293, 1, 'en', 'plugins/shippo/shippo', 'check_validate_token', 'Check validate token?', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3294, 1, 'en', 'plugins/shippo/shippo', 'saved_shipping_settings_success', 'Saved settings successfully!', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3295, 1, 'en', 'plugins/shippo/shippo', 'token_name_is_required', ':name is required for the integration to work', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3296, 1, 'en', 'plugins/shippo/shippo', 'token_name_is_invalid', ':name is invalid', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3297, 1, 'en', 'plugins/shippo/shippo', 'live_api_token', 'Live API Token', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3298, 1, 'en', 'plugins/shippo/shippo', 'test_api_token', 'Test API Token', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3299, 1, 'en', 'plugins/shippo/shippo', 'print_label', 'Print label', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3300, 1, 'en', 'plugins/shippo/shippo', 'transaction.created', 'Created transaction #:tracking', '2023-11-08 01:55:30', '2023-11-08 01:55:30'),
(3301, 1, 'en', 'plugins/shippo/shippo', 'transaction.view_and_create', 'View and Create transaction', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3302, 1, 'en', 'plugins/shippo/shippo', 'transaction.create', 'Create transaction', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3303, 1, 'en', 'plugins/shippo/shippo', 'transaction.created_success', 'Created transaction successfully!', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3304, 1, 'en', 'plugins/shippo/shippo', 'transaction.updated', 'Updated transaction #:tracking', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3305, 1, 'en', 'plugins/shippo/shippo', 'tracking.updated', 'Updated tracking #:tracking', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3306, 1, 'en', 'plugins/shippo/shippo', 'tracking.statuses.pre_transit', 'The label is created but before the package is dropped off or picked up by the carrier.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3307, 1, 'en', 'plugins/shippo/shippo', 'tracking.statuses.transit', 'The package has been scanned by the carrier and is in transit.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3308, 1, 'en', 'plugins/shippo/shippo', 'tracking.statuses.delivered', 'The package has been successfully delivered.', '2023-11-08 01:55:31', '2023-11-08 01:55:31');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3309, 1, 'en', 'plugins/shippo/shippo', 'tracking.statuses.returned', 'The package is en route to be returned to the sender, or has been returned successfully.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3310, 1, 'en', 'plugins/shippo/shippo', 'tracking.statuses.failure', 'The carrier indicated that there has been an issue with the delivery. This can happen for various reasons and depends on the carrier. This status does not indicate a technical, but a delivery issue.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3311, 1, 'en', 'plugins/shippo/shippo', 'tracking.statuses.unknown', 'The package has not been found via the carrier’s tracking system.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3312, 1, 'en', 'plugins/shippo/shippo', 'view_other_exchange_rates', 'View :count other exchange rates', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3313, 1, 'en', 'plugins/shippo/shippo', 'carrier_could_not_be_found', 'The carrier for which the order was selected could not be found', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3314, 1, 'en', 'plugins/shippo/shippo', 'update_rate', 'Update rate', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3315, 1, 'en', 'plugins/shippo/shippo', 'updated_rate_success', 'Created rate successfully!', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3316, 1, 'en', 'plugins/shippo/shippo', 'recheck_rate', 'Recheck rate', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3317, 1, 'en', 'plugins/shippo/shippo', 'shipment_object_id_not_found', 'No matching shipping #:id information found', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3318, 1, 'en', 'plugins/shippo/shippo', 'order_amount', 'Order amount', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3319, 1, 'en', 'plugins/shippo/shippo', 'logging', 'Logging?', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3320, 1, 'en', 'plugins/shippo/shippo', 'webhooks', 'Webhooks?', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3321, 1, 'en', 'plugins/shippo/shippo', 'cache_response', 'Cache response?', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3322, 1, 'en', 'plugins/shippo/shippo', 'not_available_in_cod_payment_method', 'Shippo options won\'t be shown if the selected payment method is COD!', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3323, 1, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3324, 1, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3325, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3326, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3327, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3328, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3329, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3330, 1, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3331, 1, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3332, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3333, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3334, 1, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3335, 1, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3336, 1, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3337, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3338, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3339, 1, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3340, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3341, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3342, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3343, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3344, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3345, 1, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3346, 1, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3347, 1, 'en', 'plugins/team/team', 'name', 'Teams', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3348, 1, 'en', 'plugins/team/team', 'create', 'New team', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3349, 1, 'en', 'plugins/team/team', 'forms.name', 'Name', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3350, 1, 'en', 'plugins/team/team', 'forms.name_placeholder', 'Enter name...', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3351, 1, 'en', 'plugins/team/team', 'forms.title', 'Title', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3352, 1, 'en', 'plugins/team/team', 'forms.title_placeholder', 'Enter title...', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3353, 1, 'en', 'plugins/team/team', 'forms.photo', 'Avatar', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3354, 1, 'en', 'plugins/team/team', 'forms.location', 'Location', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3355, 1, 'en', 'plugins/team/team', 'forms.location_placeholder', 'Enter title...', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3356, 1, 'en', 'plugins/team/team', 'forms.socials_facebook', 'Facebook', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3357, 1, 'en', 'plugins/team/team', 'forms.socials_facebook_placeholder', 'Facebook socials', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3358, 1, 'en', 'plugins/team/team', 'forms.socials_twitter', 'Twitter', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3359, 1, 'en', 'plugins/team/team', 'forms.socials_twitter_placeholder', 'Twitter socials', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3360, 1, 'en', 'plugins/team/team', 'forms.socials_instagram', 'Instagram', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3361, 1, 'en', 'plugins/team/team', 'forms.socials_instagram_placeholder', 'Instagram socials', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3362, 1, 'en', 'plugins/testimonial/testimonial', 'name', 'Testimonials', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3363, 1, 'en', 'plugins/testimonial/testimonial', 'create', 'New testimonial', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3364, 1, 'en', 'plugins/testimonial/testimonial', 'company', 'Position/Company', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3365, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3366, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3367, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to lang folder. Please use \"Publish translations\" button to apply changes.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3368, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3369, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3370, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3371, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3372, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3373, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3374, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3375, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3376, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3377, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3378, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3379, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3380, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3381, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3382, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Other translations', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3383, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3384, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3385, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3386, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3387, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3388, 1, 'en', 'plugins/translation/translation', 'locale_placeholder', 'Ex: en', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3389, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3390, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3391, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3392, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3393, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3394, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3395, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3396, 1, 'en', 'plugins/translation/translation', 'folder_is_not_writeable', 'Cannot write files! Folder :lang_path is not writable. Please chmod to make it writable!', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3397, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3398, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in :lang_path!', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3399, 1, 'en', 'plugins/translation/translation', 'download', 'Download', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3400, 1, 'en', 'plugins/translation/translation', 'select_locale', 'Select locale', '2023-11-08 01:55:31', '2023-11-08 01:55:31'),
(3401, 1, 'en', 'plugins/translation/translation', 'theme_translations_instruction', 'Click on text to translate. Do NOT translate variables, Eg. :username, :query, :link...', '2023-11-08 01:55:32', '2023-11-08 01:55:32'),
(3402, 1, 'en', 'plugins/translation/translation', 'import_available_locale', 'Or import available locale from our GitHub repository', '2023-11-08 01:55:32', '2023-11-08 01:55:32'),
(3403, 1, 'en', 'plugins/translation/translation', 'add_new_locale', 'Add new locale', '2023-11-08 01:55:32', '2023-11-08 01:55:32'),
(3404, 1, 'en', 'plugins/translation/translation', 'download_locale', 'Download locale', '2023-11-08 01:55:32', '2023-11-08 01:55:32'),
(3405, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation', 'Download locale from GitHub', '2023-11-08 01:55:32', '2023-11-08 01:55:32'),
(3406, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation_content', 'Are you sure you want to download this locale? It will be downloaded into :lang_path, you can delete it later if you want.', '2023-11-08 01:55:32', '2023-11-08 01:55:32'),
(3407, 1, 'en', 'plugins/translation/translation', 'is_default', 'Is default?', '2023-11-08 01:55:32', '2023-11-08 01:55:32');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'yacouboubassarou@gmail.com', NULL, '$2y$12$WaOBFUEo8LrWJ2u6ZQiICOBd1hMOkYk2C6lNufAMu3RW/kHKrK3XG', '5uHVIRUu68a7Y4MB2jNBOKSCAUaKfsfswh71gxSdd5aGSYrenagRLknt08YE', '2023-11-09 15:34:42', '2023-11-09 15:34:42', 'Bassarou', 'Yacoubou', 'admin', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Index pour la table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `announcements_translations`
--
ALTER TABLE `announcements_translations`
  ADD PRIMARY KEY (`lang_code`,`announcements_id`);

--
-- Index pour la table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Index pour la table `bs_packages`
--
ALTER TABLE `bs_packages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bs_packages_translations`
--
ALTER TABLE `bs_packages_translations`
  ADD PRIMARY KEY (`lang_code`,`bs_packages_id`);

--
-- Index pour la table `bs_services`
--
ALTER TABLE `bs_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bs_services_category_id_index` (`category_id`);

--
-- Index pour la table `bs_services_translations`
--
ALTER TABLE `bs_services_translations`
  ADD PRIMARY KEY (`lang_code`,`bs_services_id`);

--
-- Index pour la table `bs_service_categories`
--
ALTER TABLE `bs_service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bs_service_categories_parent_id_index` (`parent_id`);

--
-- Index pour la table `bs_service_categories_translations`
--
ALTER TABLE `bs_service_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`bs_service_categories_id`);

--
-- Index pour la table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `careers_translations`
--
ALTER TABLE `careers_translations`
  ADD PRIMARY KEY (`lang_code`,`careers_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_status_index` (`status`),
  ADD KEY `categories_created_at_index` (`created_at`);

--
-- Index pour la table `categories_translations`
--
ALTER TABLE `categories_translations`
  ADD PRIMARY KEY (`lang_code`,`categories_id`);

--
-- Index pour la table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_slug_unique` (`slug`);

--
-- Index pour la table `cities_translations`
--
ALTER TABLE `cities_translations`
  ADD PRIMARY KEY (`lang_code`,`cities_id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `countries_translations`
--
ALTER TABLE `countries_translations`
  ADD PRIMARY KEY (`lang_code`,`countries_id`);

--
-- Index pour la table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Index pour la table `ec_brands`
--
ALTER TABLE `ec_brands`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_brands_translations`
--
ALTER TABLE `ec_brands_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_brands_id`);

--
-- Index pour la table `ec_cart`
--
ALTER TABLE `ec_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Index pour la table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_customers`
--
ALTER TABLE `ec_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_customers_email_unique` (`email`);

--
-- Index pour la table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_customer_password_resets`
--
ALTER TABLE `ec_customer_password_resets`
  ADD KEY `ec_customer_password_resets_email_index` (`email`),
  ADD KEY `ec_customer_password_resets_token_index` (`token`);

--
-- Index pour la table `ec_customer_recently_viewed_products`
--
ALTER TABLE `ec_customer_recently_viewed_products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_customer_used_coupons`
--
ALTER TABLE `ec_customer_used_coupons`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Index pour la table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_discounts_code_unique` (`code`);

--
-- Index pour la table `ec_discount_customers`
--
ALTER TABLE `ec_discount_customers`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Index pour la table `ec_discount_products`
--
ALTER TABLE `ec_discount_products`
  ADD PRIMARY KEY (`discount_id`,`product_id`);

--
-- Index pour la table `ec_discount_product_categories`
--
ALTER TABLE `ec_discount_product_categories`
  ADD PRIMARY KEY (`discount_id`,`product_category_id`);

--
-- Index pour la table `ec_discount_product_collections`
--
ALTER TABLE `ec_discount_product_collections`
  ADD PRIMARY KEY (`discount_id`,`product_collection_id`);

--
-- Index pour la table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_flash_sales_translations`
--
ALTER TABLE `ec_flash_sales_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_flash_sales_id`);

--
-- Index pour la table `ec_global_options`
--
ALTER TABLE `ec_global_options`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_global_options_translations`
--
ALTER TABLE `ec_global_options_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_global_options_id`);

--
-- Index pour la table `ec_global_option_value`
--
ALTER TABLE `ec_global_option_value`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_global_option_value_translations`
--
ALTER TABLE `ec_global_option_value_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_global_option_value_id`);

--
-- Index pour la table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_invoices`
--
ALTER TABLE `ec_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_invoices_code_unique` (`code`),
  ADD KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `ec_invoices_payment_id_index` (`payment_id`),
  ADD KEY `ec_invoices_status_index` (`status`);

--
-- Index pour la table `ec_invoice_items`
--
ALTER TABLE `ec_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`);

--
-- Index pour la table `ec_options`
--
ALTER TABLE `ec_options`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_options_translations`
--
ALTER TABLE `ec_options_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_options_id`);

--
-- Index pour la table `ec_option_value`
--
ALTER TABLE `ec_option_value`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_option_value_translations`
--
ALTER TABLE `ec_option_value_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_option_value_id`);

--
-- Index pour la table `ec_orders`
--
ALTER TABLE `ec_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_orders_code_unique` (`code`),
  ADD KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`);

--
-- Index pour la table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_order_referrals`
--
ALTER TABLE `ec_order_referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_order_referrals_order_id_index` (`order_id`);

--
-- Index pour la table `ec_order_returns`
--
ALTER TABLE `ec_order_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_order_returns_code_unique` (`code`);

--
-- Index pour la table `ec_order_return_items`
--
ALTER TABLE `ec_order_return_items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_order_tax_information`
--
ALTER TABLE `ec_order_tax_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_order_tax_information_order_id_index` (`order_id`);

--
-- Index pour la table `ec_products`
--
ALTER TABLE `ec_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  ADD KEY `sale_type_index` (`sale_type`),
  ADD KEY `start_date_index` (`start_date`),
  ADD KEY `end_date_index` (`end_date`),
  ADD KEY `sale_price_index` (`sale_price`),
  ADD KEY `is_variation_index` (`is_variation`),
  ADD KEY `ec_products_sku_index` (`sku`);

--
-- Index pour la table `ec_products_translations`
--
ALTER TABLE `ec_products_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_products_id`);

--
-- Index pour la table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_set_status_index` (`attribute_set_id`);

--
-- Index pour la table `ec_product_attributes_translations`
--
ALTER TABLE `ec_product_attributes_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_attributes_id`);

--
-- Index pour la table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_product_attribute_sets_translations`
--
ALTER TABLE `ec_product_attribute_sets_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`);

--
-- Index pour la table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  ADD KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`);

--
-- Index pour la table `ec_product_categories_translations`
--
ALTER TABLE `ec_product_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_categories_id`);

--
-- Index pour la table `ec_product_categorizables`
--
ALTER TABLE `ec_product_categorizables`
  ADD PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  ADD KEY `ec_product_categorizables_category_id_index` (`category_id`),
  ADD KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  ADD KEY `ec_product_categorizables_reference_type_index` (`reference_type`);

--
-- Index pour la table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `ec_product_category_product_category_id_index` (`category_id`),
  ADD KEY `ec_product_category_product_product_id_index` (`product_id`);

--
-- Index pour la table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_product_collections_translations`
--
ALTER TABLE `ec_product_collections_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_collections_id`);

--
-- Index pour la table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  ADD PRIMARY KEY (`product_id`,`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_id_index` (`product_id`);

--
-- Index pour la table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  ADD PRIMARY KEY (`from_product_id`,`to_product_id`),
  ADD KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Index pour la table `ec_product_files`
--
ALTER TABLE `ec_product_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_files_product_id_index` (`product_id`);

--
-- Index pour la table `ec_product_labels`
--
ALTER TABLE `ec_product_labels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_product_labels_translations`
--
ALTER TABLE `ec_product_labels_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_labels_id`);

--
-- Index pour la table `ec_product_label_products`
--
ALTER TABLE `ec_product_label_products`
  ADD PRIMARY KEY (`product_label_id`,`product_id`),
  ADD KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  ADD KEY `ec_product_label_products_product_id_index` (`product_id`);

--
-- Index pour la table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  ADD PRIMARY KEY (`from_product_id`,`to_product_id`),
  ADD KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`);

--
-- Index pour la table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_product_tags_translations`
--
ALTER TABLE `ec_product_tags_translations`
  ADD PRIMARY KEY (`lang_code`,`ec_product_tags_id`);

--
-- Index pour la table `ec_product_tag_product`
--
ALTER TABLE `ec_product_tag_product`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `ec_product_tag_product_product_id_index` (`product_id`),
  ADD KEY `ec_product_tag_product_tag_id_index` (`tag_id`);

--
-- Index pour la table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  ADD PRIMARY KEY (`from_product_id`,`to_product_id`),
  ADD KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Index pour la table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `configurable_product_index` (`product_id`,`configurable_product_id`);

--
-- Index pour la table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_variation_index` (`attribute_id`,`variation_id`);

--
-- Index pour la table `ec_product_views`
--
ALTER TABLE `ec_product_views`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  ADD KEY `ec_product_views_product_id_index` (`product_id`);

--
-- Index pour la table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  ADD PRIMARY KEY (`product_id`,`attribute_set_id`);

--
-- Index pour la table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  ADD KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  ADD KEY `review_relation_index` (`product_id`,`customer_id`,`status`);

--
-- Index pour la table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_tax_products`
--
ALTER TABLE `ec_tax_products`
  ADD PRIMARY KEY (`product_id`,`tax_id`),
  ADD KEY `ec_tax_products_tax_id_index` (`tax_id`),
  ADD KEY `ec_tax_products_product_id_index` (`product_id`);

--
-- Index pour la table `ec_tax_rules`
--
ALTER TABLE `ec_tax_rules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_relation_index` (`product_id`,`customer_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `faqs_translations`
--
ALTER TABLE `faqs_translations`
  ADD PRIMARY KEY (`lang_code`,`faqs_id`);

--
-- Index pour la table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `faq_categories_translations`
--
ALTER TABLE `faq_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`faq_categories_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD KEY `lang_locale_index` (`lang_locale`),
  ADD KEY `lang_code_index` (`lang_code`),
  ADD KEY `lang_is_default_index` (`lang_is_default`);

--
-- Index pour la table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`),
  ADD KEY `meta_code_index` (`lang_meta_code`),
  ADD KEY `meta_origin_index` (`lang_meta_origin`),
  ADD KEY `meta_reference_type_index` (`reference_type`);

--
-- Index pour la table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`),
  ADD KEY `media_files_index` (`folder_id`,`user_id`,`created_at`);

--
-- Index pour la table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`),
  ADD KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`);

--
-- Index pour la table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Index pour la table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`);

--
-- Index pour la table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `reference_type` (`reference_type`);

--
-- Index pour la table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_index` (`user_id`);

--
-- Index pour la table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`lang_code`,`pages_id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_status_index` (`status`),
  ADD KEY `posts_author_id_index` (`author_id`),
  ADD KEY `posts_author_type_index` (`author_type`),
  ADD KEY `posts_created_at_index` (`created_at`);

--
-- Index pour la table `posts_translations`
--
ALTER TABLE `posts_translations`
  ADD PRIMARY KEY (`lang_code`,`posts_id`);

--
-- Index pour la table `post_categories`
--
ALTER TABLE `post_categories`
  ADD KEY `post_categories_category_id_index` (`category_id`),
  ADD KEY `post_categories_post_id_index` (`post_id`);

--
-- Index pour la table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_tag_id_index` (`tag_id`),
  ADD KEY `post_tags_post_id_index` (`post_id`);

--
-- Index pour la table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Index pour la table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slugs_reference_id_index` (`reference_id`),
  ADD KEY `slugs_key_index` (`key`),
  ADD KEY `slugs_prefix_index` (`prefix`),
  ADD KEY `slugs_reference_index` (`reference_id`,`reference_type`);

--
-- Index pour la table `slugs_translations`
--
ALTER TABLE `slugs_translations`
  ADD PRIMARY KEY (`lang_code`,`slugs_id`);

--
-- Index pour la table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `states_slug_unique` (`slug`);

--
-- Index pour la table `states_translations`
--
ALTER TABLE `states_translations`
  ADD PRIMARY KEY (`lang_code`,`states_id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`lang_code`,`tags_id`);

--
-- Index pour la table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `teams_translations`
--
ALTER TABLE `teams_translations`
  ADD PRIMARY KEY (`lang_code`,`teams_id`);

--
-- Index pour la table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `testimonials_translations`
--
ALTER TABLE `testimonials_translations`
  ADD PRIMARY KEY (`lang_code`,`testimonials_id`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Index pour la table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Index pour la table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `bs_packages`
--
ALTER TABLE `bs_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bs_services`
--
ALTER TABLE `bs_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bs_service_categories`
--
ALTER TABLE `bs_service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_brands`
--
ALTER TABLE `ec_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ec_customers`
--
ALTER TABLE `ec_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_customer_recently_viewed_products`
--
ALTER TABLE `ec_customer_recently_viewed_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_global_options`
--
ALTER TABLE `ec_global_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_global_option_value`
--
ALTER TABLE `ec_global_option_value`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_invoices`
--
ALTER TABLE `ec_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_invoice_items`
--
ALTER TABLE `ec_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_options`
--
ALTER TABLE `ec_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_option_value`
--
ALTER TABLE `ec_option_value`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_orders`
--
ALTER TABLE `ec_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_order_referrals`
--
ALTER TABLE `ec_order_referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_order_returns`
--
ALTER TABLE `ec_order_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_order_return_items`
--
ALTER TABLE `ec_order_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_order_tax_information`
--
ALTER TABLE `ec_order_tax_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_products`
--
ALTER TABLE `ec_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_files`
--
ALTER TABLE `ec_product_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_labels`
--
ALTER TABLE `ec_product_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_product_views`
--
ALTER TABLE `ec_product_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_tax_rules`
--
ALTER TABLE `ec_tax_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT pour la table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT pour la table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3408;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
