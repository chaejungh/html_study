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

select * from PAY_HISTORY
where abs(PAY_DATE- Date '2025-02-02')<=30
order by PAY_DATE desc
offset 0 rows fetch next 5 rows only ;

--입사일이 가장최근인 사원을 5명씩 본다. paging
select * from EMP order by HIREDATE desc ;
--ROWNUM : 행에 번호매김
select ROWNUM as no,EMP.*
from EMP;
select ROWNUM as no,
       EMP.*
from EMP
order by HIREDATE desc ;

select ROWNUM no,e.*
from(select * from EMP order by HIREDATE desc) e
where no between 5 and 10;
--ROWNUM은 where절이 끝이나고 실행
--WHERE저에서 ROWNUM은함수 자체를 호출하면 select의 ROWNUM과 동시에 실행
select ROWNUM as no,e.*
from (select * from EMP order by HIREDATE desc )e
where ROWNUM<10;

--급여의 평균보다 급여를 많이 받는 사람
--MAX MIN AVG ...
select avg(SAL) from EMP;

select *
from EMP
where SAL>(select avg(SAL) from EMP);

select e.*,(select avg(SAL) from EMP where e.DEPTNO=DEPTNO) 평균 from EMP e;

select ROWNUM,emp.* from EMP order by SAL desc ;
--my sql db :  서브쿼리의 가상테이블의 가명,별칭을 꼭 붙여야함
select ROWNUM,e.* from (select * from EMP order by SAL desc )e

select *
from EMP
order by SAL desc ;

select *
from PAY_HISTORY
offset 10 rows fetch next 5 rows only ;

select * from (select ROWNUM no, PAY_HISTORY.*
from PAY_HISTORY
where ROWNUM<=15)
where no>=11;