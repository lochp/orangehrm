-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2016 at 11:08 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ohm_vn`
--
CREATE DATABASE IF NOT EXISTS `ohm_vn` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ohm_vn`;

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `dashboard_get_subunit_parent_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `dashboard_get_subunit_parent_id` (`id` INT) RETURNS INT(11) READS SQL DATA
    DETERMINISTIC
BEGIN
                SELECT (SELECT t2.id 
                               FROM ohrm_subunit t2 
                               WHERE t2.lft < t1.lft AND t2.rgt > t1.rgt    
                               ORDER BY t2.rgt-t1.rgt ASC LIMIT 1) INTO @parent
                FROM ohrm_subunit t1 WHERE t1.id = id;

                RETURN @parent;

                END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `abstract_display_field`
--

DROP TABLE IF EXISTS `abstract_display_field`;
CREATE TABLE `abstract_display_field` (
  `id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` text NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL,
  `display_field_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `abstract_display_field`
--

TRUNCATE TABLE `abstract_display_field`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_config`
--

DROP TABLE IF EXISTS `hs_hr_config`;
CREATE TABLE `hs_hr_config` (
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(512) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_config`
--

TRUNCATE TABLE `hs_hr_config`;
--
-- Dumping data for table `hs_hr_config`
--

INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('admin.default_workshift_end_time', '17:00');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('admin.default_workshift_start_time', '09:00');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('admin.localization.default_date_format', 'Y-m-d');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('admin.localization.default_language', 'en_US');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('admin.localization.use_browser_language', 'No');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('admin.product_type', 'os');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('attendanceEmpEditSubmitted', 'No');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('attendanceSupEditSubmitted', 'No');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('authorize_user_role_manager_class', 'BasicUserRoleManager');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('beacon.activation_acceptance_status', 'off');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('beacon.activiation_status', 'on');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('beacon.company_name', '');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('beacon.flash_period', '120');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('beacon.lock', 'unlocked');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('beacon.next_flash_time', '0000-00-00');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('beacon.uuid', 'dleNjps5Kop1lw==');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('csrf_secret', '1k9hisom431e718v3sm7oe8hb6vvdf7t1jvo8cbh6of54bvj436');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('domain.name', 'localhost');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('hsp_accrued_last_updated', '0000-00-00');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('hsp_current_plan', '0');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('hsp_used_last_updated', '0000-00-00');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('include_supervisor_chain', 'No');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('ldap_domain_name', '');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('ldap_port', '');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('ldap_server', '');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('ldap_status', '');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('leave.entitlement_consumption_algorithm', 'FIFOEntitlementConsumptionStrategy');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('leave.include_pending_leave_in_balance', '1');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('leave.leavePeriodStatus', '1');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('leave.work_schedule_implementation', 'BasicWorkSchedule');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('leave_period_defined', 'Yes');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('openId.provider.added', 'off');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('pim_show_deprecated_fields', '1');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('pim_show_sin', '0');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('pim_show_ssn', '0');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('pim_show_tax_exemptions', '0');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('report.mysql_group_concat_max_len', '2048');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('showSIN', '0');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('showSSN', '0');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('showTaxExemptions', '0');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('themeName', 'default');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('timesheet_period_and_start_date', '<TimesheetPeriod><PeriodType>Monthly</PeriodType><ClassName>MonthlyTimesheetPeriod</ClassName><StartDate>1</StartDate><Heading>Month</Heading></TimesheetPeriod>');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('timesheet_period_set', 'Yes');
INSERT INTO `hs_hr_config` (`key`, `value`) VALUES('timesheet_time_format', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_country`
--

DROP TABLE IF EXISTS `hs_hr_country`;
CREATE TABLE `hs_hr_country` (
  `cou_code` char(2) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `cou_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_country`
--

TRUNCATE TABLE `hs_hr_country`;
--
-- Dumping data for table `hs_hr_country`
--

INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AD', 'ANDORRA', 'Andorra', 'AND', 20);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AL', 'ALBANIA', 'Albania', 'ALB', 8);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AM', 'ARMENIA', 'Armenia', 'ARM', 51);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AO', 'ANGOLA', 'Angola', 'AGO', 24);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AR', 'ARGENTINA', 'Argentina', 'ARG', 32);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AT', 'AUSTRIA', 'Austria', 'AUT', 40);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AU', 'AUSTRALIA', 'Australia', 'AUS', 36);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AW', 'ARUBA', 'Aruba', 'ABW', 533);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BB', 'BARBADOS', 'Barbados', 'BRB', 52);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BE', 'BELGIUM', 'Belgium', 'BEL', 56);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BI', 'BURUNDI', 'Burundi', 'BDI', 108);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BJ', 'BENIN', 'Benin', 'BEN', 204);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BM', 'BERMUDA', 'Bermuda', 'BMU', 60);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BR', 'BRAZIL', 'Brazil', 'BRA', 76);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BT', 'BHUTAN', 'Bhutan', 'BTN', 64);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BW', 'BOTSWANA', 'Botswana', 'BWA', 72);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BY', 'BELARUS', 'Belarus', 'BLR', 112);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('BZ', 'BELIZE', 'Belize', 'BLZ', 84);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CA', 'CANADA', 'Canada', 'CAN', 124);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CG', 'CONGO', 'Congo', 'COG', 178);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CL', 'CHILE', 'Chile', 'CHL', 152);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CM', 'CAMEROON', 'Cameroon', 'CMR', 120);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CN', 'CHINA', 'China', 'CHN', 156);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CO', 'COLOMBIA', 'Colombia', 'COL', 170);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CU', 'CUBA', 'Cuba', 'CUB', 192);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CY', 'CYPRUS', 'Cyprus', 'CYP', 196);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('DE', 'GERMANY', 'Germany', 'DEU', 276);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('DK', 'DENMARK', 'Denmark', 'DNK', 208);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('DM', 'DOMINICA', 'Dominica', 'DMA', 212);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('DZ', 'ALGERIA', 'Algeria', 'DZA', 12);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('EC', 'ECUADOR', 'Ecuador', 'ECU', 218);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('EE', 'ESTONIA', 'Estonia', 'EST', 233);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('EG', 'EGYPT', 'Egypt', 'EGY', 818);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ER', 'ERITREA', 'Eritrea', 'ERI', 232);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ES', 'SPAIN', 'Spain', 'ESP', 724);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('FI', 'FINLAND', 'Finland', 'FIN', 246);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('FJ', 'FIJI', 'Fiji', 'FJI', 242);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('FR', 'FRANCE', 'France', 'FRA', 250);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GA', 'GABON', 'Gabon', 'GAB', 266);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GD', 'GRENADA', 'Grenada', 'GRD', 308);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GE', 'GEORGIA', 'Georgia', 'GEO', 268);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GH', 'GHANA', 'Ghana', 'GHA', 288);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GL', 'GREENLAND', 'Greenland', 'GRL', 304);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GM', 'GAMBIA', 'Gambia', 'GMB', 270);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GN', 'GUINEA', 'Guinea', 'GIN', 324);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GR', 'GREECE', 'Greece', 'GRC', 300);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GU', 'GUAM', 'Guam', 'GUM', 316);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('GY', 'GUYANA', 'Guyana', 'GUY', 328);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('HN', 'HONDURAS', 'Honduras', 'HND', 340);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('HR', 'CROATIA', 'Croatia', 'HRV', 191);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('HT', 'HAITI', 'Haiti', 'HTI', 332);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('HU', 'HUNGARY', 'Hungary', 'HUN', 348);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ID', 'INDONESIA', 'Indonesia', 'IDN', 360);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IE', 'IRELAND', 'Ireland', 'IRL', 372);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IL', 'ISRAEL', 'Israel', 'ISR', 376);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IN', 'INDIA', 'India', 'IND', 356);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IQ', 'IRAQ', 'Iraq', 'IRQ', 368);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IS', 'ICELAND', 'Iceland', 'ISL', 352);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('IT', 'ITALY', 'Italy', 'ITA', 380);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('JM', 'JAMAICA', 'Jamaica', 'JAM', 388);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('JO', 'JORDAN', 'Jordan', 'JOR', 400);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('JP', 'JAPAN', 'Japan', 'JPN', 392);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KE', 'KENYA', 'Kenya', 'KEN', 404);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KM', 'COMOROS', 'Comoros', 'COM', 174);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KW', 'KUWAIT', 'Kuwait', 'KWT', 414);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LB', 'LEBANON', 'Lebanon', 'LBN', 422);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LR', 'LIBERIA', 'Liberia', 'LBR', 430);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LS', 'LESOTHO', 'Lesotho', 'LSO', 426);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LV', 'LATVIA', 'Latvia', 'LVA', 428);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MA', 'MOROCCO', 'Morocco', 'MAR', 504);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MC', 'MONACO', 'Monaco', 'MCO', 492);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ML', 'MALI', 'Mali', 'MLI', 466);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MM', 'MYANMAR', 'Myanmar', 'MMR', 104);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MO', 'MACAO', 'Macao', 'MAC', 446);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MT', 'MALTA', 'Malta', 'MLT', 470);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MV', 'MALDIVES', 'Maldives', 'MDV', 462);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MW', 'MALAWI', 'Malawi', 'MWI', 454);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MX', 'MEXICO', 'Mexico', 'MEX', 484);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NA', 'NAMIBIA', 'Namibia', 'NAM', 516);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NE', 'NIGER', 'Niger', 'NER', 562);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NG', 'NIGERIA', 'Nigeria', 'NGA', 566);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NO', 'NORWAY', 'Norway', 'NOR', 578);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NP', 'NEPAL', 'Nepal', 'NPL', 524);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NR', 'NAURU', 'Nauru', 'NRU', 520);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NU', 'NIUE', 'Niue', 'NIU', 570);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('OM', 'OMAN', 'Oman', 'OMN', 512);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PA', 'PANAMA', 'Panama', 'PAN', 591);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PE', 'PERU', 'Peru', 'PER', 604);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PL', 'POLAND', 'Poland', 'POL', 616);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PT', 'PORTUGAL', 'Portugal', 'PRT', 620);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PW', 'PALAU', 'Palau', 'PLW', 585);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('QA', 'QATAR', 'Qatar', 'QAT', 634);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('RE', 'REUNION', 'Reunion', 'REU', 638);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('RO', 'ROMANIA', 'Romania', 'ROM', 642);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('RW', 'RWANDA', 'Rwanda', 'RWA', 646);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SD', 'SUDAN', 'Sudan', 'SDN', 736);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SE', 'SWEDEN', 'Sweden', 'SWE', 752);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SG', 'SINGAPORE', 'Singapore', 'SGP', 702);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SM', 'SAN MARINO', 'San Marino', 'SMR', 674);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SN', 'SENEGAL', 'Senegal', 'SEN', 686);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SO', 'SOMALIA', 'Somalia', 'SOM', 706);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SR', 'SURINAME', 'Suriname', 'SUR', 740);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TD', 'CHAD', 'Chad', 'TCD', 148);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TG', 'TOGO', 'Togo', 'TGO', 768);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TH', 'THAILAND', 'Thailand', 'THA', 764);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TK', 'TOKELAU', 'Tokelau', 'TKL', 772);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TN', 'TUNISIA', 'Tunisia', 'TUN', 788);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TO', 'TONGA', 'Tonga', 'TON', 776);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TR', 'TURKEY', 'Turkey', 'TUR', 792);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TV', 'TUVALU', 'Tuvalu', 'TUV', 798);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan', 'TWN', 158);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('UA', 'UKRAINE', 'Ukraine', 'UKR', 804);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('UG', 'UGANDA', 'Uganda', 'UGA', 800);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('US', 'UNITED STATES', 'United States', 'USA', 840);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('UY', 'URUGUAY', 'Uruguay', 'URY', 858);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('VU', 'VANUATU', 'Vanuatu', 'VUT', 548);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('WS', 'SAMOA', 'Samoa', 'WSM', 882);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('YE', 'YEMEN', 'Yemen', 'YEM', 887);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('YT', 'MAYOTTE', 'Mayotte', NULL, NULL);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894);
INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_currency_type`
--

DROP TABLE IF EXISTS `hs_hr_currency_type`;
CREATE TABLE `hs_hr_currency_type` (
  `code` int(11) NOT NULL DEFAULT '0',
  `currency_id` char(3) NOT NULL DEFAULT '',
  `currency_name` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_currency_type`
--

TRUNCATE TABLE `hs_hr_currency_type`;
--
-- Dumping data for table `hs_hr_currency_type`
--

INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(3, 'AED', 'Utd. Arab Emir. Dirham');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(4, 'AFN', 'Afghanistan Afghani');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(5, 'ALL', 'Albanian Lek');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(6, 'ANG', 'NL Antillian Guilder');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(7, 'AOR', 'Angolan New Kwanza');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(177, 'ARP', 'Argentina Pesos');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(8, 'ARS', 'Argentine Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(10, 'AUD', 'Australian Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(11, 'AWG', 'Aruban Florin');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(12, 'BBD', 'Barbados Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(13, 'BDT', 'Bangladeshi Taka');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(15, 'BGL', 'Bulgarian Lev');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(16, 'BHD', 'Bahraini Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(17, 'BIF', 'Burundi Franc');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(18, 'BMD', 'Bermudian Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(19, 'BND', 'Brunei Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(20, 'BOB', 'Bolivian Boliviano');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(21, 'BRL', 'Brazilian Real');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(22, 'BSD', 'Bahamian Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(23, 'BTN', 'Bhutan Ngultrum');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(24, 'BWP', 'Botswana Pula');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(25, 'BZD', 'Belize Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(26, 'CAD', 'Canadian Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(27, 'CHF', 'Swiss Franc');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(28, 'CLP', 'Chilean Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(29, 'CNY', 'Chinese Yuan Renminbi');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(30, 'COP', 'Colombian Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(31, 'CRC', 'Costa Rican Colon');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(32, 'CUP', 'Cuban Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(33, 'CVE', 'Cape Verde Escudo');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(34, 'CYP', 'Cyprus Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(171, 'CZK', 'Czech Koruna');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(37, 'DJF', 'Djibouti Franc');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(38, 'DKK', 'Danish Krona');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(39, 'DOP', 'Dominican Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(40, 'DZD', 'Algerian Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(41, 'ECS', 'Ecuador Sucre');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(43, 'EEK', 'Estonian Krona');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(44, 'EGP', 'Egyptian Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(46, 'ETB', 'Ethiopian Birr');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(42, 'EUR', 'Euro');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(48, 'FJD', 'Fiji Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(49, 'FKP', 'Falkland Islands Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(51, 'GBP', 'Pound Sterling');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(52, 'GHC', 'Ghanaian Cedi');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(53, 'GIP', 'Gibraltar Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(54, 'GMD', 'Gambian Dalasi');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(55, 'GNF', 'Guinea Franc');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(57, 'GTQ', 'Guatemalan Quetzal');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(58, 'GYD', 'Guyanan Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(59, 'HKD', 'Hong Kong Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(60, 'HNL', 'Honduran Lempira');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(61, 'HRK', 'Croatian Kuna');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(62, 'HTG', 'Haitian Gourde');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(63, 'HUF', 'Hungarian Forint');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(64, 'IDR', 'Indonesian Rupiah');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(66, 'ILS', 'Israeli New Shekel');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(67, 'INR', 'Indian Rupee');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(68, 'IQD', 'Iraqi Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(69, 'IRR', 'Iranian Rial');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(70, 'ISK', 'Iceland Krona');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(72, 'JMD', 'Jamaican Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(73, 'JOD', 'Jordanian Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(74, 'JPY', 'Japanese Yen');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(75, 'KES', 'Kenyan Shilling');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(76, 'KHR', 'Kampuchean Riel');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(77, 'KMF', 'Comoros Franc');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(78, 'KPW', 'North Korean Won');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(79, 'KRW', 'Korean Won');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(80, 'KWD', 'Kuwaiti Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(81, 'KYD', 'Cayman Islands Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(82, 'KZT', 'Kazakhstan Tenge');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(83, 'LAK', 'Lao Kip');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(84, 'LBP', 'Lebanese Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(85, 'LKR', 'Sri Lanka Rupee');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(86, 'LRD', 'Liberian Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(87, 'LSL', 'Lesotho Loti');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(88, 'LTL', 'Lithuanian Litas');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(90, 'LVL', 'Latvian Lats');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(91, 'LYD', 'Libyan Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(92, 'MAD', 'Moroccan Dirham');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(93, 'MGF', 'Malagasy Franc');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(94, 'MMK', 'Myanmar Kyat');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(95, 'MNT', 'Mongolian Tugrik');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(96, 'MOP', 'Macau Pataca');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(97, 'MRO', 'Mauritanian Ouguiya');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(98, 'MTL', 'Maltese Lira');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(99, 'MUR', 'Mauritius Rupee');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(100, 'MVR', 'Maldive Rufiyaa');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(101, 'MWK', 'Malawi Kwacha');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(102, 'MXN', 'Mexican New Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(172, 'MXP', 'Mexican Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(103, 'MYR', 'Malaysian Ringgit');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(104, 'MZM', 'Mozambique Metical');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(105, 'NAD', 'Namibia Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(106, 'NGN', 'Nigerian Naira');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(107, 'NIO', 'Nicaraguan Cordoba Oro');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(109, 'NOK', 'Norwegian Krona');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(110, 'NPR', 'Nepalese Rupee');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(111, 'NZD', 'New Zealand Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(112, 'OMR', 'Omani Rial');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(113, 'PAB', 'Panamanian Balboa');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(114, 'PEN', 'Peruvian Nuevo Sol');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(115, 'PGK', 'Papua New Guinea Kina');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(116, 'PHP', 'Philippine Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(117, 'PKR', 'Pakistan Rupee');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(118, 'PLN', 'Polish Zloty');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(120, 'PYG', 'Paraguay Guarani');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(121, 'QAR', 'Qatari Rial');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(122, 'ROL', 'Romanian Leu');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(123, 'RUB', 'Russian Rouble');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(180, 'RUR', 'Russia Rubles');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(173, 'SAR', 'Saudi Arabia Riyal');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(125, 'SBD', 'Solomon Islands Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(126, 'SCR', 'Seychelles Rupee');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(127, 'SDD', 'Sudanese Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(128, 'SDP', 'Sudanese Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(129, 'SEK', 'Swedish Krona');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(131, 'SGD', 'Singapore Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(132, 'SHP', 'St. Helena Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(130, 'SKK', 'Slovak Koruna');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(135, 'SLL', 'Sierra Leone Leone');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(136, 'SOS', 'Somali Shilling');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(137, 'SRD', 'Surinamese Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(138, 'STD', 'Sao Tome/Principe Dobra');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(139, 'SVC', 'El Salvador Colon');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(140, 'SYP', 'Syrian Pound');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(141, 'SZL', 'Swaziland Lilangeni');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(142, 'THB', 'Thai Baht');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(143, 'TND', 'Tunisian Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(144, 'TOP', 'Tongan Pa''anga');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(145, 'TRL', 'Turkish Lira');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(146, 'TTD', 'Trinidad/Tobago Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(147, 'TWD', 'Taiwan Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(148, 'TZS', 'Tanzanian Shilling');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(149, 'UAH', 'Ukraine Hryvnia');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(150, 'UGX', 'Uganda Shilling');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(151, 'USD', 'United States Dollar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(152, 'UYP', 'Uruguayan Peso');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(153, 'VEB', 'Venezuelan Bolivar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(154, 'VND', 'Vietnamese Dong');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(155, 'VUV', 'Vanuatu Vatu');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(156, 'WST', 'Samoan Tala');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(158, 'XAF', 'CFA Franc BEAC');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(159, 'XAG', 'Silver (oz.)');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(160, 'XAU', 'Gold (oz.)');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(161, 'XCD', 'Eastern Caribbean Dollars');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(179, 'XDR', 'IMF Special Drawing Right');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(162, 'XOF', 'CFA Franc BCEAO');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(163, 'XPD', 'Palladium (oz.)');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(164, 'XPF', 'CFP Franc');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(165, 'XPT', 'Platinum (oz.)');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(166, 'YER', 'Yemeni Riyal');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(167, 'YUM', 'Yugoslavian Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(175, 'YUN', 'Yugoslav Dinar');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(168, 'ZAR', 'South African Rand');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(176, 'ZMK', 'Zambian Kwacha');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(169, 'ZRN', 'New Zaire');
INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES(170, 'ZWD', 'Zimbabwe Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_export`
--

DROP TABLE IF EXISTS `hs_hr_custom_export`;
CREATE TABLE `hs_hr_custom_export` (
  `export_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `headings` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_custom_export`
--

TRUNCATE TABLE `hs_hr_custom_export`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_fields`
--

DROP TABLE IF EXISTS `hs_hr_custom_fields`;
CREATE TABLE `hs_hr_custom_fields` (
  `field_num` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `screen` varchar(100) DEFAULT NULL,
  `extra_data` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_custom_fields`
--

TRUNCATE TABLE `hs_hr_custom_fields`;
--
-- Dumping data for table `hs_hr_custom_fields`
--

INSERT INTO `hs_hr_custom_fields` (`field_num`, `name`, `type`, `screen`, `extra_data`) VALUES(1, 'Timesheet Required', 1, 'job', 'Yes,No');
INSERT INTO `hs_hr_custom_fields` (`field_num`, `name`, `type`, `screen`, `extra_data`) VALUES(2, 'Authorize Click on Timesheet Items', 1, 'job', 'Yes,No');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_import`
--

DROP TABLE IF EXISTS `hs_hr_custom_import`;
CREATE TABLE `hs_hr_custom_import` (
  `import_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `has_heading` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_custom_import`
--

TRUNCATE TABLE `hs_hr_custom_import`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_district`
--

DROP TABLE IF EXISTS `hs_hr_district`;
CREATE TABLE `hs_hr_district` (
  `district_code` varchar(13) NOT NULL DEFAULT '',
  `district_name` varchar(50) DEFAULT NULL,
  `province_code` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_district`
--

TRUNCATE TABLE `hs_hr_district`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_employee`
--

DROP TABLE IF EXISTS `hs_hr_employee`;
CREATE TABLE `hs_hr_employee` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `employee_id` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(100) NOT NULL DEFAULT '',
  `emp_firstname` varchar(100) NOT NULL DEFAULT '',
  `emp_middle_name` varchar(100) NOT NULL DEFAULT '',
  `emp_nick_name` varchar(100) DEFAULT '',
  `emp_smoker` smallint(6) DEFAULT '0',
  `ethnic_race_code` varchar(13) DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `nation_code` int(4) DEFAULT NULL,
  `emp_gender` smallint(6) DEFAULT NULL,
  `emp_marital_status` varchar(20) DEFAULT NULL,
  `emp_ssn_num` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `emp_sin_num` varchar(100) DEFAULT '',
  `emp_other_id` varchar(100) DEFAULT '',
  `emp_dri_lice_num` varchar(100) DEFAULT '',
  `emp_dri_lice_exp_date` date DEFAULT NULL,
  `emp_military_service` varchar(100) DEFAULT '',
  `emp_status` int(13) DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `eeo_cat_code` int(11) DEFAULT NULL,
  `work_station` int(6) DEFAULT NULL,
  `emp_street1` varchar(100) DEFAULT '',
  `emp_street2` varchar(100) DEFAULT '',
  `city_code` varchar(100) DEFAULT '',
  `coun_code` varchar(100) DEFAULT '',
  `provin_code` varchar(100) DEFAULT '',
  `emp_zipcode` varchar(20) DEFAULT NULL,
  `emp_hm_telephone` varchar(50) DEFAULT NULL,
  `emp_mobile` varchar(50) DEFAULT NULL,
  `emp_work_telephone` varchar(50) DEFAULT NULL,
  `emp_work_email` varchar(50) DEFAULT NULL,
  `sal_grd_code` varchar(13) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `emp_oth_email` varchar(50) DEFAULT NULL,
  `termination_id` int(4) DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_employee`
--

TRUNCATE TABLE `hs_hr_employee`;
--
-- Dumping data for table `hs_hr_employee`
--

INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(2, '001', 'Tran', 'Thong', '', '', 0, NULL, NULL, 189, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '0', '', '', '', '', '', 'xavier.glenard@upskills.com', NULL, '2014-07-03', '', NULL, 'Yes', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(4, '0004', 'You', 'Youhou', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, 4, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, 'xavier.glenard@upskills.com', NULL, NULL, NULL, NULL, 'Yes', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(5, '015', 'Chen', 'Chuangchuang', '', '', 0, NULL, '1990-11-22', 40, 2, 'Married', '', '', '', '', NULL, '', 1, NULL, 10, 2, 'Blk 29 Tanglin Halt Road, #01-144', '', 'Singapore', 'SG', 'Singapore', '141029', '', '8385 2173', '', 'xavier.glenard@upskills.com', NULL, '2016-10-01', 'chuangchuang@dbs.com', NULL, 'Yes', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(6, '016', 'Squalli', 'Driss', '', '', 0, NULL, '1983-03-02', 64, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '70 Dakota Crescent, #12-03', '', 'Singapore', 'SG', 'Singapore', '399941', '', '', '', 'xavier.glenard@upskills.com', NULL, NULL, 'drisssqualli@dbs.com', NULL, 'Yes', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(7, '022', 'Kante', 'Djeinabou', '', '', 0, NULL, '1977-08-26', 64, 2, 'Married', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '10A Hougang Street 11', '#09-35', 'Singapore', 'SG', 'Singapore', '534079', '', '9636 0527', '', 'xavier.glenard@upskills.com', NULL, NULL, 'djeindiallo@gmail.com', NULL, 'Yes', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(8, '014', 'Shuo', 'Jia', '', '', 0, NULL, '1978-11-12', 40, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '81 Pasir Ris Grove, Unit 06-48', '', 'Singapore', 'SG', 'Singapore', '518210', '', '9066 1620', '', 'xavier.glenard@upskills.com', NULL, NULL, 'jiashuo@dbs.com', NULL, 'Yes', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(9, '011', 'Huang', 'Jianxiong', '', '', 0, NULL, '1988-11-26', 40, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, 10, 2, 'The Medley #207, Lor G 66, Telok Kurau', '', 'Singapore', 'SG', 'Singapore', 'The Medley', '', '8303 5145', '', NULL, NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(10, '017', 'Teixeira', 'Kishi', '', '', 0, NULL, '1963-11-22', 35, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '185 Toa Payoh Central, Unit #03-326		', '', 'Singapore', 'SG', 'Singapore', '310185', '', '8322-6309', '', 'xavier.glenard@upskills.com', NULL, NULL, 'kishi@dbs.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(11, '010', 'Megaides', 'Marc', '', '', 0, NULL, '1980-08-02', 64, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, 10, 2, 'Unit 8', '162 Emerald Hill Road Singapore  ', 'Singapore', 'FR', 'Singapore', '229426', '+65 84039128', '0033667124180', '', NULL, NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(12, '18', 'Shuo', 'Sun', '', '', 0, NULL, '1987-10-13', 40, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, 10, 2, ' #10-234, 119B Kim Tian Road		', '', 'Singapore', 'SG', 'Singapore', '162119', '', '8710 6852', '', NULL, NULL, NULL, 'sunshuo@dbs.com', 2, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(13, '019', 'Winata', 'Yoppy', '', '', 0, NULL, '1981-04-18', 83, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, 10, 2, 'Blk445 ANG MO KIO AVENUE 10 #08-1639 ', '', 'Singapore', 'SG', 'Singapore', '560445', '', '96651171', '', NULL, NULL, NULL, 'yoppywinata@dbs.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(14, '021', 'Jean', 'Nadia', '', '', 0, NULL, '1992-01-09', 83, 2, 'Single', '', '', '', '', NULL, '', 1, NULL, 11, 3, 'Blk 379 Clementi Avenue 5, #03-364		', '', 'Singapore', 'SG', 'Singapore', '120379', '', '84814588', '', NULL, NULL, '2014-04-07', 'nadiajeanw@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(15, '002', 'Do', 'Van Anh', '', '', 0, NULL, NULL, 189, 2, 'Married', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '0', '', '', '', '', '', NULL, NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(20, '23', 'Guness', 'Varsha', '', '', 0, NULL, '1990-01-12', 115, 2, 'Single', '', '', '', '', NULL, '', NULL, NULL, 11, 4, '330 Bukit Batok Street 33, #07-177', '', 'Singapore', 'SG', 'Singapore', '650330', '', '94505639', '', NULL, NULL, NULL, 'varsha.guness@gmail.com', 3, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(23, '25', 'Ng', 'Jun Hao', '', '', 0, NULL, '1989-01-02', 159, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, 10, 2, 'Jurong West Street 64', 'Blk 678D, #05-353', 'Singapore', 'SG', 'Singapore', '644678', '', '90662697', '', '', NULL, NULL, 'ngjunhao@outlook.com', 5, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(24, '026', 'Hong', 'Ge', '', '', 0, NULL, '1979-01-15', NULL, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, 10, 2, 'The Stellar, #04-29', '20 West Coast Road ', 'Singapore', 'SG', 'Singapore', '127308', '', '9172 6878', '', '', NULL, NULL, 'gehong30@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(25, '027', 'Gu', 'Wencong', '', '', 0, NULL, '1992-04-12', 40, 2, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, 'Normanton Park,', 'Blk 5, #05-101 ', 'Singapore', 'SG', 'Singapore', '119002', '', '9398 5546', '', NULL, NULL, '2015-01-05', 'wenconggu@hotmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(26, '28', 'Lim Yee Kok', 'Christopher', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(27, '29', 'Zhe', 'Wang', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, 10, 2, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(28, '032', 'Ong Poh Beng', 'Lionel', '', '', 0, NULL, '1992-08-28', 109, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(29, '033', 'Ju', 'Hexin', '', '', 0, NULL, '1991-08-10', 40, 2, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, ' Blk 3, #09-05, ', 'No 3 St michaels'' road,', '', 'SG', '', '328007', '', '90927482', '', NULL, NULL, NULL, 'angela19641215@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(30, '030', 'Vo', 'Thinh', 'Quoc', '', 0, NULL, '1981-10-15', 189, 1, 'Married', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '20/45 Ho Dac Di Street,', ' Tay Thanh Ward, Tan Phu District, ', 'HCMC', 'VN', '', '', '', '84909549267', '', '', NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(32, '034', 'Xi', 'Tian', '', '', 0, NULL, '1990-03-02', 40, 2, 'Single', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(33, '035', 'Sathasivam', 'Shameenah', '', '', 0, NULL, '1991-02-15', 159, 2, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(34, '036', 'Zhe', 'Jacob Chen', '', '', 0, NULL, '1989-02-14', 40, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '', '', '', '0', '', '', '', '84268903', '', '', NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(35, '037', 'Zheng', 'Haoyu', '', '', 0, NULL, '1992-01-02', 40, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(36, '039', 'Kettani', 'Amine', '', '', 0, NULL, '1985-06-01', 64, 1, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-04', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(37, '040', 'Lim', 'Chiu Ling', '', '', 0, NULL, '1977-03-25', 159, 2, 'Married', '', '', '', '', NULL, '', 1, NULL, 11, 4, 'Blk 492C Tampines St 45 ', '#05-292', 'Singapore', 'SG', 'Singapore', '522492', '', '91901498', '', 'xavier.glenard@upskills.com', NULL, '2015-05-11', 'limchiuling@msn.com', NULL, 'Yes', 'Yes', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(38, '038', 'Pruvost', 'Pierre', '', '', 0, NULL, NULL, 64, 1, 'Other', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '647/162  Ideo Ladprao, ', 'Chompon, Jatujak', '', 'TH', 'Bangkok', '10900', '', '+66  622154250', '', NULL, NULL, NULL, '', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(39, '00', 'Teixeira', 'Kiyosha', 'Andreen Rita', '', 0, NULL, '2015-06-13', 35, 2, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(40, '041', 'Di', 'Bai', '', '', 0, NULL, '2015-06-03', 40, 1, 'Married', '', '', '', '', NULL, '', 1, NULL, 10, 2, 'Blk 64,BISHAN ST 13, ', '#04-264', '', 'SG', '', '570164', '', '90296867', '', NULL, NULL, '2015-06-15', 'baidi.kevin@hotmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(41, '042', 'Sierra', 'Oscar', '', '', 0, NULL, '2015-03-13', 166, 1, 'Married', '', '', '', '', NULL, '', 1, NULL, 11, 2, 'Brookvale Park Condo, ', '3 brookvale drive, unit 03-12', 'Singapore', 'SG', '', '599969', '', '83179059', '', '', NULL, '2015-06-15', 'oscar.sierra.fonseca@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(42, '0044', 'Thom', 'Lee', 'Hong', '', 0, NULL, '2015-05-14', 189, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(43, '0043', 'DÉRIAN', 'Alexandre', 'Gwenc''hlan Aristide', '', 0, NULL, '1990-05-20', 64, 1, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, '198/81, The Light Lad Phrao ', 'Lad Phrao Rd, Jomphol, Jatujak', '', 'TH', 'Bangkok', '10900', '', '+66 989678051', '', 'xavier.glenard@upskills.com', NULL, '2015-07-20', '', NULL, 'Yes', 'Yes', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(44, '0045', 'Hoàng Quốc Minh', 'Trung', '', '', 0, NULL, '1991-08-30', 189, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(45, '0046', 'Xiao', 'Wang', '', '', 0, NULL, '1991-06-13', 40, 1, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, 'BLK 37, TOA PAYOH LOR 5 ', '#02-357  ', 'Singapore', 'SG', '', '310037', '', '91249902', '', '', NULL, '2015-07-13', 'WANG1033@e.ntu.edu.sg', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(46, '0047', 'Ma', 'Hangyu', '', '', 0, NULL, '1992-03-15', 40, 1, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, '  2 KIM YAM RD', '#05-03 Riviera Point', ' Singapore', 'SG', '', ' 239320', '', '9083 6741 ', '', '', NULL, '2015-07-20', '2015mhy@Gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(47, '0048', 'Kouassi', 'Hyacinthe', 'Bleble', '', 0, NULL, '2015-04-10', 64, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '10 Lorong 31 Geylang, ', '#02-02 Platinum Residence', 'Singapore', 'SG', '', ' 388039', '', '85069571', '', NULL, NULL, NULL, 'hyacinthe.kouassi@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(48, '0049', 'Leroux', 'Charles-Henri', 'Marc', '', 0, NULL, '1981-01-13', 64, 1, 'Married', '', '', '', '', NULL, '', 1, NULL, 10, 2, '8 rue du bout monsieur', ' Etrepilly8 rue du bout monsieur', '', 'FR', '', '77139', '', '', '', '', NULL, '2015-08-31', 'lerouxcharleshenri@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(49, '0050', 'EL HACHIMI', 'Sarah', '', '', 0, NULL, '1987-07-18', 64, 2, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, '60 rue de la fontaine au roi', '', 'Paris', 'FR', '', '75011', '', '+33 6 22 33 59 86', '', '', NULL, '2015-10-19', 'sarah.elhachimi@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(50, '0051', 'LEE', 'Wan', 'Xian', '', 0, NULL, '1991-01-17', 159, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, 10, 2, '71A Lorong Marican', '', '', 'SG', ' Singapore ', '417262', '', '96227654', '', NULL, NULL, '2015-09-21', 'wanxianlee91@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(51, '0052', 'Wei', 'Cao', '', '', 0, NULL, '1991-09-30', 40, 2, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '16 River Valley Close,', ' Pacific Mansion, #07-16,', '', 'SG', '', ' 238433', '', '98911568', '', '', NULL, NULL, 'wei.cao.2014@msfe.smu.edu.sg', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(52, '0055', 'Hanh', 'Dinh', 'Tran Xuan', '', 0, NULL, '1993-01-26', 189, 2, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, 'Block 5 Upper Aljunied Lane, ', '#05-42, ', 'Singapore', 'VN', '', '360005', '', '83873818', '', '', NULL, '2015-09-28', 'dtxh261@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(53, '0059', 'Jay', 'Rynel Tay', 'Han', '', 0, NULL, '1990-11-22', 159, 1, 'Single', '', '', '', '', NULL, '', 1, NULL, NULL, NULL, '134 Lentor Green', '', '', 'SG', '', '789339', '', '91169183', '', '', NULL, '2015-10-12', 'rynel.tay.2011@business.smu.edu.sg', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(54, '0057', 'Ting-An', 'Kuo', '', '', 0, NULL, '1992-08-09', 174, 2, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, 'Blk 352 Choa Chu Kang Central,', ' #04-349,', '', 'SG', '', ' 680352', '', '8720 7933', '', '', NULL, NULL, 'tingan_kuo@u.nus.edu', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(55, '0056', 'Juan', 'Gao', 'Xiao', '', 0, NULL, '1993-02-25', 40, 2, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, 'Blk 37 Lor 5 Toa Payoh ', '#02-357 ', '', 'CN', '', '310037', '', '82800429', '', '', NULL, '2015-10-12', 'XGAO004@e.ntu.edu.sg', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(56, '0053', 'pei', 'Huang', 'Wen', '', 0, NULL, '1992-09-23', 40, 2, 'Single', '', '', '', '', NULL, '', 1, NULL, 10, 2, '510 Upper Serangoon Road, ', 'Sunshine Lodge, #03-01, ', '', 'SG', '', '534530', '', '8558 0516', '', '', NULL, '2015-11-02', 'wp.huang.2014@maf.smu.edu.sg', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(57, '0054', 'HARB', 'Thierry', 'Kamal', '', 0, NULL, '1986-08-26', 64, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(58, '0058', 'Zhong Marcus', 'Liang', 'Wei', '', 0, NULL, '1991-03-14', 159, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, 'Block 149 Mei Ling Street', ' #04-69 ', '', 'SG', '', '140149', '', '91083144', '', '', NULL, NULL, 'Marcusliang91@gmail.com', NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(59, '0060', 'shuang', 'LI', 'Lin', '', 0, NULL, '1992-10-20', 40, 2, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(60, '0062', 'Ngyuyen-Khac', 'Olivier', '', '', 0, NULL, NULL, 189, 1, 'Single', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(61, '0061', 'Ghilardi', 'Marc', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, 4, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, 'xavier.glenard@upskills.com', NULL, '2016-10-05', NULL, NULL, 'Yes', 'Yes', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(63, '0063', 'Man', 'Vietnam', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', 'VN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(65, '0065', 'Man', 'Singaporian', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, 4, NULL, NULL, '', '', '', 'SG', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(67, '0067', 'Man', 'Chinese', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', 'CN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(68, '0068', 'yu', 'yu', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', 'AL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(69, '0069', 'Man', 'English', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', 'GB', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(70, '0070', 'zzz', 'xxx', 'yyy', '', 0, NULL, '2016-01-01', 189, 2, '', '', '', '', '', NULL, '', 1, 9, 11, 4, 'xxx', 'xxx', 'xxx', 'VN', '', '78900', '', '', '', 'xavier.glenard@upskills.com', NULL, '2016-08-01', '', NULL, NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(71, '0071', 'Testeur', 'Le', 'Test', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', 'AS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(72, '0072', 'test1', 'test1', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', 'AF', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES(73, '0073', 'Test', 'Test', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, 4, NULL, NULL, '', '', '', 'SG', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_attachment`
--

DROP TABLE IF EXISTS `hs_hr_emp_attachment`;
CREATE TABLE `hs_hr_emp_attachment` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eattach_id` int(11) NOT NULL DEFAULT '0',
  `eattach_desc` varchar(200) DEFAULT NULL,
  `eattach_filename` varchar(100) DEFAULT NULL,
  `eattach_size` int(11) DEFAULT '0',
  `eattach_attachment` mediumblob,
  `eattach_type` varchar(200) DEFAULT NULL,
  `screen` varchar(100) DEFAULT '',
  `attached_by` int(11) DEFAULT NULL,
  `attached_by_name` varchar(200) DEFAULT NULL,
  `attached_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_attachment`
--

TRUNCATE TABLE `hs_hr_emp_attachment`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_basicsalary`
--

DROP TABLE IF EXISTS `hs_hr_emp_basicsalary`;
CREATE TABLE `hs_hr_emp_basicsalary` (
  `id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `sal_grd_code` int(11) DEFAULT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `ebsal_basic_salary` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `payperiod_code` varchar(13) DEFAULT NULL,
  `salary_component` varchar(100) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_basicsalary`
--

TRUNCATE TABLE `hs_hr_emp_basicsalary`;
--
-- Dumping data for table `hs_hr_emp_basicsalary`
--

INSERT INTO `hs_hr_emp_basicsalary` (`id`, `emp_number`, `sal_grd_code`, `currency_id`, `ebsal_basic_salary`, `payperiod_code`, `salary_component`, `comments`) VALUES(1, 46, NULL, 'SGD', '4100', '4', '4100', '');
INSERT INTO `hs_hr_emp_basicsalary` (`id`, `emp_number`, `sal_grd_code`, `currency_id`, `ebsal_basic_salary`, `payperiod_code`, `salary_component`, `comments`) VALUES(2, 43, NULL, 'SGD', '2000', '4', '2000', '');
INSERT INTO `hs_hr_emp_basicsalary` (`id`, `emp_number`, `sal_grd_code`, `currency_id`, `ebsal_basic_salary`, `payperiod_code`, `salary_component`, `comments`) VALUES(3, 40, NULL, 'SGD', '5600', '4', '5600', '');
INSERT INTO `hs_hr_emp_basicsalary` (`id`, `emp_number`, `sal_grd_code`, `currency_id`, `ebsal_basic_salary`, `payperiod_code`, `salary_component`, `comments`) VALUES(4, 50, NULL, 'SGD', '1000', NULL, '1000.00', '');
INSERT INTO `hs_hr_emp_basicsalary` (`id`, `emp_number`, `sal_grd_code`, `currency_id`, `ebsal_basic_salary`, `payperiod_code`, `salary_component`, `comments`) VALUES(5, 50, NULL, 'SGD', '1000', '4', '1000.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_children`
--

DROP TABLE IF EXISTS `hs_hr_emp_children`;
CREATE TABLE `hs_hr_emp_children` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ec_name` varchar(100) DEFAULT '',
  `ec_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_children`
--

TRUNCATE TABLE `hs_hr_emp_children`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_contract_extend`
--

DROP TABLE IF EXISTS `hs_hr_emp_contract_extend`;
CREATE TABLE `hs_hr_emp_contract_extend` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `econ_extend_id` decimal(10,0) NOT NULL DEFAULT '0',
  `econ_extend_start_date` datetime DEFAULT NULL,
  `econ_extend_end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_contract_extend`
--

TRUNCATE TABLE `hs_hr_emp_contract_extend`;
--
-- Dumping data for table `hs_hr_emp_contract_extend`
--

INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(2, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(4, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(5, '1', '2013-07-11 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(6, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(7, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(8, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(9, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(10, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(11, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(12, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(13, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(14, '1', '2014-04-07 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(20, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(23, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(24, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(25, '1', '2015-01-05 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(27, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(29, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(32, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(34, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(35, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(36, '1', '2015-05-04 00:00:00', '2015-12-31 00:00:00');
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(37, '1', '2015-05-11 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(40, '1', '2015-06-15 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(41, '1', '2015-06-15 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(43, '1', '2015-07-20 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(45, '1', '2015-07-13 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(46, '1', '2015-07-20 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(48, '1', '2015-08-31 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(49, '1', '2015-10-19 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(50, '1', '2015-09-21 00:00:00', '2016-03-20 00:00:00');
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(52, '1', '2015-09-28 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(53, '1', '2015-10-12 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(55, '1', '2015-10-12 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(56, '1', '2015-11-02 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(61, '1', '2016-10-05 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(65, '1', NULL, NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(70, '1', '2016-08-01 00:00:00', NULL);
INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES(73, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_dependents`
--

DROP TABLE IF EXISTS `hs_hr_emp_dependents`;
CREATE TABLE `hs_hr_emp_dependents` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ed_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ed_name` varchar(100) DEFAULT '',
  `ed_relationship_type` enum('child','other') DEFAULT NULL,
  `ed_relationship` varchar(100) DEFAULT '',
  `ed_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_dependents`
--

TRUNCATE TABLE `hs_hr_emp_dependents`;
--
-- Dumping data for table `hs_hr_emp_dependents`
--

INSERT INTO `hs_hr_emp_dependents` (`emp_number`, `ed_seqno`, `ed_name`, `ed_relationship_type`, `ed_relationship`, `ed_date_of_birth`) VALUES(40, '1', 'Ma Weisi', 'other', 'Spouse', '1986-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_directdebit`
--

DROP TABLE IF EXISTS `hs_hr_emp_directdebit`;
CREATE TABLE `hs_hr_emp_directdebit` (
  `id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `dd_routing_num` int(9) NOT NULL,
  `dd_account` varchar(100) NOT NULL DEFAULT '',
  `dd_amount` decimal(11,2) NOT NULL,
  `dd_account_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'CHECKING, SAVINGS',
  `dd_transaction_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'BLANK, PERC, FLAT, FLATMINUS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_directdebit`
--

TRUNCATE TABLE `hs_hr_emp_directdebit`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_emergency_contacts`
--

DROP TABLE IF EXISTS `hs_hr_emp_emergency_contacts`;
CREATE TABLE `hs_hr_emp_emergency_contacts` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `eec_name` varchar(100) DEFAULT '',
  `eec_relationship` varchar(100) DEFAULT '',
  `eec_home_no` varchar(100) DEFAULT '',
  `eec_mobile_no` varchar(100) DEFAULT '',
  `eec_office_no` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_emergency_contacts`
--

TRUNCATE TABLE `hs_hr_emp_emergency_contacts`;
--
-- Dumping data for table `hs_hr_emp_emergency_contacts`
--

INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(11, '1', 'Annnie Megaides', 'Mother', '+33 6 67 12 41 80', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(23, '1', 'Toh Poh Choo', 'Mother', '', '83503407', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(25, '1', 'Sun Yu', 'Room mate', '9833 4266', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(29, '1', 'He Xin ', 'Friend', '', '97234826', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(30, '1', 'Yen Nguyen Thi Hoang', 'Spouse', '84909549267', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(36, '1', 'Anne ERKER', 'Girlfriend', '', '00 33 6 60 53 70 10', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(37, '1', 'Lim Zhi Hou', 'Sibling', '', '93822127', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(40, '1', 'MA Weisi', 'Spouse', '', '91448691 ', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(42, '1', 'lê văn đào', 'FATHER', '0974598652', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(43, '1', 'Jolivet Marie-Claude', 'Grandmother', '+33 2 99 91 44 52', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(44, '1', 'Nguyễn Thanh An', 'Sister-in-law', '1', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(45, '1', 'Zhou Lihua', 'Friend', '', '(86)13306696668', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(46, '1', 'Zhang Li', 'Mother', '+86 13855805815', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(47, '1', 'Victoire KOUASSI', 'Sister', '+33 9 50 23 77 38', '+33 6 09 57 02 74', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(48, '1', 'Leroux Laurence', 'mother', '', ' +33 6 78 25 53 86', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(49, '1', 'EL HACHIMI Habib', 'Brother', '', ' +33 6 61 51 72 02', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(50, '1', 'Lee Thiam Leng', 'Father', '', '9663 4816', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(52, '1', 'DINH Xuan Thanh', 'Brother', '11111111', '', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(53, '1', 'Han Soon Kwee', 'Mother', '', '90566840', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(54, '1', 'Christy Chang', 'Friend', '', '97547389', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(55, '1', 'Xie Lusi', 'Friend', '', '98644700', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(56, '1', 'Huang Huajie', 'Father', '', '+86 13950983289', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(57, '1', ' Ikuyo TAKARA', 'Friend', '', '+81 90 9969 1470', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(57, '2', 'Wassim HARB', 'Brother', '', ' +33 6 02 68 97 81', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(58, '1', 'Helen', 'Mother', '', '82824667', '');
INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES(70, '1', 'cvbnm', 'tyuioo', '', '8908765', '');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_history_of_ealier_pos`
--

DROP TABLE IF EXISTS `hs_hr_emp_history_of_ealier_pos`;
CREATE TABLE `hs_hr_emp_history_of_ealier_pos` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `emp_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ehoep_job_title` varchar(100) DEFAULT '',
  `ehoep_years` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_history_of_ealier_pos`
--

TRUNCATE TABLE `hs_hr_emp_history_of_ealier_pos`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_language`
--

DROP TABLE IF EXISTS `hs_hr_emp_language`;
CREATE TABLE `hs_hr_emp_language` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL,
  `fluency` smallint(6) NOT NULL DEFAULT '0',
  `competency` smallint(6) DEFAULT '0',
  `comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_language`
--

TRUNCATE TABLE `hs_hr_emp_language`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_locations`
--

DROP TABLE IF EXISTS `hs_hr_emp_locations`;
CREATE TABLE `hs_hr_emp_locations` (
  `emp_number` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_locations`
--

TRUNCATE TABLE `hs_hr_emp_locations`;
--
-- Dumping data for table `hs_hr_emp_locations`
--

INSERT INTO `hs_hr_emp_locations` (`emp_number`, `location_id`) VALUES(14, 1);
INSERT INTO `hs_hr_emp_locations` (`emp_number`, `location_id`) VALUES(37, 1);
INSERT INTO `hs_hr_emp_locations` (`emp_number`, `location_id`) VALUES(53, 1);
INSERT INTO `hs_hr_emp_locations` (`emp_number`, `location_id`) VALUES(70, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_member_detail`
--

DROP TABLE IF EXISTS `hs_hr_emp_member_detail`;
CREATE TABLE `hs_hr_emp_member_detail` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `membship_code` int(6) NOT NULL DEFAULT '0',
  `ememb_subscript_ownership` varchar(20) DEFAULT NULL,
  `ememb_subscript_amount` decimal(15,2) DEFAULT NULL,
  `ememb_subs_currency` varchar(20) DEFAULT NULL,
  `ememb_commence_date` date DEFAULT NULL,
  `ememb_renewal_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_member_detail`
--

TRUNCATE TABLE `hs_hr_emp_member_detail`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_passport`
--

DROP TABLE IF EXISTS `hs_hr_emp_passport`;
CREATE TABLE `hs_hr_emp_passport` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ep_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ep_passport_num` varchar(100) NOT NULL DEFAULT '',
  `ep_passportissueddate` datetime DEFAULT NULL,
  `ep_passportexpiredate` datetime DEFAULT NULL,
  `ep_comments` varchar(255) DEFAULT NULL,
  `ep_passport_type_flg` smallint(6) DEFAULT NULL,
  `ep_i9_status` varchar(100) DEFAULT '',
  `ep_i9_review_date` date DEFAULT NULL,
  `cou_code` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_passport`
--

TRUNCATE TABLE `hs_hr_emp_passport`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_picture`
--

DROP TABLE IF EXISTS `hs_hr_emp_picture`;
CREATE TABLE `hs_hr_emp_picture` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `epic_picture` mediumblob,
  `epic_filename` varchar(100) DEFAULT NULL,
  `epic_type` varchar(50) DEFAULT NULL,
  `epic_file_size` varchar(20) DEFAULT NULL,
  `epic_file_width` varchar(20) DEFAULT NULL,
  `epic_file_height` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_picture`
--

TRUNCATE TABLE `hs_hr_emp_picture`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_reportto`
--

DROP TABLE IF EXISTS `hs_hr_emp_reportto`;
CREATE TABLE `hs_hr_emp_reportto` (
  `erep_sup_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_sub_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_reporting_mode` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_reportto`
--

TRUNCATE TABLE `hs_hr_emp_reportto`;
--
-- Dumping data for table `hs_hr_emp_reportto`
--

INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 4, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 6, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 7, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 8, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 9, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 10, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 12, 2);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 13, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 14, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 15, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 20, 2);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 23, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 24, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 27, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 34, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 35, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 36, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 37, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 38, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 41, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 43, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 45, 3);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 47, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 53, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(2, 73, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(4, 65, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(8, 5, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(8, 11, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(8, 12, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(8, 27, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(8, 29, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(8, 40, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(8, 48, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(10, 32, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(14, 33, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(14, 50, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(14, 58, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 6, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 7, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 8, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 9, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 10, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 12, 2);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 13, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 14, 2);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 20, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 23, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 24, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 27, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 29, 3);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 34, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 35, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 37, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 38, 3);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(15, 47, 3);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(24, 25, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(24, 45, 2);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(37, 70, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(38, 43, 2);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(41, 46, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(41, 49, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(48, 55, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(60, 30, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(61, 4, 1);
INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES(61, 65, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_skill`
--

DROP TABLE IF EXISTS `hs_hr_emp_skill`;
CREATE TABLE `hs_hr_emp_skill` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL,
  `years_of_exp` decimal(2,0) DEFAULT NULL,
  `comments` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_skill`
--

TRUNCATE TABLE `hs_hr_emp_skill`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_us_tax`
--

DROP TABLE IF EXISTS `hs_hr_emp_us_tax`;
CREATE TABLE `hs_hr_emp_us_tax` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `tax_federal_status` varchar(13) DEFAULT NULL,
  `tax_federal_exceptions` int(2) DEFAULT '0',
  `tax_state` varchar(13) DEFAULT NULL,
  `tax_state_status` varchar(13) DEFAULT NULL,
  `tax_state_exceptions` int(2) DEFAULT '0',
  `tax_unemp_state` varchar(13) DEFAULT NULL,
  `tax_work_state` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_us_tax`
--

TRUNCATE TABLE `hs_hr_emp_us_tax`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_work_experience`
--

DROP TABLE IF EXISTS `hs_hr_emp_work_experience`;
CREATE TABLE `hs_hr_emp_work_experience` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eexp_seqno` decimal(10,0) NOT NULL DEFAULT '0',
  `eexp_employer` varchar(100) DEFAULT NULL,
  `eexp_jobtit` varchar(120) DEFAULT NULL,
  `eexp_from_date` datetime DEFAULT NULL,
  `eexp_to_date` datetime DEFAULT NULL,
  `eexp_comments` varchar(200) DEFAULT NULL,
  `eexp_internal` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_emp_work_experience`
--

TRUNCATE TABLE `hs_hr_emp_work_experience`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_jobtit_empstat`
--

DROP TABLE IF EXISTS `hs_hr_jobtit_empstat`;
CREATE TABLE `hs_hr_jobtit_empstat` (
  `jobtit_code` int(7) NOT NULL,
  `estat_code` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_jobtit_empstat`
--

TRUNCATE TABLE `hs_hr_jobtit_empstat`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_mailnotifications`
--

DROP TABLE IF EXISTS `hs_hr_mailnotifications`;
CREATE TABLE `hs_hr_mailnotifications` (
  `user_id` int(20) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_mailnotifications`
--

TRUNCATE TABLE `hs_hr_mailnotifications`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_module`
--

DROP TABLE IF EXISTS `hs_hr_module`;
CREATE TABLE `hs_hr_module` (
  `mod_id` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `owner_email` varchar(100) DEFAULT NULL,
  `version` varchar(36) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_module`
--

TRUNCATE TABLE `hs_hr_module`;
--
-- Dumping data for table `hs_hr_module`
--

INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD001', 'Admin', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Admin');
INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD002', 'PIM', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Functions');
INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD004', 'Report', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Reporting');
INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD005', 'Leave', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Leave Tracking');
INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD006', 'Time', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Time Tracking');
INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD007', 'Benefits', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Benefits Tracking');
INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD008', 'Recruitment', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Recruitment');
INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES('MOD009', 'Performance', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Performance');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_payperiod`
--

DROP TABLE IF EXISTS `hs_hr_payperiod`;
CREATE TABLE `hs_hr_payperiod` (
  `payperiod_code` varchar(13) NOT NULL DEFAULT '',
  `payperiod_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_payperiod`
--

TRUNCATE TABLE `hs_hr_payperiod`;
--
-- Dumping data for table `hs_hr_payperiod`
--

INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES('1', 'Weekly');
INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES('2', 'Bi Weekly');
INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES('3', 'Semi Monthly');
INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES('4', 'Monthly');
INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES('5', 'Monthly on first pay of month.');
INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES('6', 'Hourly');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_pay_period`
--

DROP TABLE IF EXISTS `hs_hr_pay_period`;
CREATE TABLE `hs_hr_pay_period` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `close_date` date NOT NULL,
  `check_date` date NOT NULL,
  `timesheet_aproval_due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_pay_period`
--

TRUNCATE TABLE `hs_hr_pay_period`;
-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_province`
--

DROP TABLE IF EXISTS `hs_hr_province`;
CREATE TABLE `hs_hr_province` (
  `id` int(11) NOT NULL,
  `province_name` varchar(40) NOT NULL DEFAULT '',
  `province_code` char(2) NOT NULL DEFAULT '',
  `cou_code` char(2) NOT NULL DEFAULT 'us'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_province`
--

TRUNCATE TABLE `hs_hr_province`;
--
-- Dumping data for table `hs_hr_province`
--

INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(1, 'Alaska', 'AK', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(2, 'Alabama', 'AL', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(3, 'American Samoa', 'AS', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(4, 'Arizona', 'AZ', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(5, 'Arkansas', 'AR', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(6, 'California', 'CA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(7, 'Colorado', 'CO', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(8, 'Connecticut', 'CT', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(9, 'Delaware', 'DE', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(10, 'District of Columbia', 'DC', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(11, 'Federated States of Micronesia', 'FM', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(12, 'Florida', 'FL', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(13, 'Georgia', 'GA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(14, 'Guam', 'GU', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(15, 'Hawaii', 'HI', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(16, 'Idaho', 'ID', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(17, 'Illinois', 'IL', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(18, 'Indiana', 'IN', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(19, 'Iowa', 'IA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(20, 'Kansas', 'KS', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(21, 'Kentucky', 'KY', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(22, 'Louisiana', 'LA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(23, 'Maine', 'ME', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(24, 'Marshall Islands', 'MH', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(25, 'Maryland', 'MD', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(26, 'Massachusetts', 'MA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(27, 'Michigan', 'MI', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(28, 'Minnesota', 'MN', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(29, 'Mississippi', 'MS', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(30, 'Missouri', 'MO', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(31, 'Montana', 'MT', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(32, 'Nebraska', 'NE', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(33, 'Nevada', 'NV', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(34, 'New Hampshire', 'NH', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(35, 'New Jersey', 'NJ', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(36, 'New Mexico', 'NM', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(37, 'New York', 'NY', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(38, 'North Carolina', 'NC', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(39, 'North Dakota', 'ND', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(40, 'Northern Mariana Islands', 'MP', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(41, 'Ohio', 'OH', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(42, 'Oklahoma', 'OK', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(43, 'Oregon', 'OR', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(44, 'Palau', 'PW', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(45, 'Pennsylvania', 'PA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(46, 'Puerto Rico', 'PR', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(47, 'Rhode Island', 'RI', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(48, 'South Carolina', 'SC', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(49, 'South Dakota', 'SD', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(50, 'Tennessee', 'TN', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(51, 'Texas', 'TX', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(52, 'Utah', 'UT', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(53, 'Vermont', 'VT', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(54, 'Virgin Islands', 'VI', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(55, 'Virginia', 'VA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(56, 'Washington', 'WA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(57, 'West Virginia', 'WV', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(58, 'Wisconsin', 'WI', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(59, 'Wyoming', 'WY', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(60, 'Armed Forces Africa', 'AE', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(61, 'Armed Forces Americas (except Canada)', 'AA', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(62, 'Armed Forces Canada', 'AE', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(63, 'Armed Forces Europe', 'AE', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(64, 'Armed Forces Middle East', 'AE', 'US');
INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES(65, 'Armed Forces Pacific', 'AP', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_unique_id`
--

DROP TABLE IF EXISTS `hs_hr_unique_id`;
CREATE TABLE `hs_hr_unique_id` (
  `id` int(11) NOT NULL,
  `last_id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `hs_hr_unique_id`
--

TRUNCATE TABLE `hs_hr_unique_id`;
--
-- Dumping data for table `hs_hr_unique_id`
--

INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(1, 73, 'hs_hr_employee', 'emp_number');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(2, 9, 'hs_hr_module', 'mod_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(3, 0, 'hs_hr_leave', 'leave_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(4, 0, 'hs_hr_leavetype', 'leave_type_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(5, 0, 'hs_hr_leave_requests', 'leave_request_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(6, 0, 'hs_hr_custom_export', 'export_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(7, 0, 'hs_hr_custom_import', 'import_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(8, 0, 'hs_hr_pay_period', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(9, 0, 'hs_hr_kpi', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(10, 0, 'hs_hr_performance_review', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(11, 2, 'ohrm_emp_reporting_method', 'reporting_method_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(12, 77, 'ohrm_timesheet', 'timesheet_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(13, 10, 'ohrm_timesheet_action_log', 'timesheet_action_log_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(14, 343, 'ohrm_timesheet_item', 'timesheet_item_id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(15, 5, 'ohrm_attendance_record', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(16, 0, 'ohrm_job_vacancy', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(17, 0, 'ohrm_job_candidate', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(18, 106, 'ohrm_workflow_state_machine', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(19, 0, 'ohrm_job_candidate_attachment', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(20, 0, 'ohrm_job_vacancy_attachment', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(21, 0, 'ohrm_job_candidate_vacancy', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(22, 0, 'ohrm_job_candidate_history', 'id');
INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES(23, 0, 'ohrm_job_interview', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_advanced_report`
--

DROP TABLE IF EXISTS `ohrm_advanced_report`;
CREATE TABLE `ohrm_advanced_report` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_advanced_report`
--

TRUNCATE TABLE `ohrm_advanced_report`;
--
-- Dumping data for table `ohrm_advanced_report`
--

INSERT INTO `ohrm_advanced_report` (`id`, `name`, `definition`) VALUES(1, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="empNumber" label="Employee Number"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM ohrm_leave_type WHERE (deleted = 0) OR (SELECT count(l.id) FROM ohrm_leave l WHERE l.status = 3 AND l.leave_type_id = ohrm_leave_type.id) > 0 ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="leavetype" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="false">\n                    <field_name>ohrm_leave_type.exclude_in_reports_if_no_entitlement</field_name>\n                    <field_alias>exclude_if_no_entitlement</field_alias>\n                    <display_name>Exclude</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="false">\n                    <field_name>ohrm_leave_type.deleted</field_name>\n                    <field_alias>leave_type_deleted</field_alias>\n                    <display_name>Leave Type Deleted</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>leaveType</field_alias>\n                    <display_name>Leave Type</display_name>\n                    <width>160</width>	\n                </field>s                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.leave_type_id as leave_type_id,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.emp_number,empNumber} AND \n    $X{IN,ohrm_leave_entitlement.leave_type_id,leaveTypeId} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.leave_type_id\nORDER BY A.leave_type_id\n\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 1 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 2 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,emp_number,empNumber} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.leave_type_id,leaveTypeId} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY leave_type_id\nORDER BY ohrm_leave.leave_type_id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="unused">       \n    <query>FROM ohrm_leave_type WHERE deleted = 0 AND $X{IN,ohrm_leave_type.id,leaveTypeId} ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>160</width>	\n                    <align>right</align>\n                </field>                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n\n    <join>             \n        <join_by sub_report="mainTable" id="leaveTypeId"></join_by>              \n        <join_by sub_report="entitlementsTotal" id="leaveTypeId"></join_by> \n        <join_by sub_report="pendingQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="scheduledQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="takenQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="unused" id="leaveTypeId"></join_by>  \n\n    </join>\n    <page_limit>100</page_limit>        \n</report>');
INSERT INTO `ohrm_advanced_report` (`id`, `name`, `definition`) VALUES(2, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="leaveType" label="Leave Type"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n        <input_field type="text" name="emp_numbers" label="employees"></input_field>\n        <input_field type="text" name="job_title" label="Job Title"></input_field>\n        <input_field type="text" name="location" label="Location"></input_field>\n        <input_field type="text" name="sub_unit" label="Sub Unit"></input_field>\n        <input_field type="text" name="terminated" label="Terminated"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM hs_hr_employee \n    LEFT JOIN hs_hr_emp_locations ON hs_hr_employee.emp_number = hs_hr_emp_locations.emp_number\n    WHERE $X{IN,hs_hr_employee.emp_number,emp_numbers} \n    AND $X{=,hs_hr_employee.job_title_code,job_title}\n    AND $X{IN,hs_hr_employee.work_station,sub_unit}\n    AND $X{IN,hs_hr_emp_locations.location_id,location}\n    AND $X{IS NULL,hs_hr_employee.termination_id,terminated}\n    ORDER BY hs_hr_employee.emp_lastname</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="personalDetails" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="false">\n                    <field_name>hs_hr_employee.termination_id</field_name>\n                    <field_alias>termination_id</field_alias>\n                    <display_name>Termination ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>CONCAT(hs_hr_employee.emp_firstname, '' '', hs_hr_employee.emp_lastname)</field_name>\n                    <field_alias>employeeName</field_alias>\n                    <display_name>Employee</display_name>\n                    <width>150</width>\n                </field>                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.emp_number as emp_number,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.leave_type_id,leaveType}\n    AND $X{IN,ohrm_leave_entitlement.emp_number,empNumber} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.emp_number\nORDER BY A.emp_number\n\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 1 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 2 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n<sub_report type="sql" name="unused">       \n    <query>FROM hs_hr_employee WHERE $X{IN,hs_hr_employee.emp_number,empNumber} ORDER BY hs_hr_employee.emp_number</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>    \n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="true">\n                    <field_name>hs_hr_employee.emp_firstname</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>150</width>\n                    <align>right</align>\n                </field> \n                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n    <join>             \n        <join_by sub_report="mainTable" id="empNumber"></join_by>            \n        <join_by sub_report="entitlementsTotal" id="empNumber"></join_by> \n        <join_by sub_report="pendingQuery" id="empNumber"></join_by>\n        <join_by sub_report="scheduledQuery" id="empNumber"></join_by>\n        <join_by sub_report="takenQuery" id="empNumber"></join_by> \n        <join_by sub_report="unused" id="empNumber"></join_by>  \n    </join>\n    <page_limit>20</page_limit>       \n</report>');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_attendance_record`
--

DROP TABLE IF EXISTS `ohrm_attendance_record`;
CREATE TABLE `ohrm_attendance_record` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `punch_in_utc_time` datetime DEFAULT NULL,
  `punch_in_note` varchar(255) DEFAULT NULL,
  `punch_in_time_offset` varchar(255) DEFAULT NULL,
  `punch_in_user_time` datetime DEFAULT NULL,
  `punch_out_utc_time` datetime DEFAULT NULL,
  `punch_out_note` varchar(255) DEFAULT NULL,
  `punch_out_time_offset` varchar(255) DEFAULT NULL,
  `punch_out_user_time` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_attendance_record`
--

TRUNCATE TABLE `ohrm_attendance_record`;
--
-- Dumping data for table `ohrm_attendance_record`
--

INSERT INTO `ohrm_attendance_record` (`id`, `employee_id`, `punch_in_utc_time`, `punch_in_note`, `punch_in_time_offset`, `punch_in_user_time`, `punch_out_utc_time`, `punch_out_note`, `punch_out_time_offset`, `punch_out_user_time`, `state`) VALUES(1, 1, '2014-07-10 04:31:00', '', '8', '2014-07-10 12:31:00', NULL, NULL, NULL, NULL, 'PUNCHED IN');
INSERT INTO `ohrm_attendance_record` (`id`, `employee_id`, `punch_in_utc_time`, `punch_in_note`, `punch_in_time_offset`, `punch_in_user_time`, `punch_out_utc_time`, `punch_out_note`, `punch_out_time_offset`, `punch_out_user_time`, `state`) VALUES(2, 61, '2016-08-11 08:24:00', 'What', '8', '2016-08-11 16:24:00', '2016-08-17 10:20:00', 'Done', '8', '2016-08-17 18:20:00', 'PUNCHED OUT');
INSERT INTO `ohrm_attendance_record` (`id`, `employee_id`, `punch_in_utc_time`, `punch_in_note`, `punch_in_time_offset`, `punch_in_user_time`, `punch_out_utc_time`, `punch_out_note`, `punch_out_time_offset`, `punch_out_user_time`, `state`) VALUES(3, 4, '2016-08-17 10:16:00', '', '8', '2016-08-17 18:16:00', '2016-08-17 10:16:00', '', '8', '2016-08-17 18:16:00', 'PUNCHED OUT');
INSERT INTO `ohrm_attendance_record` (`id`, `employee_id`, `punch_in_utc_time`, `punch_in_note`, `punch_in_time_offset`, `punch_in_user_time`, `punch_out_utc_time`, `punch_out_note`, `punch_out_time_offset`, `punch_out_user_time`, `state`) VALUES(4, 4, '2016-08-17 10:16:00', 'Hello', '8', '2016-08-17 18:16:00', '2016-08-17 10:17:00', 'Done', '8', '2016-08-17 18:17:00', 'PUNCHED OUT');
INSERT INTO `ohrm_attendance_record` (`id`, `employee_id`, `punch_in_utc_time`, `punch_in_note`, `punch_in_time_offset`, `punch_in_user_time`, `punch_out_utc_time`, `punch_out_note`, `punch_out_time_offset`, `punch_out_user_time`, `state`) VALUES(5, 61, '2016-08-17 10:21:00', 'Test', '8', '2016-08-17 18:21:00', '2016-08-17 10:21:00', 'TestOut', '8', '2016-08-17 18:21:00', 'PUNCHED OUT');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_auth_provider_extra_details`
--

DROP TABLE IF EXISTS `ohrm_auth_provider_extra_details`;
CREATE TABLE `ohrm_auth_provider_extra_details` (
  `id` int(11) NOT NULL,
  `provider_id` int(10) NOT NULL,
  `provider_type` int(11) DEFAULT NULL,
  `client_id` text,
  `client_secret` text,
  `developer_key` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_auth_provider_extra_details`
--

TRUNCATE TABLE `ohrm_auth_provider_extra_details`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_available_group_field`
--

DROP TABLE IF EXISTS `ohrm_available_group_field`;
CREATE TABLE `ohrm_available_group_field` (
  `report_group_id` bigint(20) NOT NULL,
  `group_field_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_available_group_field`
--

TRUNCATE TABLE `ohrm_available_group_field`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_beacon_notification`
--

DROP TABLE IF EXISTS `ohrm_beacon_notification`;
CREATE TABLE `ohrm_beacon_notification` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_beacon_notification`
--

TRUNCATE TABLE `ohrm_beacon_notification`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_composite_display_field`
--

DROP TABLE IF EXISTS `ohrm_composite_display_field`;
CREATE TABLE `ohrm_composite_display_field` (
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_composite_display_field`
--

TRUNCATE TABLE `ohrm_composite_display_field`;
--
-- Dumping data for table `ohrm_composite_display_field`
--

INSERT INTO `ohrm_composite_display_field` (`composite_display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(1, 1, 'IF(hs_hr_employee.termination_id IS NULL, CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname), CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname, " (Past Employee)"))', 'Employee Name', 'employeeName', 'false', NULL, NULL, 'label', '<xml><getter>employeeName</getter></xml>', '300', '0', NULL, 0, NULL, 'Deleted Employee', 0, 0);
INSERT INTO `ohrm_composite_display_field` (`composite_display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(2, 1, 'CONCAT(ohrm_customer.name, " - " ,ohrm_project.name)', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '300', '0', NULL, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_customer`
--

DROP TABLE IF EXISTS `ohrm_customer`;
CREATE TABLE `ohrm_customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_customer`
--

TRUNCATE TABLE `ohrm_customer`;
--
-- Dumping data for table `ohrm_customer`
--

INSERT INTO `ohrm_customer` (`customer_id`, `name`, `description`, `is_deleted`) VALUES(1, 'DBS Bank', '', 0);
INSERT INTO `ohrm_customer` (`customer_id`, `name`, `description`, `is_deleted`) VALUES(2, 'Murex', '', 0);
INSERT INTO `ohrm_customer` (`customer_id`, `name`, `description`, `is_deleted`) VALUES(3, 'Upskills', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint`
--

DROP TABLE IF EXISTS `ohrm_datapoint`;
CREATE TABLE `ohrm_datapoint` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `datapoint_type_id` int(11) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_datapoint`
--

TRUNCATE TABLE `ohrm_datapoint`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint_type`
--

DROP TABLE IF EXISTS `ohrm_datapoint_type`;
CREATE TABLE `ohrm_datapoint_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `action_class` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_datapoint_type`
--

TRUNCATE TABLE `ohrm_datapoint_type`;
--
-- Dumping data for table `ohrm_datapoint_type`
--

INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES(1, 'config', 'configDatapointProcessor');
INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES(2, 'count', 'countDatapointProcessor');
INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES(3, 'session', 'sessionDatapointProcessor');
INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES(4, 'organization', 'OrganizationDataProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group`
--

DROP TABLE IF EXISTS `ohrm_data_group`;
CREATE TABLE `ohrm_data_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_data_group`
--

TRUNCATE TABLE `ohrm_data_group`;
--
-- Dumping data for table `ohrm_data_group`
--

INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(1, 'personal_information', 'PIM - Personal Details', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(2, 'personal_attachment', 'PIM - Personal Details - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(3, 'personal_custom_fields', 'PIM - Personal Details - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(4, 'contact_details', 'PIM - Contact Details', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(5, 'contact_attachment', 'PIM - Contact Details - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(6, 'contact_custom_fields', 'PIM - Contact Details - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(7, 'emergency_contacts', 'PIM - Emergency Contacts', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(8, 'emergency_attachment', 'PIM - Emergency Contacts - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(9, 'emergency_custom_fields', 'PIM - Emergency Contacts - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(10, 'dependents', 'PIM - Dependents', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(11, 'dependents_attachment', 'PIM - Dependents - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(12, 'dependents_custom_fields', 'PIM - Dependents - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(13, 'immigration', 'PIM - Immigration', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(14, 'immigration_attachment', 'PIM - Immigration - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(15, 'immigration_custom_fields', 'PIM - Immigration - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(16, 'job_details', 'PIM - Job', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(17, 'job_attachment', 'PIM - Job - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(18, 'job_custom_fields', 'PIM - Job - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(19, 'salary_details', 'PIM - Salary', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(20, 'salary_attachment', 'PIM - Salary - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(21, 'salary_custom_fields', 'PIM - Salary - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(22, 'tax_exemptions', 'PIM - Tax Exemptions', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(23, 'tax_attachment', 'PIM - Tax Exemptions - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(24, 'tax_custom_fields', 'PIM - Tax Exemptions - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(25, 'supervisor', 'PIM - Employee Supervisors', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(26, 'subordinates', 'PIM - Employee Subordinates', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(27, 'report-to_attachment', 'PIM - Employee Supervisors/Subordinates - Attachment', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(28, 'report-to_custom_fields', 'PIM - Employee Supervisors/Subordinates - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(29, 'qualification_work', 'PIM - Qualifications - Work Experience', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(30, 'qualification_education', 'PIM - Qualifications - Education', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(31, 'qualification_skills', 'PIM - Qualifications - Skills', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(32, 'qualification_languages', 'PIM - Qualifications - Languages', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(33, 'qualification_license', 'PIM - Qualifications - License', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(34, 'qualifications_attachment', 'PIM - Qualifications - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(35, 'qualifications_custom_fields', 'PIM - Qualifications - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(36, 'membership', 'PIM - Membership', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(37, 'membership_attachment', 'PIM - Membership - Attachments', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(38, 'membership_custom_fields', 'PIM - Membership - Custom Fields', 1, NULL, 1, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(39, 'photograph', 'PIM - Employee Photograph', 1, NULL, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(40, 'leave_entitlements', 'Leave - Leave Entitlements', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(41, 'leave_entitlements_usage_report', 'Leave - Leave Entitlements and Usage Report', 1, NULL, NULL, NULL);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(42, 'job_titles', 'Admin - Job Titles', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(43, 'pay_grades', 'Admin - Pay Grades', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(44, 'time_customers', 'Time - Project Info - Customers', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(45, 'time_projects', 'Time - Project Info - Projects', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(46, 'pim_reports', 'PIM - Reports', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(47, 'attendance_configuration', 'Time - Attendance Configuration', 1, 0, 1, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(48, 'attendance_records', 'Time - Attendance Records', 1, 0, 0, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(49, 'time_project_reports', 'Time - Project Reports', 1, 0, 0, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(50, 'time_employee_reports', 'Time - Employee Reports', 1, 0, 0, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(51, 'attendance_summary', 'Time - Attendance Summary', 1, 0, 0, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(52, 'leave_period', 'Leave - Leave Period', 1, 0, 1, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(53, 'leave_types', 'Leave - Leave Types', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(54, 'work_week', 'Leave - Work Week', 1, 0, 1, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(55, 'holidays', 'Leave - Holidays', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(56, 'recruitment_vacancies', 'Recruitment - Vacancies', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(57, 'recruitment_candidates', 'Recruitment - Candidates', 1, 1, 1, 1);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(58, 'time_employee_timesheets', 'Time - Employee Timesheets', 1, 0, 0, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(59, 'leave_list', 'Leave - Leave List', 1, 0, 0, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(60, 'leave_list_comments', 'Leave - Leave List - Comments', 0, 1, 0, 0);
INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(61, 'time_print_employee_timesheet', 'Time - Print Employee Timesheet', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group_screen`
--

DROP TABLE IF EXISTS `ohrm_data_group_screen`;
CREATE TABLE `ohrm_data_group_screen` (
  `id` int(11) NOT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_data_group_screen`
--

TRUNCATE TABLE `ohrm_data_group_screen`;
--
-- Dumping data for table `ohrm_data_group_screen`
--

INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(1, 40, 69, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(2, 40, 72, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(3, 40, 73, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(4, 40, 71, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(5, 41, 78, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(6, 42, 23, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(7, 42, 80, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(8, 42, 80, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(9, 42, 80, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(10, 42, 81, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(11, 43, 24, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(12, 43, 82, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(13, 43, 82, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(14, 43, 82, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(15, 43, 83, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(16, 43, 84, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(17, 43, 85, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(18, 42, 74, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(19, 43, 74, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(20, 44, 36, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(21, 44, 86, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(22, 44, 86, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(23, 44, 87, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(24, 45, 37, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(25, 45, 88, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(26, 45, 88, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(27, 45, 88, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(28, 45, 89, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(29, 45, 90, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(30, 45, 90, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(31, 45, 91, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(32, 45, 91, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(33, 46, 45, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(34, 46, 45, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(35, 46, 92, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(36, 46, 92, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(37, 46, 93, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(38, 47, 56, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(39, 47, 56, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(40, 48, 55, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(41, 49, 57, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(42, 49, 102, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(43, 50, 58, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(44, 51, 59, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(45, 51, 101, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(46, 52, 47, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(47, 52, 47, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(48, 53, 7, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(49, 53, 8, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(50, 53, 8, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(51, 53, 8, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(52, 53, 9, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(53, 53, 10, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(54, 54, 14, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(55, 54, 14, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(56, 55, 11, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(57, 55, 12, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(58, 55, 12, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(59, 55, 13, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(60, 56, 61, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(61, 56, 94, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(62, 56, 94, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(63, 56, 94, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(64, 56, 95, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(65, 57, 60, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(66, 57, 96, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(67, 57, 96, 2);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(68, 57, 96, 3);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(69, 57, 97, 4);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(70, 56, 76, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(71, 57, 76, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(72, 58, 52, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(73, 59, 16, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(74, 59, 98, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(75, 59, 99, 1);
INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES(76, 61, 118, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field`
--

DROP TABLE IF EXISTS `ohrm_display_field`;
CREATE TABLE `ohrm_display_field` (
  `display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_display_field`
--

TRUNCATE TABLE `ohrm_display_field`;
--
-- Dumping data for table `ohrm_display_field`
--

INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(1, 1, 'ohrm_project.name', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(2, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'link', '<xml><labelGetter>activityname</labelGetter><placeholderGetters><id>activity_id</id><total>totalduration</total><projectId>projectId</projectId><from>fromDate</from><to>toDate</to><approved>onlyIncludeApprovedTimesheets</approved></placeholderGetters><urlPattern>../../displayProjectActivityDetailsReport?reportId=3#activityId={id}#total={total}#from={from}#to={to}#projectId={projectId}#onlyIncludeApprovedTimesheets={approved}</urlPattern></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(3, 1, 'ohrm_project_activity.project_id', 'Project Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>project_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(4, 1, 'ohrm_project_activity.activity_id', 'Activity Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>activity_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(5, 1, 'ohrm_timesheet_item.duration', 'Time (hours)', NULL, 'false', NULL, NULL, 'label', '<xml><getter>duration</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(6, 1, 'hs_hr_employee.emp_firstname', 'Employee First Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_firstname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(7, 1, 'hs_hr_employee.emp_lastname', 'Employee Last Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_lastname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(8, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'label', '<xml><getter>activityname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(9, 3, 'hs_hr_employee.employee_id', 'Employee Id', 'employeeId', 'false', NULL, NULL, 'label', '<xml><getter>employeeId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(10, 3, 'hs_hr_employee.emp_lastname', 'Employee Last Name', 'employeeLastname', 'false', NULL, NULL, 'label', '<xml><getter>employeeLastname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(11, 3, 'hs_hr_employee.emp_firstname', 'Employee First Name', 'employeeFirstname', 'false', NULL, NULL, 'label', '<xml><getter>employeeFirstname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(12, 3, 'hs_hr_employee.emp_middle_name', 'Employee Middle Name', 'employeeMiddlename', 'false', NULL, NULL, 'label', '<xml><getter>employeeMiddlename</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(13, 3, 'hs_hr_employee.emp_birthday', 'Date of Birth', 'empBirthday', 'false', NULL, NULL, 'labelDate', '<xml><getter>empBirthday</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(14, 3, 'ohrm_nationality.name', 'Nationality', 'nationality', 'false', NULL, NULL, 'label', '<xml><getter>nationality</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(15, 3, 'CASE hs_hr_employee.emp_gender WHEN 1 THEN "Male" WHEN 2 THEN "Female" WHEN 3 THEN "Other" END', 'Gender', 'empGender', 'false', NULL, NULL, 'label', '<xml><getter>empGender</getter></xml>', '80', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(17, 3, 'hs_hr_employee.emp_marital_status', 'Marital Status', 'maritalStatus', 'false', NULL, NULL, 'label', '<xml><getter>maritalStatus</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(18, 3, 'hs_hr_employee.emp_dri_lice_num', 'Driver License Number', 'driversLicenseNumber', 'false', NULL, NULL, 'label', '<xml><getter>driversLicenseNumber</getter></xml>', '240', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(19, 3, 'hs_hr_employee.emp_dri_lice_exp_date', 'License Expiry Date', 'licenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>licenseExpiryDate</getter></xml>', '135', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(20, 3, 'CONCAT_WS(", ", NULLIF(hs_hr_employee.emp_street1, ""), NULLIF(hs_hr_employee.emp_street2, ""), NULLIF(hs_hr_employee.city_code, ""), NULLIF(hs_hr_employee.provin_code,""), NULLIF(hs_hr_employee.emp_zipcode,""), NULLIF(hs_hr_country.cou_name,""))', 'Address', 'address', 'false', NULL, NULL, 'label', '<xml><getter>address</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(21, 3, 'hs_hr_employee.emp_hm_telephone', 'Home Telephone', 'homeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>homeTelephone</getter></xml>', '130', '0', NULL, 0, 2, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(22, 3, 'hs_hr_employee.emp_mobile', 'Mobile', 'mobile', 'false', NULL, NULL, 'label', '<xml><getter>mobile</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(23, 3, 'hs_hr_employee.emp_work_telephone', 'Work Telephone', 'workTelephone', 'false', NULL, NULL, 'label', '<xml><getter>workTelephone</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(24, 3, 'hs_hr_employee.emp_work_email', 'Work Email', 'workEmail', 'false', NULL, NULL, 'label', '<xml><getter>workEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(25, 3, 'hs_hr_employee.emp_oth_email', 'Other Email', 'otherEmail', 'false', NULL, NULL, 'label', '<xml><getter>otherEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(26, 3, 'hs_hr_emp_emergency_contacts.eec_name', 'Name', 'ecname', 'false', NULL, NULL, 'label', '<xml><getter>ecname</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(27, 3, 'hs_hr_emp_emergency_contacts.eec_home_no', 'Home Telephone', 'ecHomeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecHomeTelephone</getter></xml>', '130', '0', NULL, 1, 3, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(28, 3, 'hs_hr_emp_emergency_contacts.eec_office_no', 'Work Telephone', 'ecWorkTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecWorkTelephone</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(29, 3, 'hs_hr_emp_emergency_contacts.eec_relationship', 'Relationship', 'ecRelationship', 'false', NULL, NULL, 'label', '<xml><getter>ecRelationship</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(30, 3, 'hs_hr_emp_emergency_contacts.eec_mobile_no', 'Mobile', 'ecMobile', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(31, 3, 'hs_hr_emp_dependents.ed_name', 'Name', 'dependentName', 'false', NULL, NULL, 'label', '<xml><getter>dependentName</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(32, 3, 'IF (hs_hr_emp_dependents.ed_relationship_type = ''other'', hs_hr_emp_dependents.ed_relationship, hs_hr_emp_dependents.ed_relationship_type)', 'Relationship', 'dependentRelationship', 'false', NULL, NULL, 'label', '<xml><getter>dependentRelationship</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(33, 3, 'hs_hr_emp_dependents.ed_date_of_birth', 'Date of Birth', 'dependentDateofBirth', 'false', NULL, NULL, 'labelDate', '<xml><getter>dependentDateofBirth</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(35, 3, 'ohrm_membership.name', 'Membership', 'name', 'false', NULL, NULL, 'label', '<xml><getter>name</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(36, 3, 'hs_hr_emp_member_detail.ememb_subscript_ownership', 'Subscription Paid By', 'subscriptionPaidBy', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionPaidBy</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(37, 3, 'hs_hr_emp_member_detail.ememb_subscript_amount', 'Subscription Amount', 'subscriptionAmount', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionAmount</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(38, 3, 'hs_hr_emp_member_detail.ememb_subs_currency', 'Currency', 'membershipCurrency', 'false', NULL, NULL, 'label', '<xml><getter>membershipCurrency</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(39, 3, 'hs_hr_emp_member_detail.ememb_commence_date', 'Subscription Commence Date', 'subscriptionCommenceDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionCommenceDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(40, 3, 'hs_hr_emp_member_detail.ememb_renewal_date', 'Subscription Renewal Date', 'subscriptionRenewalDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionRenewalDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(41, 3, 'hs_hr_emp_work_experience.eexp_employer', 'Company', 'expCompany', 'false', NULL, NULL, 'label', '<xml><getter>expCompany</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(42, 3, 'hs_hr_emp_work_experience.eexp_jobtit', 'Job Title', 'expJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>expJobTitle</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(43, 3, 'hs_hr_emp_work_experience.eexp_from_date', 'From', 'expFrom', 'false', NULL, NULL, 'labelDate', '<xml><getter>expFrom</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(44, 3, 'hs_hr_emp_work_experience.eexp_to_date', 'To', 'expTo', 'false', NULL, NULL, 'labelDate', '<xml><getter>expTo</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(45, 3, 'hs_hr_emp_work_experience.eexp_comments', 'Comment', 'expComment', 'false', NULL, NULL, 'label', '<xml><getter>expComment</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(47, 3, 'ohrm_education.name', 'Level', 'eduProgram', 'false', NULL, NULL, 'label', '<xml><getter>eduProgram</getter></xml>', '200', '0', NULL, 1, 11, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(48, 3, 'ohrm_emp_education.year', 'Year', 'eduYear', 'false', NULL, NULL, 'label', '<xml><getter>eduYear</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(49, 3, 'ohrm_emp_education.score', 'Score', 'eduGPAOrScore', 'false', NULL, NULL, 'label', '<xml><getter>eduGPAOrScore</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(52, 3, 'ohrm_skill.name', 'Skill', 'skill', 'false', NULL, NULL, 'label', '<xml><getter>skill</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(53, 3, 'hs_hr_emp_skill.years_of_exp', 'Years of Experience', 'skillYearsOfExperience', 'false', NULL, NULL, 'label', '<xml><getter>skillYearsOfExperience</getter></xml>', '135', '0', NULL, 1, 12, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(54, 3, 'hs_hr_emp_skill.comments', 'Comments', 'skillComments', 'false', NULL, NULL, 'label', '<xml><getter>skillComments</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(55, 3, 'ohrm_language.name', 'Language', 'langName', 'false', NULL, NULL, 'label', '<xml><getter>langName</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(57, 3, 'CASE hs_hr_emp_language.competency WHEN 1 THEN "Poor" WHEN 2 THEN "Basic" WHEN 3 THEN "Good" WHEN 4 THEN "Mother Tongue" END', 'Competency', 'langCompetency', 'false', NULL, NULL, 'label', '<xml><getter>langCompetency</getter></xml>', '130', '0', NULL, 1, 13, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(58, 3, 'hs_hr_emp_language.comments', 'Comments', 'langComments', 'false', NULL, NULL, 'label', '<xml><getter>langComments</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(59, 3, 'ohrm_license.name', 'License Type', 'empLicenseType', 'false', NULL, NULL, 'label', '<xml><getter>empLicenseType</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(60, 3, 'ohrm_emp_license.license_issued_date', 'Issued Date', 'empLicenseIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseIssuedDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(61, 3, 'ohrm_emp_license.license_expiry_date', 'Expiry Date', 'empLicenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseExpiryDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(62, 3, 'supervisor.emp_firstname', 'First Name', 'supervisorFirstName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorFirstName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(63, 3, 'subordinate.emp_firstname', 'First Name', 'subordinateFirstName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateFirstName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(64, 3, 'supervisor.emp_lastname', 'Last Name', 'supervisorLastName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorLastName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(65, 3, 'ohrm_pay_grade.name', 'Pay Grade', 'salPayGrade', 'false', NULL, NULL, 'label', '<xml><getter>salPayGrade</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(66, 3, 'hs_hr_emp_basicsalary.salary_component', 'Salary Component', 'salSalaryComponent', 'false', NULL, NULL, 'label', '<xml><getter>salSalaryComponent</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(67, 3, 'hs_hr_emp_basicsalary.ebsal_basic_salary', 'Amount', 'salAmount', 'false', NULL, NULL, 'label', '<xml><getter>salAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 1, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(68, 3, 'hs_hr_emp_basicsalary.comments', 'Comments', 'salComments', 'false', NULL, NULL, 'label', '<xml><getter>salComments</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(69, 3, 'hs_hr_payperiod.payperiod_name', 'Pay Frequency', 'salPayFrequency', 'false', NULL, NULL, 'label', '<xml><getter>salPayFrequency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(70, 3, 'hs_hr_currency_type.currency_name', 'Currency', 'salCurrency', 'false', NULL, NULL, 'label', '<xml><getter>salCurrency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(71, 3, 'hs_hr_emp_directdebit.dd_account', 'Direct Deposit Account Number', 'ddAccountNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(72, 3, 'hs_hr_emp_directdebit.dd_account_type', 'Direct Deposit Account Type', 'ddAccountType', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountType</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(73, 3, 'hs_hr_emp_directdebit.dd_routing_num', 'Direct Deposit Routing Number', 'ddRoutingNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddRoutingNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(74, 3, 'hs_hr_emp_directdebit.dd_amount', 'Direct Deposit Amount', 'ddAmount', 'false', NULL, NULL, 'label', '<xml><getter>ddAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(75, 3, 'hs_hr_emp_contract_extend.econ_extend_start_date', 'Contract Start Date', 'empContStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContStartDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(76, 3, 'hs_hr_emp_contract_extend.econ_extend_end_date', 'Contract End Date', 'empContEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContEndDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(77, 3, 'ohrm_job_title.job_title', 'Job Title', 'empJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>empJobTitle</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(78, 3, 'ohrm_employment_status.name', 'Employment Status', 'empEmploymentStatus', 'false', NULL, NULL, 'label', '<xml><getter>empEmploymentStatus</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(80, 3, 'ohrm_job_category.name', 'Job Category', 'empJobCategory', 'false', NULL, NULL, 'label', '<xml><getter>empJobCategory</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(81, 3, 'hs_hr_employee.joined_date', 'Joined Date', 'empJoinedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empJoinedDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(82, 3, 'ohrm_subunit.name', 'Sub Unit', 'empSubUnit', 'false', NULL, NULL, 'label', '<xml><getter>empSubUnit</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(83, 3, 'ohrm_location.name', 'Location', 'empLocation', 'false', NULL, NULL, 'label', '<xml><getter>empLocation</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(84, 3, 'hs_hr_emp_passport.ep_passport_num', 'Number', 'empPassportNo', 'false', NULL, NULL, 'label', '<xml><getter>empPassportNo</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(85, 3, 'hs_hr_emp_passport.ep_passportissueddate', 'Issued Date', 'empPassportIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportIssuedDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(86, 3, 'hs_hr_emp_passport.ep_passportexpiredate', 'Expiry Date', 'empPassportExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportExpiryDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(87, 3, 'hs_hr_emp_passport.ep_i9_status', 'Eligibility Status', 'empPassportEligibleStatus', 'false', NULL, NULL, 'label', '<xml><getter>empPassportEligibleStatus</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(88, 3, 'hs_hr_emp_passport.cou_code', 'Issued By', 'empPassportIssuedBy', 'false', NULL, NULL, 'label', '<xml><getter>empPassportIssuedBy</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(89, 3, 'hs_hr_emp_passport.ep_i9_review_date', 'Eligibility Review Date', 'empPassportEligibleReviewDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportEligibleReviewDate</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(90, 3, 'hs_hr_emp_passport.ep_comments', 'Comments', 'empPassportComments', 'false', NULL, NULL, 'label', '<xml><getter>empPassportComments</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(91, 3, 'subordinate.emp_lastname', 'Last Name', 'subordinateLastName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateLastName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(92, 3, 'CASE hs_hr_emp_language.fluency WHEN 1 THEN "Writing" WHEN 2 THEN "Speaking" WHEN 3 THEN "Reading" END', 'Fluency', 'langFluency', 'false', NULL, NULL, 'label', '<xml><getter>langFluency</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(93, 3, 'supervisor_reporting_method.reporting_method_name', 'Reporting Method', 'supReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>supReportingMethod</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(94, 3, 'subordinate_reporting_method.reporting_method_name', 'Reporting Method', 'subReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>subReportingMethod</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(95, 3, 'CASE hs_hr_emp_passport.ep_passport_type_flg WHEN 1 THEN "Passport" WHEN 2 THEN "Visa" END', 'Document Type', 'documentType', 'false', NULL, NULL, 'label', '<xml><getter>documentType</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(97, 3, 'hs_hr_employee.emp_other_id', 'Other Id', 'otherId', 'false', NULL, NULL, 'label', '<xml><getter>otherId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(98, 3, 'hs_hr_emp_emergency_contacts.eec_seqno', 'ecSeqNo', 'ecSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(99, 3, 'hs_hr_emp_dependents.ed_seqno', 'SeqNo', 'edSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(100, 3, 'hs_hr_emp_passport.ep_seqno', 'SeqNo', 'epSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(101, 3, 'hs_hr_emp_basicsalary.id', 'salaryId', 'salaryId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 7, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(102, 3, 'subordinate.emp_number', 'subordinateId', 'subordinateId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 8, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(103, 3, 'supervisor.emp_number', 'supervisorId', 'supervisorId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 9, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(104, 3, 'hs_hr_emp_work_experience.eexp_seqno', 'workExpSeqNo', 'workExpSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(105, 3, 'ohrm_emp_education.education_id', 'empEduCode', 'empEduCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(106, 3, 'hs_hr_emp_skill.skill_id', 'empSkillCode', 'empSkillCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 12, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(107, 3, 'hs_hr_emp_language.lang_id', 'empLangCode', 'empLangCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(108, 3, 'hs_hr_emp_language.fluency', 'empLangType', 'empLangType', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(109, 3, 'ohrm_emp_license.license_id', 'empLicenseCode', 'empLicenseCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(110, 3, 'hs_hr_emp_member_detail.membship_code', 'membershipCode', 'membershipCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 15, '---', 0, 1);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(112, 3, 'ROUND(DATEDIFF(hs_hr_emp_work_experience.eexp_to_date, hs_hr_emp_work_experience.eexp_from_date)/365,1)', 'Duration', 'expDuration', 'false', NULL, NULL, 'label', '<xml><getter>expDuration</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(113, 3, 'ohrm_emp_termination.termination_date', 'Termination Date', 'terminationDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>terminationDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(114, 3, 'ohrm_emp_termination_reason.name', 'Termination Reason', 'terminationReason', 'false', NULL, NULL, 'label', '<xml><getter>terminationReason</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(115, 3, 'ohrm_emp_education.institute', 'Institute', 'getInstitute', 'false', NULL, NULL, 'label', '<xml><getter>getInstitute</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(116, 3, 'ohrm_emp_education.major', 'Major/Specialization', 'getMajor', 'false', NULL, NULL, 'label', '<xml><getter>getMajor</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(117, 3, 'ohrm_emp_education.start_date', 'Start Date', 'getStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getStartDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(118, 3, 'ohrm_emp_education.end_date', 'End Date', 'getEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getEndDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(119, 3, 'ohrm_emp_license.license_no', 'License Number', 'getLicenseNo', 'false', NULL, NULL, 'label', '<xml><getter>getLicenseNo</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(120, 3, 'ohrm_emp_termination.note', 'Termination Note', 'getNote', 'false', NULL, NULL, 'label', '<xml><getter>getNote</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(126, 3, 'hs_hr_employee.custom1', 'Timesheet Required', 'customField1', 'false', NULL, NULL, 'label', '<xml><getter>customField1</getter></xml>', '200', '1', NULL, 0, 16, '---', 0, 0);
INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES(127, 3, 'hs_hr_employee.custom2', 'Authorize Click on Timesheet Items', 'customField2', 'false', NULL, NULL, 'label', '<xml><getter>customField2</getter></xml>', '200', '1', NULL, 0, 16, '---', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field_group`
--

DROP TABLE IF EXISTS `ohrm_display_field_group`;
CREATE TABLE `ohrm_display_field_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_list` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_display_field_group`
--

TRUNCATE TABLE `ohrm_display_field_group`;
--
-- Dumping data for table `ohrm_display_field_group`
--

INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(1, 3, 'Personal', 0);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(2, 3, 'Contact Details', 0);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(3, 3, 'Emergency Contacts', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(4, 3, 'Dependents', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(5, 3, 'Immigration', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(6, 3, 'Job', 0);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(7, 3, 'Salary', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(8, 3, 'Subordinates', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(9, 3, 'Supervisors', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(10, 3, 'Work Experience', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(11, 3, 'Education', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(12, 3, 'Skills', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(13, 3, 'Languages', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(14, 3, 'License', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(15, 3, 'Memberships', 1);
INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES(16, 3, 'Custom Fields', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_education`
--

DROP TABLE IF EXISTS `ohrm_education`;
CREATE TABLE `ohrm_education` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_education`
--

TRUNCATE TABLE `ohrm_education`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email`
--

DROP TABLE IF EXISTS `ohrm_email`;
CREATE TABLE `ohrm_email` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_email`
--

TRUNCATE TABLE `ohrm_email`;
--
-- Dumping data for table `ohrm_email`
--

INSERT INTO `ohrm_email` (`id`, `name`) VALUES(1, 'leave.apply');
INSERT INTO `ohrm_email` (`id`, `name`) VALUES(3, 'leave.approve');
INSERT INTO `ohrm_email` (`id`, `name`) VALUES(2, 'leave.assign');
INSERT INTO `ohrm_email` (`id`, `name`) VALUES(4, 'leave.cancel');
INSERT INTO `ohrm_email` (`id`, `name`) VALUES(6, 'leave.change');
INSERT INTO `ohrm_email` (`id`, `name`) VALUES(5, 'leave.reject');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_configuration`
--

DROP TABLE IF EXISTS `ohrm_email_configuration`;
CREATE TABLE `ohrm_email_configuration` (
  `id` int(10) NOT NULL,
  `mail_type` varchar(50) DEFAULT NULL,
  `sent_as` varchar(250) NOT NULL,
  `sendmail_path` varchar(250) DEFAULT NULL,
  `smtp_host` varchar(250) DEFAULT NULL,
  `smtp_port` int(10) DEFAULT NULL,
  `smtp_username` varchar(250) DEFAULT NULL,
  `smtp_password` varchar(250) DEFAULT NULL,
  `smtp_auth_type` varchar(50) DEFAULT NULL,
  `smtp_security_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_email_configuration`
--

TRUNCATE TABLE `ohrm_email_configuration`;
--
-- Dumping data for table `ohrm_email_configuration`
--

INSERT INTO `ohrm_email_configuration` (`id`, `mail_type`, `sent_as`, `sendmail_path`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `smtp_auth_type`, `smtp_security_type`) VALUES(1, 'smtp', 'hr@upskills.com', 'C:\\Program Files (x86)\\EasyPHP\\binaries\\sendmail\\sendmail.exe', 'smtp.upskills.com', 587, 'hr@upskills.com', 'Upsk1lls', 'login', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_notification`
--

DROP TABLE IF EXISTS `ohrm_email_notification`;
CREATE TABLE `ohrm_email_notification` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_enable` int(6) NOT NULL,
  `one_time_per_day` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_email_notification`
--

TRUNCATE TABLE `ohrm_email_notification`;
--
-- Dumping data for table `ohrm_email_notification`
--

INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`, `one_time_per_day`) VALUES(1, 'Leave Applications', 0, NULL);
INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`, `one_time_per_day`) VALUES(2, 'Leave Assignments', 0, NULL);
INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`, `one_time_per_day`) VALUES(3, 'Leave Approvals', 0, NULL);
INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`, `one_time_per_day`) VALUES(4, 'Leave Cancellations', 0, NULL);
INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`, `one_time_per_day`) VALUES(5, 'Leave Rejections', 0, NULL);
INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`, `one_time_per_day`) VALUES(6, 'Timesheets Automatic Notifications', 1, '2016-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_processor`
--

DROP TABLE IF EXISTS `ohrm_email_processor`;
CREATE TABLE `ohrm_email_processor` (
  `id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_email_processor`
--

TRUNCATE TABLE `ohrm_email_processor`;
--
-- Dumping data for table `ohrm_email_processor`
--

INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES(1, 1, 'LeaveEmailProcessor');
INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES(2, 2, 'LeaveEmailProcessor');
INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES(3, 3, 'LeaveEmailProcessor');
INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES(4, 4, 'LeaveEmailProcessor');
INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES(5, 5, 'LeaveEmailProcessor');
INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES(6, 6, 'LeaveChangeMailProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_subscriber`
--

DROP TABLE IF EXISTS `ohrm_email_subscriber`;
CREATE TABLE `ohrm_email_subscriber` (
  `id` int(6) NOT NULL,
  `notification_id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_email_subscriber`
--

TRUNCATE TABLE `ohrm_email_subscriber`;
--
-- Dumping data for table `ohrm_email_subscriber`
--

INSERT INTO `ohrm_email_subscriber` (`id`, `notification_id`, `name`, `email`) VALUES(1, 2, 'you', 'marc.ghilardi@upskills.com');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_template`
--

DROP TABLE IF EXISTS `ohrm_email_template`;
CREATE TABLE `ohrm_email_template` (
  `id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `performer_role` varchar(50) DEFAULT NULL,
  `recipient_role` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_email_template`
--

TRUNCATE TABLE `ohrm_email_template`;
--
-- Dumping data for table `ohrm_email_template`
--

INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(1, 1, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(2, 1, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubscriberBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(3, 3, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(4, 3, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(5, 2, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(6, 2, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubjectForSupervisors.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBodyForSupervisors.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(7, 2, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(8, 4, 'en_US', 'ess', 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(9, 4, 'en_US', 'ess', 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(10, 4, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(11, 4, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(12, 5, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(13, 5, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(14, 6, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeBody.txt');
INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES(15, 6, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberBody.txt');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employee_work_shift`
--

DROP TABLE IF EXISTS `ohrm_employee_work_shift`;
CREATE TABLE `ohrm_employee_work_shift` (
  `work_shift_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_employee_work_shift`
--

TRUNCATE TABLE `ohrm_employee_work_shift`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employment_status`
--

DROP TABLE IF EXISTS `ohrm_employment_status`;
CREATE TABLE `ohrm_employment_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_employment_status`
--

TRUNCATE TABLE `ohrm_employment_status`;
--
-- Dumping data for table `ohrm_employment_status`
--

INSERT INTO `ohrm_employment_status` (`id`, `name`) VALUES(1, 'Permanent');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_education`
--

DROP TABLE IF EXISTS `ohrm_emp_education`;
CREATE TABLE `ohrm_emp_education` (
  `id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `institute` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `score` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_emp_education`
--

TRUNCATE TABLE `ohrm_emp_education`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_license`
--

DROP TABLE IF EXISTS `ohrm_emp_license`;
CREATE TABLE `ohrm_emp_license` (
  `emp_number` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `license_issued_date` date DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_emp_license`
--

TRUNCATE TABLE `ohrm_emp_license`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_reporting_method`
--

DROP TABLE IF EXISTS `ohrm_emp_reporting_method`;
CREATE TABLE `ohrm_emp_reporting_method` (
  `reporting_method_id` int(7) NOT NULL,
  `reporting_method_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_emp_reporting_method`
--

TRUNCATE TABLE `ohrm_emp_reporting_method`;
--
-- Dumping data for table `ohrm_emp_reporting_method`
--

INSERT INTO `ohrm_emp_reporting_method` (`reporting_method_id`, `reporting_method_name`) VALUES(1, 'Direct');
INSERT INTO `ohrm_emp_reporting_method` (`reporting_method_id`, `reporting_method_name`) VALUES(2, 'Indirect');
INSERT INTO `ohrm_emp_reporting_method` (`reporting_method_id`, `reporting_method_name`) VALUES(3, 'Functional');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination`
--

DROP TABLE IF EXISTS `ohrm_emp_termination`;
CREATE TABLE `ohrm_emp_termination` (
  `id` int(4) NOT NULL,
  `emp_number` int(4) DEFAULT NULL,
  `reason_id` int(4) DEFAULT NULL,
  `termination_date` date NOT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_emp_termination`
--

TRUNCATE TABLE `ohrm_emp_termination`;
--
-- Dumping data for table `ohrm_emp_termination`
--

INSERT INTO `ohrm_emp_termination` (`id`, `emp_number`, `reason_id`, `termination_date`, `note`) VALUES(1, 27, 6, '2015-05-08', '');
INSERT INTO `ohrm_emp_termination` (`id`, `emp_number`, `reason_id`, `termination_date`, `note`) VALUES(2, 12, 10, '2015-04-30', '');
INSERT INTO `ohrm_emp_termination` (`id`, `emp_number`, `reason_id`, `termination_date`, `note`) VALUES(3, 20, 4, '2015-05-04', '');
INSERT INTO `ohrm_emp_termination` (`id`, `emp_number`, `reason_id`, `termination_date`, `note`) VALUES(4, 26, 6, '2015-02-28', '');
INSERT INTO `ohrm_emp_termination` (`id`, `emp_number`, `reason_id`, `termination_date`, `note`) VALUES(5, 23, 3, '2015-03-31', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination_reason`
--

DROP TABLE IF EXISTS `ohrm_emp_termination_reason`;
CREATE TABLE `ohrm_emp_termination_reason` (
  `id` int(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_emp_termination_reason`
--

TRUNCATE TABLE `ohrm_emp_termination_reason`;
--
-- Dumping data for table `ohrm_emp_termination_reason`
--

INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(1, 'Other');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(2, 'Retired');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(3, 'Contract Not Renewed');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(4, 'Resigned - Company Requested');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(5, 'Resigned - Self Proposed');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(6, 'Resigned');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(7, 'Deceased');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(8, 'Physically Disabled/Compensated');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(9, 'Laid-off');
INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES(10, 'Dismissed');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_filter_field`
--

DROP TABLE IF EXISTS `ohrm_filter_field`;
CREATE TABLE `ohrm_filter_field` (
  `filter_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `where_clause_part` mediumtext NOT NULL,
  `filter_field_widget` varchar(255) DEFAULT NULL,
  `condition_no` int(20) NOT NULL,
  `required` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_filter_field`
--

TRUNCATE TABLE `ohrm_filter_field`;
--
-- Dumping data for table `ohrm_filter_field`
--

INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(1, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectList', 2, 'true');
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(2, 1, 'activity_show_deleted', 'ohrm_project_activity.is_deleted', 'ohrmWidgetInputCheckbox', 2, 'false');
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(3, 1, 'project_date_range', 'date', 'ohrmWidgetDateRange', 1, 'false');
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(4, 1, 'employee', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 2, 'true');
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(5, 1, 'activity_name', 'ohrm_project_activity.activity_id', 'ohrmWidgetProjectActivityList', 2, 'true');
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(6, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectListWithAllOption', 2, 'true');
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(7, 1, 'only_include_approved_timesheets', 'ohrm_timesheet.state', 'ohrmWidgetApprovedTimesheetInputCheckBox', 2, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(8, 3, 'employee_name', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(9, 3, 'pay_grade', 'hs_hr_emp_basicsalary.sal_grd_code', 'ohrmReportWidgetPayGradeDropDown', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(10, 3, 'education', 'ohrm_emp_education.education_id', 'ohrmReportWidgetEducationtypeDropDown', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(11, 3, 'employment_status', 'hs_hr_employee.emp_status', 'ohrmWidgetEmploymentStatusList', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(12, 3, 'service_period', 'datediff(current_date(), hs_hr_employee.joined_date)/365', 'ohrmReportWidgetServicePeriod', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(13, 3, 'joined_date', 'hs_hr_employee.joined_date', 'ohrmReportWidgetJoinedDate', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(14, 3, 'job_title', 'hs_hr_employee.job_title_code', 'ohrmWidgetJobTitleList', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(15, 3, 'language', 'hs_hr_emp_language.lang_id', 'ohrmReportWidgetLanguageDropDown', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(16, 3, 'skill', 'hs_hr_emp_skill.skill_id', 'ohrmReportWidgetSkillDropDown', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(17, 3, 'age_group', 'datediff(current_date(), hs_hr_employee.emp_birthday)/365', 'ohrmReportWidgetAgeGroup', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(18, 3, 'sub_unit', 'hs_hr_employee.work_station', 'ohrmWidgetSubDivisionList', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(19, 3, 'gender', 'hs_hr_employee.emp_gender', 'ohrmReportWidgetGenderDropDown', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(20, 3, 'location', 'ohrm_location.id', 'ohrmReportWidgetOperationalCountryLocationDropDown', 1, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(21, 1, 'is_deleted', 'ohrm_project_activity.is_deleted', '', 2, NULL);
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(22, 3, 'include', 'hs_hr_employee.termination_id', 'ohrmReportWidgetIncludedEmployeesDropDown', 1, 'true');
INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES(23, 1, 'output_format', '', 'ohrmWidgetTimesheetFormatOption', 1, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_group_field`
--

DROP TABLE IF EXISTS `ohrm_group_field`;
CREATE TABLE `ohrm_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_by_clause` mediumtext NOT NULL,
  `group_field_widget` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_group_field`
--

TRUNCATE TABLE `ohrm_group_field`;
--
-- Dumping data for table `ohrm_group_field`
--

INSERT INTO `ohrm_group_field` (`group_field_id`, `name`, `group_by_clause`, `group_field_widget`) VALUES(1, 'activity id', 'GROUP BY ohrm_project_activity.activity_id', NULL);
INSERT INTO `ohrm_group_field` (`group_field_id`, `name`, `group_by_clause`, `group_field_widget`) VALUES(2, 'employee number', 'GROUP BY hs_hr_employee.emp_number', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_holiday`
--

DROP TABLE IF EXISTS `ohrm_holiday`;
CREATE TABLE `ohrm_holiday` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `recurring` tinyint(3) UNSIGNED DEFAULT '0',
  `length` int(10) UNSIGNED DEFAULT NULL,
  `operational_country_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_holiday`
--

TRUNCATE TABLE `ohrm_holiday`;
--
-- Dumping data for table `ohrm_holiday`
--

INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(1, 'Christmas', '2014-12-25', 1, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(2, 'New Year''s Day', '2014-01-01', 1, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(3, 'Chinese New Year', '2014-01-31', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(4, 'Good Friday', '2014-04-18', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(5, 'Labour Day', '2014-05-01', 1, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(6, 'Vesak Day', '2014-05-13', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(8, 'Hari Raya Haji', '2014-10-05', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(10, 'Hari Raya Puasa', '2014-07-28', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(11, 'Chinese New Year', '2015-02-19', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(12, 'Chinese New Year', '2015-02-20', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(13, 'Good Friday', '2015-04-03', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(14, 'Vesak Day', '2015-06-01', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(15, 'Hari Raya Puasa', '2015-07-17', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(16, 'National Day', '2015-08-10', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(17, 'Hari Raya Haji', '2015-09-24', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(18, 'Deepavali', '2015-11-10', 0, 0, NULL);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(19, 'singaporian', '2016-08-25', 1, 0, 1);
INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES(20, 'vietnamian', '2016-08-29', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_home_page`
--

DROP TABLE IF EXISTS `ohrm_home_page`;
CREATE TABLE `ohrm_home_page` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_home_page`
--

TRUNCATE TABLE `ohrm_home_page`;
--
-- Dumping data for table `ohrm_home_page`
--

INSERT INTO `ohrm_home_page` (`id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(1, 1, 'dashboard/index', NULL, 15);
INSERT INTO `ohrm_home_page` (`id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(2, 2, 'dashboard/index', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate`
--

DROP TABLE IF EXISTS `ohrm_job_candidate`;
CREATE TABLE `ohrm_job_candidate` (
  `id` int(13) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `comment` text,
  `mode_of_application` int(4) NOT NULL,
  `date_of_application` date NOT NULL,
  `cv_file_id` int(13) DEFAULT NULL,
  `cv_text_version` text,
  `keywords` varchar(255) DEFAULT NULL,
  `added_person` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_candidate`
--

TRUNCATE TABLE `ohrm_job_candidate`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_attachment`
--

DROP TABLE IF EXISTS `ohrm_job_candidate_attachment`;
CREATE TABLE `ohrm_job_candidate_attachment` (
  `id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_candidate_attachment`
--

TRUNCATE TABLE `ohrm_job_candidate_attachment`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_history`
--

DROP TABLE IF EXISTS `ohrm_job_candidate_history`;
CREATE TABLE `ohrm_job_candidate_history` (
  `id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) DEFAULT NULL,
  `candidate_vacancy_name` varchar(255) DEFAULT NULL,
  `interview_id` int(13) DEFAULT NULL,
  `action` int(4) NOT NULL,
  `performed_by` int(13) DEFAULT NULL,
  `performed_date` datetime NOT NULL,
  `note` text,
  `interviewers` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_candidate_history`
--

TRUNCATE TABLE `ohrm_job_candidate_history`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_vacancy`
--

DROP TABLE IF EXISTS `ohrm_job_candidate_vacancy`;
CREATE TABLE `ohrm_job_candidate_vacancy` (
  `id` int(13) DEFAULT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_candidate_vacancy`
--

TRUNCATE TABLE `ohrm_job_candidate_vacancy`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_category`
--

DROP TABLE IF EXISTS `ohrm_job_category`;
CREATE TABLE `ohrm_job_category` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_category`
--

TRUNCATE TABLE `ohrm_job_category`;
--
-- Dumping data for table `ohrm_job_category`
--

INSERT INTO `ohrm_job_category` (`id`, `name`) VALUES(10, 'Consultants');
INSERT INTO `ohrm_job_category` (`id`, `name`) VALUES(11, 'Administration');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview`
--

DROP TABLE IF EXISTS `ohrm_job_interview`;
CREATE TABLE `ohrm_job_interview` (
  `id` int(13) NOT NULL,
  `candidate_vacancy_id` int(13) DEFAULT NULL,
  `candidate_id` int(13) DEFAULT NULL,
  `interview_name` varchar(100) NOT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_interview`
--

TRUNCATE TABLE `ohrm_job_interview`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_attachment`
--

DROP TABLE IF EXISTS `ohrm_job_interview_attachment`;
CREATE TABLE `ohrm_job_interview_attachment` (
  `id` int(13) NOT NULL,
  `interview_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_interview_attachment`
--

TRUNCATE TABLE `ohrm_job_interview_attachment`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_interviewer`
--

DROP TABLE IF EXISTS `ohrm_job_interview_interviewer`;
CREATE TABLE `ohrm_job_interview_interviewer` (
  `interview_id` int(13) NOT NULL,
  `interviewer_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_interview_interviewer`
--

TRUNCATE TABLE `ohrm_job_interview_interviewer`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_specification_attachment`
--

DROP TABLE IF EXISTS `ohrm_job_specification_attachment`;
CREATE TABLE `ohrm_job_specification_attachment` (
  `id` int(13) NOT NULL,
  `job_title_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_specification_attachment`
--

TRUNCATE TABLE `ohrm_job_specification_attachment`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_title`
--

DROP TABLE IF EXISTS `ohrm_job_title`;
CREATE TABLE `ohrm_job_title` (
  `id` int(13) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `job_description` varchar(400) DEFAULT NULL,
  `note` varchar(400) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_title`
--

TRUNCATE TABLE `ohrm_job_title`;
--
-- Dumping data for table `ohrm_job_title`
--

INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(1, 'ty', 'crois', '', 1);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(2, 'job title B', 'this is job title B for testing', 'job title B note', 0);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(3, 'h', 'h', '', 0);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(4, 'Intern', '', '', 0);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(5, 'tre', 'tre', '', 1);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(6, 'tre', 'tre', '', 1);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(7, 'test', 'humn', '', 0);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(8, 'P', 'P', '', 0);
INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES(9, 'HR Admin', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy`
--

DROP TABLE IF EXISTS `ohrm_job_vacancy`;
CREATE TABLE `ohrm_job_vacancy` (
  `id` int(13) NOT NULL,
  `job_title_code` int(4) NOT NULL,
  `hiring_manager_id` int(13) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `no_of_positions` int(13) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `published_in_feed` tinyint(1) NOT NULL DEFAULT '0',
  `defined_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_vacancy`
--

TRUNCATE TABLE `ohrm_job_vacancy`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy_attachment`
--

DROP TABLE IF EXISTS `ohrm_job_vacancy_attachment`;
CREATE TABLE `ohrm_job_vacancy_attachment` (
  `id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_job_vacancy_attachment`
--

TRUNCATE TABLE `ohrm_job_vacancy_attachment`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_kpi`
--

DROP TABLE IF EXISTS `ohrm_kpi`;
CREATE TABLE `ohrm_kpi` (
  `id` bigint(20) NOT NULL,
  `job_title_code` varchar(10) DEFAULT NULL,
  `kpi_indicators` varchar(255) DEFAULT NULL,
  `min_rating` int(7) DEFAULT '0',
  `max_rating` int(7) DEFAULT '0',
  `default_kpi` smallint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_kpi`
--

TRUNCATE TABLE `ohrm_kpi`;
--
-- Dumping data for table `ohrm_kpi`
--

INSERT INTO `ohrm_kpi` (`id`, `job_title_code`, `kpi_indicators`, `min_rating`, `max_rating`, `default_kpi`, `deleted_at`) VALUES(8, '4', 'Autonomous', 1, 5, 1, NULL);
INSERT INTO `ohrm_kpi` (`id`, `job_title_code`, `kpi_indicators`, `min_rating`, `max_rating`, `default_kpi`, `deleted_at`) VALUES(9, '4', 'Smart', 1, 5, NULL, NULL);
INSERT INTO `ohrm_kpi` (`id`, `job_title_code`, `kpi_indicators`, `min_rating`, `max_rating`, `default_kpi`, `deleted_at`) VALUES(10, '4', 'Soft', 1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_language`
--

DROP TABLE IF EXISTS `ohrm_language`;
CREATE TABLE `ohrm_language` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_language`
--

TRUNCATE TABLE `ohrm_language`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave`
--

DROP TABLE IF EXISTS `ohrm_leave`;
CREATE TABLE `ohrm_leave` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `length_hours` decimal(6,2) UNSIGNED DEFAULT NULL,
  `length_days` decimal(6,4) UNSIGNED DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `comments` varchar(256) DEFAULT NULL,
  `leave_request_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `emp_number` int(7) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `duration_type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave`
--

TRUNCATE TABLE `ohrm_leave`;
--
-- Dumping data for table `ohrm_leave`
--

INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(147, '2014-06-05', '8.00', '1.0000', 3, NULL, 45, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(148, '2014-06-06', '8.00', '1.0000', 3, NULL, 45, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(149, '2014-05-16', '4.00', '0.5000', 3, NULL, 46, 4, 7, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(150, '2014-07-21', '8.00', '1.0000', 3, NULL, 47, 4, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(151, '2014-05-30', '4.00', '0.5000', 3, NULL, 48, 1, 20, '13:00:00', '17:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(152, '2014-07-08', '8.00', '1.0000', 3, NULL, 49, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(153, '2014-07-09', '8.00', '1.0000', 3, NULL, 49, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(154, '2014-07-14', '8.00', '1.0000', 3, NULL, 50, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(155, '2014-07-15', '8.00', '1.0000', 3, NULL, 50, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(156, '2014-08-12', '8.00', '1.0000', 3, '', 51, 5, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(157, '2014-08-14', '4.00', '0.5000', 3, '', 52, 1, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(159, '2014-08-29', '8.00', '1.0000', 3, '22-08-2014 06:35 Yoppy Winata\r\n\r\nas approved by Hemant\r\n\r\n', 54, 4, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(160, '2014-08-28', '4.00', '0.5000', 3, '22-08-2014 06:36 Yoppy Winata\r\n\r\nas approved by Hemant\r\n\r\n', 55, 4, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(161, '2014-09-12', '8.00', '1.0000', 3, '', 56, 5, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(162, '2014-09-22', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(163, '2014-09-23', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(164, '2014-09-24', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(165, '2014-09-25', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(166, '2014-09-26', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(167, '2014-09-27', '0.00', '0.0000', 4, NULL, 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(168, '2014-09-28', '0.00', '0.0000', 4, NULL, 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(169, '2014-09-29', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(170, '2014-09-30', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(171, '2014-10-01', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(172, '2014-10-02', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(173, '2014-10-03', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(174, '2014-10-04', '0.00', '0.0000', 4, NULL, 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(175, '2014-10-05', '0.00', '0.0000', 5, NULL, 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(176, '2014-10-06', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(177, '2014-10-07', '8.00', '1.0000', 3, '', 57, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(178, '2014-09-18', '8.00', '1.0000', 3, '', 58, 4, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(179, '2014-12-05', '8.00', '1.0000', 3, '', 59, 4, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(180, '2014-08-28', '8.00', '1.0000', 3, '', 60, 2, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(181, '2014-04-11', '8.00', '1.0000', 3, NULL, 61, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(182, '2014-01-27', '8.00', '1.0000', 3, NULL, 62, 9, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(183, '2014-01-28', '4.00', '0.5000', 3, NULL, 63, 9, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(184, '2014-01-28', '4.00', '0.5000', 3, NULL, 64, 1, 5, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(185, '2014-01-29', '8.00', '1.0000', 3, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(186, '2014-01-30', '8.00', '1.0000', 3, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(187, '2014-01-31', '0.00', '0.0000', 5, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(188, '2014-02-01', '0.00', '0.0000', 4, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(189, '2014-02-02', '0.00', '0.0000', 4, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(190, '2014-02-03', '8.00', '1.0000', 3, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(191, '2014-02-04', '8.00', '1.0000', 3, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(192, '2014-02-05', '8.00', '1.0000', 3, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(193, '2014-02-06', '8.00', '1.0000', 3, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(194, '2014-02-07', '8.00', '1.0000', 3, NULL, 64, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(195, '2014-02-10', '8.00', '1.0000', 3, NULL, 65, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(196, '2014-03-06', '8.00', '1.0000', 3, NULL, 66, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(197, '2014-06-19', '8.00', '1.0000', 3, NULL, 67, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(198, '2014-06-20', '8.00', '1.0000', 3, NULL, 68, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(199, '2014-10-08', '8.00', '1.0000', 0, '09-09-2014 15:06 Sun Shuo\r\n\r\nLeave request has been approved by client manager Phoebe Sim\r\n\r\n', 69, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(200, '2014-09-10', '8.00', '1.0000', 3, '', 70, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(201, '2014-09-11', '8.00', '1.0000', 3, '', 71, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(202, '2014-09-08', '4.00', '0.5000', 3, '', 72, 2, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(203, '2014-12-26', '8.00', '1.0000', 3, '', 73, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(204, '2014-12-24', '8.00', '1.0000', 3, '', 74, 10, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(205, '2014-12-22', '8.00', '1.0000', 3, '', 75, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(206, '2014-12-23', '8.00', '1.0000', 3, '', 75, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(207, '2014-10-16', '4.00', '0.5000', 3, '', 76, 1, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(208, '2014-09-25', '4.00', '0.5000', 3, '', 77, 5, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(209, '2014-10-07', '4.00', '0.5000', 3, '', 78, 5, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(210, '2014-10-07', '8.00', '1.0000', 3, '', 79, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(211, '2014-10-02', '8.00', '1.0000', 3, '06-10-2014 04:26 Jianxiong Huang\r\n\r\nFlu\r\n\r\n', 80, 2, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(212, '2014-09-18', '4.00', '0.5000', 3, '08-10-2014 01:50 Djeinabou Kante\r\n\r\nFull day leave\r\n\r\n', 81, 4, 7, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(213, '2014-10-10', '4.00', '0.5000', 0, '10-10-2014 04:42 Varsha Guness\r\n\r\nUnwell\r\n\r\n', 82, 1, 20, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(214, '2014-10-31', '8.00', '1.0000', 3, '13-10-2014 07:53 Chuangchuang Chen\r\n\r\nHi, I would like to request a one day leave for personal reasons.\r\n\r\n', 83, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(215, '2014-10-01', '8.00', '1.0000', 3, '', 84, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(216, '2014-10-02', '8.00', '1.0000', 3, '', 84, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(217, '2014-10-03', '8.00', '1.0000', 3, '', 84, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(218, '2014-07-15', '8.00', '1.0000', 3, '', 85, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(219, '2014-08-11', '8.00', '1.0000', 3, '', 86, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(220, '2014-10-15', '4.00', '0.5000', 3, '13-10-2014 12:18 Varsha Guness\r\n\r\nHi Thong,\r\n\r\nI would like to seek your approval for taking a half-day leave this Wednesday afternoon as I''ll need to see the doctor with regards to health matters. \r\n\r\nThanks.\r\n\r\n', 87, 1, 20, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(221, '2014-11-06', '4.00', '0.5000', 3, '', 88, 4, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(222, '2014-11-06', '4.00', '0.5000', 3, '', 89, 1, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(223, '2014-11-07', '8.00', '1.0000', 3, '', 89, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(224, '2014-10-23', '4.00', '0.5000', 3, '21-10-2014 02:32 Yoppy Winata\r\n\r\nurgent leave\r\n\r\n', 90, 1, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(225, '2014-10-28', '8.00', '1.0000', 3, '28-10-2014 03:07 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\nI have migrain today, but I still can work from home. \r\nthanks,\r\nnadia\r\n\r\n', 91, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(226, '2014-10-23', '8.00', '1.0000', 3, '', 92, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(227, '2014-09-18', '4.00', '0.5000', 3, '', 93, 1, 7, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(228, '2014-10-13', '4.00', '0.5000', 3, '', 94, 1, 7, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(229, '2014-11-06', '8.00', '1.0000', 3, '13-11-2014 03:28 Djeinabou Kante\r\n\r\nMedical Leave 6 & 7 Nov\r\n\r\n', 95, 5, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(230, '2014-11-07', '8.00', '1.0000', 3, '13-11-2014 03:29 Djeinabou Kante\r\n\r\nMedical leave 6 & 7 Nov\r\n\r\n', 96, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(231, '2014-08-04', '4.00', '0.5000', 3, '', 97, 1, 7, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(232, '2014-11-14', '4.00', '0.5000', 3, '', 98, 2, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(233, '2014-11-19', '4.00', '0.5000', 3, '18-11-2014 07:22 Yoppy Winata\r\n\r\nHi Thong, Van Anh,\r\n\r\nPlease approve my urgent leave as I have to take my daughter, who is unwell, to see doctor.\r\n\r\nThank you.\r\n\r\nRegards,\r\nYoppy\r\n\r\n', 99, 1, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(234, '2014-11-26', '4.00', '0.5000', 3, '', 100, 1, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(235, '2014-12-17', '8.00', '1.0000', 3, '', 101, 5, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(236, '2014-12-19', '8.00', '1.0000', 3, '', 102, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(237, '2014-12-20', '0.00', '0.0000', 4, NULL, 102, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(238, '2014-12-21', '0.00', '0.0000', 4, NULL, 102, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(239, '2014-12-22', '8.00', '1.0000', 3, '', 102, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(240, '2014-12-23', '8.00', '1.0000', 3, '', 102, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(241, '2014-12-26', '8.00', '1.0000', 3, '', 103, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(242, '2014-12-27', '0.00', '0.0000', 4, NULL, 103, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(243, '2014-12-28', '0.00', '0.0000', 4, NULL, 103, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(244, '2014-12-29', '8.00', '1.0000', 3, '', 103, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(245, '2014-12-15', '4.00', '0.5000', 3, '23-11-2014 16:37 Chuangchuang Chen\r\n\r\nHi, I would like to request a half day leave as I need to submit my PR application form on Dec-15.\r\n\r\n', 104, 1, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(246, '2014-11-20', '4.00', '0.5000', 3, '', 105, 2, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(247, '2014-11-21', '8.00', '1.0000', 3, '', 105, 2, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(248, '2014-11-25', '8.00', '1.0000', 3, '26-11-2014 11:34 Varsha Guness\r\n\r\nUrgent Leave (Personal Reasons)\r\n\r\n', 106, 11, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(249, '2014-11-26', '4.00', '0.5000', 3, '27-11-2014 08:04 Yoppy Winata\r\n\r\nUrgent leave. Pre approved by Van Anh through email on 26 Nov 2014.\r\n\r\n', 107, 1, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(250, '2014-11-28', '8.00', '1.0000', 3, '28-11-2014 01:07 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI would like to apply medial leave.\r\n\r\nThanks and regards,\r\nnadia\r\n\r\n', 108, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(251, '2014-12-08', '8.00', '1.0000', 3, '01-12-2014 19:40 Jianxiong Huang\r\n\r\nbonjour,\r\n\r\nMay i to take 5 days annual leave for the 2nd week of Dec. my wife will come and visit me.\r\n\r\nI have checked with David, he is ok with this schedule.\r\n\r\nMerci\r\nJianxiong\r\n\r\n', 109, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(252, '2014-12-09', '8.00', '1.0000', 3, '01-12-2014 19:40 Jianxiong Huang\r\n\r\nbonjour,\r\n\r\nMay i to take 5 days annual leave for the 2nd week of Dec. my wife will come and visit me.\r\n\r\nI have checked with David, he is ok with this schedule.\r\n\r\nMerci\r\nJianxiong\r\n\r\n', 109, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(253, '2014-12-10', '8.00', '1.0000', 3, '01-12-2014 19:40 Jianxiong Huang\r\n\r\nbonjour,\r\n\r\nMay i to take 5 days annual leave for the 2nd week of Dec. my wife will come and visit me.\r\n\r\nI have checked with David, he is ok with this schedule.\r\n\r\nMerci\r\nJianxiong\r\n\r\n', 109, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(254, '2014-12-11', '8.00', '1.0000', 3, '01-12-2014 19:40 Jianxiong Huang\r\n\r\nbonjour,\r\n\r\nMay i to take 5 days annual leave for the 2nd week of Dec. my wife will come and visit me.\r\n\r\nI have checked with David, he is ok with this schedule.\r\n\r\nMerci\r\nJianxiong\r\n\r\n', 109, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(255, '2014-12-12', '8.00', '1.0000', 3, '01-12-2014 19:40 Jianxiong Huang\r\n\r\nbonjour,\r\n\r\nMay i to take 5 days annual leave for the 2nd week of Dec. my wife will come and visit me.\r\n\r\nI have checked with David, he is ok with this schedule.\r\n\r\nMerci\r\nJianxiong\r\n\r\n', 109, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(256, '2014-12-24', '8.00', '1.0000', 3, '02-12-2014 04:20 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be on leave since 24th December. Hence, I will be using my 5 days leave this year and remaining 1 day for next year.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(257, '2014-12-25', '0.00', '0.0000', 5, NULL, 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(258, '2014-12-26', '8.00', '1.0000', 3, '02-12-2014 04:20 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be on leave since 24th December. Hence, I will be using my 5 days leave this year and remaining 1 day for next year.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(259, '2014-12-27', '0.00', '0.0000', 4, NULL, 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(260, '2014-12-28', '0.00', '0.0000', 4, NULL, 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(261, '2014-12-29', '8.00', '1.0000', 3, '02-12-2014 04:20 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be on leave since 24th December. Hence, I will be using my 5 days leave this year and remaining 1 day for next year.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(262, '2014-12-30', '8.00', '1.0000', 3, '02-12-2014 04:20 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be on leave since 24th December. Hence, I will be using my 5 days leave this year and remaining 1 day for next year.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(263, '2014-12-31', '8.00', '1.0000', 3, '02-12-2014 04:20 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be on leave since 24th December. Hence, I will be using my 5 days leave this year and remaining 1 day for next year.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 110, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(264, '2014-12-02', '4.00', '0.5000', 3, '02-12-2014 07:05 Yoppy Winata\r\n\r\nhi Thong, Van Anh, \r\n\r\nplease approve my urgent leave. My baby is not well and wife is overwhelmed at home, thus needs my assistance at home.\r\n\r\nI''ve notified Hemant accordingly.\r\n\r\nThanks and regards,\r\nYoppy\r\n\r\n', 111, 1, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(265, '2014-12-08', '8.00', '1.0000', 3, '', 112, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(266, '2014-12-04', '8.00', '1.0000', 0, '04-12-2014 01:15 Varsha Guness\r\n\r\nHi Van Anh, Thong,\r\n\r\nI would like to take a sick leave today as am down with flu. I''ll submit the MC when am back to office.\r\n\r\nThank you,\r\nVarsha\r\n\r\n', 113, 11, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(267, '2014-12-26', '8.00', '1.0000', 3, '08-12-2014 04:16 Chuangchuang Chen\r\n\r\nHi, I would like to clear my day in lieu.\r\n\r\n', 114, 5, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(268, '2014-12-30', '4.00', '0.5000', 3, '', 115, 1, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(269, '2014-12-26', '8.00', '1.0000', 3, '', 116, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(270, '2014-12-26', '8.00', '1.0000', 3, '', 117, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(271, '2015-01-19', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(272, '2015-01-20', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(273, '2015-01-21', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(274, '2015-01-22', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(275, '2015-01-23', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(276, '2015-01-24', '0.00', '0.0000', 4, NULL, 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(277, '2015-01-25', '0.00', '0.0000', 4, NULL, 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(278, '2015-01-26', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(279, '2015-01-27', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(280, '2015-01-28', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(281, '2015-01-29', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(282, '2015-01-30', '8.00', '1.0000', 0, '', 118, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(283, '2014-12-15', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(284, '2014-12-16', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(285, '2014-12-17', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(286, '2014-12-18', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(287, '2014-12-19', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(288, '2014-12-20', '0.00', '0.0000', 4, NULL, 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(289, '2014-12-21', '0.00', '0.0000', 4, NULL, 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(290, '2014-12-22', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(291, '2014-12-23', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(292, '2014-12-24', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(293, '2014-12-25', '0.00', '0.0000', 5, NULL, 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(294, '2014-12-26', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(295, '2014-12-27', '0.00', '0.0000', 4, NULL, 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(296, '2014-12-28', '0.00', '0.0000', 4, NULL, 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(297, '2014-12-29', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(298, '2014-12-30', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(299, '2014-12-31', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(300, '2015-01-01', '0.00', '0.0000', 5, NULL, 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(301, '2015-01-02', '8.00', '1.0000', 3, '', 119, 1, 10, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(302, '2015-02-16', '8.00', '1.0000', 3, '', 120, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(303, '2015-02-17', '8.00', '1.0000', 3, '', 120, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(304, '2015-02-18', '8.00', '1.0000', 3, '', 120, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(305, '2015-01-19', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(306, '2015-01-20', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(307, '2015-01-21', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(308, '2015-01-22', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(309, '2015-01-23', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(310, '2015-01-24', '0.00', '0.0000', 4, NULL, 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(311, '2015-01-25', '0.00', '0.0000', 4, NULL, 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(312, '2015-01-26', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(313, '2015-01-27', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(314, '2015-01-28', '8.00', '1.0000', 3, '08-01-2015 19:36 Jianxiong Huang\r\n\r\nrebook, I will come back to work earlier on 28 Jan\r\n\r\n', 121, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(315, '2015-01-09', '8.00', '1.0000', 3, '', 122, 2, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(316, '2015-01-12', '8.00', '1.0000', 3, '11-01-2015 23:38 Varsha Guness\r\n\r\nHi Van Anh, Thong,\r\n\r\nI would like to take a MC today. Thank you and sorry for the short notice.\r\n\r\nRegards,\r\nVarsha\r\n\r\n', 123, 2, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(317, '2015-04-30', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(318, '2015-05-01', '0.00', '0.0000', 5, NULL, 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(319, '2015-05-02', '0.00', '0.0000', 4, NULL, 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(320, '2015-05-03', '0.00', '0.0000', 4, NULL, 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(321, '2015-05-04', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(322, '2015-05-05', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(323, '2015-05-06', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(324, '2015-05-07', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(325, '2015-05-08', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(326, '2015-05-09', '0.00', '0.0000', 4, NULL, 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(327, '2015-05-10', '0.00', '0.0000', 4, NULL, 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(328, '2015-05-11', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(329, '2015-05-12', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(330, '2015-05-13', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(331, '2015-05-14', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(332, '2015-05-15', '8.00', '1.0000', 0, '', 124, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(333, '2015-02-17', '8.00', '1.0000', 3, '12-01-2015 04:44 Wencong Gu\r\n\r\nApproval for Chinese new year leave. Please kindly approve,thanks a lot!\r\n\r\n', 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(334, '2015-02-18', '8.00', '1.0000', 3, '12-01-2015 04:44 Wencong Gu\r\n\r\nApproval for Chinese new year leave. Please kindly approve,thanks a lot!\r\n\r\n', 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(335, '2015-02-19', '0.00', '0.0000', 5, NULL, 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(336, '2015-02-20', '0.00', '0.0000', 5, NULL, 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(337, '2015-02-21', '0.00', '0.0000', 4, NULL, 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(338, '2015-02-22', '0.00', '0.0000', 4, NULL, 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(339, '2015-02-23', '8.00', '1.0000', 3, '12-01-2015 04:44 Wencong Gu\r\n\r\nApproval for Chinese new year leave. Please kindly approve,thanks a lot!\r\n\r\n', 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(340, '2015-02-24', '8.00', '1.0000', 3, '12-01-2015 04:44 Wencong Gu\r\n\r\nApproval for Chinese new year leave. Please kindly approve,thanks a lot!\r\n\r\n', 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(341, '2015-02-25', '8.00', '1.0000', 3, '12-01-2015 04:44 Wencong Gu\r\n\r\nApproval for Chinese new year leave. Please kindly approve,thanks a lot!\r\n\r\n', 125, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(342, '2015-01-05', '8.00', '1.0000', 3, '12-01-2015 15:38 Sun Shuo\r\n\r\nTo be deducted to compensate delayed project start date.\r\n\r\n', 126, 2, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(343, '2015-01-06', '8.00', '1.0000', 3, '12-01-2015 15:38 Sun Shuo\r\n\r\nTo be deducted to compensate delayed project start date.\r\n\r\n', 126, 2, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(344, '2015-01-07', '8.00', '1.0000', 3, '12-01-2015 15:38 Sun Shuo\r\n\r\nTo be deducted to compensate delayed project start date.\r\n\r\n', 126, 2, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(345, '2015-01-02', '8.00', '1.0000', 3, '', 127, 1, 12, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(346, '2015-01-29', '8.00', '1.0000', 3, '', 128, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(347, '2015-01-30', '8.00', '1.0000', 3, '', 128, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(348, '2015-02-12', '4.00', '0.5000', 3, '', 129, 9, 5, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(349, '2015-02-16', '8.00', '1.0000', 3, '', 130, 9, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(350, '2015-02-17', '8.00', '1.0000', 3, '', 130, 9, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(351, '2015-02-18', '8.00', '1.0000', 3, '', 130, 9, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(352, '2015-02-24', '4.00', '0.5000', 3, '', 131, 9, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(353, '2015-01-22', '8.00', '1.0000', 3, '', 132, 9, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(354, '2015-01-07', '4.00', '0.5000', 3, '', 133, 9, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(355, '2015-01-15', '8.00', '1.0000', 3, '19-01-2015 15:45 Djeinabou Kante\r\n\r\nsick leave\r\n\r\n', 134, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(356, '2015-02-02', '8.00', '1.0000', 3, '', 135, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(357, '2015-02-03', '8.00', '1.0000', 3, '', 135, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(358, '2015-01-05', '4.00', '0.5000', 3, '25-01-2015 04:46 Ge Hong\r\n\r\n5-7 January morning for kindergarten.\r\n\r\n', 136, 4, 24, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(359, '2015-01-06', '4.00', '0.5000', 3, '25-01-2015 04:47 Ge Hong\r\n\r\n5-7 January morning for kindergarten.\r\n\r\n', 137, 4, 24, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(360, '2015-01-07', '4.00', '0.5000', 3, '25-01-2015 04:47 Ge Hong\r\n\r\n5-7 January morning for kindergarten.\r\n\r\n', 138, 4, 24, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(361, '2015-01-22', '8.00', '1.0000', 3, '', 139, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(362, '2015-01-23', '8.00', '1.0000', 3, '', 139, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(363, '2015-02-06', '4.00', '0.5000', 3, '', 140, 9, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(364, '2015-01-21', '4.00', '0.5000', 3, '30-01-2015 10:14 Yoppy Winata\r\n\r\nbackdated leave application. I was on AM leave on 21 Jan.\r\n\r\n', 141, 9, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(365, '2015-03-04', '8.00', '1.0000', 3, '', 142, 9, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(366, '2015-03-05', '8.00', '1.0000', 3, '', 142, 9, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(367, '2015-03-20', '8.00', '1.0000', 3, '', 143, 9, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(368, '2015-01-28', '8.00', '1.0000', 3, '04-02-2015 15:57 Ge Hong\r\n\r\nmedical leave 1 day\r\n\r\n', 144, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(369, '2015-02-16', '8.00', '1.0000', 3, '06-02-2015 11:01 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be taking leave from 16th Feb to 21st Feb.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 145, 9, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(370, '2015-02-17', '8.00', '1.0000', 3, '06-02-2015 11:02 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be taking leave from 16th Feb to 21st Feb.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 146, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(371, '2015-02-18', '8.00', '1.0000', 3, '06-02-2015 11:02 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI will be taking leave from 16th Feb to 21st Feb.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 146, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(372, '2015-02-10', '8.00', '1.0000', 3, '10-02-2015 01:31 Varsha Guness\r\n\r\nHi Van anh, Thong,\r\nPlease approve my medical leave for today. Thank you.\r\n\r\n', 147, 2, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(373, '2015-02-18', '8.00', '1.0000', 3, '', 148, 9, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(374, '2015-02-23', '4.00', '0.5000', 3, '', 149, 9, 7, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(375, '2015-02-23', '4.00', '0.5000', 3, '', 150, 1, 7, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(376, '2015-02-04', '8.00', '1.0000', 3, '', 151, 2, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(377, '2015-04-06', '8.00', '1.0000', 3, '16-02-2015 06:16 Ge Hong\r\n\r\n3 days AL\r\n\r\n', 152, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(378, '2015-04-07', '8.00', '1.0000', 3, '16-02-2015 06:16 Ge Hong\r\n\r\n3 days AL\r\n\r\n', 152, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(379, '2015-04-08', '8.00', '1.0000', 3, '16-02-2015 06:16 Ge Hong\r\n\r\n3 days AL\r\n\r\n', 152, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(380, '2015-03-02', '8.00', '1.0000', 3, '', 153, 9, 23, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(381, '2015-03-03', '8.00', '1.0000', 3, '', 153, 9, 23, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(382, '2015-03-04', '8.00', '1.0000', 3, '', 153, 9, 23, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(383, '2015-03-05', '4.00', '0.5000', 3, '', 153, 9, 23, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(384, '2015-03-05', '4.00', '0.5000', 3, '', 154, 1, 23, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(385, '2015-03-30', '8.00', '1.0000', 3, '', 155, 1, 23, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(386, '2015-02-25', '4.00', '0.5000', 3, '', 156, 9, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(387, '2015-04-24', '8.00', '1.0000', 3, '', 157, 10, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(388, '2015-04-27', '8.00', '1.0000', 3, '', 158, 4, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(389, '2015-04-28', '8.00', '1.0000', 3, '', 158, 4, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(390, '2015-03-04', '8.00', '1.0000', 0, '01-03-2015 16:09 Varsha Guness\r\n\r\nHi Van Anh, Thong,\r\n\r\nI would like to take an annual leave this coming Wednesday. \r\n\r\nThank you in advance.\r\n\r\n', 159, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(391, '2015-03-05', '8.00', '1.0000', 3, '02-03-2015 11:39 Varsha Guness\r\n\r\nHi Van Anh, Thong,\r\n\r\nI shall shift the leave to Thursday, as I have to meet Christopher on Wednesday. \r\n\r\nThank you,\r\nVarsha\r\n\r\n', 160, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(392, '2015-03-04', '4.00', '0.5000', 3, '04-03-2015 16:58 Djeinabou Kante\r\n\r\nHalf day taken as emergency as both kids were sick.\r\n\r\n', 161, 4, 7, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(393, '2015-03-09', '8.00', '1.0000', 3, '', 162, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(394, '2015-06-29', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(395, '2015-06-30', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(396, '2015-07-01', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(397, '2015-07-02', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(398, '2015-07-03', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(399, '2015-07-04', '0.00', '0.0000', 4, NULL, 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(400, '2015-07-05', '0.00', '0.0000', 4, NULL, 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(401, '2015-07-06', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(402, '2015-07-07', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(403, '2015-07-08', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(404, '2015-07-09', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(405, '2015-07-10', '8.00', '1.0000', 3, '11-03-2015 07:03 Wencong Gu\r\n\r\nNUS summer exchange program to Oxford.\r\n\r\n', 163, 1, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(406, '2015-03-13', '8.00', '1.0000', 3, '13-03-2015 01:25 Varsha Guness\r\n\r\nSick (caught a cold)\r\n\r\n', 164, 2, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(407, '2015-06-12', '8.00', '1.0000', 0, '13-03-2015 11:11 Wang Zhe\r\n\r\nFor marriage\r\n\r\n', 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(408, '2015-06-13', '0.00', '0.0000', 4, NULL, 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(409, '2015-06-14', '0.00', '0.0000', 4, NULL, 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(410, '2015-06-15', '8.00', '1.0000', 0, '13-03-2015 11:11 Wang Zhe\r\n\r\nFor marriage\r\n\r\n', 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(411, '2015-06-16', '8.00', '1.0000', 0, '13-03-2015 11:11 Wang Zhe\r\n\r\nFor marriage\r\n\r\n', 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(412, '2015-06-17', '8.00', '1.0000', 0, '13-03-2015 11:11 Wang Zhe\r\n\r\nFor marriage\r\n\r\n', 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(413, '2015-06-18', '8.00', '1.0000', 0, '13-03-2015 11:11 Wang Zhe\r\n\r\nFor marriage\r\n\r\n', 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(414, '2015-06-19', '8.00', '1.0000', 0, '13-03-2015 11:11 Wang Zhe\r\n\r\nFor marriage\r\n\r\n', 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(415, '2015-06-20', '0.00', '0.0000', 4, NULL, 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(416, '2015-06-21', '0.00', '0.0000', 4, NULL, 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(417, '2015-06-22', '8.00', '1.0000', 0, '13-03-2015 11:11 Wang Zhe\r\n\r\nFor marriage\r\n\r\n', 165, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(418, '2015-03-16', '8.00', '1.0000', 3, '', 166, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(419, '2015-04-10', '8.00', '1.0000', 3, '', 167, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(420, '2015-04-01', '8.00', '1.0000', 3, '20-03-2015 05:32 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI would be on leave from 1st of April and will take 2 days leave.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 168, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(421, '2015-04-02', '8.00', '1.0000', 3, '20-03-2015 05:32 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI would be on leave from 1st of April and will take 2 days leave.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 168, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(422, '2015-04-03', '0.00', '0.0000', 5, NULL, 168, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(423, '2015-03-24', '8.00', '1.0000', 3, '', 169, 2, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(424, '2015-03-25', '8.00', '1.0000', 3, '', 170, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(425, '2015-03-23', '4.00', '0.5000', 3, '', 171, 2, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(426, '2015-03-27', '8.00', '1.0000', 3, '', 172, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(427, '2015-04-02', '8.00', '1.0000', 0, '06-04-2015 17:19 Thong Tran\r\n\r\nHi Lionel,\r\nPlease kindly rebook as compassionate leave.\r\nRegards,\r\nVan Anh\r\n\r\n01-04-2015 03:20 Lionel Ong Poh Beng\r\n\r\nGrandfather passed away\r\n\r\n', 173, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(428, '2015-04-07', '8.00', '1.0000', 3, '01-04-2015 08:58 Yoppy Winata\r\n\r\nclearing leave before SIT cycle start\r\n\r\n', 174, 9, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(429, '2015-04-08', '4.00', '0.5000', 0, '01-04-2015 08:59 Yoppy Winata\r\n\r\nclearing leave before SIT cycle start\r\n\r\n', 175, 9, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(430, '2015-04-08', '4.00', '0.5000', 3, '02-04-2015 04:33 Yoppy Winata\r\n\r\nclearing leaves before SIT\r\n\r\n', 176, 9, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(431, '2015-04-09', '8.00', '1.0000', 3, '09-04-2015 02:00 Varsha Guness\r\n\r\nHi Van Anh, Thong,\r\n\r\nPlease approve my MC for today.\r\n\r\nThank you.\r\nVarsha\r\n\r\n', 177, 2, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(432, '2015-04-22', '8.00', '1.0000', 3, '12-04-2015 17:05 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 178, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(433, '2015-05-08', '8.00', '1.0000', 0, '12-04-2015 17:05 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 179, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(434, '2015-09-14', '8.00', '1.0000', 0, '12-04-2015 17:07 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 180, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(435, '2015-09-15', '8.00', '1.0000', 0, '12-04-2015 17:07 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 180, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(436, '2015-09-16', '8.00', '1.0000', 0, '12-04-2015 17:07 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 180, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(437, '2015-09-17', '8.00', '1.0000', 0, '12-04-2015 17:07 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 180, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(438, '2015-09-18', '8.00', '1.0000', 0, '12-04-2015 17:07 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 180, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(439, '2015-04-07', '4.00', '0.5000', 3, '', 181, 2, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(440, '2015-04-13', '4.00', '0.5000', 3, '', 182, 2, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(441, '2015-04-22', '4.00', '0.5000', 3, '', 183, 2, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(442, '2015-04-27', '4.00', '0.5000', 3, '', 184, 1, 6, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(443, '2015-05-04', '8.00', '1.0000', 0, '28-04-2015 05:19 Thinh Quoc Vo Quoc\r\n\r\nCome back to Vietnam.\r\n\r\n', 185, 1, 30, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(444, '2015-05-05', '4.00', '0.5000', 3, '28-04-2015 05:20 Thinh Quoc Vo Quoc\r\n\r\nCome back to Vietnam.\r\n\r\n', 186, 1, 30, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(445, '2015-05-04', '4.00', '0.5000', 0, '', 187, 1, 30, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(446, '2015-05-04', '8.00', '1.0000', 3, '28-04-2015 05:23 Thinh Quoc Vo Quoc\r\n\r\nCome back to Vietnam\r\n\r\n', 188, 1, 30, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(447, '2015-04-17', '4.00', '0.5000', 3, '', 189, 2, 25, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(448, '2015-04-24', '8.00', '1.0000', 3, '', 190, 2, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(449, '2015-05-04', '8.00', '1.0000', 3, '28-04-2015 11:08 Varsha Guness\r\n\r\nHi Van Anh, Thong,\r\n\r\nI would like to apply for one AL for next Monday, 4th May as I''ll be travelling over the weekend and shall be back only on Monday.\r\n\r\nThank you in advance.\r\nVarsha\r\n\r\n', 191, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(450, '2015-05-18', '4.00', '0.5000', 3, '28-04-2015 18:38 Wang Zhe\r\n\r\nClear leave\r\n\r\n', 192, 1, 27, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(451, '2015-05-19', '8.00', '1.0000', 3, '28-04-2015 18:38 Wang Zhe\r\n\r\nClear leave\r\n\r\n', 192, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(452, '2015-05-20', '8.00', '1.0000', 3, '28-04-2015 18:38 Wang Zhe\r\n\r\nClear leave\r\n\r\n', 192, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(453, '2015-05-21', '8.00', '1.0000', 3, '28-04-2015 18:38 Wang Zhe\r\n\r\nClear leave\r\n\r\n', 192, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(454, '2015-05-22', '8.00', '1.0000', 3, '28-04-2015 18:38 Wang Zhe\r\n\r\nClear leave\r\n\r\n', 192, 1, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(455, '2015-05-13', '8.00', '1.0000', 3, '', 193, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(456, '2015-05-14', '8.00', '1.0000', 3, '', 193, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(457, '2015-05-15', '8.00', '1.0000', 3, '', 193, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(458, '2015-04-29', '4.00', '0.5000', 3, '29-04-2015 00:16 Nadia Jean\r\n\r\nHi Van Anh and Thong,\r\n\r\nI am not feeling very well this morning. I will need to take MC and hopefully if I get better by noon, I will come to office. (No worries as I''ll stand by on email)\r\n\r\nThanks,\r\nNadia\r\n\r\n', 194, 2, 14, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(459, '2015-05-05', '8.00', '1.0000', -1, '29-04-2015 09:10 Varsha Guness\r\n\r\nLeaves clearing\r\n\r\n', 195, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(460, '2015-05-06', '8.00', '1.0000', -1, '29-04-2015 09:10 Varsha Guness\r\n\r\nLeaves clearing\r\n\r\n', 195, 1, 20, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(461, '2015-04-28', '4.00', '0.5000', 3, '', 196, 2, 5, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(462, '2015-05-11', '8.00', '1.0000', 3, '', 197, 11, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(463, '2015-05-12', '8.00', '1.0000', 3, '', 197, 11, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(464, '2015-05-13', '8.00', '1.0000', 3, '', 197, 11, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(465, '2015-05-14', '8.00', '1.0000', 3, '', 197, 11, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(466, '2015-05-15', '8.00', '1.0000', 3, '', 197, 11, 27, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(467, '2015-05-05', '4.00', '0.5000', 3, '', 198, 1, 5, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(468, '2015-05-19', '8.00', '1.0000', 3, '', 199, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(469, '2015-05-25', '8.00', '1.0000', 3, '', 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(470, '2015-05-26', '8.00', '1.0000', 3, '', 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(471, '2015-05-27', '8.00', '1.0000', 3, '', 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(472, '2015-05-28', '8.00', '1.0000', 3, '', 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(473, '2015-05-29', '8.00', '1.0000', 3, '', 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(474, '2015-05-30', '0.00', '0.0000', 4, NULL, 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(475, '2015-05-31', '0.00', '0.0000', 4, NULL, 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(476, '2015-06-01', '0.00', '0.0000', 5, NULL, 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(477, '2015-06-02', '8.00', '1.0000', 3, '', 200, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(478, '2015-08-10', '0.00', '0.0000', 5, NULL, 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(479, '2015-08-11', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(480, '2015-08-12', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(481, '2015-08-13', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(482, '2015-08-14', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(483, '2015-08-15', '0.00', '0.0000', 4, NULL, 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(484, '2015-08-16', '0.00', '0.0000', 4, NULL, 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(485, '2015-08-17', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(486, '2015-08-18', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(487, '2015-08-19', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(488, '2015-08-20', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(489, '2015-08-21', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(490, '2015-08-22', '0.00', '0.0000', 4, NULL, 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(491, '2015-08-23', '0.00', '0.0000', 4, NULL, 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(492, '2015-08-24', '8.00', '1.0000', 3, '', 201, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(493, '2015-05-18', '8.00', '1.0000', 3, '', 202, 1, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(494, '2015-05-27', '8.00', '1.0000', -1, '', 203, 5, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(495, '2015-05-28', '8.00', '1.0000', -1, '', 204, 4, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(496, '2015-05-29', '8.00', '1.0000', -1, '', 205, 10, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(497, '2015-06-02', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(498, '2015-06-03', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(499, '2015-06-04', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(500, '2015-06-05', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(501, '2015-06-06', '0.00', '0.0000', 4, NULL, 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(502, '2015-06-07', '0.00', '0.0000', 4, NULL, 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(503, '2015-06-08', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(504, '2015-06-09', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(505, '2015-06-10', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(506, '2015-06-11', '8.00', '1.0000', -1, '', 206, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(507, '2015-05-08', '8.00', '1.0000', 3, '', 207, 2, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(508, '2015-05-12', '4.00', '0.5000', 3, '12-05-2015 01:19 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI am not feeling well, I will be back to office at 12pm.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 208, 2, 14, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(509, '2015-05-19', '4.00', '0.5000', 0, '', 209, 1, 28, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(510, '2015-05-04', '8.00', '1.0000', 3, '', 210, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(511, '2015-05-05', '8.00', '1.0000', 3, '', 210, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(512, '2015-05-06', '8.00', '1.0000', 3, '', 210, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(513, '2015-05-07', '8.00', '1.0000', 3, '', 210, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(514, '2015-05-08', '8.00', '1.0000', 3, '', 210, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(515, '2015-04-27', '8.00', '1.0000', 3, '', 211, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(516, '2015-05-15', '8.00', '1.0000', 3, '17-05-2015 17:37 Jia Shuo\r\n\r\nUrgent leave\r\n\r\n', 212, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(517, '2015-05-22', '8.00', '1.0000', 3, '21-05-2015 20:56 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI would like to apply one day medical leave to have a rest.\r\n\r\nThanks and regards,\r\nnadia\r\n\r\n', 213, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(518, '2015-05-22', '8.00', '1.0000', 3, '', 214, 2, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(519, '2015-06-05', '8.00', '1.0000', 3, '', 215, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(520, '2015-07-09', '8.00', '1.0000', 0, '', 216, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(521, '2015-07-10', '8.00', '1.0000', 0, '', 216, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(522, '2015-06-02', '8.00', '1.0000', 3, '', 217, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(523, '2015-06-03', '8.00', '1.0000', 3, '', 217, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(524, '2015-06-04', '8.00', '1.0000', 3, '', 217, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(525, '2015-06-05', '8.00', '1.0000', 3, '', 217, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(526, '2015-05-28', '8.00', '1.0000', 3, '26-05-2015 17:32 Yoppy Winata\r\n\r\nHi Thong, Van Anh,\r\n\r\nThis is already approved by Hemant, earlier today 26 May.\r\n\r\nKindly approve it.Thank you.\r\n\r\nRegards,\r\nYoppy\r\n\r\n', 218, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(527, '2015-05-29', '8.00', '1.0000', 3, '26-05-2015 17:32 Yoppy Winata\r\n\r\nHi Thong, Van Anh,\r\n\r\nThis is already approved by Hemant, earlier today 26 May.\r\n\r\nKindly approve it.Thank you.\r\n\r\nRegards,\r\nYoppy\r\n\r\n', 218, 1, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(528, '2015-06-17', '8.00', '1.0000', 0, '', 219, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(529, '2015-07-08', '8.00', '1.0000', 0, '28-05-2015 06:41 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 220, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(530, '2015-06-02', '8.00', '1.0000', 3, '28-05-2015 19:36 Tian Xi\r\n\r\nAnnual leave\r\n\r\n', 221, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(531, '2015-06-03', '8.00', '1.0000', 3, '28-05-2015 19:36 Tian Xi\r\n\r\nAnnual leave\r\n\r\n', 221, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(532, '2015-06-04', '8.00', '1.0000', 3, '28-05-2015 19:36 Tian Xi\r\n\r\nAnnual leave\r\n\r\n', 221, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(533, '2015-05-12', '8.00', '1.0000', 3, '29-05-2015 05:30 Pierre Pruvost\r\n\r\nEmergency leaves\r\n\r\n', 222, 1, 38, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(534, '2015-05-13', '8.00', '1.0000', 3, '29-05-2015 05:30 Pierre Pruvost\r\n\r\nEmergency leaves\r\n\r\n', 222, 1, 38, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(535, '2015-05-14', '8.00', '1.0000', 3, '29-05-2015 05:30 Pierre Pruvost\r\n\r\nEmergency leaves\r\n\r\n', 222, 1, 38, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(536, '2015-05-15', '8.00', '1.0000', 3, '29-05-2015 05:30 Pierre Pruvost\r\n\r\nEmergency leaves\r\n\r\n', 222, 1, 38, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(537, '2015-05-18', '8.00', '1.0000', 3, '29-05-2015 05:31 Pierre Pruvost\r\n\r\nEmergency leaves\r\n\r\n', 223, 1, 38, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(538, '2015-05-19', '8.00', '1.0000', 3, '29-05-2015 05:31 Pierre Pruvost\r\n\r\nEmergency leaves\r\n\r\n', 223, 1, 38, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(539, '2015-05-20', '4.00', '0.5000', 3, '', 224, 1, 38, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(540, '2015-05-21', '4.00', '0.5000', 3, '', 225, 1, 38, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(541, '2015-05-25', '4.00', '0.5000', 3, '29-05-2015 05:34 Pierre Pruvost\r\n\r\nsick\r\n\r\n', 226, 1, 38, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(542, '2015-05-18', '8.00', '1.0000', 3, '', 227, 2, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(543, '2015-05-19', '8.00', '1.0000', 3, '', 227, 2, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(544, '2015-07-09', '8.00', '1.0000', 0, '', 228, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(545, '2015-07-10', '8.00', '1.0000', 0, '', 228, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(546, '2015-08-03', '8.00', '1.0000', 0, '', 229, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(547, '2015-08-04', '8.00', '1.0000', 0, '', 229, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(548, '2015-08-05', '8.00', '1.0000', 0, '', 229, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(549, '2015-08-06', '8.00', '1.0000', 0, '', 229, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(550, '2015-07-08', '8.00', '1.0000', 3, '', 230, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(551, '2015-07-10', '8.00', '1.0000', 3, '', 231, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(552, '2015-05-20', '8.00', '1.0000', 0, '', 232, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(553, '2015-05-21', '8.00', '1.0000', 0, '', 232, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(554, '2015-06-05', '8.00', '1.0000', 3, '', 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(555, '2015-06-06', '0.00', '0.0000', 4, NULL, 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(556, '2015-06-07', '0.00', '0.0000', 4, NULL, 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(557, '2015-06-08', '8.00', '1.0000', 3, '', 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(558, '2015-06-09', '8.00', '1.0000', 3, '', 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(559, '2015-06-10', '8.00', '1.0000', 3, '', 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(560, '2015-06-11', '8.00', '1.0000', 3, '', 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(561, '2015-06-12', '8.00', '1.0000', 3, '', 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(562, '2015-06-13', '0.00', '0.0000', 4, NULL, 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(563, '2015-06-14', '0.00', '0.0000', 4, NULL, 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(564, '2015-06-15', '8.00', '1.0000', 3, '', 233, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(565, '2015-06-12', '8.00', '1.0000', 3, '', 234, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(566, '2015-06-22', '8.00', '1.0000', 3, '', 235, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(567, '2015-06-23', '8.00', '1.0000', 3, '', 235, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(568, '2015-06-24', '8.00', '1.0000', 3, '', 235, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(569, '2015-06-25', '8.00', '1.0000', 3, '', 235, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(570, '2015-06-26', '8.00', '1.0000', 3, '', 235, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(571, '2015-06-12', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(572, '2015-06-13', '0.00', '0.0000', 4, NULL, 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(573, '2015-06-14', '0.00', '0.0000', 4, NULL, 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(574, '2015-06-15', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(575, '2015-06-16', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(576, '2015-06-17', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(577, '2015-06-18', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(578, '2015-06-19', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(579, '2015-06-20', '0.00', '0.0000', 4, NULL, 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(580, '2015-06-21', '0.00', '0.0000', 4, NULL, 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(581, '2015-06-22', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(582, '2015-06-23', '8.00', '1.0000', 3, '09-06-2015 11:24 Hexin Ju\r\n\r\nholiday\r\n\r\n', 236, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(583, '2015-06-10', '4.00', '0.5000', 0, '10-06-2015 17:00 Tian Xi\r\n\r\nLeave to cancel student pass due to its expiry\r\n\r\n', 237, 1, 32, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(584, '2015-06-12', '4.00', '0.5000', 0, '10-06-2015 17:02 Tian Xi\r\n\r\nLeave for Work Pass Register\r\n\r\n', 238, 1, 32, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(585, '2015-06-15', '8.00', '1.0000', 3, '', 239, 4, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(586, '2015-07-15', '8.00', '1.0000', 0, '15-06-2015 17:57 Tian Xi\r\n\r\nSMU Graduation\r\n\r\n', 240, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(587, '2015-06-10', '4.00', '0.5000', 3, '15-06-2015 17:59 Tian Xi\r\n\r\nUrgent Leave for Student Pass issue\r\n\r\n', 241, 1, 32, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(588, '2015-06-12', '8.00', '1.0000', 3, '', 242, 1, 39, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(589, '2015-06-13', '0.00', '0.0000', 4, NULL, 242, 1, 39, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(590, '2015-06-14', '0.00', '0.0000', 4, NULL, 242, 1, 39, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(591, '2015-06-11', '8.00', '1.0000', 0, '02-07-2015 04:03 Chiu Ling Lim\r\n\r\nPlease provide medical certificate for verification\r\n\r\n02-07-2015 08:24 Ge Hong\r\n\r\nDear Chiu Ling, I just sent MC slip to you via whatsapp. Regards, GH\r\n\r\n16-06-2015 11:23 Ge Hong\r\n\r\non MC\r\n\r\n', 243, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(592, '2015-06-12', '8.00', '1.0000', 0, '02-07-2015 04:03 Chiu Ling Lim\r\n\r\nPlease provide medical certificate for verification\r\n\r\n02-07-2015 08:24 Ge Hong\r\n\r\nDear Chiu Ling, I just sent MC slip to you via whatsapp. Regards, GH\r\n\r\n16-06-2015 11:23 Ge Hong\r\n\r\non MC\r\n\r\n', 243, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(593, '2015-06-17', '8.00', '1.0000', 3, '17-06-2015 02:16 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI had a fever and bad headache since last night. I want to take medicla leave fore a day.\r\nThanks and regards \r\nNadia\r\n\r\n', 244, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(594, '2015-07-16', '8.00', '1.0000', 3, '08-07-2015 06:10 Jianxiong Huang\r\n\r\n2 days leave on 16th Jul and 20th Jul\r\n\r\n', 245, 9, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(595, '2015-07-17', '0.00', '0.0000', 5, NULL, 245, 9, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(596, '2015-07-18', '0.00', '0.0000', 4, NULL, 245, 9, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(597, '2015-07-19', '0.00', '0.0000', 4, NULL, 245, 9, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(598, '2015-07-20', '8.00', '1.0000', 3, '08-07-2015 06:10 Jianxiong Huang\r\n\r\n2 days leave on 16th Jul and 20th Jul\r\n\r\n', 245, 9, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(599, '2015-07-21', '4.00', '0.5000', 0, '', 245, 9, 9, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(600, '2015-06-19', '8.00', '1.0000', 3, '', 246, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(601, '2015-06-22', '4.00', '0.5000', 3, '', 247, 2, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(602, '2015-06-23', '8.00', '1.0000', 3, '', 247, 2, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(603, '2015-06-16', '8.00', '1.0000', 3, '', 248, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(604, '2015-06-30', '8.00', '1.0000', 3, '', 249, 5, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(605, '2015-04-02', '8.00', '1.0000', 3, '', 250, 6, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(606, '2015-07-13', '8.00', '1.0000', 0, '', 251, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(607, '2015-07-14', '8.00', '1.0000', 0, '', 251, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(608, '2015-05-20', '8.00', '1.0000', 3, '', 252, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(609, '2015-05-21', '8.00', '1.0000', 3, '', 252, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(610, '2015-07-02', '4.00', '0.5000', 3, '', 253, 4, 7, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(611, '2015-06-26', '8.00', '1.0000', 3, '02-07-2015 08:28 Ge Hong\r\n\r\nclear leave-in-lieu from 16May weekend OT work.\r\n\r\n', 254, 5, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(612, '2015-07-29', '8.00', '1.0000', 3, '02-07-2015 08:31 Ge Hong\r\n\r\nclear the leave-in-liu day from 06Jun weekend OT work\r\n\r\n', 255, 5, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(613, '2015-07-03', '4.00', '0.5000', 3, '', 256, 1, 38, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(614, '2015-07-09', '8.00', '1.0000', 3, '', 257, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(615, '2015-07-13', '8.00', '1.0000', 3, '', 258, 1, 28, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(616, '2015-07-02', '8.00', '1.0000', 3, '06-07-2015 20:05 Oscar Sierra\r\n\r\nTrip to Spain in order to finish and sign the legal notice period.\r\n\r\n', 259, 11, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(617, '2015-07-03', '8.00', '1.0000', 3, '06-07-2015 20:05 Oscar Sierra\r\n\r\nTrip to Spain in order to finish and sign the legal notice period.\r\n\r\n', 259, 11, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(618, '2015-07-04', '0.00', '0.0000', 4, NULL, 259, 11, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(619, '2015-07-05', '0.00', '0.0000', 4, NULL, 259, 11, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(620, '2015-07-06', '8.00', '1.0000', 3, '06-07-2015 20:05 Oscar Sierra\r\n\r\nTrip to Spain in order to finish and sign the legal notice period.\r\n\r\n', 259, 11, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(621, '2015-07-07', '8.00', '1.0000', 3, '06-07-2015 20:05 Oscar Sierra\r\n\r\nTrip to Spain in order to finish and sign the legal notice period.\r\n\r\n', 259, 11, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(622, '2015-07-13', '4.00', '0.5000', 3, '', 260, 1, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(623, '2015-07-08', '8.00', '1.0000', 3, '', 261, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(624, '2015-07-13', '8.00', '1.0000', 3, '', 262, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(625, '2015-06-29', '4.00', '0.5000', 3, '', 263, 1, 34, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(626, '2015-07-10', '8.00', '1.0000', 3, '', 264, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(627, '2015-07-14', '4.00', '0.5000', 3, '', 265, 5, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(628, '2015-07-15', '4.00', '0.5000', 3, '', 266, 5, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(629, '2015-07-15', '4.00', '0.5000', 3, '', 267, 1, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(630, '2015-07-14', '8.00', '1.0000', 0, '11-07-2015 17:32 Ge Hong\r\n\r\nclear leave in lieu from Jun\r\n\r\n', 268, 5, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(631, '2015-07-21', '4.00', '0.5000', 3, '12-07-2015 05:45 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI would like to clear my half day-in-lieu  leave.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 269, 5, 14, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(632, '2015-07-22', '4.00', '0.5000', 3, '12-07-2015 05:50 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI will take half-day leave from 21st to 23rd Aug. I will work in the morning. No worries as I am still in Singapore and still accessible.  \r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 270, 10, 14, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(633, '2015-07-23', '4.00', '0.5000', 3, '12-07-2015 05:52 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI will take half-day leave from 21st to 23rd Aug. 21-22 : work in the morning, 23 : work in the afternoon. \r\n\r\nI am still in Singapore and still accessible.  \r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 271, 10, 14, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(634, '2015-08-11', '8.00', '1.0000', 0, '12-07-2015 09:28 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 272, 5, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(635, '2015-08-12', '8.00', '1.0000', 0, '12-07-2015 09:28 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 272, 5, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(636, '2015-08-13', '8.00', '1.0000', 0, '12-07-2015 09:29 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 273, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(637, '2015-08-14', '8.00', '1.0000', 0, '12-07-2015 09:29 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 273, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(638, '2015-08-17', '8.00', '1.0000', 0, '12-07-2015 09:30 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 274, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(639, '2015-08-18', '4.00', '0.5000', 0, '12-07-2015 09:30 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 274, 1, 40, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(640, '2015-07-15', '8.00', '1.0000', 3, '', 275, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(641, '2015-07-27', '8.00', '1.0000', 3, '', 276, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(642, '2015-07-22', '4.00', '0.5000', 3, '', 277, 10, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(643, '2015-07-23', '4.00', '0.5000', 3, '', 278, 10, 13, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(644, '2015-07-14', '8.00', '1.0000', 3, '19-07-2015 03:23 Ge Hong\r\n\r\nutilized one day in lieu from Jun.\r\n\r\n', 279, 5, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(645, '2015-07-16', '4.00', '0.5000', 3, '', 280, 1, 7, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(646, '2015-07-14', '4.00', '0.5000', 3, '', 281, 1, 37, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(647, '2015-07-20', '8.00', '1.0000', 3, '', 282, 2, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(648, '2015-07-21', '4.00', '0.5000', 3, '21-07-2015 07:22 Ge Hong\r\n\r\nafternoon half day leave for personal matters.\r\n\r\n', 283, 1, 24, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(649, '2015-07-22', '8.00', '1.0000', 3, '22-07-2015 03:32 Ge Hong\r\n\r\nleave for personal matters\r\n\r\n', 284, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(650, '2015-07-21', '4.00', '0.5000', 3, '', 285, 1, 34, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(651, '2015-07-22', '4.00', '0.5000', 3, '', 285, 1, 34, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(652, '2015-08-06', '8.00', '1.0000', 3, '', 286, 5, 25, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(653, '2015-07-13', '8.00', '1.0000', 3, '', 287, 5, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(654, '2015-07-24', '4.00', '0.5000', 3, '24-07-2015 01:00 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nApologies for last minute request but I need to apply for an urgent half day leave in the morning.\r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 288, 1, 14, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(655, '2015-08-27', '8.00', '1.0000', 0, '25-07-2015 16:27 Wang Xiao\r\n\r\nGo back to China to visit parents.\r\n\r\n', 289, 1, 45, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(656, '2015-08-28', '8.00', '1.0000', 0, '25-07-2015 16:27 Wang Xiao\r\n\r\nGo back to China to visit parents.\r\n\r\n', 289, 1, 45, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(657, '2015-08-03', '8.00', '1.0000', 0, '', 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(658, '2015-08-04', '8.00', '1.0000', 0, '', 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(659, '2015-08-05', '8.00', '1.0000', 0, '', 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(660, '2015-08-06', '8.00', '1.0000', 0, '', 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(661, '2015-08-07', '8.00', '1.0000', 0, '', 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(662, '2015-08-08', '0.00', '0.0000', 4, NULL, 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(663, '2015-08-09', '0.00', '0.0000', 4, NULL, 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(664, '2015-08-10', '0.00', '0.0000', 5, NULL, 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(665, '2015-08-11', '8.00', '1.0000', 0, '', 290, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(666, '2015-07-27', '4.00', '0.5000', 3, '', 291, 2, 32, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(667, '2015-07-15', '4.00', '0.5000', 3, '01-08-2015 15:07 Tian Xi\r\n\r\nSMU Graduation\r\n\r\n', 292, 1, 32, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(668, '2015-09-23', '4.00', '0.5000', 0, '10-08-2015 11:26 Hangyu Ma\r\n\r\nTravelling.\r\n\r\n', 293, 1, 46, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(669, '2015-09-25', '8.00', '1.0000', 0, '10-08-2015 11:26 Hangyu Ma\r\n\r\nTravelling.\r\n\r\n', 294, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(670, '2015-08-13', '8.00', '1.0000', 3, '11-08-2015 02:25 Jacob Chen Zhe\r\n\r\nTaking annual leaves before I left.\r\n\r\n', 295, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(671, '2015-08-14', '8.00', '1.0000', 3, '11-08-2015 02:25 Jacob Chen Zhe\r\n\r\nTaking annual leaves before I left.\r\n\r\n', 295, 1, 34, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(672, '2015-08-11', '8.00', '1.0000', 3, '', 296, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(673, '2015-08-11', '4.00', '0.5000', 3, '11-08-2015 03:30 Chiu Ling Lim\r\n\r\nUrgent half day leave.\r\n\r\n', 297, 1, 37, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(674, '2015-08-21', '8.00', '1.0000', 3, '', 298, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(675, '2015-09-08', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(676, '2015-09-09', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(677, '2015-09-10', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(678, '2015-09-11', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(679, '2015-09-12', '0.00', '0.0000', 4, NULL, 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(680, '2015-09-13', '0.00', '0.0000', 4, NULL, 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(681, '2015-09-14', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(682, '2015-09-15', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(683, '2015-09-16', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(684, '2015-09-17', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(685, '2015-09-18', '8.00', '1.0000', 3, '', 299, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(686, '2015-09-07', '8.00', '1.0000', 3, '', 300, 1, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(687, '2015-09-21', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(688, '2015-09-22', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(689, '2015-09-23', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(690, '2015-09-24', '0.00', '0.0000', 5, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(691, '2015-09-25', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(692, '2015-09-26', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(693, '2015-09-27', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(694, '2015-09-28', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(695, '2015-09-29', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(696, '2015-09-30', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(697, '2015-10-01', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(698, '2015-10-02', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(699, '2015-10-03', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(700, '2015-10-04', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(701, '2015-10-05', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(702, '2015-10-06', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(703, '2015-10-07', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(704, '2015-10-08', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(705, '2015-10-09', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(706, '2015-10-10', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(707, '2015-10-11', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(708, '2015-10-12', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(709, '2015-10-13', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(710, '2015-10-14', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(711, '2015-10-15', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(712, '2015-10-16', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(713, '2015-10-17', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(714, '2015-10-18', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(715, '2015-10-19', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(716, '2015-10-20', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(717, '2015-10-21', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(718, '2015-10-22', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(719, '2015-10-23', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(720, '2015-10-24', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(721, '2015-10-25', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(722, '2015-10-26', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(723, '2015-10-27', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(724, '2015-10-28', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(725, '2015-10-29', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(726, '2015-10-30', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(727, '2015-10-31', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(728, '2015-11-01', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(729, '2015-11-02', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(730, '2015-11-03', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(731, '2015-11-04', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(732, '2015-11-05', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(733, '2015-11-06', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(734, '2015-11-07', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(735, '2015-11-08', '0.00', '0.0000', 4, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(736, '2015-11-09', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(737, '2015-11-10', '0.00', '0.0000', 5, NULL, 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(738, '2015-11-11', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(739, '2015-11-12', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(740, '2015-11-13', '8.00', '1.0000', 3, '', 301, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(741, '2015-08-05', '8.00', '1.0000', 3, '11-08-2015 04:03 Ge Hong\r\n\r\nurgent leave for personal issue.\r\n\r\n', 302, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(742, '2015-08-06', '8.00', '1.0000', 3, '11-08-2015 04:04 Ge Hong\r\n\r\nmedical leave\r\n\r\n', 303, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(743, '2015-08-17', '8.00', '1.0000', 3, '11-08-2015 18:13 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 304, 5, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(744, '2015-08-18', '8.00', '1.0000', 3, '11-08-2015 18:13 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 304, 5, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(745, '2015-08-19', '8.00', '1.0000', 3, '11-08-2015 18:13 Bai Di\r\n\r\nFamily travel to UK.\r\n\r\n', 304, 5, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(746, '2015-08-20', '8.00', '1.0000', 3, '11-08-2015 18:14 Bai Di\r\n\r\nFamily travel to UK\r\n\r\n', 305, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(747, '2015-08-21', '8.00', '1.0000', 3, '11-08-2015 18:14 Bai Di\r\n\r\nFamily travel to UK\r\n\r\n', 305, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(748, '2015-08-22', '0.00', '0.0000', 4, NULL, 305, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(749, '2015-08-23', '0.00', '0.0000', 4, NULL, 305, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(750, '2015-08-24', '8.00', '1.0000', 3, '11-08-2015 18:14 Bai Di\r\n\r\nFamily travel to UK\r\n\r\n', 305, 1, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(751, '2015-08-25', '4.00', '0.5000', 3, '11-08-2015 18:14 Bai Di\r\n\r\nFamily travel to UK\r\n\r\n', 305, 1, 40, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(752, '2015-08-13', '4.00', '0.5000', 0, '', 306, 1, 39, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(753, '2015-08-14', '8.00', '1.0000', 0, '', 306, 1, 39, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(754, '2015-07-29', '8.00', '1.0000', 3, '', 307, 2, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(755, '2015-08-14', '8.00', '1.0000', 3, '', 308, 2, 39, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(756, '2015-08-13', '8.00', '1.0000', 3, '14-08-2015 03:37 Ge Hong\r\n\r\nmedical leave\r\n\r\n', 309, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(757, '2015-08-28', '8.00', '1.0000', 0, '', 310, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(758, '2015-08-29', '0.00', '0.0000', 4, NULL, 310, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(759, '2015-08-30', '0.00', '0.0000', 4, NULL, 310, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(760, '2015-08-17', '4.00', '0.5000', 3, '17-08-2015 03:36 Wang Xiao\r\n\r\nCollect graduate certificate in NTU for EP application.\r\n\r\nCancel student pass.\r\n\r\n', 311, 5, 45, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(761, '2015-09-07', '8.00', '1.0000', 3, '', 312, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(762, '2015-09-08', '8.00', '1.0000', 3, '', 312, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(763, '2015-09-09', '8.00', '1.0000', 3, '', 312, 1, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(764, '2015-09-10', '8.00', '1.0000', 0, '', 313, 4, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(765, '2015-09-11', '8.00', '1.0000', 0, '', 313, 4, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(766, '2015-08-03', '8.00', '1.0000', 3, '19-08-2015 11:06 Nadia Jean\r\n\r\nHi all,\r\n\r\nI applied again so that Chiu Ling can approve. Some problem occurred the last time I applied.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 314, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(767, '2015-08-04', '8.00', '1.0000', 3, '19-08-2015 11:06 Nadia Jean\r\n\r\nHi all,\r\n\r\nI applied again so that Chiu Ling can approve. Some problem occurred the last time I applied.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 314, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(768, '2015-08-05', '8.00', '1.0000', 3, '19-08-2015 11:06 Nadia Jean\r\n\r\nHi all,\r\n\r\nI applied again so that Chiu Ling can approve. Some problem occurred the last time I applied.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 314, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(769, '2015-08-06', '8.00', '1.0000', 3, '19-08-2015 11:06 Nadia Jean\r\n\r\nHi all,\r\n\r\nI applied again so that Chiu Ling can approve. Some problem occurred the last time I applied.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 314, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(770, '2015-08-11', '8.00', '1.0000', 3, '19-08-2015 11:06 Nadia Jean\r\n\r\nHi all,\r\n\r\nI applied again so that Chiu Ling can approve. Some problem occurred the last time I applied.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 315, 2, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(771, '2015-08-25', '8.00', '1.0000', 0, '20-08-2015 03:42 Hangyu Ma\r\n\r\nPersonal issues.\r\n\r\n', 316, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(772, '2015-09-23', '4.00', '0.5000', 3, '21-08-2015 04:14 Hangyu Ma\r\n\r\nTravelling\r\n\r\n', 317, 1, 46, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(773, '2015-09-25', '8.00', '1.0000', 3, '21-08-2015 04:14 Hangyu Ma\r\n\r\nTravelling\r\n\r\n', 318, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(774, '2015-09-25', '8.00', '1.0000', 3, '22-08-2015 01:50 Marc Megaides\r\n\r\nOff from 24 to 27 night\r\n24 is public holiday\r\n\r\n', 319, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(775, '2015-08-21', '8.00', '1.0000', 3, '24-08-2015 04:08 Ge Hong\r\n\r\nurgent leave for personal matters\r\n\r\n', 320, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(776, '2015-08-26', '8.00', '1.0000', 3, '24-08-2015 04:09 Ge Hong\r\n\r\nannual leave\r\n\r\n', 321, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(777, '2015-09-04', '8.00', '1.0000', 3, '', 322, 10, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(778, '2015-11-16', '8.00', '1.0000', 3, '', 323, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(779, '2015-11-17', '8.00', '1.0000', 3, '', 323, 3, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(780, '2015-09-25', '8.00', '1.0000', 3, '', 324, 1, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(781, '2015-09-26', '0.00', '0.0000', 4, NULL, 324, 1, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(782, '2015-09-27', '0.00', '0.0000', 4, NULL, 324, 1, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(783, '2015-09-28', '8.00', '1.0000', 3, '', 324, 1, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(784, '2015-08-25', '4.00', '0.5000', 3, '', 325, 1, 40, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(785, '2015-08-26', '8.00', '1.0000', 3, '', 326, 2, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(786, '2015-08-26', '4.00', '0.5000', 3, '26-08-2015 04:13 Wang Xiao\r\n\r\nDoes not feel well today.\r\n\r\n', 327, 5, 45, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(787, '2015-08-04', '8.00', '1.0000', 3, '', 328, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(788, '2015-09-10', '8.00', '1.0000', 3, '', 329, 5, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(789, '2015-10-01', '4.00', '0.5000', 3, '', 330, 1, 35, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(790, '2015-10-02', '8.00', '1.0000', 3, '', 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(791, '2015-10-03', '0.00', '0.0000', 4, NULL, 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(792, '2015-10-04', '0.00', '0.0000', 4, NULL, 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(793, '2015-10-05', '8.00', '1.0000', 3, '', 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(794, '2015-10-06', '8.00', '1.0000', 3, '', 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(795, '2015-10-07', '8.00', '1.0000', 3, '', 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(796, '2015-10-08', '8.00', '1.0000', 3, '', 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(797, '2015-10-09', '8.00', '1.0000', 3, '', 330, 1, 35, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(798, '2015-09-14', '4.00', '0.5000', 3, '27-08-2015 04:32 Nadia Jean\r\n\r\nHI all,\r\n\r\nI will be taking my half day leave on 14th of Sept.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 331, 1, 14, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(799, '2015-09-18', '8.00', '1.0000', 0, '', 332, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(800, '2015-09-10', '8.00', '1.0000', 3, '', 333, 4, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(801, '2015-09-01', '8.00', '1.0000', 3, '01-09-2015 17:22 Tian Xi\r\n\r\nStomachache\r\n\r\n', 334, 2, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(802, '2015-09-08', '4.00', '0.5000', 0, '02-09-2015 16:42 Hangyu Ma\r\n\r\nVisa related issues.\r\n\r\n', 335, 1, 46, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(803, '2015-09-03', '4.00', '0.5000', 3, '03-09-2015 02:17 Yoppy Winata\r\n\r\nhi Thong, Van Anh,\r\n\r\nkindly approved my leave request. I have to bring my daughter to see paediatrician this morning as she is unwell. Thank you.\r\n\r\nRegards,\r\nYoppy\r\n\r\n', 336, 5, 13, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(804, '2015-11-18', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(805, '2015-11-19', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(806, '2015-11-20', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(807, '2015-11-21', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(808, '2015-11-22', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(809, '2015-11-23', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(810, '2015-11-24', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(811, '2015-11-25', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(812, '2015-11-26', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(813, '2015-11-27', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(814, '2015-11-28', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(815, '2015-11-29', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(816, '2015-11-30', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(817, '2015-12-01', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(818, '2015-12-02', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(819, '2015-12-03', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(820, '2015-12-04', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(821, '2015-12-05', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(822, '2015-12-06', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(823, '2015-12-07', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(824, '2015-12-08', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(825, '2015-12-09', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(826, '2015-12-10', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(827, '2015-12-11', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(828, '2015-12-12', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(829, '2015-12-13', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(830, '2015-12-14', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(831, '2015-12-15', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(832, '2015-12-16', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(833, '2015-12-17', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(834, '2015-12-18', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(835, '2015-12-19', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(836, '2015-12-20', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(837, '2015-12-21', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(838, '2015-12-22', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(839, '2015-12-23', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(840, '2015-12-24', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(841, '2015-12-25', '0.00', '0.0000', 5, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(842, '2015-12-26', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(843, '2015-12-27', '0.00', '0.0000', 4, NULL, 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(844, '2015-12-28', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(845, '2015-12-29', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(846, '2015-12-30', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(847, '2015-12-31', '8.00', '1.0000', 3, '', 337, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(848, '2015-09-07', '8.00', '1.0000', 3, '', 338, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(849, '2015-09-08', '8.00', '1.0000', 3, '', 338, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(850, '2015-12-21', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(851, '2015-12-22', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(852, '2015-12-23', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(853, '2015-12-24', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(854, '2015-12-25', '0.00', '0.0000', 5, NULL, 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(855, '2015-12-26', '0.00', '0.0000', 4, NULL, 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(856, '2015-12-27', '0.00', '0.0000', 4, NULL, 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(857, '2015-12-28', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(858, '2015-12-29', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(859, '2015-12-30', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(860, '2015-12-31', '8.00', '1.0000', 3, '07-09-2015 07:43 Oscar Sierra\r\n\r\nI would like to apply to my Christmas leave (go to Spain two weeks). Thank you very much.\r\n\r\n', 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(861, '2016-01-01', '0.00', '0.0000', 5, NULL, 339, 1, 41, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(862, '2015-09-07', '4.00', '0.5000', 3, '08-09-2015 14:14 Tian Xi\r\n\r\nDiarrhea\r\n\r\n', 340, 2, 32, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(863, '2015-09-25', '8.00', '1.0000', 3, '', 341, 1, 47, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(864, '2015-09-09', '4.00', '0.5000', 3, '09-09-2015 12:55 Ge Hong\r\n\r\nPm off urgent personal matters.\r\n\r\n', 342, 1, 24, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(865, '2015-09-03', '8.00', '1.0000', 3, '09-09-2015 12:57 Ge Hong\r\n\r\nMC\r\n\r\n', 343, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(866, '2015-09-04', '8.00', '1.0000', 3, '09-09-2015 12:57 Ge Hong\r\n\r\nMC\r\n\r\n', 343, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(867, '2015-09-16', '8.00', '1.0000', 3, '09-09-2015 12:59 Ge Hong\r\n\r\nAnnual leave\r\n\r\n', 344, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(868, '2015-09-02', '8.00', '1.0000', 3, '', 345, 2, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(869, '2015-09-28', '8.00', '1.0000', 3, '', 346, 5, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(870, '2015-09-29', '8.00', '1.0000', 3, '', 346, 5, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(871, '2015-09-30', '8.00', '1.0000', 3, '', 346, 5, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(872, '2015-10-01', '4.00', '0.5000', 3, '', 347, 9, 9, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(873, '2015-10-01', '4.00', '0.5000', 3, '', 348, 1, 9, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(874, '2015-10-02', '8.00', '1.0000', 3, '', 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(875, '2015-10-03', '0.00', '0.0000', 4, NULL, 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(876, '2015-10-04', '0.00', '0.0000', 4, NULL, 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(877, '2015-10-05', '8.00', '1.0000', 3, '', 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(878, '2015-10-06', '8.00', '1.0000', 3, '', 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(879, '2015-10-07', '8.00', '1.0000', 3, '', 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(880, '2015-10-08', '8.00', '1.0000', 3, '', 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(881, '2015-10-09', '8.00', '1.0000', 3, '', 348, 1, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(882, '2016-01-01', '0.00', '0.0000', 5, NULL, 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(883, '2016-01-02', '0.00', '0.0000', 4, NULL, 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(884, '2016-01-03', '0.00', '0.0000', 4, NULL, 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(885, '2016-01-04', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(886, '2016-01-05', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(887, '2016-01-06', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(888, '2016-01-07', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(889, '2016-01-08', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(890, '2016-01-09', '0.00', '0.0000', 4, NULL, 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(891, '2016-01-10', '0.00', '0.0000', 4, NULL, 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(892, '2016-01-11', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(893, '2016-01-12', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(894, '2016-01-13', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(895, '2016-01-14', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(896, '2016-01-15', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(897, '2016-01-16', '0.00', '0.0000', 4, NULL, 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(898, '2016-01-17', '0.00', '0.0000', 4, NULL, 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(899, '2016-01-18', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(900, '2016-01-19', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(901, '2016-01-20', '8.00', '1.0000', 3, '', 349, 11, 5, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(902, '2015-09-14', '8.00', '1.0000', 3, '', 350, 2, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(903, '2015-09-15', '8.00', '1.0000', 3, '', 351, 2, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(904, '2015-09-16', '8.00', '1.0000', 3, '', 351, 2, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(905, '2015-09-21', '8.00', '1.0000', 0, '16-09-2015 10:35 Hangyu Ma\r\n\r\nMy girlfriend is ill and I need to see her.\r\n\r\n', 352, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(906, '2015-09-17', '8.00', '1.0000', 3, '', 353, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(907, '2015-10-08', '8.00', '1.0000', 3, '', 354, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(908, '2015-10-30', '8.00', '1.0000', 3, '', 355, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(909, '2015-11-12', '8.00', '1.0000', 3, '', 356, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(910, '2015-12-08', '8.00', '1.0000', 3, '', 357, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(911, '2015-10-01', '8.00', '1.0000', 3, '21-09-2015 06:03 Hangyu Ma\r\n\r\nChina National Day and I need to go back home.\r\n\r\n', 358, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(912, '2015-10-02', '8.00', '1.0000', 3, '21-09-2015 06:03 Hangyu Ma\r\n\r\nChina National Day and I need to go back home.\r\n\r\n', 359, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(913, '2015-09-25', '8.00', '1.0000', 3, '', 360, 4, 13, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(914, '2015-09-25', '8.00', '1.0000', 3, '', 361, 5, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(915, '2015-09-26', '0.00', '0.0000', 4, NULL, 361, 5, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(916, '2015-09-27', '0.00', '0.0000', 4, NULL, 361, 5, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(917, '2015-09-28', '8.00', '1.0000', 3, '', 361, 5, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(918, '2015-09-29', '8.00', '1.0000', 3, '', 362, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(919, '2015-09-30', '8.00', '1.0000', 3, '', 362, 1, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(920, '2015-10-01', '4.00', '0.5000', 3, '', 363, 1, 29, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(921, '2015-10-01', '4.00', '0.5000', 3, '', 364, 11, 29, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(922, '2015-09-17', '8.00', '1.0000', 3, '25-09-2015 03:12 Ge Hong\r\n\r\nMC\r\n\r\n', 365, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(923, '2015-09-18', '8.00', '1.0000', 3, '25-09-2015 03:12 Ge Hong\r\n\r\nMC\r\n\r\n', 365, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(924, '2015-09-21', '8.00', '1.0000', 3, '25-09-2015 03:13 Ge Hong\r\n\r\nMC\r\n\r\n', 366, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(925, '2015-09-22', '8.00', '1.0000', 3, '25-09-2015 03:13 Ge Hong\r\n\r\nMC\r\n\r\n', 366, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(926, '2015-09-23', '8.00', '1.0000', 3, '25-09-2015 03:13 Ge Hong\r\n\r\nMC\r\n\r\n', 367, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(927, '2015-09-25', '8.00', '1.0000', 3, '25-09-2015 03:14 Ge Hong\r\n\r\nMC\r\n\r\n', 368, 2, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(928, '2015-09-28', '8.00', '1.0000', 0, '25-09-2015 03:15 Ge Hong\r\n\r\nAnnual Leave for personal issues\r\n\r\n', 369, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(929, '2015-09-29', '8.00', '1.0000', 0, '25-09-2015 03:15 Ge Hong\r\n\r\nAnnual Leave for personal issues\r\n\r\n', 369, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(930, '2015-09-30', '8.00', '1.0000', 0, '25-09-2015 03:15 Ge Hong\r\n\r\nAnnual Leave for personal issues\r\n\r\n', 369, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(931, '2015-10-01', '8.00', '1.0000', 0, '25-09-2015 03:18 Ge Hong\r\n\r\nrequest for 01-30October\r\n\r\n', 370, 11, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(932, '2015-10-02', '8.00', '1.0000', 0, '25-09-2015 03:18 Ge Hong\r\n\r\nrequest for 01-30October\r\n\r\n', 370, 11, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(933, '2015-10-03', '0.00', '0.0000', 4, NULL, 370, 11, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(934, '2015-10-04', '0.00', '0.0000', 4, NULL, 370, 11, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(935, '2015-10-05', '8.00', '1.0000', 0, '25-09-2015 03:18 Ge Hong\r\n\r\nrequest for 01-30October\r\n\r\n', 370, 11, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(936, '2015-10-06', '8.00', '1.0000', 0, '25-09-2015 03:18 Ge Hong\r\n\r\nrequest for 01-30October\r\n\r\n', 370, 11, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(937, '2015-10-07', '8.00', '1.0000', 0, '25-09-2015 03:18 Ge Hong\r\n\r\nrequest for 01-30October\r\n\r\n', 370, 11, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(938, '2015-10-08', '4.00', '0.5000', 3, '27-09-2015 18:06 Nadia Jean\r\n\r\nHi all,\r\n\r\nI will be taking leave half day in the afternoon on 8th and full day on 9th.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 371, 1, 14, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(939, '2015-10-09', '8.00', '1.0000', 3, '27-09-2015 18:07 Nadia Jean\r\n\r\nHi all,\r\n\r\nI will be taking leave half day in the afternoon on 8th and full day on 9th.\r\n\r\nThanks,\r\nNadia\r\n\r\n', 372, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(940, '2015-11-09', '8.00', '1.0000', 0, '', 373, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(941, '2015-09-29', '4.00', '0.5000', 0, '29-09-2015 08:26 Hangyu Ma\r\n\r\nSick....\r\n\r\n', 374, 2, 46, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(942, '2015-09-29', '8.00', '1.0000', 3, '30-09-2015 04:09 Tian Xi\r\n\r\ndysmenorrhea\r\n\r\n', 375, 2, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(943, '2015-09-23', '4.00', '0.5000', 3, '', 376, 1, 35, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(944, '2015-09-25', '4.00', '0.5000', 3, '', 377, 1, 35, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(945, '2015-09-10', '4.00', '0.5000', 3, '', 378, 2, 35, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(946, '2015-09-18', '4.00', '0.5000', 3, '', 379, 2, 35, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(947, '2015-11-09', '8.00', '1.0000', 3, '', 380, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(948, '2015-09-28', '8.00', '1.0000', 3, '01-10-2015 16:56 Ge Hong\r\n\r\nAL 28sep only. Worked on 29 30sep.\r\n\r\n', 381, 1, 24, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(949, '2015-09-15', '4.00', '0.5000', 3, '01-10-2015 16:57 Ge Hong\r\n\r\nHalfday MC.\r\n\r\n', 382, 2, 24, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(950, '2015-10-02', '8.00', '1.0000', 3, '', 383, 11, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(951, '2015-11-09', '8.00', '1.0000', 3, '', 384, 1, 47, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(952, '2015-11-09', '8.00', '1.0000', 3, '', 385, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(953, '2015-11-10', '0.00', '0.0000', 5, NULL, 385, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(954, '2015-10-08', '8.00', '1.0000', 3, '', 386, 2, 40, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(955, '2015-10-16', '8.00', '1.0000', 3, '', 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(956, '2015-10-17', '0.00', '0.0000', 4, NULL, 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(957, '2015-10-18', '0.00', '0.0000', 4, NULL, 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(958, '2015-10-19', '8.00', '1.0000', 3, '', 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(959, '2015-10-20', '8.00', '1.0000', 3, '', 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(960, '2015-10-21', '8.00', '1.0000', 3, '', 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(961, '2015-10-22', '8.00', '1.0000', 3, '', 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(962, '2015-10-23', '8.00', '1.0000', 3, '', 387, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(963, '2015-10-26', '8.00', '1.0000', 3, '', 388, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(964, '2015-10-27', '8.00', '1.0000', 3, '', 388, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(965, '2015-10-28', '8.00', '1.0000', 3, '', 388, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(966, '2015-10-07', '4.00', '0.5000', 3, '', 389, 4, 7, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(967, '2015-10-09', '8.00', '1.0000', 3, '', 390, 2, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(968, '2015-10-16', '8.00', '1.0000', 3, '', 391, 1, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(969, '2015-10-01', '8.00', '1.0000', 3, '', 392, 2, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(970, '2015-10-02', '8.00', '1.0000', 3, '', 392, 2, 33, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(971, '2015-10-14', '4.00', '0.5000', 3, '12-10-2015 12:05 Hangyu Ma\r\n\r\nAccompany one of my friend from China.\r\n\r\n', 393, 1, 46, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(972, '2015-11-09', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(973, '2015-11-10', '0.00', '0.0000', 5, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(974, '2015-11-11', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(975, '2015-11-12', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(976, '2015-11-13', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(977, '2015-11-14', '0.00', '0.0000', 4, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(978, '2015-11-15', '0.00', '0.0000', 4, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(979, '2015-11-16', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(980, '2015-11-17', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(981, '2015-11-18', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(982, '2015-11-19', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(983, '2015-11-20', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(984, '2015-11-21', '0.00', '0.0000', 4, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(985, '2015-11-22', '0.00', '0.0000', 4, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(986, '2015-11-23', '8.00', '1.0000', 1, NULL, 394, 1, 7, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(987, '2015-10-29', '8.00', '1.0000', 3, '', 395, 5, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(988, '2015-10-05', '4.00', '0.5000', 3, '', 396, 4, 37, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(989, '2015-10-22', '8.00', '1.0000', 3, '', 397, 4, 37, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(990, '2015-11-06', '8.00', '1.0000', 0, '18-10-2015 18:25 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI would like to apply for a 2 days leave on 6th and 9th of November. \r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 398, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(991, '2015-11-07', '0.00', '0.0000', 4, NULL, 398, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(992, '2015-11-08', '0.00', '0.0000', 4, NULL, 398, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(993, '2015-11-09', '8.00', '1.0000', 0, '18-10-2015 18:25 Nadia Jean\r\n\r\nHi Thong and Van Anh,\r\n\r\nI would like to apply for a 2 days leave on 6th and 9th of November. \r\n\r\nThanks and regards,\r\nNadia\r\n\r\n', 398, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(994, '2015-12-28', '8.00', '1.0000', 1, NULL, 399, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(995, '2015-12-29', '8.00', '1.0000', 1, NULL, 399, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(996, '2015-12-30', '8.00', '1.0000', 1, NULL, 399, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(997, '2015-12-31', '8.00', '1.0000', 1, NULL, 399, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(998, '2015-10-30', '8.00', '1.0000', 0, '', 400, 5, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(999, '2015-10-30', '8.00', '1.0000', 3, '', 401, 5, 9, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1000, '2015-11-19', '8.00', '1.0000', 0, '', 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1001, '2015-11-20', '8.00', '1.0000', 0, '', 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1002, '2015-11-21', '0.00', '0.0000', 4, NULL, 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1003, '2015-11-22', '0.00', '0.0000', 4, NULL, 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1004, '2015-11-23', '8.00', '1.0000', 0, '', 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1005, '2015-11-24', '8.00', '1.0000', 0, '', 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1006, '2015-11-25', '8.00', '1.0000', 0, '', 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1007, '2015-11-26', '8.00', '1.0000', 0, '', 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1008, '2015-11-27', '8.00', '1.0000', 0, '', 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1009, '2015-11-28', '0.00', '0.0000', 4, NULL, 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1010, '2015-11-29', '0.00', '0.0000', 4, NULL, 402, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1011, '2016-02-20', '0.00', '0.0000', 4, NULL, 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1012, '2016-02-21', '0.00', '0.0000', 4, NULL, 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1013, '2016-02-22', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1014, '2016-02-23', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1015, '2016-02-24', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1016, '2016-02-25', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1017, '2016-02-26', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1018, '2016-02-27', '0.00', '0.0000', 4, NULL, 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1019, '2016-02-28', '0.00', '0.0000', 4, NULL, 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1020, '2016-02-29', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1021, '2016-03-01', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1022, '2016-03-02', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1023, '2016-03-03', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1024, '2016-03-04', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1025, '2016-03-05', '0.00', '0.0000', 4, NULL, 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1026, '2016-03-06', '0.00', '0.0000', 4, NULL, 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1027, '2016-03-07', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1028, '2016-03-08', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1029, '2016-03-09', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1030, '2016-03-10', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1031, '2016-03-11', '8.00', '1.0000', 3, '26-10-2015 09:42 Charles-Henri Marc Leroux\r\n\r\nMy wedding\r\n\r\n', 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1032, '2016-03-12', '0.00', '0.0000', 4, NULL, 403, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1033, '2015-11-02', '8.00', '1.0000', 0, '27-10-2015 02:48 Hangyu Ma\r\n\r\nPrepare PhD application\r\n\r\n', 404, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1034, '2015-11-03', '8.00', '1.0000', 0, '27-10-2015 02:48 Hangyu Ma\r\n\r\nPrepare PhD application\r\n\r\n', 404, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1035, '2015-11-04', '8.00', '1.0000', 0, '27-10-2015 02:51 Hangyu Ma\r\n\r\nPrepare PhD application\r\n\r\n', 405, 5, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1036, '2015-11-05', '8.00', '1.0000', 0, '27-10-2015 02:51 Hangyu Ma\r\n\r\nPrepare PhD application\r\n\r\n', 405, 5, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1037, '2016-01-04', '8.00', '1.0000', 3, '', 406, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1038, '2016-01-05', '8.00', '1.0000', 3, '', 406, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1039, '2016-01-06', '8.00', '1.0000', 3, '', 406, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1040, '2016-01-07', '8.00', '1.0000', 3, '', 406, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1041, '2016-01-08', '8.00', '1.0000', 3, '', 406, 1, 6, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1042, '2015-11-02', '8.00', '1.0000', 3, '', 407, 5, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1043, '2015-11-03', '8.00', '1.0000', 3, '', 407, 5, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1044, '2015-10-30', '8.00', '1.0000', 0, '', 408, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1045, '2015-10-29', '8.00', '1.0000', 0, '', 409, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1046, '2015-11-20', '8.00', '1.0000', 1, NULL, 410, 1, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1047, '2015-10-30', '8.00', '1.0000', 3, '29-10-2015 14:42 Hangyu Ma\r\n\r\nGastroenteritis\r\n\r\n', 411, 2, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1048, '2015-11-06', '8.00', '1.0000', 0, '29-10-2015 15:21 Hangyu Ma\r\n\r\nClear annual leave.\r\n\r\n', 412, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1049, '2015-10-30', '4.00', '0.5000', 1, NULL, 413, 4, 24, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1050, '2015-10-30', '8.00', '1.0000', 3, '31-10-2015 16:15 Wan Xian LEE\r\n\r\nUrgent Leave due to family matters\r\n\r\n31-10-2015 16:13 Wan Xian LEE\r\n\r\nUrgent Leave\r\n\r\n', 414, 1, 50, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1051, '2015-11-02', '8.00', '1.0000', 1, NULL, 415, 2, 32, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1052, '2015-11-06', '8.00', '1.0000', 1, NULL, 416, 1, 58, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1053, '2015-11-20', '8.00', '1.0000', 3, '', 417, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1054, '2015-11-21', '0.00', '0.0000', 4, NULL, 417, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1055, '2015-11-22', '0.00', '0.0000', 4, NULL, 417, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1056, '2015-11-23', '8.00', '1.0000', 3, '', 417, 1, 11, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1057, '2015-12-10', '8.00', '1.0000', 3, '', 418, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1058, '2015-12-11', '8.00', '1.0000', 3, '', 418, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1059, '2015-12-12', '0.00', '0.0000', 4, NULL, 418, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1060, '2015-12-13', '0.00', '0.0000', 4, NULL, 418, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1061, '2015-11-13', '8.00', '1.0000', 3, '', 419, 1, 8, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1062, '2015-11-17', '4.00', '0.5000', 3, '', 420, 1, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1063, '2015-11-18', '4.00', '0.5000', 3, '', 421, 1, 8, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1064, '2015-11-06', '8.00', '1.0000', 3, '05-11-2015 02:45 Hangyu Ma\r\n\r\nUrgent annual leave due to family issue.\r\n\r\n', 422, 1, 46, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1065, '2015-10-30', '8.00', '1.0000', 1, NULL, 423, 5, 29, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1066, '2015-11-06', '4.00', '0.5000', 1, NULL, 424, 4, 24, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1067, '2015-11-11', '4.00', '0.5000', 1, NULL, 425, 4, 24, '13:00:00', '18:00:00', 2);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1068, '2015-11-09', '8.00', '1.0000', 1, NULL, 426, 1, 14, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1069, '2016-12-22', '8.00', '1.0000', 2, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1070, '2016-12-23', '8.00', '1.0000', 2, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1071, '2016-12-24', '0.00', '0.0000', 4, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1072, '2016-12-25', '0.00', '0.0000', 4, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1073, '2016-12-26', '8.00', '1.0000', 2, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1074, '2016-12-27', '8.00', '1.0000', 2, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1075, '2016-12-28', '8.00', '1.0000', 2, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1076, '2016-12-29', '8.00', '1.0000', 2, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1077, '2016-12-30', '8.00', '1.0000', 2, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1078, '2016-12-31', '0.00', '0.0000', 4, NULL, 427, 1, 48, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1079, '2016-06-28', '8.00', '1.0000', 3, '', 428, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1080, '2016-06-29', '8.00', '1.0000', 3, '', 428, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1081, '2016-06-30', '8.00', '1.0000', 3, '', 428, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1082, '2016-08-17', '8.00', '1.0000', 1, NULL, 429, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1083, '2016-08-18', '8.00', '1.0000', 1, NULL, 429, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1084, '2016-08-17', '8.00', '1.0000', 3, NULL, 430, 1, 65, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1085, '2016-08-18', '8.00', '1.0000', 3, NULL, 430, 1, 65, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1086, '2016-08-24', '8.00', '1.0000', 3, NULL, 431, 1, 65, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1087, '2016-08-25', '0.00', '0.0000', 5, NULL, 431, 1, 65, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1088, '2016-08-26', '8.00', '1.0000', 3, NULL, 431, 1, 65, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1089, '2016-08-29', '8.00', '1.0000', 3, NULL, 432, 1, 65, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1090, '2016-08-30', '8.00', '1.0000', 3, NULL, 432, 1, 65, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1091, '2016-08-24', '8.00', '1.0000', 1, NULL, 433, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1092, '2016-08-25', '0.00', '0.0000', 5, NULL, 433, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1093, '2016-08-26', '8.00', '1.0000', 1, NULL, 433, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1094, '2016-08-29', '0.00', '0.0000', 5, NULL, 434, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1095, '2016-08-30', '8.00', '1.0000', 1, NULL, 434, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1096, '2016-10-03', '8.00', '1.0000', 1, NULL, 435, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1097, '2016-10-04', '8.00', '1.0000', 1, NULL, 435, 1, 61, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1120, '2016-09-01', '4.00', '0.5000', 1, NULL, 442, 1, 61, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1121, '2016-10-07', '4.00', '0.5000', 1, NULL, 443, 1, 61, '09:00:00', '13:00:00', 1);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1122, '2016-08-30', '8.00', '1.0000', 1, NULL, 444, 1, 4, '00:00:00', '00:00:00', 0);
INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES(1123, '2016-08-31', '8.00', '1.0000', 1, NULL, 444, 1, 4, '00:00:00', '00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_adjustment`
--

DROP TABLE IF EXISTS `ohrm_leave_adjustment`;
CREATE TABLE `ohrm_leave_adjustment` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `adjustment_type` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_adjustment`
--

TRUNCATE TABLE `ohrm_leave_adjustment`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_comment`
--

DROP TABLE IF EXISTS `ohrm_leave_comment`;
CREATE TABLE `ohrm_leave_comment` (
  `id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_comment`
--

TRUNCATE TABLE `ohrm_leave_comment`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement`
--

DROP TABLE IF EXISTS `ohrm_leave_entitlement`;
CREATE TABLE `ohrm_leave_entitlement` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `days_used` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `entitlement_type` int(10) UNSIGNED NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_entitlement`
--

TRUNCATE TABLE `ohrm_leave_entitlement`;
--
-- Dumping data for table `ohrm_leave_entitlement`
--

INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(209, 58, '14.000000000000000', '0.0000', 2, '2015-01-01 00:00:00', '2015-12-31 00:00:00', '2015-10-09 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(210, 11, '2.000000000000000', '0.0000', 5, '2015-01-01 00:00:00', '2015-12-31 00:00:00', '2015-10-26 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(211, 33, '60.000000000000000', '0.0000', 12, '2015-01-01 00:00:00', '2015-12-31 00:00:00', '2015-10-15 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(212, 54, '14.000000000000000', '0.0000', 2, '2015-01-01 00:00:00', '2015-12-31 00:00:00', '2015-10-16 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(213, 49, '20.000000000000000', '0.0000', 1, '2015-01-01 00:00:00', '2015-12-31 00:00:00', '2015-10-19 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(214, 49, '14.000000000000000', '0.0000', 2, '2015-01-01 00:00:00', '2015-12-31 00:00:00', '2015-10-19 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(215, 6, '25.000000000000000', '5.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2015-10-27 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(216, 48, '25.000000000000000', '22.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2015-10-25 00:00:00', NULL, 1, 0, 11, 'Van Anh');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(217, 11, '25.000000000000000', '0.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2015-10-25 00:00:00', NULL, 1, 0, 11, 'Van Anh');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(218, 9, '21.000000000000000', '0.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2015-10-25 00:00:00', NULL, 1, 0, 11, 'Van Anh');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(219, 8, '22.000000000000000', '0.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2015-10-25 00:00:00', NULL, 1, 0, 11, 'Van Anh');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(220, 48, '14.000000000000000', '0.0000', 2, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2015-10-26 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(221, 6, '14.000000000000000', '0.0000', 2, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2015-10-26 00:00:00', NULL, 1, 0, 34, 'Chiu Ling');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(222, 37, '5.000000000000000', '0.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2016-06-27 00:00:00', NULL, 1, 0, 52, 'Marc');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(223, 61, '75.000000000000000', '22.5000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2016-08-16 00:00:00', NULL, 1, 0, 52, 'Marc');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(224, 65, '22.000000000000000', '6.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2016-08-04 00:00:00', NULL, 1, 0, 52, 'Marc');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(225, 63, '10.000000000000000', '0.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2016-08-03 00:00:00', NULL, 1, 0, 52, 'Marc');
INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES(226, 4, '40.000000000000000', '10.0000', 1, '2016-01-01 00:00:00', '2016-12-31 00:00:00', '2016-08-11 00:00:00', NULL, 1, 0, 52, 'Marc');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_adjustment`
--

DROP TABLE IF EXISTS `ohrm_leave_entitlement_adjustment`;
CREATE TABLE `ohrm_leave_entitlement_adjustment` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(10) UNSIGNED NOT NULL,
  `entitlement_id` int(10) UNSIGNED NOT NULL,
  `length_days` decimal(4,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_entitlement_adjustment`
--

TRUNCATE TABLE `ohrm_leave_entitlement_adjustment`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_type`
--

DROP TABLE IF EXISTS `ohrm_leave_entitlement_type`;
CREATE TABLE `ohrm_leave_entitlement_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_editable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_entitlement_type`
--

TRUNCATE TABLE `ohrm_leave_entitlement_type`;
--
-- Dumping data for table `ohrm_leave_entitlement_type`
--

INSERT INTO `ohrm_leave_entitlement_type` (`id`, `name`, `is_editable`) VALUES(1, 'Added', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_leave_entitlement`
--

DROP TABLE IF EXISTS `ohrm_leave_leave_entitlement`;
CREATE TABLE `ohrm_leave_leave_entitlement` (
  `id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `entitlement_id` int(10) UNSIGNED NOT NULL,
  `length_days` decimal(6,4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_leave_entitlement`
--

TRUNCATE TABLE `ohrm_leave_leave_entitlement`;
--
-- Dumping data for table `ohrm_leave_leave_entitlement`
--

INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(825, 988, 184, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(826, 989, 184, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(829, 994, 92, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(830, 995, 92, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(831, 996, 92, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(832, 997, 92, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(834, 999, 179, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(842, 1013, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(843, 1014, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(844, 1015, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(845, 1016, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(846, 1017, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(847, 1020, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(848, 1021, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(849, 1022, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(850, 1023, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(851, 1024, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(852, 1027, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(853, 1028, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(854, 1029, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(855, 1030, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(856, 1031, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(861, 1037, 215, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(862, 1038, 215, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(863, 1039, 215, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(864, 1040, 215, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(865, 1041, 215, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(866, 1042, 185, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(867, 1043, 185, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(870, 1046, 141, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(871, 1047, 175, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(873, 1049, 118, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(874, 1050, 192, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(875, 1051, 142, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(876, 1052, 208, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(877, 1053, 177, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(878, 1056, 177, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(879, 1057, 194, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(880, 1058, 194, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(881, 1061, 83, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(882, 1062, 83, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(883, 1063, 83, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(884, 1064, 174, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(885, 1065, 167, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(886, 1066, 118, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(887, 1067, 118, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(888, 1068, 114, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(889, 1069, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(890, 1070, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(891, 1073, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(892, 1074, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(893, 1075, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(894, 1076, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(895, 1077, 216, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(896, 1079, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(897, 1080, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(898, 1081, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(899, 1082, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(900, 1083, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(901, 1084, 224, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(902, 1085, 224, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(903, 1086, 224, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(904, 1088, 224, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(905, 1089, 224, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(906, 1090, 224, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(907, 1091, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(908, 1093, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(909, 1095, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(910, 1096, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(911, 1097, 223, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(932, 1120, 223, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(933, 1121, 223, '0.5000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(934, 1122, 226, '1.0000');
INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES(935, 1123, 226, '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_period_history`
--

DROP TABLE IF EXISTS `ohrm_leave_period_history`;
CREATE TABLE `ohrm_leave_period_history` (
  `id` int(11) NOT NULL,
  `leave_period_start_month` int(11) NOT NULL,
  `leave_period_start_day` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_period_history`
--

TRUNCATE TABLE `ohrm_leave_period_history`;
--
-- Dumping data for table `ohrm_leave_period_history`
--

INSERT INTO `ohrm_leave_period_history` (`id`, `leave_period_start_month`, `leave_period_start_day`, `created_at`) VALUES(1, 1, 1, '2014-08-01');
INSERT INTO `ohrm_leave_period_history` (`id`, `leave_period_start_month`, `leave_period_start_day`, `created_at`) VALUES(2, 1, 1, '2014-08-09');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request`
--

DROP TABLE IF EXISTS `ohrm_leave_request`;
CREATE TABLE `ohrm_leave_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `date_applied` date NOT NULL,
  `emp_number` int(7) NOT NULL,
  `comments` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_request`
--

TRUNCATE TABLE `ohrm_leave_request`;
--
-- Dumping data for table `ohrm_leave_request`
--

INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(369, 1, '2015-09-28', 24, 'Annual Leave for personal issues');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(370, 11, '2015-10-01', 24, 'request for 01-30October');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(371, 1, '2015-10-08', 14, 'Hi all,\r\n\r\nI will be taking leave half day in the afternoon on 8th and full day on 9th.\r\n\r\nThanks,\r\nNadia');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(372, 1, '2015-10-09', 14, 'Hi all,\r\n\r\nI will be taking leave half day in the afternoon on 8th and full day on 9th.\r\n\r\nThanks,\r\nNadia');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(373, 1, '2015-11-09', 11, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(374, 2, '2015-09-29', 46, 'Sick....');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(375, 2, '2015-09-29', 32, 'dysmenorrhea');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(376, 1, '2015-09-23', 35, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(377, 1, '2015-09-25', 35, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(378, 2, '2015-09-10', 35, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(379, 2, '2015-09-18', 35, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(380, 1, '2015-11-09', 11, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(381, 1, '2015-09-28', 24, 'AL 28sep only. Worked on 29 30sep.');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(382, 2, '2015-09-15', 24, 'Halfday MC.');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(383, 11, '2015-10-02', 29, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(384, 1, '2015-11-09', 47, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(385, 1, '2015-11-09', 48, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(386, 2, '2015-10-08', 40, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(387, 5, '2015-10-16', 8, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(388, 1, '2015-10-26', 8, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(389, 4, '2015-10-07', 7, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(390, 2, '2015-10-09', 7, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(391, 1, '2015-10-16', 33, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(392, 2, '2015-10-01', 33, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(393, 1, '2015-10-14', 46, 'Accompany one of my friend from China.');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(394, 1, '2015-11-09', 7, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(395, 5, '2015-10-29', 8, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(396, 4, '2015-10-05', 37, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(397, 4, '2015-10-22', 37, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(398, 1, '2015-11-06', 14, 'Hi Thong and Van Anh,\r\n\r\nI would like to apply for a 2 days leave on 6th and 9th of November. \r\n\r\nThanks and regards,\r\nNadia');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(399, 1, '2015-12-28', 6, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(400, 5, '2015-10-30', 29, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(401, 5, '2015-10-30', 9, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(402, 1, '2015-11-19', 11, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(403, 1, '2016-02-20', 48, 'My wedding');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(404, 1, '2015-11-02', 46, 'Prepare PhD application');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(405, 5, '2015-11-04', 46, 'Prepare PhD application');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(406, 1, '2016-01-04', 6, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(407, 5, '2015-11-02', 46, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(408, 1, '2015-10-30', 46, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(409, 1, '2015-10-29', 46, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(410, 1, '2015-11-20', 32, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(411, 2, '2015-10-30', 46, 'Gastroenteritis');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(412, 1, '2015-11-06', 46, 'Clear annual leave.');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(413, 4, '2015-10-30', 24, 'would like to take childcare leave this pm');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(414, 1, '2015-10-30', 50, 'Urgent Leave');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(415, 2, '2015-11-02', 32, 'Stomachache');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(416, 1, '2015-11-06', 58, 'Graduation/convocation');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(417, 1, '2015-11-20', 11, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(418, 1, '2015-12-10', 48, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(419, 1, '2015-11-13', 8, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(420, 1, '2015-11-17', 8, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(421, 1, '2015-11-18', 8, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(422, 1, '2015-11-06', 46, 'Urgent annual leave due to family issue.');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(423, 5, '2015-10-30', 29, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(424, 4, '2015-11-06', 24, 'half day childcare leave in afternoon.');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(425, 4, '2015-11-11', 24, 'half day childcare leave in afternoon.');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(426, 1, '2015-11-09', 14, 'Hi Van Anh and Thong,\r\n\r\nI would like to re-apply for one day leave. sorry for the inconvenience.\r\n\r\nThanks and regards,\r\nNadia');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(427, 1, '2016-12-22', 48, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(428, 1, '2016-06-28', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(429, 1, '2016-08-17', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(430, 1, '2016-08-17', 65, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(431, 1, '2016-08-24', 65, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(432, 1, '2016-08-29', 65, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(433, 1, '2016-08-24', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(434, 1, '2016-08-29', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(435, 1, '2016-10-03', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(436, 1, '2016-08-01', 4, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(437, 1, '2016-08-16', 4, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(438, 1, '2016-09-07', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(439, 1, '2016-11-16', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(440, 1, '2016-11-28', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(441, 1, '2016-11-25', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(442, 1, '2016-09-01', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(443, 1, '2016-10-07', 61, '');
INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES(444, 1, '2016-08-30', 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request_comment`
--

DROP TABLE IF EXISTS `ohrm_leave_request_comment`;
CREATE TABLE `ohrm_leave_request_comment` (
  `id` int(11) NOT NULL,
  `leave_request_id` int(10) UNSIGNED NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_request_comment`
--

TRUNCATE TABLE `ohrm_leave_request_comment`;
--
-- Dumping data for table `ohrm_leave_request_comment`
--

INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(243, 411, '2015-10-29 14:42:54', 'Hangyu Ma', 40, 46, 'Gastroenteritis');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(244, 412, '2015-10-29 15:21:41', 'Hangyu Ma', 40, 46, 'Clear annual leave.');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(245, 413, '2015-10-30 04:42:30', 'Ge Hong', 21, 24, 'would like to take childcare leave this pm');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(246, 414, '2015-10-31 16:13:31', 'Wan Xian LEE', 45, 50, 'Urgent Leave');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(247, 414, '2015-10-31 16:15:56', 'Wan Xian LEE', 45, 50, 'Urgent Leave due to family matters');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(248, 415, '2015-11-02 02:30:27', 'Tian Xi', 29, 32, 'Stomachache');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(249, 416, '2015-11-03 04:42:41', 'Liang Wei Zhong Marcus', 51, 58, 'Graduation/convocation');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(250, 422, '2015-11-05 02:45:37', 'Hangyu Ma', 40, 46, 'Urgent annual leave due to family issue.');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(251, 424, '2015-11-06 03:54:05', 'Ge Hong', 21, 24, 'half day childcare leave in afternoon.');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(252, 425, '2015-11-06 03:54:30', 'Ge Hong', 21, 24, 'half day childcare leave in afternoon.');
INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES(253, 426, '2015-11-06 16:49:10', 'Nadia Jean', 18, 14, 'Hi Van Anh and Thong,\r\n\r\nI would like to re-apply for one day leave. sorry for the inconvenience.\r\n\r\nThanks and regards,\r\nNadia');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_status`
--

DROP TABLE IF EXISTS `ohrm_leave_status`;
CREATE TABLE `ohrm_leave_status` (
  `id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_status`
--

TRUNCATE TABLE `ohrm_leave_status`;
--
-- Dumping data for table `ohrm_leave_status`
--

INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES(1, -1, 'REJECTED');
INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES(2, 0, 'CANCELLED');
INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES(3, 1, 'PENDING APPROVAL');
INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES(4, 2, 'SCHEDULED');
INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES(5, 3, 'TAKEN');
INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES(6, 4, 'WEEKEND');
INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES(7, 5, 'HOLIDAY');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_type`
--

DROP TABLE IF EXISTS `ohrm_leave_type`;
CREATE TABLE `ohrm_leave_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_in_reports_if_no_entitlement` tinyint(1) NOT NULL DEFAULT '0',
  `operational_country_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_leave_type`
--

TRUNCATE TABLE `ohrm_leave_type`;
--
-- Dumping data for table `ohrm_leave_type`
--

INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(1, 'Annual', 0, 0, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(2, 'Medical', 0, 0, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(3, 'Maternity', 0, 1, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(4, 'Childcare', 0, 1, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(5, 'Days in Lieu', 0, 1, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(6, 'Compassionate', 0, 1, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(7, 'Marriage', 0, 1, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(8, 'Paternity', 0, 1, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(9, 'Leaves carried over', 0, 0, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(10, 'Seniority bonus', 0, 0, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(11, 'Unpaid leave', 0, 0, NULL);
INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES(12, 'Hospitalisation Leave', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_license`
--

DROP TABLE IF EXISTS `ohrm_license`;
CREATE TABLE `ohrm_license` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_license`
--

TRUNCATE TABLE `ohrm_license`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_location`
--

DROP TABLE IF EXISTS `ohrm_location`;
CREATE TABLE `ohrm_location` (
  `id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `province` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(35) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `fax` varchar(35) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_location`
--

TRUNCATE TABLE `ohrm_location`;
--
-- Dumping data for table `ohrm_location`
--

INSERT INTO `ohrm_location` (`id`, `name`, `country_code`, `province`, `city`, `address`, `zip_code`, `phone`, `fax`, `notes`) VALUES(1, 'Market Street', 'SG', '', 'Singapore', '137 Market Street\r\n#15-17', '048943', '+65 6809 3722', '+65 6809 3701', '');
INSERT INTO `ohrm_location` (`id`, `name`, `country_code`, `province`, `city`, `address`, `zip_code`, `phone`, `fax`, `notes`) VALUES(3, 'Vietnam Office', 'VN', 'xxxxx', 'Ho Chi Minh City', '334455, ertkfjgkfdnfs', '123456', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_login`
--

DROP TABLE IF EXISTS `ohrm_login`;
CREATE TABLE `ohrm_login` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_name` text NOT NULL,
  `user_role_predefined` tinyint(1) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_login`
--

TRUNCATE TABLE `ohrm_login`;
--
-- Dumping data for table `ohrm_login`
--

INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(1, 1, 'Admin', 'Admin', 1, '2016-05-26 11:30:08');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(2, 1, 'Admin', 'Admin', 1, '2016-06-02 07:47:47');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(3, 1, 'Admin', 'Admin', 1, '2016-06-02 07:48:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(4, 1, 'Admin', 'Admin', 1, '2016-06-03 07:05:34');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(5, 1, 'Admin', 'Admin', 1, '2016-06-08 08:02:49');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(6, 1, 'Admin', 'Admin', 1, '2016-06-08 10:16:20');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(7, 1, 'Admin', 'Admin', 1, '2016-06-20 06:26:40');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(8, 1, 'Admin', 'Admin', 1, '2016-06-20 07:33:35');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(9, 1, 'Admin', 'Admin', 1, '2016-06-20 07:52:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(10, 1, 'Admin', 'Admin', 1, '2016-06-20 09:20:45');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(11, 1, 'Admin', 'Admin', 1, '2016-06-20 09:42:12');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(12, 1, 'Admin', 'Admin', 1, '2016-06-21 02:27:48');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(13, 1, 'Admin', 'Admin', 1, '2016-06-21 02:55:34');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(14, 1, 'Admin', 'Admin', 1, '2016-06-21 07:06:28');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(15, 1, 'Admin', 'Admin', 1, '2016-06-21 07:09:50');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(16, 1, 'Admin', 'Admin', 1, '2016-06-21 07:09:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(17, 1, 'Admin', 'Admin', 1, '2016-06-21 07:32:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(18, 1, 'Admin', 'Admin', 1, '2016-06-21 09:34:49');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(19, 1, 'Admin', 'Admin', 1, '2016-06-21 10:03:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(20, 1, 'Admin', 'Admin', 1, '2016-06-22 07:47:45');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(21, 52, 'Marc', 'Admin', 1, '2016-06-23 06:19:44');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(22, 53, 'Youhou', 'ESS', 1, '2016-06-23 06:39:29');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(23, 52, 'Marc', 'Admin', 1, '2016-06-23 06:41:55');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(24, 52, 'Marc', 'Admin', 1, '2016-06-23 07:51:52');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(25, 52, 'Marc', 'Admin', 1, '2016-06-23 08:10:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(26, 52, 'Marc', 'Admin', 1, '2016-06-23 08:22:58');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(27, 52, 'Marc', 'Admin', 1, '2016-06-23 08:32:19');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(28, 52, 'Marc', 'Admin', 1, '2016-06-23 08:55:05');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(29, 52, 'Marc', 'Admin', 1, '2016-06-23 08:59:54');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(30, 52, 'Marc', 'Admin', 1, '2016-06-23 09:05:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(31, 52, 'Marc', 'Admin', 1, '2016-06-24 01:29:35');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(32, 52, 'Marc', 'Admin', 1, '2016-06-24 06:05:45');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(33, 52, 'Marc', 'Admin', 1, '2016-06-24 09:52:41');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(34, 52, 'Marc', 'Admin', 1, '2016-06-24 09:53:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(35, 52, 'Marc', 'Admin', 1, '2016-06-24 10:45:42');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(36, 52, 'Marc', 'Admin', 1, '2016-06-24 11:15:35');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(37, 52, 'Marc', 'Admin', 1, '2016-06-27 02:45:00');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(38, 52, 'Marc', 'Admin', 1, '2016-06-27 02:51:14');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(39, 52, 'Marc', 'Admin', 1, '2016-06-27 06:52:02');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(40, 52, 'Marc', 'Admin', 1, '2016-06-27 07:46:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(41, 52, 'Marc', 'Admin', 1, '2016-06-27 07:59:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(42, 52, 'Marc', 'Admin', 1, '2016-06-27 08:47:38');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(43, 52, 'Marc', 'Admin', 1, '2016-06-27 09:35:39');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(44, 52, 'Marc', 'Admin', 1, '2016-06-27 10:03:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(45, 52, 'Marc', 'Admin', 1, '2016-06-28 01:21:02');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(46, 52, 'Marc', 'Admin', 1, '2016-06-28 05:09:58');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(47, 52, 'Marc', 'Admin', 1, '2016-06-30 06:27:25');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(48, 52, 'Marc', 'Admin', 1, '2016-08-03 02:24:28');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(49, 52, 'Marc', 'Admin', 1, '2016-08-03 03:47:53');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(50, 52, 'Marc', 'Admin', 1, '2016-08-03 05:46:09');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(51, 52, 'Marc', 'Admin', 1, '2016-08-03 06:27:48');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(52, 52, 'Marc', 'Admin', 1, '2016-08-04 01:47:46');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(53, 52, 'Marc', 'Admin', 1, '2016-08-04 06:39:39');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(54, 52, 'Marc', 'Admin', 1, '2016-08-04 07:10:57');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(55, 52, 'Marc', 'Admin', 1, '2016-08-04 08:34:53');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(56, 52, 'Marc', 'Admin', 1, '2016-08-04 08:54:10');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(57, 52, 'Marc', 'Admin', 1, '2016-08-04 08:56:13');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(58, 52, 'Marc', 'Admin', 1, '2016-08-05 02:11:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(59, 52, 'Marc', 'Admin', 1, '2016-08-05 02:25:35');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(60, 52, 'Marc', 'Admin', 1, '2016-08-05 08:22:25');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(61, 52, 'Marc', 'Admin', 1, '2016-08-05 10:11:40');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(62, 52, 'Marc', 'Admin', 1, '2016-08-08 14:32:32');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(63, 52, 'Marc', 'Admin', 1, '2016-08-10 01:25:33');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(64, 52, 'Marc', 'Admin', 1, '2016-08-10 02:53:09');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(65, 52, 'Marc', 'Admin', 1, '2016-08-10 03:19:10');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(66, 52, 'Marc', 'Admin', 1, '2016-08-10 03:20:16');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(67, 52, 'Marc', 'Admin', 1, '2016-08-10 03:25:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(68, 52, 'Marc', 'Admin', 1, '2016-08-10 03:28:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(69, 52, 'Marc', 'Admin', 1, '2016-08-10 06:42:12');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(70, 52, 'Marc', 'Admin', 1, '2016-08-11 01:22:39');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(71, 52, 'Marc', 'Admin', 1, '2016-08-11 03:14:28');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(72, 52, 'Marc', 'Admin', 1, '2016-08-11 03:18:44');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(73, 52, 'Marc', 'Admin', 1, '2016-08-11 03:21:44');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(74, 52, 'Marc', 'Admin', 1, '2016-08-11 03:22:45');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(75, 52, 'Marc', 'Admin', 1, '2016-08-11 03:24:19');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(76, 52, 'Marc', 'Admin', 1, '2016-08-11 05:45:18');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(77, 52, 'Marc', 'Admin', 1, '2016-08-11 05:47:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(78, 52, 'Marc', 'Admin', 1, '2016-08-11 05:50:42');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(79, 52, 'Marc', 'Admin', 1, '2016-08-11 06:03:15');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(80, 52, 'Marc', 'Admin', 1, '2016-08-11 06:05:59');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(81, 52, 'Marc', 'Admin', 1, '2016-08-11 07:25:50');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(82, 53, 'Youhou', 'ESS', 1, '2016-08-11 09:26:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(83, 52, 'Marc', 'Admin', 1, '2016-08-12 01:38:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(84, 52, 'Marc', 'Admin', 1, '2016-08-12 02:02:38');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(85, 53, 'Youhou', 'ESS', 1, '2016-08-12 05:36:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(86, 52, 'Marc', 'Admin', 1, '2016-08-12 05:47:02');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(87, 52, 'Marc', 'Admin', 1, '2016-08-12 05:56:19');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(88, 52, 'Marc', 'Admin', 1, '2016-08-12 08:56:34');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(89, 52, 'Marc', 'Admin', 1, '2016-08-12 10:22:41');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(90, 52, 'Marc', 'Admin', 1, '2016-08-12 10:24:19');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(91, 52, 'Marc', 'Admin', 1, '2016-08-12 10:27:30');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(92, 52, 'Marc', 'Admin', 1, '2016-08-15 01:32:53');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(93, 52, 'Marc', 'Admin', 1, '2016-08-15 01:33:02');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(94, 52, 'Marc', 'Admin', 1, '2016-08-15 01:40:15');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(95, 53, 'Youhou', 'ESS', 1, '2016-08-15 02:05:24');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(96, 52, 'Marc', 'Admin', 1, '2016-08-15 02:06:54');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(97, 52, 'Marc', 'Admin', 1, '2016-08-15 07:24:57');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(98, 52, 'Marc', 'Admin', 1, '2016-08-15 07:48:16');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(99, 53, 'Youhou', 'ESS', 1, '2016-08-15 08:00:42');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(100, 52, 'Marc', 'Admin', 1, '2016-08-15 08:07:33');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(101, 53, 'Youhou', 'ESS', 1, '2016-08-15 10:10:27');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(102, 52, 'Marc', 'Admin', 1, '2016-08-16 01:42:32');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(103, 53, 'Youhou', 'ESS', 1, '2016-08-16 01:46:56');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(104, 52, 'Marc', 'Admin', 1, '2016-08-16 02:36:15');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(105, 52, 'Marc', 'Admin', 1, '2016-08-16 02:37:11');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(106, 53, 'Youhou', 'ESS', 1, '2016-08-16 02:37:42');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(107, 52, 'Marc', 'Admin', 1, '2016-08-16 03:30:39');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(108, 52, 'Marc', 'Admin', 1, '2016-08-16 03:35:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(109, 53, 'Youhou', 'ESS', 1, '2016-08-16 03:35:49');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(110, 52, 'Marc', 'Admin', 1, '2016-08-16 03:38:56');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(111, 52, 'Marc', 'Admin', 1, '2016-08-16 07:02:52');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(112, 52, 'Marc', 'Admin', 1, '2016-08-16 10:41:10');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(113, 52, 'Marc', 'Admin', 1, '2016-08-16 10:47:12');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(114, 52, 'Marc', 'Admin', 1, '2016-08-16 10:49:37');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(115, 52, 'Marc', 'Admin', 1, '2016-08-16 10:57:52');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(116, 52, 'Marc', 'Admin', 1, '2016-08-17 01:24:01');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(117, 52, 'Marc', 'Admin', 1, '2016-08-17 01:45:13');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(118, 52, 'Marc', 'Admin', 1, '2016-08-17 03:18:40');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(119, 52, 'Marc', 'Admin', 1, '2016-08-17 03:42:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(120, 52, 'Marc', 'Admin', 1, '2016-08-17 03:44:18');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(121, 53, 'Youhou', 'ESS', 1, '2016-08-17 04:07:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(122, 53, 'Youhou', 'ESS', 1, '2016-08-17 06:43:18');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(123, 52, 'Marc', 'Admin', 1, '2016-08-17 06:44:15');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(124, 53, 'Youhou', 'ESS', 1, '2016-08-17 06:45:40');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(125, 52, 'Marc', 'Admin', 1, '2016-08-17 07:04:39');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(126, 53, 'Youhou', 'ESS', 1, '2016-08-17 07:06:52');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(127, 52, 'Marc', 'Admin', 1, '2016-08-17 07:50:33');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(128, 52, 'Marc', 'Admin', 1, '2016-08-17 07:51:40');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(129, 53, 'Youhou', 'ESS', 1, '2016-08-17 07:52:11');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(130, 52, 'Marc', 'Admin', 1, '2016-08-17 07:57:14');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(131, 53, 'Youhou', 'ESS', 1, '2016-08-17 08:07:50');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(132, 52, 'Marc', 'Admin', 1, '2016-08-17 10:19:58');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(133, 52, 'Marc', 'Admin', 1, '2016-08-18 01:37:42');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(134, 52, 'Marc', 'Admin', 1, '2016-08-18 02:18:23');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(135, 52, 'Marc', 'Admin', 1, '2016-08-22 02:32:52');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(136, 55, 'Le', 'ESS', 1, '2016-08-22 02:38:54');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(137, 53, 'Youhou', 'ESS', 1, '2016-08-22 03:11:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(138, 55, 'Le', 'ESS', 1, '2016-08-22 03:30:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(139, 52, 'Marc', 'Admin', 1, '2016-08-22 03:33:57');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(140, 56, 'test1', 'ESS', 1, '2016-08-22 03:40:40');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(141, 52, 'Marc', 'Admin', 1, '2016-08-22 04:08:20');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(142, 53, 'Youhou', 'ESS', 1, '2016-08-22 04:08:37');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(143, 56, 'test1', 'ESS', 1, '2016-08-22 04:09:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(144, 52, 'Marc', 'Admin', 1, '2016-08-22 04:17:11');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(145, 56, 'test1', 'ESS', 1, '2016-08-22 04:17:34');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(146, 52, 'Marc', 'Admin', 1, '2016-08-22 06:17:45');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(147, 56, 'test1', 'ESS', 1, '2016-08-22 06:19:05');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(148, 52, 'Marc', 'Admin', 1, '2016-08-22 06:30:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(149, 52, 'Marc', 'Admin', 1, '2016-08-23 02:05:43');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(150, 52, 'Marc', 'Admin', 1, '2016-08-23 02:36:06');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(151, 52, 'Marc', 'Admin', 1, '2016-08-23 02:58:02');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(152, 52, 'Marc', 'Admin', 1, '2016-08-23 05:57:22');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(153, 52, 'Marc', 'Admin', 1, '2016-08-23 06:02:46');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(154, 52, 'Marc', 'Admin', 1, '2016-08-23 07:26:14');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(155, 52, 'Marc', 'Admin', 1, '2016-08-23 07:28:46');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(156, 53, 'Youhou', 'ESS', 1, '2016-08-23 08:11:32');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(157, 52, 'Marc', 'Admin', 1, '2016-08-23 08:55:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(158, 53, 'Youhou', 'ESS', 1, '2016-08-23 08:56:36');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(159, 52, 'Marc', 'Admin', 1, '2016-08-24 01:24:34');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(160, 53, 'Youhou', 'ESS', 1, '2016-08-24 01:32:05');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(161, 52, 'Marc', 'Admin', 1, '2016-08-24 01:35:25');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(162, 53, 'Youhou', 'ESS', 1, '2016-08-24 01:40:13');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(163, 52, 'Marc', 'Admin', 1, '2016-08-24 01:58:48');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(164, 53, 'Youhou', 'ESS', 1, '2016-08-24 02:04:27');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(165, 52, 'Marc', 'Admin', 1, '2016-08-24 03:27:28');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(166, 52, 'Marc', 'Admin', 1, '2016-08-24 03:28:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(167, 52, 'Marc', 'Admin', 1, '2016-08-25 02:56:05');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(168, 53, 'Youhou', 'ESS', 1, '2016-08-25 06:14:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(169, 52, 'Marc', 'Admin', 1, '2016-08-25 06:19:20');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(170, 52, 'Marc', 'Admin', 1, '2016-08-25 07:25:15');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(171, 52, 'Marc', 'Admin', 1, '2016-08-25 07:34:46');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(172, 52, 'Marc', 'Admin', 1, '2016-08-26 02:30:19');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(173, 52, 'Marc', 'Admin', 1, '2016-08-26 06:22:00');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(174, 53, 'Youhou', 'ESS', 1, '2016-08-26 07:59:42');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(175, 52, 'Marc', 'Admin', 1, '2016-08-26 08:03:27');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(176, 53, 'Youhou', 'ESS', 1, '2016-08-26 12:39:37');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(177, 52, 'Marc', 'Admin', 1, '2016-08-29 03:07:57');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(178, 53, 'Youhou', 'ESS', 1, '2016-08-29 03:21:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(179, 52, 'Marc', 'Admin', 1, '2016-08-29 03:57:43');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(180, 53, 'Youhou', 'ESS', 1, '2016-08-29 09:34:53');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(181, 100, 'Thong', 'Admin', 1, '2016-08-29 09:40:54');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(182, 100, 'Thong', 'Admin', 1, '2016-08-29 09:57:06');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(183, 100, 'Thong', 'Admin', 1, '2016-08-29 10:53:24');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(184, 100, 'Thong', 'Admin', 1, '2016-08-30 01:29:13');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(185, 100, 'Thong', 'Admin', 1, '2016-08-30 01:46:56');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(186, 101, 'Test', 'ESS', 1, '2016-08-30 01:57:35');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(187, 100, 'Thong', 'Admin', 1, '2016-08-30 01:58:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(188, 101, 'Test', 'ESS', 1, '2016-08-30 02:01:52');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(189, 100, 'Thong', 'Admin', 1, '2016-08-30 02:09:45');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(190, 101, 'Test', 'ESS', 1, '2016-08-30 02:14:02');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(191, 100, 'Thong', 'Admin', 1, '2016-08-30 02:15:37');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(192, 100, 'Thong', 'Admin', 1, '2016-08-30 02:27:08');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(193, 100, 'Thong', 'Admin', 1, '2016-08-30 02:29:02');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(194, 100, 'Thong', 'Admin', 1, '2016-08-30 02:44:56');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(195, 100, 'Thong', 'Admin', 1, '2016-08-30 02:47:05');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(196, 100, 'Thong', 'Admin', 1, '2016-08-30 05:26:39');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(197, 101, 'Test', 'ESS', 1, '2016-08-30 08:36:00');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(198, 100, 'Thong', 'Admin', 1, '2016-08-30 08:39:04');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(199, 101, 'Test', 'ESS', 1, '2016-08-30 08:56:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(200, 100, 'Thong', 'Admin', 1, '2016-08-30 09:09:23');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(201, 101, 'Test', 'ESS', 1, '2016-08-30 09:28:25');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(202, 100, 'Thong', 'Admin', 1, '2016-08-30 09:30:05');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(203, 101, 'Test', 'ESS', 1, '2016-08-30 09:56:18');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(204, 100, 'Thong', 'Admin', 1, '2016-08-31 01:40:17');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(205, 101, 'Test', 'ESS', 1, '2016-08-31 01:42:15');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(206, 100, 'Thong', 'Admin', 1, '2016-08-31 01:43:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(207, 100, 'Thong', 'Admin', 1, '2016-08-31 02:55:10');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(208, 101, 'Test', 'ESS', 1, '2016-08-31 06:12:16');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(209, 100, 'Thong', 'Admin', 1, '2016-08-31 06:12:53');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(210, 101, 'Test', 'ESS', 1, '2016-08-31 06:20:55');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(211, 100, 'Thong', 'Admin', 1, '2016-08-31 07:00:01');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(212, 100, 'Thong', 'Admin', 1, '2016-08-31 07:25:03');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(213, 53, 'Youhou', 'ESS', 1, '2016-08-31 08:26:03');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(214, 100, 'Thong', 'Admin', 1, '2016-08-31 09:12:23');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(215, 100, 'Thong', 'Admin', 1, '2016-08-31 09:28:44');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(216, 100, 'Thong', 'Admin', 1, '2016-08-31 09:53:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(217, 100, 'Thong', 'Admin', 1, '2016-08-31 10:06:47');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(218, 100, 'Thong', 'Admin', 1, '2016-08-31 10:07:43');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(219, 53, 'Youhou', 'ESS', 1, '2016-08-31 10:08:19');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(220, 101, 'Test', 'ESS', 1, '2016-08-31 10:08:37');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(221, 53, 'Youhou', 'ESS', 1, '2016-08-31 10:17:00');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(222, 100, 'Thong', 'Admin', 1, '2016-08-31 10:52:11');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(223, 100, 'Thong', 'Admin', 1, '2016-08-31 10:53:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(224, 100, 'Thong', 'Admin', 1, '2016-09-01 07:51:37');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(225, 100, 'Thong', 'Admin', 1, '2016-09-01 08:00:13');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(226, 100, 'Thong', 'Admin', 1, '2016-09-01 09:38:13');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(227, 100, 'Thong', 'Admin', 1, '2016-09-01 09:57:30');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(228, 53, 'Youhou', 'ESS', 1, '2016-09-01 10:39:19');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(229, 100, 'Thong', 'Admin', 1, '2016-09-02 04:28:41');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(230, 100, 'Thong', 'Admin', 1, '2016-09-02 05:06:01');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(231, 100, 'Thong', 'Admin', 1, '2016-09-02 05:14:22');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(232, 100, 'Thong', 'Admin', 1, '2016-09-02 07:51:29');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(233, 100, 'Thong', 'Admin', 1, '2016-09-02 08:40:30');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(234, 100, 'Thong', 'Admin', 1, '2016-09-02 08:54:14');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(235, 100, 'Thong', 'Admin', 1, '2016-09-03 03:55:35');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(236, 100, 'Thong', 'Admin', 1, '2016-09-03 03:58:34');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(237, 100, 'Thong', 'Admin', 1, '2016-09-03 05:03:28');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(238, 53, 'Youhou', 'ESS', 1, '2016-09-03 05:10:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(239, 100, 'Thong', 'Admin', 1, '2016-09-03 05:23:03');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(240, 100, 'Thong', 'Admin', 1, '2016-09-03 05:26:29');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(241, 100, 'Thong', 'Admin', 1, '2016-09-03 13:41:00');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(242, 100, 'Thong', 'Admin', 1, '2016-09-04 08:16:13');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(243, 100, 'Thong', 'Admin', 1, '2016-09-26 06:54:28');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(244, 100, 'Thong', 'Admin', 1, '2016-09-26 07:03:35');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(245, 100, 'Thong', 'Admin', 1, '2016-10-03 03:57:26');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(246, 41, 'Alexandre', 'ESS', 1, '2016-10-03 08:37:56');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(247, 100, 'Thong', 'Admin', 1, '2016-10-03 08:38:38');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(248, 100, 'Thong', 'Admin', 1, '2016-10-03 08:38:42');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(249, 41, 'Alexandre', 'ESS', 1, '2016-10-03 08:43:09');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(250, 100, 'Thong', 'Admin', 1, '2016-10-03 08:45:05');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(251, 100, 'Thong', 'Admin', 1, '2016-10-05 09:46:40');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(252, 100, 'Thong', 'Admin', 1, '2016-10-05 09:46:45');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(253, 100, 'Thong', 'Admin', 1, '2016-10-06 04:24:07');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(254, 100, 'Thong', 'Admin', 1, '2016-10-06 04:35:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(255, 100, 'Thong', 'Admin', 1, '2016-10-06 04:42:59');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(256, 100, 'Thong', 'Admin', 1, '2016-10-06 05:46:17');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(257, 100, 'Thong', 'Admin', 1, '2016-10-07 02:31:15');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(258, 100, 'Thong', 'Admin', 1, '2016-10-07 02:48:31');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(259, 100, 'Thong', 'Admin', 1, '2016-10-09 13:12:51');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(260, 100, 'Thong', 'Admin', 1, '2016-10-11 08:34:18');
INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES(261, 100, 'Thong', 'Admin', 1, '2016-10-11 08:34:47');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_membership`
--

DROP TABLE IF EXISTS `ohrm_membership`;
CREATE TABLE `ohrm_membership` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_membership`
--

TRUNCATE TABLE `ohrm_membership`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_menu_item`
--

DROP TABLE IF EXISTS `ohrm_menu_item`;
CREATE TABLE `ohrm_menu_item` (
  `id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `order_hint` int(11) NOT NULL,
  `url_extras` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_menu_item`
--

TRUNCATE TABLE `ohrm_menu_item`;
--
-- Dumping data for table `ohrm_menu_item`
--

INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(1, 'Admin', 74, NULL, 1, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(2, 'User Management', NULL, 1, 2, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(3, 'Project Info', NULL, 52, 2, 400, NULL, 0);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(4, 'Customers', 36, 3, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(5, 'Projects', 37, 3, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(6, 'Job', NULL, 1, 2, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(7, 'Job Titles', 23, 6, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(8, 'Pay Grades', 24, 6, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(9, 'Employment Status', 25, 6, 3, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(10, 'Job Categories', 26, 6, 3, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(11, 'Work Shifts', 27, 6, 3, 500, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(12, 'Organization', NULL, 1, 2, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(13, 'General Information', 20, 12, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(14, 'Locations', 21, 12, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(15, 'Structure', 22, 12, 3, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(16, 'Qualifications', NULL, 1, 2, 500, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(17, 'Skills', 28, 16, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(18, 'Education', 29, 16, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(19, 'Licenses', 30, 16, 3, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(20, 'Languages', 31, 16, 3, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(21, 'Memberships', 32, 16, 3, 500, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(22, 'Nationalities', 33, 1, 2, 700, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(23, 'Configuration', NULL, 1, 2, 900, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(24, 'Email Configuration', 34, 23, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(25, 'Email Subscriptions', 35, 23, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(27, 'Localization', 38, 23, 3, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(28, 'Modules', 39, 23, 3, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(30, 'PIM', 75, NULL, 1, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(31, 'Configuration', NULL, 30, 2, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(32, 'Optional Fields', 40, 31, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(33, 'Custom Fields', 41, 31, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(34, 'Data Import', 42, 31, 3, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(35, 'Reporting Methods', 43, 31, 3, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(36, 'Termination Reasons', 44, 31, 3, 500, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(37, 'Employee List', 5, 30, 2, 200, '/reset/1', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(38, 'Add Employee', 4, 30, 2, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(39, 'Reports', 45, 30, 2, 400, '/reportGroup/3/reportType/PIM_DEFINED', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(40, 'My Info', 46, NULL, 1, 700, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(41, 'Leave', 68, NULL, 1, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(42, 'Configure', NULL, 41, 2, 500, NULL, 0);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(43, 'Leave Period', 47, 42, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(44, 'Leave Types', 7, 42, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(45, 'Work Week', 14, 42, 3, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(46, 'Holidays', 11, 42, 3, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(48, 'Leave List', 16, 41, 2, 600, '/reset/1', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(49, 'Assign Leave', 17, 41, 2, 700, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(50, 'My Leave', 48, 41, 2, 200, '/reset/1', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(51, 'Apply', 49, 41, 2, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(52, 'Time', 67, NULL, 1, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(53, 'Timesheets', NULL, 52, 2, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(54, 'My Timesheets', 51, 53, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(55, 'Employee Timesheets', 52, 53, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(56, 'Attendance', NULL, 52, 2, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(57, 'My Records', 53, 56, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(58, 'Punch In/Out', 54, 56, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(59, 'Employee Records', 55, 56, 3, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(60, 'Configuration', 56, 56, 3, 400, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(61, 'Reports', NULL, 52, 2, 300, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(62, 'Project Reports', 57, 61, 3, 100, '?reportId=1', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(63, 'Employee Reports', 58, 61, 3, 200, '?reportId=2', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(64, 'Attendance Summary', 59, 61, 3, 300, '?reportId=4', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(65, 'Recruitment', 76, NULL, 1, 500, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(66, 'Candidates', 60, 65, 2, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(67, 'Vacancies', 61, 65, 2, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(74, 'Entitlements', NULL, 41, 2, 300, NULL, 0);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(75, 'Add Entitlements', 72, 74, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(76, 'My Entitlements', 70, 74, 3, 300, '/reset/1', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(77, 'Employee Entitlements', 69, 74, 3, 200, '/reset/1', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(78, 'Reports', NULL, 41, 2, 400, NULL, 0);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(79, 'Leave Entitlements and Usage Report', 78, 78, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(80, 'My Leave Entitlements and Usage Report', 79, 78, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(81, 'Users', 1, 2, 3, 100, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(82, 'Dashboard', 103, NULL, 1, 800, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(83, 'Performance', NULL, NULL, 1, 700, '', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(84, 'Configure', NULL, 83, 2, 100, '', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(85, 'Manage Reviews', NULL, 83, 2, 200, '', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(86, 'Skills', 105, 84, 3, 100, '', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(87, 'Manage Reviews', 111, 85, 3, 100, '', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(88, 'My Reviews', 106, 85, 3, 200, '', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(89, 'Review List', 110, 85, 3, 300, '', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(90, 'Objectives', 112, 84, 3, 200, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(91, 'Employee Objectives', 113, 83, 2, 800, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(92, 'My Objectives', 114, 83, 2, 700, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(93, 'Directory', 116, NULL, 1, 1000, '/reset/1', 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(94, 'Social Media Authentication', 117, 23, 3, 500, NULL, 1);
INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES(95, 'Print Employee Timesheet', 118, 61, 3, 200, '?reportId=6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module`
--

DROP TABLE IF EXISTS `ohrm_module`;
CREATE TABLE `ohrm_module` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_module`
--

TRUNCATE TABLE `ohrm_module`;
--
-- Dumping data for table `ohrm_module`
--

INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(1, 'core', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(2, 'admin', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(3, 'pim', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(4, 'leave', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(5, 'time', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(6, 'attendance', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(7, 'recruitment', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(8, 'recruitmentApply', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(9, 'communication', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(10, 'dashboard', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(11, 'performance', 1);
INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES(12, 'directory', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module_default_page`
--

DROP TABLE IF EXISTS `ohrm_module_default_page`;
CREATE TABLE `ohrm_module_default_page` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_module_default_page`
--

TRUNCATE TABLE `ohrm_module_default_page`;
--
-- Dumping data for table `ohrm_module_default_page`
--

INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(1, 2, 1, 'admin/viewSystemUsers', NULL, 20);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(2, 3, 1, 'pim/viewEmployeeList', NULL, 20);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(3, 3, 3, 'pim/viewEmployeeList', NULL, 10);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(4, 3, 2, 'pim/viewMyDetails', NULL, 0);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(5, 4, 1, 'leave/viewLeaveList/reset/1', NULL, 20);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(6, 4, 3, 'leave/viewLeaveList/reset/1', NULL, 10);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(7, 4, 2, 'leave/viewMyLeaveList', NULL, 0);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(8, 4, 1, 'leave/defineLeavePeriod', 'LeavePeriodDefinedHomePageEnabler', 100);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(9, 4, 2, 'leave/showLeavePeriodNotDefinedWarning', 'LeavePeriodDefinedHomePageEnabler', 90);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(10, 5, 1, 'time/viewEmployeeTimesheet', NULL, 20);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(11, 5, 2, 'time/viewMyTimesheet', NULL, 0);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(12, 5, 1, 'time/defineTimesheetPeriod', 'TimesheetPeriodDefinedHomePageEnabler', 100);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(13, 5, 2, 'time/timesheetPeriodNotDefined', 'TimesheetPeriodDefinedHomePageEnabler', 100);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(14, 7, 1, 'recruitment/viewCandidates', NULL, 20);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(15, 7, 5, 'recruitment/viewCandidates', NULL, 10);
INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES(16, 7, 6, 'recruitment/viewCandidates', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_nationality`
--

DROP TABLE IF EXISTS `ohrm_nationality`;
CREATE TABLE `ohrm_nationality` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_nationality`
--

TRUNCATE TABLE `ohrm_nationality`;
--
-- Dumping data for table `ohrm_nationality`
--

INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(1, 'Afghan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(2, 'Albanian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(3, 'Algerian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(4, 'American');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(5, 'Andorran');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(6, 'Angolan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(7, 'Antiguans');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(8, 'Argentinean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(9, 'Armenian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(10, 'Australian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(11, 'Austrian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(12, 'Azerbaijani');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(13, 'Bahamian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(14, 'Bahraini');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(15, 'Bangladeshi');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(16, 'Barbadian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(17, 'Barbudans');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(18, 'Batswana');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(19, 'Belarusian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(20, 'Belgian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(21, 'Belizean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(22, 'Beninese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(23, 'Bhutanese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(24, 'Bolivian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(25, 'Bosnian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(26, 'Brazilian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(27, 'British');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(28, 'Bruneian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(29, 'Bulgarian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(30, 'Burkinabe');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(31, 'Burmese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(32, 'Burundian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(33, 'Cambodian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(34, 'Cameroonian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(35, 'Canadian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(36, 'Cape Verdean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(37, 'Central African');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(38, 'Chadian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(39, 'Chilean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(40, 'Chinese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(41, 'Colombian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(42, 'Comoran');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(43, 'Congolese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(44, 'Costa Rican');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(45, 'Croatian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(46, 'Cuban');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(47, 'Cypriot');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(48, 'Czech');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(49, 'Danish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(50, 'Djibouti');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(51, 'Dominican');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(52, 'Dutch');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(53, 'East Timorese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(54, 'Ecuadorean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(55, 'Egyptian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(56, 'Emirian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(57, 'Equatorial Guinean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(58, 'Eritrean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(59, 'Estonian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(60, 'Ethiopian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(61, 'Fijian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(62, 'Filipino');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(63, 'Finnish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(64, 'French');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(65, 'Gabonese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(66, 'Gambian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(67, 'Georgian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(68, 'German');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(69, 'Ghanaian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(70, 'Greek');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(71, 'Grenadian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(72, 'Guatemalan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(73, 'Guinea-Bissauan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(74, 'Guinean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(75, 'Guyanese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(76, 'Haitian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(77, 'Herzegovinian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(78, 'Honduran');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(79, 'Hungarian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(80, 'I-Kiribati');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(81, 'Icelander');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(82, 'Indian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(83, 'Indonesian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(84, 'Iranian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(85, 'Iraqi');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(86, 'Irish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(87, 'Israeli');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(88, 'Italian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(89, 'Ivorian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(90, 'Jamaican');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(91, 'Japanese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(92, 'Jordanian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(93, 'Kazakhstani');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(94, 'Kenyan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(95, 'Kittian and Nevisian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(96, 'Kuwaiti');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(97, 'Kyrgyz');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(98, 'Laotian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(99, 'Latvian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(100, 'Lebanese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(101, 'Liberian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(102, 'Libyan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(103, 'Liechtensteiner');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(104, 'Lithuanian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(105, 'Luxembourger');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(106, 'Macedonian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(107, 'Malagasy');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(108, 'Malawian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(109, 'Malaysian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(110, 'Maldivan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(111, 'Malian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(112, 'Maltese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(113, 'Marshallese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(114, 'Mauritanian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(115, 'Mauritian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(116, 'Mexican');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(117, 'Micronesian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(118, 'Moldovan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(119, 'Monacan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(120, 'Mongolian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(121, 'Moroccan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(122, 'Mosotho');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(123, 'Motswana');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(124, 'Mozambican');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(125, 'Namibian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(126, 'Nauruan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(127, 'Nepalese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(128, 'New Zealander');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(129, 'Nicaraguan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(130, 'Nigerian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(131, 'Nigerien');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(132, 'North Korean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(133, 'Northern Irish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(134, 'Norwegian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(135, 'Omani');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(136, 'Pakistani');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(137, 'Palauan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(138, 'Panamanian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(139, 'Papua New Guinean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(140, 'Paraguayan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(141, 'Peruvian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(142, 'Polish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(143, 'Portuguese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(144, 'Qatari');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(145, 'Romanian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(146, 'Russian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(147, 'Rwandan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(148, 'Saint Lucian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(149, 'Salvadoran');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(150, 'Samoan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(151, 'San Marinese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(152, 'Sao Tomean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(153, 'Saudi');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(154, 'Scottish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(155, 'Senegalese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(156, 'Serbian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(157, 'Seychellois');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(158, 'Sierra Leonean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(159, 'Singaporean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(160, 'Slovakian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(161, 'Slovenian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(162, 'Solomon Islander');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(163, 'Somali');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(164, 'South African');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(165, 'South Korean');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(166, 'Spanish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(167, 'Sri Lankan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(168, 'Sudanese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(169, 'Surinamer');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(170, 'Swazi');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(171, 'Swedish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(172, 'Swiss');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(173, 'Syrian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(174, 'Taiwanese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(175, 'Tajik');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(176, 'Tanzanian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(177, 'Thai');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(178, 'Togolese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(179, 'Tongan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(180, 'Trinidadian or Tobagonian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(181, 'Tunisian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(182, 'Turkish');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(183, 'Tuvaluan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(184, 'Ugandan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(185, 'Ukrainian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(186, 'Uruguayan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(187, 'Uzbekistani');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(188, 'Venezuelan');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(189, 'Vietnamese');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(190, 'Welsh');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(191, 'Yemenite');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(192, 'Zambian');
INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES(193, 'Zimbabwean');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_access_token`
--

DROP TABLE IF EXISTS `ohrm_oauth_access_token`;
CREATE TABLE `ohrm_oauth_access_token` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_oauth_access_token`
--

TRUNCATE TABLE `ohrm_oauth_access_token`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_authorization_code`
--

DROP TABLE IF EXISTS `ohrm_oauth_authorization_code`;
CREATE TABLE `ohrm_oauth_authorization_code` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_oauth_authorization_code`
--

TRUNCATE TABLE `ohrm_oauth_authorization_code`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_client`
--

DROP TABLE IF EXISTS `ohrm_oauth_client`;
CREATE TABLE `ohrm_oauth_client` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_oauth_client`
--

TRUNCATE TABLE `ohrm_oauth_client`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_refresh_token`
--

DROP TABLE IF EXISTS `ohrm_oauth_refresh_token`;
CREATE TABLE `ohrm_oauth_refresh_token` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_oauth_refresh_token`
--

TRUNCATE TABLE `ohrm_oauth_refresh_token`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_user`
--

DROP TABLE IF EXISTS `ohrm_oauth_user`;
CREATE TABLE `ohrm_oauth_user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_oauth_user`
--

TRUNCATE TABLE `ohrm_oauth_user`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_provider`
--

DROP TABLE IF EXISTS `ohrm_openid_provider`;
CREATE TABLE `ohrm_openid_provider` (
  `id` int(10) NOT NULL,
  `provider_name` varchar(40) DEFAULT NULL,
  `provider_url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_openid_provider`
--

TRUNCATE TABLE `ohrm_openid_provider`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_user_identity`
--

DROP TABLE IF EXISTS `ohrm_openid_user_identity`;
CREATE TABLE `ohrm_openid_user_identity` (
  `user_id` int(10) DEFAULT NULL,
  `provider_id` int(10) DEFAULT NULL,
  `user_identity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_openid_user_identity`
--

TRUNCATE TABLE `ohrm_openid_user_identity`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_operational_country`
--

DROP TABLE IF EXISTS `ohrm_operational_country`;
CREATE TABLE `ohrm_operational_country` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_operational_country`
--

TRUNCATE TABLE `ohrm_operational_country`;
--
-- Dumping data for table `ohrm_operational_country`
--

INSERT INTO `ohrm_operational_country` (`id`, `country_code`) VALUES(1, 'SG');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_organization_gen_info`
--

DROP TABLE IF EXISTS `ohrm_organization_gen_info`;
CREATE TABLE `ohrm_organization_gen_info` (
  `id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tax_id` varchar(30) DEFAULT NULL,
  `registration_number` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip_code` varchar(30) DEFAULT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_organization_gen_info`
--

TRUNCATE TABLE `ohrm_organization_gen_info`;
--
-- Dumping data for table `ohrm_organization_gen_info`
--

INSERT INTO `ohrm_organization_gen_info` (`id`, `name`, `tax_id`, `registration_number`, `phone`, `fax`, `email`, `country`, `province`, `city`, `zip_code`, `street1`, `street2`, `note`) VALUES(1, 'Upskills Pte Ltd', '', '', '', '', '', 'SG', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade`
--

DROP TABLE IF EXISTS `ohrm_pay_grade`;
CREATE TABLE `ohrm_pay_grade` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_pay_grade`
--

TRUNCATE TABLE `ohrm_pay_grade`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade_currency`
--

DROP TABLE IF EXISTS `ohrm_pay_grade_currency`;
CREATE TABLE `ohrm_pay_grade_currency` (
  `pay_grade_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `min_salary` double DEFAULT NULL,
  `max_salary` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_pay_grade_currency`
--

TRUNCATE TABLE `ohrm_pay_grade_currency`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_objective`
--

DROP TABLE IF EXISTS `ohrm_performance_objective`;
CREATE TABLE `ohrm_performance_objective` (
  `id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `objective_name` varchar(200) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `description` varchar(3000) NOT NULL,
  `target_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_performance_objective`
--

TRUNCATE TABLE `ohrm_performance_objective`;
--
-- Dumping data for table `ohrm_performance_objective`
--

INSERT INTO `ohrm_performance_objective` (`id`, `emp_number`, `objective_name`, `added_date`, `added_by`, `status`, `modified_date`, `description`, `target_date`) VALUES(31, 73, 'Timesheet management', '2016-08-30 08:52:42', NULL, 1, NULL, 'This is just a test', '2016-08-31');
INSERT INTO `ohrm_performance_objective` (`id`, `emp_number`, `objective_name`, `added_date`, `added_by`, `status`, `modified_date`, `description`, `target_date`) VALUES(32, 73, 'Performance Review', '2016-08-30 08:53:59', NULL, 1, NULL, 'This is a second test', '2016-08-31');
INSERT INTO `ohrm_performance_objective` (`id`, `emp_number`, `objective_name`, `added_date`, `added_by`, `status`, `modified_date`, `description`, `target_date`) VALUES(33, 73, 'Doc', '2016-08-30 09:35:22', NULL, 1, NULL, 'Ceci est un test pour voir si la boite est assez grande ou ne grandit pas toute seule\r\nCeci est un test pour voir si la boite est assez grande ou ne grandit pas toute seule\r\nCeci est un test pour voir si la boite est assez grande ou ne grandit pas toute seule', '2016-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_objective_log`
--

DROP TABLE IF EXISTS `ohrm_performance_objective_log`;
CREATE TABLE `ohrm_performance_objective_log` (
  `id` int(11) NOT NULL,
  `rating` decimal(18,2) DEFAULT NULL,
  `performance_objective_id` int(11) DEFAULT NULL,
  `log` varchar(150) DEFAULT NULL,
  `comment` varchar(3000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `reviewer_id` int(7) DEFAULT NULL,
  `achievement` varchar(45) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `review_id` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_performance_objective_log`
--

TRUNCATE TABLE `ohrm_performance_objective_log`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_objective_reviewer`
--

DROP TABLE IF EXISTS `ohrm_performance_objective_reviewer`;
CREATE TABLE `ohrm_performance_objective_reviewer` (
  `id` int(11) NOT NULL,
  `performance_objective_id` int(11) NOT NULL,
  `reviewer_id` int(7) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `final_rate` decimal(18,2) DEFAULT NULL,
  `final_comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_performance_objective_reviewer`
--

TRUNCATE TABLE `ohrm_performance_objective_reviewer`;
--
-- Dumping data for table `ohrm_performance_objective_reviewer`
--

INSERT INTO `ohrm_performance_objective_reviewer` (`id`, `performance_objective_id`, `reviewer_id`, `added_date`, `status`, `final_rate`, `final_comment`) VALUES(42, 31, 73, '2016-08-30 08:52:42', NULL, '1.00', 'Bye Bye                                                                                ');
INSERT INTO `ohrm_performance_objective_reviewer` (`id`, `performance_objective_id`, `reviewer_id`, `added_date`, `status`, `final_rate`, `final_comment`) VALUES(43, 31, 2, '2016-08-30 08:52:42', NULL, '5.00', 'Youhou Youhou                                                                                                                                                                                                                                                                                                                                                                 ');
INSERT INTO `ohrm_performance_objective_reviewer` (`id`, `performance_objective_id`, `reviewer_id`, `added_date`, `status`, `final_rate`, `final_comment`) VALUES(44, 32, 73, '2016-08-30 08:53:59', NULL, '2.00', '  Bye                                                                                                                      ');
INSERT INTO `ohrm_performance_objective_reviewer` (`id`, `performance_objective_id`, `reviewer_id`, `added_date`, `status`, `final_rate`, `final_comment`) VALUES(45, 32, 2, '2016-08-30 08:53:59', NULL, '4.00', 'Youhou                                                                                                                                                                                                                                                                                                                                                                                                           ');
INSERT INTO `ohrm_performance_objective_reviewer` (`id`, `performance_objective_id`, `reviewer_id`, `added_date`, `status`, `final_rate`, `final_comment`) VALUES(46, 33, 73, '2016-08-30 09:35:22', NULL, '3.00', 'B                                        ');
INSERT INTO `ohrm_performance_objective_reviewer` (`id`, `performance_objective_id`, `reviewer_id`, `added_date`, `status`, `final_rate`, `final_comment`) VALUES(47, 33, 2, '2016-08-30 09:35:22', NULL, '3.00', 'You                                                                                                                       ');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_review`
--

DROP TABLE IF EXISTS `ohrm_performance_review`;
CREATE TABLE `ohrm_performance_review` (
  `id` int(7) NOT NULL,
  `status_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `work_period_start` date DEFAULT NULL,
  `work_period_end` date DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `department_id` int(7) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `final_comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `final_rate` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_performance_review`
--

TRUNCATE TABLE `ohrm_performance_review`;
--
-- Dumping data for table `ohrm_performance_review`
--

INSERT INTO `ohrm_performance_review` (`id`, `status_id`, `employee_number`, `work_period_start`, `work_period_end`, `job_title_code`, `department_id`, `due_date`, `completed_date`, `activated_date`, `final_comment`, `final_rate`) VALUES(9, 3, 73, '2016-08-01', '2016-08-31', 4, NULL, '2016-08-31', NULL, '2016-08-30 16:54:59', NULL, NULL);
INSERT INTO `ohrm_performance_review` (`id`, `status_id`, `employee_number`, `work_period_start`, `work_period_end`, `job_title_code`, `department_id`, `due_date`, `completed_date`, `activated_date`, `final_comment`, `final_rate`) VALUES(10, 4, 73, '2016-09-01', '2016-09-01', 4, NULL, '2016-09-30', '2016-08-23', '2016-08-30 17:24:33', 'It''s Okay', '4.00');
INSERT INTO `ohrm_performance_review` (`id`, `status_id`, `employee_number`, `work_period_start`, `work_period_end`, `job_title_code`, `department_id`, `due_date`, `completed_date`, `activated_date`, `final_comment`, `final_rate`) VALUES(11, 4, 73, '2016-08-01', '2016-12-31', 4, NULL, '2017-01-02', '2016-08-31', '2016-08-30 17:41:19', 'It''s not so bad', '4.00');
INSERT INTO `ohrm_performance_review` (`id`, `status_id`, `employee_number`, `work_period_start`, `work_period_end`, `job_title_code`, `department_id`, `due_date`, `completed_date`, `activated_date`, `final_comment`, `final_rate`) VALUES(12, 3, 73, '2016-01-01', '2016-12-31', 4, NULL, '2016-12-31', NULL, '2016-08-31 14:16:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_plugin`
--

DROP TABLE IF EXISTS `ohrm_plugin`;
CREATE TABLE `ohrm_plugin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_plugin`
--

TRUNCATE TABLE `ohrm_plugin`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project`
--

DROP TABLE IF EXISTS `ohrm_project`;
CREATE TABLE `ohrm_project` (
  `project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `customer_mail` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_project`
--

TRUNCATE TABLE `ohrm_project`;
--
-- Dumping data for table `ohrm_project`
--

INSERT INTO `ohrm_project` (`project_id`, `customer_id`, `name`, `description`, `is_deleted`, `customer_mail`) VALUES(1, 1, 'Mx.3 Migration', '', 0, 'dbs@upskills.com');
INSERT INTO `ohrm_project` (`project_id`, `customer_id`, `name`, `description`, `is_deleted`, `customer_mail`) VALUES(2, 3, 'Generic Activities', '', 0, 'upskills@upskills.com');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_activity`
--

DROP TABLE IF EXISTS `ohrm_project_activity`;
CREATE TABLE `ohrm_project_activity` (
  `activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(110) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_project_activity`
--

TRUNCATE TABLE `ohrm_project_activity`;
--
-- Dumping data for table `ohrm_project_activity`
--

INSERT INTO `ohrm_project_activity` (`activity_id`, `project_id`, `name`, `is_deleted`) VALUES(1, 1, 'FO Stream', 0);
INSERT INTO `ohrm_project_activity` (`activity_id`, `project_id`, `name`, `is_deleted`) VALUES(2, 1, 'MLC Stream', 0);
INSERT INTO `ohrm_project_activity` (`activity_id`, `project_id`, `name`, `is_deleted`) VALUES(3, 1, 'Integration Stream', 0);
INSERT INTO `ohrm_project_activity` (`activity_id`, `project_id`, `name`, `is_deleted`) VALUES(4, 1, 'VAR / MRA Stream', 0);
INSERT INTO `ohrm_project_activity` (`activity_id`, `project_id`, `name`, `is_deleted`) VALUES(5, 2, 'Other Leave', 0);
INSERT INTO `ohrm_project_activity` (`activity_id`, `project_id`, `name`, `is_deleted`) VALUES(6, 2, 'Public Holiday', 0);
INSERT INTO `ohrm_project_activity` (`activity_id`, `project_id`, `name`, `is_deleted`) VALUES(7, 2, 'Medical Leave', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_admin`
--

DROP TABLE IF EXISTS `ohrm_project_admin`;
CREATE TABLE `ohrm_project_admin` (
  `project_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_project_admin`
--

TRUNCATE TABLE `ohrm_project_admin`;
--
-- Dumping data for table `ohrm_project_admin`
--

INSERT INTO `ohrm_project_admin` (`project_id`, `emp_number`) VALUES(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report`
--

DROP TABLE IF EXISTS `ohrm_report`;
CREATE TABLE `ohrm_report` (
  `report_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `use_filter_field` tinyint(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_report`
--

TRUNCATE TABLE `ohrm_report`;
--
-- Dumping data for table `ohrm_report`
--

INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES(1, 'Project Report', 1, 1, NULL);
INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES(2, 'Employee Report', 1, 1, NULL);
INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES(3, 'Project Activity Details', 1, 1, NULL);
INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES(4, 'Attendance Total Summary Report', 2, 0, NULL);
INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES(5, 'PIM Sample Report', 3, 1, 'PIM_DEFINED');
INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES(6, 'Print Employee Report', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report_group`
--

DROP TABLE IF EXISTS `ohrm_report_group`;
CREATE TABLE `ohrm_report_group` (
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `core_sql` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_report_group`
--

TRUNCATE TABLE `ohrm_report_group`;
--
-- Dumping data for table `ohrm_report_group`
--

INSERT INTO `ohrm_report_group` (`report_group_id`, `name`, `core_sql`) VALUES(1, 'timesheet', 'SELECT selectCondition FROM ohrm_project_activity LEFT JOIN (SELECT * FROM ohrm_timesheet_item WHERE whereCondition1) AS ohrm_timesheet_item  ON (ohrm_timesheet_item.activity_id = ohrm_project_activity.activity_id) LEFT JOIN ohrm_project ON (ohrm_project.project_id = ohrm_project_activity.project_id) LEFT JOIN hs_hr_employee ON (hs_hr_employee.emp_number = ohrm_timesheet_item.employee_id) LEFT JOIN ohrm_timesheet ON (ohrm_timesheet.timesheet_id = ohrm_timesheet_item.timesheet_id) LEFT JOIN ohrm_customer ON (ohrm_customer.customer_id = ohrm_project.customer_id) WHERE whereCondition2 groupByClause ORDER BY ohrm_customer.name, ohrm_project.name, ohrm_project_activity.name, hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname');
INSERT INTO `ohrm_report_group` (`report_group_id`, `name`, `core_sql`) VALUES(2, 'attendance', 'SELECT selectCondition FROM hs_hr_employee LEFT JOIN (SELECT * FROM ohrm_attendance_record WHERE ( ( ohrm_attendance_record.punch_in_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) AND ( ohrm_attendance_record.punch_out_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) ) ) AS ohrm_attendance_record ON (hs_hr_employee.emp_number = ohrm_attendance_record.employee_id) WHERE hs_hr_employee.emp_number = #@employeeId@,@hs_hr_employee.emp_number AND (hs_hr_employee.termination_id is null) @# AND (hs_hr_employee.job_title_code = #@"jobTitle")@,@hs_hr_employee.job_title_code OR hs_hr_employee.job_title_code is null)@# AND (hs_hr_employee.work_station IN (#@subUnit)@,@SELECT id FROM ohrm_subunit) OR hs_hr_employee.work_station is null@#) AND (hs_hr_employee.emp_status = #@"employeeStatus")@,@hs_hr_employee.emp_status OR hs_hr_employee.emp_status is null)@# groupByClause ORDER BY hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname');
INSERT INTO `ohrm_report_group` (`report_group_id`, `name`, `core_sql`) VALUES(3, 'pim', 'SELECT selectCondition FROM hs_hr_employee \n                    LEFT JOIN hs_hr_emp_emergency_contacts ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_emergency_contacts.emp_number) \n                    LEFT JOIN ohrm_subunit ON \n                        (hs_hr_employee.work_station = ohrm_subunit.id) \n                    LEFT JOIN ohrm_employment_status ON \n                        (hs_hr_employee.emp_status = ohrm_employment_status.id) \n                    LEFT JOIN ohrm_job_title ON\n                        (hs_hr_employee.job_title_code = ohrm_job_title.id)\n                    LEFT JOIN ohrm_job_category ON \n                        (hs_hr_employee.eeo_cat_code = ohrm_job_category.id) \n                    LEFT JOIN ohrm_nationality ON\n                        (hs_hr_employee.nation_code = ohrm_nationality.id)\n                    LEFT JOIN hs_hr_emp_dependents ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_dependents.emp_number)\n                    LEFT JOIN hs_hr_emp_locations AS emp_location ON\n                        (hs_hr_employee.emp_number = emp_location.emp_number)\n                    LEFT JOIN ohrm_location ON\n                        (emp_location.location_id = ohrm_location.id)\n                    LEFT JOIN hs_hr_emp_contract_extend ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_contract_extend.emp_number) \n                    LEFT JOIN hs_hr_emp_basicsalary ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                    LEFT JOIN ohrm_pay_grade ON \n                        (hs_hr_emp_basicsalary.sal_grd_code = ohrm_pay_grade.id) \n                    LEFT JOIN hs_hr_currency_type ON \n                        (hs_hr_emp_basicsalary.currency_id = hs_hr_currency_type.currency_id) \n                    LEFT JOIN hs_hr_payperiod ON \n                        (hs_hr_emp_basicsalary.payperiod_code = hs_hr_payperiod.payperiod_code) \n                    LEFT JOIN hs_hr_emp_passport ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_passport.emp_number) \n                    LEFT JOIN hs_hr_emp_reportto AS subordinate_list ON \n                        (hs_hr_employee.emp_number = subordinate_list.erep_sup_emp_number) \n                    LEFT JOIN hs_hr_employee AS subordinate ON\n                        (subordinate.emp_number = subordinate_list.erep_sub_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS subordinate_reporting_method ON \n                        (subordinate_list.erep_reporting_mode = subordinate_reporting_method.reporting_method_id) \n                    LEFT JOIN hs_hr_emp_work_experience ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_work_experience.emp_number) \n                    LEFT JOIN ohrm_emp_education ON \n                        (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                    LEFT JOIN ohrm_education ON \n                        (ohrm_emp_education.education_id = ohrm_education.id) \n                    LEFT JOIN hs_hr_emp_skill ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                    LEFT JOIN ohrm_skill ON \n                        (hs_hr_emp_skill.skill_id = ohrm_skill.id) \n                    LEFT JOIN hs_hr_emp_language ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    LEFT JOIN ohrm_language ON \n                        (hs_hr_emp_language.lang_id = ohrm_language.id) \n                    LEFT JOIN ohrm_emp_license ON \n                        (hs_hr_employee.emp_number = ohrm_emp_license.emp_number) \n                    LEFT JOIN ohrm_license ON \n                        (ohrm_emp_license.license_id = ohrm_license.id) \n                    LEFT JOIN hs_hr_emp_member_detail ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_member_detail.emp_number) \n                    LEFT JOIN ohrm_membership ON\n                        (hs_hr_emp_member_detail.membship_code = ohrm_membership.id)\n                    LEFT JOIN hs_hr_country ON \n                        (hs_hr_employee.coun_code = hs_hr_country.cou_code) \n                    LEFT JOIN hs_hr_emp_directdebit ON \n                        (hs_hr_emp_basicsalary.id = hs_hr_emp_directdebit.salary_id) \n                    LEFT JOIN hs_hr_emp_reportto AS supervisor_list ON \n                        (hs_hr_employee.emp_number = supervisor_list.erep_sub_emp_number) \n                    LEFT JOIN hs_hr_employee AS supervisor ON\n                        (supervisor.emp_number = supervisor_list.erep_sup_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS supervisor_reporting_method ON \n                        (supervisor_list.erep_reporting_mode = supervisor_reporting_method.reporting_method_id) \n                    LEFT JOIN ohrm_emp_termination ON\n                        (hs_hr_employee.termination_id = ohrm_emp_termination.id)\n                    LEFT JOIN ohrm_emp_termination_reason ON\n                        (ohrm_emp_termination.reason_id = ohrm_emp_termination_reason.id)\n                WHERE hs_hr_employee.emp_number in (\n                    SELECT hs_hr_employee.emp_number FROM hs_hr_employee\n                        LEFT JOIN hs_hr_emp_basicsalary ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                        LEFT JOIN ohrm_emp_education ON \n                            (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                        LEFT JOIN hs_hr_emp_skill ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                        LEFT JOIN hs_hr_emp_language ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    WHERE whereCondition1\n                )\n                GROUP BY \n                     hs_hr_employee.emp_number,\n                     hs_hr_employee.emp_lastname,\n                     hs_hr_employee.emp_firstname,\n                     hs_hr_employee.emp_middle_name,\n                     hs_hr_employee.emp_birthday,\n                     ohrm_nationality.name,\n                     hs_hr_employee.emp_gender,\n                     hs_hr_employee.emp_marital_status,\n                     hs_hr_employee.emp_dri_lice_num,\n                     hs_hr_employee.emp_dri_lice_exp_date,\n                     hs_hr_employee.emp_street1,\n                     hs_hr_employee.emp_street2,\n                     hs_hr_employee.city_code,\n                     hs_hr_employee.provin_code,\n                     hs_hr_employee.emp_zipcode,\n                     hs_hr_country.cou_code,\n                     hs_hr_employee.emp_hm_telephone,\n                     hs_hr_employee.emp_mobile,\n                     hs_hr_employee.emp_work_telephone,\n                     hs_hr_employee.emp_work_email,\n                     hs_hr_employee.emp_oth_email\n\nORDER BY hs_hr_employee.emp_lastname\n');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer`
--

DROP TABLE IF EXISTS `ohrm_reviewer`;
CREATE TABLE `ohrm_reviewer` (
  `id` int(7) NOT NULL,
  `review_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `status` int(7) DEFAULT NULL,
  `reviewer_group_id` int(7) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `comment` text,
  `objectives` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_reviewer`
--

TRUNCATE TABLE `ohrm_reviewer`;
--
-- Dumping data for table `ohrm_reviewer`
--

INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(17, 9, 73, 3, 2, NULL, NULL, '');
INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(18, 9, 2, 3, 1, NULL, 'General One', 'General Two');
INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(19, 10, 73, 3, 2, '2016-08-30 17:31:46', NULL, '');
INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(20, 10, 2, 3, 1, '2016-08-30 17:31:46', 'General', 'Comment');
INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(21, 11, 73, 3, 2, '2016-08-31 09:44:26', NULL, '');
INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(22, 11, 2, 3, 1, '2016-08-31 09:44:26', 'General Comment Skills', 'General Comment Objectives');
INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(23, 12, 73, 2, 2, NULL, NULL, '');
INSERT INTO `ohrm_reviewer` (`id`, `review_id`, `employee_number`, `status`, `reviewer_group_id`, `completed_date`, `comment`, `objectives`) VALUES(24, 12, 2, 2, 1, NULL, 'trtr', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_group`
--

DROP TABLE IF EXISTS `ohrm_reviewer_group`;
CREATE TABLE `ohrm_reviewer_group` (
  `id` int(7) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `piority` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_reviewer_group`
--

TRUNCATE TABLE `ohrm_reviewer_group`;
--
-- Dumping data for table `ohrm_reviewer_group`
--

INSERT INTO `ohrm_reviewer_group` (`id`, `name`, `piority`) VALUES(1, 'Supervisor', 1);
INSERT INTO `ohrm_reviewer_group` (`id`, `name`, `piority`) VALUES(2, 'Employee', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_rating`
--

DROP TABLE IF EXISTS `ohrm_reviewer_rating`;
CREATE TABLE `ohrm_reviewer_rating` (
  `id` int(11) NOT NULL,
  `rating` decimal(18,2) DEFAULT NULL,
  `kpi_id` int(7) DEFAULT NULL,
  `review_id` int(7) DEFAULT NULL,
  `reviewer_id` int(7) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_reviewer_rating`
--

TRUNCATE TABLE `ohrm_reviewer_rating`;
--
-- Dumping data for table `ohrm_reviewer_rating`
--

INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(63, NULL, 8, 9, 17, NULL);
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(64, NULL, 9, 9, 17, NULL);
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(65, NULL, 10, 9, 17, NULL);
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(66, '3.00', 8, 9, 18, '                   First                                         ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(67, '3.00', 9, 9, 18, '                                           Second                 ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(68, '3.00', 10, 9, 18, '                        Third                                    ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(69, '5.00', 8, 10, 19, 'Hello');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(70, '4.00', 9, 10, 19, 'Hello Hello');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(71, '3.00', 10, 10, 19, 'Hello Hello Hello');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(72, '1.00', 8, 10, 20, 'Yopla                                                                                                      ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(73, '2.00', 9, 10, 20, 'Yopla Yopla                                                            ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(74, '3.00', 10, 10, 20, 'Yopla Yopla Yopla                                                                   ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(75, '2.00', 8, 11, 21, 'Comment by Employee 1');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(76, '3.00', 9, 11, 21, 'Comment by Employee 2');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(77, '4.00', 10, 11, 21, 'Comment by Employee 3');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(78, '1.00', 8, 11, 22, 'Comment by supervisor 1                                                            ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(79, '2.00', 9, 11, 22, 'Comment by supervisor 2                                                            ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(80, '3.00', 10, 11, 22, 'Comment by supervisor 3                                                                  ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(81, NULL, 8, 12, 23, NULL);
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(82, NULL, 9, 12, 23, NULL);
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(83, NULL, 10, 12, 23, NULL);
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(84, '4.00', 8, 12, 24, '                                                                                                                        ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(85, '4.00', 9, 12, 24, '                                                                                                                        ');
INSERT INTO `ohrm_reviewer_rating` (`id`, `rating`, `kpi_id`, `review_id`, `reviewer_id`, `comment`) VALUES(86, '4.00', 10, 12, 24, '                                                                                                                        ');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_role_user_selection_rule`
--

DROP TABLE IF EXISTS `ohrm_role_user_selection_rule`;
CREATE TABLE `ohrm_role_user_selection_rule` (
  `user_role_id` int(10) NOT NULL,
  `selection_rule_id` int(10) NOT NULL,
  `configurable_params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_role_user_selection_rule`
--

TRUNCATE TABLE `ohrm_role_user_selection_rule`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_screen`
--

DROP TABLE IF EXISTS `ohrm_screen`;
CREATE TABLE `ohrm_screen` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `module_id` int(11) NOT NULL,
  `action_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_screen`
--

TRUNCATE TABLE `ohrm_screen`;
--
-- Dumping data for table `ohrm_screen`
--

INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(1, 'User List', 2, 'viewSystemUsers');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(2, 'Add/Edit System User', 2, 'saveSystemUser');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(3, 'Delete System Users', 2, 'deleteSystemUsers');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(4, 'Add Employee', 3, 'addEmployee');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(5, 'View Employee List', 3, 'viewEmployeeList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(6, 'Delete Employees', 3, 'deleteEmployees');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(7, 'Leave Type List', 4, 'leaveTypeList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(8, 'Define Leave Type', 4, 'defineLeaveType');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(9, 'Undelete Leave Type', 4, 'undeleteLeaveType');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(10, 'Delete Leave Type', 4, 'deleteLeaveType');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(11, 'View Holiday List', 4, 'viewHolidayList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(12, 'Define Holiday', 4, 'defineHoliday');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(13, 'Delete Holiday', 4, 'deleteHoliday');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(14, 'Define WorkWeek', 4, 'defineWorkWeek');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(16, 'Leave List', 4, 'viewLeaveList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(17, 'Assign Leave', 4, 'assignLeave');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(18, 'View Leave Summary', 4, 'viewLeaveSummary');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(19, 'Save Leave Entitlements', 4, 'saveLeaveEntitlements');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(20, 'General Information', 2, 'viewOrganizationGeneralInformation');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(21, 'Location List', 2, 'viewLocations');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(22, 'View Company Structure', 2, 'viewCompanyStructure');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(23, 'Job Title List', 2, 'viewJobTitleList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(24, 'Pay Grade List', 2, 'viewPayGrades');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(25, 'Employment Status List', 2, 'employmentStatus');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(26, 'Job Category List', 2, 'jobCategory');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(27, 'Work Shift List', 2, 'workShift');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(28, 'Skill List', 2, 'viewSkills');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(29, 'Education List', 2, 'viewEducation');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(30, 'License List', 2, 'viewLicenses');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(31, 'Language List', 2, 'viewLanguages');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(32, 'Membership List', 2, 'membership');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(33, 'Nationality List', 2, 'nationality');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(34, 'Add/Edit Mail Configuration', 2, 'listMailConfiguration');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(35, 'Notification List', 2, 'viewEmailNotification');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(36, 'Customer List', 2, 'viewCustomers');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(37, 'Project List', 2, 'viewProjects');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(38, 'Localization', 2, 'localization');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(39, 'Module Configuration', 2, 'viewModules');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(40, 'Configure PIM', 3, 'configurePim');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(41, 'Custom Field List', 3, 'listCustomFields');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(42, 'Data Import', 2, 'pimCsvImport');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(43, 'Reporting Method List', 3, 'viewReportingMethods');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(44, 'Termination Reason List', 3, 'viewTerminationReasons');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(45, 'PIM Reports List', 1, 'viewDefinedPredefinedReports');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(46, 'View MyInfo', 3, 'viewMyDetails');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(47, 'Define Leave Period', 4, 'defineLeavePeriod');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(48, 'View My Leave List', 4, 'viewMyLeaveList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(49, 'Apply Leave', 4, 'applyLeave');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(50, 'Define Timesheet Start Date', 5, 'defineTimesheetPeriod');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(51, 'View My Timesheet', 5, 'viewMyTimesheet');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(52, 'View Employee Timesheet', 5, 'viewEmployeeTimesheet');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(53, 'View My Attendance', 6, 'viewMyAttendanceRecord');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(54, 'Punch In/Out', 6, 'punchIn');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(55, 'View Employee Attendance', 6, 'viewAttendanceRecord');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(56, 'Attendance Configuration', 6, 'configure');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(57, 'View Project Report Criteria', 5, 'displayProjectReportCriteria');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(58, 'View Employee Report Criteria', 5, 'displayEmployeeReportCriteria');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(59, 'View Attendance Report Criteria', 5, 'displayAttendanceSummaryReportCriteria');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(60, 'Candidate List', 7, 'viewCandidates');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(61, 'Vacancy List', 7, 'viewJobVacancy');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(67, 'View Time Module', 5, 'viewTimeModule');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(68, 'View Leave Module', 4, 'viewLeaveModule');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(69, 'Leave Entitlements', 4, 'viewLeaveEntitlements');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(70, 'My Leave Entitlements', 4, 'viewMyLeaveEntitlements');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(71, 'Delete Leave Entitlements', 4, 'deleteLeaveEntitlements');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(72, 'Add Leave Entitlement', 4, 'addLeaveEntitlement');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(73, 'Edit Leave Entitlement', 4, 'editLeaveEntitlement');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(74, 'View Admin Module', 2, 'viewAdminModule');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(75, 'View PIM Module', 3, 'viewPimModule');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(76, 'View Recruitment Module', 7, 'viewRecruitmentModule');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(78, 'Leave Balance Report', 4, 'viewLeaveBalanceReport');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(79, 'My Leave Balance Report', 4, 'viewMyLeaveBalanceReport');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(80, 'Save Job Title', 2, 'saveJobTitle');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(81, 'Delete Job Title', 2, 'deleteJobTitle');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(82, 'Save Pay Grade', 2, 'payGrade');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(83, 'Delete Pay Grade', 2, 'deletePayGrades');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(84, 'Save Pay Grade Currency', 2, 'savePayGradeCurrency');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(85, 'Delete Pay Grade Currency', 2, 'deletePayGradeCurrency');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(86, 'Add Customer', 2, 'addCustomer');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(87, 'Delete Customer', 2, 'deleteCustomer');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(88, 'Save Project', 2, 'saveProject');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(89, 'Delete Project', 2, 'deleteProject');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(90, 'Add Project Adtivity', 2, 'addProjectActivity');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(91, 'Delete Project Adtivity', 2, 'deleteProjectActivity');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(92, 'Define PIM reports', 1, 'definePredefinedReport');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(93, 'Display PIM reports', 1, 'displayPredefinedReport');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(94, 'Add Job Vacancy', 7, 'addJobVacancy');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(95, 'Delete Job Vacancy', 7, 'deleteJobVacancy');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(96, 'Add Candidate', 7, 'addCandidate');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(97, 'Delete Candidate', 7, 'deleteCandidateVacancies');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(98, 'View Leave Request', 4, 'viewLeaveRequest');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(99, 'Change Leave Status', 4, 'changeLeaveStatus');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(100, 'Terminate Employment', 3, 'terminateEmployement');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(101, 'View Attendance Summary Report', 5, 'displayAttendanceSummaryReport');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(102, 'View Project Activity Details Report', 5, 'displayProjectActivityDetailsReport');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(103, 'Dashboard', 10, 'index');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(104, 'Save KPI', 11, 'saveKpi');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(105, 'Saearch KPI', 11, 'searchKpi');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(106, 'My Reviews', 11, 'myPerformanceReview');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(107, 'Add Review', 11, 'saveReview');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(108, 'Review Evaluate', 11, 'reviewEvaluate');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(109, 'Review Evaluate By Admin', 11, 'reviewEvaluateByAdmin');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(110, 'Search Evaluate Performance', 11, 'searchEvaluatePerformancReview');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(111, 'Search Performance Review', 11, 'searchPerformancReview');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(112, 'Manage_Objectives', 11, 'addPerformanceObjective');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(113, 'Employee_Objectives', 11, 'viewEmployeePerformanceObjectiveList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(114, 'My_Objectives', 11, 'viewMyPerformanceObjectiveList');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(115, 'Employee_Objective_Logs', 11, 'addPerformanceObjectiveLog');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(116, 'Directory', 12, 'viewDirectory');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(117, 'Manage OpenId', 2, 'openIdProvider');
INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES(118, 'Print Employee Timesheet', 5, 'printEmployeeReport');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_composite_display_field`
--

DROP TABLE IF EXISTS `ohrm_selected_composite_display_field`;
CREATE TABLE `ohrm_selected_composite_display_field` (
  `id` bigint(20) NOT NULL,
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_selected_composite_display_field`
--

TRUNCATE TABLE `ohrm_selected_composite_display_field`;
--
-- Dumping data for table `ohrm_selected_composite_display_field`
--

INSERT INTO `ohrm_selected_composite_display_field` (`id`, `composite_display_field_id`, `report_id`) VALUES(1, 1, 3);
INSERT INTO `ohrm_selected_composite_display_field` (`id`, `composite_display_field_id`, `report_id`) VALUES(2, 1, 4);
INSERT INTO `ohrm_selected_composite_display_field` (`id`, `composite_display_field_id`, `report_id`) VALUES(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field`
--

DROP TABLE IF EXISTS `ohrm_selected_display_field`;
CREATE TABLE `ohrm_selected_display_field` (
  `id` bigint(20) NOT NULL,
  `display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_selected_display_field`
--

TRUNCATE TABLE `ohrm_selected_display_field`;
--
-- Dumping data for table `ohrm_selected_display_field`
--

INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(2, 2, 1);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(4, 8, 2);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(94, 9, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(95, 10, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(96, 11, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(97, 12, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(98, 13, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(99, 14, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(100, 15, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(101, 17, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(102, 18, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(103, 19, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(104, 20, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(105, 21, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(106, 22, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(107, 23, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(108, 24, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(109, 25, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(110, 26, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(111, 27, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(112, 28, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(113, 29, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(114, 30, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(115, 31, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(116, 32, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(117, 33, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(118, 62, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(119, 64, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(120, 93, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(121, 63, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(122, 91, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(123, 94, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(124, 75, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(125, 76, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(126, 77, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(127, 78, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(128, 80, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(129, 81, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(130, 82, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(131, 83, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(132, 84, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(133, 85, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(134, 86, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(135, 87, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(136, 88, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(137, 89, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(138, 90, 5);
INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES(139, 95, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field_group`
--

DROP TABLE IF EXISTS `ohrm_selected_display_field_group`;
CREATE TABLE `ohrm_selected_display_field_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `display_field_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_selected_display_field_group`
--

TRUNCATE TABLE `ohrm_selected_display_field_group`;
--
-- Dumping data for table `ohrm_selected_display_field_group`
--

INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(16, 5, 1);
INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(17, 5, 2);
INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(18, 5, 3);
INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(19, 5, 4);
INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(20, 5, 9);
INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(21, 5, 8);
INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(22, 5, 6);
INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES(23, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_filter_field`
--

DROP TABLE IF EXISTS `ohrm_selected_filter_field`;
CREATE TABLE `ohrm_selected_filter_field` (
  `report_id` bigint(20) NOT NULL,
  `filter_field_id` bigint(20) NOT NULL,
  `filter_field_order` bigint(20) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `where_condition` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_selected_filter_field`
--

TRUNCATE TABLE `ohrm_selected_filter_field`;
--
-- Dumping data for table `ohrm_selected_filter_field`
--

INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(1, 3, 2, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(1, 6, 1, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(1, 7, 3, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(1, 21, 4, '0', NULL, '=', 'Predefined');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(2, 3, 4, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(2, 5, 3, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(2, 6, 2, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(2, 7, 5, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(2, 8, 1, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(3, 3, 2, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(3, 5, 1, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(3, 7, 3, NULL, NULL, NULL, 'Runtime');
INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES(5, 22, 0, NULL, NULL, 'IS NULL', 'Predefined');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_group_field`
--

DROP TABLE IF EXISTS `ohrm_selected_group_field`;
CREATE TABLE `ohrm_selected_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `summary_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_selected_group_field`
--

TRUNCATE TABLE `ohrm_selected_group_field`;
--
-- Dumping data for table `ohrm_selected_group_field`
--

INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES(1, 1, 1);
INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES(1, 1, 2);
INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES(2, 1, 3);
INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_skill`
--

DROP TABLE IF EXISTS `ohrm_skill`;
CREATE TABLE `ohrm_skill` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_skill`
--

TRUNCATE TABLE `ohrm_skill`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_subunit`
--

DROP TABLE IF EXISTS `ohrm_subunit`;
CREATE TABLE `ohrm_subunit` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `lft` smallint(6) UNSIGNED DEFAULT NULL,
  `rgt` smallint(6) UNSIGNED DEFAULT NULL,
  `level` smallint(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_subunit`
--

TRUNCATE TABLE `ohrm_subunit`;
--
-- Dumping data for table `ohrm_subunit`
--

INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES(1, 'Upskills Pte Ltd', '', '', 1, 10, 0);
INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES(2, 'Professional Services', 'PS', 'Professional Services', 2, 3, 1);
INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES(3, 'Business Development', 'BIZ', 'Business Development', 4, 5, 1);
INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES(4, 'Administration', 'ADM', 'Administration', 6, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_summary_display_field`
--

DROP TABLE IF EXISTS `ohrm_summary_display_field`;
CREATE TABLE `ohrm_summary_display_field` (
  `summary_display_field_id` bigint(20) NOT NULL,
  `function` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_summary_display_field`
--

TRUNCATE TABLE `ohrm_summary_display_field`;
--
-- Dumping data for table `ohrm_summary_display_field`
--

INSERT INTO `ohrm_summary_display_field` (`summary_display_field_id`, `function`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`) VALUES(1, 'ROUND(COALESCE(sum(duration)/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL);
INSERT INTO `ohrm_summary_display_field` (`summary_display_field_id`, `function`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`) VALUES(2, 'ROUND(COALESCE(sum(TIMESTAMPDIFF(SECOND , ohrm_attendance_record.punch_in_utc_time , ohrm_attendance_record.punch_out_utc_time))/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet`
--

DROP TABLE IF EXISTS `ohrm_timesheet`;
CREATE TABLE `ohrm_timesheet` (
  `timesheet_id` bigint(20) NOT NULL,
  `state` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_timesheet`
--

TRUNCATE TABLE `ohrm_timesheet`;
--
-- Dumping data for table `ohrm_timesheet`
--

INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(1, 'SUBMITTED', '2014-08-18', '2014-08-24', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(2, 'NOT SUBMITTED', '2014-07-28', '2014-08-03', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(4, 'NOT SUBMITTED', '2016-06-20', '2016-06-26', 61);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(5, 'NOT SUBMITTED', '2016-06-27', '2016-07-03', 61);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(7, 'NOT SUBMITTED', '2016-07-04', '2016-07-10', 4);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(8, 'NOT SUBMITTED', '2016-05-30', '2016-06-05', 4);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(10, 'NOT SUBMITTED', '2016-05-02', '2016-05-08', 4);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(11, 'NOT SUBMITTED', '2016-01-01', '2016-01-31', 4);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(14, 'NOT SUBMITTED', '1998-08-01', '1998-08-31', 4);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(24, 'NOT SUBMITTED', '2015-08-01', '2015-08-31', 4);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(49, 'NOT SUBMITTED', '2016-07-01', '2016-07-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(50, 'NOT SUBMITTED', '2016-06-01', '2016-06-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(51, 'NOT SUBMITTED', '2016-05-01', '2016-05-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(52, 'NOT SUBMITTED', '2016-04-01', '2016-04-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(53, 'NOT SUBMITTED', '2016-03-01', '2016-03-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(54, 'NOT SUBMITTED', '2016-02-01', '2016-02-29', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(55, 'NOT SUBMITTED', '2016-01-01', '2016-01-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(56, 'NOT SUBMITTED', '2015-12-01', '2015-12-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(57, 'NOT SUBMITTED', '2015-11-01', '2015-11-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(58, 'NOT SUBMITTED', '2015-10-01', '2015-10-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(59, 'NOT SUBMITTED', '2015-09-01', '2015-09-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(60, 'NOT SUBMITTED', '2015-08-01', '2015-08-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(61, 'NOT SUBMITTED', '2015-07-01', '2015-07-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(62, 'NOT SUBMITTED', '2015-06-01', '2015-06-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(63, 'NOT SUBMITTED', '2015-05-01', '2015-05-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(64, 'NOT SUBMITTED', '2015-04-01', '2015-04-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(65, 'NOT SUBMITTED', '2015-03-01', '2015-03-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(66, 'NOT SUBMITTED', '2015-02-01', '2015-02-28', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(67, 'NOT SUBMITTED', '2015-01-01', '2015-01-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(68, 'NOT SUBMITTED', '2014-12-01', '2014-12-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(69, 'NOT SUBMITTED', '2014-11-01', '2014-11-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(70, 'NOT SUBMITTED', '2014-10-01', '2014-10-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(71, 'NOT SUBMITTED', '2014-09-01', '2014-09-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(73, 'SUBMITTED', '2016-09-01', '2016-09-30', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(74, 'SUBMITTED', '2016-08-01', '2016-08-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(75, 'NOT SUBMITTED', '2016-09-01', '2016-09-30', 4);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(76, 'NOT SUBMITTED', '2016-10-01', '2016-10-31', 43);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(77, 'SUBMITTED', '2016-09-01', '2016-09-30', 5);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(78, 'NOT SUBMITTED', '2016-10-01', '2016-10-31', 5);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(79, 'NOT SUBMITTED', '2016-10-01', '2016-10-31', 2);
INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES(80, 'SUBMITTED', '2016-10-01', '2016-10-31', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_action_log`
--

DROP TABLE IF EXISTS `ohrm_timesheet_action_log`;
CREATE TABLE `ohrm_timesheet_action_log` (
  `timesheet_action_log_id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date_time` date NOT NULL,
  `performed_by` int(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_timesheet_action_log`
--

TRUNCATE TABLE `ohrm_timesheet_action_log`;
--
-- Dumping data for table `ohrm_timesheet_action_log`
--

INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(1, NULL, 'SUBMITTED', '2016-08-03', 52, 18);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(2, NULL, 'SUBMITTED', '2016-08-03', 52, 19);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(3, NULL, 'SUBMITTED', '2016-08-10', 52, 23);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(4, NULL, 'SUBMITTED', '2016-08-15', 52, 29);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(5, NULL, 'SUBMITTED', '2016-08-15', 52, 32);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(6, 'OK', 'APPROVED', '2016-08-24', 52, 18);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(7, NULL, 'SUBMITTED', '2016-08-31', 53, 72);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(8, NULL, 'SUBMITTED', '2016-09-03', 100, 73);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(9, NULL, 'SUBMITTED', '2016-09-03', 100, 74);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(10, NULL, 'SUBMITTED', '2016-10-11', 100, 77);
INSERT INTO `ohrm_timesheet_action_log` (`timesheet_action_log_id`, `comment`, `action`, `date_time`, `performed_by`, `timesheet_id`) VALUES(11, NULL, 'SUBMITTED', '2016-10-28', 100, 80);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_item`
--

DROP TABLE IF EXISTS `ohrm_timesheet_item`;
CREATE TABLE `ohrm_timesheet_item` (
  `timesheet_item_id` bigint(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `comment` text,
  `project_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_timesheet_item`
--

TRUNCATE TABLE `ohrm_timesheet_item`;
--
-- Dumping data for table `ohrm_timesheet_item`
--

INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(324, 77, '2016-09-07', 28800, NULL, 2, 5, 7);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(325, 77, '2016-09-01', 14400, NULL, 2, 5, 5);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(326, 77, '2016-09-08', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(327, 77, '2016-09-09', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(328, 77, '2016-09-12', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(329, 77, '2016-09-13', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(330, 77, '2016-09-14', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(331, 77, '2016-09-15', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(332, 77, '2016-09-16', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(333, 77, '2016-09-19', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(334, 77, '2016-09-20', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(335, 77, '2016-09-22', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(336, 77, '2016-09-23', 28800, NULL, 2, 5, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(337, 77, '2016-09-02', 28800, NULL, 1, 5, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(338, 77, '2016-09-21', 28800, NULL, 1, 5, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(339, 77, '2016-09-26', 28800, NULL, 1, 5, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(340, 77, '2016-09-27', 28800, NULL, 1, 5, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(341, 77, '2016-09-28', 28800, NULL, 1, 5, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(342, 77, '2016-09-29', 28800, NULL, 1, 5, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(343, 77, '2016-09-30', 28800, NULL, 1, 5, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(344, 80, '2016-10-03', 14400, NULL, 2, 4, 7);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(345, 80, '2016-10-04', 28800, NULL, 2, 4, 7);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(346, 80, '2016-10-05', 28800, NULL, 2, 4, 7);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(347, 80, '2016-10-19', 28800, NULL, 2, 4, 7);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(348, 80, '2016-10-03', 14400, NULL, 2, 4, 5);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(349, 80, '2016-10-05', 28800, NULL, 2, 4, 5);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(350, 80, '2016-10-13', 28800, NULL, 2, 4, 5);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(351, 80, '2016-10-17', 28800, NULL, 2, 4, 5);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(352, 80, '2016-10-20', 28800, NULL, 2, 4, 5);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(353, 80, '2016-10-05', 28800, NULL, 2, 4, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(354, 80, '2016-10-18', 28800, NULL, 2, 4, 6);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(355, 80, '2016-10-06', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(356, 80, '2016-10-10', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(357, 80, '2016-10-13', 14400, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(358, 80, '2016-10-23', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(359, 80, '2016-10-26', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(360, 80, '2016-10-27', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(361, 80, '2016-10-28', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(362, 80, '2016-10-30', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(363, 80, '2016-10-31', 28800, NULL, 1, 4, 2);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(364, 80, '2016-10-07', 28800, NULL, 1, 4, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(365, 80, '2016-10-10', 28800, NULL, 1, 4, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(366, 80, '2016-10-12', 28800, NULL, 1, 4, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(367, 80, '2016-10-14', 28800, NULL, 1, 4, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(368, 80, '2016-10-21', 28800, NULL, 1, 4, 1);
INSERT INTO `ohrm_timesheet_item` (`timesheet_item_id`, `timesheet_id`, `date`, `duration`, `comment`, `project_id`, `employee_id`, `activity_id`) VALUES(369, 80, '2016-10-24', 28800, NULL, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_upgrade_history`
--

DROP TABLE IF EXISTS `ohrm_upgrade_history`;
CREATE TABLE `ohrm_upgrade_history` (
  `id` int(10) NOT NULL,
  `start_version` varchar(30) DEFAULT NULL,
  `end_version` varchar(30) DEFAULT NULL,
  `start_increment` int(11) NOT NULL,
  `end_increment` int(11) NOT NULL,
  `upgraded_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_upgrade_history`
--

TRUNCATE TABLE `ohrm_upgrade_history`;
--
-- Dumping data for table `ohrm_upgrade_history`
--

INSERT INTO `ohrm_upgrade_history` (`id`, `start_version`, `end_version`, `start_increment`, `end_increment`, `upgraded_date`) VALUES(1, '3.3.1', '3.3.2', 63, 63, '2016-08-29 03:07:01');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_upskills_configuration`
--

DROP TABLE IF EXISTS `ohrm_upskills_configuration`;
CREATE TABLE `ohrm_upskills_configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `comments` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_upskills_configuration`
--

TRUNCATE TABLE `ohrm_upskills_configuration`;
--
-- Dumping data for table `ohrm_upskills_configuration`
--

INSERT INTO `ohrm_upskills_configuration` (`id`, `name`, `value`, `comments`) VALUES(0, 'endSendDateApproved', '20', 'For the not yet approved timesheets.\nBefore this date, send a mail every day if the timesheet isn''t approved.');
INSERT INTO `ohrm_upskills_configuration` (`id`, `name`, `value`, `comments`) VALUES(1, 'beginSendDate', '10', 'For missing timesheets mailing. Begin of sending the mail for draft timesheet');
INSERT INTO `ohrm_upskills_configuration` (`id`, `name`, `value`, `comments`) VALUES(2, 'refWebSite', '"http://192.168.0.111/orangehrmLocVersion/symfony/web/index.php/auth/login"', 'for the email, reference to the Upskills HR website');
INSERT INTO `ohrm_upskills_configuration` (`id`, `name`, `value`, `comments`) VALUES(3, 'upskillsProjectId', '2', 'For the timesheets, to get the id of the upskills project');
INSERT INTO `ohrm_upskills_configuration` (`id`, `name`, `value`, `comments`) VALUES(4, 'leavesActivityId', '5', 'For the timesheets, to get the id of the leaves activity in the upskills project');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user`
--

DROP TABLE IF EXISTS `ohrm_user`;
CREATE TABLE `ohrm_user` (
  `id` int(10) NOT NULL,
  `user_role_id` int(10) NOT NULL,
  `emp_number` int(13) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_user`
--

TRUNCATE TABLE `ohrm_user`;
--
-- Dumping data for table `ohrm_user`
--

INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(1, 1, 2, 'thong.tran', 'a4bb2100cbb1447679c71d1419ff5bd1', 0, 1, '2016-08-01 00:00:00', '2014-08-05 07:22:47', 11, NULL);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(7, 2, 20, 'varsha.guness', 'e3493f446a1ec6b466a68cc59ab72013', 0, 0, '2014-08-01 10:06:13', '2015-04-30 18:03:07', 1, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(10, 2, 5, 'chuangchuang.chen', '$2a$12$ZGMCz2nVQN.xYWywjcHD6O2xLeKjljHvld8rJfx1mHL9iPJ9YJT56', 0, 1, '2016-10-05 05:31:00', '2016-10-11 16:36:44', 100, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(11, 1, 15, 'vananh.do', 'a4bb2100cbb1447679c71d1419ff5bd1', 0, 1, '2014-08-05 05:41:54', '2015-09-28 09:39:52', 1, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(12, 2, 9, 'jianxiong.huang', '02515334ea7812fd21d47ad1dcbf79dd', 0, 1, '2014-08-05 05:42:21', '2014-08-05 07:17:51', 1, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(13, 2, 8, 'jia.shuo', '5b6b9dc9215d3e0822fcf1b62007e3ea', 0, 1, '2014-08-05 05:42:42', '2014-08-09 17:43:09', 1, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(14, 2, 6, 'driss.squalli', '64cc3ed5d0cd88ff013b5327218c7e4d', 0, 1, '2014-08-05 05:43:23', '2014-08-05 07:17:43', 1, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(15, 2, 10, 'kishi.teixeira', '88ec12944c20d91303c83a91dc674c94', 0, 1, '2014-08-05 05:43:58', '2015-10-29 04:04:46', 34, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(16, 2, 12, 'sun.shuo', '72803d35d5a438684d707c63a7940dad', 0, 1, '2014-08-05 05:44:17', '2015-07-01 08:41:10', 34, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(17, 2, 13, 'yoppy.winata', '7296ac6c60fc5ee673e203e800a39471', 0, 1, '2014-08-05 05:44:37', '2014-08-05 07:20:00', 1, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(18, 2, 14, 'nadia.jean', '0f16f63c54f36da868f2f332e2745072', 0, 1, '2014-08-05 05:45:00', '2014-10-20 12:15:48', 7, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(19, 2, 7, 'djeinabou.kante', '8da68396bf1b22183a0460ea0a376ba9', 0, 1, '2015-10-02 05:45:36', '2015-04-27 09:43:27', 7, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(20, 2, 23, 'jun.hao', '098f6bcd4621d373cade4e832627b4f6', 0, 0, '2014-09-30 05:59:38', '2015-05-01 08:40:45', 1, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(21, 2, 24, 'ge.hong', '629d49aefdfbe397bae48ece6cbee6b2', 0, 1, '2014-12-29 07:04:24', '2015-01-05 12:03:01', 7, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(22, 2, 25, 'wencong.gu', '267e1bbe4431b33dbf959990bac798cd', 0, 1, '2015-01-09 12:39:46', NULL, NULL, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(23, 2, 26, 'christopher.lim', '50dcea75f05b75386670dba9105f1e11', 1, 1, '2015-01-16 11:07:31', NULL, NULL, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(24, 2, 27, 'wang.zhe', 'e14dae082535ea2184588664f2de3a72', 0, 0, '2015-02-06 08:39:07', '2015-05-13 19:21:13', 1, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(25, 2, 28, 'lionel.ong', 'f0f7b824434f382e8ca62b088e80645c', 0, 1, '2015-03-06 12:11:52', '2015-03-16 11:22:59', 7, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(26, 2, 29, 'hexin.ju', 'c849456fba67d4769777197d505ff17f', 0, 1, '2015-03-16 04:33:48', NULL, NULL, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(27, 2, 30, 'thinh.vo', 'a7a76d8b4b1e306bb631bf2f599004f5', 0, 1, '2015-03-16 11:34:46', '2015-04-28 04:36:16', 7, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(29, 2, 32, 'tian.xi', '400c7167bfbf11583d53ced4cff45836', 0, 1, '2015-04-20 11:43:50', NULL, NULL, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(30, 2, 33, 'shameenah.sathasivam', '7fb6765727e7197795b61a7540c9c4b9', 0, 1, '2015-04-20 11:44:59', NULL, NULL, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(31, 2, 34, 'chen.zhe', '0bbe922f10454774c33bb05d9b2148ab', 0, 1, '2015-04-20 11:46:00', '2015-05-29 04:10:12', 34, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(32, 2, 35, 'Haoyu.Zheng', 'c8f628b15a0268790792529a57af39d6', 0, 1, '2015-04-20 11:50:08', '2015-08-25 02:49:16', 34, 7);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(33, 2, 36, 'amine.kettani', '260391d8d0b973ec1cccb2e084a8166f', 0, 1, '2015-05-04 05:14:36', NULL, NULL, 11);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(34, 1, 37, 'chiuling.lim', '0b9c2625dc21ef05f6ad4ddf47c5f203837aa32c', 0, 1, '2015-05-11 07:38:24', '2015-06-19 10:54:31', 34, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(35, 2, 38, 'pierre.pruvost', '810eba6800c20d06df6b039ed43e54e5', 0, 1, '2015-05-18 17:00:08', NULL, NULL, 11);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(36, 2, 39, 'Kiyosha.Teixeira', '7d10016710971edc2f9bf64a142f279f', 0, 1, '2015-06-04 09:31:21', '2015-08-12 09:49:30', 34, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(37, 2, 40, 'Bai.Di', '0ce9189ffa526e77104e31d670f5afb9', 0, 1, '2015-06-04 10:10:27', '2015-06-29 04:57:52', 34, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(38, 2, 41, 'Oscar.Sierra', 'f8fea84d2ad29d8be8eac2498c79b99c', 0, 1, '2015-07-01 05:20:26', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(39, 2, 45, 'Wang.Xiao', '8458abf985c269906d007afcc90d0f62', 0, 1, '2015-07-10 09:45:45', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(40, 2, 46, 'Hangyu.Ma', '901c20d48694ec2ab373cce150afa4c9', 0, 1, '2015-07-15 07:46:42', '2015-07-20 04:25:35', 34, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(41, 2, 43, 'Alexandre.Derian', '$2a$12$Qc7GVJjBwLhmv00qYNNip.1slJcDTmFyIVLCFSebaXNL8D7FTcgea', 0, 1, '2016-10-04 04:27:20', '2016-10-03 16:37:39', 100, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(42, 2, 47, 'Hyacinthe.Kouassi', 'c26f150f49528b2a563fbe8ea334f492', 0, 1, '2015-08-12 05:12:48', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(43, 2, 11, 'Marc.Megaides', '1fca914dfc8eb36a174f15f749421b0c', 0, 1, '2015-08-14 04:10:30', '2015-08-14 04:27:19', 34, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(44, 2, 48, 'CharlesHenri.Leroux', 'd953028bdefcf6d0c095ca10121d87d7', 0, 1, '2015-08-24 09:24:53', '2015-10-02 04:28:08', 34, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(45, 2, 50, 'wanxian.lee', '4a7198dd8b68495c3444f77957fb1c46', 0, 1, '2015-09-29 03:59:06', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(46, 2, 52, 'Dinh.Hanh', 'd2179a74ab0bf07e2ca056433ad88b97', 0, 1, '2015-10-08 05:32:23', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(47, 2, 53, 'Rynel.Tay', '11a71d9e37304d41be95a40b712c3e32', 0, 1, '2015-10-12 08:41:41', '2015-10-29 05:21:14', 34, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(48, 2, 54, 'Ting-An.KUO', '94b8a32757ce1488af3eed09fa6dff90', 0, 1, '2015-10-12 11:40:23', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(49, 2, 55, 'Xiaojuan.GAO', '6542dc6dfca957924ed873440353b259', 0, 1, '2015-10-12 11:45:20', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(50, 2, 49, 'Sarah.Elhachimi', '1dbd4df317fabe1842c5db0d61007850', 0, 1, '2015-10-19 08:33:34', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(51, 2, 58, 'Marcus.Liang', 'bbc6eb6fe1c0ea2fd926034aaf853560', 0, 1, '2015-10-19 08:42:32', NULL, NULL, 34);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(52, 1, 61, 'upskills-admin', '$2a$12$CjBKPTd2C8U0xgwKfyPZvux5AMuGTKl.3pqYq6FQJwMZIkyMZBlHK', 0, 1, '2016-08-09 13:37:01', '2016-06-23 16:14:12', 1, 1);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(53, 2, 4, 'youhou.you', '$2a$12$V5EHx9MqdtND6F/9F8fCcuevmoPoZTQG7nmm4qmOXAw6rnPcx65sK', 0, 1, '2016-06-23 14:26:11', NULL, NULL, 52);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(54, 2, 69, 'english', '$2a$12$1kwFh20RTg2Nf7rofnVXoO8G/v0EPPOdEXap3UJn.Kp45rqtq1fsu', 0, 1, '2016-08-11 16:06:13', NULL, NULL, 52);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(55, 2, 71, 'testeur', '$2a$12$QkR421uXGri5p6KlZCjFf.T7OuvD.ran8ixDqGTyQkJkpSYl3FwKC', 0, 1, '2016-08-22 10:38:36', NULL, NULL, 52);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(56, 2, 72, 'test1', '$2a$12$Mpes7acxvPVjETQI46yY9.h1Khn5k2mFJmupNENXd5nKNOLffl2xW', 0, 1, '2016-08-22 11:40:21', NULL, NULL, 52);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(100, 1, 2, 'marc', '$2a$12$6QN0Y2iIUo88phsgoL9R1.bR8eTczvXUfJXTBrGDNAdMkMUWYsZCu', 0, 1, '2016-08-26 00:00:00', NULL, NULL, 52);
INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES(101, 2, 73, 'TestTest', '$2a$12$EtjDVi3wJuBndXZxikp67ewq3fFP3Xgpfwnx1/ssniCZEhGmhGdeG', 0, 1, '2016-08-30 09:49:51', NULL, NULL, 100);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role`
--

DROP TABLE IF EXISTS `ohrm_user_role`;
CREATE TABLE `ohrm_user_role` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_assignable` tinyint(1) DEFAULT '0',
  `is_predefined` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_user_role`
--

TRUNCATE TABLE `ohrm_user_role`;
--
-- Dumping data for table `ohrm_user_role`
--

INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES(1, 'Admin', 'Admin', 1, 1);
INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES(2, 'ESS', 'ESS', 1, 1);
INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES(3, 'Supervisor', 'Supervisor', 0, 1);
INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES(4, 'ProjectAdmin', 'ProjectAdmin', 0, 1);
INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES(5, 'Interviewer', 'Interviewer', 0, 1);
INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES(6, 'HiringManager', 'HiringManager', 0, 1);
INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES(7, 'Reviewer', 'Reviewer', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_data_group`
--

DROP TABLE IF EXISTS `ohrm_user_role_data_group`;
CREATE TABLE `ohrm_user_role_data_group` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL,
  `self` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_user_role_data_group`
--

TRUNCATE TABLE `ohrm_user_role_data_group`;
--
-- Dumping data for table `ohrm_user_role_data_group`
--

INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(1, 1, 1, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(2, 1, 2, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(3, 1, 3, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(4, 1, 4, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(5, 1, 5, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(6, 1, 6, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(7, 1, 7, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(8, 1, 8, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(9, 1, 9, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(10, 1, 10, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(11, 1, 11, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(12, 1, 12, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(13, 1, 13, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(14, 1, 14, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(15, 1, 15, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(16, 1, 16, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(17, 1, 17, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(18, 1, 18, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(19, 1, 19, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(20, 1, 20, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(21, 1, 21, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(22, 1, 22, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(23, 1, 23, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(24, 1, 24, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(25, 1, 25, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(26, 1, 26, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(27, 1, 27, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(28, 1, 28, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(29, 1, 29, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(30, 1, 30, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(31, 1, 31, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(32, 1, 32, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(33, 1, 33, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(34, 1, 34, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(35, 1, 35, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(36, 1, 36, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(37, 1, 37, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(38, 1, 38, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(39, 1, 39, 1, NULL, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(40, 1, 40, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(41, 1, 41, 1, NULL, NULL, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(42, 1, 40, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(43, 2, 1, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(44, 2, 2, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(45, 2, 3, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(46, 2, 4, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(47, 2, 5, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(48, 2, 6, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(49, 2, 7, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(50, 2, 8, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(51, 2, 9, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(52, 2, 10, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(53, 2, 11, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(54, 2, 12, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(55, 2, 13, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(56, 2, 14, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(57, 2, 15, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(58, 2, 16, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(59, 2, 17, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(60, 2, 18, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(61, 2, 19, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(62, 2, 20, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(63, 2, 21, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(64, 2, 22, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(65, 2, 23, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(66, 2, 24, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(67, 2, 25, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(68, 2, 26, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(69, 2, 27, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(70, 2, 28, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(71, 2, 29, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(72, 2, 30, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(73, 2, 31, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(74, 2, 32, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(75, 2, 33, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(76, 2, 34, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(77, 2, 35, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(78, 2, 36, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(79, 2, 37, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(80, 2, 38, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(81, 2, 39, 1, NULL, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(82, 2, 40, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(83, 2, 41, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(84, 3, 1, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(85, 3, 2, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(86, 3, 3, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(87, 3, 4, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(88, 3, 5, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(89, 3, 6, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(90, 3, 7, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(91, 3, 8, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(92, 3, 9, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(93, 3, 10, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(94, 3, 11, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(95, 3, 12, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(96, 3, 13, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(97, 3, 14, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(98, 3, 15, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(99, 3, 16, 1, NULL, NULL, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(100, 3, 17, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(101, 3, 18, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(102, 3, 19, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(103, 3, 20, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(104, 3, 21, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(105, 3, 22, 1, NULL, NULL, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(106, 3, 23, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(107, 3, 24, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(108, 3, 25, 1, NULL, NULL, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(109, 3, 26, 1, NULL, NULL, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(110, 3, 27, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(111, 3, 28, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(112, 3, 29, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(113, 3, 30, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(114, 3, 31, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(115, 3, 32, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(116, 3, 33, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(117, 3, 34, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(118, 3, 35, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(119, 3, 36, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(120, 3, 37, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(121, 3, 38, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(122, 3, 39, 1, NULL, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(123, 3, 40, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(124, 3, 41, 1, NULL, NULL, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(125, 3, 1, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(126, 3, 2, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(127, 3, 3, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(128, 3, 4, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(129, 3, 5, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(130, 3, 6, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(131, 3, 7, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(132, 3, 8, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(133, 3, 9, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(134, 3, 10, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(135, 3, 11, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(136, 3, 12, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(137, 3, 13, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(138, 3, 14, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(139, 3, 15, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(140, 3, 16, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(141, 3, 17, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(142, 3, 18, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(143, 3, 19, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(144, 3, 20, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(145, 3, 21, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(146, 3, 22, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(147, 3, 23, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(148, 3, 24, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(149, 3, 25, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(150, 3, 26, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(151, 3, 27, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(152, 3, 28, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(153, 3, 29, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(154, 3, 30, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(155, 3, 31, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(156, 3, 32, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(157, 3, 33, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(158, 3, 34, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(159, 3, 35, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(160, 3, 36, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(161, 3, 37, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(162, 3, 38, 1, NULL, 1, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(163, 3, 39, 1, NULL, 1, 1, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(164, 3, 40, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(165, 3, 41, 1, NULL, NULL, NULL, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(166, 1, 42, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(167, 2, 42, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(168, 3, 42, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(169, 1, 43, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(170, 2, 43, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(171, 3, 43, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(172, 1, 44, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(173, 2, 44, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(174, 3, 44, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(175, 1, 45, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(176, 2, 45, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(177, 3, 45, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(178, 4, 45, 1, 0, 1, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(179, 1, 46, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(180, 2, 46, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(181, 3, 46, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(182, 1, 47, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(183, 2, 47, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(184, 3, 47, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(185, 1, 48, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(186, 2, 48, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(187, 2, 48, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(188, 3, 48, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(189, 1, 49, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(190, 2, 49, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(191, 3, 49, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(192, 4, 49, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(193, 1, 50, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(194, 2, 50, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(195, 3, 50, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(196, 1, 51, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(197, 2, 51, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(198, 3, 51, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(199, 1, 52, 1, NULL, 1, NULL, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(200, 2, 52, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(201, 3, 52, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(202, 1, 53, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(203, 2, 53, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(204, 3, 53, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(205, 1, 54, 1, 0, 1, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(206, 2, 54, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(207, 3, 54, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(208, 1, 55, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(209, 2, 55, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(210, 3, 55, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(211, 1, 56, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(212, 2, 56, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(213, 3, 56, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(214, 1, 57, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(215, 6, 57, 1, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(216, 5, 57, 1, 0, 1, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(217, 1, 58, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(218, 2, 58, 0, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(219, 2, 58, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(220, 3, 58, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(221, 1, 59, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(222, 2, 59, 1, 0, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(223, 3, 59, 1, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(224, 1, 60, 0, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(225, 2, 60, 0, 1, 0, 0, 1);
INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES(226, 3, 60, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_screen`
--

DROP TABLE IF EXISTS `ohrm_user_role_screen`;
CREATE TABLE `ohrm_user_role_screen` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `can_read` tinyint(1) NOT NULL DEFAULT '0',
  `can_create` tinyint(1) NOT NULL DEFAULT '0',
  `can_update` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_user_role_screen`
--

TRUNCATE TABLE `ohrm_user_role_screen`;
--
-- Dumping data for table `ohrm_user_role_screen`
--

INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(1, 1, 1, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(2, 1, 2, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(3, 2, 2, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(4, 3, 2, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(5, 1, 3, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(6, 2, 3, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(7, 3, 3, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(8, 1, 4, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(9, 1, 5, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(10, 3, 5, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(11, 1, 6, 1, 0, 0, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(12, 1, 7, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(13, 1, 8, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(14, 1, 9, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(15, 1, 10, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(16, 1, 11, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(17, 1, 12, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(18, 1, 13, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(19, 1, 14, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(20, 1, 16, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(21, 3, 16, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(22, 1, 17, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(23, 3, 17, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(24, 1, 18, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(25, 2, 18, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(26, 3, 18, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(27, 1, 19, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(28, 1, 20, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(29, 1, 21, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(30, 1, 22, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(31, 1, 23, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(32, 1, 24, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(33, 1, 25, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(34, 1, 26, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(35, 1, 27, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(36, 1, 28, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(37, 1, 29, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(38, 1, 30, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(39, 1, 31, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(40, 1, 32, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(41, 1, 33, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(42, 1, 34, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(43, 1, 35, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(44, 1, 36, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(45, 1, 37, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(46, 4, 37, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(47, 1, 38, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(48, 1, 39, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(49, 1, 40, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(50, 1, 41, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(51, 1, 42, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(52, 1, 43, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(53, 1, 44, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(54, 1, 45, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(55, 2, 46, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(56, 1, 47, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(57, 2, 48, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(58, 2, 49, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(59, 1, 50, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(60, 2, 51, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(61, 1, 52, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(62, 3, 52, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(63, 2, 53, 1, 1, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(64, 2, 54, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(65, 1, 55, 1, 1, 0, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(66, 3, 55, 1, 1, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(67, 1, 56, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(68, 1, 57, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(69, 4, 57, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(70, 1, 58, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(71, 3, 58, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(72, 1, 59, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(73, 3, 59, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(74, 1, 60, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(75, 6, 60, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(76, 5, 60, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(77, 1, 61, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(78, 1, 67, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(79, 2, 67, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(80, 3, 67, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(81, 1, 68, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(82, 2, 68, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(83, 3, 68, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(84, 1, 69, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(85, 3, 69, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(86, 2, 70, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(87, 1, 71, 1, 0, 0, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(88, 1, 72, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(89, 1, 73, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(90, 1, 74, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(91, 1, 75, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(92, 3, 75, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(93, 1, 76, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(94, 5, 76, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(95, 6, 76, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(96, 1, 78, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(97, 3, 78, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(98, 2, 79, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(99, 1, 80, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(100, 1, 81, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(101, 1, 82, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(102, 1, 83, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(103, 1, 84, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(104, 1, 85, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(105, 1, 86, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(106, 1, 87, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(107, 1, 88, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(108, 4, 88, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(109, 1, 89, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(110, 1, 90, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(111, 4, 90, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(112, 1, 91, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(113, 4, 91, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(114, 1, 92, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(115, 1, 93, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(116, 1, 94, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(117, 1, 95, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(118, 1, 96, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(119, 5, 96, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(120, 6, 96, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(121, 1, 97, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(122, 6, 97, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(123, 1, 98, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(124, 2, 98, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(125, 3, 98, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(126, 1, 99, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(127, 2, 99, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(128, 3, 99, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(129, 1, 100, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(130, 1, 101, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(131, 3, 101, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(132, 1, 102, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(133, 4, 102, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(134, 1, 103, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(135, 2, 103, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(136, 1, 104, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(137, 1, 105, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(138, 1, 107, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(139, 1, 109, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(140, 1, 111, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(141, 2, 110, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(142, 2, 108, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(143, 2, 106, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(144, 3, 109, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(145, 2, 109, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(146, 1, 112, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(147, 2, 112, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(148, 1, 113, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(149, 2, 113, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(150, 1, 114, 0, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(151, 2, 114, 1, 0, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(152, 1, 115, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(153, 2, 115, 1, 0, 0, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(154, 1, 116, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(155, 2, 116, 1, 1, 1, 1);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(156, 1, 117, 1, 1, 1, 0);
INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES(157, 1, 118, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_selection_rule`
--

DROP TABLE IF EXISTS `ohrm_user_selection_rule`;
CREATE TABLE `ohrm_user_selection_rule` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `implementation_class` varchar(255) NOT NULL,
  `rule_xml_data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_user_selection_rule`
--

TRUNCATE TABLE `ohrm_user_selection_rule`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_workflow_state_machine`
--

DROP TABLE IF EXISTS `ohrm_workflow_state_machine`;
CREATE TABLE `ohrm_workflow_state_machine` (
  `id` bigint(20) NOT NULL,
  `workflow` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `resulting_state` varchar(255) NOT NULL,
  `roles_to_notify` text,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_workflow_state_machine`
--

TRUNCATE TABLE `ohrm_workflow_state_machine`;
--
-- Dumping data for table `ohrm_workflow_state_machine`
--

INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(78, '0', 'INITIAL', 'ADMIN', '7', 'NOT SUBMITTED', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(79, '0', 'INITIAL', 'ESS USER', '7', 'NOT SUBMITTED', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(80, '0', 'INITIAL', 'SUPERVISOR', '7', 'NOT SUBMITTED', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(81, '3', 'NOT_EXIST', 'ADMIN', '1', 'ACTIVE', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(82, '3', 'ACTIVE', 'ADMIN', '2', 'NOT_EXIST', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(83, '3', 'ACTIVE', 'ADMIN', '3', 'TERMINATED', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(84, '3', 'TERMINATED', 'ADMIN', '4', 'ACTIVE', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(85, '3', 'TERMINATED', 'ADMIN', '5', 'NOT_EXIST', '', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(86, '4', 'INITIAL', 'ESS', 'APPLY', 'PENDING APPROVAL', 'supervisor,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(87, '4', 'INITIAL', 'ADMIN', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(88, '4', 'INITIAL', 'SUPERVISOR', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(89, '4', 'PENDING APPROVAL', 'ADMIN', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(90, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(91, '4', 'PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(92, '4', 'PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(93, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(94, '4', 'PENDING APPROVAL', 'ADMIN', 'REJECT', 'REJECTED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(95, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'REJECT', 'REJECTED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(96, '4', 'SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(97, '4', 'SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(98, '4', 'SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(99, '4', 'TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(100, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(101, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(102, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(103, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(104, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(105, '4', 'LEAVE TYPE DELETED SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);
INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES(106, '4', 'LEAVE TYPE DELETED TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_shift`
--

DROP TABLE IF EXISTS `ohrm_work_shift`;
CREATE TABLE `ohrm_work_shift` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `hours_per_day` decimal(4,2) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_work_shift`
--

TRUNCATE TABLE `ohrm_work_shift`;
-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_week`
--

DROP TABLE IF EXISTS `ohrm_work_week`;
CREATE TABLE `ohrm_work_week` (
  `id` int(10) UNSIGNED NOT NULL,
  `operational_country_id` int(10) UNSIGNED DEFAULT NULL,
  `mon` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `tue` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `wed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `thu` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `fri` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sat` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sun` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_work_week`
--

TRUNCATE TABLE `ohrm_work_week`;
--
-- Dumping data for table `ohrm_work_week`
--

INSERT INTO `ohrm_work_week` (`id`, `operational_country_id`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`) VALUES(1, NULL, 0, 0, 0, 0, 0, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_ws_consumer`
--

DROP TABLE IF EXISTS `ohrm_ws_consumer`;
CREATE TABLE `ohrm_ws_consumer` (
  `app_id` int(10) UNSIGNED NOT NULL,
  `app_token` varchar(10) NOT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ohrm_ws_consumer`
--

TRUNCATE TABLE `ohrm_ws_consumer`;
--
-- Indexes for dumped tables
--

--
-- Indexes for table `abstract_display_field`
--
ALTER TABLE `abstract_display_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_config`
--
ALTER TABLE `hs_hr_config`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `hs_hr_country`
--
ALTER TABLE `hs_hr_country`
  ADD PRIMARY KEY (`cou_code`);

--
-- Indexes for table `hs_hr_currency_type`
--
ALTER TABLE `hs_hr_currency_type`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `hs_hr_custom_export`
--
ALTER TABLE `hs_hr_custom_export`
  ADD PRIMARY KEY (`export_id`),
  ADD KEY `emp_number` (`export_id`);

--
-- Indexes for table `hs_hr_custom_fields`
--
ALTER TABLE `hs_hr_custom_fields`
  ADD PRIMARY KEY (`field_num`),
  ADD KEY `emp_number` (`field_num`),
  ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_custom_import`
--
ALTER TABLE `hs_hr_custom_import`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `emp_number` (`import_id`);

--
-- Indexes for table `hs_hr_district`
--
ALTER TABLE `hs_hr_district`
  ADD PRIMARY KEY (`district_code`);

--
-- Indexes for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
  ADD PRIMARY KEY (`emp_number`),
  ADD KEY `work_station` (`work_station`),
  ADD KEY `nation_code` (`nation_code`),
  ADD KEY `job_title_code` (`job_title_code`),
  ADD KEY `emp_status` (`emp_status`),
  ADD KEY `eeo_cat_code` (`eeo_cat_code`),
  ADD KEY `termination_id` (`termination_id`);

--
-- Indexes for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
  ADD PRIMARY KEY (`emp_number`,`eattach_id`),
  ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sal_grd_code` (`sal_grd_code`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `payperiod_code` (`payperiod_code`);

--
-- Indexes for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
  ADD PRIMARY KEY (`emp_number`,`ec_seqno`);

--
-- Indexes for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
  ADD PRIMARY KEY (`emp_number`,`econ_extend_id`);

--
-- Indexes for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
  ADD PRIMARY KEY (`emp_number`,`ed_seqno`);

--
-- Indexes for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_id` (`salary_id`);

--
-- Indexes for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
  ADD PRIMARY KEY (`emp_number`,`eec_seqno`);

--
-- Indexes for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
  ADD PRIMARY KEY (`emp_number`,`emp_seqno`);

--
-- Indexes for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
  ADD PRIMARY KEY (`emp_number`,`lang_id`,`fluency`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
  ADD PRIMARY KEY (`emp_number`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
  ADD PRIMARY KEY (`emp_number`,`membship_code`),
  ADD KEY `membship_code` (`membship_code`);

--
-- Indexes for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
  ADD PRIMARY KEY (`emp_number`,`ep_seqno`);

--
-- Indexes for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
  ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
  ADD PRIMARY KEY (`erep_sup_emp_number`,`erep_sub_emp_number`,`erep_reporting_mode`),
  ADD KEY `erep_sub_emp_number` (`erep_sub_emp_number`),
  ADD KEY `erep_reporting_mode` (`erep_reporting_mode`);

--
-- Indexes for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
  ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
  ADD PRIMARY KEY (`emp_number`,`eexp_seqno`);

--
-- Indexes for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
  ADD PRIMARY KEY (`jobtit_code`,`estat_code`),
  ADD KEY `estat_code` (`estat_code`);

--
-- Indexes for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notification_type_id` (`notification_type_id`);

--
-- Indexes for table `hs_hr_module`
--
ALTER TABLE `hs_hr_module`
  ADD PRIMARY KEY (`mod_id`);

--
-- Indexes for table `hs_hr_payperiod`
--
ALTER TABLE `hs_hr_payperiod`
  ADD PRIMARY KEY (`payperiod_code`);

--
-- Indexes for table `hs_hr_pay_period`
--
ALTER TABLE `hs_hr_pay_period`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_province`
--
ALTER TABLE `hs_hr_province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_unique_id`
--
ALTER TABLE `hs_hr_unique_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table_field` (`table_name`,`field_name`);

--
-- Indexes for table `ohrm_advanced_report`
--
ALTER TABLE `ohrm_advanced_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_attendance_record`
--
ALTER TABLE `ohrm_attendance_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id_state` (`employee_id`,`state`),
  ADD KEY `emp_id_time` (`employee_id`,`punch_in_utc_time`,`punch_out_utc_time`);

--
-- Indexes for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
  ADD PRIMARY KEY (`report_group_id`,`group_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `group_field_id` (`group_field_id`);

--
-- Indexes for table `ohrm_beacon_notification`
--
ALTER TABLE `ohrm_beacon_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  ADD PRIMARY KEY (`composite_display_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_customer`
--
ALTER TABLE `ohrm_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datapoint_type_id` (`datapoint_type_id`);

--
-- Indexes for table `ohrm_datapoint_type`
--
ALTER TABLE `ohrm_datapoint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_data_group`
--
ALTER TABLE `ohrm_data_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_group_id` (`data_group_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  ADD PRIMARY KEY (`display_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_education`
--
ALTER TABLE `ohrm_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email`
--
ALTER TABLE `ohrm_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ohrm_email_name` (`name`);

--
-- Indexes for table `ohrm_email_configuration`
--
ALTER TABLE `ohrm_email_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_notification`
--
ALTER TABLE `ohrm_email_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  ADD PRIMARY KEY (`work_shift_id`,`emp_number`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_employment_status`
--
ALTER TABLE `ohrm_employment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `education_id` (`education_id`);

--
-- Indexes for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
  ADD PRIMARY KEY (`emp_number`,`license_id`),
  ADD KEY `license_id` (`license_id`);

--
-- Indexes for table `ohrm_emp_reporting_method`
--
ALTER TABLE `ohrm_emp_reporting_method`
  ADD PRIMARY KEY (`reporting_method_id`);

--
-- Indexes for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reason_id` (`reason_id`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_emp_termination_reason`
--
ALTER TABLE `ohrm_emp_termination_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
  ADD PRIMARY KEY (`filter_field_id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_group_field`
--
ALTER TABLE `ohrm_group_field`
  ADD PRIMARY KEY (`group_field_id`);

--
-- Indexes for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_holiday_ohrm_operational_country` (`operational_country_id`);

--
-- Indexes for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Indexes for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_person` (`added_person`);

--
-- Indexes for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `vacancy_id` (`vacancy_id`),
  ADD KEY `interview_id` (`interview_id`),
  ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
  ADD PRIMARY KEY (`candidate_id`,`vacancy_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_job_category`
--
ALTER TABLE `ohrm_job_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_vacancy_id` (`candidate_vacancy_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interview_id` (`interview_id`);

--
-- Indexes for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
  ADD PRIMARY KEY (`interview_id`,`interviewer_id`),
  ADD KEY `interviewer_id` (`interviewer_id`);

--
-- Indexes for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_title_id` (`job_title_id`);

--
-- Indexes for table `ohrm_job_title`
--
ALTER TABLE `ohrm_job_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_title_code` (`job_title_code`),
  ADD KEY `hiring_manager_id` (`hiring_manager_id`);

--
-- Indexes for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_kpi`
--
ALTER TABLE `ohrm_kpi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_language`
--
ALTER TABLE `ohrm_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_request_type_emp` (`leave_request_id`,`leave_type_id`,`emp_number`),
  ADD KEY `request_status` (`leave_request_id`,`status`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `adjustment_type` (`adjustment_type`);

--
-- Indexes for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_id` (`leave_id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `entitlement_type` (`entitlement_type`),
  ADD KEY `created_by_id` (`created_by_id`);

--
-- Indexes for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entitlement_id` (`entitlement_id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `ohrm_leave_entitlement_type`
--
ALTER TABLE `ohrm_leave_entitlement_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entitlement_id` (`entitlement_id`),
  ADD KEY `leave_id` (`leave_id`);

--
-- Indexes for table `ohrm_leave_period_history`
--
ALTER TABLE `ohrm_leave_period_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_request_id` (`leave_request_id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_status`
--
ALTER TABLE `ohrm_leave_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operational_country_id` (`operational_country_id`);

--
-- Indexes for table `ohrm_license`
--
ALTER TABLE `ohrm_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `ohrm_login`
--
ALTER TABLE `ohrm_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_membership`
--
ALTER TABLE `ohrm_membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_module`
--
ALTER TABLE `ohrm_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `ohrm_nationality`
--
ALTER TABLE `ohrm_nationality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_oauth_access_token`
--
ALTER TABLE `ohrm_oauth_access_token`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `ohrm_oauth_authorization_code`
--
ALTER TABLE `ohrm_oauth_authorization_code`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `ohrm_oauth_client`
--
ALTER TABLE `ohrm_oauth_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `ohrm_oauth_refresh_token`
--
ALTER TABLE `ohrm_oauth_refresh_token`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `ohrm_oauth_user`
--
ALTER TABLE `ohrm_oauth_user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ohrm_openid_provider`
--
ALTER TABLE `ohrm_openid_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
  ADD KEY `ohrm_user_identity_ibfk_1` (`user_id`),
  ADD KEY `ohrm_user_identity_ibfk_2` (`provider_id`);

--
-- Indexes for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_operational_country_hs_hr_country` (`country_code`);

--
-- Indexes for table `ohrm_organization_gen_info`
--
ALTER TABLE `ohrm_organization_gen_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_pay_grade`
--
ALTER TABLE `ohrm_pay_grade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
  ADD PRIMARY KEY (`pay_grade_id`,`currency_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `ohrm_performance_objective`
--
ALTER TABLE `ohrm_performance_objective`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_track_fk1_idx` (`emp_number`),
  ADD KEY `ohrm_performance_track_fk2_idx` (`added_by`);

--
-- Indexes for table `ohrm_performance_objective_log`
--
ALTER TABLE `ohrm_performance_objective_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_tracker_log_fk1_idx` (`performance_objective_id`),
  ADD KEY `ohrm_performance_tracker_log_fk2_idx` (`reviewer_id`),
  ADD KEY `fk_ohrm_performance_tracker_log_1` (`user_id`);

--
-- Indexes for table `ohrm_performance_objective_reviewer`
--
ALTER TABLE `ohrm_performance_objective_reviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_tracker_reviewer_fk1_idx` (`performance_objective_id`),
  ADD KEY `ohrm_performance_tracker_reviewer_fk2_idx` (`reviewer_id`);

--
-- Indexes for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_number` (`employee_number`);

--
-- Indexes for table `ohrm_plugin`
--
ALTER TABLE `ohrm_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ohrm_project`
--
ALTER TABLE `ohrm_project`
  ADD PRIMARY KEY (`project_id`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
  ADD PRIMARY KEY (`project_id`,`emp_number`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_report_group`
--
ALTER TABLE `ohrm_report_group`
  ADD PRIMARY KEY (`report_group_id`);

--
-- Indexes for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `ohrm_reviewer_group`
--
ALTER TABLE `ohrm_reviewer_group`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
