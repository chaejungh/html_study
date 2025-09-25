select * from EMP;

select upper('oracle database')
from dual;--Q1

select lower('SCOTT')
from dual;--Q2

select initcap('hello world')
from dual;--Q3

select substr('ORACLE',2,3)
from dual;--Q4

select length('DATABASE')
from dual;--Q5

select round(123.4567,2)
from dual;--Q6

select trunc(123.4567,2)
from dual;--Q7

select MOD(10,3)
from dual;--Q8

select power(2,5)
from dual;--Q9

alter session set time_zone ='Asia/Seoul';
select current_date
from dual;--Q10

select add_months(current_date,2)
from dual;--Q11

select months_between(current_date,'2025-01-01')
from dual;--Q12

select next_day(current_date,'금요일')
from dual;--Q13

select TO_CHAR(current_date,'YYYY/MM/DD')
from DUAL;--Q14

select TO_DATE('2025-12-31')
from DUAL;--Q15

select TO_NUMBER('10000')
from DUAL;--Q16

select ENAME,NVL(COMM,0)
from EMP;--Q17

select ENAME,NVL2(COMM,'YES','NO')as 커미션여부
from EMP;--Q18

select ENAME,decode(DEPTNO,
             10,'ACCOUNTING',
             20,'RESEARCH',
             'OTHERS') as 직업
from EMP;--Q19

select ENAME,case when SAL>3000 then 'HIGH'else 'LOW'END as 고소득자여부
from EMP;--Q20


-- /////////////////집계함수/////////////////////

select count(*)as 인원수
from EMP group by DEPTNO;--Q1

select sum(SAL) as total
        from EMP
        group by DEPTNO
        order by total desc ;--Q2

select round(avg(SAL),2) as 평균급여
        from EMP
        group by JOB;--Q3

select DEPTNO,
        MAX(SAL)as 최고급여,
        MIN(SAL)as 최저급여
        from EMP group by DEPTNO;--Q4

select DEPTNO,job,
        count(job) as 직업별인원
        from EMP group by DEPTNO,JOB
        having count(JOB)>3
        ORDER BY DEPTNO;--Q5
-- select DEPTNO,
--        count(DEPTNO) as 부서별인원
-- from EMP group by DEPTNO;
-- select JOB,
--        count(job) as 직업별인원
-- from EMP group by JOB;

select count(*) as 직무개수
from EMP group by JOB; --Q6

select JOB, avg(COMM)
    from EMP group by JOB
    having avg(COMM) is not null ; -- Q7

select DEPTNO,sum(SAL) as 총급여
    from EMP group by DEPTNO having sum(SAL)>10000;--Q8

select distinct to_char(HIREDATE,'YYYY-MM')as month,
                count(to_char(HIREDATE,'YYYY-MM')) as "월별 입사인원수"
                from EMP group by HIREDATE
                order by month asc ;--Q9

select JOB,
        trunc(avg(SAL),1) as 평균급여
        from EMP group by JOB
        having avg(SAL) >=2500;--Q10

select DEPTNO,
        sum(case when SAL>=3000 then 1 else 0 end) as "3000 이상",
        sum(case when SAL<3000 then 1 else 0 end) as "3000 이하"
        from EMP group by DEPTNO;--Q11

select DEPTNO,
        trunc(avg(distinct SAL),2) as 고유평균급여
        from EMP group by DEPTNO;--Q12

select JOB,
        trunc(stddev(SAL),2) as 표준편차,
        trunc(variance(SAL),2) as 분산
        from EMP group by JOB;--Q13

select DEPTNO, MAX(job)
from EMP group by DEPTNO ;--Q14

select JOB,sum(case when COMM>0 then 1 else 0 end )/count(*)*100 || '%' as "커미션 사원비율"
    from EMP group by JOB;--Q15


