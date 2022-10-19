create table tb_bbs(
    bbsno number(5) not null -- 일련번호 -99999~99999
,
    wname varchar2(20) not null -- 작성자
,
    subject varchar2(100) not null -- 글제목
,
    content varchar2(2000) not null -- 글내용
,
    passwd varchar2(10) not null -- 글비밀번호
,
    readcnt number(5) default 0 not null -- 글조회수
,
    regdt date default sysdate -- 글작성일
,
    grpno number(5) not null -- 글 그룹번호
,
    indent number(5) default 0 -- 들여쓰기
,
    ansnum number(5) default 0 -- 글순서
,
    ip varchar2(15) not null -- 사용자 요청 PC의 IP
,
    primary key(bbsno) --bbsno 기본키
);

--시퀸스 생성
create sequence bbs_seq;

--시퀀스 삭제
drop sequence bbs_seq;

--명령어 완료
commit;

/ / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / --새글쓰기
-- bbsno: 시퀀스를 이용해서 일렬번호
-- wname, subject, content, passwd: 사용자가 입력
-- readcnt, regdi, indent, ansnum : defalut값
-- ip                             : 요청 pc의 ip저장
-- grpno                          : max(bbsno)+1
--그룹번호(grpno) 만들기
select
    max(bbsno)
from
    tb_bbs;

--null값이면 계산 안됨
select
    max(bbsno) + 1
from
    tb_bbs;

--nvl()함수를 이용해서 max(bbsno)값이 비어있을때(null) 0으로 바꾼후 +1
select
    nvl(max(bbsno), 0) + 1
from
    tb_bbs;

--행추가
insert into
    tb_bbs(
        bbsno,
        wname,
        subject,
        content,
        passwd,
        ip,
        grpno
    )
values
    (
        bbs_seq.nextval,
        ?,
        ?,
        ?,
        ?,
        ?,
        (
            select
                nvl(max(bbsno), 0) + 1
        )
        from
            tb_bbs;

) --상세보기
select
    *
from
    tb_bbs
where
    bbsno = ?0 으로 --행삭제
delete from
    tb_bbs
where
    bbsno = ?
    and passwd = ? --행수정
update
    tb_bbs
set
    wname = ?,
    subject = ?,
    content = ?,
    ip = ?
where
    bbsno = ?,
    and passwd = ? --조회수 증가
update
    tb_bbs
set
    readcnt = readcnt + 1
where
    bbsno = ? / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / --출력 줄수
set
    pagesize 100;

--한줄 출력 글자갯수
set
    linesize 100;

--칼럼길이 10칸 임시 조정
col wname for a10;

select
    *
From
    (
        Select
            bbsno,
            subject,
            wname,
            readcnt,
            indent,
            regdt,
            rownum as r
        FROM
            (
                SELECT
                    bbsno,
                    subject,
                    wname,
                    readcnt,
                    indent,
                    regdt,
                    rownum
                from
                    tb_bbs
                where
                    subject like '%파스타%'
                ORDER BY
                    grpno DESC,
                    ansnum ASC
            )
    )
where
    r >= 6
    and r <= 10;

-- 7페이징 검색
--  예) 제목에서 '파스타'가 있는 행을 검색해서 2페이지 6행~10행을 조회하시오