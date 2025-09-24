select * from emp;

--AS 별칭 => ""
select DNAME as "부서 이름" from dept where DEPTNO=20;
select DNAME as "부서 이름" from dept where DEPTNO>=30;

select ENAME, SAL from EMP where SAL>1000 order by SAL desc ;

--거의 대부분의 DB는 날짜를 문자열로 검색가능
select ENAME,HIREDATE from EMP where HIREDATE>'1981-09-01';
select ENAME,HIREDATE from EMP where HIREDATE='1987-07-13';
select ENAME,HIREDATE from EMP where HIREDATE='1987-7-13';--0을 빼도 상관X
select ENAME,HIREDATE from EMP where HIREDATE>='1981-09-01'and HIREDATE <'1981-10-01';
-- select ENAME,HIREDATE from EMP where HIREDATE='1981-09';
--oracle은 지원하지 않음
--BETWEEN A AND B : 수
--BETWEEN A AND DATE B : 수
select ENAME,HIREDATE from EMP where HIREDATE between '1981-09-01' and '1981-09-30';

--TU??
select * from EMP where ENAME='TU';
select * from EMP where ENAME like 'TU%';
select * from EMP where ENAME like '%NE%';
select * from EMP where ENAME like '____';
select * from EMP where ENAME like '__RD';



-- SCOTT 스키마 SQL 질의 문제 (15)
select * from EMP;-- Q1
select ENAME,SAL from EMP;--Q2
select ENAME,JOB from EMP where DEPTNO=10;--Q3
select ENAME,SAL from EMP where SAL>=2000;--Q4
select * from EMP where JOB='CLERK';--Q5
select ENAME,DEPTNO from EMP where ENAME like 'S%';--Q6
select ENAME,JOB from EMP where ENAME like '%T';--Q7
select ENAME,SAL from EMP where COMM is null ;--Q8
select ENAME,JOB from EMP where MGR is not null ;--Q9
select ENAME,SAL from EMP where SAL between 1500 and 3000;--Q10
select ENAME,HIREDATE from EMP where HIREDATE between '1981-01-01' and '1981-12-31';--Q11
select DNAME,LOC from DEPT;--Q12
select ENAME,DEPTNO from EMP where DEPTNO=20 or DEPTNO=30;--Q13
select ENAME,DEPTNO from EMP where DEPTNO in(20,30);--Q13-2
select ENAME,SAL,COMM from EMP where COMM>0;--Q14
select ENAME,DEPTNO,HIREDATE from EMP where JOB='MANAGER';--Q15

-- 형변환 문제
select TO_CHAR(HIREDATE,'YYYY-MM-DD') from EMP;
select TO_DATE('2025-01-15') from dual ;
select TO_CHAR(SAL,'L99,999') from EMP;
select to_number('1234')+1 as n from dual;
select CAST(SAL as VARCHAR2(10))from EMP;



