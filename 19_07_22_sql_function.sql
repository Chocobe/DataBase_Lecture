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
    
    
-- [55p] LPAD 함수
SELECT ename, LPAD(ename, 15, '*'), sal, LPAD(sal, 10, '*')
    FROM emp
    WHERE deptno = 10;
    
    
-- ROUND : 반올림
-- TRUNC : 버림
-- MOD   : 나머지
-- POWER : 거듭제곱
-- SQRT  : 제곱근
-- SIGN  : 양수, 음수, 0 구분
-- CHR   : ASCII 값에 해당하는 문자를 구함

-- DUAL  : DATABASE에서 지원하는 임시 테이블을 사용

-- [59p] ROUND : 반올림
SELECT ROUND(456.789, 2) AS "소수점 2자리 반올림",
    ROUND(456.789, 0) AS "소수점 0자리 반올림",
    ROUND(456.789, -1) AS "정수부 1자리 반올림"
    FROM DUAL;
    
    
-- [59p] TRUNC : 버림
SELECT TRUNC(456.789, 2),
    TRUNC(456.789, 3),
    TRUNC(456.789, 1),
    TRUNC(456.789, 0),
    TRUNC(456.789, -1),
    TRUNC(456.789, -2)
    FROM DUAL;
    
    
-- [61p] emp 테이블에서 현재까지 근무일 수가 몇주 몇일 인가를 출력하기
-- (일수가 많은 사람 순으로 출력)
--SYSDATE : 오늘 날짜
SELECT ename, hiredate, sysdate, sysdate - hiredate AS "Total Days",
    TRUNC((sysdate - hiredate) / 7, 0) Weeks,
    ROUND(MOD((sysdate - hiredate), 7), 0) DAYS,
    (sysdate - hiredate) / 365 AS "총 근무일수"
    FROM emp
    order by sysdate - hiredate DESC;
    
    
-- [63p] emp 테이블에서 10번 부서 중 입사 일자로부터 5개월이 지난 후
-- 날짜를 계산하여 출력하기
SELECT ename, hiredate, ADD_MONTHS(hiredate, 5) a_month
    FROM emp
    WHERE deptno = 10
    ORDER BY HIREDATE DESC;
    
    
-- [64p] emp 테이블에서 10번 부서 중 입사 일자로부터 돌아오는 금요일을
-- 계산하여 출력하기
SELECT ename, hiredate, 
    NEXT_DAY(hiredate, 6) n_6,
    NEXT_DAY(hiredate, 7) n_7
    FROM emp
    WHERE deptno = 10
    ORDER BY hiredate DESC;
    
    
-- [64p] emp 테이블에서 입사한 달의 근무 일수를 계산하여 출력하여라,
-- 단 토요일과 일요일도 근무 일수에 포함된다.
SELECT empno, ename, hiredate, 
    NEXT_DAY(hiredate, '금요일') n_day,
    LAST_DAY(hiredate) L_last,
    LAST_DAY(hiredate) - hiredate L_day
    FROM emp
    ORDER BY LAST_DAY(hiredate) - hiredate DESC;
    
    
-- [64p] emp 테이블에서 입사한 달의 근무 일수를 계산하여 출력하기
-- (토요일과 일요일도 근무 일수에 포함된다)
SELECT empno, ename, hiredate, 
    LAST_DAY(hiredate) L_Last,
    LAST_DAY(hiredate) - hiredate L_Day
    FROM emp
    ORDER BY LAST_DAY(hiredate) - hiredate DESC;
    
    
-- [67p] emp 테이블에서 10번 부서 중 입사 일자를 '1 May 1981' 과
-- '1998년 1월 1일' 형태로 출력하기
SELECT ename, hiredate, TO_CHAR(hiredate, 'fmDD"일"-Month-YY"년"') t_hiredate,
    TO_CHAR(hiredate, 'YY"년" MM"월" DD"일"') t_kor
    FROM emp
    WHERE deptno = 10
    ORDER BY hiredate DESC;
    
    
-- [70p] emp 테이블에서 부서 20중 금여 앞에 $를 삽입하고
-- 3자리마다 ,를 출력하기
SELECT empno, ename, job, sal, TO_CHAR(sal, '$999,999')
    FROM emp
    where deptno = 20
    ORDER BY sal DESC;
    
    
-- [70p] 1981/12/3 에 입사한 사원의 정보를
-- 이름, 업무, 입사일자를 출력하기
SELECT ename, job, TO_CHAR(hiredate, 'YYYY/MM/DD') t_hire
    FROM emp
    WHERE hiredate = TO_DATE('1981/12/3', 'yyyy/mm/dd');
    

-- [71p] emp 테이블에서 job이 ANALYST 이면 급여 증가는 10%이고
-- job이 CLERK 이면 급여 증가는 15%이고 job이 MANAGER 이면
-- 급여 증가는 20%이다.
-- 다른 업무에 대해서는 급여 증가가 없다.
-- 사원번호, 이름, 업무, 급여, 증가된 급여를 출력하기
SELECT deptno, ename, job, sal, DECODE(job, 
    'ANALYST', sal * 1.1,
    'CLERK', sal * 1.15,
    'MANAGER', sal * 1.2, sal) d_sal
    FROM emp
    ORDER BY sal DESC;
    