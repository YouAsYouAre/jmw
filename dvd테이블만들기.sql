create table movie ( 
mseq number(5) primary key, 
mname nvarchar2(50) not null,
mimage nvarchar2(30)  not null,
genre varchar2(30)  not null,
content nvarchar2(500) not null,
dtotal number(10) not null,
dnow number(10) not null,
type nvarchar2(10)
);
create sequence alseq start with 1 INCREMENT by 1;

create table actors (
aseq number(5) primary key,
aname nvarchar2(30)not null,
aimage nvarchar2(30) not null,
filmo nvarchar2(100) not null
);

create table actorlist(
alseq  number PRIMARY KEY,
mseq number(5) not null,
aseq number(5)not null,
FOREIGN KEY(mseq) REFERENCES movie(mseq),
FOREIGN KEY(aseq) REFERENCES actors(aseq)
);

create table users(
useq number(5)primary key,
uname nvarchar2(30) not null,
uphone nvarchar2(30) not null,
admin number(2) default 0
);

create table dtor(
dseq number(5) primary key,
mseq number(5),
dname nvarchar2(50),
makes nvarchar2(300),
FOREIGN KEY(mseq) REFERENCES movie(mseq)
);

commit;



create or replace view moview as
select d.dname,d.makes,a.alseq,m.mseq,m.mname,m.mimage,
ac.aname,ac.aimage from movie m join actorlist a on m.mseq=a.mseq
join actors ac on a.aseq=ac.aseq join dtor d on d.mseq=m.mseq;
commit;

select * from moview group by dname,makes,alseq,mseq,mname,mimage,
aname,aimage;

create or replace view newmovie as
select mseq,mname,mimage,genre,content,dtotal,dnow,type from (select row_number()over
(order by mseq desc)rn,mseq,mname,mimage,genre,content,dtotal,dnow,type from movie)where rn<=4;


create or replace view kmovie as
select mseq,mname,mimage,genre,content,dtotal,dnow,type from (select row_number()over
(order by mseq desc)rn,mseq,mname,mimage,genre,content,dtotal,dnow,type from movie where type='korea')where rn<=4;

create or replace view wmovie as
select mseq,mname,mimage,genre,content,dtotal,dnow,type from (select row_number()over
(order by mseq desc)rn,mseq,mname,mimage,genre,content,dtotal,dnow,type from movie where type='western')where rn<=4;
commit;
update users set admin=0 where useq=6;
select * from users;
select * from wmovie;
select * from kmovie;
select * from newmovie;
select * from moview;
select * from actorlist;
select * from movie;
select * from dtor;
select * from actorlist;
select * from dtorlist;
select * from actors;
select * from movie where mname like '%'||''||'%' order by mseq desc; 

create or replace view acview as
select a.aseq,a.aname,a.aimage,a.filmo,mseq,alseq from actorlist ac join actors a on ac.aseq=a.aseq;

commit;
create table dtorlist (dlseq number(5),dname nvarchar2(50),makes nvarchar2(50)
);
create sequence dlseq start with 1 INCREMENT by 1;
commit;
drop table dtorlist;
commit;
rollback;
update dtor SET makes=(select '곡성,'||makes from dtor where dseq=2) where dseq=2;

insert into dtor values(
dseq.nextval,7,'우민호','내부자들'
);
select * from movie;
delete from movie where mseq=14;
rollback;
update movie set type='korea' where type='국산';
select * from actorlist;
select * from dtorlist;
select * from movie;
select * from actors;
select * from  dtor;
select * from moview;
commit;
select * from dtorlist;
select * from users;
select * from movie;
select * from moview;
select * from moview group by dname,makes,alseq,mseq,mname,mimage,
aname,aimage;

commit;
select * from movie where type='korea';


insert into movie values(
mseq.nextval,'아바타','avatar.jpg','fantasy','아바타를쓴군인','2','1','western'
);
select * from users where uname='min' and uphone='01029905130';

insert into actorlist values(
alseq.nextval,7,3
);
update actors set aimage='lbh.jpg' where aseq=1;

insert into movie values(
mseq.nextval,'악마를보았다',
'devil.jpg','스릴러','악마','4','2','국산'
);
commit;
select * from users;
drop table users;
commit;
insert into actors values(
aseq.nextval,'이병헌','lbh.jpg','내부자들'
);

insert into actors values(
aseq.nextval,'조승우','jsw.jpg','내부자들'
);

insert into dtor values(
dseq.nextval,'우민호','내부자들'
);

insert into users values(
useq.nextval,'min','01029905130','1'
);

insert into users values(
useq.nextval,'minwoo','01029905130','0'
);
commit;

select * from movie;
SELECT nvl((select max(mseq) from movie), 0) FROM dual;

create table qna (qseq number(5) primary key, title nvarchar2(30) not null, content nvarchar2(100) not null ,useq number(5) not null,
FOREIGN KEY(useq) REFERENCES users(useq));
create sequence nseq start with 1 INCREMENT by 1;
create table answer (nseq number(5)primary key, content nvarchar2(100) not null ,qseq number(5) not null,
FOREIGN KEY(qseq) REFERENCES qna(qseq));
commit;

create table comments(
cseq number(5)primary key,
mseq number(5) not null,
comments nvarchar2(80) not null,
writer nvarchar2(30),
reg_date date default sysdate,
FOREIGN KEY(mseq) REFERENCES movie(mseq)
);
drop table comments CASCADE constraints;
select * from comments;
select * from movie;
insert into comments values(cseq.nextval,7,'최고','min',sysdate);
commit;
drop table comments CASCADE CONSTRAINTS;
SELECT cseq, mseq, comments, writer, reg_date
          FROM (SELECT row_number() OVER (ORDER BY reg_date DESC) rn, cseq, mseq,
                             comments, writer, reg_date
                  FROM comments
                 WHERE mseq=7);
                 select * from qna;
                 select * from answer;
                 select * from moview;
                 select * from movie;
                 select * from wmovie;
                 alter table qna add rep number(1) default 0;
                 select * from qna;
                 select * from answer;
                 delete from answer where qseq=5;
                 commit;
                 select * from users;
                 select* from comments;
                
                 select * from movie;
                 select * from rateview order by avg desc;
                                 commit;
                                 
                                 select * from rateview where genre='action' order by avg desc; 

                 select m.mseq,m.mname,m.mimage,m.genre,m.content,m.dtotal,m.dnow,m.type,avg(co.rate) 
                 from movie m join comments co on m.mseq=co.mseq order by rate;
                 
                 create or replace view rateview as
                 SELECT mv.mseq, mv.mname, mv.mimage, mv.genre, mv.content, mv.dtotal, mv.dnow, mv.type, aveg.avg_rate avg
                   FROM movie mv
                   JOIN (select m.mseq, avg(co.rate) avg_rate
                           from movie m
                           join comments co
                             on m.mseq=co.mseq
                          group by m.mseq) aveg
                    ON mv.mseq = aveg.mseq;
                 
                 select round(avg(rate)) from comments where mseq=61;
                 rollback;
                 commit;
                  update comments set rate=5;
                 alter table comments add rate number(5)default 0;