-- join
-- 데이터베이스에서 두개 이상의 테이블을 연결하여 하나의 결과 테이블로
-- 만드는 것을 의미한다.
-- JOIN을 사용하는 이유는 데이터베이스에서 테이블을 분리하여 '데이터의 중복을 최소화' 하고
-- 데이터의 일관성을 유지하기 위함이다.
-- 여러가지 JOIN 방식이 있으며 JOIN의 방식에 따라 결과가 달라진다.

-- JOIN의 종류

-- INNER JOIN
-- 각 테이블에서 JOIN 조건에 일치되는 데이터만 가져온다.
-- A와 B테이블의 공통된 부분을 의미한다. 교집합과 비슷하다.

-- 테이블A INNER JOIN 테이블 B ON 조건식
-- 테이블A  JOIN 테이블 B ON 조건식

-- ORACLE JOIN
-- FROM 테이블A, 테이블B WHERE 조건식

-- SELF INNER JOIN
-- 하나의 테이블 내에서 다른 컬럼을 참조하기 위해 사용하는 자기 자신과의 조인
-- 이를 통해 데이터베이스에서 한 테입즐 내의 값을 다른 값과 연결할 수 있다.

-- SELECT 테이블A.열, 테이블B.열
-- FROM 테이블A JOIN 테이블B ON 조건식

-- CROSS JOIN
-- 두 개 이상의 테이블에서 모든 가능한 조합을 만들어 결과를 반환하는 방법
-- 이를 통해 두 개 이상의 테이블을 조합하여 새로운 테이블을 만들수 있다.
-- 각 행의 모든 가능한 조합을 만들기 때문에 결과가 매우 큰 테이블이 될 수
-- 있으므로 사용에 주의해야 한다.

-- SELECT 테이블1.열, 테이블2.열
-- FROM 테이블1 FROSS JOIN 테이블2;


SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;

SELECT  FIRST_NAME, E.DEPARTMENT_ID,DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 부서, 지역 테이블로부터 부서이름과 CITY 조회하기

SELECT * FROM LOCATIONS l ;
SELECT * FROM COUNTRIES;
SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS d JOIN LOCATIONS l 
ON D.LOCATION_ID = L.LOCATION_ID;

-- 지역(Locations), 나라(countries) 테이블에서 city와 country_name 조회
SELECT CITY, COUNTRY_NAME
FROM LOCATIONS l JOIN COUNTRIES c 
ON L.COUNTRY_ID  = C.COUNTRY_ID  ;

-- FIRST NAME, LAST NAME, JOB ID, JOB TITLE을 출력
-- EMPLOYEE와 JOBS 테이블 조회

SELECT  FIRST_NAME ,LAST_NAME ,J.JOB_ID ,JOB_TITLE
FROM EMPLOYEES e JOIN JOBS j
ON E.JOB_ID = J.JOB_ID ;

-- 사원, 부서, 지역 테이블에서 FIRST NAME, EMAIL, DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, CITY
-- 를 출력하되 CITY가 'Seattle ' 인 경우만 출력

SELECT FIRST_NAME ,EMAIL ,d.DEPARTMENT_ID ,DEPARTMENT_NAME, l.LOCATION_ID,CITY
FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS l ON D.LOCATION_ID = L.LOCATION_ID
AND L.CITY = 'Seattle'

--OUTER JOIN
-- 두 테이블에서 공통된 값을 가지지 않는 행들 도 반환한다.

--LEFT OUTER JOIN
-- 왼쪽 테이블의 모든행과 오른쪽 테이블에서 왼쪽 테이블과 공통된 값을 가지고 있는 행들을 반환한다.
-- 만약 오른쪽 테이블에서 공통된 값을 가지고 있는 행이 없다면 NULL값을 반환


-- SELECT 컬럼명1,컬럼명2
-- FROM 테이블1 LEFT OUTER JOIN 테이블2
-- ON 조건식

-- RIGHT OUTER JOIN
-- SELECT 컬럼명1,컬럼명2
-- FROM 테이블1 RIGHT OUTER JOIN 테이블2
-- ON 조건식


-- FULL OUTER JOIN
-- 두 테이블에서 '모든 값'을 반환한다.
-- 만약 공통된 값을 가지고 있지 않는 행이 있다면 NULL값을 반환한다.
-- 합집합 연산 결과와 같다.
-- 양쪽 테이블 데이터 집합에서 공통적으로 존재하는 데이터, 한쪽에만 존재하는
-- 모든 데이터 추출.

-- SELECT 컬럼명1,컬럼명2
-- FROM 테이블1 FULL OUTER JOIN 테이블2
-- ON 조건식

-- 사원 테이블과 부서 테이블의 LEFT OUTER JOIN을 이용하여
-- 사원이 어느 부서에 속해 있는지 조회
SELECT E.FIRST_NAME , D.DEPARTMENT_NAME 
FROM EMPLOYEES e RIGHT OUTER JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID ;

SELECT E.FIRST_NAME , D.DEPARTMENT_NAME 
FROM EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID ;

SELECT E.FIRST_NAME , D.DEPARTMENT_NAME 
FROM EMPLOYEES e FULL OUTER JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID ;


--집합 연산자
-- JOIN과는 별개로 두개의 테이블을 합치는 방법

--1.UNION
-- 두 개의 테이블에서 '중복을 제거하고 합친 모든 행'을 반환한다.

-- 사원 테이블과 부서 테이블을 UNION 한다.
-- 사원 이름과 부서이름의 모든 값을 가져와서 중복을 제거하고 합친다.

SELECT E.FIRST_NAME 
FROM EMPLOYEES e 
UNION
SELECT D.DEPARTMENT_NAME
FROM DEPARTMENTS d ;

--VIEW
-- 하나 이상의 테이블이나 다른 뷰의 데이터를 볼 수있게 하는
-- 데이터 베이스 객체
-- 실제 데이터는 뷰를 구성하는 테이블에 담겨 있지만 마치 테이블처럼 사용할수 있다
-- 테이블 뿐만 아니라 다른 뷰를 참조해 새로운 뷰를 만들어 사용할 수 있다.

-- VIEW의 특징
-- 독립성
-- 테이블 구조가 변경되어도 뷰를 사용하는 응용 프로그램은 변경하지 않아도 된다.

-- 편리성
-- 복잡한 쿼리문을 뷰로 생성함으로써 관련 쿼리를 단순하게 작성할 수 있다.
-- 또한 해당 형태의 SQL문을 자주 사용할 때 뷰를 사용하면 편리하게 이용할 수있다.

-- 보안성
-- 직원의 급여정보와 같이 숨기고 싶은 정보가 존재한다면, 뷰를 생성할 때
-- 해당 컬럼을 빼고 생성함으로써 사용자에게 정보를 감출 수 있다.

--VIEW의 생성
-- CREATE OR REPLACE VIEW 뷰이름 AS(쿼리문)

-- VIEW의 삭제
-- DROP VIEW 뷰이름 RESTRICT OR CASCADE
-- RESTRICT : 뷰를 다른 곳에서 참조하고 있다면 삭제 취소
-- CASCADE : 뷰를 참조하는 다른 뷰나 제약조건까지 모두 삭제

CREATE OR REPLACE VIEW MY_EMPL AS(
	SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY * COMMISSION_PCT) "보너스"
	FROM EMPLOYEES e 
);

SELECT * FROM MY_EMPL;

-- DATA_PLUS 라는 뷰를 만들고
-- 이름, 급여, 급여를 많이 받는 순으로 순위를 매겨서 조회
-- view 조회

CREATE OR REPLACE VIEW DATA_PLUS AS(
	SELECT RANK() OVER(ORDER BY SALARY DESC) "RANK",FIRST_NAME, SALARY
	FROM EMPLOYEES e 
	
);


SELECT * FROM DATA_PLUS;

--VIEW를 PLAYER_AGE로 만들고
-- 선수들의 이름과 나이를 구하여 저장하고
-- 조회

CREATE OR REPLACE VIEW PLAYER_AGE AS(
	SELECT PLAYER_NAME, ROUND((SYSDATE-BIRTH_DATE)/365) "AGE"
	FROM PLAYER p
);

SELECT * FROM PLAYER;

-- 나이가 35살 이상인 선수만 조회하세요

SELECT * FROM PLAYER_AGE
WHERE AGE >= 35 ;


-- TEAM NAME 이라는 VIEW 만들고
-- 선수 이름, 팀이름을 조회
-- TEAM NAME은 TEAM 테이블
--PLAYER NAME은 PLAYER 테이블

CREATE OR REPLACE VIEW TEAM_NAME AS(
	SELECT PLAYER_NAME, REGION_NAME
	
	FROM PLAYER p FULL OUTER JOIN TEAM t 
	ON P.TEAM_ID = T.TEAM_ID
);


SELECT * FROM TEAM_NAME;

SELECT * FROM STADIUM s ;

SELECT * FROM TEAM;


-- STADIUM ID NAME TEAM NAME을
-- 검색하여 STADIUM INFO 를 뷰로 만들고
-- 해당 뷰에서 TEAM_NAME이 NULL인 경기장 조회
CREATE OR REPLACE VIEW STADIUM_INFO AS(
	SELECT S.STADIUM_ID, STADIUM_NAME, TEAM_NAME
	FROM STADIUM s LEFT OUTER JOIN TEAM t 
	ON S.STADIUM_ID = T.STADIUM_ID
);

SELECT * FROM STADIUM_INFO WHERE TEAM_NAME IS NULL;

-- TCL(Transaction Control Language)
-- 트랜잭션 제어 언어

-- 트랜잭션: 데이터베이스 작업을 처리하는 논리적 연산단위
-- ex) select, update, insert, delete 문장

-- 트랜잭션의 특성
-- 원자성(amotomicity)
-- 원자와 같이 데이터베이스 연산들이 나눌수도, 줄일수도 없는 하나의 유닛으로 취급
-- 트랜젝션에 정의된 연산들은 모두 성공적으로 실행 되던지, 전혀 실행되지 않은 상태로 남아야한다.

-- 10000원이 든 계좌 A에서 0원이 든 계좌B로 10000원을 보낸다.
-- UPDATE 게좌A
-- SET 잔액 = 0
-- WHERE 계좌번호 = A;

-- UPDATE 계좌 B
-- SET 잔액 = 10000
-- WHERE 계좌번호 = B;


-- 일관성(Consistency)
-- 데이터베이스의 트랜잭션이 제약조건, cascades, triggers를 포함한
-- 정의된 모든 조건에 맞게 데이터 값이 변경된다.
-- 트랜잭션 실행전의 데이터베이스 내용이 잘못되지 않으면 실행후에도
-- 데이터 베이스의 내용이 잘못되면 안된다.

-- 고립성(Isolation)
-- 특정 DBMS에서 다수의 유저들이 같은 시간에 같은 데이터에 접근하였을때
-- 수행중인 트랜잭션이 완료 될때까지 다른 트랜잭션의 요청을 막음으로서
-- 데이터가 꼬이는것을 방지

-- 영속성(Durability)
-- 트랜잭션 실행이 성공적일 때, 그 트랜잭션이 갱신한 데이터베이스 내용은
-- 영구적으로 저장된다.

-- TCL의 종류
-- COMMIT
-- DML로 변경된 데이터를 데이터베이스에 적용할 때 사용
-- INSERT, UPDATE, DELETE 문 등을 사용한 후 변경 작업을 데이터베이스에
-- 반영하기 위해 사용
-- COMMIT 문 사용시 이전 데이터는 영원히 사라짐
-- COMMIT 문 사용시 모든 사용자가 변경된 데이터 확인 가능
-- SQLServer는 기본적으로 AUTO COMMIT 모드 이므로 자동으로 commit 을 수행한다.

-- ROLLBACK
-- DML로 변경된 데이터를 변경 이전 상대로 되돌릴 때 사용
-- 데이터에 대한 변경사항 취소
-- ROLLBACK문 사용시 이전 데이터 다시 재저장 -> COMMIT 되지 않은 상위 트랜잭션을 모두 ROLLBACK 시킴
-- ROLLBACK문 사용시 행의 잠금(LOCKING)이 풀려 다른 사용자들이 데이터 변경
-- SQLServer는 기본적으로 AUTOCOMMIT 모드로 자동으로 COMMIT,
-- 오류가 발생하면 자동으로 ROLLBACK 처리

--SAVEPOINT
-- 오류 복구에 효과적인 방법
-- 전체 트랜잭션을 ROLLBACK 하지 않고도 오류 복구가 가능
-- 효과적으로 오류 복구 처리를 위해 저장점을 만들어 놓고 사용
-- 복잡한 대규모 트랜잭션에서 에러가 발생했을때 주로 사용
-- 복수의 저장점 정의 가능

-- 저장점까지 롤백할때 : ROLLBAKC TO 저장점명;

-- 저장점 만들기 : SAVEPOINT 저장점명;

-- 사원테이블에서 JOB_ID가 'IT_PROG'인 사람들의 이름을
-- 홍길동으로 바꾸기

UPDATE EMPLOYEES 
SET FIRST_NAME = '홍길동'
WHERE JOB_ID = 'IT_PROG';

SELECT * FROM EMPLOYEES e  WHERE JOB_ID = 'IT_PROG';



























