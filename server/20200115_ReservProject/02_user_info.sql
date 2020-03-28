/*
  

 create sequence seq_user_idx
 
 create table user_info
 (
 	user_idx        int,                       
 	user_id         varchar2(100) not null,    
 	user_pwd        varchar2(100) not null,   
 	user_name       varchar2(100) not null,    
 	user_nickname	varchar2(100) not null,  
 	user_tel   	    varchar2(100) not null,   
 	user_email	    varchar2(100) not null,   
 	user_zipcode    varchar2(10),              
 	user_addr	    varchar2(100),          
 	user_ip     	varchar2(100),             
 	user_grade	    varchar2(100),			   
 	user_regdate    date,					 
 	user_modifydate date					 
 )
 

 alter table user_info
   add constraint pk_user_idx primary key(user_idx);
   
   drop table user_info
   

 alter table user_info
   add constraint unique_user_id unique(user_id);




--Sample data
 insert into user_info values(
 					seq_user_idx.nextVal,
 					'one',
 					'1234',
 					'±Ë±Ë¿Ã',
 					'±Ë¿Ã',
 					'010-1111-1111',
 					'one@thej.com',
 					'12345',
 					'11-11',
 					'127.0.0.1',
 					'vip',
 					sysdate,
 					sysdate 
 );  
 

 
 select * from user_info
 
 commit
   
     
 */