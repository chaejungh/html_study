select * from EMP;
-- 사원 관리 페이지에서 페이징이 되어있었음
--한 페이지당 5명씩 출력
select ROWNUM no,e.* from EMP e order by e.HIREDATE;

select ROWNUM no,emp.* from(select * from EMP order by HIREDATE)emp
-- where no between 1 and 5;
--??
select *
from (select ROWNUM no,emp.* from(select * from EMP order by HIREDATE)emp)
where no between 1 and 5;

select ROWNUM,e.*
from EMP e
order by SAL;

select * from (select ROW_NUMBER() over (order by SAL) no,e.*
from EMP e)
where no between 1 and 5;


select distinct DEPTNO,sum(SAL) over (partition by DEPTNO)
from EMP order by DEPTNO;


select EMP.HIREDATE,lag(SAL,1,0) over (order by HIREDATE)
from EMP;--  -1 행
select HIREDATE,SAL
from EMP
order by HIREDATE;--  원본 행
select EMP.HIREDATE,lead(SAL,1,0) over (order by HIREDATE)
from EMP;-- +1 행

select DEPTNO,EMP.SAL, row_number() over (partition by DEPTNO order by SAL desc ) 부서별연봉순위
from EMP;

select DEPTNO,EMP.SAL,rank() over (partition by DEPTNO order by SAL desc) 부서별연봉순위
from EMP;

select DEPTNO,EMP.SAL,dense_rank() over (partition by DEPTNO order by SAL desc ) 부서별연봉순위
from EMP;



