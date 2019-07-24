-- sub query
SELECT * FROM emp;


-- [100p] KING의 부서명 구하기
SELECT dname
    FROM dept
    WHERE deptno = 
        (SELECT deptno
            FROM emp
            WHERE ename = 'KING');
            
            
-- [101p] 10번 부서에서 근무하는 사원의 이름과 10번 부서의 부서명을 출력하기
SELECT emp.ename, dname
    FROM emp, dept
    WHERE emp.deptno = 10 AND emp.deptno = dept.deptno;
    
-- 서브쿼리 (SELECT ~)는 결과가 테이블로 반환된다.
SELECT e.ename, d.dname
    FROM emp e, (
        SELECT deptno, dname
            FROM dept
            WHERE deptno = 10) d
    WHERE e.deptno = d.deptno;
    
    
-- [102p] 사원들의 평균급여를 구하는 쿼리문을 서브쿼리로 이용하여
-- 평균급여보다 더 많은 급여를 받는 사원의 이름과 급여 출력하기
SELECT ename, sal
    FROM emp
    WHERE sal >= (
        SELECT AVG(sal)
            FROM emp);
            

-- [102p] 사원 이름이 'JONES'인 직원의 부서명을 출력하기
SELECT dname
    FROM dept 
    WHERE deptno = (
        SELECT deptno
            FROM emp
            WHERE ename = 'JONES');
            
-- [102p] 평균 급여보다 더 많은 급여를 받는 사원의
-- 이름, 사번, 급여를 검색하되
-- 급여가 많은 순서로 나열하기
SELECT ename, empno, sal
    FROM emp
    WHERE sal > (
        SELECT AVG(sal)
            FROM emp)
    ORDER BY sal DESC;
    
-- [102p] 부서번호가 10인 사원 중에서 최대급여를 받는 사원과 동일한 급여를
-- 받는 사원의 사번과 이름을 출력하기
SELECT empno, ename
    FROM emp
    WHERE sal = (
        SELECT MAX(sal)
            FROM emp
            GROUP BY deptno
            HAVING deptno = 10);
            
SELECT empno, ename
    FROM emp
    WHERE sal = (
        SELECT MAX(sal)
            FROM emp
            WHERE deptno = 10);
            
SELECT SAL FROM EMP WHERE ename = 'MILLER';


-- [103p] emp 테이블에서 SCOTT의 급여보다 많은 사원의 정보를
-- 사원번호, 이름, 담당업무, 급여 를 출력하기
SELECT empno, ename, job, sal
    FROM emp
    WHERE sal > (
        SELECT sal
            FROM emp
            WHERE ename = 'SCOTT');
            
            
-- [104p] emp 테이블에서 급여의 평균보다 적은 사원의 정보를
-- 사원번호, 이름, 담당업무, 급여, 부서번호 를 출력하기
SELECT empno, ename, job, sal, deptno
    FROM emp
    WHERE sal < (
        SELECT AVG(sal)
            FROM emp);
            
SELECT AVG(sal) FROM emp;


-- [104p] emp 테이블에서 20번 부서의 최소 급여보다 많은
-- 모든 부서의 부서번호, 최소급여 출력하기
SELECT deptno, MIN(sal)
    FROM emp
    GROUP BY deptno
    HAVING MIN(sal) > (
        SELECT MIN(sal)
            FROM emp
            WHERE deptno = 20);
            
            
-- [104p] emp 테이블에서 업무별로 가장 적은 급여를 출력
SELECT job, MIN(sal)
    FROM emp
    GROUP BY job;
    
    
-- 다중 행 쿼리(결과가 2개 이상인 쿼리)에서는 단일 행 연산자 사용불가
-- 다중 행 연산자를 사용
-- [105p] 각 부서별 최소 직원의 모든 정보 출력하기
SELECT *
    FROM emp
    WHERE sal IN (
        SELECT MIN(sal)
            FROM emp
            GROUP BY deptno);
            
            
-- [107p] emp 테이블에서 업무별로 최소 급여를 받는 사원의 정보를
-- 사원번호, 이름, 업무, 입사일자, 급여, 부서번호 를 출력하기
SELECT empno, ename, job, hiredate, sal, deptno
    FROM emp
    WHERE sal IN (
        SELECT MIN(sal)
            FROM emp
            GROUP BY job);
            
            
-- [109p] emp 테이블에서 30번 부서중 급여가 가장 낮은 사람 보다
-- 많은 급여를 받는 사원의 이름, 급여 출력하기
SELECT ename, sal
    FROM emp
    WHERE sal > ANY (
        SELECT MIN(sal)
            FROM emp
            WHERE deptno = 30);
            
            
SELECT ename, sal, deptno
    FROM emp
    WHERE deptno = ANY (
        SELECT DISTINCT deptno
            FROM emp
            WHERE sal >= 3000);
            
            
-- [110p] emp 테이블에서 30번 부서의 최소 급여를 받는 사원보다 많은
-- 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여, 부서번호 를 출력하기
SELECT empno, ename, job, hiredate, deptno
    FROM emp
    WHERE sal > ANY (
        SELECT MIN(sal)
            FROM emp
            WHERE deptno = 30);
            
            
-- [111p] emp 테이블에서 부서번호가 30인 모든 사원의 급여보다 큰 사원의
-- 정보를 이름, 급여 출력하기
SELECT ename, sal
    FROM emp
    WHERE sal > ALL(
        SELECT sal
            FROM emp
            WHERE deptno = 30);
            
            
-- [112p] dept 테이블에서 부서명과 부서코드를 출력하는데,
-- emp 테이블에서 존재하는 부서코드만 출력하기
SELECT dname, deptno
    FROM dept
    WHERE EXISTS(
        SELECT *
            FROM emp
            WHERE emp.deptno = dept.deptno);
            
            
-- [112p] emp 테이블에서 mgr에 존재하는 사원의
-- 사번, 이름, 월급을 한번씩만 출력하기
SELECT DISTINCT empno, ename, sal
    FROM emp e
    WHERE EXISTS(
        SELECT *
            FROM emp m
            WHERE e.empno = m.mgr);
            
            
-- 연습문제 [114p]
-- [1] SCOTT의 급여와 동일하거나 더 많이 받는 사원의
-- 이름과 급여를 출력하기
SELECT ename, sal
    FROM emp
    WHERE sal >= (
        SELECT sal
            FROM emp
            WHERE ename = 'SCOTT');
            
            
-- [2] 직급이 'CLERK'인 사람의
-- 부서번호, 부서명을 출력하기
SELECT deptno, dname
    FROM dept
    WHERE deptno IN (
        SELECT deptno
            FROM emp
            WHERE job = 'CLERK');
            
            
-- [3] 이름에 T를 포함하고 있는 사원들과 같은 부서에서 근무하는 사원의
-- 사원번호, 이름 을 출력하기
SELECT empno, ename
    FROM emp
    WHERE deptno IN(
        SELECT deptno
            FROM emp
            WHERE ename LIKE '%T%');
            
-- [4] 부서 위치가 'DALLAS' 인 모든 사원의
-- 이름, 부서번호 를 출력하기
SELECT ename, empno
    FROM emp
    WHERE deptno IN(
        SELECT deptno
            FROM dept
            WHERE LOC = 'DALLAS');
            
            
-- [5] 'SALES' 부서의 모든 사원의
-- 이름, 급여 출력하기
SELECT ename, sal
    FROM emp
    WHERE deptno IN(
        SELECT deptno
            FROM dept
            WHERE dname = 'SALES');


-- [6] 'KING' 에게 보고하는 (=매니져가 'KING'인 사원) 모든 사원의
-- 이름, 급여 출력하기
SELECT ename, sal
    FROM emp
    WHERE mgr IN(
        SELECT empno
            FROM emp
            WHERE ename = 'KING');
    

-- [7] 자신의 급여가 평균급여보다 많고 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의
-- 이름, 급여 출력하기
SELECT ename, sal
    FROM emp
    WHERE sal > 
        (SELECT AVG(sal)
            FROM emp) AND
    deptno IN(
        SELECT deptno
            FROM emp
            WHERE ename LIKE '%S%');
    
SELECT * FROM EMP;
SELECT * FROM dept;