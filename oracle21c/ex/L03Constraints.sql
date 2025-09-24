insert into MEMBER values ('김지형',25);
select * from MEMBER;

-- DDL create 생성, Alter
update MEMBER
set AGE = null;

alter table MEMBER modify age number(3);

-- update MEMBER set AGE = 2500 where NAME='김지형';
--number(3) -999~999
update MEMBER
set AGE = 25
where NAME='김지형';

update MEMBER
set AGE = -100
where NAME='이지형';

-- 칼럼의 제약조건을 주는 것은 칼럼 수정이 아니고 제약조건 등록

update MEMBER set AGE = 20 where NAME='이지형';

alter table MEMBER drop constraint member_age_check;
alter table MEMBER add CONSTRAINT member_age_check check ( AGE>=0 and AGE<200);
-- 제약조건 삭제

-- insert into MEMBER (AGE) values (39); null인 name은 넣을 수 없다
-- delete from table where
delete from MEMBER where NAME IS NULL;
-- *********************************alter를 쓸일은 별로 없다( 테이블 구조를 바꾸는 일이기 때문)
-- alter table MEMBER add constraint name_not_null
alter table MEMBER modify  (name not null );
insert into MEMBER values ('최경민',39);

alter table MEMBER add id number(5);

delete from MEMBER where NAME='김지형';
delete from MEMBER where NAME='이지형';

alter table MEMBER add constraint pk_member PRIMARY KEY (ID);

insert into MEMBER (NAME, AGE, ID) VALUES ('김지형',25,3);
insert into MEMBER (NAME, AGE, ID) VALUES ('김지형',25,4);

update MEMBER set AGE=35 where id=3;