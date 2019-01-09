CREATE TABLE book_member (
	id VARCHAR2(50) CONSTRAINT bookMember_pk_id PRIMARY KEY,
	pw VARCHAR2(50),
	nick VARCHAR2(50),
	email VARCHAR2(50),
	tel VARCHAR2(50)
);