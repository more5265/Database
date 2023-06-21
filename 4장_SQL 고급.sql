#날짜 : 2023/06/16
#이름 : 이황성
#내용 : 4.SQL 고급 실습하기

#실습4-1
# 오름차순 ASC  내림차순 DESC
# FROM 테이블명 ORDER BY 기준_칼럼명 ASC
CREATE TABLE `Member` (
	`uid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`		VARCHAR(13) NOT NULL,
	`pos`		VARCHAR(10) NOT NULL,
	`dep`		INT NOT NULL,
	`rdate`	DATETIME NOT NULL
	);
DROP TABLE `Department`;
CREATE TABLE `Department` (
	`depNo`	INT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`		VARCHAR(13) NOT NULL
	);
	
CREATE TABLE `Sales` (
	`seq`		INT PRIMARY KEY AUTO_INCREMENT,
	`uid`		VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	INT NOT NULL,
	`sale` INT NOT NULL
	);
#실습4-2

INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', 101, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사원', 101, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', 102, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', 102, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', 103, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1007', '차장', 103, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1008', '부장', 104, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1009', '부장', 104, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a110', '정약용', '010-1234-1010', '사원', 105, '2023-06-16 16:00:05');
INSERT INTO `Member` VALUES ('a111', '박지원', '010-1234-1011', '사원', 105, '2023-06-16 16:00:05');

INSERT INTO `Department`VALUES ('101', '영업1부', '051-512-1001');
INSERT INTO `Department`VALUES ('102', '영업2부', '051-512-1002');
INSERT INTO `Department`VALUES ('103', '영업3부', '051-512-1003');
INSERT INTO `Department`VALUES ('104', '영업4부', '051-512-1004');
INSERT INTO `Department`VALUES ('105', '영업5부', '051-512-1005');
INSERT INTO `Department`VALUES ('106', '영업지원부', '051-512-1006');
INSERT INTO `Department`VALUES ('107', '인사부', '051-512-1007');

INSERT INTO `Sales` VALUES ('1', 'a101', 2018, 1, 98100);
INSERT INTO `Sales` VALUES ('2', 'a102', 2018, 1, 136000);
INSERT INTO `Sales` VALUES ('3', 'a103', 2018, 1, 80100);
INSERT INTO `Sales` VALUES ('4', 'a104', 2018, 1, 78000);
INSERT INTO `Sales` VALUES ('5', 'a105', 2018, 1, 93000);

INSERT INTO `Sales` VALUES ('6', 'a101', 2018, 2, 23500);
INSERT INTO `Sales` VALUES ('7', 'a102', 2018, 2, 126000);
INSERT INTO `Sales` VALUES ('8', 'a103', 2018, 2, 18500);
INSERT INTO `Sales` VALUES ('9', 'a105', 2018, 2, 19000);
INSERT INTO `Sales` VALUES ('10', 'a106', 2018, 2, 53000);

INSERT INTO `Sales` VALUES ('11', 'a101', 2019, 1, 24000);
INSERT INTO `Sales` VALUES ('12', 'a102', 2019, 1, 109000);
INSERT INTO `Sales` VALUES ('13', 'a103', 2019, 1, 101000);
INSERT INTO `Sales` VALUES ('14', 'a104', 2019, 1, 53500);
INSERT INTO `Sales` VALUES ('15', 'a107', 2019, 1, 24000);

INSERT INTO `Sales` VALUES ('16', 'a102', 2019, 2, 160000);
INSERT INTO `Sales` VALUES ('17', 'a103', 2019, 2, 101000);
INSERT INTO `Sales` VALUES ('18', 'a104', 2019, 2, 43000);
INSERT INTO `Sales` VALUES ('19', 'a105', 2019, 2, 24000);
INSERT INTO `Sales` VALUES ('20', 'a106', 2019, 2, 109000);

INSERT INTO `Sales` VALUES ('21', 'a102', 2020, 1, 201000);
INSERT INTO `Sales` VALUES ('22', 'a104', 2020, 1, 63000);
INSERT INTO `Sales` VALUES ('23', 'a105', 2020, 1, 74000);
INSERT INTO `Sales` VALUES ('24', 'a106', 2020, 1, 122000);
INSERT INTO `Sales` VALUES ('25', 'a107', 2020, 1, 111000);

INSERT INTO `Sales` VALUES ('26', 'a102', 2020, 2, 120000);
INSERT INTO `Sales` VALUES ('27', 'a103', 2020, 2, 93000);
INSERT INTO `Sales` VALUES ('28', 'a104', 2020, 2, 84000);
INSERT INTO `Sales` VALUES ('29', 'a105', 2020, 2, 180000);
INSERT INTO `Sales` VALUES ('30', 'a108', 2020, 2, 76000);

# 실습 4-3 조건이 일치하는 레코드 조회
SELECT * FROM `Member` WHERE `name` = '김유신';
SELECT * FROM `Member` WHERE `pos` = '차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos` = '차장' OR dep=101;

SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';

SELECT * FROM `Member` WHERE `pos` = '사원' OR `pos` = '대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');

SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);

SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';

SELECT * FROM `Member` WHERE `sale` > 50000;
SELECT * FROM `Member` WHERE `sale` >= 50000 AND `sale` < 100000 AND 'month' =1;

# 실습 4-4 오름차순, 내림차순 정렬
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;

SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales` WHERE `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC; 

# 실습 4-5 레코드 수를 제한해서 조회
SELECT * FROM `sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3;
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;
SELECT * FROM `Sales` ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM `Sales` WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;

SELECT * 
FROM 
	`Sales` 
WHERE 
	`sale` > 50000
ORDER BY 
	`year` DESC, 
	`month`ASC, 
	`sale` DESC
LIMIT 
	5;

# 실습 4-6 내장함수 = 칼럼명을 별명으로 사용하기
SELECT SUM(`sale`) AS `합계` FROM `Sales`;
SELECT AVG(`sale`) AS `평균` FROM `Sales`;
SELECT MAX(`sale`) AS `최대값` FROM `Sales`;
SELECT MIN(`sale`) AS `최소값` FROM `Sales`;
SELECT COUNT(`sale`) AS `갯수` FROM `Sales`;
SELECT COUNT(*) AS `갯수` FROM `Sales`;

SELECT SUBSTRING(`hp`, 10, 4) AS `전화번호 끝자리` FROM `Member`;

INSERT INTO `Member` VALUES ('b101', '을지문덕', '010-5555-1234', '사장', 107, NOW());

# 실습 4-7
# 2018년 1월 매출의 총합을 구하시오
SELECT
	SUM(`sale`) AS `총합` 
FROM 
	`Sales` 
WHERE 
	`year` = 2018 AND `month` = 1;
	
# 실습 4-8
# 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
SELECT 
	SUM(`sale`) AS `총합`,
	AVG(`sale`) AS `평균`
FROM `Sales`
WHERE `year` = 2019 AND `month` = 2 AND `sale` >= 50000;

# 실습 4-9
# 2020년 전체 매출 가운데 최저, 최고, 매출을 구하시오.
SELECT
	MIN(`sale`) AS `최저`,
	MAX(`sale`) AS `최고`,
	SUM(`sale`) AS `총합`
FROM `Sales`
WHERE `year` = 2020;


# 실습 4-10 그룹별로 조회
SELECT VERSION();
SELECT `uid` FROM `Sales` GROUP BY `uid`;
SELECT `year` FROM `Sales` GROUP BY `year`;
SELECT `uid`, `year` FROM `Sales` GROUP BY `uid`, `year`;

SELECT
	`uid`,
	`year`,
	SUM(`sale`) AS `합계`
 FROM 
 	`Sales`
GROUP BY 
	`uid`, 
	`year`,
	SUM(`sale`) AS `합계`
	
SELECT 
	`uid`, `year`
		SUM(`sale`) AS `합계`
FROM
	`Sales` 
WHERE
	`sale` >= 50000
GROUP BY 
	`uid`, `year`
ORDER BY
	`합계` DESC;

# 실습 4-11 검색조건 설정
SELECT
	`uid`,
	`year`,
		SUM(`sale`) AS `합계`
WHERE
	`sale` >= 100000
GROUP BY
	`uid`, `year`
HAVING
	`합계` >= 200000
ORDER BY
	`합계` DESC;

# 실습 4-12 2개 이상의 테이블에서 레코드 조회하기

CREATE TABLE `Sales2` LIKE `Sales`;
INSERT INTO `Sales2` SELECT * FROM `Sales`;
UPDATE `Sales2` SET `year` = `year` + 3;

SELECT * FROM `Sales` UNION SELECT * FROM `Sales2`;
GROUP BY `uid`
HAVING `합계` >= 200000;

SELECT * FROM `Sales`
UNION
SELECT * FROM `Sales2`;

(SELECT * FROM `Sales`)
UNION
(SELECT * FROM `Sales2`);

SELECT `uid`, `year`, `sale` FROM `Sales`
UNION
SELECT `uid`, `year`, `sale` FROM `Sales2`;

SELECT `uid`, `year`, SUM(`sale`) AS `합계` FROM `Sales'
GROUP BY `uid`, `year`
UNION
SELECT `uid`, `year`, SUM(`sale`) AS `합계`
FROM `Sales2`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;


# 실습 4-13 내부조인(INNER JOIN) ★★
SELECT * FROM `Sales` INNER JOIN `Member` ON `Sales`.uid = `Member`.uid;
SELECT * FROM `Member` INNER JOIN `Department` ON `Member`.dep = `Department`.depNo;

SELECT * FROM `Sales` AS a 
JOIN `Member` AS b 
ON a.uid = b.uid;

SELECT * FROM `Member` AS a 
JOIN `Department` AS b 
ON a.dep = b.depNo;

SELECT * FROM `sales` AS a,
`Member` AS b
WHERE a.uid = b.uid;

SELECT * FROM `Member` AS a,
`Department` AS b
WHERE a.dep = b.depNo;
#7, 8
SELECT a.`seq` , a.`uid` , a.`sale` , b.`name` , b.`pos`
FROM `Sales` AS a
JOIN `Member` AS b ON a.`uid` = b.`uid`;

SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`
FROM `Sales` AS a
JOIN `Member` AS b USING (uid);

SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`
FROM `Sales` AS a
JOIN `Member` AS b ON a.`uid` = b.`uid`
WHERE `sale` >= 100000;

SELECT * FROM `Sales` AS a
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo;

SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` 
FROM `Sales` AS a
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c
ON b.dep = c.depNo;

# 실습 4-14 외부조인(LEFT, RIGHT JOIN)
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) 
	VALUES ('p101', '2018', 1, 35000);

SELECT * FROM `Sales` AS a LEFT JOIN `Member` AS b ON a.uid = b.uid;
SELECT * FROM `Sales` AS a RIGHT JOIN `Member` AS b ON a.uid = b.uid;


# 실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
SELECT 
	a.`uid`,
	a.`name`,
	a.`pos`,
	b.`name`
FROM `Member` AS a
JOIN `Department` AS b
ON a.dep = b.depNo;


# 실습 4-16 '김유신' 직원의 2019년도 매출의 합을 조회하시오.
SELECT
	SUM(`sale`) AS `매출합`
FROM `Sales` AS a
JOIN `Member` AS b 
ON a.uid = b.uid
WHERE `name` = '김유신' AND `year` = 2019
GROUP BY `year`;

# 실습 4-17 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름,
#부서명, 직급, 년도, 매출 합을 조회하시오. 단, 매출 합이 큰 순서부터 정렬

SELECT 
	b.`name`AS `직원이름`,
	c.`name`AS `부서명`,
	b.`pos`AS `직급`,
	a.`year`AS `년도`,
	SUM(a.`sale`) AS `매출합`
FROM `Sales` AS a
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo
WHERE `year` = 2019 AND `sale` >= 50000
GROUP BY b.name, c.name, b.pos, a.year
HAVING SUM(a.`sale`) >= 100000
ORDER BY `매출합` DESC;