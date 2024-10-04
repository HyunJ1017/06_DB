CREATE TABLE "MEMBER" (

MEMBER_NO NUMBER PRIMARY KEY,

NAME VARCHAR(100) NOT NULL,

ADDRESS VARCHAR(50) NOT NULL,

AGE NUMBER

);

CREATE SEQUENCE SEQ_MEMBER_NO2;

INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO2.NEXTVAL, '유저일', '서울시 강남구', 20);

INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO2.NEXTVAL, '유저이', '서울시 강북구', 35);

INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO2.NEXTVAL, '유저삼', '서울시 성동구', 40);

INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO2.NEXTVAL, '유저사', '서울시 종로구', 18);

INSERT INTO MEMBER VALUES (SEQ_MEMBER_NO2.NEXTVAL, '유저오', '서울시 성북구', 32);

COMMIT;
SELECT MEMBER_NO, NAME, ADDRESS, AGE
FROM "MEMBER"
ORDER BY MEMBER_NO ASC;

DROP TABLE "MEMBER";

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR(50)		NOT NULL,
	"MEMBER_PW"	NVARCHAR2(100)		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEMBER_NAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_NICKNAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_BIRTH"	CHAR(7)		NOT NULL,
	"MEMBER_TEL"	CHAR(11)		NOT NULL,
	"MEMBER_ADDRESS"	NVARCHAR2(150)		NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"AUTHORITY"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원 아이디(ID)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호(PW)';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일(EMAIL)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '회원 이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원 닉네임(중복 X)';

COMMENT ON COLUMN "MEMBER"."MEMBER_BIRTH" IS '생년월일(-제외)';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '전화번호(-제외)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '회원 주소';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '탈퇴 여부 (N,Y)';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '가입일';

COMMENT ON COLUMN "MEMBER"."AUTHORITY" IS '권한(1:일반, 2: 모임 관리자, 3:서버 관리자)';

DROP TABLE "GROUP";

CREATE TABLE "GROUP" (
	"GROUP_NO"	NUMBER		NOT NULL,
	"GROUP_NAME"	NVARCHAR2(500)		NOT NULL,
	"GROUP_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"GROUP_INTRODUCE"	VARCHAR2(4000)		NOT NULL,
	"CATEGORY_LIST_NO"	NUMBER		NOT NULL,
	"CATEGORY2"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "GROUP"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

COMMENT ON COLUMN "GROUP"."GROUP_DATE" IS '모임 생성일';

COMMENT ON COLUMN "GROUP"."GROUP_INTRODUCE" IS '모임 소개글';

COMMENT ON COLUMN "GROUP"."CATEGORY_LIST_NO" IS '카테고리 리스트 번호(SEQ_CATEGORY_LIST_NO)';

COMMENT ON COLUMN "GROUP"."CATEGORY2" IS '카테고리 번호 (SEQ_CATEGORY_NO)';

DROP TABLE "BOARD";

CREATE TABLE "BOARD" (
	"BORAD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	NVARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BOARD_WRITE_DATE"	DATE	DEFAULT CURRENT_DATE	NOT NULL,
	"BOARD_UPDATE_DATE"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_TYPE_CODE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BORAD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

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
	"BORAD_NO"	NUMBER		NOT NULL,
	"PARENT_COMMENT_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호(SEQ_COMMENT_NO)';

COMMENT ON COLUMN "COMMENT"."COMMENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_WRITE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부(N,Y)';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "COMMENT"."BORAD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

COMMENT ON COLUMN "COMMENT"."PARENT_COMMENT_NO" IS '부모 댓글 번호';

DROP TABLE "MEMBER_IMG";

CREATE TABLE "MEMBER_IMG" (
	"MEMBER_PROFILE_NO"	NUMBER		NOT NULL,
	"MEMBER_PROFILE_IMG_PATH"	VARCHAR2(200)	DEFAULT 기본 프로필 이미지	NOT NULL,
	"MEMBER_ORIGINAL"	NVARCHAR2(50)		NOT NULL,
	"MEMBER_RENAME"	NVARCHAR2(50)		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MEMBER_IMG"."MEMBER_PROFILE_NO" IS '회원 프로필 이미지 번호(SEQ_IMG_NO)';

COMMENT ON COLUMN "MEMBER_IMG"."MEMBER_PROFILE_IMG_PATH" IS '회원 프로필 이미지 요청 경로';

COMMENT ON COLUMN "MEMBER_IMG"."MEMBER_ORIGINAL" IS '이미지 원본명';

COMMENT ON COLUMN "MEMBER_IMG"."MEMBER_RENAME" IS '이미지 변경명';

COMMENT ON COLUMN "MEMBER_IMG"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

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
	"ALERT_DETAIL"	VARCHAR2(4000)		NULL,
	"GROUP_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"GROUP_NO2"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ALERT"."ALERT_NO" IS '알림 번호 (SEQ_ALERT_NO)';

COMMENT ON COLUMN "ALERT"."ALERT_DETAIL" IS '알림내용';

COMMENT ON COLUMN "ALERT"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

COMMENT ON COLUMN "ALERT"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "ALERT"."GROUP_NO2" IS '모임 번호(SEQ_GROUP_NO)';

DROP TABLE "SCHEDULE";

CREATE TABLE "SCHEDULE" (
	"SCHEDULE_NO"	NUMBER		NOT NULL,
	"LOCATION"	NVARCHAR2(150)		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SCHEDULE"."SCHEDULE_NO" IS '일정 번호';

COMMENT ON COLUMN "SCHEDULE"."LOCATION" IS '위치';

COMMENT ON COLUMN "SCHEDULE"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

DROP TABLE "CHAT";

CREATE TABLE "CHAT" (
	"GROUP_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"CHAT_CONTENT"	NVARCHAR2(1000)		NOT NULL,
	"CHAT_WRITE_DATE"	DATE	DEFAULT CURRENT_DATE	NULL
);

COMMENT ON COLUMN "CHAT"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

COMMENT ON COLUMN "CHAT"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "CHAT"."CHAT_CONTENT" IS '채팅 내용';

COMMENT ON COLUMN "CHAT"."CHAT_WRITE_DATE" IS '채팅한 시간';

DROP TABLE "GROUP_ADMIN";

CREATE TABLE "GROUP_ADMIN" (
	"GROUP_ADMIN_NO"	NUMBER		NOT NULL,
	"GROUP_ADMIN_NAME"	NVARCHAR2(10)		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "GROUP_ADMIN"."GROUP_ADMIN_NO" IS '모임 관리자 번호(SEQ)GROUP_ADMIN)';

COMMENT ON COLUMN "GROUP_ADMIN"."GROUP_ADMIN_NAME" IS '모임 관리자 이름';

COMMENT ON COLUMN "GROUP_ADMIN"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

DROP TABLE "LIKE";

CREATE TABLE "LIKE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BORAD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LIKE"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "LIKE"."BORAD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

DROP TABLE "LOCATION";

CREATE TABLE "LOCATION" (
	"SCHEDULE_NO"	NUMBER		NOT NULL,
	"LOCATION_ADDRESS"	NVARCHAR2(150)		NOT NULL,
	"LOCATION_LT"	VARCHAR2(50)		NOT NULL,
	"LOCATION_LG"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "LOCATION"."SCHEDULE_NO" IS '일정 번호';

COMMENT ON COLUMN "LOCATION"."LOCATION_ADDRESS" IS '주소';

COMMENT ON COLUMN "LOCATION"."LOCATION_LT" IS '위도';

COMMENT ON COLUMN "LOCATION"."LOCATION_LG" IS '경도';

DROP TABLE "GROUP_MAIN_IMG";

CREATE TABLE "GROUP_MAIN_IMG" (
	"GROUP_IMG_NO"	NUMBER		NOT NULL,0
	"GROUP_MAIN_IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"GROUP_MAIN_ORIGINAL"	NVARCHAR2(50)		NOT NULL,
	"GROUP_MAIN_RENAME"	NVARCHAR2(50)		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "GROUP_MAIN_IMG"."GROUP_IMG_NO" IS '모임 이미지 번호(SEQ_GROUP_IMG_NO)';

COMMENT ON COLUMN "GROUP_MAIN_IMG"."GROUP_MAIN_IMG_PATH" IS '모임 대표 이미지 요청 경로';

COMMENT ON COLUMN "GROUP_MAIN_IMG"."GROUP_MAIN_ORIGINAL" IS '모임 대표 이미지 원본명';

COMMENT ON COLUMN "GROUP_MAIN_IMG"."GROUP_MAIN_RENAME" IS '모임 대표 이미지 변경명';

COMMENT ON COLUMN "GROUP_MAIN_IMG"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

DROP TABLE "BOARD_IMG";

CREATE TABLE "BOARD_IMG" (
	"BOARD_IMG_NO"	NUMBER		NOT NULL,
	"BOARD_IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"BOARD_IMG_ORIGINAL_NAME"	NVARDHAR2(50)		NOT NULL,
	"BOARD_IMG_RENAME"	NVARDHAR2(50)		NOT NULL,
	"BOARD_IMG_ORDER"	NUMBER		NULL,
	"BORAD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_NO" IS '게시판 이미지 번호(SEQ_BOARD_IMG_NO)';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_PATH" IS '게시판 이미지 요청 경로';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_ORIGINAL_NAME" IS '게시판 이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_RENAME" IS '게시판 이미지 변경명';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_IMG_ORDER" IS '게시판 이미지 순서';

COMMENT ON COLUMN "BOARD_IMG"."BORAD_NO" IS '게시글 번호(SEQ_BOARD_NO)';

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
	"CATEGORY2"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CATEGORY_LIST"."CATEGORY_LIST_NO" IS '카테고리 리스트 번호(SEQ_CATEGORY_LIST_NO)';

COMMENT ON COLUMN "CATEGORY_LIST"."CATEGORY_LIST_NAME" IS '카테고리 리스트 이름';

COMMENT ON COLUMN "CATEGORY_LIST"."CATEGORY2" IS '카테고리 번호 (SEQ_CATEGORY_NO)';

DROP TABLE "BOARD_TYPE";

CREATE TABLE "BOARD_TYPE" (
	"BOARD_TYPE_CODE"	NUMBER		NOT NULL,
	"BOARD_NAME"	NVARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_TYPE_CODE" IS '게시판 종류 코드 번호';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NAME" IS '게시판 이름';

DROP TABLE "GROUP_HEADER_IMG";

CREATE TABLE "GROUP_HEADER_IMG" (
	"GROUP_HEADERIMG_NO"	NUMBER		NOT NULL,
	"GROUP_HEADERIMG_PATH"	VARCHAR2(200)		NOT NULL,
	"GROUP_HEADERIMG_ORIGINAL"	NVARCHAR2(50)		NOT NULL,
	"GROUP_HEADERIMG_RENAME"	NVARCHAR2(50)		NOT NULL,
	"GROUP_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "GROUP_HEADER_IMG"."GROUP_HEADERIMG_NO" IS '모임 상단이미지번호';

COMMENT ON COLUMN "GROUP_HEADER_IMG"."GROUP_HEADERIMG_PATH" IS '모임상단이미지요청경로';

COMMENT ON COLUMN "GROUP_HEADER_IMG"."GROUP_HEADERIMG_ORIGINAL" IS '모임상단이미지원본명';

COMMENT ON COLUMN "GROUP_HEADER_IMG"."GROUP_HEADERIMG_RENAME" IS '모임상단이미지변경명';

COMMENT ON COLUMN "GROUP_HEADER_IMG"."GROUP_NO" IS '모임 번호(SEQ_GROUP_NO)';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "GROUP" ADD CONSTRAINT "PK_GROUP" PRIMARY KEY (
	"GROUP_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BORAD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "MEMBER_IMG" ADD CONSTRAINT "PK_MEMBER_IMG" PRIMARY KEY (
	"MEMBER_PROFILE_NO"
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
	"GROUP_NO"
);

ALTER TABLE "GROUP_ADMIN" ADD CONSTRAINT "PK_GROUP_ADMIN" PRIMARY KEY (
	"GROUP_ADMIN_NO"
);

ALTER TABLE "LOCATION" ADD CONSTRAINT "PK_LOCATION" PRIMARY KEY (
	"SCHEDULE_NO"
);

ALTER TABLE "GROUP_MAIN_IMG" ADD CONSTRAINT "PK_GROUP_MAIN_IMG" PRIMARY KEY (
	"GROUP_IMG_NO"
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

ALTER TABLE "GROUP_HEADER_IMG" ADD CONSTRAINT "PK_GROUP_HEADER_IMG" PRIMARY KEY (
	"GROUP_HEADERIMG_NO"
);

ALTER TABLE "GROUP" ADD CONSTRAINT "FK_CATEGORY_LIST_TO_GROUP_1" FOREIGN KEY (
	"CATEGORY_LIST_NO"
)
REFERENCES "CATEGORY_LIST" (
	"CATEGORY_LIST_NO"
);

ALTER TABLE "GROUP" ADD CONSTRAINT "FK_CATEGORY_TO_GROUP_1" FOREIGN KEY (
	"CATEGORY2"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
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
	"BORAD_NO"
)
REFERENCES "BOARD" (
	"BORAD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_1" FOREIGN KEY (
	"PARENT_COMMENT_NO"
)
REFERENCES "COMMENT" (
	"COMMENT_NO"
);

ALTER TABLE "MEMBER_IMG" ADD CONSTRAINT "FK_MEMBER_TO_MEMBER_IMG_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "ALERT" ADD CONSTRAINT "FK_GROUP_TO_ALERT_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);

ALTER TABLE "ALERT" ADD CONSTRAINT "FK_MEMBER_TO_ALERT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "ALERT" ADD CONSTRAINT "FK_CHAT_TO_ALERT_1" FOREIGN KEY (
	"GROUP_NO2"
)
REFERENCES "CHAT" (
	"GROUP_NO"
);

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "FK_GROUP_TO_SCHEDULE_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);

ALTER TABLE "CHAT" ADD CONSTRAINT "FK_GROUP_TO_CHAT_1" FOREIGN KEY (
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

ALTER TABLE "GROUP_ADMIN" ADD CONSTRAINT "FK_GROUP_TO_GROUP_ADMIN_1" FOREIGN KEY (
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
	"BORAD_NO"
)
REFERENCES "BOARD" (
	"BORAD_NO"
);

ALTER TABLE "LOCATION" ADD CONSTRAINT "FK_SCHEDULE_TO_LOCATION_1" FOREIGN KEY (
	"SCHEDULE_NO"
)
REFERENCES "SCHEDULE" (
	"SCHEDULE_NO"
);

ALTER TABLE "GROUP_MAIN_IMG" ADD CONSTRAINT "FK_GROUP_TO_GROUP_MAIN_IMG_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "FK_BOARD_TO_BOARD_IMG_1" FOREIGN KEY (
	"BORAD_NO"
)
REFERENCES "BOARD" (
	"BORAD_NO"
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
	"CATEGORY2"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "GROUP_HEADER_IMG" ADD CONSTRAINT "FK_GROUP_TO_GROUP_HEADER_IMG_1" FOREIGN KEY (
	"GROUP_NO"
)
REFERENCES "GROUP" (
	"GROUP_NO"
);



