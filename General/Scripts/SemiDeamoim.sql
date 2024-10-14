DROP TABLE "MEMBER";

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR(50)		NOT NULL,
	"MEMBER_PW"	NVARCHAR2(100)		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEMBER_NICKNAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_TEL"	CHAR(11)		NOT NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"AUTHORITY"	NUMBER	DEFAULT 1	NOT NULL,
	"MEMBER_IMG"	VARCHAR(50)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원 아이디(ID)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호(PW)';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일(EMAIL)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원 닉네임(중복 X)';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '전화번호(-제외)';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '탈퇴 여부 (N,Y)';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '가입일';

COMMENT ON COLUMN "MEMBER"."AUTHORITY" IS '권한(1:일반, 2: 모임 관리자, 3:서버 관리자)';

COMMENT ON COLUMN "MEMBER"."MEMBER_IMG" IS '회원 이미지';

DROP TABLE "GROUP";

CREATE TABLE "GROUP" (
	"GROUP_NO"	NUMBER		NOT NULL,
	"GROUP_NAME"	NVARCHAR2(500)		NOT NULL,
	"GROUP_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"GROUP_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"GROUP_INTRODUCE"	VARCHAR2(4000)		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"CATEGORY_LIST_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"GROUP_MAIN_IMG"	VARCHAR2(300)		NULL,
	"GROUP_HEADER_IMG"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "GROUP"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

COMMENT ON COLUMN "GROUP"."GROUP_DATE" IS '모임 생성일';

COMMENT ON COLUMN "GROUP"."GROUP_DEL_FL" IS '모임삭제여부(N,Y)';

COMMENT ON COLUMN "GROUP"."GROUP_INTRODUCE" IS '모임 소개글';

COMMENT ON COLUMN "GROUP"."CATEGORY_NO" IS '카테고리 번호 (SEQ_CATEGORY_NO)';

COMMENT ON COLUMN "GROUP"."CATEGORY_LIST_NO" IS '카테고리 리스트 번호(SEQ_CATEGORY_LIST_NO)';

COMMENT ON COLUMN "GROUP"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "GROUP"."GROUP_MAIN_IMG" IS '모임 대표 이미지';

COMMENT ON COLUMN "GROUP"."GROUP_HEADER_IMG" IS '모임 상단 이미지';

DROP TABLE "BOARD";

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	NVARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BOARD_WRITE_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"BOARD_UPDATE_DATE"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_TYPE_CODE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."BOARD_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "BOARD"."BOARD_UPDATE_DATE" IS '마지막 수정일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_DEL_FL" IS '삭제 여부(N.Y)';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "BOARD"."BOARD_TYPE_CODE" IS '게시판 종류 코드 번호';

DROP TABLE "COMMENT";

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"COMMENT_WRITE_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"COMMENT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"PARENT_COMMENT_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호(SEQ_COMMENT_NO)';

COMMENT ON COLUMN "COMMENT"."COMMENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_WRITE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부(N,Y)';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

COMMENT ON COLUMN "COMMENT"."PARENT_COMMENT_NO" IS '부모 댓글 번호';

DROP TABLE "CATEGORY";

CREATE TABLE "CATEGORY" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	NVARCHAR2(30)		NOT NULL,
	"CATEGORY_IMG"	NVARCHAR2(200)		NOT NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NO" IS '카테고리 번호 (SEQ_CATEGORY_NO)';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NAME" IS '카테고리 이름';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_IMG" IS '카테고리 이미지 경로';

DROP TABLE "ALERT";

CREATE TABLE "ALERT" (
	"ALERT_NO"	NUMBER		NOT NULL,
	"ALERT_DETAIL"	VARCHAR2(4000)		NULL
);

COMMENT ON COLUMN "ALERT"."ALERT_NO" IS '알림 번호 (SEQ_ALERT_NO)';

COMMENT ON COLUMN "ALERT"."ALERT_DETAIL" IS '알림내용';

DROP TABLE "SCHEDULE";

CREATE TABLE "SCHEDULE" (
	"SCHEDULE_NO"	NUMBER		NOT NULL,
	"LOCATION"	NVARCHAR2(150)		NOT NULL,
	"GROUP_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"LOCATION_ADDRESS"	NVARCHAR2(150)		NOT NULL,
	"COST"	NUMBER	DEFAULT 0	NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SCHEDULE"."SCHEDULE_NO" IS '일정 번호';

COMMENT ON COLUMN "SCHEDULE"."LOCATION" IS '위치';

COMMENT ON COLUMN "SCHEDULE"."GROUP_DATE" IS '모임 날짜(default current date)';

COMMENT ON COLUMN "SCHEDULE"."LOCATION_ADDRESS" IS '주소';

COMMENT ON COLUMN "SCHEDULE"."COST" IS '비용(DEFAULT 0)';

COMMENT ON COLUMN "SCHEDULE"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

DROP TABLE "CHAT";

CREATE TABLE "CHAT" (
	"CHAT_NO"	NUMBER		NOT NULL,
	"CHAT_CONTENT"	NVARCHAR2(1000)		NOT NULL,
	"CHAT_WRITE_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CHAT"."CHAT_NO" IS '채팅 번호(SEQ_CHAT_NO)';

COMMENT ON COLUMN "CHAT"."CHAT_CONTENT" IS '채팅 내용';

COMMENT ON COLUMN "CHAT"."CHAT_WRITE_DATE" IS '채팅한 시간';

COMMENT ON COLUMN "CHAT"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "CHAT"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

DROP TABLE "LIKE";

CREATE TABLE "LIKE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LIKE"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "LIKE"."BOARD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

DROP TABLE "BOARD_IMG";

CREATE TABLE "BOARD_IMG" (
	"BOARD_IMG_NO"	NUMBER		NOT NULL,
	"BOARD_IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"BOARD_IMG_ORIGINAL_NAME"	NVARCHAR2(50)		NOT NULL,
	"BOARD_IMG_RENAME"	NVARCHAR2(50)		NOT NULL,
	"BOARD_IMG_ORDER"	NUMBER		NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_NO" IS '게시판 이미지 번호(SEQ_BOARD_IMG_NO)';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_PATH" IS '게시판 이미지 요청 경로';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_ORIGINAL_NAME" IS '게시판 이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_RENAME" IS '게시판 이미지 변경명';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_ORDER" IS '게시판 이미지 순서';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

DROP TABLE "MEMBER_GROUP";

CREATE TABLE "MEMBER_GROUP" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL,
	"MEMBER_GROUP_ENROLL_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"MEMBER_GROUP_BAN"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_GROUP_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "MEMBER_GROUP"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "MEMBER_GROUP"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

COMMENT ON COLUMN "MEMBER_GROUP"."MEMBER_GROUP_ENROLL_DATE" IS '모임별 회원 가입일';

COMMENT ON COLUMN "MEMBER_GROUP"."MEMBER_GROUP_BAN" IS '모임별 탈퇴된 회원(N,Y)';

COMMENT ON COLUMN "MEMBER_GROUP"."MEMBER_GROUP_DEL_FL" IS '모임별 나간 회원(N,Y)';

DROP TABLE "CATEGORY_LIST";

CREATE TABLE "CATEGORY_LIST" (
	"CATEGORY_LIST_NO"	NUMBER		NOT NULL,
	"CATEGORY_LIST_NAME"	NVARCHAR2(30)		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CATEGORY_LIST"."CATEGORY_LIST_NO" IS '카테고리 리스트 번호(SEQ_CATEGORY_LIST_NO)';

COMMENT ON COLUMN "CATEGORY_LIST"."CATEGORY_LIST_NAME" IS '카테고리 리스트 이름';

COMMENT ON COLUMN "CATEGORY_LIST"."CATEGORY_NO" IS '카테고리 번호 (SEQ_CATEGORY_NO)';

DROP TABLE "BOARD_TYPE";

CREATE TABLE "BOARD_TYPE" (
	"BOARD_TYPE_CODE"	NUMBER		NOT NULL,
	"BOARD_NAME"	NVARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_TYPE_CODE" IS '게시판 종류 코드 번호';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NAME" IS '게시판 이름';

DROP TABLE "INVITE";

CREATE TABLE "INVITE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL,
	"INVITE_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"INVITE_REQ_TIME"	DATE	DEFAULT CURRENT_DATE	NOT NULL
);

COMMENT ON COLUMN "INVITE"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "INVITE"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

COMMENT ON COLUMN "INVITE"."INVITE_DEL_FL" IS '수락 여부(N,Y)';

COMMENT ON COLUMN "INVITE"."INVITE_REQ_TIME" IS '가입요청시간';

DROP TABLE "SCHEDULE_MEMBER";

CREATE TABLE "SCHEDULE_MEMBER" (
	"SCHEDULE_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SCHEDULE_MEMBER"."SCHEDULE_NO" IS '일정 번호';

COMMENT ON COLUMN "SCHEDULE_MEMBER"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "SCHEDULE_MEMBER"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

DROP TABLE "POPUP";

CREATE TABLE "POPUP" (
	"POPUP_NO"	NVARCHAR2(300)		NOT NULL,
	"POPUP_NAME"	NVARCHAR2(50)		NOT NULL,
	"POPUP_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "POPUP"."POPUP_NO" IS '팝업 이미지 번호(SEQ_POPUP_NO)';

COMMENT ON COLUMN "POPUP"."POPUP_NAME" IS '팝업 이름';

COMMENT ON COLUMN "POPUP"."POPUP_DEL_FL" IS '팝업 삭제 여부(N,Y)';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "GROUP" ADD CONSTRAINT "PK_GROUP" PRIMARY KEY (
	"GROUP_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CATEGORY_NO"
);

ALTER TABLE "ALERT" ADD CONSTRAINT "PK_ALERT" PRIMARY KEY (
	"ALERT_NO"
);

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "PK_SCHEDULE" PRIMARY KEY (
	"SCHEDULE_NO"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY (
	"CHAT_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "PK_BOARD_IMG" PRIMARY KEY (
	"BOARD_IMG_NO"
);

ALTER TABLE "MEMBER_GROUP" ADD CONSTRAINT "PK_MEMBER_GROUP" PRIMARY KEY (
	"MEMBER_NO",
	"GROUP_NO"
);

ALTER TABLE "CATEGORY_LIST" ADD CONSTRAINT "PK_CATEGORY_LIST" PRIMARY KEY (
	"CATEGORY_LIST_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_TYPE_CODE"
);

ALTER TABLE "INVITE" ADD CONSTRAINT "PK_INVITE" PRIMARY KEY (
	"MEMBER_NO",
	"GROUP_NO"
);

ALTER TABLE "POPUP" ADD CONSTRAINT "PK_POPUP" PRIMARY KEY (
	"POPUP_NO"
);

ALTER TABLE "GROUP" ADD CONSTRAINT "FK_CATEGORY_TO_GROUP_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "GROUP" ADD CONSTRAINT "FK_CATEGORY_LIST_TO_GROUP_1" FOREIGN KEY (
	"CATEGORY_LIST_NO"
)
REFERENCES "CATEGORY_LIST" (
	"CATEGORY_LIST_NO"
);

ALTER TABLE "GROUP" ADD CONSTRAINT "FK_MEMBER_TO_GROUP_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_1" FOREIGN KEY (
	"BOARD_TYPE_CODE"
)
REFERENCES "BOARD_TYPE" (
	"BOARD_TYPE_CODE"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_COMMENT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_BOARD_TO_COMMENT_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_1" FOREIGN KEY (
	"PARENT_COMMENT_NO"
)
REFERENCES "COMMENT" (
	"COMMENT_NO"
);

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "FK_GROUP_TO_SCHEDULE_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "FK_MEMBER_TO_CHAT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "FK_GROUP_TO_CHAT_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_MEMBER_TO_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_BOARD_TO_LIKE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "FK_BOARD_TO_BOARD_IMG_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "MEMBER_GROUP" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_GROUP_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "MEMBER_GROUP" ADD CONSTRAINT "FK_GROUP_TO_MEMBER_GROUP_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);

ALTER TABLE "CATEGORY_LIST" ADD CONSTRAINT "FK_CATEGORY_TO_CATEGORY_LIST_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "INVITE" ADD CONSTRAINT "FK_MEMBER_TO_INVITE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "INVITE" ADD CONSTRAINT "FK_GROUP_TO_INVITE_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);

ALTER TABLE "SCHEDULE_MEMBER" ADD CONSTRAINT "FK_SCHEDULE_TO_SCHEDULE_MEMBER_1" FOREIGN KEY (
	"SCHEDULE_NO"
)
REFERENCES "SCHEDULE" (
	"SCHEDULE_NO"
);

ALTER TABLE "SCHEDULE_MEMBER" ADD CONSTRAINT "FK_MEMBER_GROUP_TO_SCHEDULE_MEMBER" FOREIGN KEY (
	"MEMBER_NO", "GROUP_NO"
)
REFERENCES "MEMBER_GROUP" (
	"MEMBER_NO", "GROUP_NO"
);




-----------------------------------------------------------------------------------------


-- FOREIGN KEY 제약 삭제
ALTER TABLE "GROUP" DROP CONSTRAINT "FK_CATEGORY_LIST_TO_GROUP_1";
ALTER TABLE "GROUP" DROP CONSTRAINT "FK_CATEGORY_TO_GROUP_1";
ALTER TABLE "BOARD" DROP CONSTRAINT "FK_MEMBER_TO_BOARD_1";
ALTER TABLE "BOARD" DROP CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_1";
ALTER TABLE "COMMENT" DROP CONSTRAINT "FK_MEMBER_TO_COMMENT_1";
ALTER TABLE "COMMENT" DROP CONSTRAINT "FK_BOARD_TO_COMMENT_1";
ALTER TABLE "COMMENT" DROP CONSTRAINT "FK_COMMENT_TO_COMMENT_1";
ALTER TABLE "MEMBER_IMG" DROP CONSTRAINT "FK_MEMBER_TO_MEMBER_IMG_1";
ALTER TABLE "ALERT" DROP CONSTRAINT "FK_GROUP_TO_ALERT_1";
ALTER TABLE "ALERT" DROP CONSTRAINT "FK_MEMBER_TO_ALERT_1";
ALTER TABLE "SCHEDULE" DROP CONSTRAINT "FK_GROUP_TO_SCHEDULE_1";
ALTER TABLE "CHAT" DROP CONSTRAINT "FK_GROUP_TO_CHAT_1";
ALTER TABLE "CHAT" DROP CONSTRAINT "FK_MEMBER_TO_CHAT_1";
ALTER TABLE "GROUP_ADMIN" DROP CONSTRAINT "FK_GROUP_TO_GROUP_ADMIN_1";
ALTER TABLE "LIKE" DROP CONSTRAINT "FK_MEMBER_TO_LIKE_1";
ALTER TABLE "LIKE" DROP CONSTRAINT "FK_BOARD_TO_LIKE_1";
ALTER TABLE "LOCATION" DROP CONSTRAINT "FK_SCHEDULE_TO_LOCATION_1";
ALTER TABLE "GROUP_MAIN_IMG" DROP CONSTRAINT "FK_GROUP_TO_GROUP_MAIN_IMG_1";
ALTER TABLE "BOARD_IMG" DROP CONSTRAINT "FK_BOARD_TO_BOARD_IMG_1";
ALTER TABLE "MEMBER_GROUP" DROP CONSTRAINT "FK_MEMBER_TO_MEMBER_GROUP_1";
ALTER TABLE "MEMBER_GROUP" DROP CONSTRAINT "FK_GROUP_TO_MEMBER_GROUP_1";
ALTER TABLE "CATEGORY_LIST" DROP CONSTRAINT "FK_CATEGORY_TO_CATEGORY_LIST_1";
ALTER TABLE "GROUP_HEADER_IMG" DROP CONSTRAINT "FK_GROUP_TO_GROUP_HEADER_IMG_1";

-- 테이블 삭제
DROP TABLE "MEMBER";
DROP TABLE "GROUP";
DROP TABLE "BOARD";
DROP TABLE "COMMENT";
DROP TABLE "MEMBER_IMG";
DROP TABLE "CATEGORY";
DROP TABLE "ALERT";
DROP TABLE "SCHEDULE";
DROP TABLE "CHAT";
DROP TABLE "GROUP_ADMIN";
DROP TABLE "LIKE";
DROP TABLE "LOCATION";
DROP TABLE "GROUP_MAIN_IMG";
DROP TABLE "CATEGORY_LIST";
DROP TABLE "MEMBER_GROUP";
DROP TABLE "BOARD_IMG";
DROP TABLE "BOARD_TYPE";
DROP TABLE "GROUP_HEADER_IMG";


/***************************************************************************************/
/***************************************************************************************/




CREATE SEQUENCE SEQ_ALERT_NO NOCACHE;
CREATE SEQUENCE SEQ_BOARD_IMG_NO NOCACHE;
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;
CREATE SEQUENCE SEQ_CATEGORY_LIST_NO NOCACHE;
CREATE SEQUENCE SEQ_CATEGORY_NO NOCACHE;
CREATE SEQUENCE SEQ_COMMENT_NO NOCACHE;
CREATE SEQUENCE SEQ_GROUP_NO NOCACHE;
CREATE SEQUENCE SEQ_IMG_NO NOCACHE;
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

DROP SEQUENCE SEQ_ALERT_NO;
DROP SEQUENCE SEQ_BOARD_IMG_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_CATEGORY_LIST_NO;
DROP SEQUENCE SEQ_CATEGORY_NO;
DROP SEQUENCE SEQ_COMMENT_NO;
DROP SEQUENCE SEQ_GROUP_NO;
DROP SEQUENCE SEQ_IMG_NO;
DROP SEQUENCE SEQ_MEMBER_NO;



INSERT INTO "CATEGORY"
VALUES ( SEQ_CATEGORY_NO.NEXTVAL, '레저/스포츠', 'img.JPG');
INSERT INTO "CATEGORY"
VALUES ( SEQ_CATEGORY_NO.NEXTVAL, '여행/관광', 'img.JPG');
INSERT INTO "CATEGORY"
VALUES ( SEQ_CATEGORY_NO.NEXTVAL, '취미/여가', 'img.JPG');
INSERT INTO "CATEGORY"
VALUES ( SEQ_CATEGORY_NO.NEXTVAL, '문화/체험', 'img.JPG');

INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '육상', 1);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '수상', 1);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '사이클', 1);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '익스트림', 1);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '등산', 2);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '캠핑', 2);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '트래킹', 2);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '역사탐방', 2);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '수공예', 3);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '댄스', 3);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '음악', 3);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '연주', 3);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '영과감상', 4);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '연극', 4);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '연주회', 4);
INSERT INTO "CATEGORY_LIST"
VALUES (SEQ_CATEGORY_LIST_NO.NEXTVAL, '전통문화', 4);

INSERT INTO "GROUP"
VALUES (SEQ_GROUP_NO.NEXTVAL,'셈플그룹5',DEFAULT,DEFAULT,'셈플용 그룹 생성 입니다',1,4,1,NULL, NULL);

/* 회원 테이블에 샘플 데이터 삽입*/
BEGIN
	FOR I IN 1.. 200 LOOP
		INSERT INTO "MEMBER"
		VALUES(
			SEQ_MEMBER_NO.NEXTVAL,
			'sample' || I,
			'pass01',
			'sample'|| I ||'@gmail.com',
			'닉네임'||I,
			'01012345678',
			DEFAULT,
			DEFAULT,
			1,
			NULL
		);
	END LOOP;
END;

/* 회원-모임 랜덤 가입*/
BEGIN
	FOR I IN 1.. 200 LOOP
		INSERT INTO "MEMBER_GROUP"
		VALUES(
			I,
			CEIL ( DBMS_RANDOM.VALUE(0, 5) ),
			DEFAULT, DEFAULT, DEFAULT
		);
	END LOOP;
END;

ROLLBACK;

SELECT COUNT(*) FROM MEMBER_GROUP
WHERE GROUP_NO = 5;

/* 게시판 테이블에 샘플 데이터 삽입*/
BEGIN
	FOR I IN 1.. 2000 LOOP
		INSERT INTO "BOARD"
		VALUES(
			SEQ_BOARD_NO.NEXTVAL,
			'확인용 게시판 글' || I,
			'확인용 게시판 글 내용' || I,
			DEFAULT, NULL, 0, DEFAULT, 
			CEIL ( DBMS_RANDOM.VALUE(0, 200) ),
			CEIL ( DBMS_RANDOM.VALUE(0, 3) )
		);
	END LOOP;
END;
