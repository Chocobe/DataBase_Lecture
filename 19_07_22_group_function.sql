-- 19_07_22_GROUP_FUNCTION


-- [76p] emp 테이블에서 모든 SALESMAN 에 대하여 급여의 평균, 최고액,
-- 최저액, 합계를 구하여 출력하기
SELECT *
    FROM emp
    WHERE job = 'SALESMAN';
    
SELECT AVG(sal), MAX(sal), MIN(sal), SUM(sal)
    FROM emp
    WHERE job LIKE 'SAL%';