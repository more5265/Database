#날짜 : 2023/06/16
#이름 : 이황성
#내용 : 2.테이블 제약조건 실습

#실습2-1

CREATE TABLE `User2` (
	`uid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13),
	`age`		INT
	);

#실습2-2
INSERT INTO `User2` VALUES ('1', '김유신', '010-1234-1001', 35);
INSERT INTO `User2` VALUES ('2', '김민재', '010-1234-1002', 26);
INSERT INTO `User2` VALUES ('3', '김상식', '010-1234-1003', 50);
INSERT INTO `User2` VALUES ('4', '김문환', '010-1234-1004', 31);


#실습2-3
CREATE TABLE `User3` (
	`uid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) UNIQUE,
	`age`		INT
	);


#실습2-4
INSERT INTO `User3` VALUES ('1', '김유신', '010-1234-1001', 35);
INSERT INTO `User3` VALUES ('2', '김민재', '010-1234-1001', 31);
INSERT INTO `User3` VALUES ('3', '김상식', '010-1234-1002', 36);
INSERT INTO `User3` VALUES ('4', '김문환', '010-1234-1003', 38);


#실습2-5
CREATE TABLE `Parent` (
	`pid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) UNIQUE
	);
	
CREATE TABLE `Child` (
	`cid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13) UNIQUE,
	`pid`		VARCHAR(10),
	FOREIGN KEY (`pid`) REFERENCES `parent` (`pid`)
	);

DROP TABLE `parent`;
DROP TABLE `Child`;
#실습2-6
INSERT INTO `Parent` VALUES ('p101', '김기덕', '010-1234-1111');
INSERT INTO `Parent` VALUES ('p102', '정명훈', '010-1234-2222');

INSERT INTO `Child` VALUES ('1', '김기훈', '010-1234-1001', 'p101');
INSERT INTO `Child` VALUES ('2', '정지훈', '010-1234-1002', 'p102');

#실습2-7
CREATE TABLE `User4` (
	`seq`		INT AUTO_INCREMENT PRIMARY KEY,
	`name`	VARCHAR(10),
	`gender` TINYINT,
	`age`		INT,
	`addr`	VARCHAR(255)
	);

#실습2-8


#실습2-9
CREATE TABLE `User5` (
	`name`		VARCHAR(10) NOT NULL,
	`gender`		TINYINT,
	`age`			INT DEFAULT 1,
	`addr`		VARCHAR(10)
	);

#실습2-10


#실습2-11
ALTER TABLE `User5` ADD `hp` VARCHAR(20);
ALTER TABLE `User5` ADD `birth` CHAR(10) DEFAULT '0000-00-00' AFTER `name`;

#실습2-12
ALTER TABLE `User5` MODIFY `hp` CHAR(13);
ALTER TABLE `User5` MODIFY `age` TINYINT;

#실습2-13
ALTER TABLE `User5` CHANGE COLUMN `addr` `address` VARCHAR(100);

#실습2-14
ALTER TABLE `USER5` DROP `gender`;

#실습2-15
CREATE TABLE `User6` LIKE `USER5`;

#실습2-16
INSERT INTO `User6` SELECT * FROM `User5`;