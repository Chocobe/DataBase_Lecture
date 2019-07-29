-- 19_07_25 테이블 생성하기

-- ORACLE DATA DICTIONARY 에서 SYSTEM PRIVILEGE 를 조회하기
SELECT *
    FROM system_privilege_map;
    
    
-- ORACLE DATA DICTIONARY 에서 OBJECT PRIVILEGE 를 조회하기
SELECT *
    FROM table_privilege_map;
    
    
-- 현재 SESSION 을 이루고 있는 사용자의 SYSTEM PRIVILEGE 중
-- ROLE 에 관련된 사항을 ORACLE DATA DICTIONARY 에서 조회하기
SELECT *
    FROM role_sys_privs;
    
    
-- 현재 SESSION 을 이루고 있는 사용자가 사용할 수 있는 FREE SPACE 가
-- 얼마인지 ORACLE DATA DICTIONARY 에서 조회하기
SELECT *
    FROM user_free_space;
    
    
-- [140p] 테이블 만들기
CREATE TABLE test_tab1(
    id NUMBER(2) CONSTRAINT test_id_pk PRIMARY KEY,
    name VARCHAR2(10));
    
CREATE TABLE test_tab2(
    id NUMBER(2),
    name VARCHAR(10),
    CONSTRAINT test_id_pk2 PRIMARY KEY(id));
    
    
-- [141p] 테이블 만들기
-- 안되노
CREATE TABLE emp_tab(
    empno   NUMBER(4),
    ename   VARCHAR(10),
    job     VARCHAR(9),
    mgr     NUMBER(4),
    hiredate    DATE,
    sal     NUMBER(7, 2),
    comm    NUMBER(7, 2),
    deptno  NUMBER(2) NOT NULL,
    CONSTRAINT emp_self_key
        FOREIGN KEY(mgr) REFERENCES emp(empno),
    CONSTRAINT emp_deptno_fk
        FOREIGN KEY(deptno) REFERENCES dept(deptno),
    CONSTRAINT emp_empno_pk PRIMARY KEY(empno));
    
    
-- [142p] 테이블 생성하기
CREATE TABLE UNI_TAB2(
    DEPTNO  NUMBER(2),
    DNAME   CHAR(4),
    LOC CHAR(13),
    CONSTRAINT UNI_TAB_DEPTNO_UK UNIQUE(DEPTNO));