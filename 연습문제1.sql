#날짜 : 2023/06/20
#이름 : 이황성
#내용 : SQL 연습문제 1

#실습1-1 [실습 데이터베이스와 사용자를 생성]

CREATE DATABASE `Shop`;
CREATE USER 'admin1'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Shop.* TO 'admin1'@'%';
FLUSH PRIVILEGES;

#실습1-2 [표를 참고하여 테이블 생성]
CREATE TABLE `Customer` (
	`custId`		VARCHAR(10) PRIMARY KEY,
	`name`		VARCHAR(10) NOT NULL,
	`hp`			CHAR(13) DEFAULT NULL,
	`addr`		VARCHAR(100) DEFAULT NULL,
	`rdate`		DATE NOT NULL
);

CREATE TABLE `Product` (
	`prodNo`		INT PRIMARY KEY,
	`prodName`	VARCHAR(10) NOT NULL,
	`stock`		INT NOT NULL DEFAULT 0,
	`price`		INT DEFAULT NULL,
	`company`	VARCHAR(20) NOT NULL
);
	
CREATE TABLE `Order` (
	`orderNo`		INT PRIMARY KEY,
	`orderId`		VARCHAR(10) NOT NULL,
	`orderProduct`	INT NOT NULL,
	`orderCount`	INT NOT NULL DEFAULT 1,
	`orderDate`		DATETIME NOT NULL
);

#실습1-3 [그림과 같이 테이블에 데이터를 입력]
INSERT INTO `Customer` VALUES ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
INSERT INTO `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
INSERT INTO `Customer` VALUES ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
INSERT INTO `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
INSERT INTO `Customer` (`custId`, `name`, `rdate`) VALUES ('c105', '이성계', '2022-01-05');
INSERT INTO `Customer` VALUES ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
INSERT INTO `Customer` (`custId`, `name`, `rdate`) VALUES ('c107', '허준', '2022-01-07');
INSERT INTO `Customer` VALUES ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
INSERT INTO `Customer` VALUES ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
INSERT INTO `Customer` VALUES ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');


INSERT INTO `Product` VALUES (1, '새우깡', 5000, 1500, '농심');
INSERT INTO `Product` VALUES (2, '초코파이', 2500, 2500, '오리온');
INSERT INTO `Product` VALUES (3, '포카칩', 3600, 1700, '오리온');
INSERT INTO `Product` VALUES (4, '양파링', 1250, 1800, '농심');
INSERT INTO `Product` (`prodNo`, `prodName`, `stock` ,`company`) VALUES (5, '죠리퐁', 2200, '크라운');
INSERT INTO `Product` VALUES (6, '마카렛트', 3500, 3500, '롯데');
INSERT INTO `Product` VALUES (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');


INSERT INTO `Order` VALUES (1, 'c102', 3, 2, '2022-07-01 13:15:10');
INSERT INTO `Order` VALUES (2, 'c101', 4, 1, '2022-07-01 14:16:11');
INSERT INTO `Order` VALUES (3, 'c108', 1, 1, '2022-07-01 17:23:18');
INSERT INTO `Order` VALUES (4, 'c109', 6, 5, '2022-07-02 10:46:36');
INSERT INTO `Order` VALUES (5, 'c102', 2, 1, '2022-07-03 09:15:37');
INSERT INTO `Order` VALUES (6, 'c101', 7, 3, '2022-07-03 12:35:12');
INSERT INTO `Order` VALUES (7, 'c110', 1, 2, '2022-07-03 16:55:36');
INSERT INTO `Order` VALUES (8, 'c104', 2, 4, '2022-07-04 14:23:23');
INSERT INTO `Order` VALUES (9, 'c102', 1, 3, '2022-07-04 21:54:34');
INSERT INTO `Order` VALUES (10, 'c107', 6, 1, '2022-07-05 14:21:03');


#실습1-4 [고객 테이블에 존재하는 모든 속성을 조회]
SELECT * FROM `Customer`;

#실습1-5 [고객 테이블에서 고객 아이디, 이름,  휴대폰 번호를 조회]
SELECT `custId`, `name`, `hp` FROM `Customer`;

#실습1-6 [제품 테이블에 존재하는 모든 속성을 조회]
SELECT * FROM `Product`;

#실습1-7 [제품 테이블에서 제조업체를 조회]
SELECT `company` FROM `Product`;

#실습1-8 [제품 테이블에서 제조업체를 중복 없이 조회]
SELECT DISTINCT `company` FROM `Product`;

#실습1-9 [제품 테이블에서 제품명과 단가를 조회]
SELECT `prodName`, `price` FROM `Product`;

#실습1-10 [제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 `조정단가`를 출력'
SELECT `prodName`, `price` + 500 AS '조정단가' FROM `Product`;

#실습1-11 [제품 테이블에서 오리온이 제조한 제품의 제품명, 재고량, 단가를 조회]
SELECT `prodName`, `stock`, `price` FROM `Product` 
WHERE `company`='오리온' ;

#실습1-12 [주문 테이블에서 `c102` 고객이 주문한 주문제품, 수량, 주문일자를 조회
SELECT `orderProduct`, `orderCount`, `orderDate` 
FROM `Order` WHERE `orderid`='c102';

#실습1-13 [주문 테이블에서 `c102` 고객이 2개이상 주문한 주문제품, 수량, 주문일자를 조회]#
SELECT `orderProduct`, `orderCount`, `oderdate` 
FROM `Order` 
WHERE `orderid`='c102'
AND `ordercount` >= 2;

#실습1-14 [제품 테이블에서 단가가 1000원 이상 2000원 이하인 제품을 조회]
SELECT * FROM `Product` 
WHERE `price` >= 1000 AND `price` <= 2000;

#실습1-15 [고객 테이블에서 성이 김씨인 고객의 아이디, 이름, 휴대폰, 주소를 조회]
SELECT `custid`, `name`, `hp`, `addr` FROM `customer` 
WHERE `name` LIKE '김%';

#실습1-16 [ 고객 테이블에서 고객 이름이 2자인 고객의 아이디, 이름, 휴대폰, 주소를 조회]
SELECT `custid`, `name`, `hp`, `addr` FROM `customer` 
WHERE `name` LIKE '__';

#실습1-17 [고객 테이블에서 휴대폰 번호가 입력되지 않은 고객을 조회]#
SELECT * FROM `Customer` WHERE `hp` IS NULL;

#실습1-18 [ 고객 테이블에서 주소가 입력된 고객 ]#
SELECT * FROM `Customer` WHERE `addr` is NOT NULL;

#실습1-19 [고객 테이블에서 가입일을 내림차순으로 정렬하여 고객을 조회]
SELECT * FROM `Customer` ORDER BY `rdate` DESC;

#실습1-20 [주문 테이블, 수량3개이상인 주문애용 조회. 단, 수량은 내림차순, 같으면 제품번호 기준 오름차순]#
SELECT * FROM `Order` WHERE `orderCount` >= 3 
order BY `orderCount` DESC, `orderproduct` ASC;

#실습1-21 [제품 테이블에서 모든 제품의 단가 평균]
SELECT AVG(`price`) AS `평균` FROM `Product`;

#실습1-22 [농심에서 제조한 제품의 재고량 합계]
SELECT SUM(`stock`) AS `재고량 합계` FROM `Product` WHERE `company` = '농심';

#실습1-23 [고객 테이블에 고객이 몇 명 등록되어 있는지 조회]
SELECT COUNT(`custid`)AS `고객수` FROM `Customer`;

#실습1-24 [제품 테이블에서 제조업체의 수를 조회]
SELECT COUNT(DISTINCT `company`) AS `제조업체 수` FROM `Product`;

#실습1-25 [주문 테이블에서 주문제품별 수량의 합계]
SELECT  
	`orderProduct` AS `주문 상품번호`, 
	SUM(`ordercount`) AS `총 주문수량` 
	FROM `Order`
	GROUP BY `orderproduct`
	order BY `주문 상품번호`;

#실습1-26 [제품 테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가를 조회]
SELECT `company` AS `제조업체`, 
	COUNT(*) `제품수`, 
	MAX(`price`) AS `최고가` 
	FROM `Product` 
	GROUP BY `company` 
	order BY `company` ;

#실습1-27 [제품 테이블에서 제품을 2개 이상 제조한 제조업체별로 제품의 개수 및 가장 비싼 단가 조회]
SELECT 
	`company` AS `제조업체`, 
	COUNT(*) AS `제품수`, 
	MAX(`price`) AS `최고가`
FROM `product` 
GROUP BY `company` 
HAVING `제품수`>=2 ;

#실습1-28 [ 주문 테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 주문 제품별로 조회]
SELECT 
	`orderProduct`, 
	`orderId`,
	SUM(`orderCount`) AS `총 주문수량` 
FROM `ORDER`
GROUP BY `orderproduct`, `orderid`
order BY`orderproduct`;

#실습1-29 [`c102` 고객이 주문한 제품의 이름을 조회하시오.
SELECT `orderId`, `prodName` FROM `Order` AS a
JOIN `product` AS b
ON a.orderProduct = b.prodNo
WHERE `orderid` = 'c102';

#실습1-30 [주문일자 7월3일인 고객아이디, 이름, 상품명, 주문 날짜시간 조회
SELECT `orderId`, `name`, `prodName`, `orderDate` FROM `Order` AS a
JOIN `Customer` AS b ON a.orderId = b.custId
JOIN `Product` AS c ON a.orderproduct = c.prodNo
WHERE SUBSTR(`orderDate`, 1, 10) = '2022-07-03';