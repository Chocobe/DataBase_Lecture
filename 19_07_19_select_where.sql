-- EMP 테이블에서 담당 업무가 MANAGER 인 사원의 정보를
-- 사원번호, 성명, 담당업무, 급여, 부서번호 를 출력하기
SELECT EMPNO, ENAME, JOP, SAL,DEPNO
    FROM EMP
    WHERE JOP = 'MANAGER';
    
    
-- EMP 테이블에서 입사일자가 1982년 1월 1일 이후에 입사한 사원의 정보를
-- 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호 를 출력하기
SELECT EMPNO, ENAME, JOP, SAL, HIREDATE, DEPNO
    FROM EMP
    WHERE HIREDATE > '1982-01-01';
    

-- EMP 테이블에서 급여가 1250에서 1500 사이의 정보를
-- 성명, 담당업무, 급여, 부서번호를 출력하기
SELECT ENAME, JOP, SAL, DEPNO
    FROM EMP
    WHERE SAL BETWEEN 1250 AND 1500;
    
SELECT ENAME, JOP, SAL, DEPNO
    FROM EMP
    WHERE SAL >= 1250 AND SAL <= 1500;
    
    
-- EMP 테이블에서 사원번호가 7902, 7788, 7566인 사원의 정보를 
-- 사원번호, 성명, 담당업무, 급여, 입사일자 를 출력하기
SELECT EMPNO, ENAME, JOP, SAL, HIREDATE
    FROM EMP
    WHERE EMPNO IN(7902, 7788, 7566);
    
    
-- EMP 테이블에서 입사일자가 82년도에 입사한 사원의 정보를
-- 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하기
SELECT EMPNO, ENAME, JOP, SAL, HIREDATE, DEPNO
    FROM EMP
    WHERE HIREDATE LIKE '82%';
    

-- 저장한 날짜 형식 바꾸기
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YY';

SELECT * FROM EMP;

ALTER SESSION SET NLS_DATE_FORMAT = 'YY-MM-DD';

SELECT * FROM EMP;


-- EMP 테이블에서 보너스가 NULL인 사원의 정보를
-- 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호 를 출력하기
SELECT EMPNO, ENAME, JOP, SAL, COMM, DEPNO
    FROM EMP
    WHERE COMM IS NULL;