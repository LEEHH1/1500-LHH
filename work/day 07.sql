-- PL/SQL
-- Oracle's Procedual Language extension to SQL
-- 오라클에서 SQL을 확장하여 사용하는 프로그래밍 언어
-- 이름과 같이 절차적 프로그래밍 언어이다.

-- PL/SQL의 기본구조

/*
 * DECLARE -> 선언부
 * 
 * 
 * IS
 * 
 * BEGIN -> 실행문
 * 쿼리문을 작성할 수 있다.
 * END;
 * 
 */

-- PL/SQL문을 사용하는 이유
-- 대용량 데이터를 연산해야 할 때, WAS등의 서버로 전송해서
-- 처리하려면 네트워크에 부하가 많이 걸릴수 있다.
-- 이때 함수를 사용하여 데이터를 연산하고 가공한 후에
-- 최종 결과만 서버에 전송하면 부담을 많이 줄일 수 있다.
-- 쿼리문을 직접 노출하지 않는 만큼, SQL injection의 위험성이 줄어든다.
-- 블록 단위로 유연하게 사용할 수 있다.

-- 프로시저(procedure)
-- PL/SQL의 대표적인 부 프로그램에 프로시저가 있다.
-- 데이터 베이스에 대한 일련의 작업을 정리한 절차를
-- RDBMS에 저장한 것으로 영구 저장 모듈이라고도 한다.
-- 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합


-- 장점
-- 하나의 요청으로 여러 SQL문을 실행할 수 있다.
-- 네트워크 소요 시간을 줄여 성능을 개선할 수 있따.
-- 기능 변경이 편하다.

-- 단점
-- 문자나 숫자 연산에 사용하면 오히려 C,JAVA보다 느려질 수 있다.
-- 유지보수가 쉽지 않다.

-- 프로 시저의 생성
/*
 * CREATE OR REPLACE PROCEDURE 프로시저명(
 * 		매개변수 IN 데이터타입 := 값;
 * 		매개변수 IN 컬럼 % TYPE
 * )
 * IS
 * 함수 내에서 사용할 변수, 상수 등을 선어
 * BEGIN
 * 실행할 명령들
 * END;
 * CALL 프로시저명(값1,...)
 * 
 * 
 * 
 * */

BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO');
END;

-- 간단한 프로시저 만들기
-- F(X) = 2+1;
-- F : 함수의 이름
-- F: 함수의 이름
--(X) : 매개변수
--2X+1:리턴값

CREATE OR REPLACE PROCEDURE F(
	X IN NUMBER
)
IS
BEGIN 
	DBMS_OUTPUT.PUT_LINE(2*X+1);
END;

--프로시저의 호출

CALL F(3);

--프로시저와 SQL
-- JOBS 테이블에 데이터를 INSERT해주는 프로시저 만들기

--JOBS 테이블에 어떤 컬럼이 있는지 확인
SELECT *FROM JOBS;
--JOBID
--JOB_TITLE
--MIN_SALARY
--MAX_SALARY

CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC(
	P_JOB_ID IN JOBS.JOB_ID%TYPE,
	P_JOB_TITLE IN JOBS.JOB_TITLE%TYPE,
	P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE,
	P_MAX_SALARY IN JOBS.MAX_SALARY%TYPE
)
IS 
	CNT NUMBER := 0;
BEGIN
	-- JOBS로부터 카운트가 됐다면 CNT 변수에 대입해라.
	SELECT  COUNT(JOB_ID) INTO CNT FROM JOBS WHERE JOB_ID = P_JOB_ID;
	-- 만약 조회된 행이 없다면 INSERT 해라
	IF CNT = 0 THEN
	INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
	VALUES(P_JOB_ID,P_JOB_TITLE,P_MIN_SALARY,P_MAX_SALARY);
	DBMS_OUTPUT.PUT_LINE('ALL DONE ABOUT'||' '||P_JOB_ID);
	ELSE
	-- 전달받은 값으로 테이블을 UPDATE하기
	UPDATE JOBS 
	SET JOB_TITLE = P_JOB_TITLE,
	MIN_SALARY = P_MIN_SALARY,
	MAX_SALARY =P_MAX_SALARY
	WHERE JOB_ID = P_JOB_ID;
	DBMS_OUTPUT.PUT_LINE('UPDATE ALL DONE'||' '||P_JOB_ID);
END IF;
END;


CALL MY_NEW_JOB_PROC('IT','B/E',7000,8000);

SELECT *FROM JOBS;

-- 다시 프로시저를 실행 했을 때 PK 제약 조건으로 인해
-- 실행이 안될 때, UPDATE가 되게 만들어보자.

--IF문
-- 1. IF조건 THEN 실행문;
--    END IF;

-- 2. IF 조건 THEN 실행문;
--	  ELSE 실행문;
--    END IF;

-- 3. IF 조건 THEN 실행문;
--    ELSIF 조건문 THEN 실행문;
--    ELSE 실행문;
--    END IF;

DECLARE
	SCORE NUMBER := 80; -- =은 같다의 의미이기 때문에 :=를 써야 대입이 된다.
	GRADE VARCHAR2(5); -- 어떤 학점인지 정확히 알수 없기 때문에 초기화를 할수가 없다.
BEGIN
	IF SCORE >= 90 THEN GRADE := 'A';
	ELSIF SCORE>= 80 THEN GRADE := 'B';
	ELSIF SCORE>=70 THEN GRADE := 'C';
	ELSIF SCORE >= 60 THEN GRADE := 'D';
	ELSE GRADE :='F';
END IF;
DBMS_OUTPUT.PUT_LINE('당신의 점수 : '||SCORE||'점'||CHR(10)||'학점:'||GRADE);
END;

-- 제거하는 프로시저 만들기
-- JOB_ID 데이터를 하나 전달해서 DELETE문이 작동하는 프로시저 만들기
-- 데이터가 있으면 삭제하고 'DELETE ALL DONE ABOUT 데이터'
-- 데이터가 없으면 'NO EXIST 데이터'

CREATE OR REPLACE PROCEDURE MY_DELETE_JOB_PROC (
	T_JOB_ID IN JOBS.JOB_ID%TYPE -- 외부에서 받는 데이터와 대응하는 JOB ID
)
IS 
	CNT NUMBER := 0;
BEGIN
	SELECT  COUNT(JOB_ID) INTO CNT FROM JOBS WHERE JOB_ID = T_JOB_ID;
	IF CNT > 0 THEN
	DELETE FROM JOBS
	WHERE JOB_ID = T_JOB_ID;
	DBMS_OUTPUT.PUT_LINE('DELETE ALL DONE ABOUT'||' '||T_JOB_ID);
	ELSE
	DBMS_OUTPUT.PUT_LINE('NO EXIST'||' '||T_JOB_ID);
END IF;
END;

CALL MY_DELETE_JOB_PROC('IT');

-- SEQUENCE 시퀀스
-- 테이블에 값을 추가할 때 자동으로 순차적인 값이 들어가도록 설정해주는 객체
-- 예를 들어 회원가입을 할때 사람들에게 순차적으로 중복되지 않는 값을 부여할 수 있다.
-- 게시판에 작성된 게시글 순서대로 순차적인 게시글 번호를 부여할 수 있다.
-- CREATE SEQUENCE 시퀀스명;

-- 시퀀스의 다양한 옵션
-- INCREMENT BY 1    1씩 증가
-- START WITH -> 1부터 카운팅
-- MINVALUE 1 -> 최소값
-- MAXVALUE 100 -> 최대값
-- CACHE 20 -> 미리 20개의 INDEX 공간을 확보 20명이 동시에 접속해서 글을 써도 버벅이지 않게 해준다.
-- NOCACHE -> 1개의 인덱스 공간만 확보

-- 시퀀스를 이미 만들었다면 SQL문을 통해 옵션을 설정할 수 있다.
-- ALTER SEQUENCE 시퀀스명 INCREMENT BY1 MINVALUE BY 1 MAXVALUE 100 NOCACHE;

-- 시퀀스를 사용할 때 주의할점
-- CACHE 옵션을 사용하면 속도를 증가시키기 위해 시퀀스 번호를 한번에 여러개 씩
-- 메모리에 올려놓고 작업을 하게 된다.
-- 이러한 경우 DB를 중지 시키거나 전원이 OFF 되는 경우 메모리에 있던 번호가 삭제 되기 때문에
-- 1,2,3 순차적으로 나오다가 21부터 나올 수 있다.

CREATE TABLE PERSON(
	IDX NUMBER PRIMARY KEY,
	NAME VARCHAR2(200),
	AGE NUMBER
);


CREATE SEQUENCE PERSON_SEQ;


-- 데이터 추가하기
-- 시퀀스명.NEXTVAL : 해당 시퀀스에서 다음 순번 값을 자동으로 가져온다.
INSERT INTO PERSON VALUES(PERSON_SEQ.NEXTVAL,'홍길동',30);
INSERT INTO PERSON VALUES(PERSON_SEQ.NEXTVAL,'김자바',287);
INSERT INTO PERSON VALUES(PERSON_SEQ.NEXTVAL,'박디비',15);

SELECT * FROM PERSON;

-- SELECT 절에서도 NEXTVAL을 할수 있는데 값이 증가되기 때문에 주의해야 한다.
SELECT PERSON_SEQ.NEXTVAL FROM DUAL;

-- 시퀀스의 현재값 보는법
-- 시퀀스명.CURRVAL
SELECT PERSON_SEQ.CURRVAL FROM DUAL;  

-- 시퀀스 값을 초기화 하는법
-- 제일 좋은 방법은 시퀀스를 삭제하고 다시 만드는것
-- 하지만 대부분의 경우 권한이 없기 때문에 삭제할 수 없는 경우가 많다.

-- 1. 현재시퀀스의 값을 확인한다
SELECT PERSON_SEQ.CURRVAL FROM DUAL;

-- 2. 현재 시퀀스 값 만큼 INCREMENT를 뺀다.
ALTER SEQUENCE PERSON_SEQ INCREMENT BY -3;

-- 3. NEXTVAL로 -3을 뺀다.
SELECT PERSON_SEQ.NEXTVAL FROM DUAL;

-- 4. 시퀀스의 증가량을 1로 다시 바꾼다
ALTER SEQUENCE PERSON_SEQ INCREMENT BY 1; 


-- 시퀀스 삭제
DROP SEQUENCE PERSON_SEQ;

























