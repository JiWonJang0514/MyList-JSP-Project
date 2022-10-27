--회원(계정) 테이블: 아이디, 비밀번호, 생일, 계정공개여부
drop table members;
create table members(
	userId varchar2(20) primary key,
	userPwd varchar2(20),
	userBirth date,
	isPublic varchar2(5)
);

insert into members values('jiwon_.14', '1234', '2005-11-14', 'F');

--투두리스트 테이블: idx, 할일, 작성자아이디, 기한
--좌우명 테이블: idx, 좌우명, 작성자아이디
--별자리 테이블: 해당하는 생일, 별자리