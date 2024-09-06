-- TODOLIST 테이블 생성
CREATE TABLE TODOLIST(
		LIST_NO NUMBER CONSTRAINT LIST_NO_PK PRIMARY KEY,
		TODO_TITLE VARCHAR2(50) NOT NULL,
		TODO_DETAIL NVARCHAR2(1000) NOT NULL,
		COMPLETE CHAR(1) DEFAULT 'X',
		REG_DATE DATE DEFAULT CURRENT_DATE,
		CONSTRAINT COMPLETE_CH CHECK(COMPLETE IN ('O', 'X'))
);

COMMENT ON COLUMN TODOLIST.LIST_NO IS '리스트 번호';
COMMENT ON COLUMN TODOLIST.TODO_TITLE IS '할 일 제목';
COMMENT ON COLUMN TODOLIST.TODO_DETAIL IS '할 일 내용';
COMMENT ON COLUMN TODOLIST.COMPLETE IS '완료여부';
COMMENT ON COLUMN TODOLIST.REG_DATE IS '작성일자';

CREATE SEQUENCE SEQ_LIST_NO NOCACHE;

-- 데이터 생성
INSERT INTO TODOLIST VALUES(SEQ_LIST_NO.NEXTVAL, 'Servlet 공부', '수업 내용 복습-Servlet', DEFAULT, DEFAULT);
INSERT INTO TODOLIST VALUES(SEQ_LIST_NO.NEXTVAL, 'JSP 공부', '수업 내용 복습-JSP', DEFAULT, DEFAULT);

-- 표 확인
SELECT * FROM TODOLIST;

SELECT
	COUNT(COMPLETE)
FROM TODOLIST
WHERE COMPLETE = 'O';

COMMIT;
ROLLBACK;

UPTADE TODOLIST
SET COMPLETE = ?
WHERE LIST_NO = ?;

ALTER TABLE TODOLIST
ADD(COLOR VARCHAR2(18));

ALTER TABLE TODOLIST
MODIFY COLOR DEFAULT '#000000';

UPDATE TODOLIST
SET COLOR = '#000000';