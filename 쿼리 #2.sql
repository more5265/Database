SELECT
	a.*,
	b.`nick` 
FROM `Article` AS a
JOIN `User` AS b ON a.writer = b.uid
ORDER BY `no` DESC
LIMIT 10, 10;

# 게시물 채우기
INSERT INTO `Article` (`title`, `content`, `writer`, `regip`, `rdate`)
SELECT `title`, `content`, `writer`, `regip`, `rdate` FROM `Article`;

DELETE FROM `Article`;

SELECT COUNT(*) FROM `Article` WHERE `no`;

# 전체 게시물 갯수
SELECT COUNT(*) FROM `Article`;

SELECT * FROM `Article` WHERE `no`;

ALTER TABLE `Article` AUTO_INCREMENT=1;
SET @COUNT = 0;      
UPDATE `Article` SET [AUTO_INCREMENT `no`] = @COUNT:=@COUNT+1;