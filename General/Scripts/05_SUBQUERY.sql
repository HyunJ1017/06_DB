/*
    * SUBQUERY (서브쿼리)
    - 하나의 SQL문 안에 포함된 또다른 SQL문
    - 메인쿼리(기존쿼리)를 위해 보조 역할을 하는 쿼리문
    -- SELECT, FROM, WHERE, HAVGIN 절에서 사용가능

*/  

-- 서브쿼리 예시 1.
-- 부서코드가 노옹철사원과 같은 소속의 직원의 
-- 이름, 부서코드 조회하기

-- 1) 사원명이 노옹철인 사람의 부서코드 조회
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철'; --'D9'

-- 2) 부서코드가 D9인 직원을 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';	-- 3명

-- 3) 부서코드가 노옹철사원과 같은 소속의 직원 명단 조회   
--> 위의 2개의 단계를 하나의 쿼리로!!! --> 1) 쿼리문을 서브쿼리로!!
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 
	(SELECT DEPT_CODE
	FROM EMPLOYEE
	WHERE EMP_NAME = '노옹철');




-- 서브쿼리 예시 2.
-- 전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의 
-- 사번, 이름, 직급코드, 급여 조회

-- 1) 전 직원의 평균 급여 조회하기
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE;

-- 2) 직원들중 급여가 4091140원 이상인 사원들의 사번, 이름, 직급코드, 급여 조회
SELECT
	EMP_ID,
	EMP_NAME,
	JOB_CODE,
	SALARY
FROM EMPLOYEE
WHERE SALARY >= 4091140;
	


-- 3) 전 직원의 평균 급여보다 많은 급여를 받고 있는 직원 조회
--> 위의 2단계를 하나의 쿼리로 가능하다!! --> 1) 쿼리문을 서브쿼리로!!
SELECT
	EMP_ID,
	EMP_NAME,
	JOB_CODE,
	SALARY
FROM EMPLOYEE
WHERE SALARY >=
	(SELECT FLOOR(AVG(SALARY))
	FROM EMPLOYEE);

/*****************************************************************/
-- 기본적으로 '서브쿼리'를 먼저 해석
	--> 서브쿼리 결과를 이용해서 메인쿼리 해석

-- 단, 상호연관 서브쿼리는 순서가 반대(메인->서브)

/*****************************************************************/

-------------------------------------------------------------------

/*  서브쿼리 유형

    - 단일행(단일열) 서브쿼리 : 서브쿼리의 조회 결과 값의 개수가 1개일 때 
    
    - 다중행(단일열) 서브쿼리 : 서브쿼리의 조회 결과 값의 개수가 여러개일 때
    
    - 다중열 서브쿼리 : 서브쿼리의 SELECT 절에 자열된 항목수가 여러개 일 때
    
    - 다중행 다중열 서브쿼리 : 조회 결과 행 수와 열 수가 여러개일 때 
    
    - 상관 서브쿼리 : 서브쿼리가 만든 결과 값을 메인 쿼리가 비교 연산할 때 
                     메인 쿼리 테이블의 값이 변경되면 서브쿼리의 결과값도 바뀌는 서브쿼리
                     
    - 스칼라 서브쿼리 : 상관 쿼리이면서 결과 값이 하나인 서브쿼리
    
   * 서브쿼리 유형에 따라 서브쿼리 앞에 붙은 연산자가 다름
    
*/


-- 1. 단일행 서브쿼리 (SINGLE ROW SUBQUERY)
--    서브쿼리의 조회 결과 값의 개수가 1개인 서브쿼리
--    WHERE 절에서 단일행 서브쿼리 앞에는 비교 연산자 사용
--    <, >, <=, >=, =, !=/^=/<>


-- 전 직원의 급여 평균보다 많은 급여를 받는 직원의 
-- 이름, 직급, 부서, 급여를 직급 순으로 정렬하여 조회
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);



-- 가장 적은 급여를 받는 직원의
-- 사번, 이름, 직급, 부서코드, 급여, 입사일을 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, DEPT_CODE, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

                 
-- 노옹철 사원의 급여보다 많이 받는 직원의 
-- 사번, 이름, 부서, 직급, 급여를 조회
SELECT
	EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, SALARY
FROM EMPLOYEE
NATURAL JOIN JOB
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

        
 
-- 부서별(부서가 없는 사람 포함) 급여의 합계 중 가장 큰 부서의
-- 부서명, 급여 합계를 조회 

-- 1) 부서별 급여 합 중 가장 큰값 조회
SELECT
	MAX( SUM(SALARY) )
FROM EMPLOYEE
GROUP BY DEPT_CODE;



-- 2) 부서별 급여합이 21760000원 부서의 부서명과 급여 합 조회
SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE
HAVING SUM(SALARY) = 21760000;
/*GROUP BY 에 작성된 컬럼명만 SELECT정에 작성할 수 있다*/

-- 3) >> 위의 두 서브쿼리 합쳐 부서별 급여 합이 큰 부서의 부서명, 급여 합 조회

                      
                    

-- 수서별 인원 수가 3명 이상인 부서의
-- 부서명, 인원 수 조회
SELECT DEPT_TITLE, COUNT(*)
FROM EMPLOYEE
LEFT JOIN DEPARTMENT
	ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE
HAVING COUNT(*) >= 3;

-- 부서별 인원 수가 가장 적은 부서의 부서명, 인원수 조회
SELECT NVL(DEPT_TITLE, '없음') "부서명", COUNT(*)
FROM EMPLOYEE
LEFT JOIN DEPARTMENT
	ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE
HAVING COUNT(*) =
			(SELECT MIN(COUNT(*))
			FROM EMPLOYEE
			GROUP BY DEPT_CODE);

		
/** 서브쿼리에서 사용한 별칭을 메인쿼리에서 사용하기 **/
-- 인라인뷰 : FROM절에 사용된 서브쿼리
		--> 서브쿼리 결과가 테이블 처럼 인식
SELECT 이름, 급여
FROM (SELECT EMP_NAME "이름", SALARY "급여"
FROM EMPLOYEE)
WHERE 급여 >= 4000000;
		-- 메인쿼리 해석 1순위인 FROM절에 작성된
		-- 서브쿼리 결과 컬럼명이 "급여" 이기 때문에

		-- 메인쿼리 해석 2순위인 WHERE
		-- 메인쿼리 해석 3순위인 SELECT절에
		-- 똑같이 "급여"라고 컬럼명을 작성해야 한다


-------------------------------------------------------------------------

-- 2. 다중행 서브쿼리 (MULTI ROW SUBQUERY)
--    서브쿼리의 조회 결과 값의 개수가 여러행일 때 

/*
    >> 다중행 서브쿼리 앞에는 일반 비교연산자 사용 x
    
    - IN / NOT IN : 여러 개의 결과값 중에서 한 개라도 일치하는 값이 있다면
                    혹은 없다면 이라는 의미(가장 많이 사용!)
    - > ANY, < ANY : 여러개의 결과값 중에서 한개라도 큰 / 작은 경우
                     가장 작은 값보다 큰가? / 가장 큰 값 보다 작은가?
    - > ALL, < ALL : 여러개의 결과값의 모든 값보다 큰 / 작은 경우
                     가장 큰 값 보다 큰가? / 가장 작은 값 보다 작은가?
    - EXISTS / NOT EXISTS : 값이 존재하는가? / 존재하지 않는가?
    
*/

-- 부서별 최고 급여를 받는 직원의 
-- 이름, 직급, 부서코드, 급여를 부서 순으로 정렬하여 조회

-- 1) 부서별 최고 급여만 조회
SELECT MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 2) 부서별 최고 급여를 받는 직원
SELECT EMP_NAME, JOB_CODE, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE);





-- 사수에 해당하는 직원에 대해 조회 
--  사번, 이름, 부서명, 직급명, 구분(사수 / 직원)

-- 1) 사수에 해당하는 사원 번호 조회
-- MENAGER_ID 컬럼에 작성되어 있는 사번을 가진 사원 == 사수
SELECT DISTINCT( MANAGER_ID )	-- 중복제거
FROM EMPLOYEE
WHERE MANAGER_ID IS NOT NULL; -- 7행

-- 2) 직원의 사번, 이름, 부서명, 직급 조회
SELECT
	EMP_ID, EMP_NAME, NVL(DEPT_TITLE, '없음') AS DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE);

-- 3) 사수에 해당하는 직원에 대한 정보 추출 조회 (이때, 구분은 '사수'로)

SELECT 
	EMP_ID, 
	EMP_NAME, 
	NVL(DEPT_TITLE, '없음') AS DEPT_TITLE, 
	JOB_NAME,
	'사수' AS "구분"
FROM 
	EMPLOYEE
JOIN 
	JOB USING(JOB_CODE)
LEFT JOIN 
	DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE 
	EMP_ID IN (
		SELECT DISTINCT MANAGER_ID
		FROM EMPLOYEE
		WHERE MANAGER_ID IS NOT NULL);

-- 4) 일반 직원에 해당하는 사원들 정보 조회 (이때, 구분은 '사원'으로)
SELECT 
	EMP_ID, 
	EMP_NAME, 
	NVL(DEPT_TITLE, '없음') AS DEPT_TITLE, 
	JOB_NAME,
	'사원' AS "구분"
FROM 
	EMPLOYEE
JOIN 
	JOB USING(JOB_CODE)
LEFT JOIN 
	DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE 
	EMP_ID NOT IN (
		SELECT DISTINCT MANAGER_ID
		FROM EMPLOYEE
		WHERE MANAGER_ID IS NOT NULL);
            

-- 5) 3, 4의 조회 결과를 하나로 합침 -> SELECT절 SUBQUERY
-- * SELECT 절에도 서브쿼리 사용할 수 있음

-- 방법 1) UNION을 이용하는 방법

SELECT 
	EMP_ID, 
	EMP_NAME, 
	NVL(DEPT_TITLE, '없음') AS DEPT_TITLE, 
	JOB_NAME,
	'사수' AS "구분"
FROM 
	EMPLOYEE
JOIN 
	JOB USING(JOB_CODE)
LEFT JOIN 
	DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE 
	EMP_ID IN (
		SELECT DISTINCT MANAGER_ID
		FROM EMPLOYEE
		WHERE MANAGER_ID IS NOT NULL)

UNION
		
SELECT 
	EMP_ID, 
	EMP_NAME, 
	NVL(DEPT_TITLE, '없음') AS DEPT_TITLE, 
	JOB_NAME,
	'사원' AS "구분"
FROM 
	EMPLOYEE
JOIN 
	JOB USING(JOB_CODE)
LEFT JOIN 
	DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE 
	EMP_ID NOT IN (
		SELECT DISTINCT MANAGER_ID
		FROM EMPLOYEE
		WHERE MANAGER_ID IS NOT NULL);
	
-- 방법 2) SELECT절 SUBQUERY
-- * SELECT 절에도 서브쿼리 사용할 수 있음
SELECT 
	EMP_ID, 
	EMP_NAME, 
	NVL(DEPT_TITLE, '없음') AS DEPT_TITLE, 
	JOB_NAME,
	CASE
		WHEN EMP_ID IN (SELECT DISTINCT MANAGER_ID
			 			FROM EMPLOYEE
			  			WHERE MANAGER_ID IS NOT NULL)
		THEN '사수'
		ELSE '사원'
	END AS "구분"
FROM 
	EMPLOYEE
JOIN 
	JOB USING(JOB_CODE)
LEFT JOIN 
	DEPARTMENT ON (DEPT_CODE = DEPT_ID)
ORDER BY DEPT_ID ASC;

-- 대리 직급의 직원들 중에서 과장 직급의 최소 급여보다 많이 받는 직원의
-- 사번, 이름, 직급, 급여를 조회하세요
-- 단, > ANY 혹은 < ANY 연산자를 사용하세요

-- > ANY, < ANY : 여러개의 결과값 중에서 하나라도 큰 / 작은 경우
--                     가장 작은 값보다 큰가? / 가장 큰 값 보다 작은가?

-- 1) 직급이 대리인 직원들의 사번, 이름, 직급명, 급여 조회
SELECT
	EMP_ID, EMP_NAME, JOB_NAME,SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리';


-- 2) 직급이 과장인 직원들 급여 조회
SELECT
	EMP_ID, EMP_NAME, JOB_NAME,SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '과장';


-- 3) 대리 직급의 직원들 중에서 과장 직급의 최소 급여보다 많이 받는 직원
-- 3-1) MIN을 이용하여 단일행 서브쿼리를 만듦.
SELECT
	EMP_ID, EMP_NAME, JOB_NAME,SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리'
AND SALARY > (
						SELECT
							MIN(SALARY)
						FROM EMPLOYEE
						JOIN JOB USING (JOB_CODE)
						WHERE JOB_NAME = '과장');

-- 3-2) ANY를 이용하여 과장 중 가장 급여가 적은 직원 초과하는 대리를 조회
SELECT
	EMP_ID, EMP_NAME, JOB_NAME,SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리'
AND SALARY > ANY (
								SELECT
									SALARY
								FROM EMPLOYEE
								JOIN JOB USING (JOB_CODE)
								WHERE JOB_NAME = '과장');



-- 차장 직급의 급여의 가장 큰 값보다 많이 받는 과장 직급의 직원
-- 사번, 이름, 직급, 급여를 조회하세요
-- 단, > ALL 혹은 < ALL 연산자를 사용하세요

-- > ALL, < ALL : 여러개의 결과값의 모든 값보다 큰 / 작은 경우
--                     가장 큰 값 보다 크냐? / 가장 작은 값 보다 작냐?

SELECT
	EMP_ID,
	EMP_NAME,
	JOB_NAME,
	SALARY
FROM EMPLOYEE E
JOIN JOB			J ON (E.JOB_CODE = J.JOB_CODE)
WHERE J.JOB_NAME = '과장'
AND E.SALARY > ALL (
								SELECT
									SALARY
								FROM EMPLOYEE E
								JOIN JOB			J ON (E.JOB_CODE = J.JOB_CODE)
								WHERE J.JOB_NAME = '차장');
-------------------------------------------------------------
SELECT
	EMP_ID,
	EMP_NAME,
	JOB_NAME,
	SALARY
FROM EMPLOYEE E
JOIN JOB			J ON (E.JOB_CODE = J.JOB_CODE)
WHERE J.JOB_NAME = '과장'
AND E.SALARY > (
								SELECT
									MAX(SALARY)
								FROM EMPLOYEE E
								JOIN JOB			J ON (E.JOB_CODE = J.JOB_CODE)
								WHERE J.JOB_NAME = '차장');                      

							
							
-- 서브쿼리 중첩 사용(응용편!)


-- LOCATION 테이블에서 NATIONAL_CODE가 KO인 경우의 LOCAL_CODE와
-- DEPARTMENT 테이블의 LOCATION_ID와 동일한 DEPT_ID가 
-- EMPLOYEE테이블의 DEPT_CODE와 동일한 사원을 구하시오.

-- 1) LOCATION 테이블을 통해 NATIONAL_CODE가 KO인 LOCAL_CODE 조회
SELECT
	LOCAL_CODE
FROM LOCATION
WHERE NATIONAL_CODE = 'KO';
-- 1행 1렬 == 단일행 서브쿼리

-- 2)DEPARTMENT 테이블에서 위의 결과와 동일한 LOCATION_ID를 가지고 있는 DEPT_ID를 조회
SELECT
	DEPT_ID
FROM DEPARTMENT
WHERE LOCATION_ID = (
		SELECT
			LOCAL_CODE
		FROM LOCATION
		WHERE NATIONAL_CODE = 'KO'
		);
-- 5행 == 다중행 서브쿼리

-- 3) 최종적으로 EMPLOYEE 테이블에서 위의 결과들과 동일한 DEPT_CODE를 가지는 사원을 조회
SELECT
	*
FROM EMPLOYEE
WHERE DEPT_CODE IN ( -- 여러개를 비교하니까 (OR를 여러번 하는) IN을 사용한다
		SELECT
			DEPT_ID
		FROM DEPARTMENT
		WHERE LOCATION_ID = (
				SELECT
					LOCAL_CODE
				FROM LOCATION
				WHERE NATIONAL_CODE = 'KO'
		)
);



-----------------------------------------------------------------------

-- 3. 다중열 서브쿼리 (단일행 = 결과값은 한 행)
--    서브쿼리 SELECT 절에 나열된 컬럼 수가 여러개 일 때

-- 퇴사한 여직원과 같은 부서, 같은 직급에 해당하는
-- 사원의 이름, 직급, 부서, 입사일을 조회        

-- 1) 퇴사한 여직원 조회
SELECT
	EMP_NAME,
	JOB_CODE,
	DEPT_CODE,
	HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'Y' -- 퇴사여부 = 'Y' == 퇴사한 직원
AND SUBSTR(EMP_NO, 8, 1) IN ('2', '4');

-- 2) 퇴사한 여직원과 같은 부서, 같은 직급 (다중 열 서브쿼리)
SELECT
	*
FROM EMPLOYEE
WHERE DEPT_CODE = 'D8'
AND JOB_CODE ='J6';
----------------------
-- 방법 1) 단일행 서브쿼리 2개 사용하기
SELECT
	EMP_NAME,
	JOB_CODE,
	DEPT_CODE,
	HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE = (
		SELECT
			DEPT_CODE
		FROM EMPLOYEE
		WHERE ENT_YN = 'Y'
		AND SUBSTR(EMP_NO, 8, 1) IN ('2', '4')
)
AND JOB_CODE = (
		SELECT
			JOB_CODE
		FROM EMPLOYEE
		WHERE ENT_YN = 'Y'
		AND SUBSTR(EMP_NO, 8, 1) IN ('2', '4')
);


-- 방법 2) 다중열 서브쿼리 이용하기
SELECT
	EMP_NAME,
	JOB_CODE,
	DEPT_CODE,
	HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (	-- 23행의 EMPLOYEE 테이블 중 DEPT_CODE, JOB_CODE 이 일치하는
		SELECT
			DEPT_CODE,
			JOB_CODE
		FROM EMPLOYEE
		WHERE ENT_YN = 'Y'
		AND SUBSTR(EMP_NO, 8, 1) IN ('2', '4')
);
-- 여러 컬럼을 묶어서 한 번에 비교해
-- 모두 같은 행만 조회결과(RESULT SET)에 포함시킴

-------------------------- 연습문제 -------------------------------
-- 1. 노옹철 사원과 같은 부서, 같은 직급인 사원을 조회하시오. (단, 노옹철 사원은 제외)
--    사번, 이름, 부서코드, 직급코드, 부서명, 직급명
SELECT
	DEPT_CODE,
	JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철';

SELECT
	EMP_ID,
	EMP_NAME,
	DEPT_CODE,
	JOB_CODE,
	DEPT_TITLE,
	JOB_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
JOIN JOB USING (JOB_CODE)
WHERE (DEPT_CODE, JOB_CODE) = (
		SELECT
			DEPT_CODE,
			JOB_CODE
		FROM EMPLOYEE
		WHERE EMP_NAME = '노옹철'
)
AND EMP_NAME <> '노옹철';


-- 2. 2010년도에 입사한 사원의 부서와 직급이 같은 사원을 조회하시오
--    사번, 이름, 부서코드, 직급코드, 고용일
SELECT
	DEPT_CODE,
	JOB_CODE
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE) = '2010';

SELECT
	EMP_ID,
	EMP_NAME,
	DEPT_CODE,
	JOB_CODE,
	HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (
		SELECT
			DEPT_CODE,
			JOB_CODE
		FROM EMPLOYEE
		WHERE EXTRACT(YEAR FROM HIRE_DATE) = '2010'
);


-- 3. 87년생 여자 사원과 동일한 부서이면서 동일한 사수를 가지고 있는 사원을 조회하시오
--    사번, 이름, 부서코드, 사수번호, 주민번호, 고용일     
SELECT
	DEPT_CODE,
	MANAGER_ID
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 1, 2) = '87'
AND SUBSTR(EMP_NO, 8, 1) IN ('2', '4');

SELECT
	EMP_ID,
	EMP_NAME,
	DEPT_CODE,
	MANAGER_ID,
	EMP_NO,
	HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE, MANAGER_ID) = (
		SELECT
			DEPT_CODE,
			MANAGER_ID
		FROM EMPLOYEE
		WHERE SUBSTR(EMP_NO, 1, 2) = '87'
		AND SUBSTR(EMP_NO, 8, 1) IN ('2', '4')
);


----------------------------------------------------------------------

-- 4. 다중행 다중열 서브쿼리
--    서브쿼리 조회 결과 행 수와 열 수가 여러개 일 때

-- 본인 직급의 평균 급여를 받고 있는 직원의
-- 사번, 이름, 직급, 급여를 조회하세요
-- 단, 급여와 급여 평균은 만원단위로 계산하세요 TRUNC(컬럼명, -4)    

-- 1) 급여를 200, 600만 받는 직원 (200만, 600만이 평균급여라 생각 할 경우)
SELECT
	SALARY
FROM EMPLOYEE
WHERE TRUNC(SALARY, -4) IN ('3000000', 7000000); -- 없는뎅...

-- 2) 직급별 평균 급여
SELECT
	JOB_CODE,
	TRUNC(AVG(SALARY), -4)
FROM EMPLOYEE
GROUP BY JOB_CODE;


-- 3) 본인 직급의 평균 급여를 받고 있는 직원
SELECT
	EMP_NAME,
	SALARY
FROM EMPLOYEE
WHERE TRUNC(SALARY, -6) IN (
		SELECT
			TRUNC(AVG(SALARY), -6)
		FROM EMPLOYEE
		GROUP BY JOB_CODE
);

                  
                

-------------------------------------------------------------------------------

-- 5. 상[호연]관 서브쿼리
--    상관 쿼리는 메인쿼리가 사용하는 테이블값을 서브쿼리가 이용해서 결과를 만듦
--    메인쿼리의 테이블값이 변경되면 서브쿼리의 결과값도 바뀌게 되는 구조임

-- 보통의 SELECT문은 서브쿼리 -> 메인쿼리 순서로 해석하는데,
-- 지금은 되게 어려움
-- 상관성쿼리는 메인쿼리 1행을 해석하고,
-- 서브쿼리 수행
-- 다시 메인쿼리 1행 해석
-- 서브쿼리 수행
-- ... (메인쿼리 모든 행 조회할 때 까지 반복)

-- 상관쿼리는 먼저 메인쿼리 한 행을 조회하고
-- 해당 행이 서브쿼리의 조건을 충족하는지 확인하여 SELECT를 진행함


-- 직급별 급여 평균보다 급여를 많이 받는 직원의 
-- 이름, 직급코드, 급여 조회
SELECT
	JOB_CODE "직급별",
	AVG(SALARY) "평균급여"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE ASC;

/*47*/
SELECT
	EMP_NAME AS "이름",
	JOB_CODE AS "직급",
	SALARY AS "급여"
/*1, 3, 5 ... 45*/
	FROM EMPLOYEE "MAIN"			-- 메인쿼리 이름이 MAIN
/*2, 4, 6 ... 46*/
	WHERE SALARY > (
		SELECT AVG(SALARY)
		FROM EMPLOYEE "SUB"		-- 서브쿼리 이름이 SUB
		WHERE SUB.JOB_CODE = MAIN.JOB_CODE
				-- 앞서 해석된 MAIN 쿼리의 한개행의
				-- JOB_CODE 값을 얻어와
				-- SUB 쿼리 해석에 사용
)
/*48*/
ORDER BY JOB_CODE;


-- 부서별 입사일이 가장 빠른 사원의
--    사번, 이름, 부서명(NULL이면 '소속없음'), 직급명, 입사일을 조회하고
--    입사일이 빠른 순으로 조회하세요
--    단, 퇴사한 직원은 제외하고 조회하세요
SELECT
	EMP_ID "사번",
	EMP_NAME "이름",
	NVL( DEPT_TITLE, '소속없음') "부서",
	JOB_NAME "직급",
	HIRE_DATE "입사일"
	
FROM EMPLOYEE "MAIN"
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)

WHERE HIRE_DATE = (
	-- 메인쿼리 1행을 해석했을 때 조회되는 행 중에서
	-- DEPT_CODE 값을 얻어와
	-- 서브쿼리에서 해당 DEPT_CODE가 일치하는 사원중
	-- 가장 빠른 입사일을 조회
		SELECT MIN(HIRE_DATE)
		FROM EMPLOYEE "SUB"
		WHERE NVL("SUB".DEPT_CODE, '소속없음') = NVL("MAIN".DEPT_CODE, '소속없음')
					--> NULL은 비교가 안되기 때문에 비교 가능한 형태로 변환해줌
		
		-- 서브쿼리에서 조회된 결과를 다시 메인쿼리로 넘겨
		-- 메인쿼리 WHERE절 조건을 충족하는지 확인
		
		AND ENT_YN != 'Y' -- 퇴사자 제외, 퇴사자가 빠져서 그다음 빠른순서가 조회됨
);

/* 1) 메인 쿼리 한 행의 값을 서브 쿼리로 전달
 * 2) 서브 쿼리에서 전달 받은 값을 이용해서 SELECT 수행
 *    -> SELECT 결과를 다시 메인 쿼리로 반환
 * 3) 메인 쿼리에서 반환 받은 값을 이용해 
 *    해당 행의 결과 포함 여부를 결정
 * */


-- 사수가 있는(현재 테이블에 존재하는) 직원의 사번, 이름, 부서명, 사수사번 조회
SELECT
	EMP_ID "사번",
	EMP_NAME "이름",
	DEPT_TITLE "부서",
	MANAGER_ID "사수사번"
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
WHERE MANAGER_ID IS NOT NULL; --?? §(*￣▽￣*)§
-- > '사수번호'가 있는 사람 조회
-- 		문제는 사수번호의 사수가 회사 테이블에 있는사람인지 질의
-- 16명

SELECT
	EMP_ID "사번",
	EMP_NAME "이름",
	DEPT_TITLE "부서",
	MANAGER_ID "사수사번"
FROM EMPLOYEE "MAIN"
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)

WHERE EXISTS(	-- EXISTS: 서브쿼리 조회결과가 있으면 TRUE == 해당행을 조회(결과에 포함)
		SELECT '아무글자, 값을 써도 EXISTS는 "결과값"이 있는지, 없는지만 확인함.'
		FROM EMPLOYEE "SUB"
		WHERE "SUB".EMP_ID = "MAIN".MANAGER_ID
);
-- 15명


-------------------------------------------------------------------------------

-- 6. 스칼라 서브쿼리
--    SELECT절에 사용되는 서브쿼리 결과로 1행만 반환
--    SQL에서 단일 값을 가르켜 '스칼라'라고 함

-- 각 직원들이 속한 직급의 급여 평균 조회

-- 6-1-1) 각 직급별 급여평균 조회
SELECT
	JOB_CODE,
	AVG(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE ASC;

-- 6-1-2) 각 직원의 이름, 직급코드 조회
SELECT
	EMP_NAME,
	JOB_CODE
FROM EMPLOYEE
ORDER BY EMP_ID ASC;

-- 6-1-3) 각 직원의 이름, 직급코드, '직급별 급여평균' 조회
SELECT
		EMP_NAME,
		JOB_CODE,
		(SELECT	AVG(SALARY)
		 FROM EMPLOYEE "SUB"
		 WHERE "SUB".JOB_CODE = "MAIN".JOB_CODE
		) AS "직급별 급여 평균"
FROM
		EMPLOYEE "MAIN"
ORDER BY
		EMP_ID ASC;


-- 모든 사원의 사번, 이름, 관리자사번, 관리자명을 조회
-- 단 관리자가 없는 경우 '없음'으로 표시
-- (스칼라 + 상관 쿼리)

-- 6-2-1) 모든 사원의 사번, 이름, 관리자사번 조회
SELECT
		EMP_ID,
		EMP_NAME,
		MANAGER_ID
FROM
		EMPLOYEE;

-- 6-2-2) 대략 (실행 x)
SELECT
		EMP_ID,
		EMP_NAME,
		MANAGER_ID,
		NVL( (서브쿼리) , '없음') AS "관리자명"
FROM
		EMPLOYEE;

-- 6-2-3) 짜잔
SELECT
		EMP_ID,
		EMP_NAME,
		MANAGER_ID,
		NVL( (
					 SELECT EMP_NAME
					 FROM EMPLOYEE "SUB"
					 WHERE "SUB".EMP_ID = "MAIN".MANAGER_ID
		) , '없음') AS "관리자명"
FROM
		EMPLOYEE "MAIN";




-----------------------------------------------------------------------


-- 7. 인라인 뷰(INLINE-VIEW) -->SELECT문에서(절x) 조회되는 가상 테이블
	
/* VIEW (객체) : 조회 용도의 가상 테이블
 * 	-> SELECT는 가능 하지만 INSERT, UPDATE, DELETE는 불가함
 */	
	
--    FROM 절에서 서브쿼리를 사용하는 경우로
--    서브쿼리가 만든 결과의 집합(RESULT SET)을 테이블 대신에 사용한다.

-- 인라인뷰를 활용한 TOP-N분석
-- 전 직원 중 급여가 높은 상위 5명의
-- 순위, 이름, 급여 조회

-- 7-1-1) 전 직원의 급여를 내림차순으로 조회
SELECT
	EMP_NAME,
	SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;
		--> 선동일, 송중기, 노옹철, 전지연, 정중하 5명 조회할거임

-- 7-1-2) ROWNUM 이용해서 행에 번호를 추가
-- ROWNUM : 행 번호를 나타내는 가상의 컬럼
SELECT
	ROWNUM,
	EMP_NAME,
	SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;
--> 원하는 방법이 아님	--> EMPLOYEE테이블 순서대로 번호가 매겨짐
SELECT
	ROWNUM,
	EMP_NAME,
	SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5;
--> 원하는 방법이 아님	--> EMPLOYEE테이블 위에서 5명만 조회됨

-- 7-1-3) ROWNUM을 이용해서 급여 상위 5인 조회
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5
ORDER BY SALARY DESC;
--> 원하는 방법이 아님	--> EMPLOYEE테이블 위에서 5명만 조회됨

/*INLINE-VIEW를 통해 해결*/
SELECT
	ROWNUM "순위",
	EMP_NAME,
	SALARY
FROM (
		SELECT EMP_NAME, SALARY
		FROM EMPLOYEE
		ORDER BY SALARY DESC
		--> 서브쿼리 결과 RESULT SET(23행2열)를 메인쿼리의 테이블로 인식
)
WHERE ROWNUM <= 5;
		--> 정렬되어 넘어온 서브쿼리에서 12345행만 조회


-- 급여 평균이 3위 안에 드는 부서의 부서코드와 부서명, 평균급여를 조회

-- 7-2-1) 부서코드와 부서명, 평균급여를 평균급여 내림차순으로 조회
SELECT
	NVL(DEPT_CODE, '없음') "부서코드",
	NVL(DEPT_TITLE, '부서명 없음') "부서명",
	AVG(SALARY) "급여 평균"
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_CODE, DEPT_TITLE
ORDER BY "급여 평균" DESC;	-- SELECT절에 쓸 그룹함수(AVG, COUNT, SUM 등)을 제외한 모든 컬럼

-- 7-2-2) 전달받은 INLINE-VIEW에서 상위 3개의 부서 선택
SELECT
	ROWNUM "순위",
	"부서코드",
	"부서명",
	FLOOR("급여 평균") "급여평 균"
FROM (
		SELECT
			NVL(DEPT_CODE, '없음') "부서코드",
			NVL(DEPT_TITLE, '부서명 없음') "부서명",
			AVG(SALARY) "급여 평균"
		FROM EMPLOYEE
		LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
		GROUP BY DEPT_CODE, DEPT_TITLE
		ORDER BY "급여 평균" DESC
)
WHERE ROWNUM <= 3;

------------------------------------------------------------------------

-- 8. WITH
--    서브쿼리에 이름을 붙여주고 사용시 이름을 사용하게 함
--    인라인뷰로 사용될 서브쿼리에 주로 사용됨
--    실행 속도도 빨라진다는 장점이 있다. 

-- 
-- 전 직원의 급여 순위 
-- 순위, 이름, 급여 조회
-- 단, 10위 까지만 조회

-- 8-1) 전 직원의 급여
SELECT
	EMP_NAME,
	SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- 8-2) 전 직원의 급여 순위 TOP 10
-- 8-2-1) FROM 절에 서브쿼리를 그대로 작성한 형태
SELECT
	ROWNUM "순위",
	EMP_NAME "이름",
	SALARY "급여"
FROM (
		SELECT
			EMP_NAME,
			SALARY
		FROM EMPLOYEE
		ORDER BY SALARY DESC
)
WHERE ROWNUM <= 10;

-- 8-2-2) WITH 이용하기 (10~20% 빨라진다고 함)
WITH TOP_SALARY -- 서브쿼리 이름 지정
AS (	-- 저장할 서브쿼리
		SELECT
			EMP_NAME,
			SALARY
		FROM EMPLOYEE
		ORDER BY SALARY DESC
)

SELECT
	ROWNUM "순위",
	EMP_NAME "이름",
	SALARY "급여"
FROM TOP_SALARY
WHERE ROWNUM <= 10;

-- 8-3) 전 직원의 급여 5위 ~ 10위
-- 제일밑에있음



--------------------------------------------------------------------------


-- 9. RANK() OVER / DENSE_RANK() OVER

-- RANK() OVER : 동일한 순위 이후의 등수를 동일한 인원 수 만큼 건너뛰고 순위 계산
--               EX) 공동 1위가 2명이면 다음 순위는 2위가 아니라 3위



-- DENSE_RANK() OVER : 동일한 순위 이후의 등수를 이후의 순위로 계산
--                     EX) 공동 1위가 2명이어도 다음 순위는 2위


-- 급여를 많이 받는 순서대로 조회

-- 1) RANK() OVER
--			OVER() 괄호에 작성된 정렬 기준대로 정렬 후 순위 지정
--			단, 값의 크기가 같다면 공동 순위 지정, 지정된 만큼 순위 건너뛰기
SELECT
		RANK() OVER(ORDER BY SALARY DESC) "순위",
		--> SALARY 내림차순으로 정렬하고 순위를 지정함
		EMP_NAME,
		SALARY
FROM EMPLOYEE;


-- 2) DENSE_RANK() OVER
SELECT
		DENSE_RANK() OVER(ORDER BY SALARY DESC) "순위",
		--> SALARY 내림차순으로 정렬하고 순위를 지정함
		EMP_NAME,
		SALARY
FROM EMPLOYEE;


--------------------------------------------------------------------------

/* ROWNUM 사용시 주의사항 */
-- ROWNUM이 WHERE 절에 사용되는 경우
-- 항상 범위에 1부터 연속적인 범위가 포함되어야 한다!!!
-- ROWNUM 은 RESULT SET 완성 후 적용되는 가상 컬럼이라서
-- 정해진 규칙(1부터 1씩증가)을 만족하지 못하면 사용 불가

-- 급여순위 3 ~7등 조회
SELECT
	RANK() OVER (ORDER BY SALARY DESC) "순위",
	EMP_NAME,
	SALARY
FROM EMPLOYEE;
-- 여기서 노옹철 ~ 심봉선 5명 조회

-- 예시1)
SELECT
	"순위",
	EMP_NAME,
	SALARY
FROM (
		SELECT
			RANK() OVER (ORDER BY SALARY DESC) "순위",
			EMP_NAME,
			SALARY
		FROM EMPLOYEE
)
WHERE ROWNUM <=7;


-- 예시2) *** 안됨 ***
SELECT
	"순위",
	EMP_NAME,
	SALARY
FROM (
		SELECT
			RANK() OVER (ORDER BY SALARY DESC) "순위",
			EMP_NAME,
			SALARY
		FROM EMPLOYEE
)
WHERE ROWNUM BETWEEN 3 AND 7;


-- 예시3) *** 이건 됨 ***
SELECT
	"순위",
	EMP_NAME,
	SALARY
FROM (
		SELECT
			RANK() OVER (ORDER BY SALARY DESC) "순위",
			EMP_NAME,
			SALARY
		FROM EMPLOYEE
)
WHERE ROWNUM BETWEEN 1 AND 7;


/*********** 해결방법 *************/
-- INLINE-VIEW 중첩사용
SELECT
	"순위",
	EMP_NAME,
	SALARY
FROM (
		SELECT
			RANK() OVER (ORDER BY SALARY DESC) "순위",
			EMP_NAME,
			SALARY
		FROM EMPLOYEE
)
WHERE "순위" BETWEEN 3 AND 7;
-- ROWNUM 안쓰면됨







