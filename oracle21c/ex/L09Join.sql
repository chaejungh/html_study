
select
    ENAME,
    EMP.DEPTNO,
    DNAME,LOC
from EMP inner join dept
on EMP.DEPTNO = DEPT.DEPTNO
order by ENAME;

select
    PAY_ID,
    PAY_HISTORY.EMPNO,
    emp.EMPNO,ENAME,
    AMOUNT,BONUS
from PAY_HISTORY inner join EMP
on PAY_HISTORY.EMPNO = EMP.EMPNO
where AMOUNT>=2000
order by PAY_ID;

--가명 AS
select ENAME as 사원이름 from EMP;
select ENAME 사원이름 from EMP;
select e.ENAME,e.EMPNO 사원이름 from EMP e;
-- select e.ENAME,e.EMPNO 사원이름 from EMP as e;
select e.*,d.DNAME
    from EMP e inner join DEPT d
    on e.DEPTNO = d.DEPTNO;


select distinct DEPTNO from EMP;
select * from DEPT;
select * from EMP where DEPTNO is null ;
-- 7698, 7782, 7788
update EMP set DEPTNO = null where EMPNO in(7698, 7782, 7788);
commit ;
select *
    from EMP e inner join DEPT d
    on e.DEPTNO = d.DEPTNO;

select *
        from EMP e right outer join DEPT d
        on e.DEPTNO = d.DEPTNO;

-- inner join == natural join : 자동으로 on을 생성
-- pk == fk 이름이 같아야함

select *
from EMP natural join DEPT;

select EMPNO,ENAME,MGR from EMP;

select e.EMPNO 사번,
       e.ENAME 사원이름,
       e.MGR 상사번호,
       m.ENAME 상사이름
from EMP e, EMP m
where e.MGR=m.EMPNO;

select e.*,m.ENAME 상사이름
    from EMP e left join EMP m
    on e.MGR = m.EMPNO;