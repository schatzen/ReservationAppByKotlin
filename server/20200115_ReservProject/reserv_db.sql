/*
 * 

		select room_name, room_branch from room where room_branch= '이대 1호점' or  room_branch= '이대 2호점' or  room_branch= '방배 1호점' or  room_branch= '방배 2호점'


update branch set
		branch_main_pwd = '3333' where
		branch_idx = 3

select * from branch

 --confimred list & pwd
 select * from
 (
 select
 b.reserv_idx,
 b.reserv_start,
 b.reserv_end,
 b.reserv_regdate,
 b.reserv_state,
 b.reserv_member_idx,
 (select branch_name from branch where branch_idx = b.reserv_branch) reserv_branch,
 (select room_name from room where room_idx = b.reserv_room) reserv_room,
 (select branch_main_pwd from branch where branch_idx = b.reserv_branch) main_pwd,
 (select branch_1_floor_pwd from branch where branch_idx = b.reserv_branch) floor_pwd,
 (select room_pwd from room where room_idx = b.reserv_room) room_pwd
 from
 (select * from reservation where reserv_member_idx = 22 where reserv_state = 'confirmed') b
 )
 
 
 
 select * from member;
 delete from member where member_idx = 81;
 commit
 
 
 select * from member;
 delete from member where member_idx=66;
 commit
 
 select * from
 (
 select
 b.reserv_idx,
 b.reserv_start,
 b.reserv_end,
 b.reserv_regdate,
 b.reserv_state,
 b.reserv_member_idx,
 (select branch_name from branch where branch_idx = b.reserv_branch) reserv_branch,
 (select room_name from room where room_idx = b.reserv_room) reserv_room
 from
 (
 select 
* from reservation where reserv_member_idx = 22 and reserv_end < to_char(sysdate,'YYYY-mm-dd HH:mi')
 ) b
 )
 


 
 
 drop table room
 select * from reservation
 

 --지점 테이블 생성
 create table branch (
 branch_idx int not null,
 branch_name varchar2(100),
 branch_main_pwd varchar2(100),
 branch_1_floor_pwd varchar2(100)
 )
 
 insert into branch values(seq_branch_idx.nextVal,'내방역점','1111','1111')
 select * from branch
 

 
 --방 테이블 생성
 create table room (
 room_idx int not null,
 room_name varchar2(100),
 room_pwd varchar2(100),
 room_branch varchar2(100)
 )
 

 insert into room values(seq_room_idx.nextVal,'Ashkenazy','1111','내방역점');
  insert into room values(seq_room_idx.nextVal,'Argerich','1111','내방역점');
   insert into room values(seq_room_idx.nextVal,'Pollini','1111','내방역점');
    insert into room values(seq_room_idx.nextVal,'Michael Jackson','1111','내방역점');
     insert into room values(seq_room_idx.nextVal,'Eric Benet','1111','내방역점');
      insert into room values(seq_room_idx.nextVal,'Stevie Wonder','1111','내방역점');
      insert into room values(seq_room_idx.nextVal,'Bob Marley','1111','내방역점');
      insert into room values(seq_room_idx.nextVal,'Eric Clapton','1111','내방역점');
      insert into room values(seq_room_idx.nextVal,'Kissin','1111','내방역점');
      insert into room values(seq_room_idx.nextVal,'Pavarotti','1111','내방역점');
      insert into room values(seq_room_idx.nextVal,'Gerald Albright','1111','내방역점');
       insert into room values(seq_room_idx.nextVal,'Coldplay','1111','내방역점');
        insert into room values(seq_room_idx.nextVal,'Fourplay','1111','내방역점');


     




   
 
 select room_name from room where room_branch_idx = 8
  select * from branch

 
 --예약 테이블
 create table reservation (
 reserv_idx int not null,
 reserv_branch  varchar2(100),
 reserv_room  varchar2(100),
 reserv_start  varchar2(100),
 reserv_end  varchar2(100),
 reserv_doc  varchar2(500),
 reserv_regdate  date,
 reserv_state  varchar2(100),
 reserv_member_idx int not null
 )
 

 select * from reservation
 drop table reservation
 drop table member
 
 --회원 테이블
 create table member (
 member_idx int not null,
 member_name  varchar2(100),
 member_id  varchar2(100),
 member_pwd  varchar2(100),
 member_tel  varchar2(100),
 member_comment  clob,
 member_grade  varchar2(100),
 member_regdate date
 )
 
 drop table member
 
 select * from member
 
 -- member 샘플 데이터
  insert into member values(seq_member_idx.nextVal,'이김김','gomieti',1234,010-0000-0000,'','user',sysdate)
  select * from member
 
 --충전 테이블
 create table charging (
 charging_idx int not null,
 charging_payment_idx int not null,
 charging_member_idx  int not null,
 charging_regdate  varchar2(100),
 charging_use  varchar2(100)
 )
 
 --요금제 테이블
 create table payment(
 payment_idx int not null,
 payment_type  varchar2(100),
 payment_money int
 )
 
 --결제 테이블
 create table transaction (
 
 )
 
 
 --
 
delete from member where member_tel ='010-1111-1111'
select * from reservation


-- 시퀀스 key
create sequence seq_branch_idx
create sequence seq_room_idx
create sequence seq_reserv_idx
create sequence seq_member_idx
create sequence seq_charging_idx
create sequence seq_payment_idx

--기본키 설정
alter table branch add constraint pk_branch_name primary key(branch_name);
alter table room add constraint pk_room_idx primary key(room_idx);
alter table reservation add constraint pk_reserv_idx primary key(reserv_idx);
alter table member add constraint pk_member_idx primary key(member_idx);
alter table charging add constraint pk_charging_idx primary key(charging_idx)
alter table payment add constraint pk_payment_idx primary key(payment_idx)


--외래키 설정
alter table room
add constraint fk_room_branch foreign key(room_branch) references branch(branch_name);

alter table reservation
add constraint fk_reserv_room foreign key (reserv_room) references room(room_name);

alter table reservation
add constraint fk_reserv_branch foreign key (reserv_branch) references branch(branch_name);

alter table reservation
add constraint fk_reserv_member_idx foreign key (reserv_member_idx) references member(member_idx)

alter table charging
add constraint fk_charging_member_idx foreign key (charging_member_idx) references member(member_idx)

alter table charging
add constraint fk_charging_payment_idx foreign key (charging_payment_idx) references payment(payment_idx)

--외래키 해제
 ALTER TABLE room DROP CONSTRAINT pk_room_idx;
 ALTER TABLE branch DROP CONSTRAINT  pk_branch_idx;
 delete from reservation where reserv_member_idx = 54

 
 

 

-- 이전내용
-- 시퀀스 key
create sequence seq_member_idx
create sequence seq_r_idx
create sequence seq_loc_idx

-- 회원 table
create table member(
member_idx int not null,
member_name varchar2(50),
member_id varchar2(100),
member_pwd varchar2(100),
member_tel varchar2(100),
member_comment varchar2(500),
member_grade varchar2(100),
member_regdate date
)

select * from member

-- 예약 table
create table reservation(
r_idx int not null,
m_idx int not null,
r_loc varchar2(100),
r_room varchar2(100),
r_start varchar2(100),
r_end varchar2(100),
r_doc varchar2(300),
r_state varchar2(100),
regdate date
)

-- 지점 table
create table location(
loc_idx int not null,
loc_name varchar2(100) not null,
loc_pwd varchar2(100)
)

-- ���� �� ������ ����
insert into location values(seq_loc_idx.nextVal,'n_Fourplay','0000')


--기본키 설정
alter table member add constraint pk_member_idx primary key(member_idx);
alter table reservation add constraint pk_r_idx primary key(r_idx);
alter table location add constraint pk_loc_name primary key(loc_name);

--외래키 설정
alter table reservation
add constraint fk_reserv_m_idx foreign key (m_idx) references member(member_idx);

alter table reservation
add constraint fk_reserv_r_room foreign key (r_room) references location(loc_name);


-- 외래키 해제
ALTER TABLE branch DROP CONSTRAINT  pk_branch_idx;



--test
select * from reservation where '2020-02-29 11:55' < to_char(sysdate,'mon-m-d HH:mi') 

select * from reservation
select * from member

commit

*/

