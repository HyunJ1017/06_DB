SELECT *
FROM TB_MEMBER;

SELECT
	*
FROM TB_GRADE
ORDER BY GRADE_CODE DESC;

/*
[요구사항]

김영희 회원과 같은 지역에 사는 회원들의 지역명, 아이디, 이름, 등급명을 이름 오름차순으로 조회

[작성한 SQL]

SELECT AREA_NAME 지역명, MEMBER_ID 아이디, MEMBER_NAME 이름, GRADE_NAME 등급명
FROM TB_MEMBER
JOIN TB_GRADE ON(GRADE = GRADE_CODE)
JOIN TB_AREA ON (AREA_CODE = AREA_CODE)
WHERE AREA_CODE = (
SELECT AREA_CODE FROM TB_MEMBER
WHERE 이름 = '김영희')
ORDER BY 이름 DESC;
*/

SELECT AREA_NAME 지역명, MEMBER_ID 아이디, MEMBER_NAME 이름, GRADE_NAME 등급명
FROM TB_MEMBER
JOIN TB_GRADE
	ON(GRADE = GRADE_CODE)
JOIN TB_AREA ON ( TB_MEMBER.AREA_CODE =  TB_AREA.AREA_CODE)		-- AREA_CODE 양쪽 테이블 컬럼명이 동일함

WHERE TB_MEMBER.AREA_CODE = (	-- 이것도 오류인가?
	SELECT AREA_CODE FROM TB_MEMBER
	WHERE MEMBER_NAME = '김영희')	-- 서브쿼리에서 별칭 사용
ORDER BY 이름 ASC;		-- ASC : 오름차순, DESC 내림차순



/*
문제 1)
- 서브쿼리 내부 WHERE 절에서의 별칭사용

- 해석 순서상 서브쿼리 구문이 먼저 해석되면서 구문 내의
	FROM -> WHERE -> SELECT 순서로 해석이 진행되는데
	WHERE절에서 문제에서 요구한 김영희 회원이름을 검색하려는데
	이전 해석순서에 MEMBER_NAME 에 별칭을 지정해 둔 구문이 존재하지 않아
	"이름"이라는 별칭을 프로그램이 인식하지 못하는 문제가 발생

해결 1)
- 서브쿼리 내부 WHERE 절에서의 별칭사용

- '이름' -> MEMBER_NAME으로 수정
	메인쿼리 ORDER BY절의 "이름"별칭은 앞의
	SELECT 절에서 지정한 별칭이 먼저 해석되어 적용되므로
	수정할 소요 없음.


문제 2)
- JOIN ON 절에서 불러오기 위해 비교할 컬럼명이 양쪽 테이블에서 동일함

- 지역명과 지역코드가 작성되어 있는 테이블을 불러오기위해
	JOIN TB_AREA ON (AREA_CODE = AREA_CODE) 절을 작성하였는데
	컬럼명 AREA_CODE 가 양쪽 테이블에서 동일하게 사용되어
	AREA_CODE 컬럼명을 사용하고자 할때 프로그램에서 어떤 테이블의
	컬럼명을 사용해야 하는지 중복되는 오류가 발생하게됨

해결 2)
- JOIN ON 절에서 불러오기 위해 비교할 컬럼명이 양쪽 테이블에서 동일함

- JOIN TB_AREA ON (AREA_CODE = AREA_CODE)
	AREA_CODE 를 구분하기 위해 컬럼명 앞에 테이블명을 붙여주거나
	JOIN TB_AREA ON (TB_MEMBER.AREA_CODE = TB_AREA.AREA_CODE)
	
- TB_MEMBER 와 TB_AREA 에 각각 별칭 MEM, AREA 지정
	FROM TB_MEMBER MEM
	JOIN TB_GRADE
		ON(GRADE = GRADE_CODE)
	JOIN TB_AREA AREA
		ON ( MEM.AREA_CODE =  AREA.AREA_CODE)
	
	
문제 3)
- 메인쿼리의 WHERE 절에서도 2번과 동일하게 컬럼명이 곂치는 오류 발생

- TB_MEMBER 테이블에서 요구사항인 김영희 회원과 동일한 지역을 가진
	회원을 조회하기 위해 컬럼명을 사용해야 하므로
	TB_MEMBER 의 AREA_CODE 컬럼이라는 것을 명시해줄 필요가 있음

해결 3)
- TB_MEMBER 에 별칭 MEM 지정
	FROM TB_MEMBER MEM
	...
	WHERE MEM.AREA_CODE = (
	...)
	
	
문제 4)
- 요구사항에서 이름 오름차순으로 조회를 요청했는데
	ORDER BY 절에서 사용된 DESC는 내림차순 정렬임.

해결 4)
- ORDER BY 절에 ASC 절렬로 수정
	ORDER BY "이름" ASC;

*/

SELECT
	AREA_NAME 지역명,
	MEMBER_ID 아이디,
	MEMBER_NAME 이름,
	GRADE_NAME 등급명
FROM TB_MEMBER MEM
JOIN TB_GRADE
	ON(GRADE = GRADE_CODE)
JOIN TB_AREA AR
	ON (MEM.AREA_CODE =  AR.AREA_CODE)
WHERE MEM.AREA_CODE = (
	SELECT AREA_CODE FROM TB_MEMBER
	WHERE MEMBER_NAME = '김영희')
ORDER BY 이름 ASC;

---------------------------
-- [ 답 ]



SELECT AREA_NAME 지역명, MEMBER_ID 아이디, MEMBER_NAME 이름, GRADE_NAME 등급명
FROM TB_MEMBER
JOIN TB_GRADE ON(GRADE = GRADE_CODE)
JOIN TB_AREA USING AREA_CODE
WHERE AREA_CODE = (
SELECT AREA_CODE FROM TB_MEMBER
WHERE AREA_NAME = '김영희')
ORDER BY 이름 ASC;
