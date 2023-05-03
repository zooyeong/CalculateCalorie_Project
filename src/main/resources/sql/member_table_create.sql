CREATE TABLE member_info(
	id VARCHAR2(20) PRIMARY KEY,
	password VARCHAR2(20) NOT NULL,
	passwordcheck VARCHAR2(20) NOT NULL,
	name VARCHAR2(5) NOT NULL,
	birth DATE,
	gender VARCHAR2(1),
	email VARCHAR2(20),
	phone VARCHAR2(20) NOT NULL
);

ALTER TABLE member_info
ADD (regdate DATE DEFAULT SYSDATE);

ALTER TABLE member_info
DROP COLUMN regdate;

SELECT * FROM member_info;

commit;

ALTER TABLE member_info
MODIFY(name VARCHAR2(20));

INSERT INTO member_info VALUES ('yeong9611', 'qazxsw1234', 'qazxsw1234'
                        , '박주영', '1996-11-15', 'F', 'yeong9611@daum.net', '010-8338-9611');

CREATE TABLE agree_info(
    agree_code VARCHAR2(20) PRIMARY KEY,
    agree_title VARCHAR2(50) NOT NULL,
    agree_content VARCHAR2(50) NOT NULL,
    agree_essential VARCHAR2(1) NOT NULL
);

commit;

CREATE TABLE agree_check(
    agree_code VARCHAR2(20) NOT NULL,
    
    CONSTRAINT fk_agree_code FOREIGN KEY(agree_code)
    REFERENCES agree_info (agree_code),
    
    id VARCHAR2(20) NOT NULL,
    
    CONSTRAINT fk_id FOREIGN KEY(id)
    REFERENCES member_info (id),
    
    agree_or_no VARCHAR2(1) NOT NULL,
    agree_date DATE DEFAULT SYSDATE,
    
    CONSTRAINT pk_agree_check PRIMARY KEY(agree_code, id)
);

ALTER TABLE agree_check DROP CONSTRAINT fk_agree_code;
ALTER TABLE agree_check DROP CONSTRAINT fk_id;

SELECT * FROM agree_check;

CREATE TABLE member_management(
    id VARCHAR2(20) PRIMARY KEY,
    regdate DATE,
    pw_change_date DATE
);

SELECT * FROM member_management;

SELECT TO_DATE('1999-01-05', 'YYYY-MM-DD') FROM dual;