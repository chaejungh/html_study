-- from 서브쿼리 : 조회한 결과를 다시 조회한 대상으로 사용 Paging
select * from EMP;

select * from (
    select * from DEPT
              );


select g.DEPTNO,g.급여평균
    from (select DEPTNO,round(avg(SAL)) 급여평균
        from EMP
        group by DEPTNO) g--having은 집계를 한번더해서 복잡. 그걸 이렇게 최적화가능
    where 급여평균>2000;

--RowNum : 행을 출력할때 번호 작성 (동작시점이 order by 이후이므로 where절로 사용 불가)

select r.*
from(select ROWNUM no,EMPNO,ENAME
    from EMP
    order by EMPNO) r
where r.no<5;

select r.*
    from(select ROWNUM no,EMPNO,ENAME
     from EMP
     order by EMPNO) r
    order by EMPNO;

select avg(SAL) from EMP;

select * from EMP where SAL>2073;

--where 절에 있는 단일행 서브쿼리
select *
from EMP
where SAL>(select avg(SAL) from EMP);--평균보다 큰 급여 출력

--평균이 2000이상인 부서의 사원

select DEPTNO
from EMP
group by DEPTNO
having avg(SAL)>2000;

select *from EMP where DEPTNO in(10,20);

select *
    from EMP
    where DEPTNO
      in(select DEPTNO
                 from EMP
                 group by DEPTNO
                 having avg(SAL)>2000);
-- select 절에 작성하는 서브쿼리=> 무조건 단일결과
select e.ENAME,e.DEPTNO
    ,(select
          round(avg(g.SAL))
      from EMP g where g.DEPTNO=e.DEPTNO )
    from EMP e;

select e.ENAME,e.DEPTNO,e.SAL,v.평균
    from EMP e
        inner join(select DEPTNO, round(avg(SAL)) 평균
                   from EMP
                   group by DEPTNO) v
        on e.DEPTNO=v.DEPTNO;

