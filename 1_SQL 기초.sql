#날짜 : 2023/06/16
#이름 : 이황성
#내용 : 1.SQL 기본 실습

# 자료형
# SQL 데이터 형식은 크게 숫자, 문자, 날짜(시간) 데이터 형식 3가지로 나눔
# TINYINT (매우작은정수, -128~127), INT (일반정수)
# CHAR (고정형 문자열) VARCHAR (가변형 문자열)
# DATE (날짜) YEAR (년도) TIME (시간) DATETIME (날짜와 시간)
#실습1-1 데이터베이스 생성 및 제거
CREATE DATABASE `UserDB`;
DROP DATABASE `UserDB`;

#실습1-2 테이블 생성 및 제거
CREATE TABLE `User1` (
	`uid`		VARCHAR(10),
	`name`	VARCHAR(10),
	`hp`		CHAR(13),
	`age`		INT
	);
	
DROP TABLE `TblUser`;

#실습1-3 테이블에 데이터 추가
# INSERT INTO `테이블명` VALUES (데이터1, 데이터2, ...);

INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '김유신', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', '45');
INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';


#실습1-4 테이블에 데이터 조회
# 모든 데이터 조회 SELECT * FROM `테이블명`;
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;

# SELECT `칼럼명`, `칼럼명2`, ... FROM `테이블명` WHERE 조건;
SELECT `uid`, `name`, `age` FROM `User1`;

#실습1-5 데이터 수정

#조건에 일치하는 레코드만 수정
# UPDATE `테이블명` SET `칼럼명`='데이터'.... WHERE 조건;
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age` = 51 WHERE `uid` = 'A105';
UPDATE `User1` SET `hp` = '010-1234-1001', `age` = 27 WHERE `uid` = 'A101';

#실습1-6 테이블에 데이터 삭제
DELETE FROM `User1` WHERE `uid` = 'A101';
DELETE FROM `User1` WHERE `uid` = 'A102' AND `age`=25;
DELETE FROM `User1` WHERE `age` >= 30;


#실습1-7
CREATE TABLE `TblUser` (
	`userId`		VARCHAR(10),
	`userName`	VARCHAR(10),
	`userHp`		CHAR(13),
	`userAge`	TINYINT,
	`userAddr`	VARCHAR(20)
);
	
CREATE TABLE `TblProduct` (
	`prdCode`		INT,
	`prdName`		VARCHAR(10),
	`prdPrice`		INT,
	`prdAmount`		INT,
	`prdCompany`	VARCHAR(10),
	`prdMakeDate`	DATE
);
	

#실습1-8
INSERT INTO `TblUser` VALUES ('p101', '김유신', '010-1234-1001', 25, '서울시 중구');
INSERT INTO `TblUser` VALUES ('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구');
INSERT INTO `TblUser` (`userId`, `userName`, `userAge`, `userAddr`) VALUES ('p103', '장보고', '31', '경기도 광주군');
INSERT INTO `TblUser` (`userId`, `userName`, `userAddr`) VALUES ('p104', '강감찬', '경남 창원시');
INSERT INTO `TblUser` SET `userId`='p105', `userName`='이순신', `userHp`='010-1234-1005', `userAge`='50';

INSERT INTO `TblProduct` VALUES (1, '냉장고', 800, 10, 'LG', '2022-01-06');
INSERT INTO `TblProduct` VALUES (2, '노트북', 1200, 20, '삼성', '2022-01-06');
INSERT INTO `TblProduct` VALUES (3, 'TV', 1400, 6, 'LG', '2022-01-06');
INSERT INTO `TblProduct` VALUES (4, '세탁기', 1000, 8, 'LG', '2022-01-06');
INSERT INTO `TblProduct` (`prdCode`, `prdName`, `prdPrice`, `prdAmount`) VALUES (5, '컴퓨터', 1100, 0);
INSERT INTO `TblProduct` VALUES (6, '휴대폰', 900, 102, '삼성', '2022-01-06');



#실습1-9

SELECT * FROM `TblUser`;
SELECT `userName` FROM `TblUser`;
SELECT `userName`, `userHp` FROM `TblUser`;
SELECT * FROM `TblUser` WHERE `userId` = 'p102';
SELECT * FROM `TblUser` WHERE `userId` = 'p104' OR `userId` = 'p105';
SELECT * FROM `TblUser` WHERE `userAddr`= '부산시 금정구';
SELECT * FROM `TblUser` WHERE `userAge` > 30;
SELECT * FROM `TblUser` WHERE `userHP` IS NULL;
UPDATE `TblUser` SET `userAge` = 42 WHERE `userID`='p104';
UPDATE `TblUser` SET `userAddr` = '경남 김해시' WHERE `userId` = 'p105';
DELETE FROM `TblUser` WHERE `userId`='p103';

