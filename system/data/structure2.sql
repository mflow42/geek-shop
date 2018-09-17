-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.23 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных geek_shop
CREATE DATABASE IF NOT EXISTS `geek_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `geek_shop`;

-- Дамп структуры для таблица geek_shop.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `comment` text,
  `order_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_order_status1_idx` (`order_status_id`),
  CONSTRAINT `fk_order_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.order: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00',
  `shop_product_id` int(11) NOT NULL,
  `order_id` int(11) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_shop_product1_idx` (`shop_product_id`),
  KEY `fk_order_item_order1_idx` (`order_id`),
  CONSTRAINT `fk_order_item_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_item_shop_product1` FOREIGN KEY (`shop_product_id`) REFERENCES `shop_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.order_item: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.order_status
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.order_status: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.page
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `description` varchar(160) DEFAULT NULL,
  `keywords` varchar(50) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.page: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
REPLACE INTO `page` (`id`, `title`, `description`, `keywords`, `content`) VALUES
	(1, 'Catalogue', 'Description', 'Keywords', 'Content');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.shop_category
CREATE TABLE IF NOT EXISTS `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.shop_category: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
REPLACE INTO `shop_category` (`id`, `name`, `description`, `status`, `parent_id`) VALUES
	(1, 'Men', 'Men\'s good', 1, NULL),
	(2, 'Woman', 'Woman\'s good', 1, NULL);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.shop_product
CREATE TABLE IF NOT EXISTS `shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(9,2) DEFAULT '0.00',
  `quantity` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `shop_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shop_product_shop_category1_idx` (`shop_category_id`),
  CONSTRAINT `fk_shop_product_shop_category1` FOREIGN KEY (`shop_category_id`) REFERENCES `shop_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.shop_product: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
REPLACE INTO `shop_product` (`id`, `name`, `description`, `price`, `quantity`, `status`, `shop_category_id`) VALUES
	(1, 'Cool t-shirt', 'desc1', 52.00, 1, 1, 1),
	(2, 'Blue jeans', 'desc2', 60.00, 1, 1, 1),
	(3, 'Red jacket', 'desc3', 80.00, 1, 1, 2),
	(4, 'White dress', 'desc4', 86.00, 1, 1, 2);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_access` timestamp NULL DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.user: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.user_has_role
CREATE TABLE IF NOT EXISTS `user_has_role` (
  `user_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`user_role_id`),
  KEY `fk_user_has_user_role_user_role1_idx` (`user_role_id`),
  KEY `fk_user_has_user_role_user_idx` (`user_id`),
  CONSTRAINT `fk_user_has_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_role_user_role1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.user_has_role: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `user_has_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_role` ENABLE KEYS */;

-- Дамп структуры для таблица geek_shop.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы geek_shop.user_role: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
