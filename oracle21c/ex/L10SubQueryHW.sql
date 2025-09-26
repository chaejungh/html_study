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

select d.DNAME,e.ENAME
from EMP e join DEPT d
on e.DEPTNO=d.DEPTNO;--Q9

select e.DEPTNO,e.ENAME,e.SAL,(
    select round(avg(SAL)) from EMP a where e.DEPTNO=a.DEPTNO
    ) 부서평균
from EMP e
where DEPTNO is not null;--Q10