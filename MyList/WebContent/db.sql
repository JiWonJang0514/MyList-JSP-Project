--  비주얼스튜디오 터미널
--  git config --global user.name "user name"
--  git config --global user.email "user@inflearn.com"



--회원(계정) 테이블: 아이디, 비밀번호, 생일, 계정공개여부
drop table members;
create table members(
	userId varchar2(20) primary key,
	userPwd varchar2(20),
	userBirth date,
--	starType varchar2(50),
	isPublic varchar2(5)
);

insert into members values('jiwon_.14', '1234', '2005-11-14', 'F');
--insert into members values('jiwon_.14', '1234', '전갈자리', 'F');
select * from members;



--좌우명 테이블: idx, 좌우명, 작성자아이디
drop table mottos;
create table mottos(
	motto varchar2(100),
	userId varchar2(20)
);


----todo: idx시퀀스 생성
create sequence seq_todo_idx;

--투두리스트 테이블: idx, 할일, 작성자아이디, 기한
drop table todoList;
create table todoList(
	idx number primary key,
	todo varchar2(100),
	userId varchar2(20),
	deadline date
);

insert into todoList values(seq_todo_idx.nextval, '응실 작업형 수행 공부하기', 'jiwon_.14', '2022-11-08');
select * from todoList;

select * from todoList where idx=?;
delete from todoList where idx=?;
update todoList set todo=?, deadline=? where idx=?;



--별자리 테이블: 해당하는 생일, 별자리