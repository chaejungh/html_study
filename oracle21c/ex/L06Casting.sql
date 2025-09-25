--출력만 해보는 것 => 가상테이블
select sysdate from dual;
select TO_CHAR(sysdate) from dual;
select TO_CHAR(sysdate,'HH24"시"MI"분"SS"초"') from dual;
select '12345'*3 from dual;
select '12,345'*3 from dual;
select TO_NUMBER('12,345','99G999')*3 from dual;

-- select SAL+'$' from EMP;
select ENAME || '님' from EMP;
select concat(ENAME,'님') from EMP;
select SAL+10 from EMP;
select SAL || '$'from EMP;
ALTER SESSION SET NLS_TERRITORY = 'AMERICA';
select TO_CHAR(SAL,'FML999,999,999,999.00') from EMP;


