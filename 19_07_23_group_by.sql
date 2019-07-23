-- 19_07_23 Group by

-- [78p] 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균,
-- 급여의 합 을 구하여 출려하기
SELECT deptno, job, COUNT(*), AVG(sal), SUM(sal)
    FROM emp
    GROUP BY deptno, job;
    
    
-- [79p] emp 테이블에서 부서 인원이 3명보다 많은 부서의
-- 부서번호, 인원수, 급여의 합 을 구하여 출력하기
SELECT deptno, COUNT(*), SUM(sal)
    FROM emp
    GROUP BY deptno
    HAVING COUNT(*) > 3;
    
    
-- [80p] emp 테이블에서 급여가 최대 2900 이상인 부서에 대해서
-- 부서번호, 평균 급여, 급여의 합 을 구하여 출력하기
SELECT deptno, AVG(sal), SUM(sal)
    FROM emp
    GROUP BY deptno
    HAVING MAX(sal) > 2900;
    
    
-- [80p] emp 테이블에서 업무별 급여의 평균이 3000 이상인 업무에 대해서
-- 업무명, 평균 급여, 급여의 합 을 구하여 출력하기
SELECT job, AVG(sal), SUM(sal)
    FROM emp
    group by job
    HAVING AVG(sal) >= 3000;
    
    
-- [81p] emp 테이블에서 전체 월급이 5000 을 초과하는 각 업무에 대해서
-- 업무와 월급의 합계를 출력하기
-- (판매원은 제외하고, 월 급여 합계로 내림차순 정렬)
SELECT job, SUM(sal) PAYROLL
    FROM emp
    WHERE job NOT LIKE 'SALE%'
    GROUP BY job
    HAVING SUM(sal) > 5000
    ORDER BY SUM(sal) DESC;
    

-- [81p] 부서별 평균 중 최대 평균 급여, 부서별 급여의 합 중 최대 급여,
-- 부서별 급여의 최소 급여, 부서별 급여의 최대 급여를 출력하기
SELECT MAX(AVG(sal)), MAX(SUM(sal)), MIN(MIN(sal)), MAX(MAX(sal))
    FROM emp
    GROUP BY deptno;