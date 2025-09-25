select * from EMP where COMM = null ; --null은 없는 데이터기 때문에 동등비교연산불가
select * from EMP where COMM is null ;

--부서 20 이거나(또는) 30인 사원
select * from EMP where DEPTNO =20 or DEPTNO=30;
select * from EMP where DEPTNO in(20,30);
select * from EMP where DEPTNO not in(20,30);