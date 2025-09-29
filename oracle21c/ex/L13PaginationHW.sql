select *
from (select ROWNUM rn from EMP)
where rn between 1 and 5; -- Q1-1

select *
from (select ROWNUM rn from EMP)
where rn between 6 and 10;-- Q1-2

select *
from (select e.DEPTNO,ph.*, ROWNUM rn
      from PAY_HISTORY ph
      inner join emp e
      on ph.EMPNO=e.EMPNO
      where e.DEPTNO=10)
where rn between 1 and 5; --Q1-3

select *
from PAY_HISTORY order by EMPNO;

select *
from (select row_number()
        over (order by PAY_DATE desc )as rn,
          p.*
        from PAY_HISTORY p)
where rn between 1 and 5;-- Q2-4

select * from (select row_number() over (order by AMOUNT desc )rn,p.*  from PAY_HISTORY p)
where rn between 6 and 10;-- Q2-5

select * from (select row_number() over (order by PAY_DATE desc) rn,p.*
                from PAY_HISTORY p  where BONUS is not null and BONUS>0)
where rn between 1 and 5;-- Q2-6

select *
from PAY_HISTORY
order by PAY_DATE desc
offset 0 rows fetch next 5 rows only ;-- Q3-7

select *
from PAY_HISTORY
order by AMOUNT desc
offset 5 rows fetch next 5 rows only ;-- Q3-8

select e.JOB,p.*
from PAY_HISTORY p inner join EMP e
on p.EMPNO=e.EMPNO
where e.JOB='SALESMAN'
order by PAY_DATE desc
offset 0 rows fetch next 5 rows only ;--Q3-9

select *
from PAY_HISTORY
where PAY_DATE between '2025-01-01' and '2025-01-11'
order by PAY_DATE desc ;--Q3-10