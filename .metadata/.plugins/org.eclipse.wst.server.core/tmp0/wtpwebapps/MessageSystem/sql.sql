1. ȸ�������� ������ ������ �� �ִ� 'web_member'���̺��� ����ÿ�.
   �÷��� : email / pw / tel / address
   
  drop table web_member
  
  commit
  
create table web_member(
	EMAIL VARCHAR2(50) PRIMARY KEY,
	PW VARCHAR2(50),
	TEL VARCHAR2(50) ,
	ADDRESS VARCHAR2(50)
)

insert into web_member values('������','admin','010-3056-1102','���ֱ����� ���걸 ȣ�����б�')

select * from WEB_MEMBER

select * from WEB_MEMBER where email='������'

select tel from WEB_MEMBER where email='������'
