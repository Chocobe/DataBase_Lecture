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


-- 테이블 삭제하기
DROP TABLE emp;


-- 테이블 생성하기 (직원 : emp)
CREATE TABLE emp (
    empno       NUMBER(4) NOT NULL,
    ename       VARCHAR2(10),
    jop         VARCHAR2(9),
    mgr         NUMBER(4),
    hiredate    DATE,
    sal         NUMBER(7, 2),
    comm        NUMBER(7, 2),
    depno       NUMBER(2)
);



-- 튜플 삽입하기 (= 데이터 삽입하기)
INSERT INTO emp
    VALUES(7369, 'SMITH', 'CLERK', 7902, '1908-12-17', 800, NULL, 20);



-- 튜플 삽입하기 (= 데이터 삽입하기)
INSERT INTO emp
    VALUES(7499, 'ALLEN', 'SALESMAN', 7698,
    TO_DATE('1981-02-20', 'YYYY-MM-DD'),
    1600, 300, 30);


-- 데이터 조회하기
SELECT * FROM emp;


-- 예제 사용
INSERT INTO emp VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        TO_DATE('1981-04-02', 'YYYY-MM-DD'),  2975, NULL, 20);
        
INSERT INTO emp VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        TO_DATE('1981-09-28', 'YYYY-MM-DD'), 1250, 1400, 30);
        
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        TO_DATE('1981-05-01', 'YYYY-MM-DD'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        TO_DATE('1981-06-09', 'YYYY-MM-DD'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('1982-12-09', 'YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('1981-11-17', 'YYYY-MM-DD'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        TO_DATE('1981-09-08', 'YYYY-MM-DD'),  1500, NULL, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('1983-01-12', 'YYYY-MM-DD'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        TO_DATE('1981-12-03', 'YYYY-MM-DD'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        TO_DATE('1981-12-03', 'YYYY-MM-DD'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        TO_DATE('1982-01-23', 'YYYY-MM-DD'), 1300, NULL, 10);

SELECT * FROM emp;


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