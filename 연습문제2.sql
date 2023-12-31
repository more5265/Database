#날짜 : 2023/06/21
#이름 : 이황성
#내용 : SQL 연습문제2

#실습 2-1 데이터베이스 사용자 만들기

CREATE DATABASE `Bank`;
CREATE USER 'admin2'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `Bank`.* TO 'admin2'@'%';
FLUSH PRIVILEGES;

#실습 2-2 고객(customer), 계좌(account), 거래(transaction) 테이블 만들기

CREATE TABLE `bank_customer` (
	`c_no`		VARCHAR(14) NOT NULL PRIMARY KEY,
	`c_name`		VARCHAR(20) NOT NULL,
	`c_dist`		INT NOT NULL DEFAULT 0,
	`c_phone`	CHAR(20) UNIQUE NOT NULL,
	`c_addr`		VARCHAR(100) DEFAULT NULL
);

CREATE TABLE `bank_account` (
	`a_no`			CHAR(11) PRIMARY KEY,
	`a_item_dist`	VARCHAR(2) NOT NULL,
	`a_item_name`	VARCHAR(20) NOT NULL,
	`a_c_no`			VARCHAR(14) NOT NULL,
	`a_balance`		INT NOT NULL DEFAULT 0,
	`a_open_date`	DATETIME NOT NULL
);

CREATE TABLE `bank_transaction` (
	`t_no`			INT AUTO_INCREMENT PRIMARY KEY,
	`t_a_no`			VARCHAR(11) NOT NULL,
	`t_dist`			INT NOT NULL,
	`t_amount`		INT NOT NULL DEFAULT 0,
	`t_datetime`	DATETIME NOT NULL
);

#실습 2-3
INSERT INTO `bank_customer` VALUES ('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구');
INSERT INTO `bank_customer` VALUES ('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구');
INSERT INTO `bank_customer` VALUES ('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
INSERT INTO `bank_customer` VALUES ('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시');
INSERT INTO `bank_customer` VALUES ('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
INSERT INTO `bank_customer` VALUES ('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
INSERT INTO `bank_customer` VALUES ('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
INSERT INTO `bank_customer` VALUES ('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
INSERT INTO `bank_customer` VALUES ('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');


INSERT INTO `bank_account` VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000, '2005-07-21');
INSERT INTO `bank_account` VALUES ('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000, '2007-02-17');
INSERT INTO `bank_account` VALUES ('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14');
INSERT INTO `bank_account` VALUES ('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30');
INSERT INTO `bank_account` VALUES ('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07');
INSERT INTO `bank_account` VALUES ('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13');
INSERT INTO `bank_account` VALUES ('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15');
INSERT INTO `bank_account` VALUES ('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 12005000, '2009-08-25');
INSERT INTO `bank_account` VALUES ('101-22-1006', 'L2', '에금담보대출', '730423-1000001', 25000, '2013-12-11');
INSERT INTO `bank_account` VALUES ('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');


INSERT INTO `bank_transaction` VALUES (1, '101-11-1001', 1, 50000, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (2, '101-11-1003', 2, 120000, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (3, '101-11-2001', 2, 300000, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (4, '101-12-1002', 1, 1000000, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (5, '101-11-1001', 3, 0, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (6, '101-13-1005', 1, 200000, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (7, '101-11-1001', 1, 450000, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (8, '101-11-2002', 2, 32000, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (9, '101-11-2003', 3, 0, '2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (10, '101-11-1003', 1, 75000, '2022-08-21 04:26:52');


#실습 2-4 [모든 계좌를 조회]
SELECT * FROM `bank_account`;

#실습 2-5 [모든 고객을 조회]
SELECT * FROM `bank_customer`;

#실습 2-6 [모든 거래내역을 조회]
SELECT * FROM `bank_transaction`;

#실습 2-7 [고객의 이름과 계좌번호 조회]
SELECT `c_name`, `c_no` FROM `bank_customer`;

#실습 2-8 [모든 계좌 구분번호와 계좌상품 조회]
SELECT `a_item_dist`, `a_item_name` FROM `bank_account`;

#실습 2-9 [모든 계좌의 구분번호와 계좌상품 이름 조회, 단 중복 제거]
SELECT DISTINCT `a_item_dist`, `a_item_name` FROM `bank_account`;

#실습 2-10 [자유저축예금 계좌 중 잔고액이 100만원 이상을 조회]
SELECT * FROM `bank_account` WHERE `a_balance` >= '1000000' AND `a_item_name`='자유저축예금';

SELECT * FROM `bank_account` WHERE `a_item_dist`='S1' AND `a_balance` >=1000000;

#실습 2-11 [경기도에 거주하는 고객을 조회]
SELECT * FROM `bank_customer` WHERE `c_addr` LIKE '경기%';

#실습 2-12 [기업고객을 조회]
SELECT * FROM `bank_customer` WHERE `c_dist`=2;

#실습 2-13 [거래내역 중 입금만 조회]
SELECT * FROM `bank_transaction` 
WHERE `t_dist`=1 ;

#실습 2-14 [출금액이 가장 큰 순서로 조회]
SELECT * FROM `bank_transaction` 
WHERE `t_dist`=2 
ORDER BY `t_amount` DESC;

#실습 2-15 [입금 금액의 총합과 평균]
SELECT 
SUM(`t_amount`) `입금총합`,
AVG(`t_amount`) `입금평균`
FROM `bank_transaction`
WHERE `t_dist`= 1;

#실습 2-16 [출금액의 가장 큰 금액과 가장 작은 금액]
SELECT 
MAX(`t_amount`) `큰 금액`,
MIN(`t_amount`) `작은 금액`
FROM `bank_transaction`
WHERE `t_dist` = 2;

#실습 2-17 [자유저축 예금계좌에서 큰 잔고액 순으로 조회]
SELECT * 
FROM `bank_account`
WHERE `a_item_dist` = 'S1'
ORDER BY `a_balance` DESC;

#실습 2-18 [가장 많은 잔고를 보유한 자유저축 예금계좌]
SELECT *
FROM `bank_account`
WHERE `a_item_dist` = 'S1'
ORDER BY `a_balance` DESC
LIMIT 1;

SELECT * 
FROM `bank_account`
WHERE `a_balance` = (SELECT MAX(`a_balance`)
FROM `bank_account`
WHERE `a_item_dist`='S1');


#실습 2-19 [ 거래내역에서 입금액과 출금액이 각각 큰 순서로 조회]
SELECT * 
FROM `bank_transaction`
WHERE `t_dist` <= 2
ORDER BY `t_dist`, `t_amount` DESC;
/*WHERE `t_dist` IN(1, 2)
*/

#실습 2-20 [거래내역에서 입금 건수, 출금 건수, 조회 건수를 조회]
SELECT
COUNT(case when `t_dist`='1' then 1 END) AS `입금 건수`,
COUNT(case when `t_dist`='2' then 1 END) AS `출금 건수`,
COUNT(case when `t_dist`='3' then 1 END) AS `조회 건수`
FROM `bank_transaction`;

/*
SELECT
COUNT(if(`t_dist`=1, 1, 0) AS `입금 건수`,
COUNT(if(`t_dist`=2, 1, 0) AS `출금 건수`,
COUNT(if(`t_dist`=3, 1, 0) AS `조회 건수`
FROM `bank_transaction`;
*/

#실습 2-21 [거래내역에서 거래 구분번호를 통해 type을 아래와 같이 조회]
SELECT `t_dist`,
CASE
	WHEN (`t_dist` = 1) THEN '입금'
	WHEN (`t_dist` = 2) THEN '출금'
	WHEN (`t_dist` = 3) THEN '조회'
END AS 'type', 
`t_a_no`,
`t_amount`
FROM `bank_transaction`;

#실습 2-22 [각 거래별 카운드]
SELECT `t_dist`,
COUNT(`t_no`)
FROM `bank_transaction`
GROUP BY `t_dist`;


#실습 2-23 [입금 거래만 계좌별로 합계를 조회]
SELECT `t_a_no`, `t_dist`, SUM(`t_amount`)
FROM `bank_transaction`
WHERE `t_dist` = 1
GROUP BY `t_a_no`
ORDER BY `t_a_no`;

#실습 2-24 [입금 거래만 계좌별로 합계 구하고 10만원 이상만 큰 순서대로]
SELECT `t_a_no`, `t_dist`, 
	SUM(`t_amount`) AS `합계`
	FROM `bank_transaction`
	WHERE `t_dist`=1
	GROUP BY `t_a_no` HAVING `합계`>=100000
	ORDER BY `합계` DESC; 

#실습 2-25 [계좌 테이블과 고객 테이블을 결합]
SELECT * 
FROM `bank_account` AS a
JOIN `bank_customer` AS b
ON a.a_c_no = b.c_no;


#실습 2-26 [그림과 같이 조회]
SELECT 
	`a_no`			AS `계좌번호`,
	`a_item_name`	AS `계좌이름`,
	`c_no`			AS `주민번호(사업자번호)`,
	`c_name`			AS `고객명`,
	`a_balance`		AS `현재잔액`
FROM `bank_account` AS a
JOIN `bank_customer` AS b
ON a.a_c_no = b.c_no;

#실습 2-27
SELECT * FROM `bank_transaction` AS a
JOIN `bank_account` AS b
ON a.t_a_no = b.a_no;

#실습 2-28
SELECT 
	`t_no` AS `거래번호`,
	`t_a_no` AS `계좌번호`,
	`a_c_no` AS `고객번호(주민번호)`,
	`t_dist` AS `거래구분`,
	`t_amount` AS `거래금액`,
	`t_datetime` AS `거래일자`
FROM `bank_account` AS a
JOIN `bank_transaction` AS b
ON a.a_no = b.t_a_no;

#실습 2-29
SELECT 
	`t_no`,
	`a_no`,
	`c_no`,
	`t_dist`,
	`a_item_name`,
	`c_name`,
	`t_amount`,
	`t_datetime`
FROM `bank_transaction` AS a
JOIN `bank_account` AS b ON a.t_a_no = b.a_no
JOIN `bank_customer` AS c ON b.a_c_no = c.c_no
WHERE `t_dist` = 1
ORDER BY `t_amount` DESC;


#실습 2-30 [거래구분이 입금, 출금이고 개인 고객을 대상으로 거래건수를 아래와 같이 조회하시오
#				단, 거래구분은 작은 순서로, 거래건수는 큰순서로 정렬하시오.
#참고 https://bcdragonfly.tistory.com/8
SELECT
	ANY_VALUE(`t_no`),
	ANY_VALUE(`a_no`),
	`c_no`,
	ANY_VALUE(`t_dist`) AS `구분`,
	ANY_VALUE(`a_item_name`),
	ANY_VALUE(`c_name`), 
	COUNT(`t_no`) AS `거래건수`
	FROM `bank_transaction` AS a 
	JOIN `bank_account` AS b ON a.t_a_no = b.a_no
	JOIN `bank_customer` AS c ON b.a_c_no = c.c_no
	WHERE `t_dist` IN(1, 2) AND `c_dist` = 1
	GROUP BY `c_no`
	ORDER BY `구분`, `거래건수` DESC;




SELECT
	`a_no`,
	`c_no`,
	`a_item_name`,
	`c_name`, COUNT(`t_no`) AS `거래건수`
	FROM `bank_transaction` AS t
JOIN
    `bank_account` AS b ON t.t_a_no = b.a_no
JOIN
    `bank_customer` AS c ON b.a_c_no = c.c_no
    
	WHERE `t_dist` IN(1, 2) AND `c_dist` = 1
	GROUP BY  c_no, c_name,  a_no
	ORDER BY  `거래건수` DESC;




/**
COUNT
FROM
JOIN
JOIN
WHERE IN AND
GROUP BY
ORDER BY DESC;
**/
SELECT
