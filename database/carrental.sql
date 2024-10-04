/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100434 (10.4.34-MariaDB-1:10.4.34+maria~ubu2004)
 Source Host           : 127.0.0.1:3306
 Source Schema         : carrental

 Target Server Type    : MySQL
 Target Server Version : 100434 (10.4.34-MariaDB-1:10.4.34+maria~ubu2004)
 File Encoding         : 65001

 Date: 04/10/2024 22:06:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT '',
  `auth_key` varchar(32) DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone_number` varchar(60) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `token_device` text DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (3, 'Bob Johnson', 'bobjohnson@example.com', 'resetToken125', NULL, '2024-10-04 09:47:59', NULL, 'password125', 'rememberMeToken3', 'deviceToken3', '2024-10-01 10:41:31.000000', '2024-10-04 09:47:59.395697');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (4, 'Alice Brown', 'alicebrown@example.com', 'resetToken126', NULL, '2024-10-04 09:47:59', NULL, 'password126', 'rememberMeToken4', 'deviceToken4', '2024-10-01 10:41:31.000000', '2024-10-04 09:47:59.400294');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (5, 'Charlie Davis', 'charliedavis@example.com', 'resetToken127', NULL, '2024-10-04 09:47:59', NULL, 'password127', 'rememberMeToken5', 'deviceToken5', '2024-10-01 10:41:31.000000', '2024-10-04 09:47:59.403222');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (6, 'David Wilson', 'davidwilson@example.com', 'resetToken128', NULL, '2024-10-04 09:47:59', NULL, 'password128', 'rememberMeToken6', 'deviceToken6', '2024-10-01 10:41:31.000000', '2024-10-04 09:47:59.406237');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (7, 'Emma Miller', 'emmamiller@example.com', 'resetToken129', NULL, '2024-10-04 09:47:59', NULL, 'password129', 'rememberMeToken7', 'deviceToken7', '2024-10-01 10:41:31.000000', '2024-10-04 09:47:59.409211');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (8, 'Sophia Moore', 'sophiamoore@example.com', 'resetToken130', NULL, '2024-10-04 09:47:59', NULL, 'password130', 'rememberMeToken8', 'deviceToken8', '2024-10-01 10:41:31.000000', '2024-10-04 09:47:59.412141');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (9, 'Liam Taylor', 'liamtaylor@example.com', 'resetToken131', NULL, '2024-10-04 09:47:59', NULL, 'password131', 'rememberMeToken9', 'deviceToken9', '2024-10-01 10:41:31.000000', '2024-10-04 09:47:59.415176');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (10, 'Olivia Anderson', 'oliviaanderson@example.com', 'resetToken132', 'authKey12354', '2023-09-10 19:00:00', NULL, 'password132', 'rememberMeToken10', 'deviceToken10', '2024-10-01 10:41:31.000000', '2024-10-01 10:41:31.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (11, 'John Dose', 'jo2hn@example.com', '', '3a0c6fa203ad84ffd5f6a9de959e8fa7', '2024-10-01 11:38:06', NULL, '$2y$12$7n9iM7B7pyaDu9Ct6zOZ1edOxx5pUAYQBjGQQLjonhvmvhqtc3tKe', '03489a2810600ac543ccb0f58998d19e993e776c13ac3e22e059fc2593b95f34', NULL, '2024-10-01 11:38:06.000000', '2024-10-01 11:38:06.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (12, 'Lam', 'lamsg@gmail.com', '6546', '13213', '2024-10-02 00:22:13', NULL, '$2y$12$gDh5cPAcn.Rqti963YFFregrHwvoRQb0yPeCtvZiF/VnzlMPOvwJC', NULL, NULL, '2024-10-02 00:22:13.000000', '2024-10-02 00:22:13.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (13, 'Dương', 'duongtran@gmail.com', '2132', '21321', '2024-10-03 11:45:00', NULL, '$2y$12$L980j8LOxLQx7PENLmVFTuPSwJvQs8pyigcYHNI8d8GhrwrrGOwdK', NULL, NULL, '2024-10-03 11:45:00.000000', '2024-10-03 11:45:00.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (14, 'sadas', 'gjhgjhg@gmail.com', '13211321', '213211', '2024-10-03 12:48:27', NULL, '$2y$12$SAjLUR5/nbZTzRnl/do5buDZ0pCaVE3iZOGAtz1.U06DJLqSyLH/G', NULL, NULL, '2024-10-03 12:48:27.000000', '2024-10-03 12:48:27.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (15, 'Sang', 'sangnguyen@gmail.com', '', 'v4nxGrMUBNgl98NbinwrqLYfDQVzDgY9', '2024-10-04 03:56:46', NULL, '$2y$12$ZBJy.HXzMkpNKlPtZgH/W.CyQb.7p7PJ79v/bkFodS4go1XRgHafu', NULL, NULL, '2024-10-04 03:56:46.000000', '2024-10-04 03:56:46.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (16, 'Dương', 'duongnguyen@gmail.com', NULL, 'ea7fe7bc57cf65ea6f732c97f69d758f', '2024-10-04 15:03:32', NULL, '$2y$12$ZlBu6n.K58EuEmsJOuj67e0NTyjVN2J.uv63wlWgFXhzSku.uKZIC', NULL, '21321', '2024-10-04 03:57:57.000000', '2024-10-04 15:03:32.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (17, 'sang', 'sangnguye1n@gmail.com', '', 'AVkBbTKS6zX5JyM6bQu2Q8bZgX8ZZVac', '2024-10-04 07:42:40', NULL, '$2y$12$YnEbz4AsdS8WUnibIvlL6umq/1Zs/cUVC1owuKOuUSwJmbVqjFYYS', NULL, NULL, '2024-10-04 07:42:40.000000', '2024-10-04 07:42:40.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (18, 'hgfhgf', 'user123@gmail.com', '', 'qjqjaPVbBewNJUdVQ2rkZsiP7W2wQeIB', '2024-10-04 07:45:58', NULL, '$2y$12$IQ9jErJCzzeY9fUgFFHRe.AImFh1wfvc4SC4jzqCm1EOwyIiPdnWS', NULL, NULL, '2024-10-04 07:45:58.000000', '2024-10-04 07:45:58.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (19, 'hgfhgfq', 'user2123@gmail.com', '', 'v5E5kQZHu0vUlZMqQg7QwO8fmojA8EPM', '2024-10-04 07:46:18', NULL, '$2y$12$WpCZ2cldkYbkqIYi9l/ie.AQskkQ0O7tjc/D4uYPBqqpxhmkb0VfG', NULL, NULL, '2024-10-04 07:46:18.000000', '2024-10-04 07:46:18.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (20, 'sang', 'jhgkjhg@gmail.com', '', 'KoXmUTHUXceexZL3dz998I81kHctiHGj', '2024-10-04 08:57:52', NULL, '$2y$12$6lyR8Vyl2b.R256ClO3v2O6heNcHaKeQQOoKG6R2ViNjM5X0ZP2dy', NULL, NULL, '2024-10-04 08:57:52.000000', '2024-10-04 08:57:52.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (21, 'hgnbv', 'nbvnbv@ghg.com', '', 'Sou23U6dXaQNLCG4476rhkIPMpERPAZb', '2024-10-04 09:17:02', NULL, '$2y$12$aFSx0Dp1gE7.s/JhwqfteO1nRxMqBrsg2lVJslbhDdrn9wH1CxhkO', NULL, NULL, '2024-10-04 09:17:02.000000', '2024-10-04 09:17:02.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (22, 'sang', 'nguyenthanh@gmail.com', '', 'menE9D97YwWXFuxYDEFjXcr356wWCPSG', '2024-10-04 10:15:47', NULL, '$2y$12$rwQ1GGM79luu7wNKckopc.DIuV1HQa9XGC2TJEnJf0qKfWf9H056C', NULL, NULL, '2024-10-04 10:15:47.000000', '2024-10-04 10:15:47.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (24, 'Sang', 'sangnguyen.sky78@gmail.com', NULL, '59720ee464b116484401e0cf83bfc2ea', '2024-10-04 15:01:48', NULL, '$2y$12$z0o2keM5eTIFm2QSbsrVrulmYih1OUwpMjG.tZ65hnhIqpMC8Ix46', NULL, '123456', '2024-10-04 11:09:15.000000', '2024-10-04 15:01:48.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (25, 'minh', 'minhnguyen@gmail.com', '', '68d48ef4c65dfdd17200c0dd82b8e1a5', '2024-10-04 13:32:25', NULL, '$2y$12$03MyFBja513k8pZCPizmZuamqY6PhDzHG4tiMB2fAtrBKgE/qxnwi', NULL, NULL, '2024-10-04 13:32:25.000000', '2024-10-04 13:32:25.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (26, 'minh', 'minhnguy1en@gmail.com', '', 'ce3e5277a44858d807bcc89c48f8c176', '2024-10-04 14:17:15', NULL, '$2y$12$zuYnsQznubtOn0NjSPA8Nu0IGeBS9i0hxz4jvFtnlDPcXvR4QEh2a', NULL, NULL, '2024-10-04 14:17:15.000000', '2024-10-04 14:17:15.000000');
INSERT INTO `users` (`id`, `name`, `email`, `password_reset_token`, `auth_key`, `email_verified_at`, `phone_number`, `password`, `remember_token`, `token_device`, `created_at`, `updated_at`) VALUES (27, 'minh', 'minhng2uy1en@gmail.com', '', 'bce95dbb0ecb1abc9ca02d53175e0384', '2024-10-04 14:54:56', NULL, '$2y$12$kPxfBI6R0HyLAmcT21u1pOhgZM0I6MZ0i6LzUylRW8lqbN5Jgkzhq', NULL, NULL, '2024-10-04 14:54:56.000000', '2024-10-04 14:54:56.000000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
