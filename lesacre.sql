/*
 Navicat MySQL Data Transfer

 Source Server         : Local-Connection
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : lesacre

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 12/12/2018 21:36:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assets_bearing
-- ----------------------------
DROP TABLE IF EXISTS `assets_bearing`;
CREATE TABLE `assets_bearing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inner_race_diameter` double DEFAULT NULL,
  `inner_race_width` double DEFAULT NULL,
  `outter_race_diameter` double DEFAULT NULL,
  `outter_race_width` double DEFAULT NULL,
  `roller_diameter` double DEFAULT NULL,
  `roller_number` smallint(6) DEFAULT NULL,
  `contact_angle` double DEFAULT NULL,
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `component_id`(`component_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_component
-- ----------------------------
DROP TABLE IF EXISTS `assets_component`;
CREATE TABLE `assets_component`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statu` smallint(6) NOT NULL,
  `lr_time` datetime(6) DEFAULT NULL,
  `pr_time` datetime(6) DEFAULT NULL,
  `md_time` datetime(6) NOT NULL,
  `cr_time` datetime(6) NOT NULL,
  `sr_time` datetime(6) DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `component_type` smallint(6) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `parent_machine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE,
  INDEX `assets_component_admin_id_441c4982`(`admin_id`) USING BTREE,
  INDEX `assets_component_contract_id_02fe0abf`(`contract_id`) USING BTREE,
  INDEX `assets_component_location_id_0309f5a2`(`location_id`) USING BTREE,
  INDEX `assets_component_manufacturer_id_3cba75c3`(`manufacturer_id`) USING BTREE,
  INDEX `assets_component_parent_machine_id_4e93760a`(`parent_machine_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_component_tags
-- ----------------------------
DROP TABLE IF EXISTS `assets_component_tags`;
CREATE TABLE `assets_component_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_component_tags_component_id_tag_id_8cafdcbb_uniq`(`component_id`, `tag_id`) USING BTREE,
  INDEX `assets_component_tags_component_id_2966da8f`(`component_id`) USING BTREE,
  INDEX `assets_component_tags_tag_id_55792c42`(`tag_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_contract
-- ----------------------------
DROP TABLE IF EXISTS `assets_contract`;
CREATE TABLE `assets_contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `price` int(11) NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `c_time` date DEFAULT NULL,
  `m_time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_cpu
-- ----------------------------
DROP TABLE IF EXISTS `assets_cpu`;
CREATE TABLE `assets_cpu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cpu_count` smallint(5) UNSIGNED NOT NULL,
  `cpu_core_count` smallint(5) UNSIGNED NOT NULL,
  `it_asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `it_asset_id`(`it_asset_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_datacollector
-- ----------------------------
DROP TABLE IF EXISTS `assets_datacollector`;
CREATE TABLE `assets_datacollector`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statu` smallint(6) NOT NULL,
  `lr_time` datetime(6) DEFAULT NULL,
  `pr_time` datetime(6) DEFAULT NULL,
  `md_time` datetime(6) NOT NULL,
  `cr_time` datetime(6) NOT NULL,
  `sr_time` datetime(6) DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `data_collector_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `parent_data_collector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE,
  INDEX `assets_datacollector_admin_id_402c0248`(`admin_id`) USING BTREE,
  INDEX `assets_datacollector_contract_id_aada3973`(`contract_id`) USING BTREE,
  INDEX `assets_datacollector_location_id_0df4a56a`(`location_id`) USING BTREE,
  INDEX `assets_datacollector_manufacturer_id_b42282fb`(`manufacturer_id`) USING BTREE,
  INDEX `assets_datacollector_parent_data_collector_id_08501a7a`(`parent_data_collector_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_datacollector_tags
-- ----------------------------
DROP TABLE IF EXISTS `assets_datacollector_tags`;
CREATE TABLE `assets_datacollector_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datacollector_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_datacollector_tags_datacollector_id_tag_id_3c7cb00f_uniq`(`datacollector_id`, `tag_id`) USING BTREE,
  INDEX `assets_datacollector_tags_datacollector_id_99b78793`(`datacollector_id`) USING BTREE,
  INDEX `assets_datacollector_tags_tag_id_6000492b`(`tag_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_disk
-- ----------------------------
DROP TABLE IF EXISTS `assets_disk`;
CREATE TABLE `assets_disk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `capacity` double DEFAULT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manufacturer` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `it_asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_disk_it_asset_id_sn_f7f8a144_uniq`(`it_asset_id`, `sn`) USING BTREE,
  INDEX `assets_disk_it_asset_id_9a83b7ff`(`it_asset_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_engine
-- ----------------------------
DROP TABLE IF EXISTS `assets_engine`;
CREATE TABLE `assets_engine`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cylinder_number` smallint(6) DEFAULT NULL,
  `displacement` double DEFAULT NULL,
  `rated_fuel_consumption` double DEFAULT NULL,
  `rated_speed` double DEFAULT NULL,
  `exhasut_gas_temp` double DEFAULT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `machine_id`(`machine_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of assets_engine
-- ----------------------------
INSERT INTO `assets_engine` VALUES (1, 3, 20, 20, 3000, 100, 16);
INSERT INTO `assets_engine` VALUES (2, 3, 20, 20, 3000, 100, 17);
INSERT INTO `assets_engine` VALUES (3, 3, 20, 20, 3000, 1000, 18);
INSERT INTO `assets_engine` VALUES (4, 3, 20, 20, 3000, 1000, 19);
INSERT INTO `assets_engine` VALUES (5, 3, 20, 20, 3000, 100, 20);
INSERT INTO `assets_engine` VALUES (6, 3, 20, 20, 3000, 1000, 21);

-- ----------------------------
-- Table structure for assets_equipmentgroup
-- ----------------------------
DROP TABLE IF EXISTS `assets_equipmentgroup`;
CREATE TABLE `assets_equipmentgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statu` smallint(6) NOT NULL,
  `lr_time` datetime(6) DEFAULT NULL,
  `pr_time` datetime(6) DEFAULT NULL,
  `md_time` datetime(6) NOT NULL,
  `cr_time` datetime(6) NOT NULL,
  `sr_time` datetime(6) DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `equipment_group_type` smallint(6) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE,
  INDEX `assets_equipmentgroup_admin_id_e4efc988`(`admin_id`) USING BTREE,
  INDEX `assets_equipmentgroup_contract_id_660a52b2`(`contract_id`) USING BTREE,
  INDEX `assets_equipmentgroup_location_id_79798a6a`(`location_id`) USING BTREE,
  INDEX `assets_equipmentgroup_manufacturer_id_e9266d3a`(`manufacturer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_equipmentgroup
-- ----------------------------
INSERT INTO `assets_equipmentgroup` VALUES (1, 'Top Driver', '201812121207', 0, '2018-12-12 12:08:00.000000', '2018-12-01 12:07:00.000000', '2018-12-12 18:47:04.976838', '2018-12-12 18:45:24.060112', '2018-12-11 12:07:00.000000', '顶驱设备基类', 0, 1, NULL, 1, 5);
INSERT INTO `assets_equipmentgroup` VALUES (2, 'Propeller 1', 'hxRll3fa', 0, '2018-12-12 18:27:00.000000', '2018-12-12 18:27:00.000000', '2018-12-12 18:27:55.639217', '2018-12-12 18:41:15.377122', '2018-12-12 18:27:00.000000', '', 1, 1, NULL, 2, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (3, 'Propeller 2', 'HfRAg6Mz', 0, '2018-12-12 18:28:00.000000', '2018-12-12 18:28:00.000000', '2018-12-12 18:28:21.433772', '2018-12-12 18:41:23.018467', '2018-12-12 18:28:00.000000', '', 1, 1, NULL, 2, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (4, 'Propeller 3', 'kl9dCshS', 0, '2018-12-12 18:28:00.000000', '2018-12-12 18:28:00.000000', '2018-12-12 18:28:42.991245', '2018-12-12 18:41:28.174644', '2018-12-12 18:28:00.000000', '', 1, 1, NULL, 2, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (5, 'Propeller 4', 'bjZaBuKO', 1, '2018-12-12 18:28:00.000000', '2018-12-12 18:28:00.000000', '2018-12-12 18:29:02.656666', '2018-12-12 18:41:33.329843', '2018-12-12 18:29:00.000000', '', 1, 1, NULL, 2, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (6, 'Propeller 5', 'PzwlX4jf', 3, '2018-12-12 18:29:00.000000', '2018-12-12 18:29:00.000000', '2018-12-12 18:29:28.290649', '2018-12-12 18:41:40.968940', '2018-12-12 18:29:00.000000', '', 1, 1, NULL, 2, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (7, 'Propeller 6', 'E8xaElFa', 0, '2018-12-12 18:29:00.000000', '2018-12-12 18:29:00.000000', '2018-12-12 18:29:59.458212', '2018-12-12 18:41:49.182803', '2018-12-12 18:29:00.000000', '', 1, 1, NULL, 2, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (8, 'Generator 1', 'AJvg2Vhm', 0, '2018-12-12 18:30:00.000000', '2018-12-12 18:30:00.000000', '2018-12-12 18:30:28.872732', '2018-12-12 18:41:55.484430', '2018-12-12 18:30:00.000000', '', 2, 1, NULL, 3, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (9, 'Generator 2', 'sdjExGm4', 2, '2018-12-12 18:30:00.000000', '2018-12-12 18:30:00.000000', '2018-12-12 18:31:00.930399', '2018-12-12 18:42:00.415981', '2018-12-12 18:30:00.000000', '', 2, 1, NULL, 3, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (10, 'Generator 3', 'wlZEfaWw', 1, '2018-12-12 18:31:00.000000', '2018-12-12 18:31:00.000000', '2018-12-12 18:31:22.897948', '2018-12-12 18:42:05.738585', '2018-12-12 18:31:00.000000', '', 2, 1, NULL, 3, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (11, 'Generator 4', 'SpqF5mEp', 2, '2018-12-12 18:31:00.000000', '2018-12-12 18:31:00.000000', '2018-12-12 18:31:46.380256', '2018-12-12 18:42:19.726074', '2018-12-12 18:31:00.000000', '', 2, 1, NULL, 3, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (12, 'Generator 5', '0E3irpV8', 0, '2018-12-12 18:32:00.000000', '2018-12-12 18:32:00.000000', '2018-12-12 18:32:07.536339', '2018-12-12 18:42:25.405297', '2018-12-12 18:32:00.000000', '', 2, 1, NULL, 3, NULL);
INSERT INTO `assets_equipmentgroup` VALUES (13, 'Generator 6', 'cX7TJN5m', 3, '2018-12-12 18:32:00.000000', '2018-12-12 18:32:00.000000', '2018-12-12 18:32:35.970836', '2018-12-12 18:42:30.945983', '2018-12-12 18:32:00.000000', '', 2, 1, NULL, 3, NULL);

-- ----------------------------
-- Table structure for assets_equipmentgroup_tags
-- ----------------------------
DROP TABLE IF EXISTS `assets_equipmentgroup_tags`;
CREATE TABLE `assets_equipmentgroup_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentgroup_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_equipmentgroup_ta_equipmentgroup_id_tag_id_dd443ef5_uniq`(`equipmentgroup_id`, `tag_id`) USING BTREE,
  INDEX `assets_equipmentgroup_tags_equipmentgroup_id_d939d48c`(`equipmentgroup_id`) USING BTREE,
  INDEX `assets_equipmentgroup_tags_tag_id_ee361006`(`tag_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_gear
-- ----------------------------
DROP TABLE IF EXISTS `assets_gear`;
CREATE TABLE `assets_gear`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teeth_number` smallint(6) DEFAULT NULL,
  `modulus` double DEFAULT NULL,
  `diameter` double DEFAULT NULL,
  `tip_diameter` double DEFAULT NULL,
  `root_diameter` double DEFAULT NULL,
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `component_id`(`component_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_gearbox
-- ----------------------------
DROP TABLE IF EXISTS `assets_gearbox`;
CREATE TABLE `assets_gearbox`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ratio` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `input_torque` double DEFAULT NULL,
  `max_torque` double DEFAULT NULL,
  `input_speed` double DEFAULT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `machine_id`(`machine_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_gearbox
-- ----------------------------
INSERT INTO `assets_gearbox` VALUES (1, '0.7', 1000, 2000, 3000, 3);
INSERT INTO `assets_gearbox` VALUES (2, '0.2', 1000, 5000, 3000, 5);
INSERT INTO `assets_gearbox` VALUES (3, '0.2', 1000, 2000, 3000, 6);
INSERT INTO `assets_gearbox` VALUES (4, '0.3', 1000, 2000, 3000, 8);
INSERT INTO `assets_gearbox` VALUES (5, '0.2', 1000, 2000, 3000, 10);
INSERT INTO `assets_gearbox` VALUES (6, '0.2', 1000, 2000, 3000, 12);
INSERT INTO `assets_gearbox` VALUES (7, '0.4', 1000, 2000, 3000, 15);

-- ----------------------------
-- Table structure for assets_generator
-- ----------------------------
DROP TABLE IF EXISTS `assets_generator`;
CREATE TABLE `assets_generator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `battery_number` smallint(6) DEFAULT NULL,
  `main_power` double DEFAULT NULL,
  `backup_power` double DEFAULT NULL,
  `equipment_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `equipment_group_id`(`equipment_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of assets_generator
-- ----------------------------
INSERT INTO `assets_generator` VALUES (1, 3, 15000, 10000, 8);
INSERT INTO `assets_generator` VALUES (2, 3, 15000, 10000, 9);
INSERT INTO `assets_generator` VALUES (3, 4, 15000, 10000, 10);
INSERT INTO `assets_generator` VALUES (4, 4, 15000, 10000, 11);
INSERT INTO `assets_generator` VALUES (5, 3, 15000, 10000, 12);
INSERT INTO `assets_generator` VALUES (6, 3, 15000, 10000, 13);

-- ----------------------------
-- Table structure for assets_itasset
-- ----------------------------
DROP TABLE IF EXISTS `assets_itasset`;
CREATE TABLE `assets_itasset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statu` smallint(6) NOT NULL,
  `lr_time` datetime(6) DEFAULT NULL,
  `pr_time` datetime(6) DEFAULT NULL,
  `md_time` datetime(6) NOT NULL,
  `cr_time` datetime(6) NOT NULL,
  `sr_time` datetime(6) DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `admin_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE,
  INDEX `assets_itasset_admin_id_ad7e0148`(`admin_id`) USING BTREE,
  INDEX `assets_itasset_contract_id_4199cd0e`(`contract_id`) USING BTREE,
  INDEX `assets_itasset_location_id_a789a1d8`(`location_id`) USING BTREE,
  INDEX `assets_itasset_manufacturer_id_5966e662`(`manufacturer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_itasset_tags
-- ----------------------------
DROP TABLE IF EXISTS `assets_itasset_tags`;
CREATE TABLE `assets_itasset_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itasset_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_itasset_tags_itasset_id_tag_id_bda44d3d_uniq`(`itasset_id`, `tag_id`) USING BTREE,
  INDEX `assets_itasset_tags_itasset_id_899f2b79`(`itasset_id`) USING BTREE,
  INDEX `assets_itasset_tags_tag_id_92ad895a`(`tag_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_location
-- ----------------------------
DROP TABLE IF EXISTS `assets_location`;
CREATE TABLE `assets_location`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `assets_location_parent_location_id_51c669a9`(`parent_location_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_location
-- ----------------------------
INSERT INTO `assets_location` VALUES (1, 'Deck', NULL);
INSERT INTO `assets_location` VALUES (2, 'Cabin', NULL);
INSERT INTO `assets_location` VALUES (3, 'Engine room', NULL);

-- ----------------------------
-- Table structure for assets_machine
-- ----------------------------
DROP TABLE IF EXISTS `assets_machine`;
CREATE TABLE `assets_machine`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statu` smallint(6) NOT NULL,
  `lr_time` datetime(6) DEFAULT NULL,
  `pr_time` datetime(6) DEFAULT NULL,
  `md_time` datetime(6) NOT NULL,
  `cr_time` datetime(6) NOT NULL,
  `sr_time` datetime(6) DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `machine_type` smallint(6) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `parent_equipment_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE,
  INDEX `assets_machine_admin_id_70cbf31d`(`admin_id`) USING BTREE,
  INDEX `assets_machine_contract_id_874707aa`(`contract_id`) USING BTREE,
  INDEX `assets_machine_location_id_bae11444`(`location_id`) USING BTREE,
  INDEX `assets_machine_manufacturer_id_dbd1b9e3`(`manufacturer_id`) USING BTREE,
  INDEX `assets_machine_parent_equipment_group_id_5cbaab26`(`parent_equipment_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_machine
-- ----------------------------
INSERT INTO `assets_machine` VALUES (1, 'TD-Cooling Motor', 'SlqiSi4t', 0, '2018-12-12 19:02:00.000000', '2018-12-12 19:02:00.000000', '2018-12-12 19:35:45.537275', '2018-12-12 19:02:22.410592', '2018-12-12 19:02:00.000000', '', 0, 1, NULL, 1, 1, 1);
INSERT INTO `assets_machine` VALUES (2, 'TD-Driving motor', 'Or6IeiT1', 0, '2018-12-12 19:02:00.000000', '2018-12-12 19:02:00.000000', '2018-12-12 19:35:38.431368', '2018-12-12 19:02:57.599650', '2018-12-12 19:02:00.000000', '', 0, 1, NULL, 1, 2, 1);
INSERT INTO `assets_machine` VALUES (3, 'TD-Gearbox', 'TJj4F2vH', 0, '2018-12-12 19:05:00.000000', '2018-12-12 19:05:00.000000', '2018-12-12 19:07:45.619067', '2018-12-12 19:05:23.566895', '2018-12-12 19:05:00.000000', '', 1, 1, NULL, 1, 3, 1);
INSERT INTO `assets_machine` VALUES (4, 'PP1-Motor', 'XPJfvtUe', 0, '2018-12-12 19:06:00.000000', '2018-12-12 19:06:00.000000', '2018-12-12 19:06:36.978565', '2018-12-12 19:06:36.978565', '2018-12-12 19:06:00.000000', '', 0, 1, NULL, 2, 2, 2);
INSERT INTO `assets_machine` VALUES (5, 'PP1-GearBox', 'MOPCNpSv', 0, '2018-12-12 19:07:00.000000', '2018-12-12 19:07:00.000000', '2018-12-12 19:07:21.831519', '2018-12-12 19:07:21.831519', '2018-12-12 19:07:00.000000', '', 1, 1, NULL, 2, 3, 2);
INSERT INTO `assets_machine` VALUES (6, 'PP2-GearBox', 'WXKgpNbs', 2, '2018-12-12 19:08:00.000000', '2018-12-12 19:08:00.000000', '2018-12-12 19:08:56.475814', '2018-12-12 19:08:56.475814', '2018-12-12 19:08:00.000000', '', 1, 1, NULL, 2, 3, 3);
INSERT INTO `assets_machine` VALUES (7, 'PP2-Motor', 'hd6ZQSWm', 0, '2018-12-12 19:09:00.000000', '2018-12-12 19:09:00.000000', '2018-12-12 19:09:46.886659', '2018-12-12 19:09:46.886659', '2018-12-12 19:09:00.000000', '', 0, 1, NULL, 2, 1, 3);
INSERT INTO `assets_machine` VALUES (8, 'PP3-GearBox', 'htGjUDPU', 0, '2018-12-12 19:10:00.000000', '2018-12-12 19:10:00.000000', '2018-12-12 19:10:27.366536', '2018-12-12 19:10:27.366536', '2018-12-12 19:10:00.000000', '', 1, 1, NULL, 2, 1, 4);
INSERT INTO `assets_machine` VALUES (9, 'PP3-Motor', 'HGNBr5L8', 3, '2018-12-12 19:10:00.000000', '2018-12-12 19:10:00.000000', '2018-12-12 19:10:57.698763', '2018-12-12 19:10:57.698763', '2018-12-12 19:10:00.000000', '', 0, 1, NULL, 1, 1, 4);
INSERT INTO `assets_machine` VALUES (10, 'PP4-GearBox', 'Zd0IF9kh', 0, '2018-12-12 19:12:00.000000', '2018-12-12 19:12:00.000000', '2018-12-12 19:12:54.526457', '2018-12-12 19:12:54.526457', '2018-12-12 19:12:00.000000', '', 1, 1, NULL, 2, 3, 5);
INSERT INTO `assets_machine` VALUES (11, 'PP4-Motor', 'eu55ZWDU', 0, '2018-12-12 19:13:00.000000', '2018-12-12 19:13:00.000000', '2018-12-12 19:13:38.907409', '2018-12-12 19:13:38.907409', '2018-12-12 19:13:00.000000', '', 0, 1, NULL, 2, 2, 5);
INSERT INTO `assets_machine` VALUES (12, 'PP5-GearBox', '0aDRu7v7', 0, '2018-12-12 19:14:00.000000', '2018-12-12 19:14:00.000000', '2018-12-12 19:14:17.352669', '2018-12-12 19:14:17.352669', '2018-12-12 19:14:00.000000', '', 1, 1, NULL, 2, 3, 6);
INSERT INTO `assets_machine` VALUES (13, 'PP6-Motor', 'j0tKpKU1', 0, '2018-12-12 19:15:00.000000', '2018-12-12 19:15:00.000000', '2018-12-12 19:15:13.329563', '2018-12-12 19:15:13.329563', '2018-12-12 19:15:00.000000', '', 0, 1, NULL, 2, 2, 7);
INSERT INTO `assets_machine` VALUES (14, 'PP5-Motor', 'lwLC12CY', 0, '2018-12-12 19:15:00.000000', '2018-12-12 19:15:00.000000', '2018-12-12 19:16:06.692263', '2018-12-12 19:16:06.692263', '2018-12-12 19:15:00.000000', '', 0, 1, NULL, 2, 1, 6);
INSERT INTO `assets_machine` VALUES (15, 'PP6-GearBox', 'ATqx8r5V', 0, '2018-12-12 19:16:00.000000', '2018-12-12 19:16:00.000000', '2018-12-12 19:16:49.546768', '2018-12-12 19:16:49.546768', '2018-12-12 19:16:00.000000', '', 1, 1, NULL, 2, 3, 7);
INSERT INTO `assets_machine` VALUES (16, 'GE1-Engine', 'CAYKEKJ7', 0, '2018-12-12 19:28:00.000000', '2018-12-12 19:28:00.000000', '2018-12-12 19:28:41.291403', '2018-12-12 19:28:41.291403', '2018-12-12 19:28:00.000000', '', 2, 1, NULL, 3, 4, 8);
INSERT INTO `assets_machine` VALUES (17, 'GE2-Engine', 'CAYKEK32', 0, '2018-12-12 19:29:00.000000', '2018-12-12 19:29:00.000000', '2018-12-12 19:29:26.598041', '2018-12-12 19:29:26.598041', '2018-12-12 19:29:00.000000', '', 2, 1, NULL, 3, 4, 9);
INSERT INTO `assets_machine` VALUES (18, 'GE3-Engine', 'HG4355L8', 0, '2018-12-12 19:29:00.000000', '2018-12-12 19:29:00.000000', '2018-12-12 19:29:58.066408', '2018-12-12 19:29:58.066408', '2018-12-12 19:29:00.000000', '', 2, 1, NULL, 3, 4, 10);
INSERT INTO `assets_machine` VALUES (19, 'GE4-Engine', 'bGFDBuKO', 0, '2018-12-12 19:30:00.000000', '2018-12-12 19:30:00.000000', '2018-12-12 19:30:34.148807', '2018-12-12 19:30:34.148807', '2018-12-12 19:30:00.000000', '', 2, 1, NULL, 3, 4, 11);
INSERT INTO `assets_machine` VALUES (20, 'GE5-Engine', 'YY9dCshS', 0, '2018-12-12 19:30:00.000000', '2018-12-12 19:30:00.000000', '2018-12-12 19:31:00.044286', '2018-12-12 19:31:00.044286', '2018-12-12 19:30:00.000000', '', 2, 1, NULL, 3, 4, 12);
INSERT INTO `assets_machine` VALUES (21, 'GE6-Engine', 'JJUAg6Mz', 0, '2018-12-12 19:31:00.000000', '2018-12-12 19:31:00.000000', '2018-12-12 19:31:36.751348', '2018-12-12 19:31:36.751348', '2018-12-12 19:31:00.000000', '', 2, 1, NULL, 3, 4, 13);
INSERT INTO `assets_machine` VALUES (22, 'GE1-Dynamotor', 'JIUBr5L8', 0, '2018-12-12 19:37:00.000000', '2018-12-12 19:37:00.000000', '2018-12-12 19:37:09.606507', '2018-12-12 19:37:09.606507', '2018-12-12 19:37:00.000000', '', 0, 1, NULL, 3, 2, 8);
INSERT INTO `assets_machine` VALUES (23, 'GE2-Dynamotor', 'THN9dCshS', 0, '2018-12-12 19:37:00.000000', '2018-12-12 19:37:00.000000', '2018-12-12 19:37:44.597356', '2018-12-12 19:37:44.597356', '2018-12-12 19:37:00.000000', '', 0, 1, NULL, 3, 2, 9);
INSERT INTO `assets_machine` VALUES (24, 'GE3-Dynamotor', 'grkl3fa', 0, '2018-12-12 19:38:00.000000', '2018-12-12 19:38:00.000000', '2018-12-12 19:38:21.838954', '2018-12-12 19:38:21.838954', '2018-12-12 19:38:00.000000', '', 0, 1, NULL, 3, 2, 10);
INSERT INTO `assets_machine` VALUES (25, 'GE4-Dynamotor', 'qwRll3fa', 0, '2018-12-12 19:40:00.000000', '2018-12-12 19:40:00.000000', '2018-12-12 19:40:15.780557', '2018-12-12 19:40:15.780557', '2018-12-12 19:40:00.000000', '', 0, 1, NULL, 3, 2, 11);
INSERT INTO `assets_machine` VALUES (26, 'GE5-Dynamotor', 'nnhBr5L8', 0, '2018-12-12 19:40:00.000000', '2018-12-12 19:40:00.000000', '2018-12-12 19:40:49.537946', '2018-12-12 19:40:49.537946', '2018-12-12 19:40:00.000000', '', 0, 1, NULL, 3, 2, 12);
INSERT INTO `assets_machine` VALUES (27, 'GE6-Dynamotor', 'hhNBr5L8', 0, '2018-12-12 19:41:00.000000', '2018-12-12 19:41:00.000000', '2018-12-12 19:41:15.980638', '2018-12-12 19:41:15.980638', '2018-12-12 19:41:00.000000', '', 0, 1, NULL, 3, 2, 13);

-- ----------------------------
-- Table structure for assets_machine_tags
-- ----------------------------
DROP TABLE IF EXISTS `assets_machine_tags`;
CREATE TABLE `assets_machine_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_machine_tags_machine_id_tag_id_02a0efe9_uniq`(`machine_id`, `tag_id`) USING BTREE,
  INDEX `assets_machine_tags_machine_id_10286e31`(`machine_id`) USING BTREE,
  INDEX `assets_machine_tags_tag_id_6eecd12f`(`tag_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `assets_manufacturer`;
CREATE TABLE `assets_manufacturer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_manufacturer
-- ----------------------------
INSERT INTO `assets_manufacturer` VALUES (1, 'Simens', '123456789', NULL);
INSERT INTO `assets_manufacturer` VALUES (2, 'ABB', '987564', NULL);
INSERT INTO `assets_manufacturer` VALUES (3, 'General Electric', '568984', NULL);
INSERT INTO `assets_manufacturer` VALUES (4, 'Rolls Royce', '156121', NULL);
INSERT INTO `assets_manufacturer` VALUES (5, 'VARCO', '7891651', NULL);

-- ----------------------------
-- Table structure for assets_measurepoint
-- ----------------------------
DROP TABLE IF EXISTS `assets_measurepoint`;
CREATE TABLE `assets_measurepoint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `equipment_group_id` int(11) DEFAULT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `sensor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `assets_measurepoint_component_id_61ef5e16`(`component_id`) USING BTREE,
  INDEX `assets_measurepoint_equipment_group_id_ebcc8686`(`equipment_group_id`) USING BTREE,
  INDEX `assets_measurepoint_machine_id_26db6768`(`machine_id`) USING BTREE,
  UNIQUE INDEX `assets_measurepoint_sensor_id_e2cbe498_uniq`(`sensor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_measurepoint
-- ----------------------------
INSERT INTO `assets_measurepoint` VALUES (1, 'Nondriven end', NULL, 1, 2, 1);
INSERT INTO `assets_measurepoint` VALUES (2, 'Driven End', NULL, 1, 2, 2);

-- ----------------------------
-- Table structure for assets_motor
-- ----------------------------
DROP TABLE IF EXISTS `assets_motor`;
CREATE TABLE `assets_motor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `efficiency` double DEFAULT NULL,
  `phase_number` smallint(6) DEFAULT NULL,
  `pole_pairs_number` smallint(6) DEFAULT NULL,
  `turn_number` smallint(6) DEFAULT NULL,
  `rated_voltage` double DEFAULT NULL,
  `power_factor` double DEFAULT NULL,
  `rated_speed` double DEFAULT NULL,
  `machine_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `machine_id`(`machine_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of assets_motor
-- ----------------------------
INSERT INTO `assets_motor` VALUES (1, 75, 3, 2, 80, 9000, 0.98, 3000, 1);
INSERT INTO `assets_motor` VALUES (2, 74, 3, 2, 80, 15000, 0.78, 3000, 2);
INSERT INTO `assets_motor` VALUES (3, 75, 3, 2, 70, 10000, 0.78, 3000, 4);
INSERT INTO `assets_motor` VALUES (4, 78, 3, 2, 90, 10000, 0.88, 3000, 7);
INSERT INTO `assets_motor` VALUES (5, 78, 3, 2, 80, 10000, 0.94, 3000, 9);
INSERT INTO `assets_motor` VALUES (6, 78, 3, 2, 50, 10000, 0.94, 3000, 11);
INSERT INTO `assets_motor` VALUES (7, 77, 3, 2, 70, 10000, 0.94, 3000, 14);
INSERT INTO `assets_motor` VALUES (8, 71, 3, 2, 60, 10000, 0.91, 3000, 13);
INSERT INTO `assets_motor` VALUES (9, 50, 3, 2, 70, 20000, 0.88, 3000, 22);
INSERT INTO `assets_motor` VALUES (10, 88, 3, 2, 70, 30000, 0.98, 3000, 23);
INSERT INTO `assets_motor` VALUES (11, 3000, 3, 2, 90, 30000, 0.88, 3000, 24);
INSERT INTO `assets_motor` VALUES (12, 99, 3, 2, 50, 30000, 0.88, 3000, 25);
INSERT INTO `assets_motor` VALUES (13, 87, 3, 2, 70, 3000, 0.88, 3000, 26);
INSERT INTO `assets_motor` VALUES (14, 87, 3, 2, 70, 30000, 0.88, 3000, 27);

-- ----------------------------
-- Table structure for assets_networkdevice
-- ----------------------------
DROP TABLE IF EXISTS `assets_networkdevice`;
CREATE TABLE `assets_networkdevice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network_device_type` smallint(6) NOT NULL,
  `vlan_ip` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `intranet_ip` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `port_num` smallint(6) DEFAULT NULL,
  `device_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `it_asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `it_asset_id`(`it_asset_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_nic
-- ----------------------------
DROP TABLE IF EXISTS `assets_nic`;
CREATE TABLE `assets_nic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mac` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `net_mask` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bonding` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `it_asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_nic_it_asset_id_model_mac_ccd5ea37_uniq`(`it_asset_id`, `model`, `mac`) USING BTREE,
  INDEX `assets_nic_it_asset_id_20fd454f`(`it_asset_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_propeller
-- ----------------------------
DROP TABLE IF EXISTS `assets_propeller`;
CREATE TABLE `assets_propeller`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forward_force` double DEFAULT NULL,
  `reverse_force` double DEFAULT NULL,
  `working_depth` double DEFAULT NULL,
  `equipment_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `equipment_group_id`(`equipment_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of assets_propeller
-- ----------------------------
INSERT INTO `assets_propeller` VALUES (1, 2000, 1500, 1000, 2);
INSERT INTO `assets_propeller` VALUES (2, 2000, 1500, 1000, 3);
INSERT INTO `assets_propeller` VALUES (3, 2000, 1500, 1000, 4);
INSERT INTO `assets_propeller` VALUES (4, 2000, 1500, 1000, 5);
INSERT INTO `assets_propeller` VALUES (5, 2000, 1500, 1000, 6);
INSERT INTO `assets_propeller` VALUES (6, 2000, 1500, 1000, 7);

-- ----------------------------
-- Table structure for assets_ram
-- ----------------------------
DROP TABLE IF EXISTS `assets_ram`;
CREATE TABLE `assets_ram`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `slot` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manufacturer` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `it_asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_ram_it_asset_id_slot_cc52eb22_uniq`(`it_asset_id`, `slot`) USING BTREE,
  INDEX `assets_ram_it_asset_id_385fe117`(`it_asset_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_rotor
-- ----------------------------
DROP TABLE IF EXISTS `assets_rotor`;
CREATE TABLE `assets_rotor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `outer_diameter` double DEFAULT NULL,
  `inner_diameter` double DEFAULT NULL,
  `slot_number` smallint(6) DEFAULT NULL,
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `component_id`(`component_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_sensor
-- ----------------------------
DROP TABLE IF EXISTS `assets_sensor`;
CREATE TABLE `assets_sensor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statu` smallint(6) NOT NULL,
  `lr_time` datetime(6) DEFAULT NULL,
  `pr_time` datetime(6) DEFAULT NULL,
  `md_time` datetime(6) NOT NULL,
  `cr_time` datetime(6) NOT NULL,
  `sr_time` datetime(6) DEFAULT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `sensor_type` smallint(6) DEFAULT NULL,
  `sampling_frequency` bigint(20) DEFAULT NULL,
  `sampling_interval` double DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `data_collector_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE,
  INDEX `assets_sensor_admin_id_367ee54d`(`admin_id`) USING BTREE,
  INDEX `assets_sensor_contract_id_ab8def40`(`contract_id`) USING BTREE,
  INDEX `assets_sensor_data_collector_id_fba842c8`(`data_collector_id`) USING BTREE,
  INDEX `assets_sensor_location_id_20847fa3`(`location_id`) USING BTREE,
  INDEX `assets_sensor_manufacturer_id_ee270b37`(`manufacturer_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assets_sensor
-- ----------------------------
INSERT INTO `assets_sensor` VALUES (1, 'TD1', 'HHYNBr5L8', 0, '2018-12-12 20:06:00.000000', '2018-12-12 20:06:00.000000', '2018-12-12 20:31:23.582465', '2018-12-12 20:06:52.996530', '2018-12-12 20:06:00.000000', '', 0, 10000, 5, 1, NULL, NULL, 1, 1);
INSERT INTO `assets_sensor` VALUES (2, 'TD2', 'HGNHYQL8', 0, '2018-12-12 21:07:00.000000', '2018-12-12 21:07:00.000000', '2018-12-12 21:08:00.130439', '2018-12-12 21:08:00.130439', '2018-12-12 21:07:00.000000', '', 0, 10000, 5, 1, NULL, NULL, 1, 4);
INSERT INTO `assets_sensor` VALUES (3, 'TD3', 'HRFBr5L8', 2, '2018-12-12 21:08:00.000000', '2018-12-12 21:08:00.000000', '2018-12-12 21:09:09.843373', '2018-12-12 21:09:09.843373', '2018-12-12 21:08:00.000000', '', 0, 10000, 5, 1, NULL, NULL, 1, 5);
INSERT INTO `assets_sensor` VALUES (4, 'TD4', 'JUIBr5L8', 0, '2018-12-12 21:09:00.000000', '2018-12-12 21:09:00.000000', '2018-12-12 21:09:39.766446', '2018-12-12 21:09:39.766446', '2018-12-12 21:09:00.000000', '', 0, 10000, 5, 1, NULL, NULL, 1, 3);

-- ----------------------------
-- Table structure for assets_sensor_tags
-- ----------------------------
DROP TABLE IF EXISTS `assets_sensor_tags`;
CREATE TABLE `assets_sensor_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assets_sensor_tags_sensor_id_tag_id_4a38e628_uniq`(`sensor_id`, `tag_id`) USING BTREE,
  INDEX `assets_sensor_tags_sensor_id_5ddf93b7`(`sensor_id`) USING BTREE,
  INDEX `assets_sensor_tags_tag_id_ac633b32`(`tag_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_server
-- ----------------------------
DROP TABLE IF EXISTS `assets_server`;
CREATE TABLE `assets_server`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_type` smallint(6) NOT NULL,
  `model` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `raid_type` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os_distribution` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os_release` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `it_asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `it_asset_id`(`it_asset_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_signalcollected
-- ----------------------------
DROP TABLE IF EXISTS `assets_signalcollected`;
CREATE TABLE `assets_signalcollected`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wave` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `measurepoint_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `assets_signalcollected_measurepoint_id_1bb8b71e`(`measurepoint_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_software
-- ----------------------------
DROP TABLE IF EXISTS `assets_software`;
CREATE TABLE `assets_software`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `software_type` smallint(6) NOT NULL,
  `license_num` int(11) NOT NULL,
  `version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `version`(`version`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_stator
-- ----------------------------
DROP TABLE IF EXISTS `assets_stator`;
CREATE TABLE `assets_stator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `power` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `outer_diameter` double DEFAULT NULL,
  `inner_diameter` double DEFAULT NULL,
  `slot_number` smallint(6) DEFAULT NULL,
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `component_id`(`component_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_storagedevice
-- ----------------------------
DROP TABLE IF EXISTS `assets_storagedevice`;
CREATE TABLE `assets_storagedevice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_device_type` smallint(6) NOT NULL,
  `it_asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `it_asset_id`(`it_asset_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for assets_tag
-- ----------------------------
DROP TABLE IF EXISTS `assets_tag`;
CREATE TABLE `assets_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_day` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for assets_topdriver
-- ----------------------------
DROP TABLE IF EXISTS `assets_topdriver`;
CREATE TABLE `assets_topdriver`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drilling_depth` double DEFAULT NULL,
  `max_load` double DEFAULT NULL,
  `power_voltage` double DEFAULT NULL,
  `power_frequency` double DEFAULT NULL,
  `min_speed` double DEFAULT NULL,
  `max_speed` double DEFAULT NULL,
  `torque` double DEFAULT NULL,
  `equipment_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `equipment_group_id`(`equipment_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of assets_topdriver
-- ----------------------------
INSERT INTO `assets_topdriver` VALUES (1, 2000, 100, 220, 50, 50, 3000, 4000, 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add bearing', 7, 'add_bearing');
INSERT INTO `auth_permission` VALUES (26, 'Can change bearing', 7, 'change_bearing');
INSERT INTO `auth_permission` VALUES (27, 'Can delete bearing', 7, 'delete_bearing');
INSERT INTO `auth_permission` VALUES (28, 'Can view bearing', 7, 'view_bearing');
INSERT INTO `auth_permission` VALUES (29, 'Can add component', 8, 'add_component');
INSERT INTO `auth_permission` VALUES (30, 'Can change component', 8, 'change_component');
INSERT INTO `auth_permission` VALUES (31, 'Can delete component', 8, 'delete_component');
INSERT INTO `auth_permission` VALUES (32, 'Can view component', 8, 'view_component');
INSERT INTO `auth_permission` VALUES (33, 'Can add contract', 9, 'add_contract');
INSERT INTO `auth_permission` VALUES (34, 'Can change contract', 9, 'change_contract');
INSERT INTO `auth_permission` VALUES (35, 'Can delete contract', 9, 'delete_contract');
INSERT INTO `auth_permission` VALUES (36, 'Can view contract', 9, 'view_contract');
INSERT INTO `auth_permission` VALUES (37, 'Can add cpu', 10, 'add_cpu');
INSERT INTO `auth_permission` VALUES (38, 'Can change cpu', 10, 'change_cpu');
INSERT INTO `auth_permission` VALUES (39, 'Can delete cpu', 10, 'delete_cpu');
INSERT INTO `auth_permission` VALUES (40, 'Can view cpu', 10, 'view_cpu');
INSERT INTO `auth_permission` VALUES (41, 'Can add data collector', 11, 'add_datacollector');
INSERT INTO `auth_permission` VALUES (42, 'Can change data collector', 11, 'change_datacollector');
INSERT INTO `auth_permission` VALUES (43, 'Can delete data collector', 11, 'delete_datacollector');
INSERT INTO `auth_permission` VALUES (44, 'Can view data collector', 11, 'view_datacollector');
INSERT INTO `auth_permission` VALUES (45, 'Can add disk', 12, 'add_disk');
INSERT INTO `auth_permission` VALUES (46, 'Can change disk', 12, 'change_disk');
INSERT INTO `auth_permission` VALUES (47, 'Can delete disk', 12, 'delete_disk');
INSERT INTO `auth_permission` VALUES (48, 'Can view disk', 12, 'view_disk');
INSERT INTO `auth_permission` VALUES (49, 'Can add engine', 13, 'add_engine');
INSERT INTO `auth_permission` VALUES (50, 'Can change engine', 13, 'change_engine');
INSERT INTO `auth_permission` VALUES (51, 'Can delete engine', 13, 'delete_engine');
INSERT INTO `auth_permission` VALUES (52, 'Can view engine', 13, 'view_engine');
INSERT INTO `auth_permission` VALUES (53, 'Can add equipment group', 14, 'add_equipmentgroup');
INSERT INTO `auth_permission` VALUES (54, 'Can change equipment group', 14, 'change_equipmentgroup');
INSERT INTO `auth_permission` VALUES (55, 'Can delete equipment group', 14, 'delete_equipmentgroup');
INSERT INTO `auth_permission` VALUES (56, 'Can view equipment group', 14, 'view_equipmentgroup');
INSERT INTO `auth_permission` VALUES (57, 'Can add gear', 15, 'add_gear');
INSERT INTO `auth_permission` VALUES (58, 'Can change gear', 15, 'change_gear');
INSERT INTO `auth_permission` VALUES (59, 'Can delete gear', 15, 'delete_gear');
INSERT INTO `auth_permission` VALUES (60, 'Can view gear', 15, 'view_gear');
INSERT INTO `auth_permission` VALUES (61, 'Can add gear box', 16, 'add_gearbox');
INSERT INTO `auth_permission` VALUES (62, 'Can change gear box', 16, 'change_gearbox');
INSERT INTO `auth_permission` VALUES (63, 'Can delete gear box', 16, 'delete_gearbox');
INSERT INTO `auth_permission` VALUES (64, 'Can view gear box', 16, 'view_gearbox');
INSERT INTO `auth_permission` VALUES (65, 'Can add generator', 17, 'add_generator');
INSERT INTO `auth_permission` VALUES (66, 'Can change generator', 17, 'change_generator');
INSERT INTO `auth_permission` VALUES (67, 'Can delete generator', 17, 'delete_generator');
INSERT INTO `auth_permission` VALUES (68, 'Can view generator', 17, 'view_generator');
INSERT INTO `auth_permission` VALUES (69, 'Can add it asset', 18, 'add_itasset');
INSERT INTO `auth_permission` VALUES (70, 'Can change it asset', 18, 'change_itasset');
INSERT INTO `auth_permission` VALUES (71, 'Can delete it asset', 18, 'delete_itasset');
INSERT INTO `auth_permission` VALUES (72, 'Can view it asset', 18, 'view_itasset');
INSERT INTO `auth_permission` VALUES (73, 'Can add location', 19, 'add_location');
INSERT INTO `auth_permission` VALUES (74, 'Can change location', 19, 'change_location');
INSERT INTO `auth_permission` VALUES (75, 'Can delete location', 19, 'delete_location');
INSERT INTO `auth_permission` VALUES (76, 'Can view location', 19, 'view_location');
INSERT INTO `auth_permission` VALUES (77, 'Can add machine', 20, 'add_machine');
INSERT INTO `auth_permission` VALUES (78, 'Can change machine', 20, 'change_machine');
INSERT INTO `auth_permission` VALUES (79, 'Can delete machine', 20, 'delete_machine');
INSERT INTO `auth_permission` VALUES (80, 'Can view machine', 20, 'view_machine');
INSERT INTO `auth_permission` VALUES (81, 'Can add manufacturer', 21, 'add_manufacturer');
INSERT INTO `auth_permission` VALUES (82, 'Can change manufacturer', 21, 'change_manufacturer');
INSERT INTO `auth_permission` VALUES (83, 'Can delete manufacturer', 21, 'delete_manufacturer');
INSERT INTO `auth_permission` VALUES (84, 'Can view manufacturer', 21, 'view_manufacturer');
INSERT INTO `auth_permission` VALUES (85, 'Can add measure point', 22, 'add_measurepoint');
INSERT INTO `auth_permission` VALUES (86, 'Can change measure point', 22, 'change_measurepoint');
INSERT INTO `auth_permission` VALUES (87, 'Can delete measure point', 22, 'delete_measurepoint');
INSERT INTO `auth_permission` VALUES (88, 'Can view measure point', 22, 'view_measurepoint');
INSERT INTO `auth_permission` VALUES (89, 'Can add motor', 23, 'add_motor');
INSERT INTO `auth_permission` VALUES (90, 'Can change motor', 23, 'change_motor');
INSERT INTO `auth_permission` VALUES (91, 'Can delete motor', 23, 'delete_motor');
INSERT INTO `auth_permission` VALUES (92, 'Can view motor', 23, 'view_motor');
INSERT INTO `auth_permission` VALUES (93, 'Can add network device', 24, 'add_networkdevice');
INSERT INTO `auth_permission` VALUES (94, 'Can change network device', 24, 'change_networkdevice');
INSERT INTO `auth_permission` VALUES (95, 'Can delete network device', 24, 'delete_networkdevice');
INSERT INTO `auth_permission` VALUES (96, 'Can view network device', 24, 'view_networkdevice');
INSERT INTO `auth_permission` VALUES (97, 'Can add nic', 25, 'add_nic');
INSERT INTO `auth_permission` VALUES (98, 'Can change nic', 25, 'change_nic');
INSERT INTO `auth_permission` VALUES (99, 'Can delete nic', 25, 'delete_nic');
INSERT INTO `auth_permission` VALUES (100, 'Can view nic', 25, 'view_nic');
INSERT INTO `auth_permission` VALUES (101, 'Can add propeller', 26, 'add_propeller');
INSERT INTO `auth_permission` VALUES (102, 'Can change propeller', 26, 'change_propeller');
INSERT INTO `auth_permission` VALUES (103, 'Can delete propeller', 26, 'delete_propeller');
INSERT INTO `auth_permission` VALUES (104, 'Can view propeller', 26, 'view_propeller');
INSERT INTO `auth_permission` VALUES (105, 'Can add ram', 27, 'add_ram');
INSERT INTO `auth_permission` VALUES (106, 'Can change ram', 27, 'change_ram');
INSERT INTO `auth_permission` VALUES (107, 'Can delete ram', 27, 'delete_ram');
INSERT INTO `auth_permission` VALUES (108, 'Can view ram', 27, 'view_ram');
INSERT INTO `auth_permission` VALUES (109, 'Can add rotor', 28, 'add_rotor');
INSERT INTO `auth_permission` VALUES (110, 'Can change rotor', 28, 'change_rotor');
INSERT INTO `auth_permission` VALUES (111, 'Can delete rotor', 28, 'delete_rotor');
INSERT INTO `auth_permission` VALUES (112, 'Can view rotor', 28, 'view_rotor');
INSERT INTO `auth_permission` VALUES (113, 'Can add sensor', 29, 'add_sensor');
INSERT INTO `auth_permission` VALUES (114, 'Can change sensor', 29, 'change_sensor');
INSERT INTO `auth_permission` VALUES (115, 'Can delete sensor', 29, 'delete_sensor');
INSERT INTO `auth_permission` VALUES (116, 'Can view sensor', 29, 'view_sensor');
INSERT INTO `auth_permission` VALUES (117, 'Can add server', 30, 'add_server');
INSERT INTO `auth_permission` VALUES (118, 'Can change server', 30, 'change_server');
INSERT INTO `auth_permission` VALUES (119, 'Can delete server', 30, 'delete_server');
INSERT INTO `auth_permission` VALUES (120, 'Can view server', 30, 'view_server');
INSERT INTO `auth_permission` VALUES (121, 'Can add signal collected', 31, 'add_signalcollected');
INSERT INTO `auth_permission` VALUES (122, 'Can change signal collected', 31, 'change_signalcollected');
INSERT INTO `auth_permission` VALUES (123, 'Can delete signal collected', 31, 'delete_signalcollected');
INSERT INTO `auth_permission` VALUES (124, 'Can view signal collected', 31, 'view_signalcollected');
INSERT INTO `auth_permission` VALUES (125, 'Can add software', 32, 'add_software');
INSERT INTO `auth_permission` VALUES (126, 'Can change software', 32, 'change_software');
INSERT INTO `auth_permission` VALUES (127, 'Can delete software', 32, 'delete_software');
INSERT INTO `auth_permission` VALUES (128, 'Can view software', 32, 'view_software');
INSERT INTO `auth_permission` VALUES (129, 'Can add stator', 33, 'add_stator');
INSERT INTO `auth_permission` VALUES (130, 'Can change stator', 33, 'change_stator');
INSERT INTO `auth_permission` VALUES (131, 'Can delete stator', 33, 'delete_stator');
INSERT INTO `auth_permission` VALUES (132, 'Can view stator', 33, 'view_stator');
INSERT INTO `auth_permission` VALUES (133, 'Can add storage device', 34, 'add_storagedevice');
INSERT INTO `auth_permission` VALUES (134, 'Can change storage device', 34, 'change_storagedevice');
INSERT INTO `auth_permission` VALUES (135, 'Can delete storage device', 34, 'delete_storagedevice');
INSERT INTO `auth_permission` VALUES (136, 'Can view storage device', 34, 'view_storagedevice');
INSERT INTO `auth_permission` VALUES (137, 'Can add tag', 35, 'add_tag');
INSERT INTO `auth_permission` VALUES (138, 'Can change tag', 35, 'change_tag');
INSERT INTO `auth_permission` VALUES (139, 'Can delete tag', 35, 'delete_tag');
INSERT INTO `auth_permission` VALUES (140, 'Can view tag', 35, 'view_tag');
INSERT INTO `auth_permission` VALUES (141, 'Can add top driver', 36, 'add_topdriver');
INSERT INTO `auth_permission` VALUES (142, 'Can change top driver', 36, 'change_topdriver');
INSERT INTO `auth_permission` VALUES (143, 'Can delete top driver', 36, 'delete_topdriver');
INSERT INTO `auth_permission` VALUES (144, 'Can view top driver', 36, 'view_topdriver');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$MQKnUZA38dLS$DHTyre1QJfUdQUnD1r9isHenaC/1gak0soWbfey7dBU=', '2018-12-12 12:06:57.672235', 1, 'fpl117', '', '', 'peilun.fu117@gmail.com', 1, 1, '2018-12-12 12:02:23.105740');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-12-12 12:09:04.483995', '1', 'EquipmentGroup object (1)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (2, '2018-12-12 12:10:47.231130', '1', 'TopDriver object (1)', 1, '[{\"added\": {}}]', 36, 1);
INSERT INTO `django_admin_log` VALUES (3, '2018-12-12 12:14:20.986582', '1', 'EquipmentGroup object (1)', 2, '[{\"changed\": {\"fields\": [\"equipment_group_type\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (4, '2018-12-12 18:12:26.389565', '1', 'Top Driver', 2, '[]', 14, 1);
INSERT INTO `django_admin_log` VALUES (5, '2018-12-12 18:12:52.609981', '1', 'Top Driver', 2, '[{\"changed\": {\"fields\": [\"equipment_group_type\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (6, '2018-12-12 18:13:04.406455', '1', 'Top Driver', 2, '[{\"changed\": {\"fields\": [\"equipment_group_type\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (7, '2018-12-12 18:24:09.268875', '1', 'Top Driver', 2, '[]', 14, 1);
INSERT INTO `django_admin_log` VALUES (8, '2018-12-12 18:27:55.641210', '2', 'Propeller 1', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (9, '2018-12-12 18:28:21.436765', '3', 'Propeller 2', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (10, '2018-12-12 18:28:42.993239', '4', 'Propeller 3', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (11, '2018-12-12 18:29:02.658659', '5', 'Propeller 4', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (12, '2018-12-12 18:29:28.292644', '6', 'Propeller 5', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (13, '2018-12-12 18:29:59.460207', '7', 'Propeller 6', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (14, '2018-12-12 18:30:28.874727', '8', 'Generator 1', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (15, '2018-12-12 18:31:00.932393', '9', 'Generator 2', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (16, '2018-12-12 18:31:22.900939', '10', 'Generator 3', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (17, '2018-12-12 18:31:46.382251', '11', 'Generator 4', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (18, '2018-12-12 18:32:07.538334', '12', 'Generator 5', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (19, '2018-12-12 18:32:35.973827', '13', 'Generator 6', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (20, '2018-12-12 18:32:55.747299', '1', 'Propeller object (1)', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (21, '2018-12-12 18:34:54.488969', '2', 'Propeller object (2)', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (22, '2018-12-12 18:35:01.263515', '3', 'Propeller object (3)', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (23, '2018-12-12 18:35:10.381238', '4', 'Propeller object (4)', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (24, '2018-12-12 18:35:13.487668', '4', 'Propeller object (4)', 2, '[]', 26, 1);
INSERT INTO `django_admin_log` VALUES (25, '2018-12-12 18:35:19.717670', '5', 'Propeller object (5)', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (26, '2018-12-12 18:35:27.779765', '6', 'Propeller object (6)', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` VALUES (27, '2018-12-12 18:37:40.961541', '1', 'Location object (1)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (28, '2018-12-12 18:38:00.487232', '2', 'Location object (2)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (29, '2018-12-12 18:38:19.925923', '3', 'Location object (3)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (30, '2018-12-12 18:41:08.281151', '1', 'Top Driver', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (31, '2018-12-12 18:41:15.380102', '2', 'Propeller 1', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (32, '2018-12-12 18:41:23.021459', '3', 'Propeller 2', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (33, '2018-12-12 18:41:28.177636', '4', 'Propeller 3', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (34, '2018-12-12 18:41:33.331839', '5', 'Propeller 4', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (35, '2018-12-12 18:41:40.970935', '6', 'Propeller 5', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (36, '2018-12-12 18:41:49.185796', '7', 'Propeller 6', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (37, '2018-12-12 18:41:55.488418', '8', 'Generator 1', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (38, '2018-12-12 18:42:00.418973', '9', 'Generator 2', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (39, '2018-12-12 18:42:05.741577', '10', 'Generator 3', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (40, '2018-12-12 18:42:19.729067', '11', 'Generator 4', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (41, '2018-12-12 18:42:25.407291', '12', 'Generator 5', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (42, '2018-12-12 18:42:30.948976', '13', 'Generator 6', 2, '[{\"changed\": {\"fields\": [\"location\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (43, '2018-12-12 18:42:59.563053', '1', 'Simens', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (44, '2018-12-12 18:43:06.471568', '2', 'ABB', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (45, '2018-12-12 18:43:29.683868', '3', 'General Electric', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (46, '2018-12-12 18:44:05.311129', '4', 'Rolls Royce', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (47, '2018-12-12 18:44:51.886644', '5', 'VARCO', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (48, '2018-12-12 18:45:24.063104', '1', 'Top Driver', 2, '[{\"changed\": {\"fields\": [\"manufacturer\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (49, '2018-12-12 18:46:57.727539', '1', 'Top Driver', 2, '[{\"changed\": {\"fields\": [\"manufacturer\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (50, '2018-12-12 18:47:04.978833', '1', 'Top Driver', 2, '[{\"changed\": {\"fields\": [\"manufacturer\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (51, '2018-12-12 18:49:37.743737', '1', 'Generator object (1)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (52, '2018-12-12 18:49:45.551023', '2', 'Generator object (2)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (53, '2018-12-12 18:49:54.215488', '3', 'Generator object (3)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (54, '2018-12-12 18:50:00.623517', '4', 'Generator object (4)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (55, '2018-12-12 18:50:09.981087', '5', 'Generator object (5)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (56, '2018-12-12 18:50:20.491096', '6', 'Generator object (6)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (57, '2018-12-12 19:02:22.412586', '1', 'Machine object (1)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (58, '2018-12-12 19:02:57.601645', '2', 'Machine object (2)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (59, '2018-12-12 19:05:23.567892', '3', 'Machine object (3)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (60, '2018-12-12 19:06:36.981556', '4', 'Machine object (4)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (61, '2018-12-12 19:07:21.832517', '5', 'Machine object (5)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (62, '2018-12-12 19:07:45.622059', '3', 'Machine object (3)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (63, '2018-12-12 19:08:56.477809', '6', 'Machine object (6)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (64, '2018-12-12 19:09:46.889636', '7', 'Machine object (7)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (65, '2018-12-12 19:10:27.369528', '8', 'Machine object (8)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (66, '2018-12-12 19:10:57.700757', '9', 'Machine object (9)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (67, '2018-12-12 19:12:54.528451', '10', 'Machine object (10)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (68, '2018-12-12 19:13:38.910401', '11', 'Machine object (11)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (69, '2018-12-12 19:14:17.354663', '12', 'Machine object (12)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (70, '2018-12-12 19:15:13.331558', '13', 'Machine object (13)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (71, '2018-12-12 19:16:06.695255', '14', 'Machine object (14)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (72, '2018-12-12 19:16:49.548762', '15', 'Machine object (15)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (73, '2018-12-12 19:18:50.868617', '1', 'Motor object (1)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (74, '2018-12-12 19:19:55.225975', '2', 'Motor object (2)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (75, '2018-12-12 19:20:26.376557', '3', 'Motor object (3)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (76, '2018-12-12 19:20:59.523033', '4', 'Motor object (4)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (77, '2018-12-12 19:21:26.272985', '5', 'Motor object (5)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (78, '2018-12-12 19:21:47.723669', '6', 'Motor object (6)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (79, '2018-12-12 19:22:04.421701', '7', 'Motor object (7)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (80, '2018-12-12 19:22:21.368737', '8', 'Motor object (8)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (81, '2018-12-12 19:25:41.950117', '1', 'GearBox object (1)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (82, '2018-12-12 19:25:58.741545', '2', 'GearBox object (2)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (83, '2018-12-12 19:26:12.987091', '3', 'GearBox object (3)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (84, '2018-12-12 19:26:27.320975', '4', 'GearBox object (4)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (85, '2018-12-12 19:26:37.440882', '5', 'GearBox object (5)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (86, '2018-12-12 19:26:46.854774', '6', 'GearBox object (6)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (87, '2018-12-12 19:27:02.404058', '7', 'GearBox object (7)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (88, '2018-12-12 19:28:41.294396', '16', 'GE1-Engine', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (89, '2018-12-12 19:29:26.601035', '17', 'GE2-Engine', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (90, '2018-12-12 19:29:58.068401', '18', 'GE3-Engine', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (91, '2018-12-12 19:30:34.150802', '19', 'GE4-Engine', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (92, '2018-12-12 19:31:00.046281', '20', 'GE5-Engine', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (93, '2018-12-12 19:31:36.753343', '21', 'GE6-Engine', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (94, '2018-12-12 19:34:19.865514', '1', 'Engine object (1)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (95, '2018-12-12 19:34:27.505639', '2', 'Engine object (2)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (96, '2018-12-12 19:34:35.503030', '3', 'Engine object (3)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (97, '2018-12-12 19:34:46.019783', '4', 'Engine object (4)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (98, '2018-12-12 19:34:53.570717', '5', 'Engine object (5)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (99, '2018-12-12 19:34:59.498583', '6', 'Engine object (6)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (100, '2018-12-12 19:35:38.435357', '2', 'TD-Driving motor', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (101, '2018-12-12 19:35:45.540266', '1', 'TD-Cooling Motor', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (102, '2018-12-12 19:37:09.608503', '22', 'GE1-Dynamotor', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (103, '2018-12-12 19:37:44.599351', '23', 'GE2-Dynamotor', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (104, '2018-12-12 19:38:21.840948', '24', 'GE3-Dynamotor', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (105, '2018-12-12 19:40:15.782551', '25', 'GE4-Dynamotor', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (106, '2018-12-12 19:40:49.539941', '26', 'GE5-Dynamotor', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (107, '2018-12-12 19:41:15.982633', '27', 'GE6-Dynamotor', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (108, '2018-12-12 19:42:21.264002', '9', 'Motor object (9)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (109, '2018-12-12 19:42:44.785804', '10', 'Motor object (10)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (110, '2018-12-12 19:43:10.496043', '11', 'Motor object (11)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (111, '2018-12-12 19:43:27.009063', '12', 'Motor object (12)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (112, '2018-12-12 19:43:44.476592', '13', 'Motor object (13)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (113, '2018-12-12 19:44:03.351629', '14', 'Motor object (14)', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` VALUES (114, '2018-12-12 20:06:52.999522', '1', 'Sensor object (1)', 1, '[{\"added\": {}}]', 29, 1);
INSERT INTO `django_admin_log` VALUES (115, '2018-12-12 20:31:23.585456', '1', '<0>  TD1', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 29, 1);
INSERT INTO `django_admin_log` VALUES (116, '2018-12-12 21:06:49.689953', '1', 'MeasurePoint object (1)', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (117, '2018-12-12 21:07:21.713651', '2', 'MeasurePoint object (2)', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` VALUES (118, '2018-12-12 21:08:00.133431', '2', '<Accelerator>  TD2', 1, '[{\"added\": {}}]', 29, 1);
INSERT INTO `django_admin_log` VALUES (119, '2018-12-12 21:09:09.845367', '3', '<Accelerator>  TD3', 1, '[{\"added\": {}}]', 29, 1);
INSERT INTO `django_admin_log` VALUES (120, '2018-12-12 21:09:39.768441', '4', '<Accelerator>  TD4', 1, '[{\"added\": {}}]', 29, 1);
INSERT INTO `django_admin_log` VALUES (121, '2018-12-12 21:09:50.767770', '2', 'MeasurePoint object (2)', 2, '[{\"changed\": {\"fields\": [\"sensor\"]}}]', 22, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'assets', 'bearing');
INSERT INTO `django_content_type` VALUES (8, 'assets', 'component');
INSERT INTO `django_content_type` VALUES (9, 'assets', 'contract');
INSERT INTO `django_content_type` VALUES (10, 'assets', 'cpu');
INSERT INTO `django_content_type` VALUES (11, 'assets', 'datacollector');
INSERT INTO `django_content_type` VALUES (12, 'assets', 'disk');
INSERT INTO `django_content_type` VALUES (13, 'assets', 'engine');
INSERT INTO `django_content_type` VALUES (14, 'assets', 'equipmentgroup');
INSERT INTO `django_content_type` VALUES (15, 'assets', 'gear');
INSERT INTO `django_content_type` VALUES (16, 'assets', 'gearbox');
INSERT INTO `django_content_type` VALUES (17, 'assets', 'generator');
INSERT INTO `django_content_type` VALUES (18, 'assets', 'itasset');
INSERT INTO `django_content_type` VALUES (19, 'assets', 'location');
INSERT INTO `django_content_type` VALUES (20, 'assets', 'machine');
INSERT INTO `django_content_type` VALUES (21, 'assets', 'manufacturer');
INSERT INTO `django_content_type` VALUES (22, 'assets', 'measurepoint');
INSERT INTO `django_content_type` VALUES (23, 'assets', 'motor');
INSERT INTO `django_content_type` VALUES (24, 'assets', 'networkdevice');
INSERT INTO `django_content_type` VALUES (25, 'assets', 'nic');
INSERT INTO `django_content_type` VALUES (26, 'assets', 'propeller');
INSERT INTO `django_content_type` VALUES (27, 'assets', 'ram');
INSERT INTO `django_content_type` VALUES (28, 'assets', 'rotor');
INSERT INTO `django_content_type` VALUES (29, 'assets', 'sensor');
INSERT INTO `django_content_type` VALUES (30, 'assets', 'server');
INSERT INTO `django_content_type` VALUES (31, 'assets', 'signalcollected');
INSERT INTO `django_content_type` VALUES (32, 'assets', 'software');
INSERT INTO `django_content_type` VALUES (33, 'assets', 'stator');
INSERT INTO `django_content_type` VALUES (34, 'assets', 'storagedevice');
INSERT INTO `django_content_type` VALUES (35, 'assets', 'tag');
INSERT INTO `django_content_type` VALUES (36, 'assets', 'topdriver');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-12-10 18:16:42.122446');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2018-12-10 18:16:42.780687');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-12-10 18:16:42.958718');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-12-10 18:16:42.970686');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2018-12-10 18:16:42.980659');
INSERT INTO `django_migrations` VALUES (6, 'assets', '0001_initial', '2018-12-10 18:16:49.417200');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2018-12-10 18:16:49.521920');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2018-12-10 18:16:49.586748');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2018-12-10 18:16:49.628634');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2018-12-10 18:16:49.642597');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2018-12-10 18:16:49.690469');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2018-12-10 18:16:49.694458');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2018-12-10 18:16:49.707424');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2018-12-10 18:16:49.748315');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2018-12-10 18:16:49.792198');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2018-12-10 18:16:49.845056');
INSERT INTO `django_migrations` VALUES (17, 'assets', '0002_auto_20181212_1823', '2018-12-12 18:23:37.185988');
INSERT INTO `django_migrations` VALUES (18, 'assets', '0003_auto_20181212_1848', '2018-12-12 18:48:10.866174');
INSERT INTO `django_migrations` VALUES (19, 'assets', '0004_auto_20181212_2007', '2018-12-12 20:07:10.049344');
INSERT INTO `django_migrations` VALUES (20, 'assets', '0005_auto_20181212_2032', '2018-12-12 20:32:18.701828');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5w6bd2bl0mbe8a6w1xwc1slmkxlc6e7i', 'YzU1MWVkOTgxNGExMjc4MjA4ZDI5MDhhNmMzOGVkYzBjMTRmYTJjNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNDZkOTZlNDUzYzY1MTczNjJmNjNiMTcxYTQ0MWQ1N2IwMzAzNzY5In0=', '2018-12-26 12:06:57.678219');

SET FOREIGN_KEY_CHECKS = 1;
