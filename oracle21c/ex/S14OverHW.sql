select ENAME,DEPTNO,SAL,sum(SAL) over (partition by DEPTNO) 부서별총급여
from EMP;--Q1

select DEPTNO, ENAME,SAL,avg(SAL) over (partition by DEPTNO) 부서별평균급여
from EMP;--Q2

select HIREDATE,sum(SAL)
    over (order by HIREDATE rows unbounded preceding)누적급여합계 from EMP;--Q3

select HIREDATE,sum(SAL)
    over (order by HIREDATE rows between 2 preceding and current row ) from EMP;--Q4

select row_number() over (order by SAL desc ),ENAME,SAL
from EMP;--Q5

select DEPTNO,rank() over (partition by DEPTNO order by SAL desc ),SAL
from EMP;--Q6

select DEPTNO,dense_rank() over (partition by DEPTNO order by SAL desc ),SAL
from EMP;--Q7

select HIREDATE,EMP.SAL,lag(SAL,1,0) over (order by HIREDATE)-SAL as "현재급여와의 차이"
from EMP;--Q8

select HIREDATE,EMP.SAL,lead(SAL,1,0) over (order by HIREDATE)-SAL as "현재급여와의 차이"
from EMP;--Q9

select * from (select DEPTNO,ENAME,SAL,max(SAL) over (partition by DEPTNO) m from EMP )
where sal=m ;--Q10