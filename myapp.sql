-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema postkrdedjango
--

CREATE DATABASE IF NOT EXISTS postkrdedjango;
USE postkrdedjango;

--
-- Definition of table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


--
-- Definition of table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `group_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group_permissions`
--

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


--
-- Definition of table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(10) unsigned NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`,`name`,`content_type_id`,`codename`) VALUES 
 (1,'Can add log entry',1,'add_logentry'),
 (2,'Can change log entry',1,'change_logentry'),
 (3,'Can delete log entry',1,'delete_logentry'),
 (4,'Can view log entry',1,'view_logentry'),
 (5,'Can add user',2,'add_user'),
 (6,'Can change user',2,'change_user'),
 (7,'Can delete user',2,'delete_user'),
 (8,'Can view user',2,'view_user'),
 (9,'Can add group',3,'add_group'),
 (10,'Can change group',3,'change_group'),
 (11,'Can delete group',3,'delete_group'),
 (12,'Can view group',3,'view_group'),
 (13,'Can add permission',4,'add_permission'),
 (14,'Can change permission',4,'change_permission'),
 (15,'Can delete permission',4,'delete_permission'),
 (16,'Can view permission',4,'view_permission'),
 (17,'Can add content type',5,'add_contenttype'),
 (18,'Can change content type',5,'change_contenttype'),
 (19,'Can delete content type',5,'delete_contenttype'),
 (20,'Can view content type',5,'view_contenttype'),
 (21,'Can add session',6,'add_session'),
 (22,'Can change session',6,'change_session'),
 (23,'Can delete session',6,'delete_session'),
 (24,'Can view session',6,'view_session'),
 (25,'Can add register',7,'add_register'),
 (26,'Can change register',7,'change_register'),
 (27,'Can delete register',7,'delete_register'),
 (28,'Can view register',7,'view_register'),
 (29,'Can add addcat',8,'add_addcat'),
 (30,'Can change addcat',8,'change_addcat'),
 (31,'Can delete addcat',8,'delete_addcat'),
 (32,'Can view addcat',8,'view_addcat'),
 (33,'Can add addsubcat',9,'add_addsubcat'),
 (34,'Can change addsubcat',9,'change_addsubcat'),
 (35,'Can delete addsubcat',9,'delete_addsubcat'),
 (36,'Can view addsubcat',9,'view_addsubcat'),
 (37,'Can add addpost',10,'add_addpost'),
 (38,'Can change addpost',10,'change_addpost'),
 (39,'Can delete addpost',10,'delete_addpost'),
 (40,'Can view addpost',10,'view_addpost'),
 (41,'Can add payment',11,'add_payment'),
 (42,'Can change payment',11,'change_payment'),
 (43,'Can delete payment',11,'delete_payment'),
 (44,'Can view payment',11,'view_payment'),
 (45,'Can add city',12,'add_city'),
 (46,'Can change city',12,'change_city'),
 (47,'Can delete city',12,'delete_city'),
 (48,'Can view city',12,'view_city'),
 (49,'Can add state',13,'add_state'),
 (50,'Can change state',13,'change_state'),
 (51,'Can delete state',13,'delete_state'),
 (52,'Can view state',13,'view_state'),
 (53,'Can add bidding',14,'add_bidding'),
 (54,'Can change bidding',14,'change_bidding'),
 (55,'Can delete bidding',14,'delete_bidding'),
 (56,'Can view bidding',14,'view_bidding');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


--
-- Definition of table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `password` varchar(45) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(3) unsigned NOT NULL,
  `username` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `is_staff` tinyint(3) unsigned NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


--
-- Definition of table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


--
-- Definition of table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_user_permissions`
--

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


--
-- Definition of table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `object_id` longtext NOT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


--
-- Definition of table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `app_label` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`,`app_label`,`model`) VALUES 
 (1,'admin','logentry'),
 (2,'auth','user'),
 (3,'auth','group'),
 (4,'auth','permission'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'myapp','register'),
 (8,'myadmin','addcat'),
 (9,'myadmin','addsubcat'),
 (10,'user','addpost'),
 (11,'user','payment'),
 (12,'myapp','city'),
 (13,'myapp','state'),
 (14,'user','bidding');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


--
-- Definition of table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `app` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`,`app`,`name`,`applied`) VALUES 
 (1,'contenttypes','0001_initial','2019-04-02 09:21:16'),
 (2,'auth','0001_initial','2019-04-02 09:21:22'),
 (3,'admin','0001_initial','2019-04-02 09:21:23'),
 (4,'admin','0002_logentry_remove_auto_add','2019-04-02 09:21:23'),
 (5,'admin','0003_logentry_add_action_flag_choices','2019-04-02 09:21:23'),
 (6,'contenttypes','0002_remove_content_type_name','2019-04-02 09:21:24'),
 (7,'auth','0002_alter_permission_name_max_length','2019-04-02 09:21:24'),
 (8,'auth','0003_alter_user_email_max_length','2019-04-02 09:21:24'),
 (9,'auth','0004_alter_user_username_opts','2019-04-02 09:21:24'),
 (10,'auth','0005_alter_user_last_login_null','2019-04-02 09:21:24'),
 (11,'auth','0006_require_contenttypes_0002','2019-04-02 09:21:25'),
 (12,'auth','0007_alter_validators_add_error_messages','2019-04-02 09:21:25'),
 (13,'auth','0008_alter_user_username_max_length','2019-04-02 09:21:25'),
 (14,'auth','0009_alter_user_last_name_max_length','2019-04-02 09:21:25'),
 (15,'sessions','0001_initial','2019-04-02 09:21:25'),
 (16,'myapp','0001_initial','2019-04-02 10:09:35'),
 (17,'myadmin','0001_initial','2019-04-06 10:20:50'),
 (18,'myadmin','0002_addsubcat','2019-04-09 09:06:14'),
 (19,'user','0001_initial','2019-04-21 10:40:08'),
 (20,'user','0002_payment','2019-04-21 10:40:08'),
 (21,'myapp','0002_city_state','2019-04-26 16:06:00'),
 (22,'user','0003_bidding','2019-04-26 16:06:00');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


--
-- Definition of table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`,`session_data`,`expire_date`) VALUES 
 ('0g9m9cq17q3sj72xoovq51f7lnxkwlxt','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-09 13:51:34'),
 ('0juocgmu2b72asm4jgw3xvsn4rvcta4g','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-09 13:47:02'),
 ('0p7xkkjhzcc8i3jadg8ycgg6b40kn4e5','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-06 03:35:03'),
 ('0zxvixgidt28p0o1w81j02ltha8zv87p','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-08 14:08:12'),
 ('13iv48kxt5q1ndvl65xzi7p22iaa8ygc','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 08:22:15'),
 ('1cadxremjj1w4hh0eii5j9g4y332bo6p','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 09:18:49'),
 ('2080vxggq5ht0fh6ocps47onywjnxelo','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-05 10:46:23'),
 ('23uggdct4pum1vqgzax4bloy92mzx061','YTZhNGNmM2VjODU4NDM5MTM0MmU2NmI3MjgxOWEyOTgzM2Y0YmE1Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsLCJhZHNpZCI6IjkifQ==','2019-05-14 10:27:47'),
 ('4ndj1xbajqp4jibysb0tofktjgo4wavt','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 09:11:39'),
 ('63x51hbnudonf1bd0tu94fm5gcsph4s4','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-10 16:26:24'),
 ('69puqumnumzu3os1crg08wfxvsfiyyje','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 08:38:03'),
 ('6bwswefbcgn1szmjhur8u8epeijruf3j','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 08:44:17'),
 ('6djt19yajgd1xzy7x9bhu5k7ox2ayvhk','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 09:12:22'),
 ('6qlqzyb48g2rr9h014qpjx8gme0xol0b','MmNkNzExY2M4NTZjNzRjNzI4YzY1YzEzNTVkYmJkNWJhNmNiNmE5NDp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciJ9','2019-05-11 08:33:52'),
 ('6sdbcz3ev1y08abder7h2x0kmz77yygv','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 09:23:04'),
 ('6vj000te7t1oehl3zovths8oupq831n0','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-10 11:48:02'),
 ('7jifhi19vhgoqkesakpuzp6kucvmf02j','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-06 03:27:17'),
 ('7kup37gm18hptna6u5koxxwjs4705avh','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-12 09:26:21'),
 ('914ndmszuot25f1x59jaj3ka3d4h6fo1','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 08:00:32'),
 ('azykg6jimdsldm8iv8q0k74j0ioe70p0','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-06 03:24:52'),
 ('b0ztivo8ojq8542d6p7fhma4ftj46jqe','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-11 08:10:42'),
 ('ben8effopabqytnyppw7lnzhasxcz5p2','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 10:15:45'),
 ('bexgpenskx3unrgsr3g41mj9jxscqbwt','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-06 10:03:58'),
 ('bitwbztf52pjlluj3c8jnsvo5oie9a0o','N2NiNTZjYjQ3MGY1OTExMzM2YzlhMjIxZGMyOWI3MDdhMmQ0MWFmNzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsLCJhZHNpZCI6IjQifQ==','2019-05-09 13:37:53'),
 ('bn0g8tyfqw0upc6eb2753iwtls1fkr9e','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 08:28:57'),
 ('bvja3c8epg4zo7wiuyc4psv13lv61h1r','NmRmNjA5MDE0MDdmMjc4Njc3YWU0MTUzMTAwZjdmYmVhN2JmODc4ODp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciIsImFkc2lkIjoiNSJ9','2019-05-10 16:39:44'),
 ('byiuqs0v1i2imc3zieweqh1phd2hs3tk','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 09:16:27'),
 ('cgxbm7qdhl7ia1zoe6zsuy2o5vyw41uo','MmNkNzExY2M4NTZjNzRjNzI4YzY1YzEzNTVkYmJkNWJhNmNiNmE5NDp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciJ9','2019-05-11 07:51:21'),
 ('d003vtaexhhobr6gfsqepqvop5rl98nq','N2NiNTZjYjQ3MGY1OTExMzM2YzlhMjIxZGMyOWI3MDdhMmQ0MWFmNzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsLCJhZHNpZCI6IjQifQ==','2019-05-07 11:01:03'),
 ('d9ajsr9txq0dvtvop5p7ngs1xfrlsv4p','N2NiNTZjYjQ3MGY1OTExMzM2YzlhMjIxZGMyOWI3MDdhMmQ0MWFmNzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsLCJhZHNpZCI6IjQifQ==','2019-05-08 11:12:27'),
 ('ec9b9963buksxv0psth15z45zfemmsmn','MmNkNzExY2M4NTZjNzRjNzI4YzY1YzEzNTVkYmJkNWJhNmNiNmE5NDp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciJ9','2019-05-11 10:45:39'),
 ('eqhpbraq829cpx1k28ayt1ov19hurh61','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-11 05:05:32'),
 ('gbo1hb79uuzknsqnrzfemlowjq2biryk','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-04 12:56:37'),
 ('ghcfn0vmqdr8ygca3g82dqjwjbp8vqe7','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-12 12:12:49'),
 ('h9ky5fpielj6yu67wi36kaj3y701dn91','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-11 05:10:46'),
 ('i5tz1mtyidvrnztd2vo00awzfaoh7alr','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 03:49:01'),
 ('j9b572yf26p8wgr7tqu464exrnggq4g0','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-08 05:01:28'),
 ('jkc81lxr2ct6hnwb3hld8axgkpvb2yq1','ZTZhZjkxZDFmNDBiOGVkNDA1ZTk2ODQwYzY4YzI3NWYxZmIyNTY1Zjp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciIsImFkc2lkIjoiNiJ9','2019-05-10 16:14:24'),
 ('jkx6ye9zasuvyvaku0yrwnnhlih8nf2x','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-06 08:18:42'),
 ('jtrx71gi65sbjz8e3gtrgg6xm4s0tr2j','MmNkNzExY2M4NTZjNzRjNzI4YzY1YzEzNTVkYmJkNWJhNmNiNmE5NDp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciJ9','2019-05-11 08:29:38'),
 ('jwktsz4v0s7mowqi3ihj6k15t3fln8ae','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-06 10:54:01'),
 ('knfifbb8sul5qkjqbe92giyvuvkk1c3q','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-05 12:54:11'),
 ('ltd3m42jnl9fg4uyel59rv4mupi5zfy9','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 09:34:33'),
 ('m5jmkq7d9qknqxz1ea2k0nw23qfp6d7y','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-05 13:10:41'),
 ('nfz7f37k95rd3xanzrp8zwjjq6lup7c6','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 09:25:31'),
 ('nxgka53evz57sglqcgylnejym86prf4t','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 09:12:58'),
 ('o75lygp5amfj48w2l6emnall5ll3j9zt','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-17 06:41:24'),
 ('ogbewerjdspqk4fv1m4c76b7x9hqglrp','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-14 09:21:58'),
 ('ot0u859lpuwdbbsxqtsqswol1qm3m9lo','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 11:11:28'),
 ('ozxs1goppzghwez5rjxr9i6upeb2g1xx','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-07-22 05:12:01'),
 ('pqgaswlyomyn84lamti5sx21squkdu55','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 11:13:13'),
 ('q0ci3rr5s1qd85d1f94h2zmxud3g1k0l','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-12 09:29:14'),
 ('qzqe9ge64n6k4qa9d7wraj0pshrhbi09','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-09 15:44:24'),
 ('ri7pcsgvl4skyebi9my5i1xgbeg2uqof','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 09:46:08'),
 ('rsyo1gqw6csojw4jxctogo0jq2gym5pd','MmNkNzExY2M4NTZjNzRjNzI4YzY1YzEzNTVkYmJkNWJhNmNiNmE5NDp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciJ9','2019-05-10 16:26:56'),
 ('s5lsx9z3c9ce1fnbu1685wrv8l5jqhnb','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 15:44:40'),
 ('sqttq9eg3e1rhe4fidp11sz8ef0nqs00','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-05 12:14:48'),
 ('t2finbyfueg3b2xr5oz4hpdj51d8dd4v','MmNkNzExY2M4NTZjNzRjNzI4YzY1YzEzNTVkYmJkNWJhNmNiNmE5NDp7InN1bm0iOiJtdWt0ZXNoZ3VwdGExOTk2QGdtYWlsLmNvbSIsInNyb2xlIjoidXNlciJ9','2019-05-06 12:42:28'),
 ('vk4u5a9kr0idfe369adbw7xbi5q065oy','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 08:42:24'),
 ('vzw34vsy42s1k72m9qaniem59t2jcdz0','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 08:48:00'),
 ('x3doowolzsf5ole60f1x5vsqsj266y0z','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-08 09:27:20'),
 ('x7jyxrqvxfwycaepcqxi0aj5rftwawj7','Zjk5NmYwMjQ4OTE5ODE4OGYxNTRjYmNmZTg5Yzk0OGNiMzJkNWE1MTp7InN1bm0iOiJhZG1pbkBnbWFpbC5jb20iLCJzcm9sZSI6ImFkbWluIn0=','2019-05-06 10:05:23'),
 ('xf27p5smytqvytyd6q2q25h087u52lvs','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 08:46:07'),
 ('yvj1owtaiu90ltvkxkasownkcbnarhcl','NWJjNDE2MDM1YTczM2EzMDE4OGZlZmMwMDliN2QxNzE3NGExNWEyYjp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsLCJhZHNpZCI6IjUifQ==','2019-05-10 11:17:59'),
 ('z9rcch2jod02cxgjdoo2s2lgiigl6uua','N2I4MGQ3YTE0YzFhZGM4ZWFmY2RhMGE2OTEzZGFiMmE5ZGRkYjM3Mzp7InN1bm0iOm51bGwsInNyb2xlIjpudWxsfQ==','2019-05-07 08:36:44');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


--
-- Definition of table `myadmin_addcat`
--

DROP TABLE IF EXISTS `myadmin_addcat`;
CREATE TABLE `myadmin_addcat` (
  `catid` int(10) unsigned NOT NULL auto_increment,
  `catnm` varchar(45) NOT NULL,
  `caticon` varchar(100) NOT NULL,
  PRIMARY KEY  (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_addcat`
--

/*!40000 ALTER TABLE `myadmin_addcat` DISABLE KEYS */;
INSERT INTO `myadmin_addcat` (`catid`,`catnm`,`caticon`) VALUES 
 (1,'Vehicles','v.png'),
 (2,'Furniture','f.jpeg'),
 (3,'Pets','p.png'),
 (4,'Electronics','e.png'),
 (5,'Cloths','clothsicon.png'),
 (6,'Bags','bagicon.png'),
 (7,'Shoes','shoesicon.png'),
 (8,'Jewellery','jwel.png'),
 (9,'Sports','sports.jpg');
/*!40000 ALTER TABLE `myadmin_addcat` ENABLE KEYS */;


--
-- Definition of table `myadmin_addsubcat`
--

DROP TABLE IF EXISTS `myadmin_addsubcat`;
CREATE TABLE `myadmin_addsubcat` (
  `subcatid` int(10) unsigned NOT NULL auto_increment,
  `subcatnm` varchar(45) NOT NULL,
  `catnm` varchar(45) NOT NULL,
  `subcaticon` varchar(1000) NOT NULL,
  PRIMARY KEY  (`subcatid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myadmin_addsubcat`
--

/*!40000 ALTER TABLE `myadmin_addsubcat` DISABLE KEYS */;
INSERT INTO `myadmin_addsubcat` (`subcatid`,`subcatnm`,`catnm`,`subcaticon`) VALUES 
 (1,'Bikes','Vehicles','bike_Todf9iq.png'),
 (2,'Cars','Vehicles','car_GFuLe91.png'),
 (3,'Dogs','Pets','dog_LVYBBGS.png'),
 (4,'Cats','Pets','cat_riV6qey.png'),
 (6,'Cycle','Vehicles','image3.jpg'),
 (7,'Mobile','Electronics','mobile.png'),
 (8,'Men Cloths','Cloths','mens.png'),
 (9,'Women Cloths','Cloths','womens.png'),
 (10,'Child','Cloths','childicon.jpg'),
 (11,'School Bag','Bags','b1.jpg'),
 (12,'Wallet','Bags','wallet.png'),
 (13,'Mens Shoes','Shoes','mens.png'),
 (14,'Womens Shoes','Shoes','womens.png'),
 (15,'Tv','Electronics','tvicon.png'),
 (16,'Computer','Electronics','computericon.png'),
 (17,'Laptop','Electronics','laptopicon.png'),
 (18,'Scooty','Vehicles','scoty.png'),
 (19,'Truck','Vehicles','truckicon.png'),
 (20,'Tracktor','Vehicles','tractoricon.png'),
 (21,'Chair','Furniture','chairicon.png'),
 (22,'Table','Furniture','tableicon.png'),
 (23,'Almari','Furniture','almariicon.png'),
 (24,'Window','Furniture','windowsicon.png'),
 (25,'Door','Furniture','dooricon\'.png'),
 (26,'Computer Table','Furniture','computerchairicon.png'),
 (27,'Bed','Furniture','bedsicon.png'),
 (28,'Cricket','Sports','cricketicon.png'),
 (29,'Football','Sports','footballicon.png'),
 (30,'Badminton','Sports','badmintonicon.png');
/*!40000 ALTER TABLE `myadmin_addsubcat` ENABLE KEYS */;


--
-- Definition of table `myapp_city`
--

DROP TABLE IF EXISTS `myapp_city`;
CREATE TABLE `myapp_city` (
  `cid` int(11) NOT NULL auto_increment,
  `sid` int(11) NOT NULL,
  `cnm` varchar(100) NOT NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myapp_city`
--

/*!40000 ALTER TABLE `myapp_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_city` ENABLE KEYS */;


--
-- Definition of table `myapp_register`
--

DROP TABLE IF EXISTS `myapp_register`;
CREATE TABLE `myapp_register` (
  `regid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(10) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `city` varchar(45) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`regid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myapp_register`
--

/*!40000 ALTER TABLE `myapp_register` DISABLE KEYS */;
INSERT INTO `myapp_register` (`regid`,`name`,`email`,`password`,`address`,`city`,`mobile`,`dob`,`gender`,`role`,`status`) VALUES 
 (1,'Muktesh Varshney','vkkholi@hotmail','dadvvsv','Indore Old Palaisya','Indore','8962734389','2019-04-03','male','user',0),
 (2,'admin','admin@gmail.com','123456','indore mp','indore','1111111111','14/5/84','male','admin',1),
 (6,'ram','ram@gmail.com','wdsqw','dqwdqwd','Bhopal','97555111111','2019-04-09','male','user',0),
 (8,'vilekh','adawadkarvilekh@gmail.com','12345','indore mp','Indore','97555111111','2019-04-03','male','user',0),
 (9,'Muktesh Varshney','vkkholi@hotmail','12345','Indore Old Palaisya','Indore','8962734389','2019-04-04','male','user',0),
 (10,'Rajesh Varshney','Rajesh@hotmail','89652','Indore Old Palaisya','Indore','9907573623','2019-04-24','male','user',1),
 (11,'Nak','vkkholi@hotmail','fcwfecw','Indore Old Palaisya','Indore','dcds','2019-04-21','female','user',0),
 (12,'cdc','vkkholi@hotmail','xsacas','Indore Old Palaisya','Indore','csacsa','2019-04-28','female','user',0),
 (13,'Muktesh Varshney','mukteshgupta1996@gmail.com','1234','Indore','Pune','8962734389','2019-04-22','male','user',1),
 (14,'Mayank Dubey','m1a2.mayank@gmail.com','1236547','Ujjain','Ujjain','8745213698','2019-04-23','male','user',1),
 (15,'Neil','m1a2.mayank@gmail.com','963258','Indore','Indore','9632587410','2019-04-14','male','user',0),
 (16,'Mukesh Ambani','m1a2.mayank@gmail.com','8741256','Mumbai','Mumbai','8962734389','2019-04-24','male','user',0),
 (17,'Rahul','rahuljaiswaloist@gmail.com','123456','Bhopal','Bhopal','89652347','2019-04-25','male','user',0),
 (18,'Ankit','ankitkumarsharma800@gmail.com','874520121','bhopal','Bhopal','8965231478','2019-04-27','male','user',0),
 (19,'Ankit Sharma','mukteshgupta1996@gmail.com','1234','Shajapur MP','Ujjain','8962734389','2019-04-11','male','user',0),
 (20,'Ankit Sharma','mukteshgupta1996@gmail.com','1234','Indore Old Palaisya','Indore','8745213698','2019-04-20','male','user',0),
 (21,'Ashu Gupta','mukteshgupta1996@gmail.com','1234','Indore Old Palaisya','Indore','9907573623','2019-04-06','male','user',0),
 (22,'Muktesh Varshney','mickeyvarshney01@gmail.com','9999','xzz','Bhopal','9632587410','2019-04-18','male','user',0),
 (23,'Muktesh Varshney','mickeyvarshney01@gmail.com','9999','xzz','Bhopal','9632587410','2019-04-18','male','user',0),
 (24,'Muktesh Varshney','mukteshgupta1996@gmail.com','12345','Indore Old Palaisya','Indore','8962734389','2019-04-12','male','user',0),
 (25,'cdc','mukteshgupta1996@gmail.com','123456','bjn ,m mnm','Mumbai','8745213698','2019-04-12','male','user',0),
 (26,'Shikhar Varshney','shikharv7@gmail.com','roshni','Jhansi','Indore','8808891320','2019-05-03','male','user',1),
 (27,'Anil Singh','anilsinghgwl2018@gmail.com','123456789','Gwalior','Bhopal','9074734434','2019-05-16','male','user',0);
/*!40000 ALTER TABLE `myapp_register` ENABLE KEYS */;


--
-- Definition of table `myapp_state`
--

DROP TABLE IF EXISTS `myapp_state`;
CREATE TABLE `myapp_state` (
  `sid` int(11) NOT NULL auto_increment,
  `snm` varchar(100) NOT NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myapp_state`
--

/*!40000 ALTER TABLE `myapp_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_state` ENABLE KEYS */;


--
-- Definition of table `user_addpost`
--

DROP TABLE IF EXISTS `user_addpost`;
CREATE TABLE `user_addpost` (
  `adsid` int(11) NOT NULL auto_increment,
  `uid` varchar(100) NOT NULL,
  `adstitle` varchar(100) NOT NULL,
  `adssubcat` varchar(50) NOT NULL,
  `adsdescription` varchar(100) NOT NULL,
  `adsprice` varchar(100) NOT NULL,
  `file1` varchar(100) NOT NULL,
  `file2` varchar(100) NOT NULL,
  `file3` varchar(100) NOT NULL,
  `file4` varchar(100) NOT NULL,
  `adscity` varchar(50) NOT NULL,
  `bstatus` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`adsid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_addpost`
--

/*!40000 ALTER TABLE `user_addpost` DISABLE KEYS */;
INSERT INTO `user_addpost` (`adsid`,`uid`,`adstitle`,`adssubcat`,`adsdescription`,`adsprice`,`file1`,`file2`,`file3`,`file4`,`adscity`,`bstatus`,`status`) VALUES 
 (1,'mukteshgupta1996@gmail.com','Mick','Mick Clothes','Mick','5000','bike_A6nJ4hy.png','logo.png','logo.png','logo.png','Bhopal',0,1),
 (2,'mukteshgupta1996@gmail.com','Mick','Mick Clothes','Mick','5000','bike_A5BOTEr.png','logo.png','logo.png','logo.png','Bhopal',1,0),
 (3,'mukteshgupta1996@gmail.com','Mick','Mick Clothes','Mick','5000','bike_0X6isyB.png','logo.png','logo.png','logo.png','Bhopal',0,0),
 (4,'mukteshgupta1996@gmail.com','Activa','Bikes','Good Condition','40000','download.jpg','download.jpg','honda-activa-5g-1522148835.png','download (2).jpg','Bhopal',1,1),
 (5,'mukteshgupta1996@gmail.com','Pulsar','Bikes','Very Good Condition','65000','bk6.jpg','logo.png','logo.png','logo.png','Indore',0,1),
 (6,'mukteshgupta1996@gmail.com','platina','Bikes','Good Condition','32000','b.jpg','logo.png','logo.png','logo.png','Ujjain',1,1),
 (7,'mukteshgupta1996@gmail.com','Puppy','Dogs','Good','1500','d1.jpg','logo.png','logo.png','logo.png','Mumbai',1,1),
 (8,'Rajesh@hotmail','T-Shrt','Mick Clothes','Very Good','500','fa10.jpg','logo.png','logo.png','logo.png','Ujjain',1,0),
 (9,'m1a2.mayank@gmail.com','Hornet','Bikes','For Sale ','90000','image1.jpg','logo.png','logo.png','logo.png','Mumbai',1,1),
 (10,'m1a2.mayank@gmail.com','Cycle Hero','Cycle','Good For Health ','5000','image2.png','logo.png','logo.png','logo.png','Indore',1,1),
 (11,'m1a2.mayank@gmail.com','Cycle Metro','Cycle','Metro City In Indore','7000','images.jpg','logo.png','logo.png','logo.png','Bhopal',1,1),
 (12,'Rajesh@hotmail','Shirt','Men','For a Best Fit','900','cloth8_guIdzy2.jpg','logo.png','logo.png','logo.png','Pune',1,1),
 (13,'Rajesh@hotmail','Top','Women','For A New Collection ','1500','cloths4.jpg','logo.png','logo.png','logo.png','Pune',1,1),
 (14,'Rajesh@hotmail','Iphone6s','Mobile','After 6 Months Use','17650','mobile6.jpg','logo.png','logo.png','logo.png','Indore',0,1),
 (15,'mukteshgupta1996@gmail.com','New Shirt Look','Men','Just a Demo Images','8705','kl.jpg','logo.png','logo.png','logo.png','Ujjain',1,1);
/*!40000 ALTER TABLE `user_addpost` ENABLE KEYS */;


--
-- Definition of table `user_bidding`
--

DROP TABLE IF EXISTS `user_bidding`;
CREATE TABLE `user_bidding` (
  `bidid` int(11) NOT NULL auto_increment,
  `uid` varchar(100) NOT NULL,
  `adsid` int(11) NOT NULL,
  `nprice` varchar(50) NOT NULL,
  `btime` varchar(500) NOT NULL,
  PRIMARY KEY  (`bidid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_bidding`
--

/*!40000 ALTER TABLE `user_bidding` DISABLE KEYS */;
INSERT INTO `user_bidding` (`bidid`,`uid`,`adsid`,`nprice`,`btime`) VALUES 
 (1,'Rajesh@hotmail',4,'60000','1556352595.8150935'),
 (2,'Rajesh@hotmail',2,'25000','1556352811.7401028'),
 (3,'Rajesh@hotmail',2,'60000','1556352831.8780522'),
 (4,'Rajesh@hotmail',2,'8000','1556352986.0241158'),
 (5,'mukteshgupta1996@gmail.com',8,'600','1556452425.588005'),
 (6,'shikharv7@gmail.com',2,'7000','1556821580.3109818'),
 (7,'Rajesh@hotmail',2,'9000','1556865540.6419723');
/*!40000 ALTER TABLE `user_bidding` ENABLE KEYS */;


--
-- Definition of table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback` (
  `feedid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `feednm` varchar(45) NOT NULL,
  `feedarea` varchar(45) NOT NULL,
  PRIMARY KEY  (`feedid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_feedback`
--

/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
INSERT INTO `user_feedback` (`feedid`,`uid`,`feednm`,`feedarea`) VALUES 
 (1,NULL,'Muktesh Varshney','Tested'),
 (2,NULL,'Mayank Gupta','Very Good '),
 (3,NULL,'Rahul Parmar','This is Amzing Website Post KArde'),
 (4,NULL,'Kapil Jain','Post Karde Is Good For Sale ');
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;


--
-- Definition of table `user_payment`
--

DROP TABLE IF EXISTS `user_payment`;
CREATE TABLE `user_payment` (
  `txnid` int(11) NOT NULL auto_increment,
  `uid` varchar(100) NOT NULL,
  `adsid` varchar(100) NOT NULL,
  `adsprice` varchar(100) NOT NULL,
  `ptime` varchar(100) NOT NULL,
  PRIMARY KEY  (`txnid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_payment`
--

/*!40000 ALTER TABLE `user_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_payment` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
