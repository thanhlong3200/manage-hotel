/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : chondodb

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 28/06/2021 12:27:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_original_price` bigint(20) NULL DEFAULT NULL,
  `total_sell_price` bigint(20) NULL DEFAULT NULL,
  `booking_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_87bqhfgiufwg0y82uf4i2lbs9`(`booking_id`) USING BTREE,
  CONSTRAINT `FK_87bqhfgiufwg0y82uf4i2lbs9` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bills
-- ----------------------------

-- ----------------------------
-- Table structure for booked_room_customers
-- ----------------------------
DROP TABLE IF EXISTS `booked_room_customers`;
CREATE TABLE `booked_room_customers`  (
  `booked_room_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  INDEX `FK_k8ed8o6hmtb4kr0n9an83yo7w`(`booked_room_id`) USING BTREE,
  CONSTRAINT `FK_k8ed8o6hmtb4kr0n9an83yo7w` FOREIGN KEY (`booked_room_id`) REFERENCES `booked_rooms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of booked_room_customers
-- ----------------------------
INSERT INTO `booked_room_customers` VALUES (1, 49);

-- ----------------------------
-- Table structure for booked_rooms
-- ----------------------------
DROP TABLE IF EXISTS `booked_rooms`;
CREATE TABLE `booked_rooms`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `booking_id` bigint(20) NULL DEFAULT NULL,
  `room_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_k3bcr12d4rm550rousuq4rehm`(`booking_id`) USING BTREE,
  INDEX `FK_4v13ujyp4yxetul7emvyvinbt`(`room_id`) USING BTREE,
  CONSTRAINT `FK_4v13ujyp4yxetul7emvyvinbt` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_k3bcr12d4rm550rousuq4rehm` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of booked_rooms
-- ----------------------------
INSERT INTO `booked_rooms` VALUES (1, 'anonymousUser', '2021-06-27 19:26:27', 'anonymousUser', '2021-06-27 19:26:27', 63, 1);

-- ----------------------------
-- Table structure for bookeds_services
-- ----------------------------
DROP TABLE IF EXISTS `bookeds_services`;
CREATE TABLE `bookeds_services`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `free` int(11) NULL DEFAULT NULL,
  `used` int(11) NULL DEFAULT NULL,
  `booked_id` bigint(20) NULL DEFAULT NULL,
  `service_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_85ox78vh7ua57x5w0nqp9d3lq`(`booked_id`) USING BTREE,
  INDEX `FK_47n5rgrfbjw7jmgc693uh3r10`(`service_id`) USING BTREE,
  CONSTRAINT `FK_47n5rgrfbjw7jmgc693uh3r10` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_85ox78vh7ua57x5w0nqp9d3lq` FOREIGN KEY (`booked_id`) REFERENCES `booked_rooms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookeds_services
-- ----------------------------
INSERT INTO `bookeds_services` VALUES (60, 'anonymousUser', '2021-06-27 19:26:28', 'anonymousUser', '2021-06-27 19:26:28', 1, 0, 1, 1);
INSERT INTO `bookeds_services` VALUES (61, 'anonymousUser', '2021-06-27 19:26:28', 'anonymousUser', '2021-06-27 19:26:28', 1, 0, 1, 2);

-- ----------------------------
-- Table structure for booking_status
-- ----------------------------
DROP TABLE IF EXISTS `booking_status`;
CREATE TABLE `booking_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `active` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of booking_status
-- ----------------------------
INSERT INTO `booking_status` VALUES (1, NULL, NULL, NULL, NULL, 1, 'booked', 'a', 'Đã book');
INSERT INTO `booking_status` VALUES (2, NULL, NULL, NULL, NULL, 1, 'checkin', 'Đã check-in', 'Đã check-in');
INSERT INTO `booking_status` VALUES (3, NULL, NULL, NULL, NULL, 1, 'cancel', 'Đã hủy', 'Đã hủy');

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `adult` int(11) NULL DEFAULT NULL,
  `children` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_from` date NULL DEFAULT NULL,
  `date_to` date NULL DEFAULT NULL,
  `room_count` int(11) NULL DEFAULT NULL,
  `hotel_id` bigint(20) NULL DEFAULT NULL,
  `room_type_id` bigint(20) NULL DEFAULT NULL,
  `status_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_6fvpw8kg0dife13ihwncg0lnt`(`hotel_id`) USING BTREE,
  INDEX `FK_ggsh1imrw3ob9p4ufo12l4ehf`(`room_type_id`) USING BTREE,
  INDEX `FK_2j0lde3cr9caj2mdxf6t4abv2`(`status_id`) USING BTREE,
  INDEX `FK_figf0x7qk2dk68ew9qmbknka0`(`user_id`) USING BTREE,
  CONSTRAINT `FK_2j0lde3cr9caj2mdxf6t4abv2` FOREIGN KEY (`status_id`) REFERENCES `booking_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_6fvpw8kg0dife13ihwncg0lnt` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_figf0x7qk2dk68ew9qmbknka0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ggsh1imrw3ob9p4ufo12l4ehf` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO `bookings` VALUES (63, 'anonymousUser', '2021-06-27 19:26:27', 'anonymousUser', '2021-06-28 09:18:47', 1, 0, '270620210', '2021-06-27', '2021-06-28', 1, 1, 1, 2, NULL, 45);

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `cmnd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_in` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (44, 'anonymousUser', '2021-06-15 12:07:57', 'anonymousUser', '2021-06-15 12:07:57', NULL, 'tlsneakershop@gmail.com', 'Thành', NULL, 'Long', '0387127372', NULL);
INSERT INTO `customers` VALUES (45, 'anonymousUser', '2021-06-15 21:21:36', 'anonymousUser', '2021-06-15 21:21:36', NULL, 'hoapham123haha@gmail.com', 'Thành', NULL, 'Long', '0387127372', NULL);
INSERT INTO `customers` VALUES (46, 'anonymousUser', '2021-06-16 12:34:21', 'anonymousUser', '2021-06-27 10:22:07', '12354', NULL, 'Long', 'male', 'Nguyen', NULL, 1);
INSERT INTO `customers` VALUES (47, 'anonymousUser', '2021-06-27 10:22:07', 'anonymousUser', '2021-06-27 10:22:07', '', NULL, '', '', '', NULL, 1);
INSERT INTO `customers` VALUES (48, 'anonymousUser', '2021-06-27 10:41:59', 'anonymousUser', '2021-06-27 10:41:59', NULL, 'nguyenthisoi41ll@gmail.com', 'Thành', NULL, 'Long', '0387127372', NULL);
INSERT INTO `customers` VALUES (49, 'anonymousUser', '2021-06-27 10:43:06', 'anonymousUser', '2021-06-27 10:43:06', '123456', NULL, 'Thành', 'male', 'Long', NULL, 1);

-- ----------------------------
-- Table structure for furnitures
-- ----------------------------
DROP TABLE IF EXISTS `furnitures`;
CREATE TABLE `furnitures`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quality` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of furnitures
-- ----------------------------
INSERT INTO `furnitures` VALUES (1, NULL, NULL, NULL, NULL, 'tivi32', 'Tivi 32 inch', 1);
INSERT INTO `furnitures` VALUES (2, NULL, NULL, NULL, NULL, 'bed-twin', 'Giường đôi', 1);
INSERT INTO `furnitures` VALUES (3, NULL, NULL, NULL, NULL, 'bed', 'Giường đơn', 2);
INSERT INTO `furnitures` VALUES (4, NULL, NULL, NULL, NULL, 'badroom', 'Phòng tắm', 1);
INSERT INTO `furnitures` VALUES (5, NULL, NULL, NULL, NULL, 'bed-twin', 'Giường đôi', 2);

-- ----------------------------
-- Table structure for hotels
-- ----------------------------
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE `hotels`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotels
-- ----------------------------
INSERT INTO `hotels` VALUES (1, NULL, NULL, NULL, NULL, 'a', 'a', 'a', 'Vũng Tàu', 'a', '123', 1);

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `room_type_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_6ejq3kcek1pyn8aoa4ibfpvkf`(`room_type_id`) USING BTREE,
  CONSTRAINT `FK_6ejq3kcek1pyn8aoa4ibfpvkf` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, NULL, NULL, NULL, NULL, 'a', 'standard-double-main.jpg', 4);
INSERT INTO `images` VALUES (2, NULL, NULL, NULL, NULL, 'b', 'standard-double-1.jpg', 4);
INSERT INTO `images` VALUES (3, NULL, NULL, NULL, NULL, 'c', 'standard-double-2.jpg', 4);

-- ----------------------------
-- Table structure for payment_status
-- ----------------------------
DROP TABLE IF EXISTS `payment_status`;
CREATE TABLE `payment_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `active` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_status
-- ----------------------------
INSERT INTO `payment_status` VALUES (1, NULL, NULL, NULL, NULL, 1, 'paid\r\n', 'Đã thanh toán', 'Đã thanh toán');
INSERT INTO `payment_status` VALUES (2, NULL, NULL, NULL, NULL, 1, 'refund', 'Đã hoàn tiền', 'Đã hoàn tiền');
INSERT INTO `payment_status` VALUES (3, NULL, NULL, NULL, NULL, 1, 'unpaid', 'Chưa thanh toán', 'Chưa thanh toán');

-- ----------------------------
-- Table structure for payment_type
-- ----------------------------
DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `active` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_type
-- ----------------------------
INSERT INTO `payment_type` VALUES (1, NULL, NULL, NULL, NULL, 1, 'cash', 'Thanh toán tiền mặt');
INSERT INTO `payment_type` VALUES (2, NULL, NULL, NULL, NULL, 1, 'bank', 'Thanh toán qua thẻ ngân hàng');

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_original_price` bigint(20) NULL DEFAULT NULL,
  `total_sell_price` bigint(20) NULL DEFAULT NULL,
  `booking_id` bigint(20) NULL DEFAULT NULL,
  `status_id` bigint(20) NULL DEFAULT NULL,
  `payment_type_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_nuscjm6x127hkb15kcb8n56wo`(`booking_id`) USING BTREE,
  INDEX `FK_1lycy3mncxx9x8lhlxfcwsome`(`status_id`) USING BTREE,
  INDEX `FK_ald5s62tvlf1s3bjped37mohm`(`payment_type_id`) USING BTREE,
  CONSTRAINT `FK_1lycy3mncxx9x8lhlxfcwsome` FOREIGN KEY (`status_id`) REFERENCES `payment_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ald5s62tvlf1s3bjped37mohm` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_nuscjm6x127hkb15kcb8n56wo` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES (15, 'anonymousUser', '2021-06-27 19:26:28', 'anonymousUser', '2021-06-27 19:26:28', 'Tiền đặt phòng', 250000, 250000, 63, 3, 1);

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_begin` date NULL DEFAULT NULL,
  `date_end` date NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of promotions
-- ----------------------------
INSERT INTO `promotions` VALUES (1, NULL, NULL, NULL, NULL, 'a', '2021-06-07', '2021-06-09', 's', 's', 50);

-- ----------------------------
-- Table structure for rates
-- ----------------------------
DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vote` int(11) NULL DEFAULT NULL,
  `room_type_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_t94tfoeq3i7ojtm9ywytfx9nd`(`room_type_id`) USING BTREE,
  CONSTRAINT `FK_t94tfoeq3i7ojtm9ywytfx9nd` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rates
-- ----------------------------
INSERT INTO `rates` VALUES (1, NULL, NULL, NULL, NULL, 's', 10, 1);
INSERT INTO `rates` VALUES (2, NULL, NULL, NULL, NULL, 's', 8, 1);
INSERT INTO `rates` VALUES (3, NULL, NULL, NULL, NULL, 's', 9, 1);
INSERT INTO `rates` VALUES (4, NULL, NULL, NULL, NULL, 's', 5, 1);
INSERT INTO `rates` VALUES (5, NULL, NULL, NULL, NULL, 's', 10, 2);
INSERT INTO `rates` VALUES (6, NULL, NULL, NULL, NULL, 's', 7, 2);
INSERT INTO `rates` VALUES (7, NULL, NULL, NULL, NULL, 's', 9, 2);
INSERT INTO `rates` VALUES (8, NULL, NULL, NULL, NULL, 's', 8, 3);
INSERT INTO `rates` VALUES (9, NULL, NULL, NULL, NULL, 's', 9, 3);
INSERT INTO `rates` VALUES (10, NULL, NULL, NULL, NULL, 's', 10, 4);

-- ----------------------------
-- Table structure for refunds
-- ----------------------------
DROP TABLE IF EXISTS `refunds`;
CREATE TABLE `refunds`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `percent` int(11) NULL DEFAULT NULL,
  `pre_day_check_in` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of refunds
-- ----------------------------
INSERT INTO `refunds` VALUES (1, NULL, NULL, NULL, NULL, 100, 7);
INSERT INTO `refunds` VALUES (2, NULL, NULL, NULL, NULL, 50, 3);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, NULL, NULL, NULL, NULL, 'Customer');

-- ----------------------------
-- Table structure for room_status
-- ----------------------------
DROP TABLE IF EXISTS `room_status`;
CREATE TABLE `room_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `active` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `btnStyle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_status
-- ----------------------------
INSERT INTO `room_status` VALUES (1, NULL, NULL, NULL, NULL, 1, 'available', 'a', 'Trống', 'success');
INSERT INTO `room_status` VALUES (2, NULL, NULL, NULL, NULL, 1, 'booked', '2', 'Đã đặt', 'dark');
INSERT INTO `room_status` VALUES (3, NULL, NULL, NULL, NULL, 1, 'clean-up', 'sa', 'Đang dọn dẹp', 'primary');
INSERT INTO `room_status` VALUES (4, NULL, NULL, NULL, NULL, 1, 'owned', NULL, 'Khách đang ở', 'danger');

-- ----------------------------
-- Table structure for room_type_furniture
-- ----------------------------
DROP TABLE IF EXISTS `room_type_furniture`;
CREATE TABLE `room_type_furniture`  (
  `furniture_id` bigint(20) NOT NULL,
  `room_type_id` bigint(20) NOT NULL,
  INDEX `FK_9dtgo4bh601ss9h3yc66i6g2j`(`room_type_id`) USING BTREE,
  INDEX `FK_9icfd9ki5aadrurhafdt8n6kj`(`furniture_id`) USING BTREE,
  CONSTRAINT `FK_9dtgo4bh601ss9h3yc66i6g2j` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_9icfd9ki5aadrurhafdt8n6kj` FOREIGN KEY (`furniture_id`) REFERENCES `furnitures` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_type_furniture
-- ----------------------------
INSERT INTO `room_type_furniture` VALUES (1, 1);
INSERT INTO `room_type_furniture` VALUES (2, 1);
INSERT INTO `room_type_furniture` VALUES (2, 3);
INSERT INTO `room_type_furniture` VALUES (3, 3);
INSERT INTO `room_type_furniture` VALUES (1, 3);
INSERT INTO `room_type_furniture` VALUES (1, 2);
INSERT INTO `room_type_furniture` VALUES (2, 2);
INSERT INTO `room_type_furniture` VALUES (4, 3);
INSERT INTO `room_type_furniture` VALUES (1, 4);
INSERT INTO `room_type_furniture` VALUES (5, 4);
INSERT INTO `room_type_furniture` VALUES (3, 4);
INSERT INTO `room_type_furniture` VALUES (4, 4);
INSERT INTO `room_type_furniture` VALUES (3, 2);

-- ----------------------------
-- Table structure for room_type_refunds
-- ----------------------------
DROP TABLE IF EXISTS `room_type_refunds`;
CREATE TABLE `room_type_refunds`  (
  `refund_id` bigint(20) NOT NULL,
  `room_type_id` bigint(20) NOT NULL,
  INDEX `FK_g5admbekma4g95neuvaucm99j`(`room_type_id`) USING BTREE,
  INDEX `FK_s87f9v4gtytbp5acija085h0j`(`refund_id`) USING BTREE,
  CONSTRAINT `FK_g5admbekma4g95neuvaucm99j` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_s87f9v4gtytbp5acija085h0j` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_type_refunds
-- ----------------------------
INSERT INTO `room_type_refunds` VALUES (1, 2);
INSERT INTO `room_type_refunds` VALUES (2, 2);
INSERT INTO `room_type_refunds` VALUES (1, 4);
INSERT INTO `room_type_refunds` VALUES (2, 4);
INSERT INTO `room_type_refunds` VALUES (1, 3);
INSERT INTO `room_type_refunds` VALUES (2, 3);

-- ----------------------------
-- Table structure for room_type_services
-- ----------------------------
DROP TABLE IF EXISTS `room_type_services`;
CREATE TABLE `room_type_services`  (
  `service_id` bigint(20) NOT NULL,
  `room_type_id` bigint(20) NOT NULL,
  INDEX `FK_b6ncrvcujc1qj8vdrw0jbvvl7`(`room_type_id`) USING BTREE,
  INDEX `FK_cmx2wx0puknlcdas0l3xur4vd`(`service_id`) USING BTREE,
  CONSTRAINT `FK_b6ncrvcujc1qj8vdrw0jbvvl7` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_cmx2wx0puknlcdas0l3xur4vd` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_type_services
-- ----------------------------
INSERT INTO `room_type_services` VALUES (1, 1);
INSERT INTO `room_type_services` VALUES (2, 1);
INSERT INTO `room_type_services` VALUES (1, 2);
INSERT INTO `room_type_services` VALUES (2, 2);
INSERT INTO `room_type_services` VALUES (3, 2);
INSERT INTO `room_type_services` VALUES (4, 2);
INSERT INTO `room_type_services` VALUES (5, 2);
INSERT INTO `room_type_services` VALUES (1, 4);
INSERT INTO `room_type_services` VALUES (2, 4);
INSERT INTO `room_type_services` VALUES (3, 4);
INSERT INTO `room_type_services` VALUES (4, 4);
INSERT INTO `room_type_services` VALUES (5, 4);
INSERT INTO `room_type_services` VALUES (6, 4);
INSERT INTO `room_type_services` VALUES (7, 4);
INSERT INTO `room_type_services` VALUES (1, 3);
INSERT INTO `room_type_services` VALUES (2, 3);
INSERT INTO `room_type_services` VALUES (3, 3);
INSERT INTO `room_type_services` VALUES (4, 3);
INSERT INTO `room_type_services` VALUES (5, 3);
INSERT INTO `room_type_services` VALUES (6, 3);
INSERT INTO `room_type_services` VALUES (7, 3);
INSERT INTO `room_type_services` VALUES (8, 4);
INSERT INTO `room_type_services` VALUES (9, 4);

-- ----------------------------
-- Table structure for room_types
-- ----------------------------
DROP TABLE IF EXISTS `room_types`;
CREATE TABLE `room_types`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `original_price` bigint(20) NULL DEFAULT NULL,
  `review` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sell_price` bigint(20) NULL DEFAULT NULL,
  `promotion_id` bigint(20) NULL DEFAULT NULL,
  `acreage` int(11) NULL DEFAULT NULL,
  `prepayment` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_7hsscda8tyqpx58kq0388kpej`(`promotion_id`) USING BTREE,
  CONSTRAINT `FK_7hsscda8tyqpx58kq0388kpej` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_types
-- ----------------------------
INSERT INTO `room_types` VALUES (1, NULL, NULL, 'anonymousUser', '2021-06-13 22:35:53', 2, 'standard', 'abc', 'Phòng Standard Chondo', 250000, '<p>Standard Chondo Vũng T&agrave;u</p>\r\n\r\n<p>Nằm trong b&aacute;n k&iacute;nh chỉ 5 ph&uacute;t đi bộ từ B&atilde;i Sau ở th&agrave;nh phố Vũng T&agrave;u, Star Hotel cung cấp Wi-Fi miễn ph&iacute; v&agrave; chỗ đỗ xe ri&ecirc;ng miễn ph&iacute;.</p>\r\n\r\n<p>Mỗi ph&ograve;ng nghỉ tại kh&aacute;ch sạn n&agrave;y đều c&oacute; m&aacute;y điều h&ograve;a, k&ecirc;nh truyền h&igrave;nh c&aacute;p v&agrave; ph&ograve;ng tắm ri&ecirc;ng với v&ograve;i sen.</p>\r\n\r\n<p>Kh&aacute;ch sạn c&oacute; bếp chung.</p>\r\n\r\n<p>Ở khu vực xung quanh c&oacute; rất nhiều nh&agrave; h&agrave;ng v&agrave; qu&aacute;n ăn địa phương. Kh&aacute;ch sạn cũng cung c&acirc;́p dịch vụ cho thu&ecirc; xe m&aacute;y v&agrave; xe hơi. Star Hotel c&aacute;ch Tượng Ch&uacute;a Ki-t&ocirc; Vũng T&agrave;u 1,4 km v&agrave; Ngọn hải đăng Vũng T&agrave;u 1,4 km. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất, c&aacute;ch đ&oacute; 72 km.</p>\r\n\r\n<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>8,3</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i sử dụng ng&ocirc;n ngữ của bạn!</p>', 250000, NULL, 25, 0, NULL);
INSERT INTO `room_types` VALUES (2, NULL, NULL, 'anonymousUser', '2021-06-13 22:38:33', 4, 'superior', 'a', 'Phòng Superior Chondo', 550000, '<p>Standard Chondo Vũng T&agrave;u</p>\r\n\r\n<p>Nằm trong b&aacute;n k&iacute;nh chỉ 5 ph&uacute;t đi bộ từ B&atilde;i Sau ở th&agrave;nh phố Vũng T&agrave;u, Star Hotel cung cấp Wi-Fi miễn ph&iacute; v&agrave; chỗ đỗ xe ri&ecirc;ng miễn ph&iacute;.</p>\r\n\r\n<p>Mỗi ph&ograve;ng nghỉ tại kh&aacute;ch sạn n&agrave;y đều c&oacute; m&aacute;y điều h&ograve;a, k&ecirc;nh truyền h&igrave;nh c&aacute;p v&agrave; ph&ograve;ng tắm ri&ecirc;ng với v&ograve;i sen.</p>\r\n\r\n<p>Kh&aacute;ch sạn c&oacute; bếp chung.</p>\r\n\r\n<p>Ở khu vực xung quanh c&oacute; rất nhiều nh&agrave; h&agrave;ng v&agrave; qu&aacute;n ăn địa phương. Kh&aacute;ch sạn cũng cung c&acirc;́p dịch vụ cho thu&ecirc; xe m&aacute;y v&agrave; xe hơi. Star Hotel c&aacute;ch Tượng Ch&uacute;a Ki-t&ocirc; Vũng T&agrave;u 1,4 km v&agrave; Ngọn hải đăng Vũng T&agrave;u 1,4 km. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất, c&aacute;ch đ&oacute; 72 km.</p>\r\n\r\n<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>8,3</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i sử dụng ng&ocirc;n ngữ của bạn!</p>', 550000, NULL, 40, 0, NULL);
INSERT INTO `room_types` VALUES (3, NULL, NULL, NULL, NULL, 4, 'deluxe', 'a', 'Phòng Deluxe Chondo', 700000, '<p>Standard Chondo Vũng T&agrave;u</p>\r\n\r\n<p>Nằm trong b&aacute;n k&iacute;nh chỉ 5 ph&uacute;t đi bộ từ B&atilde;i Sau ở th&agrave;nh phố Vũng T&agrave;u, Star Hotel cung cấp Wi-Fi miễn ph&iacute; v&agrave; chỗ đỗ xe ri&ecirc;ng miễn ph&iacute;.</p>\r\n\r\n<p>Mỗi ph&ograve;ng nghỉ tại kh&aacute;ch sạn n&agrave;y đều c&oacute; m&aacute;y điều h&ograve;a, k&ecirc;nh truyền h&igrave;nh c&aacute;p v&agrave; ph&ograve;ng tắm ri&ecirc;ng với v&ograve;i sen.</p>\r\n\r\n<p>Kh&aacute;ch sạn c&oacute; bếp chung.</p>\r\n\r\n<p>Ở khu vực xung quanh c&oacute; rất nhiều nh&agrave; h&agrave;ng v&agrave; qu&aacute;n ăn địa phương. Kh&aacute;ch sạn cũng cung c&acirc;́p dịch vụ cho thu&ecirc; xe m&aacute;y v&agrave; xe hơi. Star Hotel c&aacute;ch Tượng Ch&uacute;a Ki-t&ocirc; Vũng T&agrave;u 1,4 km v&agrave; Ngọn hải đăng Vũng T&agrave;u 1,4 km. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất, c&aacute;ch đ&oacute; 72 km.</p>\r\n\r\n<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>8,3</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i sử dụng ng&ocirc;n ngữ của bạn!</p>', 700000, 1, 55, 1, 1);
INSERT INTO `room_types` VALUES (4, NULL, NULL, NULL, NULL, 6, 'suite', 'standard-double-main.jpg', 'Phòng Suite Chondo', 1100000, '<p>Standard Chondo Vũng T&agrave;u</p>\r\n\r\n<p>Nằm trong b&aacute;n k&iacute;nh chỉ 5 ph&uacute;t đi bộ từ B&atilde;i Sau ở th&agrave;nh phố Vũng T&agrave;u, Star Hotel cung cấp Wi-Fi miễn ph&iacute; v&agrave; chỗ đỗ xe ri&ecirc;ng miễn ph&iacute;.</p>\r\n\r\n<p>Mỗi ph&ograve;ng nghỉ tại kh&aacute;ch sạn n&agrave;y đều c&oacute; m&aacute;y điều h&ograve;a, k&ecirc;nh truyền h&igrave;nh c&aacute;p v&agrave; ph&ograve;ng tắm ri&ecirc;ng với v&ograve;i sen.</p>\r\n\r\n<p>Kh&aacute;ch sạn c&oacute; bếp chung.</p>\r\n\r\n<p>Ở khu vực xung quanh c&oacute; rất nhiều nh&agrave; h&agrave;ng v&agrave; qu&aacute;n ăn địa phương. Kh&aacute;ch sạn cũng cung c&acirc;́p dịch vụ cho thu&ecirc; xe m&aacute;y v&agrave; xe hơi. Star Hotel c&aacute;ch Tượng Ch&uacute;a Ki-t&ocirc; Vũng T&agrave;u 1,4 km v&agrave; Ngọn hải đăng Vũng T&agrave;u 1,4 km. S&acirc;n bay gần nhất l&agrave; s&acirc;n bay quốc tế T&acirc;n Sơn Nhất, c&aacute;ch đ&oacute; 72 km.</p>\r\n\r\n<p>C&aacute;c cặp đ&ocirc;i đặc biệt th&iacute;ch địa điểm n&agrave;y &mdash; họ cho điểm&nbsp;<strong>8,3</strong>&nbsp;cho kỳ nghỉ d&agrave;nh cho 2 người.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i sử dụng ng&ocirc;n ngữ của bạn!</p>', 1000000, 1, 75, 1, 1);

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `floor` int(11) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `hotel_id` bigint(20) NULL DEFAULT NULL,
  `room_type_id` bigint(20) NULL DEFAULT NULL,
  `status_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_467p2weununk9uevph0tc1m8n`(`hotel_id`) USING BTREE,
  INDEX `FK_iva2ga5xd5u9ylqrke0mykroy`(`room_type_id`) USING BTREE,
  INDEX `FK_ia9x6rrujdilmb4tk0msn7b8a`(`status_id`) USING BTREE,
  CONSTRAINT `FK_467p2weununk9uevph0tc1m8n` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ia9x6rrujdilmb4tk0msn7b8a` FOREIGN KEY (`status_id`) REFERENCES `room_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_iva2ga5xd5u9ylqrke0mykroy` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, NULL, NULL, 'anonymousUser', '2021-06-27 19:31:22', 1, 101, 1, 1, 4);
INSERT INTO `rooms` VALUES (2, NULL, NULL, 'anonymousUser', '2021-06-24 12:15:28', 1, 102, 1, 1, 1);
INSERT INTO `rooms` VALUES (3, NULL, NULL, 'anonymousUser', '2021-06-15 21:21:37', 1, 103, 1, 1, 1);
INSERT INTO `rooms` VALUES (4, NULL, NULL, 'anonymousUser', '2021-06-12 20:07:03', 1, 104, 1, 2, 1);
INSERT INTO `rooms` VALUES (5, NULL, NULL, 'anonymousUser', '2021-06-12 20:56:09', 1, 105, 1, 2, 1);
INSERT INTO `rooms` VALUES (6, NULL, NULL, NULL, NULL, 1, 106, 1, 2, 1);
INSERT INTO `rooms` VALUES (7, NULL, NULL, NULL, NULL, 1, 107, 1, 3, 1);
INSERT INTO `rooms` VALUES (8, NULL, NULL, NULL, NULL, 1, 108, 1, 3, 1);
INSERT INTO `rooms` VALUES (9, NULL, NULL, NULL, NULL, 1, 109, 1, 4, 1);
INSERT INTO `rooms` VALUES (10, NULL, NULL, NULL, NULL, 1, 110, 1, 4, 1);
INSERT INTO `rooms` VALUES (11, NULL, NULL, 'anonymousUser', '2021-06-24 12:19:56', 2, 201, 1, 1, 1);
INSERT INTO `rooms` VALUES (12, NULL, NULL, 'anonymousUser', '2021-06-24 12:09:02', 2, 202, 1, 1, 1);
INSERT INTO `rooms` VALUES (13, NULL, NULL, NULL, NULL, 2, 203, 1, 1, 1);
INSERT INTO `rooms` VALUES (14, NULL, NULL, NULL, NULL, 2, 204, 1, 2, 1);
INSERT INTO `rooms` VALUES (15, NULL, NULL, NULL, NULL, 2, 205, 1, 2, 1);
INSERT INTO `rooms` VALUES (16, NULL, NULL, NULL, NULL, 2, 206, 1, 2, 1);
INSERT INTO `rooms` VALUES (17, NULL, NULL, NULL, NULL, 2, 207, 1, 3, 1);
INSERT INTO `rooms` VALUES (18, NULL, NULL, NULL, '2021-06-14 20:48:25', 2, 208, 1, 3, 1);
INSERT INTO `rooms` VALUES (19, NULL, NULL, NULL, NULL, 2, 209, 1, 4, 1);
INSERT INTO `rooms` VALUES (20, NULL, NULL, NULL, NULL, 2, 210, 1, 4, 1);
INSERT INTO `rooms` VALUES (21, NULL, NULL, NULL, NULL, 3, 301, 1, 1, 1);
INSERT INTO `rooms` VALUES (22, NULL, NULL, NULL, NULL, 3, 302, 1, 1, 1);
INSERT INTO `rooms` VALUES (23, NULL, NULL, NULL, NULL, 3, 303, 1, 1, 1);
INSERT INTO `rooms` VALUES (24, NULL, NULL, NULL, NULL, 3, 304, 1, 2, 1);
INSERT INTO `rooms` VALUES (25, NULL, NULL, NULL, NULL, 3, 305, 1, 2, 1);
INSERT INTO `rooms` VALUES (26, NULL, NULL, NULL, NULL, 3, 306, 1, 2, 1);
INSERT INTO `rooms` VALUES (27, NULL, NULL, NULL, NULL, 3, 307, 1, 3, 1);
INSERT INTO `rooms` VALUES (28, NULL, NULL, NULL, NULL, 3, 308, 1, 3, 1);
INSERT INTO `rooms` VALUES (29, NULL, NULL, NULL, NULL, 3, 309, 1, 4, 1);
INSERT INTO `rooms` VALUES (30, NULL, NULL, NULL, NULL, 3, 310, 1, 4, 1);
INSERT INTO `rooms` VALUES (31, NULL, NULL, 'anonymousUser', '2021-06-15 12:07:58', 4, 401, 1, 1, 1);
INSERT INTO `rooms` VALUES (32, NULL, NULL, 'anonymousUser', '2021-06-15 12:07:58', 4, 402, 1, 1, 1);
INSERT INTO `rooms` VALUES (33, NULL, NULL, NULL, NULL, 4, 403, 1, 1, 1);
INSERT INTO `rooms` VALUES (34, NULL, NULL, NULL, NULL, 4, 404, 1, 2, 1);
INSERT INTO `rooms` VALUES (35, NULL, NULL, NULL, NULL, 4, 405, 1, 2, 1);
INSERT INTO `rooms` VALUES (36, NULL, NULL, NULL, NULL, 4, 406, 1, 2, 1);
INSERT INTO `rooms` VALUES (37, NULL, NULL, NULL, NULL, 4, 407, 1, 3, 1);
INSERT INTO `rooms` VALUES (38, NULL, NULL, NULL, NULL, 4, 408, 1, 3, 1);
INSERT INTO `rooms` VALUES (39, NULL, NULL, NULL, NULL, 4, 409, 1, 4, 1);
INSERT INTO `rooms` VALUES (40, NULL, NULL, NULL, NULL, 4, 410, 1, 4, 1);
INSERT INTO `rooms` VALUES (41, NULL, NULL, NULL, NULL, 5, 501, 1, 1, 1);
INSERT INTO `rooms` VALUES (42, NULL, NULL, NULL, NULL, 5, 502, 1, 1, 1);
INSERT INTO `rooms` VALUES (43, NULL, NULL, NULL, NULL, 5, 503, 1, 1, 1);
INSERT INTO `rooms` VALUES (44, NULL, NULL, NULL, NULL, 5, 504, 1, 2, 1);
INSERT INTO `rooms` VALUES (45, NULL, NULL, NULL, NULL, 5, 505, 1, 2, 1);
INSERT INTO `rooms` VALUES (46, NULL, NULL, NULL, NULL, 5, 506, 1, 2, 1);
INSERT INTO `rooms` VALUES (47, NULL, NULL, NULL, NULL, 5, 507, 1, 3, 1);
INSERT INTO `rooms` VALUES (48, NULL, NULL, NULL, NULL, 5, 508, 1, 3, 1);
INSERT INTO `rooms` VALUES (49, NULL, NULL, NULL, NULL, 5, 509, 1, 4, 1);
INSERT INTO `rooms` VALUES (50, NULL, NULL, NULL, NULL, 5, 510, 1, 4, 1);
INSERT INTO `rooms` VALUES (51, NULL, NULL, NULL, NULL, 6, 601, 1, 1, 1);
INSERT INTO `rooms` VALUES (52, NULL, NULL, NULL, NULL, 6, 602, 1, 1, 1);
INSERT INTO `rooms` VALUES (53, NULL, NULL, NULL, NULL, 6, 603, 1, 1, 1);
INSERT INTO `rooms` VALUES (54, NULL, NULL, NULL, NULL, 6, 604, 1, 2, 1);
INSERT INTO `rooms` VALUES (55, NULL, NULL, NULL, NULL, 6, 605, 1, 2, 1);
INSERT INTO `rooms` VALUES (56, NULL, NULL, NULL, NULL, 6, 606, 1, 2, 1);
INSERT INTO `rooms` VALUES (57, NULL, NULL, NULL, NULL, 6, 607, 1, 3, 1);
INSERT INTO `rooms` VALUES (58, NULL, NULL, NULL, NULL, 6, 608, 1, 3, 1);
INSERT INTO `rooms` VALUES (59, NULL, NULL, NULL, NULL, 6, 609, 1, 4, 1);
INSERT INTO `rooms` VALUES (60, NULL, NULL, NULL, NULL, 6, 610, 1, 4, 1);

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` bigint(20) NULL DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, NULL, NULL, NULL, NULL, 'wifi', 'Wifi', 0, '<i class=\"fas fa-wifi\"></i>', NULL);
INSERT INTO `services` VALUES (2, NULL, NULL, NULL, NULL, 'giat', 'Giặt ủi', 0, '<i class=\"fas fa-tshirt\"></i>', NULL);
INSERT INTO `services` VALUES (3, NULL, NULL, NULL, NULL, 'gym', 'Phòng gym', 50000, '<i class=\"fas fa-dumbbell\"></i>', 'gym.jpg');
INSERT INTO `services` VALUES (4, NULL, NULL, NULL, NULL, 'pool', 'Hồ bơi', 50000, '<i class=\"fas fa-swimmer\"></i>', 'pool.jpg');
INSERT INTO `services` VALUES (5, NULL, NULL, NULL, NULL, 'breakfast', 'Bữa sáng', 70000, '<i class=\"fas fa-utensils\"></i>', 'breakfast.jpg');
INSERT INTO `services` VALUES (6, NULL, NULL, NULL, NULL, 'spa', 'Spa', 230000, '<i class=\"fas fa-spa\"></i>', 'spa.jpg');
INSERT INTO `services` VALUES (7, NULL, NULL, NULL, NULL, 'karaoke', 'Karaoke', 320000, '<i class=\"fas fa-music\"></i>', 'karaoke.jpg');
INSERT INTO `services` VALUES (8, NULL, NULL, NULL, NULL, 'golf', 'Sân golf', 680000, '<i class=\"fas fa-golf-club\"></i>', 'golf.jpg');
INSERT INTO `services` VALUES (9, NULL, NULL, NULL, NULL, 'tennis', 'Sân tennis', 240000, '<i class=\"fas fa-racquet\"></i>', 'tennis.jpg');

-- ----------------------------
-- Table structure for staff_status
-- ----------------------------
DROP TABLE IF EXISTS `staff_status`;
CREATE TABLE `staff_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `active` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `btnStyle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staff_status
-- ----------------------------
INSERT INTO `staff_status` VALUES (1, NULL, NULL, NULL, NULL, 1, 'available', 'Đang rảnh', 'Đang rảnh', 'success');
INSERT INTO `staff_status` VALUES (2, NULL, NULL, NULL, NULL, 1, 'guide-guest', 'Đang đón khách ', 'Đang đón khách ', 'warning');
INSERT INTO `staff_status` VALUES (3, NULL, NULL, NULL, NULL, 1, 'clean-room', 'Đang dọn phòng', 'Đang dọn phòng', 'warning');
INSERT INTO `staff_status` VALUES (4, NULL, NULL, NULL, NULL, 1, 'busy', 'Đang bận', 'Đang bận', 'danger');

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `active` int(11) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_e78q07fe8qcama4qrir99sx95`(`status_id`) USING BTREE,
  CONSTRAINT `FK_e78q07fe8qcama4qrir99sx95` FOREIGN KEY (`status_id`) REFERENCES `staff_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staffs
-- ----------------------------
INSERT INTO `staffs` VALUES (1, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 1', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (2, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 2', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (3, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 3', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (4, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 4', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (5, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 5', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (6, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 6', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (7, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 7', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (8, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 8', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (9, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 9', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (10, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 10', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (11, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 11', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (12, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 12', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (13, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 13', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (14, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 14', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (15, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 15', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (16, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 16', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (17, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 17', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (18, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 18', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (19, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 19', 'male', '016989516', 1);
INSERT INTO `staffs` VALUES (20, '', NULL, NULL, NULL, 1, '2000-06-07', 'Nhân viên 20', 'male', '016989516', 1);

-- ----------------------------
-- Table structure for staffs_tasks
-- ----------------------------
DROP TABLE IF EXISTS `staffs_tasks`;
CREATE TABLE `staffs_tasks`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `room_id` bigint(20) NULL DEFAULT NULL,
  `staff_id` bigint(20) NULL DEFAULT NULL,
  `task_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_b6odi1cnpswvhg71eyte1epyk`(`room_id`) USING BTREE,
  INDEX `FK_1n6vm56u4jeny8grmcs082f31`(`staff_id`) USING BTREE,
  INDEX `FK_mpc38w5yniph8yxiio0uri7o0`(`task_id`) USING BTREE,
  CONSTRAINT `FK_1n6vm56u4jeny8grmcs082f31` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_b6odi1cnpswvhg71eyte1epyk` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_mpc38w5yniph8yxiio0uri7o0` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffs_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, NULL, NULL, NULL, NULL, 'guide-guest', 'Đón khách');
INSERT INTO `tasks` VALUES (2, NULL, NULL, NULL, NULL, 'clean-room', 'Dọn phòng');

-- ----------------------------
-- Table structure for user_group_role
-- ----------------------------
DROP TABLE IF EXISTS `user_group_role`;
CREATE TABLE `user_group_role`  (
  `user_group_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  INDEX `FK_tnop1adlw50efa315eyyhg1mw`(`role_id`) USING BTREE,
  INDEX `FK_jbdedxsdqq6b7mdxnnk3ae8m5`(`user_group_id`) USING BTREE,
  CONSTRAINT `FK_jbdedxsdqq6b7mdxnnk3ae8m5` FOREIGN KEY (`user_group_id`) REFERENCES `users_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_tnop1adlw50efa315eyyhg1mw` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group_role
-- ----------------------------

-- ----------------------------
-- Table structure for user_type_services
-- ----------------------------
DROP TABLE IF EXISTS `user_type_services`;
CREATE TABLE `user_type_services`  (
  `service_id` bigint(20) NOT NULL,
  `user_type_id` bigint(20) NOT NULL,
  INDEX `FK_iyco8v2jt2n16r20iip2q3adh`(`user_type_id`) USING BTREE,
  INDEX `FK_43pix0iq1gq3xf2f4f0renaae`(`service_id`) USING BTREE,
  CONSTRAINT `FK_43pix0iq1gq3xf2f4f0renaae` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_iyco8v2jt2n16r20iip2q3adh` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_type_services
-- ----------------------------

-- ----------------------------
-- Table structure for user_types
-- ----------------------------
DROP TABLE IF EXISTS `user_types`;
CREATE TABLE `user_types`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_types
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` bigint(20) NULL DEFAULT NULL,
  `user_type_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_fm4cfgdt24toh89yw4rbnu1lb`(`group_id`) USING BTREE,
  INDEX `FK_ayjpho46eaqkqiqai0k4d59ww`(`user_type_id`) USING BTREE,
  CONSTRAINT `FK_ayjpho46eaqkqiqai0k4d59ww` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_fm4cfgdt24toh89yw4rbnu1lb` FOREIGN KEY (`group_id`) REFERENCES `users_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for users_group
-- ----------------------------
DROP TABLE IF EXISTS `users_group`;
CREATE TABLE `users_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createddate` datetime(0) NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifieddate` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_group
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
