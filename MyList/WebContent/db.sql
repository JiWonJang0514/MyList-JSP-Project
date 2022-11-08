--비주얼스튜디오 터미널
--git config --global user.name "user name"
--git config --global user.email "user@inflearn.com"
--남은 구현: 할일 기한 구분표시, 좌우명, 다른 사용자 계정 방문



--회원(계정) 테이블: 아이디, 비밀번호, 별자리, 계정공개여부
drop table members;
create table members(
	userId varchar2(20) primary key,
	userPwd varchar2(20),
	userBirth varchar2(50),
	isPublic varchar2(5)
);

insert into members values('jiwon_.14', '1234', '전갈', 'F');
select * from members;



--좌우명 테이블: idx, 좌우명, 작성자아이디
drop table mottos;
create table mottos(
	motto varchar2(100),
	userId varchar2(20)
);



--투두리스트 테이블: idx, 할일, 작성자아이디, 기한
drop table todoList;
create table todoList(
	idx number primary key,
	todo varchar2(100),
	userId varchar2(20),
	deadline date
);

----idx시퀀스 생성
create sequence seq_todo_idx;

insert into todoList values(seq_todo_idx.nextval, '응실 작업형 수행 공부하기', 'jiwon_.14', '2022-11-08');
select * from todoList;

--기한 지난 할일
select idx, todo, userId, TO_CHAR(deadline,'YYYY-MM-DD') deadline 
	from todoList
	where userId='aa__1234' and deadline < sysdate;
	
--기한 남은 할일
select idx, todo, userId, TO_CHAR(deadline,'YYYY-MM-DD') deadline 
	from todoList
	where userId='jiwon_.14' and deadline = sysdate;

select * from todoList where idx=?;
delete from todoList where idx=?;
update todoList set todo=?, deadline=? where idx=?;
