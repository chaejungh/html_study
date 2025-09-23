--데이터 소스
--url : jdbc:oracle:thin@//localhost:1521/XEPDB1
--user : system
--password : oracle
-- select 7*8 from dual;

    create user table_user identified by "1234"--system의 하위계정으로 table_user
    default tablespace USERS
    temporary tablespace TEMP
    quota unlimited on USERS;

    grant connect,resource to table_user;

    create table table_user.board(
        no NUMBER,
        title VARCHAR2(50),
        contents VARCHAR2(100)
    );

create user table_user2 identified by "1234"--system의 하위계정으로 table_user
    default tablespace USERS
    temporary tablespace TEMP
    quota unlimited on USERS;

grant connect, resource to table_user2;

create table