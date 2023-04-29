# DB 생성
DROP DATABASE IF EXISTS JSP_Community;
CREATE DATABASE JSP_Community;

# DB 선택
USE JSP_Community;

# 게시물 테이블 생성
CREATE TABLE article (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	title CHAR(250) NOT NULL,
	`body` LONGTEXT NOT NULL
);

# 게시물 테이블 데이터 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

# 게시물 조회
SELECT * FROM article WHERE id = id;

SELECT *
FROM article
ORDER BY id DESC
LIMIT limitFrom, itemInAPage;

# 게시물 삭제
DELETE FROM article WHERE id = id;

# 게시물 수 조회
SELECT COUNT(*) AS cnt
FROM article;

# 게시물 수정
UPDATE article
SET updateDate = NOW(),
title = '제목',
`body` = '내용'
WHERE id = id;

# 멤버 테이블 생성
CREATE TABLE `member` (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	loginId CHAR(100) NOT NULL UNIQUE,
	loginPw CHAR(100) NOT NULL,
	`name` CHAR(100) NOT NULL
);