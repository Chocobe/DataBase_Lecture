-- [51p] dept 테이블에서 첫 글자만 대문자로 변환하여 모든 정보를 출력하기
SELECT deptno, INITCAP(dname), INITCAP(loc)
    FROM dept;


-- [52p] 두개의 SELECT문이 있다. 결과의 차이점은?
-- COL, FORMAT 부분은 콘솔용 출력형식 명령어 (여기서는 의미없다)
COL e_name format a15
COL e_empno format a15
COL e_job format a15
SELECT empno, ename, job, CONCAT(empno, ename) e_name,
    CONCAT(ename, empno) e_empno,
    CONCAT(ename, job) e_job
    FROM emp
    WHERE DEPTNO = 10;
    
COL no FORMAT 99
COL d_name FORMAT A18
COL d_deptno FORMAT A18
COL d_loc FORMAT A25
SELECT deptno no, dname, loc, 
    CONCAT(deptno, dname) d_name,
    CONCAT(dname, deptno) d_deptno,
    CONCAT(dname, loc) d_loc
    FROM dept;
    
    
-- [53p] emp 테이블에서 이름의 첫글자가 "K" 보다 크고, "Y" 보다 적은
-- 사원의 정보를 사원번호, 이름, 업무, 급여, 부서번호 를 출력하기
-- (이름순으로 정렬)
SELECT empno, ename, job, sal, deptno
    FROM emp
    WHERE SUBSTR(ename, 1, 1) > 'K' AND
        SUBSTR(ename, 1, 1) < 'Y'
    ORDER BY ename;