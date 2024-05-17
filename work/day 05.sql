-- HAVING절
-- GROUP BY로 집계된 값중 WHERE절 처럼 특정 조건을 추가하는것

-- 각 부서별 급여의 최대값, 최소값, 인원수를 출력하되
-- 급여의 최대값이 8000이상인 결과만 보여줄것
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY),COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) >= 8000 ;
-- 각 부서별 인원수가 20명 이상인 부서의 정보를 부서번호, 급여의 합, 급여의 평균,
-- 인원수 순으로 출력하되, 급여의 평균은 소수점 2자리까지 반올림하여 출력

SELECT DEPARTMENT_ID ,SUM(SALARY),ROUND( AVG(SALARY),2), COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*)>= 20
ORDER BY DEPARTMENT_ID DESC;

-- 부서별, 직종별로 그룹화하여 결과를 부서번호, 직종, 인원수 순으로 출력하되
-- 직종이 'MAN'으로 끝나는 경우에만 조회하세요.

SELECT DEPARTMENT_ID , JOB_ID , COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ,JOB_ID 
HAVING JOB_ID LIKE '%MAN';

-- 각 부서별 평균 급여를 소수점 한자리까지 버림으로 출력하되,
-- 평균 급여가 10000 미만인 그룹만 조회해야 하며,
-- 부서번호가 50 이하인 부서만 조회

SELECT DEPARTMENT_ID , TRUNC(AVG(SALARY),1)  
FROM EMPLOYEES
WHERE  DEPARTMENT_ID <= 50
GROUP BY DEPARTMENT_ID 
HAVING TRUNC(AVG(SALARY),1) < 10000 ;

------------------------------------------------------------------------------------
-- DCL(Data Control Language)
-- 데이터 제어어
-- 데이터 베이스에 접근하고 객체들을 사용하도록 권한을 주고 회수하는 명령어

--DCL의 종류
--GRANT : 권한을부여
--REVOKE : 권한을 강탈
---------------------------------------------------------------------
-- SUBQUERY
-- 특정 SQL 문장 안에 또 다른 SQL 문장이 포함되어 있는것
-- 여러번 DB접속이 필요한 상황을 한번으로 줄여서 속도를
--증가시킬수 있다.
-- 서브쿼리를 사용할 수 있는곳
-- WHERE, HAVING
-- SELECT,DELETE문의 FROM 절
-- UPDATE문의 SET절
-- INSERT문의 INTO절

-- 사원 테이블에서 이름이 'Michael'이고, 직종이 'MK_MAN'인 사원의 급여보다
-- 많이 받는 사원들의 정보를 사번, 이름, 직종, 급여순으로 출력

-- 이름이 'Michael'이고, 직종이 'MK_MAN'인 사원의 급여
SELECT SALARY  
FROM EMPLOYEES
WHERE  FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN'; -- 13000


-- 급여가 13000보다 많이 받는 사원들의 정보
SELECT EMPLOYEE_ID , FIRST_NAME , JOB_ID , SALARY 
FROM EMPLOYEES
WHERE SALARY>(
SELECT SALARY  
FROM EMPLOYEES
WHERE  FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN'
);

-- 사번이 150번인 사원의 급여와 같은 급여를 받는 사원들의 정보를 사번,이름,급여순으로 출력

SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM EMPLOYEES
WHERE SALARY = (
SELECT SALARY 
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 150
); 


-- 급여가 회사의 평균급여 이상인 사람들의 이름과 급여를 조회

SELECT FIRST_NAME , SALARY 
FROM EMPLOYEES
WHERE SALARY >= (
SELECT AVG(SALARY) FROM EMPLOYEES 
);

-- 사번이 111번인 사원의 직종과 같고, 사번이 159번인 사원의 급여보다
-- 많이 받는 사원의 정보를 사번, 이름, 직종, 급여순으로 출력

SELECT EMPLOYEE_ID , FIRST_NAME , JOB_ID ,SALARY 
FROM EMPLOYEES
WHERE JOB_ID  = (
SELECT  JOB_ID  
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '111'
) AND SALARY > (
SELECT  SALARY 
FROM EMPLOYEES
WHERE EMPLOYEE_ID = '159'
);

-- 100번 부서의 최소 급여보다 많이 받는 다른 부서의 부서번호, 최소급여 조회

SELECT MIN(SALARY) 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100; --6900

SELECT DEPARTMENT_ID , MIN(SALARY) 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING  MIN(SALARY) > 6900;


-- PLAYER 테이블에서 TEAM_ID가 'K01' 인 선수중 POSITION이 'GK'인 선수
-- TEAM ID가 'K01' 인선수
SELECT * FROM  PLAYER WHERE TEAM_ID ='K01';
SELECT * FROM  PLAYER WHERE "POSITION" ='GK';
SELECT * FROM  (SELECT * FROM  PLAYER WHERE TEAM_ID ='K01') WHERE "POSITION" ='GK';

-- PLAYER 테이블에서 전체 평균키와 포지션별 평균키 구하기

SELECT "POSITION", AVG(HEIGHT) , (SELECT AVG(HEIGHT) FROM PLAYER)
FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

-- CONCATENATION(연결)
-- 두개의 컬럼을 마치 하나의 컬럼처럼 조회하는것
-- ||
SELECT FIRST_NAME||' '||LAST_NAME FROM EMPLOYEES; -- 풀네임 조회 가능 중간에 공백 넣기 가능

-- OO의 급여는 OO이다
SELECT FIRST_NAME||'의 급여는'||SALARY||'이다'
FROM EMPLOYEES;

-- 별칭(ALIAS)
-- 조회된 컬럼의 이름이 너무 길다면 별명을 줘서 대신 사용할 수 있다.
-- SELECT절
	--AS 뒤에 별칭 작성
	--한칸 띄우고 작성
--FROM절
	--테이블이름 뒤에 한칸 띄우고 작성

-- 별칭의 특징
-- 테이블에 별칭을 줘서 컬럼을 단순, 명확히 볼수 있다.
-- 조회된 SELECT문장에서만 유효
-- 테이블 별칭은 길이가 30까지 가능하나 짧을수록 좋다.
-- 테이블 별칭에는 의미가 있는것이 좋다.

-- 사원 테이블에서 EMPLOYEE_ID를 "사번", FIRST_NAME을 "이름", SALARY "급여"
SELECT EMPLOYEE_ID "사번", FIRST_NAME "이름", SALARY "급여" FROM EMPLOYEES ;

-- 가각 다른 테이블에서 컬럼 불러오기
SELECT EMPLOYEES.DEPARTMENT_ID,DEPARTMENTS.DEPARTMENT_ID  FROM EMPLOYEES ,DEPARTMENTS ;
SELECT E.DEPARTMENT_ID,D.DEPARTMENT_ID  FROM EMPLOYEES E,DEPARTMENTS D;

-- PLAYER 테이블에서 NICKNAME이 NULL인 선수들의 선수들의 닉네임을
-- 정태민 선수의 닉네임으로 바꾸기

SELECT NICKNAME 
FROM PLAYER
WHERE PLAYER_NAME  = '정태민';

UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME 
FROM PLAYER
WHERE PLAYER_NAME  = '정태민')
WHERE NICKNAME IS NULL;

SELECT * FROM PLAYER;

SELECT PLAYER_NAME  , 
NVL(NICKNAME ,
(SELECT NICKNAME 
FROM PLAYER
WHERE PLAYER_NAME  = '정태민'))
FROM PLAYER
WHERE NICKNAME  IS NULL;








