select sum(SAL) from EMP;--그룹함수
-- select ENAME,sum(SAL) from EMP;--그룹함수는 그룹함수끼리만 사용가능하다
select sum(SAL) as "급여의 총합", round(avg(SAL)) as "급여의 평균" from EMP;
--직계함수를 작성하면 필드는 꼭 직계함수만 작성 가능!
-- distinct : 중복제거(집계 X)
select DEPTNO from EMP;
select distinct DEPTNO from EMP;
update EMP set COMM=null where COMM=0;
select * from EMP;
select count(*),MAX(SAL),max(COMM),min(SAL),min(COMM) from EMP;
select count(*),MAX(SAL),max(COMM),min(SAL),min(COMM) from EMP where DEPTNO=30;
select stddev(SAL) from EMP;--표준편차

-- 집계를 그룹간 group by
select DEPTNO,sum(SAL),round(avg(SAL)) from EMP group by DEPTNO;


-- select DEPTNO,sum(SAL),round(avg(SAL)) from EMP group by DEPTNO where SAL>1000;
-- select DEPTNO,
--        sum(SAL) as total ,
--        round(avg(SAL))as avg
--     from EMP
--     where SAL>=1000 and TOTAL>8500
--     group by DEPTNO;
select DEPTNO,
       sum(SAL) as total
from EMP
group by DEPTNO
having sum(SAL)>9000
order by total desc ;






