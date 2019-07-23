-- 연습문제 [96p]
-- [1] emp 테이블에서 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는
-- SELECT 문장을 작성
SELECT ename, empno, dname
    FROM emp, dept
    WHERE emp.deptno = dept.deptno;
    
    
-- [2] emp 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여
-- 이름, 업무, 급여, 부서명을 출력하는 SELECT문을 작성
SELECT ename, job, sal, dname
    FROM emp, dept
    WHERE emp.deptno = dept.deptno AND dept.loc = 'NEW YORK';


-- [3] emp 테이블에서 보너스를 받는 사원에 대하여
-- 이름, 부서명, 위치 를 출력하는 SELECT 문을 작성
SELECT ename, dname, loc
    FROM emp, dept
    WHERE emp.deptno = dept.deptno AND emp.COMM IS NOT NULL;
    

-- [4] emp 테이블에서 이름 중 L 자가 있는 사원에 대하여
-- 이름, 업무, 부서명, 위치 를 출력하는 SELECT문 작성
SELECT ename, job, dname, loc
    FROM emp, dept
    WHERE ename LIKE '%L%' AND emp.deptno = dept.deptno;
    
    
-- [5] 보기와 똑같이 출력하기
SELECT worker.ename Employee, worker.empno Emp#, manager.ename Manager, manager.empno
    FROM emp worker, emp manager
    WHERE worker.mgr = manager.empno(+);


-- [6] emp 테이블에서 그들의 관리자 보다 먼저 입사한 사원에 대하여
-- 이름, 입사일, 관리자 이름, 관리자 입사일을 출력하는 SELECT문 작성
SELECT e.ename "이름", e.hiredate "입사일", m.ename "관리자 이름", m.hiredate "관리자 입사일"
    FROM emp e, emp m
    WHERE e.mgr = m.empno AND e.hiredate < m.hiredate;
    
    
-- [7] emp 테이블에서 사원의 급여와 사원의 급여 양만큼 "*"를 출력하는
-- SELECT문을 작성
-- ("*"는 100을 의미)
SELECT ename, RPAD('*', TRUNC(sal/100), '*') "Salary",SAL
    FROM emp;