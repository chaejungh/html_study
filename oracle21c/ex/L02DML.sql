--데이터 소스
--url : jdbc:oracle:thin@//localhost:1521/XEPDB1
--user : table_user
--password : 1234
-- select 7*8 from dual;



-- create table table_user.board(
--     no NUMBER,
--     title VARCHAR2(50),
--     contents VARCHAR2(100)
-- );
create table member(
    name varchar2(10),
    age Number
);
--varchar(2) : 문자열 ''
--number : 수
insert into member(name, age) VALUES ('이지형',20);
insert into member(name, age) VALUES ('김지형',25);
commit;
select name,age from member;
select * FROM member;

insert into BOARD (no, title, contents) VALUES (1,'수학의 정석','수학 좀 치니?');
insert into BOARD (no, title, contents) VALUES (2,'국어?의 정석','국어 좀 치니?');
insert into BOARD (no, title, contents) VALUES (3,'영어?의 정석','영어 좀 치니?');

select * from BOARD;

