-- Create DD_School database if not exists
CREATE DATABASE IF NOT EXISTS `DDSCHOOL`;
-- CREATE USER 'songpa'@'%' IDENTIFIED BY 'songpa';
GRANT ALL PRIVILEGES ON DDSCHOOL.* TO 'songpa'@'%';


-- Use DD_School database
USE `DDSCHOOL`;

-- NOTICE table
CREATE TABLE IF NOT EXISTS `TBL_NOTICE` (
    `BOARD_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `DOG_CODE` INT NOT NULL,
    `MEMBER_CODE` INT NOT NULL,
    `TITLE` VARCHAR(225) NOT NULL,
    `CONTENT` LONGTEXT NOT NULL,
    `REGIST_DATE` DATE NOT NULL,
    `MODIFY_DATE` DATE NULL,
    `STATUS` BOOLEAN NOT NULL
);

-- MEMBER table
CREATE TABLE IF NOT EXISTS `TBL_MEMBER` (
    `MEMBER_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `CLASS_CODE` INT NULL,
    `ROLE_CODE`	INT	NOT NULL,
    `MEMBER_ID` VARCHAR(50) NOT NULL,
    `MEMBER_PWD` VARCHAR(225) NOT NULL,
    `MEMBER_NAME` VARCHAR(50) NOT NULL,
    `PHONE` VARCHAR(50) NOT NULL,
    `ADDRESS` VARCHAR(100) NULL,
    `STATUS` BOOLEAN NOT NULL DEFAULT 1,
    `JOIN_DATE` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `WITHDRAW_DATE` DATE NULL,
    `MEMBER_BIRTH` DATE NOT NULL
);

-- CLASSBOOK table
CREATE TABLE IF NOT EXISTS `TBL_CLASSBOOK` (
    `CLASSBOOK_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `MEMBER_CODE` INT NOT NULL,
    `DOG_CODE` INT NOT NULL,
    `CHECK_DATE` DATE DEFAULT (CURRENT_DATE),
    `MODIFY_DATE` DATE NULL,
    `CHECK_STATUS` VARCHAR(20),
    `STATUS` BOOLEAN NOT NULL DEFAULT 1
);

-- IMAGE table
CREATE TABLE IF NOT EXISTS `TBL_IMAGE` (
    `IMAGE_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `DOG_CODE` INT NULL,
    `IMAGE_URL` VARCHAR(225) NOT NULL,
    `STATUS` BOOLEAN NOT NULL
);

-- COMMENT table
CREATE TABLE IF NOT EXISTS `TBL_COMMENT` (
    `COMMENT_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `BOARD_CODE` INT NOT NULL,
    `MEMBER_CODE` INT NOT NULL,
    `CONTENT` VARCHAR(225) NOT NULL,
    `REGIST_DATE` DATE NOT NULL,
    `MODIFY_DATE` DATE NULL,
    `STATUS` BOOLEAN NOT NULL
);

-- DOG table
CREATE TABLE IF NOT EXISTS `TBL_DOG` (
    `DOG_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `MEMBER_CODE` INT NOT NULL,
    `CLASS_CODE` INT NOT NULL,
    `DOG_NAME` VARCHAR(50) NOT NULL,
    `GENDER` VARCHAR(10) NOT NULL,
    `BIRTH` DATE NOT NULL,
    `DOG_BREED` VARCHAR(50) NOT NULL,
    `WEIGHT` FLOAT NOT NULL,
    `CHIP_NO` VARCHAR(30) NULL,
    `NOTES` VARCHAR(30) NULL,
    `STATUS` BOOLEAN NOT NULL DEFAULT 1,
    `JOIN_DATE` DATE NOT NULL,
    `WITHDRAW_DATE` DATE NULL
);

-- STICKER table
CREATE TABLE IF NOT EXISTS `TBL_STICKER` (
    `STICKER_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `DOG_CODE` INT NOT NULL,
    `MEMBER_CODE` INT NOT NULL,
    `STICKER_NUM` INT NOT NULL,
    `COMMENT` VARCHAR(225) NULL,
    `REGIST_DATE` DATE NOT NULL
);

-- CLASS table
CREATE TABLE IF NOT EXISTS `TBL_CLASS` (
    `CLASS_CODE` INT PRIMARY KEY AUTO_INCREMENT,
    `CLASS_NAME` VARCHAR(20) NOT NULL,
    `STATUS` TINYINT NOT NULL DEFAULT '1' 
);


-- MEMBER_ROLE table
CREATE TABLE `TBL_MEMBER_ROLE` (
	`ROLE_CODE`	INT PRIMARY KEY AUTO_INCREMENT,
	`ROLE_NAME`	VARCHAR(10)	NULL
);

-- Set Foreign Key Constraints
ALTER TABLE `TBL_NOTICE` ADD CONSTRAINT `FK_TBL_DOG_TO_NOTICE_1` FOREIGN KEY (`DOG_CODE`) REFERENCES `TBL_DOG` (`DOG_CODE`);
ALTER TABLE `TBL_NOTICE` ADD CONSTRAINT `FK_TBL_MEMBER_TO_NOTICE_1` FOREIGN KEY (`MEMBER_CODE`) REFERENCES `TBL_MEMBER` (`MEMBER_CODE`);

ALTER TABLE `TBL_MEMBER` ADD CONSTRAINT `FK_TBL_CLASS_TO_MEMBER_1` FOREIGN KEY (`CLASS_CODE`) REFERENCES `TBL_CLASS` (`CLASS_CODE`);

ALTER TABLE `TBL_CLASSBOOK` ADD CONSTRAINT `FK_TBL_MEMBER_TO_CLASSBOOK_1` FOREIGN KEY (`MEMBER_CODE`) REFERENCES `TBL_MEMBER` (`MEMBER_CODE`);
ALTER TABLE `TBL_CLASSBOOK` ADD CONSTRAINT `FK_TBL_DOG_TO_CLASSBOOK_1` FOREIGN KEY (`DOG_CODE`) REFERENCES `TBL_DOG` (`DOG_CODE`);

ALTER TABLE `TBL_IMAGE` ADD CONSTRAINT `FK_TBL_DOG_TO_IMAGE_1` FOREIGN KEY (`DOG_CODE`) REFERENCES `TBL_DOG` (`DOG_CODE`);

ALTER TABLE `TBL_COMMENT` ADD CONSTRAINT `FK_TBL_NOTICE_TO_COMMENT_1` FOREIGN KEY (`BOARD_CODE`) REFERENCES `TBL_NOTICE` (`BOARD_CODE`);
ALTER TABLE `TBL_COMMENT` ADD CONSTRAINT `FK_TBL_MEMBER_TO_COMMENT_1` FOREIGN KEY (`MEMBER_CODE`) REFERENCES `TBL_MEMBER` (`MEMBER_CODE`);

ALTER TABLE `TBL_DOG` ADD CONSTRAINT `FK_TBL_MEMBER_TO_DOG_1` FOREIGN KEY (`MEMBER_CODE`) REFERENCES `TBL_MEMBER` (`MEMBER_CODE`);
ALTER TABLE `TBL_DOG` ADD CONSTRAINT `FK_TBL_CLASS_TO_DOG_1` FOREIGN KEY (`CLASS_CODE`) REFERENCES `TBL_CLASS` (`CLASS_CODE`);

ALTER TABLE `TBL_STICKER` ADD CONSTRAINT `FK_TBL_DOG_TO_STICKER_1` FOREIGN KEY (`DOG_CODE`) REFERENCES `TBL_DOG` (`DOG_CODE`);
ALTER TABLE `TBL_STICKER` ADD CONSTRAINT `FK_TBL_MEMBER_TO_STICKER_1` FOREIGN KEY (`MEMBER_CODE`) REFERENCES `TBL_MEMBER` (`MEMBER_CODE`);

ALTER TABLE `TBL_MEMBER` ADD CONSTRAINT `FK_TBL_MEMBER_ROLE_TO_MEMBER_1` FOREIGN KEY (`ROLE_CODE`) REFERENCES `TBL_MEMBER_ROLE` (`ROLE_CODE`);



-- 데이터 입력

-- 회원 권한
INSERT INTO TBL_MEMBER_ROLE (ROLE_NAME) VALUES
('MASTER'),
('TEACHER'),
('PARENT');

-- 반 
INSERT INTO TBL_CLASS (CLASS_NAME) VALUES
('오전반'),
('오후반'),
('종일반');


