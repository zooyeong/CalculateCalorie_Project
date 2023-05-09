CREATE TABLE board  (
user_id NUMBER(10) NOT NULL,
post_no NUMBER(10),
title VARCHAR2(100) NOT NULL, 
content VARCHAR2(400),
created_date DATE DEFAULT SYSDATE,
updated_date DATE DEFAULT SYSDATE,
views number(20),
total_like number(10),
count_like number(10)
);


INSERT INTO board (user_id, post_no, title, content, views, total_like, count_like)
VALUES (1234567890, 1, '첫번째 글입니다.', '이 글은 첫번째 글입니다.', 0, 0, 0);
INSERT INTO board (user_id, post_no, title, content, views, total_like, count_like)
VALUES (1234567890, 2, '두번째 글입니다.', '이 글은 첫번째 글입니다.', 0, 0, 0);
INSERT INTO board (user_id, post_no, title, content, views, total_like, count_like)
VALUES (1234567890, 3, '세번째 글입니다.', '이 글은 첫번째 글입니다.', 0, 0, 0);

select *
from board;

update board
set post_no = 2
where user_id = 1234567890 and title = '두번째 글입니다.';
update board
set post_no = 3
where user_id = 1234567890 and title = '세번째 글입니다.';