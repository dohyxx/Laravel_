-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 22-02-09 10:37
-- 서버 버전: 10.4.22-MariaDB
-- PHP 버전: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `pedex`
--

DELIMITER $$
--
-- 함수
--
CREATE DEFINER=`root`@`localhost` FUNCTION `json_extract` (`details` TEXT, `required_field` VARCHAR(255)) RETURNS TEXT CHARSET latin1 BEGIN
        SET details = SUBSTRING_INDEX(details, "{", -1);
        SET details = SUBSTRING_INDEX(details, "}", 1);
        RETURN TRIM(
            BOTH '"' FROM SUBSTRING_INDEX(
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(
                        details,
                        CONCAT(
                            '"',
                            SUBSTRING_INDEX(required_field,'$.', -1),
                            '":'
                        ),
                        -1
                    ),
                    ',"',
                    1
                ),
                ':',
                -1
            )
        ) ;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 테이블 구조 `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'Y-m-d H:i:s'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'PEDEX'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'test@demo.com'),
(24, 'mail_password', '-'),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'test@demo.com'),
(27, 'mail_from_name', 'PEDEX'),
(30, 'timezone', 'Asia/Seoul'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '7b23e25c-1829-4745-8cce-4f647c331031'),
(35, 'nav_color', 'navbar-dark navbar-navy'),
(38, 'logo_bg_color', 'text-light  navbar-navy'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '원'),
(108, 'fixed_header', '1'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', '-'),
(114, 'paypal_secret', '-'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#F4841F'),
(117, 'main_dark_color', '#F4841F'),
(118, 'second_color', '#08143A'),
(119, 'second_dark_color', '#CCCCDD'),
(120, 'accent_color', '#8C9DA8'),
(121, 'accent_dark_color', '#9999AA'),
(122, 'scaffold_dark_color', '#2C2C2C'),
(123, 'scaffold_color', '#FAFAFA'),
(124, 'google_maps_key', '-1'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '1.0.0'),
(127, 'enable_version', '1'),
(128, 'default_currency_id', '5'),
(129, 'default_currency_code', 'KRW'),
(130, 'default_currency_decimal_digits', '0'),
(131, 'default_currency_rounding', '0'),
(132, 'currency_right', '1'),
(133, 'distance_unit', 'km'),
(134, 'default_theme', 'light'),
(135, 'enable_paystack', '1'),
(136, 'paystack_key', 'pk_test_d754715fa3fa9048c9ab2832c440fb183d7c91f5'),
(137, 'paystack_secret', 'sk_test_66f87edaac94f8adcb28fdf7452f12ccc63d068d'),
(138, 'enable_flutterwave', '1'),
(139, 'flutterwave_key', 'FLWPUBK_TEST-d465ba7e4f6b86325cb9881835726402-X'),
(140, 'flutterwave_secret', 'FLWSECK_TEST-d3f8801da31fc093fb1207ea34e68fbb-X'),
(141, 'enable_stripe_fpx', '1'),
(142, 'stripe_fpx_key', 'pk_test_51IQ0zvB0wbAJesyPLo3x4LRgOjM65IkoO5hZLHOMsnO2RaF0NlH7HNOfpCkjuLSohvdAp30U5P1wKeH98KnwXkOD00mMDavaFX'),
(143, 'stripe_fpx_secret', 'sk_test_51IQ0zvB0wbAJesyPUtR7yGdyOR7aGbMQAX5Es9P56EDUEsvEQAC0NBj7JPqFuJEYXrvSCm5OPRmGaUQBswjkRxVB00mz8xhkFX'),
(144, 'enable_paymongo', '1'),
(145, 'paymongo_key', 'pk_test_iD6aYYm4yFuvkuisyU2PGSYH'),
(146, 'paymongo_secret', 'sk_test_oxD79bMKxb8sA47ZNyYPXwf3'),
(147, 'provider_app_name', '폐기물 물류서비스'),
(148, 'enable_email_notifications', '0');

-- --------------------------------------------------------

--
-- 테이블 구조 `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2020-10-22 06:50:48', '2020-10-22 06:50:48'),
(5, '{\"en\":\"Korean WON\"}', '{\"en\":\"원\"}', '{\"en\":\"KRW\"}', 0, 0, '2020-10-22 06:54:00', '2022-02-09 02:10:24');

--
-- 테이블 구조 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Repellendus aut ea necessitatibus cum sint sit. Ut dolorem dicta distinctio quia laudantium.\"}', '{\"en\":\"Classics master, though. He was an old conger-eel, that used to queer things happening. While she was peering about anxiously among the branches, and every now and then, and holding it to his ear.\"}', 4, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(2, '{\"en\":\"Ipsa et et aut. Beatae ut fugit vero. Id at autem minus.\"}', '{\"en\":\"Rabbit just under the door; so either way I\'ll get into her face, and large eyes like a sky-rocket!\' \'So you did, old fellow!\' said the Duchess; \'and most things twinkled after that--only the March.\"}', 4, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(3, '{\"en\":\"Ut et minima tempore. Eaque magnam excepturi et debitis magni et.\"}', '{\"en\":\"I to get us dry would be like, \'--for they haven\'t got much evidence YET,\' she said to herself, \'I don\'t even know what they\'re about!\' \'Read them,\' said the King, the Queen, tossing her head to.\"}', 3, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(4, '{\"en\":\"Quibusdam animi quia recusandae dolor sed ab dolores. Optio sapiente voluptas ut sequi.\"}', '{\"en\":\"Alice. \'I\'ve tried the little crocodile Improve his shining tail, And pour the waters of the lefthand bit of mushroom, and her face like the look of it appeared. \'I don\'t know what they\'re like.\' \'I.\"}', 4, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(5, '{\"en\":\"Ullam et est et cumque voluptas. Quos aliquam ipsa rem cupiditate dicta dolores non.\"}', '{\"en\":\"Alice. \'What sort of way to explain the mistake it had been. But her sister on the trumpet, and then a voice sometimes choked with sobs, to sing you a song?\' \'Oh, a song, please, if the Queen had.\"}', 3, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(6, '{\"en\":\"Autem laborum qui placeat eaque quis ipsa. Nihil incidunt qui impedit suscipit placeat.\"}', '{\"en\":\"Alice could see her after the rest of it at last, and managed to put the Lizard as she could. The next thing was to find herself still in sight, and no more to come, so she began thinking over other.\"}', 2, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(7, '{\"en\":\"Voluptas et tempore aut iusto qui dolores aliquam. Aut et fuga unde asperiores laudantium soluta.\"}', '{\"en\":\"King, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the time they had to fall a long argument with the game,\' the Queen said to herself. \'I dare say you\'re wondering.\"}', 4, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(8, '{\"en\":\"Ipsa dignissimos dolorem ab architecto iusto aperiam aut. Suscipit eligendi et vero modi.\"}', '{\"en\":\"WHAT?\' thought Alice to herself, being rather proud of it: \'No room! No room!\' they cried out when they arrived, with a little more conversation with her head!\' Those whom she sentenced were taken.\"}', 1, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(9, '{\"en\":\"Quo optio expedita et commodi. Ipsa veritatis consectetur iure sunt quia voluptatem.\"}', '{\"en\":\"Alice, as she went on so long since she had made the whole window!\' \'Sure, it does, yer honour: but it\'s an arm for all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' So they got settled down.\"}', 1, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(10, '{\"en\":\"Voluptate ut officia eum adipisci officia. Qui est qui commodi ipsam repellat vitae.\"}', '{\"en\":\"Seaography: then Drawling--the Drawling-master was an immense length of neck, which seemed to rise like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather finish my tea,\' said the Cat. \'I.\"}', 3, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(11, '{\"en\":\"Provident at consequuntur et rerum delectus sunt. Odio consequuntur non impedit voluptas ut.\"}', '{\"en\":\"The three soldiers wandered about in the other: he came trotting along in a very little! Besides, SHE\'S she, and I\'m sure she\'s the best cat in the direction it pointed to, without trying to make.\"}', 1, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(12, '{\"en\":\"Suscipit maxime provident et sit aut aperiam impedit. Provident nihil expedita mollitia ad.\"}', '{\"en\":\"Dodo solemnly, rising to its feet, \'I move that the best thing to nurse--and she\'s such a curious dream, dear, certainly: but now run in to your little boy, And beat him when he sneezes: He only.\"}', 2, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(13, '{\"en\":\"Unde deleniti sed illo dolorum voluptatem. Ab natus quia architecto neque sequi sit odit.\"}', '{\"en\":\"I think--\' (she was rather doubtful whether she ought not to her, so she turned the corner, but the three were all talking at once, with a sigh. \'I only took the place of the thing at all. \'But.\"}', 4, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(14, '{\"en\":\"Corrupti ut beatae dolore sequi eos laborum. Sed dolore dolore neque.\"}', '{\"en\":\"I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; but she saw maps and pictures hung upon pegs. She took down a large rabbit-hole under the.\"}', 2, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(15, '{\"en\":\"Explicabo alias ullam impedit pariatur voluptatem sed. Animi quae et et qui eum et.\"}', '{\"en\":\"Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must be a lesson to you how it was addressed to the Knave. The Knave of Hearts, and I could.\"}', 1, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(16, '{\"en\":\"Qui provident consectetur vitae. Perspiciatis alias eum est esse.\"}', '{\"en\":\"Duchess said after a few minutes to see what was coming. It was so much contradicted in her life before, and he wasn\'t one?\' Alice asked. \'We called him Tortoise because he taught us,\' said the.\"}', 4, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(17, '{\"en\":\"Incidunt et neque libero id. Totam sit maxime debitis aut. Voluptatem et assumenda eos blanditiis.\"}', '{\"en\":\"At last the Dodo replied very solemnly. Alice was too small, but at any rate he might answer questions.--How am I to get into that beautiful garden--how IS that to be sure! However, everything is.\"}', 1, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(18, '{\"en\":\"Delectus qui ut numquam provident eos. Blanditiis ab quam nesciunt quasi beatae.\"}', '{\"en\":\"Cat seemed to Alice a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I should think you might like to be listening, so she felt very glad to get out again. Suddenly she came.\"}', 4, '2022-02-05 21:06:11', '2022-02-05 21:06:11'),
(19, '{\"en\":\"Qui asperiores asperiores sed nihil sunt sed aut. Facere corporis nobis omnis sit.\"}', '{\"en\":\"I don\'t want to go! Let me see: I\'ll give them a railway station.) However, she did not at all a proper way of escape, and wondering whether she ought to be no use going back to her: first, because.\"}', 2, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(20, '{\"en\":\"Nisi ad numquam voluptatem. Ad molestiae numquam ad corrupti illum voluptates.\"}', '{\"en\":\"I\'m not used to say.\' \'So he did, so he with his head!\' she said, \'than waste it in time,\' said the Hatter. \'Does YOUR watch tell you just now what the name of the thing yourself, some winter day, I.\"}', 2, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(21, '{\"en\":\"Ea temporibus non porro id officia rerum. Quibusdam a dolores dolorem unde velit fugit minus est.\"}', '{\"en\":\"King eagerly, and he went on growing, and she was holding, and she went on: \'But why did they draw the treacle from?\' \'You can draw water out of sight, he said to one of the sort. Next came an angry.\"}', 4, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(22, '{\"en\":\"Quam quae illum sed voluptates quo. Quo voluptatem natus omnis non.\"}', '{\"en\":\"White Rabbit blew three blasts on the twelfth?\' Alice went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen turned angrily away from her as hard as it was getting.\"}', 4, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(23, '{\"en\":\"Ut illum ipsum autem et recusandae aut nam facilis. Aut delectus dolores et autem voluptas ratione.\"}', '{\"en\":\"At this moment Five, who had meanwhile been examining the roses. \'Off with her face brightened up again.) \'Please your Majesty,\' said the King: \'leave out that it was just beginning to see what this.\"}', 3, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(24, '{\"en\":\"Excepturi sit ipsa voluptatem et. Ut ut et consequatur repellat.\"}', '{\"en\":\"Duchess was sitting on a bough of a tree a few minutes it puffed away without being invited,\' said the Cat, and vanished. Alice was silent. The Dormouse had closed its eyes again, to see the Queen.\"}', 3, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(25, '{\"en\":\"Natus soluta suscipit ut delectus. Voluptatem nemo beatae qui provident ratione.\"}', '{\"en\":\"The pepper when he finds out who I am! But I\'d better take him his fan and a Long Tale They were just beginning to grow up any more HERE.\' \'But then,\' thought she, \'what would become of you? I gave.\"}', 1, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(26, '{\"en\":\"Voluptatem et qui numquam ut architecto nostrum. Possimus ut totam autem a molestias est vero et.\"}', '{\"en\":\"March Hare. The Hatter opened his eyes. \'I wasn\'t asleep,\' he said in a pleased tone. \'Pray don\'t trouble yourself to say a word, but slowly followed her back to the Dormouse, who seemed too much of.\"}', 1, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(27, '{\"en\":\"Est pariatur tempore et quo. Quos est ea voluptatem. Ea est sapiente ipsum quia.\"}', '{\"en\":\"She did it so yet,\' said the Mock Turtle. \'Very much indeed,\' said Alice. \'Nothing WHATEVER?\' persisted the King. (The jury all wrote down all three to settle the question, and they walked off.\"}', 2, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(28, '{\"en\":\"Neque eius sit autem omnis. Ab ut non perspiciatis velit. Cum labore et unde dolorem et.\"}', '{\"en\":\"CHAPTER V. Advice from a bottle marked \'poison,\' so Alice went on in the air: it puzzled her very much of it now in sight, hurrying down it. There was a child,\' said the Cat, and vanished again.\"}', 4, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(29, '{\"en\":\"Sit consequuntur aspernatur enim temporibus. Non distinctio est amet at.\"}', '{\"en\":\"Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed for Mabel! I\'ll try and repeat \\\"\'TIS THE VOICE OF THE SLUGGARD,\\\"\' said the Cat. \'Do you mean \\\"purpose\\\"?\' said Alice. \'Of course it.\"}', 4, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(30, '{\"en\":\"Suscipit ut eligendi rem quis quis. Dolorem ea dolor sed necessitatibus deserunt.\"}', '{\"en\":\"Alice, who was a little more conversation with her head!\' about once in her lessons in the after-time, be herself a grown woman; and how she would have this cat removed!\' The Queen turned crimson.\"}', 4, '2022-02-05 21:06:12', '2022-02-05 21:06:12'),
(31, '{\"en\":\"<p>가나다라<\\/p>\"}', '{\"en\":\"<p>가나다라<br><\\/p>\"}', 1, '2022-02-09 08:26:02', '2022-02-09 08:26:02');

-- --------------------------------------------------------

--
-- 테이블 구조 `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Service\"}', '2022-02-05 21:05:52', '2022-02-05 21:05:52'),
(2, '{\"en\":\"Service\"}', '2022-02-05 21:05:52', '2022-02-05 21:05:52'),
(3, '{\"en\":\"Service\"}', '2022-02-05 21:05:52', '2022-02-05 21:05:52'),
(4, '{\"en\":\"Service\"}', '2022-02-05 21:05:52', '2022-02-05 21:05:52'),
(5, '{\"en\":\"Service\"}', '2022-02-05 21:05:52', '2022-02-05 21:05:52'),
(6, '{\"en\":\"test\"}', '2022-02-09 08:15:54', '2022-02-09 08:15:54');

-- --------------------------------------------------------

--
-- 테이블 구조 `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\PaymentMethod', 2, 'logo', 'razorpay', 'razorpay.png', 'image/png', 'public', 13026, '[]', '{\"uuid\":\"13e62475-6b5f-4812-b484-2b94cc52b715\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 3, '2021-05-07 09:03:38', '2021-05-07 09:03:38'),
(5, 'App\\Models\\PaymentMethod', 5, 'logo', 'paypal', 'paypal.png', 'image/png', 'public', 15819, '[]', '{\"uuid\":\"2b8bd9b8-5c37-4464-a5c7-623496d7655f\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 5, '2021-05-07 09:03:49', '2021-05-07 09:03:49'),
(7, 'App\\Models\\PaymentMethod', 6, 'logo', 'pay_pickup', 'pay_pickup.png', 'image/png', 'public', 11712, '[]', '{\"uuid\":\"5e06e7ca-ac33-413c-9ab0-6fd4e3083cc1\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 7, '2021-05-07 09:03:58', '2021-05-07 09:03:58'),
(9, 'App\\Models\\PaymentMethod', 7, 'logo', 'stripe-logo', 'stripe-logo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a36-8a5e-4c85-8d6e-c356843429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 9, '2021-05-07 09:04:23', '2021-05-07 09:04:23'),
(10, 'App\\Models\\PaymentMethod', 9, 'logo', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a96-8a5e-4a85-8d6e-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 10, '2021-05-07 09:04:23', '2021-05-07 09:04:23'),
(11, 'App\\Models\\PaymentMethod', 8, 'logo', 'paystack', 'paystack.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a96-8a5e-4c85-8d6e-c356648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 11, '2021-05-07 09:04:23', '2021-05-07 09:04:23'),
(12, 'App\\Models\\PaymentMethod', 10, 'logo', 'fpx', 'fpx.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 09:04:23', '2021-05-07 09:04:23'),
(13, 'App\\Models\\PaymentMethod', 11, 'logo', 'wallet', 'wallet.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 09:04:23', '2021-05-07 09:04:23'),
(14, 'App\\Models\\PaymentMethod', 12, 'logo', 'paymongo', 'paymongo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 09:04:23', '2021-05-07 09:04:23'),
(15, 'App\\Models\\Upload', 1, 'default', 'dh', 'dh.png', 'image/png', 'public', 20885, '[]', '{\"uuid\":\"a2d6a9a1-0f9f-41b6-8306-2b8b02dd53c9\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 13, '2022-02-08 13:06:27', '2022-02-08 13:06:27'),
(16, 'App\\Models\\Upload', 2, 'app_logo', 'dh', 'dh.png', 'image/png', 'public', 20885, '[]', '{\"uuid\":\"b9b511bb-12b0-4fda-b78d-70a6ffe262ee\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 14, '2022-02-08 13:07:47', '2022-02-08 13:07:48'),
(17, 'App\\Models\\Upload', 3, 'app_logo', 'dh_white', 'dh_white.png', 'image/png', 'public', 18707, '[]', '{\"uuid\":\"7b23e25c-1829-4745-8cce-4f647c331031\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 15, '2022-02-08 13:08:02', '2022-02-08 13:08:02'),
(18, 'App\\Models\\Upload', 4, 'default', 'dh', 'dh.png', 'image/png', 'public', 20885, '[]', '{\"uuid\":\"8f94cd5e-de4e-4313-aad4-68ae38d62265\",\"user_id\":9,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 16, '2022-02-09 09:22:04', '2022-02-09 09:22:05');

-- --------------------------------------------------------

--
-- 테이블 구조 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_02_08_000000_create_users_table', 1),
(2, '2022_02_08_100000_create_password_resets_table', 1),
(3, '2022_02_08_175145_create_permission_tables', 1),
(4, '2022_02_08_140344_create_media_table', 1),
(5, '2022_02_08_035117_create_uploads_table', 1),
(6, '2022_02_08_180731_create_settings_table', 1),
(7, '2022_02_08_000000_create_failed_jobs_table', 1),
(8, '2022_02_08_213829_create_faq_categories_table', 1),
(9, '2022_02_08_213926_create_faqs_table', 1),
(10, '2022_02_08_144652_create_currencies_table', 1),
(11, '2022_02_08_162055_create_notifications_table', 1),
(12, '2022_02_08_110636_create_json_extract_function', 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- 테이블 구조 `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2021-01-07 04:17:34', '2021-01-07 04:17:34'),
(2, 'medias.create', 'web', '2021-01-07 04:17:35', '2021-01-07 04:17:35'),
(3, 'users.profile', 'web', '2021-01-07 04:17:35', '2021-01-07 04:17:35'),
(4, 'users.index', 'web', '2021-01-07 04:17:35', '2021-01-07 04:17:35'),
(5, 'users.create', 'web', '2021-01-07 04:17:35', '2021-01-07 04:17:35'),
(6, 'users.store', 'web', '2021-01-07 04:17:35', '2021-01-07 04:17:35'),
(7, 'users.show', 'web', '2021-01-07 04:17:35', '2021-01-07 04:17:35'),
(8, 'users.edit', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(9, 'users.update', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(10, 'users.destroy', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(11, 'medias.delete', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(12, 'medias', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(13, 'permissions.index', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(14, 'permissions.create', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(15, 'permissions.store', 'web', '2021-01-07 04:17:36', '2021-01-07 04:17:36'),
(16, 'permissions.show', 'web', '2021-01-07 04:17:37', '2021-01-07 04:17:37'),
(17, 'permissions.edit', 'web', '2021-01-07 04:17:37', '2021-01-07 04:17:37'),
(18, 'permissions.update', 'web', '2021-01-07 04:17:37', '2021-01-07 04:17:37'),
(19, 'permissions.destroy', 'web', '2021-01-07 04:17:37', '2021-01-07 04:17:37'),
(20, 'roles.index', 'web', '2021-01-07 04:17:37', '2021-01-07 04:17:37'),
(21, 'roles.create', 'web', '2021-01-07 04:17:37', '2021-01-07 04:17:37'),
(22, 'roles.store', 'web', '2021-01-07 04:17:37', '2021-01-07 04:17:37'),
(23, 'roles.show', 'web', '2021-01-07 04:17:38', '2021-01-07 04:17:38'),
(24, 'roles.edit', 'web', '2021-01-07 04:17:38', '2021-01-07 04:17:38'),
(25, 'roles.update', 'web', '2021-01-07 04:17:38', '2021-01-07 04:17:38'),
(26, 'roles.destroy', 'web', '2021-01-07 04:17:38', '2021-01-07 04:17:38'),
(34, 'currencies.index', 'web', '2021-01-07 04:17:39', '2021-01-07 04:17:39'),
(35, 'currencies.create', 'web', '2021-01-07 04:17:39', '2021-01-07 04:17:39'),
(36, 'currencies.store', 'web', '2021-01-07 04:17:39', '2021-01-07 04:17:39'),
(37, 'currencies.edit', 'web', '2021-01-07 04:17:39', '2021-01-07 04:17:39'),
(38, 'currencies.update', 'web', '2021-01-07 04:17:40', '2021-01-07 04:17:40'),
(39, 'currencies.destroy', 'web', '2021-01-07 04:17:40', '2021-01-07 04:17:40'),
(40, 'users.login-as-user', 'web', '2021-01-07 04:17:40', '2021-01-07 04:17:40'),
(41, 'app-settings', 'web', '2021-01-07 04:17:40', '2021-01-07 04:17:40'),
(42, 'faqCategories.index', 'web', '2021-01-07 04:17:40', '2021-01-07 04:17:40'),
(43, 'faqCategories.create', 'web', '2021-01-07 04:17:40', '2021-01-07 04:17:40'),
(44, 'faqCategories.store', 'web', '2021-01-07 04:17:40', '2021-01-07 04:17:40'),
(45, 'faqCategories.edit', 'web', '2021-01-07 04:17:41', '2021-01-07 04:17:41'),
(46, 'faqCategories.update', 'web', '2021-01-07 04:17:41', '2021-01-07 04:17:41'),
(47, 'faqCategories.destroy', 'web', '2021-01-07 04:17:41', '2021-01-07 04:17:41'),
(48, 'faqs.index', 'web', '2021-01-07 04:17:41', '2021-01-07 04:17:41'),
(49, 'faqs.create', 'web', '2021-01-07 04:17:41', '2021-01-07 04:17:41'),
(50, 'faqs.store', 'web', '2021-01-07 04:17:41', '2021-01-07 04:17:41'),
(51, 'faqs.edit', 'web', '2021-01-07 04:17:41', '2021-01-07 04:17:41'),
(52, 'faqs.update', 'web', '2021-01-07 04:17:42', '2021-01-07 04:17:42'),
(53, 'faqs.destroy', 'web', '2021-01-07 04:17:42', '2021-01-07 04:17:42'),
(69, 'verification.notice', 'web', '2021-01-12 01:19:50', '2021-01-12 01:19:50'),
(70, 'verification.verify', 'web', '2021-01-12 01:19:50', '2021-01-12 01:19:50'),
(71, 'verification.resend', 'web', '2021-01-12 01:19:51', '2021-01-12 01:19:51'),
(81, 'notifications.index', 'web', '2021-01-25 06:42:33', '2021-01-25 06:42:33'),
(82, 'notifications.show', 'web', '2021-01-25 06:42:34', '2021-01-25 06:42:34'),
(83, 'notifications.destroy', 'web', '2021-01-25 06:42:34', '2021-01-25 06:42:34');

-- --------------------------------------------------------

--
-- 테이블 구조 `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`) VALUES
(2, 'PEDEX ADMIN', 'web', 0, NULL, '2022-02-09 09:14:41'),
(3, '수집/운반', 'web', 0, NULL, '2022-02-09 09:15:00'),
(4, '배출처', 'web', 1, NULL, '2022-02-09 09:15:10'),
(5, '처리자', 'web', 0, '2022-02-09 09:15:26', '2022-02-09 09:15:26');

-- --------------------------------------------------------

--
-- 테이블 구조 `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(9, 3),
(9, 4),
(10, 2),
(11, 2),
(11, 3),
(11, 4),
(12, 2),
(12, 3),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 3),
(42, 4),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 3),
(48, 4),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(69, 2),
(70, 2),
(71, 2),
(81, 2),
(81, 3),
(81, 4),
(82, 2),
(83, 2),
(83, 3),
(83, 4);

-- --------------------------------------------------------

--
-- 테이블 구조 `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `uploads`
--

INSERT INTO `uploads` (`id`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'a2d6a9a1-0f9f-41b6-8306-2b8b02dd53c9', '2022-02-08 13:06:27', '2022-02-08 13:06:27'),
(2, 'b9b511bb-12b0-4fda-b78d-70a6ffe262ee', '2022-02-08 13:07:46', '2022-02-08 13:07:46'),
(3, '7b23e25c-1829-4745-8cce-4f647c331031', '2022-02-08 13:08:02', '2022-02-08 13:08:02'),
(4, '8f94cd5e-de4e-4313-aad4-68ae38d62265', '2022-02-09 09:22:03', '2022-02-09 09:22:03');

-- --------------------------------------------------------

--
-- 테이블 구조 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 테이블의 덤프 데이터 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `phone_verified_at`, `email_verified_at`, `password`, `api_token`, `device_token`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `paypal_email`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'provider', 'provider@dh.com', '+821033550086', NULL, '2021-01-10 08:22:10', '$2y$10$3BD84t5DZ6O30IG0nesMX.grmLGW9akPFz8Eo9R36cJ9q/m7A8RKm', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', '', NULL, NULL, NULL, NULL, NULL, 'yCzPqDP1oczySU57q6G71SxTIJSiZUBE4vYdXbXCqzpzC2iN09igcs3jzSQK', NULL, '2022-02-09 08:50:40'),
(5, 'customer', 'customer@dh.com', '+821033550085', NULL, NULL, '$2y$10$3k2BS8JRAOkMmaB3G6Id6u7W7orxCQ2GRHOtOeIS7xYqvAG8YDMi.', 'gkEWScQHIol9EIRhP3m5m7JqnK5UvcGdEsKQJo7YeBcQawYFq3JAJ6SX9UKy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 01:55:52', '2022-02-09 08:50:11'),
(9, 'PEDEX ADMIN', 'admin@dh.com', '+821033550084', NULL, NULL, '$2y$10$cYGOznxj2/oHqourzEw1sO5dZx4PBktZbbfmdrfPLmgk00kxDxXHq', 'INX7FBcSZrFLIXJKQDwsqdxDj3QLWnHSS6jpAthuiM1FflEbxpncs5U6JzFa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-09 08:42:13', '2022-02-09 08:51:05');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_key_index` (`key`);

--
-- 테이블의 인덱스 `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- 테이블의 인덱스 `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- 테이블의 인덱스 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- 테이블의 인덱스 `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- 테이블의 인덱스 `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- 테이블의 인덱스 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 테이블의 인덱스 `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- 테이블의 인덱스 `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- 테이블의 AUTO_INCREMENT `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 테이블의 AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 테이블의 AUTO_INCREMENT `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 테이블의 AUTO_INCREMENT `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 테이블의 AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- 테이블의 AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- 테이블의 AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 테이블의 AUTO_INCREMENT `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- 테이블의 제약사항 `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
