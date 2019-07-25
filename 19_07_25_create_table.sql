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