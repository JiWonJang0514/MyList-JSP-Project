--데이터 생성 쿼리들-----------------------------------------------------

drop table members;
drop table todoList;

--회원(계정) 테이블: 아이디, 비밀번호, 별자리, 계정공개여부
create table members(
	userId varchar2(20) primary key,
	userPwd varchar2(20),
	userBirth varchar2(50),
	userMotto varchar2(100),
	isPublic varchar2(5)
);

--더미데이터
insert into members values('jiwon_.14', '1234', '전갈', '작은 행복을 아는 사람', 'F');
insert into members values('aa_daily', '1234', '양', '티끌 모아 태산', 'T');
insert into members values('dear_yoon_02', '1234', '사수', '행복한 일은 매일 있어', 'T');
insert into members values('nana_0513', '1234', '사자', '성공의 반대는 도전하지 않는 것', 'F');
insert into members values('sieun_k', '1234', '사자', '기회는 준비된 자에게 찾아온다', 'T');
insert into members values('day0ung_15', '1234', '물병', '수고했어, 오늘도', 'T');
insert into members values('cristal.97', '1234', '처녀', 'this is my life', 'T');

--투두리스트 테이블: idx, 할일, 작성자아이디, 기한
create table todoList(
	idx number primary key,
	todo varchar2(100),
	userId varchar2(20),
	deadline date
);

--idx시퀀스 생성
create sequence seq_todo_idx;


insert into todoList values(seq_todo_idx.nextval, '친구 생일선물 쇼핑', 'aa_daily', '2022-11-24');
insert into todoList values(seq_todo_idx.nextval, '사무실용 미니가습기 주문하기', 'aa_daily', '2022-11-20');
insert into todoList values(seq_todo_idx.nextval, '보고서 작성', 'aa_daily', '2022-11-16');
insert into todoList values(seq_todo_idx.nextval, '신제품 회의 프레젠테이션 완성', 'aa_daily', '2022-11-13');
insert into todoList values(seq_todo_idx.nextval, '퇴근하면서 마트 장봐오기', 'aa_daily', '2022-11-11');
insert into todoList values(seq_todo_idx.nextval, '세탁소 옷 찾기', 'aa_daily', '2022-11-06');
insert into todoList values(seq_todo_idx.nextval, '응실 작업형 수행 공부하기', 'jiwon_.14', '2022-11-08');
insert into todoList values(seq_todo_idx.nextval, '한국사 13차시 복습', 'jiwon_.14', '2022-11-11');
insert into todoList values(seq_todo_idx.nextval, '영어 문법 공부', 'jiwon_.14', '2022-11-12');
insert into todoList values(seq_todo_idx.nextval, '빼뺴로 포장할 재료 사러가기', 'jiwon_.14', '2022-11-10');
insert into todoList values(seq_todo_idx.nextval, '토요일 라쿤 카페 예약', 'dear_yoon_02', '2022-11-16');
insert into todoList values(seq_todo_idx.nextval, '놀러갈 때 입을 옷 쇼핑', 'dear_yoon_02', '2022-11-17');
insert into todoList values(seq_todo_idx.nextval, '미용실 예약', 'dear_yoon_02', '2022-11-28');
insert into todoList values(seq_todo_idx.nextval, '아이패드 매장수령', 'nana_0513', '2022-11-28');
insert into todoList values(seq_todo_idx.nextval, '세탁기 돌리기', 'nana_0513', '2022-11-29');
insert into todoList values(seq_todo_idx.nextval, '국어 시사 어휘 스터디', 'nana_0513', '2022-12-01');
insert into todoList values(seq_todo_idx.nextval, '여의도 mbc 입사지원서 최종검토', 'nana_0513', '2022-12-15');
insert into todoList values(seq_todo_idx.nextval, '뉴스 읽고 분석하면서 논술대비', 'nana_0513', '2022-12-15');
insert into todoList values(seq_todo_idx.nextval, '면접 의상 준비', 'nana_0513', '2022-12-20');
insert into todoList values(seq_todo_idx.nextval, 'ebs 수능특강책 사기', 'sieun_k', '2022-11-15');
insert into todoList values(seq_todo_idx.nextval, '내년 대입 설명 유튜브 찾아보기', 'sieun_k', '2022-11-26');
insert into todoList values(seq_todo_idx.nextval, '기말고사 시험공부', 'sieun_k', '2022-12-08');
insert into todoList values(seq_todo_idx.nextval, '사탐 인강 듣기', 'sieun_k', '2022-12-02');
insert into todoList values(seq_todo_idx.nextval, '국어 지난범위 복습', 'sieun_k', '2022-12-02');
insert into todoList values(seq_todo_idx.nextval, '알바 면접 가기', 'day0ung_15', '2022-11-20');
insert into todoList values(seq_todo_idx.nextval, '과학 수행 준비', 'day0ung_15', '2022-11-18');
insert into todoList values(seq_todo_idx.nextval, '도서실 책 반납하기', 'day0ung_15', '2022-11-23');
insert into todoList values(seq_todo_idx.nextval, '면접 끝나고 주희랑 마라탕', 'day0ung_15', '2022-11-20');
insert into todoList values(seq_todo_idx.nextval, '민증사진 찍기', 'day0ung_15', '2022-11-26');
insert into todoList values(seq_todo_idx.nextval, '이직 회사 알아보기', 'cristal.97', '2022-12-28');
insert into todoList values(seq_todo_idx.nextval, '연말정산', 'cristal.97', '2022-12-30');
insert into todoList values(seq_todo_idx.nextval, '캣타워 배송조회', 'cristal.97', '2022-11-10');
insert into todoList values(seq_todo_idx.nextval, '이불 빨래', 'cristal.97', '2022-12-01');
insert into todoList values(seq_todo_idx.nextval, '고양이모래 주문하기', 'cristal.97', '2022-11-18');
insert into todoList values(seq_todo_idx.nextval, '마켓컬리 새벽배송 시키기', 'cristal.97', '2022-11-28');







--코드에 쓰인 쿼리들---------------------------------------------------------------

select * from members;

select * from members where isPublic='T' and userId !='aa__1234';

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