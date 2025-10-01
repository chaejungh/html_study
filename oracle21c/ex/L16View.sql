select * from EMP where SAL>=2000;
create view emp_2000_sal as select * from EMP where SAL>=2000;

select * from emp_2000_sal;

create view emp_dept as
select emp.*,DEPT.DNAME,DEPT.LOC
from EMP left join DEPT on emp.DEPTNO=DEPT.DEPTNO;

select *
from emp_dept;
--create DDL
drop view emp_2000_sal;
--Grant Revoke DCL
--Select(DQL),Insert,Delete,Update  DML

