SELECT * FROM "MEMBER" ORDER BY MEMBER_NO;
INSERT INTO "MEMBER"
VALUES(
	SEQ_MEMBER_NO.NEXTVAL,
	(SELECT RANDOM_NAME() FROM DUAL),
	'delete04',
	'$2a$10$S3eOXx0HH1.3zUw5cUcZluGJ4PnQ.0QYgSEacOoLCdYBMUbPyrirS',
	'hyunj1017@naver.com',
	'01021133766',
	'N',
	1
);

SELECT * FROM "ARTIST" ORDER BY MEMBER_NO;
INSERT INTO ARTIST
VALUES(
	$$,
	'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2F' || 'profile$$.jpg' || '?alt=media',
	'$$$$$',
	'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2F' || 'portpolio$$.jpg' || '?alt=media',
	'001',
	'86688586851198',
	'N'
);

SELECT * FROM PIECE_CATEGORY;
INSERT INTO PIECE_CATEGORY
VALUES(SEQ_CATEGORY_NO.nextval, '단색화');
COMMIT;

SELECT * FROM PIECE ORDER BY PIECE_NO;
SELECT SEQ_PIECE_NO.NEXTVAL FROM DUAL;  -- 예: 1 반환
SELECT SEQ_PIECE_NO.CURRVAL FROM DUAL;   -- 1 반환
INSERT INTO PIECE
VALUES(
	SEQ_PIECE_NO.NEXTVAL,
	10,
	'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/piece%2F%EC%83%98%ED%94%8C%20(' || SEQ_PIECE_NO.CURRVAL || ').jpg?alt=media',
	'무제',
	'설명없음',
	14,
	8,
	DEFAULT,
	2,
	'N',
	2
);

SELECT * FROM PIECE_AUCTION; -- 40,46
INSERT INTO PIECE_AUCTION
VALUES(
	21,
	TO_DATE('20241121','YYYYMMDD'),
	TO_DATE('20241122','YYYYMMDD'),
	11000000,
	46000000
);

SELECT * FROM AUCTION ORDER BY PIECE_NO ASC, END_PRICE ASC;
INSERT INTO "AUCTION"
VALUES(SEQ_AUCTION_NO.NEXTVAL, 79, 1, CURRENT_DATE -1, 35000000); -- 어제날자 경매품 입력
INSERT INTO "AUCTION"
VALUES (SEQ_AUCTION_NO.NEXTVAL, 21, 7, CURRENT_DATE, 46000000); -- 오늘날자 경매품

-- 경매 실패품을 판매작품으로
INSERT INTO PIECE_SELL
VALUES(21, (SELECT HOPE_PRICE FROM PIECE_AUCTION WHERE PIECE_NO = 21));

SELECT * FROM QUESTION;
SELECT * FROM QUESTION_CATEGORY ORDER BY QUESTION_CATEGORY_NO ASC; -- 40,46
INSERT INTO QUESTION_CATEGORY VALUES(SEQ_QUESTION_CATEGORY_NO.NEXTVAL, '배송 및 위탁 문의');

SELECT * FROM WISH ORDER BY PIECE_NO;
SELECT * FROM ARTIST ORDER BY MEMBER_NO;
INSERT INTO "FOLLOW"
VALUES(1,17);

SELECT * FROM WISH ORDER BY PIECE_NO;
SELECT * FROM PIECE ORDER BY PIECE_NO;
INSERT INTO WISH VALUES(1,46);

INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('001', '한국은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('002', '산업은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('003', '기업은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('004', '국민은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('005', '외환은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('007', '수협중앙회');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('008', '수출입은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('011', '농협은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('012', '지역농.축협');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('020', '우리은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('023', 'SC은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('027', '한국씨티은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('031', '대구은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('032', '부산은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('034', '광주은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('035', '제주은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('037', '전북은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('039', '경남은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('045', '새마을금고중앙회');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('048', '신협중앙회');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('050', '상호저축은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('051', '중국은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('052', '모건스탠리은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('054', 'HSBC은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('055', '도이치은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('056', '알비에스피엘씨은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('057', '제이피모간체이스은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('058', '미즈호은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('059', '미쓰비시도쿄UFJ은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('060', 'BOA은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('061', '비엔피파리바은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('062', '중국공상은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('063', '중국은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('064', '산림조합중앙회');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('065', '대화은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('066', '교통은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('071', '우체국');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('076', '신용보증기금');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('077', '기술보증기금');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('081', 'KEB하나은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('088', '신한은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('089', '케이뱅크');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('090', '카카오뱅크');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('093', '한국주택금융공사');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('094', '서울보증보험');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('095', '경찰청');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('096', '한국전자금융(주)');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('099', '금융결제원');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('102', '대신저축은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('103', '에스비아이저축은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('104', '에이치케이저축은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('105', '웰컴저축은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('106', '신한저축은행');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('209', '유안타증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('218', '현대증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('221', '골든브릿지투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('222', '한양증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('223', '리딩투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('224', 'BNK투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('225', 'IBK투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('226', 'KB투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('227', 'KTB투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('230', '미래에셋증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('238', '대우증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('240', '삼성증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('243', '한국투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('261', '교보증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('262', '하이투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('263', 'HMC투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('264', '키움증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('265', '이베스트투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('266', 'SK증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('267', '대신증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('269', '한화투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('270', '하나대투증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('278', '신한금융투자');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('279', 'DB금융투자');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('280', '유진투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('287', '메리츠종합금융증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('289', 'NH투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('290', '부국증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('291', '신영증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('292', '엘아이지투자증권');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('293', '한국증권금융');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('294', '펀드온라인코리아');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('295', '우리종합금융');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('296', '삼성선물');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('297', '외환선물');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('298', '현대선물');
INSERT INTO BANK_CODE_LIST (BANK_NO, BANK_NAME) VALUES ('092', '토스뱅크');

COMMIT;
ROLLBACK;
SELECT * FROM "MEMBER" ORDER BY MEMBER_NO DESC;
DECLARE
    v_index NUMBER := 1;
BEGIN
    FOR v_index IN 1..39 LOOP
        INSERT INTO "MEMBER"
        VALUES (
            SEQ_MEMBER_NO.NEXTVAL,
            (SELECT RANDOM_NAME() FROM DUAL),
            'sample' || LPAD(v_index, 2, '0'),
            '$2a$10$S3eOXx0HH1.3zUw5cUcZluGJ4PnQ.0QYgSEacOoLCdYBMUbPyrirS',
            'sample' || LPAD(v_index, 2, '0') || '@google.com',
            '01000000000',
            'N',
            1
        );
    END LOOP;
    COMMIT;
END;

SELECT * FROM ARTIST ORDER BY MEMBER_NO DESC;
INSERT INTO ARTIST VALUES(52, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile52.jpg?alt=media', '세잔', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio52.jpg?alt=media', '001', '71394567238945', 'Y');
INSERT INTO ARTIST VALUES(53, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile53.jpg?alt=media', '모리', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio53.jpg?alt=media', '001', '46217935482156', 'Y');
INSERT INTO ARTIST VALUES(54, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile54.jpg?alt=media', '루나', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio54.jpg?alt=media', '001', '58124692315879', 'Y');
INSERT INTO ARTIST VALUES(55, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile55.jpg?alt=media', '카이', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio55.jpg?alt=media', '001', '97831562439284', 'Y');
INSERT INTO ARTIST VALUES(56, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile56.jpg?alt=media', '다빈', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio56.jpg?alt=media', '001', '39521786457812', 'Y');
INSERT INTO ARTIST VALUES(57, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile57.jpg?alt=media', '로이', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio57.jpg?alt=media', '001', '71894567234568', 'Y');
INSERT INTO ARTIST VALUES(58, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile58.jpg?alt=media', '린다', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio58.jpg?alt=media', '001', '63217894567123', 'Y');
INSERT INTO ARTIST VALUES(59, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile59.jpg?alt=media', '소피', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio59.jpg?alt=media', '001', '89543176218957', 'Y');
INSERT INTO ARTIST VALUES(60, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile60.jpg?alt=media', '제이', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio60.jpg?alt=media', '001', '51294673825168', 'Y');
INSERT INTO ARTIST VALUES(61, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile61.jpg?alt=media', '타로', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio61.jpg?alt=media', '001', '24967831249567', 'Y');
INSERT INTO ARTIST VALUES(62, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile62.jpg?alt=media', '니키', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio62.jpg?alt=media', '001', '89451237689234', 'Y');
INSERT INTO ARTIST VALUES(63, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile63.jpg?alt=media', '미나', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio63.jpg?alt=media', '001', '67839145278931', 'Y');
INSERT INTO ARTIST VALUES(64, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile64.jpg?alt=media', '루크', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio64.jpg?alt=media', '001', '75192346871239', 'Y');

INSERT INTO ARTIST VALUES(65, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile65.jpg?alt=media', '로하', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio65.jpg?alt=media', '001', '39418572641823', 'Y');
INSERT INTO ARTIST VALUES(66, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile66.jpg?alt=media', '루빈', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio66.jpg?alt=media', '001', '51928467519283', 'Y');
INSERT INTO ARTIST VALUES(67, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile67.jpg?alt=media', '키로', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio67.jpg?alt=media', '001', '68519234751928', 'Y');
INSERT INTO ARTIST VALUES(68, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile68.jpg?alt=media', '에라', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio68.jpg?alt=media', '001', '92748519274851', 'Y');
INSERT INTO ARTIST VALUES(69, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile69.jpg?alt=media', '하준', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio69.jpg?alt=media', '001', '75192836475192', 'Y');
INSERT INTO ARTIST VALUES(70, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile70.jpg?alt=media', '유빈', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio70.jpg?alt=media', '001', '93847519283745', 'Y');
INSERT INTO ARTIST VALUES(71, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile71.jpg?alt=media', '리온', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio71.jpg?alt=media', '001', '84751928374512', 'Y');
INSERT INTO ARTIST VALUES(72, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile72.jpg?alt=media', '제인', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio72.jpg?alt=media', '001', '64837291564823', 'Y');
INSERT INTO ARTIST VALUES(73, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile73.jpg?alt=media', '도현', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio73.jpg?alt=media', '001', '39582714938275', 'Y');
INSERT INTO ARTIST VALUES(74, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile74.jpg?alt=media', '소라', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio74.jpg?alt=media', '001', '95847129384715', 'Y');
INSERT INTO ARTIST VALUES(75, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile75.jpg?alt=media', '네오', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio75.jpg?alt=media', '001', '75129384759238', 'Y');
INSERT INTO ARTIST VALUES(76, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile76.jpg?alt=media', '리아', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio76.jpg?alt=media', '001', '92837461928347', 'Y');
INSERT INTO ARTIST VALUES(77, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile77.jpg?alt=media', '휘준', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio77.jpg?alt=media', '001', '59482731948273', 'Y');
INSERT INTO ARTIST VALUES(78, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile78.jpg?alt=media', '루아', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio78.jpg?alt=media', '001', '84759238475923', 'Y');
INSERT INTO ARTIST VALUES(79, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile79.jpg?alt=media', '은호', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio79.jpg?alt=media', '001', '23894751928374', 'Y');
INSERT INTO ARTIST VALUES(80, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile80.jpg?alt=media', '시온', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio80.jpg?alt=media', '001', '28475918284759', 'Y');
INSERT INTO ARTIST VALUES(81, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile81.jpg?alt=media', '하람', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio81.jpg?alt=media', '001', '84719284751928', 'Y');
INSERT INTO ARTIST VALUES(82, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile82.jpg?alt=media', '우빈', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio82.jpg?alt=media', '001', '95847192384751', 'Y');
INSERT INTO ARTIST VALUES(83, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile83.jpg?alt=media', '민서', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio83.jpg?alt=media', '001', '47592834751928', 'Y');
INSERT INTO ARTIST VALUES(84, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile84.jpg?alt=media', '은찬', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio84.jpg?alt=media', '001', '29384751928374', 'Y');
INSERT INTO ARTIST VALUES(85, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile85.jpg?alt=media', '제아', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio85.jpg?alt=media', '001', '29475839284751', 'Y');
INSERT INTO ARTIST VALUES(86, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile86.jpg?alt=media', '노아', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio86.jpg?alt=media', '001', '12938475928475', 'Y');
INSERT INTO ARTIST VALUES(87, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile87.jpg?alt=media', '리사', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio87.jpg?alt=media', '001', '58319284751923', 'Y');
INSERT INTO ARTIST VALUES(88, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile88.jpg?alt=media', '서연', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio88.jpg?alt=media', '001', '84751928375912', 'Y');
INSERT INTO ARTIST VALUES(89, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile89.jpg?alt=media', '해리', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio89.jpg?alt=media', '001', '98417592384751', 'Y');
INSERT INTO ARTIST VALUES(90, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/profile%2Fprofile90.jpg?alt=media', '나린', 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/portfolio%2Fportpolio90.jpg?alt=media', '001', '58319284759482', 'Y');

SELECT * FROM ARTIST ORDER BY MEMBER_NO ASC;
SELECT * FROM PIECE ORDER BY PIECE_NO DESC;
SELECT * FROM PIECE_AUCTION;
SELECT START_DATE, COUNT(*) FROM PIECE_AUCTION GROUP BY START_DATE ORDER BY START_DATE ASC;
SELECT * FROM AUCTION;
SELECT * FROM DELIVERY;
SELECT * FROM PAYMENT_RECORD;

COMMIT;
ROLLBACK;


INSERT INTO PIECE VALUES(SEQ_PIECE_NO.NEXTVAL, 10, 'https://firebasestorage.googleapis.com/v0/b/odagirijoe-3e3a4.firebasestorage.app/o/piece%2Fpiece' || SEQ_PIECE_NO.CURRVAL || '.jpg?alt=media', '무제', '설명없음', 25, 20, TO_DATE('20241101', 'YYYYMMDD'), 2, 'F', 1);
INSERT INTO PIECE_AUCTION VALUES (SEQ_PIECE_NO.CURRVAL, TO_DATE('20241101', 'YYYYMMDD'), TO_DATE('20241101', 'YYYYMMDD') +1, 100000, 1000000);
INSERT INTO AUCTION VALUES (SEQ_AUCTION_NO.NEXTVAL, SEQ_PIECE_NO.CURRVAL, 1, TO_DATE('20241101', 'YYYYMMDD'), 1000000);
INSERT INTO DELIVERY VALUES( SEQ_DELIVERY_NO.NEXTVAL, SEQ_PIECE_NO.CURRVAL, 1, '서울시 중구 남대문로120, 2층 A클래스 C2석', 3, TO_DATE('20241101', 'YYYYMMDD') +2, TO_DATE('20241101', 'YYYYMMDD') +5, TO_DATE('20241101', 'YYYYMMDD') +5 );
INSERT INTO PAYMENT_RECORD VALUES( SEQ_RECORD_NO.NEXTVAL, 1, SEQ_PIECE_NO.CURRVAL, 'payment-sample-20241205', 1000000, TO_DATE('20241101', 'YYYYMMDD') +2, '입금샘플', 01000000000);





