select EMPNO,ENAME,SAL,avg(SAL) over () from EMP;
select EMPNO,ENAME,SAL from EMP;
select EMPNO,ENAME,SAL,평균 from EMP,(select avg(SAL)평균 from EMP);

select EMPNO,ENAME,SAL,avg(SAL) over (partition by DEPTNO)평균
    from EMP
    order by EMPNO;

select EMPNO,ENAME,SAL,평균
from EMP e,(select DEPTNO,avg(SAL)평균 from EMP group by DEPTNO)a
where e.DEPTNO=a.DEPTNO
order by EMPNO;

select rank() over (order by SAL desc ),e.SAL,e.ENAME from EMP e;
select dense_rank() over (order by SAL desc ),e.SAL,e.ENAME from EMP e;
select dense_rank() over (partition by DEPTNO order by SAL desc )
    ,e.DEPTNO,e.SAL,e.ENAME
    from EMP e;
