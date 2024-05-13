-- 학생 테이블
-- DEFAULT, CHECK
CREATE TABLE TBL_STUDENT(
	ID NUMBER, --학번
	NAME VARCHAR2(100),
	MAJOR VARCHAR2(100),
	GENDER CHAR(1) DEFAULT 'W' NOT NULL CONSTRAINT BAN_CHAR CHECK(GENDER='M' OR GENDER='W'),
	BIRTH DATE CONSTRAINT BAN_DATE CHECK(BIRTH >= TO_DATE('1980-01-01', 'YYYY-MM-DD')),
	CONSTRAINT STD_PK PRIMARY KEY(ID)
)
--DEFAULT 와 NOT NULL

--GENDER CHAR(1) DEFAULT 'W'

--QUERY1
--INSERT INTO TBL_STUDENT GENDER VALUES(NULL);
--'NULL' 이라는 특정한 값을 받았다고 생각하여, 아무일도 일어나지 않는다.
--QUERY2
--INSERT INTO TBL_STUDENT GENDER VALUES(NULL);
--아무런 입력도 받지 않았다고 생각하기 때문에 DEFAULT 값인 'W'로 설정된다.
-- 1. NOT NULL만 선언한 경우
-- NULL값을 넣어 추가한경우 : NOT NULL이 동작
-- 아무값도 넣지 않고 추가했을 때 : NOT NULL이 동작

--2. NOT NULL과 DEFAULT를 둘 다 선언한 경우
-- 아무값도 넣지 않고 추가 했을 때 : DEFAULT가 동작하여 기본값이 들어감
--NULL 값을 넣고 추가 했을때 : NOT NULL이 동작

-- 무결성
-- 데이터베이스에 저장된 데이터 값과 그것이 표현하는 현실 세계의 실제 값이 일치하는지
-- 정확성을 의미한다.
-- 무결성 제약조건은 DB에 들어있는 데이터의 정확성을 보장하기 위해 부정확한 자료가DB
--내에 저장되는 것을 방지하기 위한 제약조건을 말한다.
-- 데이터의 정확성, 일관성, 유효성이 유지되게 하는것
-- 정확성 : 중복이나 누락이 없는 상태
-- 일관성 : 원인과 결과의 의미가 연속적으로 보장되어 변하지 않는 상태
-- 유효성 : 사용자로부터 값을 입력받을 때 정확한 값만 입력되도록 하는것

-- 1.개체 무결성
-- PK로 선택된 컬럼은 고유한 값을 가져야하며, 빈 값, NULL값은 허용하지 않는다

-- 2. 참조 무결성
-- 외래키 값은 NULL이거나 참조하는 테이블의 기본키로  설정된 속성의 값과 동일해야 한다.
-- 즉, 테이블은 참조할 수 없는 외래키 값을 가질 수 없다.

-- 3. 도메인 무결성
-- 주어진 속성의 값들이 도메인에 속한 값이어야 한다.

-- 4. 사용자 정의 무결성
-- 속성 값들이 사용자가 정의한 제약 조건에 만족해야 한다는 규정이다.


-- 모델링
-- 정보시스템 구축의 대상이 되는 업무 내용을 분석하여 이해하고 약속된 표기법에 의해
-- 표현하는 것
-- 분석된 모델을 가지고 실제 데이터베이스를 생성하여 개발 및 관리에 사용된다.
-- 특히 데이터를 추상화한 데이터 모델은 데이터베이스의 골격을 이해하고 그 이해를 바탕으로
-- SQL문장을 기능과 성능적인 측면에서 효율적으로 작성할 수 있기 때문에, 모델링 작업은
-- 데이터 베이스 설계의 핵심 과정이다.

--데이터 모델링의 특징
-- 추상화 : 현실 세계를 일정한 형식에 맞춰 간략하게 표현해야 한다.
-- 단순화 : 누구나 쉽게 이해할 수 있도록 제한된 표기법이나 언어를 사용해야 한다.
-- 명확화 : 명확하게 의미가 해석되어야 하고, 한 가지 의미만을 가져야 한다.

-- 1. 요구사항 분석
-- 고객과의 의사소통을 통해 고객의 업무 프로세스를 완벽하게 이해하고
-- 그들의 요구를 구체적으로 뽑아내는 과정

-- 2. 개념 모델링
-- 내가 하고자 하는 일의 데이터 간의 관계를 구상하는 단계
-- 각 객체들과 그들간의 관계를 발견하고 표현하기 위해 ERD를 생성한다.

-- 3. 논리 모델링
-- 개념적인 데이터 모델이 완성되면, 논리 데이터 모델을 만들어 내야 한다.
-- KEY, 속성, 관계 등을 표시하며, 정규화 활동을 수행한다.
-- 정규화는 데이터 모델의 일관성을 확보하고 중복을 제거하여 신뢰성 있는 데이터 구조를
-- 얻는데 목적이 있다.
/*
 * 회원
 * 회원아이디(PK)
 * -----------
 * 회원비밀번호
 * 회원 이름
 * 회원 이메일
 * 회원 생일
 */
-- 4. 물리 모델링
-- 최종적으로 데이터를 관리할 데이터베이스를 선택하고, 선택한 데이터베이스에 실제 테이블을 만드는 작업을 말한다.
-- 시각적인 구조를 만들었으면 그것을 실제로 SQL 코딩을 통해 완성하는 단계

/*
 * USER
 * USER ID : VARCHAR2(100)
 * --------------------
 * USER_PW : VARCHAR2(100)
 * USER_NAME : VARCHAR2(200)
 * USER_ADDRESS : VARCHAR2(300)
 * USER_EMAIL : VARCHAR2(300)
 * USER_BIRTH : DATE
 * 
 * 
 * 
 * PRODUCT
 * PRODUCT_NUM : NUMBER
 * -------------------
 * PRODUCT_NAME: VARCHAR2(300)
 * PRODUCT_PRICE : NUMBER
 * PRODUCT_COUNT : NUMBER
 * 
 * 
 * ORDER
 * ORDER_NUM : NUMBER
 * ----------------------
 * ORDER_DATE : DATE
 * USER_ID : VARCHAR2(100)
 * PRODUCT_NUM : NUMBER
 */

-- 5. 구현

/*
 * USER
 * USER ID : VARCHAR2(100)
 * --------------------
 * USER_PW : VARCHAR2(100)
 * USER_NAME : VARCHAR2(200)
 * USER_ADDRESS : VARCHAR2(300)
 * USER_EMAIL : VARCHAR2(300)
 * USER_BIRTH : DATE
 */
CREATE TABLE "USER"(
	USER_ID VARCHAR2(100) PRIMARY KEY,
	USER_PW VARCHAR2(100),
	USER_NAME VARCHAR2(200),
	USER_ADDRESS VARCHAR2(300),
	USER_EMAIL VARCHAR2(300),
	USER_BIRTH DATE
)

/* PRODUCT
 * PRODUCT_NUM : NUMBER
 * -------------------
 * PRODUCT_NAME: VARCHAR2(300)
 * PRODUCT_PRICE : NUMBER
 * PRODUCT_COUNT : NUMBER
 * */
CREATE TABLE PRODUCT (
	PRODUCT_NUM NUMBER PRIMARY KEY,
	PRODUCT_NAME VARCHAR2(300),
	PRODUCT_PRICE NUMBER,
	PRODUCT_COUNNT NUMBER
);
 /* ORDER
 * ORDER_NUM : NUMBER
 * ----------------------
 * ORDER_DATE : DATE
 * USER_ID : VARCHAR2(100)
 * PRODUCT_NUM : NUMBER
 */

CREATE TABLE "ORDER" (
	ORDER_NUM NUMBER PRIMARY KEY,
	ORDER_DATE DATE,
	USER_ID VARCHAR2(100), --외래키로 참조할 컬럼의 데이터 타입과 길이를 반드시 일치시켜야한다.
	PRODUCT_NUM NUMBER,
	CONSTRAINT USER_FK FOREIGN KEY(USER_ID) REFERENCES "USER"(USER_ID),
	CONSTRAINT PRODUCT_FK FOREIGN KEY(PRODUCT_NUM) REFERENCES "PRODUCT"(PRODUCT_NUM)
);


/*FLOWER
 * FLOWER_NAME : VARCHAR2
 * ----------
 * FLOWER_COLOR : VARCHAR2
 * FLOWER_PRICE : NUMBER
 */

CREATE TABLE FLOWER(
	FLOWER_NAME VARCHAR2(100) PRIMARY KEY,
	FLOWER_COLOR VARCHAR2(100),
	FLOWER_PRICE NUMBER
);

/*POT
 * POT_NUMBER : NUMVER
 * ---------------------
 * POT_COLOR : VARCHAR2
 * POT_SHAPE : VARCHAR2
 * FLOWER_NAME : VARCHAR2
 */

CREATE TABLE POT (
	POT_NUMBER NUMBER PRIMARY KEY,
	POT_COLOR VARCHAR2 (100),
	POT_SHAPE VARCHAR2 (100),
	FLOWER_NAME VARCHAR2(100),
	CONSTRAINT POTFK FOREIGN KEY(FLOWER_NAME) REFERENCES"FLOWER"(FLOWER_NAME)	
);

------------------------------------------------------------------------------
-- EMPLOYEES 테이블의 모든 데이터 조회하기
SELECT * FROM EMPLOYEES;

-- DEPARTMENTS 테이블의 모든 데이터 조회하기
SELECT * FROM DEPARTMENTS;
--사원 테이블에서 이름, 직종, 급여를 조회하세요
SELECT FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES;

-- 사원테이블에서 사번, 이름, 직종, 급여, 보너스비율, 실제 보너스 금액 출력

SELECT EMPLOYEE_ID,
		FIRST_NAME,
		JOB_ID,
		SALARY,
		COMMISSION_PCT,
		SALARY * COMMISSION_PCT "보너스"
		FROM EMPLOYEES;
-- 사원 테이블에서 급여가 10000이상인 사원들의 정보를 사번, 이름, 급여순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 10000;

-- 사원 테이블에서 이름이 Michael인 사원의 사번, 이름을 조회
-- 데이터베이스에서 문자열 데이터는 ''에 넣는다.
-- 키워드는 대소문자를 가리지 않지만 데이터는 대소문자를 정확하게 써야한다(ex: Michael)
SELECT EMPLOYEE_ID, FIRST_NAME  FROM EMPLOYEES
WHERE FIRST_NAME = 'Michael';




















