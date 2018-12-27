1. 회원가입한 정보를 저장할 수 있는 'web_member'테이블을 만드시오.
   컬럼명 : email / pw / tel / address
   
  drop table web_member
  
  commit
  
create table web_member(
	EMAIL VARCHAR2(50) PRIMARY KEY,
	PW VARCHAR2(50),
	TEL VARCHAR2(50) ,
	ADDRESS VARCHAR2(50)
)

insert into web_member values('관리자','admin','010-3056-1102','광주광역시 광산구 호남대학교')

select * from WEB_MEMBER

select * from WEB_MEMBER where email='관리자'

select tel from WEB_MEMBER where email='관리자'
