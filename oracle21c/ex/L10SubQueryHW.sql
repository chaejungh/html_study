select ENAME,sal
    from EMP
    where SAL>(
        select avg(sal)
        from EMP);--Q1

select DEPTNO,ENAME,JOB
from EMP
where JOB=(
    select JOB
        from EMP
        where ENAME='SCOTT');--Q2


select ENAME,SAL
from EMP
where SAL in(select SAL from EMP e where DEPTNO=20);--Q3

select ENAME,SAL
from EMP
where SAL <(select min(sal) from EMP where DEPTNO=30);--Q4

select ENAME,SAL
from EMP
where sal >(select max(SAL) from EMP where DEPTNO=10);--Q5

select JOB,SAL,ENAME
from EMP
where JOB in(select job from EMP where DEPTNO=20) and SAL in (select SAL from EMP where DEPTNO=20);--Q6

select ENAME,sal
from EMP
where sal in (
    (select max(SAL) from EMP where DEPTNO=10),
    (select max(SAL) from EMP where DEPTNO=20),
    (select max(SAL) from EMP where DEPTNO=30)
          );--Q7



select e.ENAME,e.DEPTNO,e.SAL
from EMP e
where e.SAL>(
    select avg(SAL) from EMP d where e.DEPTNO=d.DEPTNO
          );--Q8


select DEPTNO,AVG(SAL) from EMP group by DEPTNO;
select *
    from EMP inner join
         (select DEPTNO,AVG(SAL) avg from EMP group by DEPTNO) a
    on emp.DEPTNO=a.DEPTNO
    where emp.SAL>a.avg
    order by EMP.EMPNO;--Q8 서브쿼리로 조인

select d.DNAME,e.ENAME
from EMP e join DEPT d
on e.DEPTNO=d.DEPTNO;--Q9

select * from DEPT where DEPTNO in(select distinct DEPTNO from EMP);--Q9


select *
    from DEPT where
    exists(select * from EMP where emp.DEPTNO=DEPT.DEPTNO);--Q9


select e.DEPTNO,e.ENAME,e.SAL,(
    select round(avg(SAL)) from EMP a where e.DEPTNO=a.DEPTNO
    ) 부서평균
from EMP e
where DEPTNO is not null;--Q10

-- over : 집계를 따로진행해서 기존출력에 더한다.

-- select e.ENAME,e.SAL,AVG(e.SAL) from EMP e;
select e.ENAME,e.SAL,AVG(e.SAL) over () from EMP e;
select z.이름,z.급여,z.부서번호,z.부서별평균 from (select
       e.ENAME 이름,
       e.SAL 급여,
       e.DEPTNO 부서번호,
       AVG(e.SAL) over (partition by DEPTNO) 부서별평균
from EMP e) z
where z.부서별평균>2500;
