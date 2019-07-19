-- 2019. 07. 19


-- 테이블 생성하기
CREATE TABLE emp (
    empno       NUMBER(4) NOT NULL,
    ename       VARCHAR2(10),
    job         VARCHAR2(9),
    mgr         NUMBER(4),
    hiredate    DATE,
    sal         NUMBER(7, 2),
    comm        NUMBER(7, 2),
    deptno      NUMBER(2)
);


-- 튜플 삽입하기 (= 데이터 삽입하기)
INSERT INTO emp
    VALUES(7369, 'SMITH', 'CLERK', 7902, '1908-12-17', 800, NULL, 20);



-- 튜플 삽입하기 (= 데이터 삽입하기)
INSERT INTO emp
    VALUES(7499, 'ALLEN', 'SALESMAN', 7698,
    TO_DATE('1981-02-20', 'YYYY-MM-DD'),
    1600, 300, 30);


-- 튜플 삽입하기 (예제 사용)
INSERT INTO emp VALUES
        (7566, 'JONES', 'MANAGER', 7839,
        TO_DATE('1981-04-02', 'YYYY-MM-DD'),  2975, NULL, 20);
        
INSERT INTO emp VALUES
        (7654, 'MARTIN', 'SALESMAN', 7698,
        TO_DATE('1981-09-28', 'YYYY-MM-DD'), 1250, 1400, 30);
        
INSERT INTO EMP VALUES
        (7698, 'BLAKE', 'MANAGER', 7839,
        TO_DATE('1981-05-01', 'YYYY-MM-DD'),  2850, NULL, 30);
        
INSERT INTO EMP VALUES
        (7782, 'CLARK', 'MANAGER', 7839,
        TO_DATE('1981-06-09', 'YYYY-MM-DD'),  2450, NULL, 10);
        
INSERT INTO EMP VALUES
        (7788, 'SCOTT', 'ANALYST', 7566,
        TO_DATE('1982-12-09', 'YYYY-MM-DD'), 3000, NULL, 20);
        
INSERT INTO EMP VALUES
        (7839, 'KING', 'PRESIDENT', NULL,
        TO_DATE('1981-11-17', 'YYYY-MM-DD'), 5000, NULL, 10);
        
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN', 7698,
        TO_DATE('1981-09-08', 'YYYY-MM-DD'),  1500, NULL, 30);
        
INSERT INTO EMP VALUES
        (7876, 'ADAMS', 'CLERK', 7788,
        TO_DATE('1983-01-12', 'YYYY-MM-DD'), 1100, NULL, 20);
        
INSERT INTO EMP VALUES
        (7900, 'JAMES', 'CLERK', 7698,
        TO_DATE('1981-12-03', 'YYYY-MM-DD'),   950, NULL, 30);
        
INSERT INTO EMP VALUES
        (7902, 'FORD', 'ANALYST', 7566,
        TO_DATE('1981-12-03', 'YYYY-MM-DD'),  3000, NULL, 20);
        
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK', 7782,
        TO_DATE('1982-01-23', 'YYYY-MM-DD'), 1300, NULL, 10);


-- 테이블 생성하기 (부서 : dept)
CREATE TABLE dept
    (DEPTNO NUMBER(2), DNAME VARCHAR2(14), LOC VARCHAR(13));
    
    
-- 부서 테이블에 튜블 삽입하기
INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');

SELECT * FROM dept;


-- 삭제하기 (DNAME : MILLER)
DELETE FROM dept WHERE DNAME = 'OPERATIONS';

SELECT * FROM dept;

INSERT INTO dept
    VALUES(40, 'OPERATIONS', 'BOSTON');
    
SELECT * FROM dept;


-- 테이블 생성하기 (호봉 : SALGRADE)
CREATE TABLE SALGRADE(
    GRADE   NUMBER,
    LOSAL   NUMBER,
    HISAL   NUMBER);
 

-- 튜플 삽입하기
INSERT INTO SALGRADE VALUES(1, 700, 1200);
INSERT INTO SALGRADE VALUES(2, 1201, 1400);
INSERT INTO SALGRADE VALUES(3, 1401, 2000);
INSERT INTO SALGRADE VALUES(4, 2001, 3000);
INSERT INTO SALGRADE VALUES(5, 3001, 9999);


-- 테이블 생성하기 (수당 : BONUS)
CREATE TABLE BONUS(
    ENAME   VARCHAR2(10),   -- 사원명
    JOB     VARCHAR2(9),    -- 업무
    SAL     NUMBER,         -- 급여
    COMM    NUMBER);        -- 수당


-- 출력창에 해당 테이블의 속성 출력하기
DESC EMP;


-- 산술 표현식
SELECT ENAME, SAL, SAL + 300 FROM EMP;


-- 산술 표현식에서 NULL이 포함된 경우, 값도 NULL
SELECT EMPNO, ENAME, SAL, COMM, SAL + COMM / 100 
    FROM EMP;


-- NVL 함수 (NULL값을 특정한 값으로 변환하는 함수)
SELECT ENAME, SAL, COMM, SAL * 12 * NVL(COMM, 0)
    FROM EMP;
    
SELECT * FROM EMP;

-- EMP 테이블에서 ENAME을 NAME으로, SAL을 SALARY로 출력하기
SELECT ENAME AS NAME, SAL SALARY
    FROM EMP;
    
    
-- EMP 테이블에서 ENAME을 NAME으로, SAL * 12를 Annual Salary로 출력하기
SELECT ENAME "NAME", SAL * 12 "Annual Salary"
    FROM EMP;


-- EMP 테이블에서 ENAME을 "성 명"으로, SAL * 12를 "급 여"로 출력하기
SELECT ENAME "성 명", SAL * 12 "급 여"
    FROM EMP;
    
    
-- EMP 테이블에서 이름과 업무를 연결하여 출력하기
SELECT ENAME || ' ' || JOP AS "EMPLYEES"
    FROM EMP;
    
    
-- EMP 테이블에서 이름과 업무를 "KING is a PRESIDENT" 형식으로 출력하기
SELECT ENAME || ' ' || 'is a' || ' ' || JOP AS "Employees Details"
    FROM EMP;
    
    
-- EMP 테이블에서 이름과 연봉을 "KING: 1 Year salary = 60000"형식으로 출력하기
SELECT ENAME || ': 1 Year salary = ' || SAL * 12 MONTHLY
    FROM EMP;
    
    
-- EMP 테이블에서 JOP을 모두 출력하기
SELECT JOP FROM EMP;


-- EMP 테이블에서 담당하고 있는 업무의 종류를 출력하기
SELECT DISTINCT JOP
    FROM EMP;
    
    
-- 부서별로 담당하는 업무를 한번씩 출력하기
SELECT DISTINCT DEPNO, JOP
    FROM EMP;