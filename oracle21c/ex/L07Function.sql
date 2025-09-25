select LOWER(ENAME) from EMP;
select initcap(ENAME) from EMP;
--to char, number, cast
select substr(ENAME,1,1) from EMP;
select substr('ORACLE',2,3) from dual;
--oracle의 인덱스는 1부터 시작
select length(ENAME) from EMP;

select concat(ENAME,'님 안녕하세요') from EMP;
select ENAME || ' 님' || ' 안녕하세요' from EMP;

select round(1234.5678,2) from dual;
select FLOOR(1234.5678) from dual;
select FLOOR(-0.1) from dual;--  -1

select trunc(1234.5678) from dual;
select trunc(-0.1) from dual;--   0

select power(2,20) from dual;
select * from EMP where SAL=800;
-- decode()
select * from EMP where SAL!=800;
select * from EMP where SAL<>800;
-- <> 같지않다의 옛날 문법


alter session set time_zone ='Asia/Seoul';
-- OS의 시간
select SYSDATE from dual;
select SYSTIMESTAMP from dual;
--current_date: oracle의 시간
select current_date from dual;
select current_timestamp from dual;

select add_months(SYSDATE, 3) from dual;
select add_months(SYSDATE, -8) from dual;
-- select add_months(SYSDATE, -8.5) from dual;
select SYSDATE-'2025-01-25 02:56:23' from dual;
select SYSDATE-TO_DATE('2025-01-25 02:56:23','YYYY-MM-DD HH24:MI,SS') from dual;
select SYSDATE-DATE'2025-01-25' from dual;
select SYSDATE-CAST('2025-01-25' AS Date) from dual;
-- 일수

select MONTHS_BETWEEN(SYSDATE,'2025-01-25') from DUAL;
select NEXT_DAY(SYSDATE,'금요일') from DUAL;

--  NVL : Null Value
select * from EMP;
select ENAME,SAL,COMM,COMM+SAL 총급여 from EMP;
-- null+수 = Null
select ENAME,SAL,COMM,SAL+NVL(COMM,0) 총급여 from EMP;
-- NVL2(COMM,Y,N)
--커미션을 받으면 Y 받지않는다면 N
select ENAME,NVL2(COMM,'Yes','NO') 커미션유무 from EMP;

--decode
--switch(deptno){
--      case10:'accounting'
--}
select ENAME,
       decode(DEPTNO,
                10,'ACCOUNTING',
                20,'RESEARCH',
                30,'SALES',
                40,'OPERATIONS')AS 부서이름
    from EMP;
select * from DEPT;
-- 10,ACCOUNTING,NEW YORK
-- 20,RESEARCH,DALLAS
-- 30,SALES,CHICAGO
-- 40,OPERATIONS,BOSTON

--CASE
select  ENAME, case when SAL>2000 then '고소득자' else '저소득자' end
from EMP;

