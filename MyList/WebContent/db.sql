--회원(계정) 테이블: 아이디, 비밀번호, 별자리, 계정공개여부
drop table members;
create table members(
	userId varchar2(20) primary key,
	userPwd varchar2(20),
	userBirth varchar2(50),
	userMotto varchar2(100),
	isPublic varchar2(5)
);

--더미데이터
insert into members values('jiwon_.14', '1234', '전갈', '작은 행복을 아는 사람', 'F');
insert into members values('mymelody', '1234', '게', '자세히 보아야 예쁘다', 'F');
insert into members values('aa_daily', '1234', '양', '티끌 모아 태산', 'T');
insert into members values('dear_yoon_02', '1234', '사수', '행복한 일은 매일 있어', 'T');
insert into members values('nana_0513', '1234', '사자', '성공의 반대는 도전하지 않는 것', 'T');
insert into members values('sieun_k', '1234', '사자', '기회는 준비된 자에게 찾아온다', 'T');
insert into members values('day0ung_15', '1234', '물병', '수고했어, 오늘도', 'T');
insert into members values('meee._.22', '1234', '처녀', '어제의 나를 뛰어넘어라', 'T');

select * from members;

select * from members where isPublic='T' and userId !='aa__1234';



--투두리스트 테이블: idx, 할일, 작성자아이디, 기한
drop table todoList;
create table todoList(
	idx number primary key,
	todo varchar2(100),
	userId varchar2(20),
	deadline date
);

--idx시퀀스 생성
create sequence seq_todo_idx;

insert into todoList values(seq_todo_idx.nextval, '응실 작업형 수행 공부하기', 'jiwon_.14', '2022-11-08');
select * from todoList;

--기한 지난 할일
select idx, todo, userId, TO_CHAR(deadline,'YYYY-MM-DD') deadline 
	from todoList
	where userId='jiwon_.14' and TO_CHAR(deadline,'YYYY-MM-DD') < TO_CHAR(sysdate,'YYYY-MM-DD')
	order by deadline desc;
	
--기한 남은 할일
select idx, todo, userId, TO_CHAR(deadline,'YYYY-MM-DD') deadline 
	from todoList
	where userId='jiwon_.14' and TO_CHAR(deadline,'YYYY-MM-DD') >= TO_CHAR(sysdate,'YYYY-MM-DD')
	order by deadline desc;

select * from todoList where idx=?;
delete from todoList where idx=?;
update todoList set todo=?, deadline=? where idx=?;

