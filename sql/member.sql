CREATE TABLE member (
    id VARCHAR(10) NOT NULL,
    -- 아이디, 중복 안됨.
    passwd VARCHAR(10) NOT NULL,
    -- 패스워드
    mname VARCHAR(20) NOT NULL,
    -- 성명
    tel VARCHAR(14) NULL,
    -- 전화번호
    email VARCHAR(50) NOT NULL UNIQUE,
    -- 전자우편 주소, 중복 안됨
    zipcode VARCHAR(7) NULL,
    -- 우편번호, 12345
    address1 VARCHAR(255) NULL,
    -- 주소 1
    address2 VARCHAR(255) NULL,
    -- 주소 2(나머지주소)
    job VARCHAR(20) NOT NULL,
    -- 직업
    mlevel CHAR(2) NOT NULL,
    -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate DATE NOT NULL,
    -- 가입일
    PRIMARY KEY (id)
);

commit;

insert into
    member(
        id,
        passwd,
        mname,
        tel,
        email,
        zipcode,
        address1,
        address2,
        job,
        mlevel,
        mdate
    )
values
    (
        'webmaster',
        '12341234',
        '웹마스터',
        '123-4567',
        'webmaster@itwill.com',
        '12345',
        '서울시 강남구 역삼동',
        '삼원타워4층',
        'A02',
        'A1',
        sysdate
    );

insert into
    member(
        id,
        passwd,
        mname,
        tel,
        email,
        zipcode,
        address1,
        address2,
        job,
        mlevel,
        mdate
    )
values
    (
        'itwill',
        '12341234',
        '웹마스터',
        '123-4567',
        'itwill@itwill.com',
        '12345',
        '서울시 강남구 역삼동',
        '삼원타워4층',
        'A02',
        'D1',
        sysdate
    );

insert into
    member(
        id,
        passwd,
        mname,
        tel,
        email,
        zipcode,
        address1,
        address2,
        job,
        mlevel,
        mdate
    )
values
    (
        'user1',
        '12341234',
        '웹마스터',
        '123-4567',
        'user1@soldesk.com',
        '12345',
        '서울시 종로구 관철동',
        '코아빌딩8층',
        'A02',
        'F1',
        sysdate
    );