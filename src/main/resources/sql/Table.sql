CREATE TABLE member_table (
    loginID VARCHAR2(20) Primary Key,
    loginPW VARCHAR2(20),
    name2 VARCHAR2(50),
    email2 VARCHAR2(50),
    phone2 VARCHAR2(20),
    admins2 VARCHAR2(20),
    termsEmail VARCHAR2(20),
    termsSms VARCHAR2(20)
);

INSERT INTO member_table (loginID, loginPW, name2, email2, phone2, admins2, termsEmail, termsSms)
VALUES ('admin', 'admin', 'È­¶ó', 'posum@naver.com', '01028683756', 0, 'on', 'on');

select * from member_table;
drop table member_table;

CREATE TABLE notice_table (
    noticeboardNo INTEGER UNIQUE,
    noticeboardTitle VARCHAR2(100),
    noticeboardContent VARCHAR2(1000),
    noticeboardDate  VARCHAR2(20),
    noticeboardname2 VARCHAR2(20)
);

CREATE TABLE mostq_table (
    mostqboardNo INTEGER UNIQUE,
    mostqboardTitle VARCHAR2(100),
    mostqboardContent VARCHAR2(1000),
    mostqboardDate  VARCHAR2(20),
    mostqboardname2 VARCHAR2(20)
);

select * from mostq_table;

select * from notice_table;
drop table notice_table;

CREATE SEQUENCE noticeboardNo_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;
    
CREATE SEQUENCE mostqboardNo_seq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

drop table member_terms_table;

commit;

