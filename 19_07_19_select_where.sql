-- EMP 테이블에서 담당 업무가 MANAGER 인 사원의 정보를
-- 사원번호, 성명, 담당업무, 급여, 부서번호 를 출력하기
SELECT EMPNO, ENAME, JOP, SAL,DEPNO
    FROM EMP
    WHERE JOP = 'MANAGER';