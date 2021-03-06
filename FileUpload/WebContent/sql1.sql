CREATE TABLE testBoard (
	num NUMBER,
	sendate date
)

CREATE sequence my start WITH 1 increment BY 1;
DROP sequence my;

INSERT INTO testBoard VALUES(my.nextval, sysdate);

CREATE TABLE web_board (
	num number,
	writer varchar2(100),
	title varchar2(1000),
	content varchar2(1000),
	fileName varchar2(100),
	sendate date
)

CREATE sequence bnum start WITH 1 increment BY 1;

INSERT INTO web_board VALUES(bnum.nextval, 'writer', 'title', 'content', 'fileName', sysdate)

SELECT * FROM web_board