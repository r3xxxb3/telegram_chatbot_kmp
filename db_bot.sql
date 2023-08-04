/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 8.0.13 : Database - db_bot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_bot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `db_bot`;

/*Table structure for table `tb_balasan` */

DROP TABLE IF EXISTS `tb_balasan`;

CREATE TABLE `tb_balasan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_subjek` int(11) DEFAULT NULL,
  `id_tanya` int(11) DEFAULT NULL,
  `id_objek` int(11) DEFAULT NULL,
  `id_predikat` int(11) DEFAULT NULL,
  `id_keterangan` int(11) DEFAULT NULL,
  `balasan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_balasan` */

insert  into `tb_balasan`(`id`,`id_subjek`,`id_tanya`,`id_objek`,`id_predikat`,`id_keterangan`,`balasan`) values 
(1,8,1,0,10,11,'maksud anda dimana ?'),
(2,8,1,12,10,11,'dimana ?'),
(3,8,1,12,10,13,'ada sate nggak ?'),
(4,8,1,12,10,14,'okee'),
(7,0,0,0,15,0,'hai'),
(8,0,0,0,16,0,'halo'),
(9,0,0,0,18,17,'selamat pagi'),
(10,0,0,0,18,19,'selamat siang'),
(11,0,0,0,18,20,'selamat malam');

/*Table structure for table `tb_inbox` */

DROP TABLE IF EXISTS `tb_inbox`;

CREATE TABLE `tb_inbox` (
  `id_inbox` bigint(20) NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) NOT NULL,
  `in_msg` text,
  `flag` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pengirim` varchar(255) NOT NULL,
  `type` enum('msg','file','loc','img') DEFAULT 'msg',
  PRIMARY KEY (`id_inbox`),
  KEY `id_chat` (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=latin1;

/*Data for the table `tb_inbox` */

insert  into `tb_inbox`(`id_inbox`,`chat_id`,`in_msg`,`flag`,`tgl`,`pengirim`,`type`) values 
(514,628748372,'halo','1','2020-12-21 12:51:07','Rey','msg'),
(515,628748372,'hai','1','2020-12-21 12:51:49','Rey','msg'),
(516,628748372,'ha','1','2020-12-21 12:51:53','Rey','msg'),
(517,628748372,'hal','1','2020-12-21 12:52:05','Rey','msg'),
(518,628748372,'halo','1','2020-12-21 12:52:13','Rey','msg'),
(519,628748372,'clear','1','2020-12-21 12:52:52','Rey','msg'),
(520,628748372,'hal','1','2020-12-21 12:52:56','Rey','msg'),
(521,628748372,'ha','1','2020-12-21 12:53:00','Rey','msg'),
(522,628748372,'clear','1','2020-12-21 12:53:04','Rey','msg'),
(523,628748372,'ha','1','2020-12-21 12:53:08','Rey','msg'),
(524,628748372,'clear','1','2020-12-21 12:53:12','Rey','msg'),
(525,628748372,'kmu mau','1','2020-12-21 12:53:20','Rey','msg'),
(526,628748372,'clear','1','2020-12-21 12:53:23','Rey','msg'),
(527,628748372,'kmau mau makan apa disana','1','2020-12-21 12:53:55','Rey','msg'),
(528,628748372,'clear','1','2020-12-21 12:53:59','Rey','msg'),
(529,628748372,'kamu mau makan apa disana','1','2020-12-21 12:54:08','Rey','msg'),
(530,628748372,'disana','1','2020-12-21 12:54:15','Rey','msg'),
(531,628748372,'di warung','1','2020-12-21 12:54:19','Rey','msg'),
(532,628748372,'clear','1','2020-12-21 12:56:59','Rey','msg'),
(533,628748372,'kamu mau makan apa disana','1','2020-12-21 12:57:06','Rey','msg'),
(534,628748372,'clear','1','2020-12-21 12:57:16','Rey','msg'),
(535,628748372,'kamu mau makan apa disana','1','2020-12-21 12:57:22','Rey','msg'),
(536,628748372,'clear','1','2020-12-21 12:58:42','Rey','msg'),
(537,628748372,'halo','1','2020-12-21 12:58:45','Rey','msg'),
(538,628748372,'clear','1','2020-12-21 12:58:50','Rey','msg'),
(539,628748372,'kamu mau makan apa disana','1','2020-12-21 12:58:56','Rey','msg'),
(540,628748372,'di warung','1','2020-12-21 12:59:13','Rey','msg'),
(541,628748372,'clear','1','2020-12-21 13:01:43','Rey','msg'),
(542,628748372,'kamu mau makan dimana','1','2020-12-21 13:01:43','Rey','msg'),
(543,628748372,'kamu mau makan apa disana','1','2020-12-21 13:02:16','Rey','msg'),
(544,628748372,'clear','1','2020-12-21 13:02:20','Rey','msg'),
(545,628748372,'kamu mau makan apa disana','1','2020-12-21 13:02:30','Rey','msg'),
(546,628748372,'di warung','1','2020-12-21 13:02:35','Rey','msg'),
(547,628748372,'bot','1','2020-12-21 13:02:40','Rey','msg'),
(548,628748372,'ada','1','2020-12-21 13:03:53','Rey','msg'),
(549,628748372,'clear','1','2020-12-21 13:04:01','Rey','msg'),
(550,628748372,'kamu mau makan apa disana','1','2020-12-21 13:04:11','Rey','msg'),
(551,628748372,'di warung','1','2020-12-21 13:04:17','Rey','msg'),
(552,628748372,'clear','1','2020-12-21 13:05:48','Rey','msg'),
(553,628748372,'kamu mau makan apa disana','1','2020-12-21 13:05:53','Rey','msg'),
(554,628748372,'di sana bot','1','2020-12-21 13:06:05','Rey','msg'),
(555,628748372,'warung','1','2020-12-21 13:06:09','Rey','msg'),
(556,628748372,'Clear','1','2020-12-21 13:17:12','Rey','msg'),
(557,628748372,'Ha','1','2020-12-21 13:17:14','Rey','msg'),
(558,628748372,'Hai','1','2020-12-21 13:17:19','Rey','msg'),
(559,628748372,'Clear','1','2020-12-21 13:17:54','Rey','msg'),
(560,628748372,'Hal','1','2020-12-21 13:18:25','Rey','msg'),
(561,628748372,'Hai','1','2020-12-21 13:18:31','Rey','msg'),
(562,628748372,'Clear','1','2020-12-21 13:18:38','Rey','msg'),
(563,628748372,'hai','1','2020-12-21 13:42:10','Rey','msg'),
(564,628748372,'kamu mau makan apa disana ?','1','2020-12-21 13:42:17','Rey','msg'),
(565,628748372,'disana bot','1','2020-12-21 13:42:22','Rey','msg'),
(566,628748372,'di warung','1','2020-12-21 13:42:27','Rey','msg'),
(567,628748372,'ada','1','2020-12-21 13:42:30','Rey','msg'),
(568,628748372,'halo','1','2020-12-21 13:56:25','Rey','msg'),
(569,628748372,'clear','1','2020-12-21 13:56:33','Rey','msg'),
(570,628748372,'halo','1','2020-12-21 14:05:35','Rey','msg'),
(571,628748372,'kamu mau makan apa disana','1','2020-12-21 14:05:52','Rey','msg'),
(572,628748372,'kamu mau makan apa di warung bot','1','2020-12-21 14:06:03','Rey','msg'),
(573,628748372,'ada','1','2020-12-21 14:06:06','Rey','msg'),
(574,628748372,'di warung bot','1','2020-12-21 14:06:24','Rey','msg'),
(575,628748372,'disana bot','1','2020-12-21 14:06:32','Rey','msg'),
(576,628748372,'clear','1','2020-12-21 14:06:39','Rey','msg'),
(577,628748372,'Halo','1','2020-12-27 22:33:31','Rey','msg'),
(578,628748372,'kamu mau makan apa disana ?','1','2020-12-27 22:33:46','Rey','msg'),
(579,628748372,'disana bot','1','2020-12-27 22:34:04','Rey','msg'),
(580,628748372,'di warung','1','2020-12-27 22:34:10','Rey','msg'),
(581,628748372,'ada','1','2020-12-27 22:34:18','Rey','msg'),
(582,628748372,'hai','1','2020-12-27 22:34:27','Rey','msg'),
(583,628748372,'clear','1','2020-12-27 22:34:30','Rey','msg'),
(584,628748372,'hai','1','2020-12-27 22:34:34','Rey','msg'),
(585,628748372,'clear','1','2020-12-27 22:34:38','Rey','msg'),
(586,628748372,'kamu mau makan apa di warung bot ?','1','2020-12-27 23:00:21','Rey','msg'),
(587,628748372,'ada','1','2020-12-27 23:00:27','Rey','msg'),
(588,628748372,'Halo','1','2023-08-04 21:10:48','Rey','msg'),
(589,628748372,'Kamu','1','2023-08-04 21:11:04','Rey','msg'),
(590,628748372,'Kamu mau makan di warung?','1','2023-08-04 21:11:49','Rey','msg'),
(591,628748372,'Clear','1','2023-08-04 21:11:54','Rey','msg'),
(592,628748372,'Kamu mau makan di sana?','1','2023-08-04 21:12:00','Rey','msg'),
(593,628748372,'Clear','1','2023-08-04 21:12:44','Rey','msg'),
(594,628748372,'Kamu mau makan diwarung?','1','2023-08-04 21:12:50','Rey','msg'),
(595,628748372,'Clear','1','2023-08-04 21:13:34','Rey','msg'),
(596,628748372,'Kamu mau makan apa di warung bot?','1','2023-08-04 21:13:42','Rey','msg'),
(597,628748372,'Ada','1','2023-08-04 21:14:27','Rey','msg');

/*Table structure for table `tb_jenis` */

DROP TABLE IF EXISTS `tb_jenis`;

CREATE TABLE `tb_jenis` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_kata_spok` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_jenis` */

insert  into `tb_jenis`(`id_jenis`,`jenis_kata_spok`) values 
(1,'Tanya'),
(2,'subjek/objek'),
(4,'predikat'),
(5,'keterangan');

/*Table structure for table `tb_kata` */

DROP TABLE IF EXISTS `tb_kata`;

CREATE TABLE `tb_kata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis` int(11) DEFAULT NULL,
  `kata` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jenis` (`id_jenis`),
  CONSTRAINT `tb_kata_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `tb_jenis` (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_kata` */

insert  into `tb_kata`(`id`,`id_jenis`,`kata`) values 
(1,1,'apa'),
(2,1,'dimana'),
(3,1,'mengapa'),
(4,1,'bagaimana'),
(5,1,'berapa'),
(6,1,'kapan'),
(7,1,'siapa'),
(8,2,'kamu'),
(9,4,'mau'),
(10,4,'makan'),
(11,5,'disana'),
(12,2,'bot'),
(13,5,'warung'),
(14,5,'ada'),
(15,4,'halo'),
(16,4,'hai'),
(17,5,'pagi'),
(18,4,'selamat'),
(19,5,'siang'),
(20,5,'malam');

/*Table structure for table `tb_outbox` */

DROP TABLE IF EXISTS `tb_outbox`;

CREATE TABLE `tb_outbox` (
  `id_outbox` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_inbox` bigint(20) DEFAULT NULL,
  `chat_id` bigint(20) NOT NULL,
  `out_msg` text,
  `flag` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pengirim` varchar(255) NOT NULL,
  `type` enum('msg','file','loc','img') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'msg',
  PRIMARY KEY (`id_outbox`),
  KEY `id_inbox` (`id_inbox`),
  KEY `chat_id` (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4463 DEFAULT CHARSET=latin1;

/*Data for the table `tb_outbox` */

insert  into `tb_outbox`(`id_outbox`,`id_inbox`,`chat_id`,`out_msg`,`flag`,`tgl`,`pengirim`,`type`) values 
(4398,514,628748372,'hai','1','2020-12-21 12:51:09','BOT','msg'),
(4399,515,628748372,'halo','1','2020-12-21 12:51:51','BOT','msg'),
(4400,516,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:51:55','BOT','msg'),
(4401,517,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:52:07','BOT','msg'),
(4402,518,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:52:15','BOT','msg'),
(4403,520,628748372,'hai','1','2020-12-21 12:52:58','BOT','msg'),
(4404,521,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:53:01','BOT','msg'),
(4405,523,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:53:09','BOT','msg'),
(4406,525,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:53:21','BOT','msg'),
(4407,527,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:53:57','BOT','msg'),
(4408,529,628748372,'maksud anda dimana ?','1','2020-12-21 12:54:10','BOT','msg'),
(4409,530,628748372,'maksud anda dimana ?','1','2020-12-21 12:54:16','BOT','msg'),
(4410,531,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:54:20','BOT','msg'),
(4411,533,628748372,'maksud anda dimana ?','1','2020-12-21 12:57:08','BOT','msg'),
(4412,533,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:57:09','BOT','msg'),
(4413,535,628748372,'maksud anda dimana ?','1','2020-12-21 12:57:23','BOT','msg'),
(4414,535,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:57:25','BOT','msg'),
(4415,537,628748372,'hai','1','2020-12-21 12:58:46','BOT','msg'),
(4416,539,628748372,'maksud anda dimana ?','1','2020-12-21 12:58:58','BOT','msg'),
(4417,539,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:58:59','BOT','msg'),
(4418,540,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 12:59:14','BOT','msg'),
(4419,542,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:01:46','BOT','msg'),
(4420,543,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:02:17','BOT','msg'),
(4421,545,628748372,'maksud anda dimana ?','1','2020-12-21 13:02:32','BOT','msg'),
(4422,546,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:02:37','BOT','msg'),
(4423,547,628748372,'ada sate nggak ?','1','2020-12-21 13:02:42','BOT','msg'),
(4424,548,628748372,'okee','1','2020-12-21 13:03:55','BOT','msg'),
(4425,550,628748372,'maksud anda dimana ?','1','2020-12-21 13:04:12','BOT','msg'),
(4426,550,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:04:14','BOT','msg'),
(4427,551,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:04:18','BOT','msg'),
(4428,553,628748372,'maksud anda dimana ?','1','2020-12-21 13:05:54','BOT','msg'),
(4429,554,628748372,'dimana ?','1','2020-12-21 13:06:06','BOT','msg'),
(4430,555,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:06:11','BOT','msg'),
(4431,557,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:17:16','BOT','msg'),
(4432,558,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:17:21','BOT','msg'),
(4433,560,628748372,'hai','1','2020-12-21 13:18:27','BOT','msg'),
(4434,561,628748372,'halo','1','2020-12-21 13:18:32','BOT','msg'),
(4435,563,628748372,'halo','1','2020-12-21 13:42:11','BOT','msg'),
(4436,564,628748372,'maksud anda dimana ?','1','2020-12-21 13:42:19','BOT','msg'),
(4437,565,628748372,'dimana ?','1','2020-12-21 13:42:24','BOT','msg'),
(4438,566,628748372,'ada sate nggak ?','1','2020-12-21 13:42:28','BOT','msg'),
(4439,567,628748372,'okee','1','2020-12-21 13:42:32','BOT','msg'),
(4440,568,628748372,'Mohon maaf Bot tidak tau','1','2020-12-21 13:56:26','BOT','msg'),
(4441,570,628748372,'hai','1','2020-12-21 14:05:37','BOT','msg'),
(4442,571,628748372,'maksud anda dimana ?','1','2020-12-21 14:05:54','BOT','msg'),
(4443,572,628748372,'ada sate nggak ?','1','2020-12-21 14:06:04','BOT','msg'),
(4444,573,628748372,'okee','1','2020-12-21 14:06:08','BOT','msg'),
(4445,574,628748372,'ada sate nggak ?','1','2020-12-21 14:06:26','BOT','msg'),
(4446,575,628748372,'dimana ?','1','2020-12-21 14:06:33','BOT','msg'),
(4447,577,628748372,'hai','1','2020-12-27 22:33:33','BOT','msg'),
(4448,578,628748372,'maksud anda dimana ?','1','2020-12-27 22:33:48','BOT','msg'),
(4449,579,628748372,'dimana ?','1','2020-12-27 22:34:06','BOT','msg'),
(4450,580,628748372,'ada sate nggak ?','1','2020-12-27 22:34:12','BOT','msg'),
(4451,581,628748372,'okee','1','2020-12-27 22:34:19','BOT','msg'),
(4452,582,628748372,'Mohon maaf Bot tidak tau','1','2020-12-27 22:34:28','BOT','msg'),
(4453,584,628748372,'halo','1','2020-12-27 22:34:35','BOT','msg'),
(4454,586,628748372,'ada sate nggak ?','1','2020-12-27 23:00:23','BOT','msg'),
(4455,587,628748372,'okee','1','2020-12-27 23:00:29','BOT','msg'),
(4456,588,628748372,'hai','1','2023-08-04 21:10:49','BOT','msg'),
(4457,589,628748372,'Mohon maaf Bot tidak tau','1','2023-08-04 21:11:05','BOT','msg'),
(4458,590,628748372,'Mohon maaf Bot tidak tau','1','2023-08-04 21:11:50','BOT','msg'),
(4459,592,628748372,'Mohon maaf Bot tidak tau','1','2023-08-04 21:12:01','BOT','msg'),
(4460,594,628748372,'Mohon maaf Bot tidak tau','1','2023-08-04 21:12:51','BOT','msg'),
(4461,596,628748372,'ada sate nggak ?','1','2023-08-04 21:13:52','BOT','msg'),
(4462,597,628748372,'okee','1','2023-08-04 21:14:29','BOT','msg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
