#날짜 : 2023/06/23
#이름 : 이황성
#내용 : SQL 연습문제3


#실습 4-1
CREATE DATABASE `BookStore`;
CREATE USER 'admin4'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.* TO 'admin4'@'%';
FLUSH PRIVILEGES;

#실습 4-2
DROP TABLE `Customer`;
CREATE TABLE `Customer` (
	`custId`		INT AUTO_INCREMENT PRIMARY KEY,
	`name`		VARCHAR(10) NOT NULL,
	`address`	VARCHAR(20) DEFAULT NULL,
	`phone`		CHAR(13) DEFAULT NULL
);
DROP TABLE `Book`;
CREATE TABLE `Book` (
	`bookId`		INT PRIMARY KEY,
	`bookName`	VARCHAR(20) NOT NULL,
	`publisher`	VARCHAR(20) NOT NULL,
	`price`		INT DEFAULT NULL
);

CREATE TABLE `Order` (
	`orderId`	INT AUTO_INCREMENT PRIMARY KEY,
	`custId`		INT NOT NULL,
	`bookId`		INT NOT NULL,
	`salePrice`	INT NOT NULL,
	`orderDate`	DATE NOT NULL
);


#실습 4-3 [데이터 입력]
INSERT INTO `Customer` VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO `Customer` VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO `Customer` VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer` VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer`(`custId`, `name`, `address`) VALUES (5, '박세리', '대한민국 대전');

INSERT INTO `Book` VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자', '나무수', 13000);
INSERT INTO `Book` VALUES (3, '축구의 이해', '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블', '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO `Book` VALUES (7, '야구의 추억', '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO `Order` VALUES (1, 1, 1, 6000, '2014-07-01');
INSERT INTO `Order` VALUES (2, 1, 3, 21000, '2014-07-03');
INSERT INTO `Order` VALUES (3, 2, 5, 8000, '2014-07-03');
INSERT INTO `Order` VALUES (4, 3, 6, 6000, '2014-07-04');
INSERT INTO `Order` VALUES (5, 4, 7, 20000, '2014-07-05');
INSERT INTO `Order` VALUES (6, 1, 2, 12000, '2014-07-07');
INSERT INTO `Order` VALUES (7, 4, 8, 13000, '2014-07-07');
INSERT INTO `Order` VALUES (8, 3, 10, 12000, '2014-07-08');
INSERT INTO `Order` VALUES (9, 2, 10, 7000, '2014-07-09');
INSERT INTO `Order` VALUES (10, 3, 8, 13000, '2014-07-10');

#실습 4-4 [모든 회원의 회원번호, 이름, 주소를 조회]
SELECT `custId`,`name`,`address`FROM `Customer`;

#실습 4-5 [모든 도서의 이름과 가격을 조회]
SELECT `bookname`,`price` FROM `book`;

#실습 4-6 [모든 도서의 가격과 이름 조회]
SELECT `price`,`bookname` FROM `book`;

#실습 4-7 [모든 도서의 도서번호, 도서이름, 출판사, 가격 조회]
SELECT * FROM `Book`;

#실습 4-8 [도서 테이블에 있는 모든 출판사 조회]
SELECT `publisher` FROM `Book`;

#실습 4-9 [도서 테이블에 있는 모든 출판사'를 중복 제거하고 조회]
SELECT DISTINCT `publisher` FROM `Book`;

#실습 4-10 [가격이 20,000원 이상인 도서 조회]
SELECT * FROM `Book` WHERE `price` >=20000;

#실습 4-11 [가격이 20,000원 미만인 도서 조회]
SELECT * FROM `Book` WHERE `price` < 20000;

#실습 4-12 [가격이 10,000원 이상 20,000 이하인 도서 조회]
SELECT * FROM `Book` WHERE `price` >= 10000 AND `price` <= 20000; 

#실습 4-13 [가격이 15,000원 이상 30000 이하인  도서의 도서번호, 도서명, 도서가격 조회]
SELECT `bookId`,`bookname`,`price` FROM `Book` WHERE `price` >=15000 AND `price` <=30000;

#실습 4-14 [도서번호가 2, 3, 5인 도서를 조회]
SELECT * FROM `Book` WHERE `bookId`=2 OR `bookId`=3 OR `bookId`=5;
SELECT * FROM `Book` WHERE `bookId` IN(2, 3, 5);

#실습 4-15 [도서번호가 짝수번호인 도서를 조회]
SELECT * FROM `Book` WHERE `bookId` % 2 =0;
SELECT * FROM `Book` WHERE MOD(bookId, 2) =0;

#실습 4-16 [박씨 성 고객 조회]
SELECT * FROM `Customer` WHERE `name` LIKE '박%';

#실습 4-17 [대한민국 거주 고객 조회]
SELECT * FROM  `Customer` WHERE `address` LIKE '대한민국%';

#실습 4-18 [휴대폰 번호가 유효한 고객만 조회]
SELECT * FROM `Customer` WHERE `phone` IS NOT NULL;

#실습 4-19 [출판사가 `굿스포츠` 혹은 `대한미디어` 인 도서 조회]
SELECT * FROM `Book` WHERE `publisher` IN ('굿스포츠','대한미디어');

#실습 4-20 [축구의 역사를 출간한 출판사 조회]
SELECT `publisher` FROM `Book` WHERE `bookname`='축구의 역사';

#실습 4-21 [도서이름에 축구가 포함된 출판사 조회]
SELECT `publisher` FROM `Book` WHERE `bookname` LIKE '축구%';

#실습 4-22 [도서이름 왼쪽 두 번째 위치에 구 라는 문자열을 갖는 도서를 조회]
SELECT * FROM `Book` WHERE `bookname` LIKE '_구%';

#실습 4-23 [축구에 관한 도서 중 가격이 20,000원 이상인 도서]
SELECT * FROM `Book` WHERE `bookname` LIKE '축구%' AND `price` >=20000;

#실습 4-24 [도서를 이름순으로 조회]
SELECT * FROM `Book` ORDER BY `bookname` ASC;

#실습 4-25 [도서를 가격순으로, 가격이 같으면 이름순으로 조회]
SELECT * FROM `Book` ORDER BY `price` ASC , `bookname` ASC;

#실습 4-26 [도서를 가격의 내림차순 조회. 가격이 같다면 출판사를 오름차순으로 조회]
SELECT * FROM `Book` ORDER BY `price` DESC, `publisher` ASC;

#실습 4-27 [도서가격이 큰 1, 2, 3위 도서를 조회]
SELECT * 
FROM `Book` 
ORDER BY `price` DESC
LIMIT 3;

#실습 4-28 [도서가격이 작은 1, 2, 3위 도서를 조회]
SELECT * 
FROM `Book` 
ORDER BY `price` ASC
LIMIT 3;
#실습 4-29 [고객이 주문한 도서의 총 판매액을 조회]
SELECT
SUM(`salePrice`) AS `총판매액`
FROM `Order`;

#실습 4-30 [고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 조회]
SELECT 
SUM(`salePrice`) AS `총판매액`,
AVG(`salePrice`) AS `평균값`,
MIN(`salePrice`) AS `최저가`,
MAX(`salePrice`) AS `최고가`
FROM `Order`;

#실습 4-31 [도서 판매 건수를 조회]
SELECT 
COUNT(`orderId`) AS `판매건수`
FROM `Order`;

#실습 4-32 [도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 조회]
UPDATE `Book` SET `bookName` = REPLACE(`bookName`, '야구', '농구');

UPDATE `Book` SET `bookName` = REPLACE(`bookName`, '농구', '야구');

SELECT `bookid` REPLACE(`bookname`,'농구', '야구') AS `bookname`, `publisher`, `price`
FROM `book`;

SELECT * FROM `Book`;

#실습 4-33 
/*[8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문도서의 총 수량 조회
단 두 권 이상 구매한 고객만 조회할 것*/

SELECT `custId`, COUNT(`custId`) AS `수량`
FROM `Order`
WHERE `salePrice`>=8000
GROUP BY custId
HAVING 수량  >= 2;

#실습 4-34 [고객과 고객의 주문에 관한 데이터를 모두 조회]
SELECT *
FROM `Customer` AS a
JOIN `Order` AS b
ON a.custId = b.custId;

SELECT *
FROM `Customer` AS a
JOIN `Order` AS b
USING(`custId`);

SELECT * FROM `Customer` a, `Order` b
WHERE a.custId = b.custId;

#실습 4-35 [고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 조회]
SELECT *
FROM `Customer` AS a
JOIN `Order` AS b
ON a.custId = b.custId
ORDER BY b.custId ASC;

#실습 4-36 [고객의 이름과 고객이 주문한 도서의 판매가격 조회]
SELECT `name`,`saleprice`
FROM `Customer` AS a
JOIN `Order` AS b
USING(`custId`);

#실습 4-37 [고객별로 주문한 모든 도서의 총 판매액을 조회하고, 고객별로 정렬하시오]
SELECT `name`, SUM(`saleprice`)
FROM `customer` AS a
JOIN `Order` AS b
ON a.custId = b.custId
GROUP BY a.custId
ORDER BY `name`;

#실습 4-38 [고객의 이름과 고객이 주문한 도서의 이름을 조회]
SELECT `name`, `bookname`
FROM `customer` AS a
JOIN `order` AS b
ON a.custId = b.custId
JOIN `Book` AS c
ON b.bookId = c.bookId;

#실습 4-39 [가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름 조회]
SELECT `name`, `bookname`
FROM `customer` AS a
JOIN `order` AS b
ON a.custId = b.custId
JOIN `book` AS c
ON b.bookId = c.bookId
WHERE c.price =20000;

#실습 4-40 [도서를 구매하지 않은 고객을 포함해서 고객명과 주문한 도서의 판매가격 조회]
SELECT `name`, `saleprice`
FROM `customer` AS a
LEFT JOIN `order` AS b
ON a.custId = b.custId; 

#실습 4-41 [김연아 고객이 주문한 도서의 총 판매액을 조회]
SELECT 
SUM(`saleprice`) AS `총매출`
FROM `customer` AS a
JOIN `order` AS b ON a.custId = b.custId
WHERE `name` = '김연아';

SELECT SUM(`saleprice`) AS `총매출`
FROM `Order`
WHERE `custId`=(SELECT `custId` FROM `Customer` WHERE `name`='김연아');

#실습 4-42 [가장 비싼 도서의 이름 조회]
SELECT `bookname` FROM `book` ORDER BY `price` DESC LIMIT 1;

SELECT `bookname` FROM `book` WHERE `price`=(SELECT MAX(`price`) FROM `Book`);

#실습 4-43 [도서를 주문하지 않은 고객의 이름을 조회]
SELECT `name`
FROM `customer` AS a
LEFT JOIN `order` AS b ON a.custId = b.custId
WHERE orderId IS NULL;

SELECT `name`
FROM `Customer`
WHERE `custId` NOT IN(SELECT DISTINCT `custId` FROM `Order`);

#실습 4-44 [book 테이블에 새로운 도서 `스포츠 의학`을 삽입
#스포츠 의학은 한솔의학서적 에서 출간했으며 가격은 미정이다.
INSERT INTO `Book`(`bookId`, `bookName`, `publisher`) VALUES (11, '스포츠의학', '한솔의학서적');
SELECT * FROM `book`;

#실습 4-45 [customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오
UPDATE `customer` SET `address`='대한민국 부산' WHERE `name` = '박세리';
SELECT * FROM `customer`;

#실습 4-46 [customer 테이블에서 고객번호가 5인 고객을 삭제
DELETE FROM `customer` WHERE `custId`='5';

INSERT INTO `Customer`(`custId`, `name`, `address`) VALUES (5, '박세리', '대한민국 대전');


