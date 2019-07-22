-- 19_07_22


-- [40p] EMP 테이블에서 급여가 1100이상이고 JOB이 Manager인 사원의 정보를
-- 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호 를 출력하기
SELECT empno, ename, job, sal, hiredate, deptno
    FROM emp
    WHERE sal >= 1100 OR job = 'MANAGER';
    
    
-- [41p] EMP테이블에서 급여가 JOB이 MANAGER, CLEAR, ANALYST가 아닌 사원의 정보를
-- 사원번호, 성명, 담당업무, 급여, 부서번호 를 출력하기
SELECT empno, ename, job, sal, deptno
    FROM emp
    WHERE job NOT IN('MANAGER', 'CLEAR', 'ANALYST');
    
    
-- [42P] 업무가 PRESIDENT 이고 급여가 1500 이상이거나 엄무가 SALESMAN인 사원의
-- 정보를 사원번호, 이름, 업무, 급여 를 출력하기
SELECT empno, ename, job, sal
    FROM emp
    WHERE job = 'PRESIDENT' AND sal >= 1500 OR job = 'SALESMAN';

    
-- [42P] 업무가 PRESIDENT 또는 SALESMAN이고 급여가 1500 이상인
-- 사원의 정보를 사원 번호, 이름, 업무, 급여 를 출력하기
SELECT empno, ename, job, sal
    FROM emp
    WHERE job IN('PRESIDENT', 'SALESMAN') AND sal >= 1500;
    

-- [43p] emp 테이블에서 입사일자 순으로 정렬하여
-- 사원번호, 이름, 업무, 급여, 입사일자, 부서번호 를 출력하기
SELECT empno, ename, job, sal, hiredate, deptno
    FROM emp
    ORDER BY hiredate ASC;
    

-- [43p] emp 테이블에서 가장 최근에 입사한 순으로
-- 사원번호, 이름, 업무, 급여, 입사일자, 부서번호 를 출력하기
SELECT empno, ename, job, sal, hiredate, deptno
    FROM emp
    ORDER BY hiredate DESC;
    
    
-- [44p] emp 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우 급여가 많은
-- 순으로 정렬하여 사원번호, 성명, 업무, 부서번호, 급여 를 출력하기
SELECT empno, ename, job, deptno, sal
    FROM emp
    ORDER BY deptno ASC, sal DESC;