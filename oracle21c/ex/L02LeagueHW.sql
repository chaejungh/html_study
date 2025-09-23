create table League(
                       no number,
                       title varchar2(30),
                       euro_spent number
);
insert into League(no, title, euro_spent) VALUES (1,'EPL',2432172783);
insert into League(no, title, euro_spent) VALUES (2,'BL',465000000);
insert into League(no, title, euro_spent) VALUES (3,'SERIA',401000000);
insert into League(no, title, euro_spent) VALUES (4,'LEAGUE1',293000000);
insert into League(no, title, euro_spent) VALUES (5,'LaLiga',172000000);
select * from League;

update League
set title = 'England Premier League'
where no=1;
commit ;
select * from League;
alter table League
rename column title to league_title;
commit ;

delete from League where no = 1;
select * from League;
rollback ;
select * from League;