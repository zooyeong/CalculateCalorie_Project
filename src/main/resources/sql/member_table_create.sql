CREATE TABLE member_info(
	id VARCHAR2(20) PRIMARY KEY,
	password VARCHAR2(60) NOT NULL,
	passwordcheck VARCHAR2(60) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	birth DATE,
	gender VARCHAR2(1),
	email VARCHAR2(20),
	phone VARCHAR2(20) NOT NULL
);

CREATE TABLE member_management(
    id VARCHAR2(20) PRIMARY KEY,
    regdate DATE DEFAULT SYSDATE,
    pw_change_date DATE DEFAULT SYSDATE,
    last_accessed_time DATE DEFAULT SYSDATE,
    status NUMBER(1) DEFAULT 1
);

CREATE TABLE agree_info(
    agree_code VARCHAR2(20) PRIMARY KEY,
    agree_title VARCHAR2(50) NOT NULL,
    agree_content VARCHAR2(50) NOT NULL,
    agree_essential VARCHAR2(1) NOT NULL
);

CREATE TABLE agree_check(
    id VARCHAR2(20) PRIMARY KEY,
    f0001 VARCHAR2(1) NOT NULL,  
    f0002 VARCHAR2(1) NOT NULL,
    f0003 VARCHAR2(1) NOT NULL,
    agree_date DATE DEFAULT SYSDATE
)
;

select *
from member_info;