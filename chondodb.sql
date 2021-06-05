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

 Date: 04/06/2021 21:50:13
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
  `total_price` bigint(20) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of booked_rooms
-- ----------------------------
INSERT INTO `booked_rooms` VALUES (1, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `booked_rooms` VALUES (2, NULL, NULL, NULL, NULL, 1, 2);
INSERT INTO `booked_rooms` VALUES (3, NULL, NULL, NULL, NULL, 3, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookeds_services
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of booking_status
-- ----------------------------
INSERT INTO `booking_status` VALUES (1, NULL, NULL, NULL, NULL, 1, 'booked', 'a', 'a');

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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_6fvpw8kg0dife13ihwncg0lnt`(`hotel_id`) USING BTREE,
  INDEX `FK_ggsh1imrw3ob9p4ufo12l4ehf`(`room_type_id`) USING BTREE,
  INDEX `FK_2j0lde3cr9caj2mdxf6t4abv2`(`status_id`) USING BTREE,
  INDEX `FK_figf0x7qk2dk68ew9qmbknka0`(`user_id`) USING BTREE,
  CONSTRAINT `FK_2j0lde3cr9caj2mdxf6t4abv2` FOREIGN KEY (`status_id`) REFERENCES `booking_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_6fvpw8kg0dife13ihwncg0lnt` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_figf0x7qk2dk68ew9qmbknka0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ggsh1imrw3ob9p4ufo12l4ehf` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO `bookings` VALUES (1, NULL, NULL, NULL, NULL, 2, 0, 'a', '2021-06-02', '2021-06-05', 2, 1, 1, 1, NULL);
INSERT INTO `bookings` VALUES (3, NULL, NULL, NULL, NULL, 2, 0, 'c', '2021-05-31', '2021-06-06', 1, 1, 1, 1, NULL);

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FRK_FEED_CUS`(`customer_id`) USING BTREE,
  CONSTRAINT `FRK_FEED_CUS` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------
INSERT INTO `feedbacks` VALUES (1, 'Phục vụ', 'Nhân viên tư vấn không có tâm', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotels
-- ----------------------------
INSERT INTO `hotels` VALUES (1, NULL, NULL, NULL, NULL, 'a', 'a', 'a', 'Vũng Tàu', 'a', '123', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_status
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_type
-- ----------------------------

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
  `total_price` bigint(20) NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payments
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of promotions
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_status
-- ----------------------------
INSERT INTO `room_status` VALUES (1, NULL, NULL, NULL, NULL, 1, 'available', 'a', NULL);
INSERT INTO `room_status` VALUES (2, NULL, NULL, NULL, NULL, 1, 'booked', '2', '2');

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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_7hsscda8tyqpx58kq0388kpej`(`promotion_id`) USING BTREE,
  CONSTRAINT `FK_7hsscda8tyqpx58kq0388kpej` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room_types
-- ----------------------------
INSERT INTO `room_types` VALUES (1, NULL, NULL, NULL, NULL, 2, 'a', 'abc', 'Phòng Standard Chondo', 250000, 'ac', 250000, NULL, 25);
INSERT INTO `room_types` VALUES (2, NULL, NULL, NULL, NULL, 4, 'b', 'a', 'Phòng Superior Chondo', 550000, 'a', 550000, NULL, 40);
INSERT INTO `room_types` VALUES (3, NULL, NULL, NULL, NULL, 4, 'b', 'a', 'Phòng Deluxe Chondo', 700000, 'a', 700000, NULL, 55);
INSERT INTO `room_types` VALUES (4, NULL, NULL, NULL, NULL, 6, 's', 's', 'Phòng Suite Chondo', 1100000, 's', 1100000, NULL, 75);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, NULL, NULL, NULL, NULL, 1, 102, 1, 1, 2);
INSERT INTO `rooms` VALUES (2, NULL, NULL, NULL, NULL, 1, 101, 1, 1, 1);
INSERT INTO `rooms` VALUES (3, NULL, NULL, NULL, NULL, 1, 103, 1, 1, 2);
INSERT INTO `rooms` VALUES (4, NULL, NULL, NULL, NULL, 1, 104, 1, 2, 1);
INSERT INTO `rooms` VALUES (5, NULL, NULL, NULL, NULL, 1, 105, 1, 2, 1);
INSERT INTO `rooms` VALUES (6, NULL, NULL, NULL, NULL, 1, 106, 1, 2, 1);
INSERT INTO `rooms` VALUES (7, NULL, NULL, NULL, NULL, 1, 107, 1, 3, 1);
INSERT INTO `rooms` VALUES (8, NULL, NULL, NULL, NULL, 1, 108, 1, 3, 1);
INSERT INTO `rooms` VALUES (9, NULL, NULL, NULL, NULL, 1, 109, 1, 4, 1);
INSERT INTO `rooms` VALUES (10, NULL, NULL, NULL, NULL, 1, 110, 1, 4, 1);

-- ----------------------------
-- Table structure for rooms_services
-- ----------------------------
DROP TABLE IF EXISTS `rooms_services`;
CREATE TABLE `rooms_services`  (
  `service_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  INDEX `FK_bnuhlwg8mtrek4l165a5qllgt`(`room_id`) USING BTREE,
  INDEX `FK_cdxl8vdsy85qpt3e3f2u3pabr`(`service_id`) USING BTREE,
  CONSTRAINT `FK_bnuhlwg8mtrek4l165a5qllgt` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_cdxl8vdsy85qpt3e3f2u3pabr` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rooms_services
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, NULL, NULL, NULL, NULL, 'wifi', 'Wifi', 0, '<i class=\"fas fa-wifi\"></i>');
INSERT INTO `services` VALUES (2, NULL, NULL, NULL, NULL, 'giat', 'Giặt ủi', 0, '<i class=\"fas fa-tshirt\"></i>');
INSERT INTO `services` VALUES (3, NULL, NULL, NULL, NULL, 'gym', 'Phòng gym', 50000, '<i class=\"fas fa-dumbbell\"></i>');
INSERT INTO `services` VALUES (4, NULL, NULL, NULL, NULL, 'pool', 'Hồ bơi', 50000, '<i class=\"fas fa-swimmer\"></i>');
INSERT INTO `services` VALUES (5, NULL, NULL, NULL, NULL, 'breakfast', 'Bữa sáng', 70000, '<i class=\"fas fa-utensils\"></i>');
INSERT INTO `services` VALUES (6, NULL, NULL, NULL, NULL, 'spa', 'Spa', 230000, '<i class=\"fas fa-spa\"></i>');
INSERT INTO `services` VALUES (7, NULL, NULL, NULL, NULL, 'karaoke', 'Karaoke', 320000, '<i class=\"fas fa-music\"></i>');
INSERT INTO `services` VALUES (8, NULL, NULL, NULL, NULL, 'golf', 'Sân golf', 680000, '<i class=\"fas fa-golf-club\"></i>');
INSERT INTO `services` VALUES (9, NULL, NULL, NULL, NULL, 'tennis', 'Sân tennis', 240000, '<i class=\"fas fa-racquet\"></i>');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_group
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
