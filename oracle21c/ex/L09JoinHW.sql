select e.ENAME,d.DNAME
from EMP e inner join DEPT d
on e.DEPTNO=d.DEPTNO;--Q1



select e.ENAME,d.DNAME
    from EMP e
    left join DEPT d
    on e.DEPTNO=d.DEPTNO;--Q2

select e.*,d.DNAME
    from EMP e right join DEPT d
    on e.DEPTNO=d.DEPTNO;--Q3

select *
    from EMP e right join DEPT d
    on e.DEPTNO=d.DEPTNO;--Q4

select e.ENAME,m.ENAME 팀원
    from EMP e
    left join emp m
    on e.DEPTNO=m.DEPTNO
    and e.ENAME <> m.ENAME; --Q5

select *
from EMP cross join dept;--Q6

select e.DEPTNO,e.ENAME
    from EMP e join DEPT d
    on e.DEPTNO=d.DEPTNO
    order by DEPTNO;--Q7

select
    e.ENAME,nvl(d.DNAME,'no DEPT')
    from EMP e left join dept d
    on e.DEPTNO=d.DEPTNO;--Q8

select
    e.ENAME,d.DNAME
    from EMP e left join dept d
    on e.DEPTNO=d.DEPTNO
    where d.DNAME='SALES';--Q9

select e.ENAME,m.ENAME 관리자
    from EMP e
    left join emp m
    on e.DEPTNO=m.DEPTNO
    and e.ENAME <> m.ENAME; --Q10
