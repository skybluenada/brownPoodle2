--��board��
SELECT * FROM tab;
DROP TABLE board;
-- board table create 
CREATE TABLE board(
	B_NUM varchar2(10) PRIMARY KEY,
	B_SUBJECT varchar2(200) NOT NULL,
	B_NAME varchar2(20) NOT NULL,
	B_CONTENT varchar2(1000) NOT NULL,
	B_FILE varchar2(100),
	B_HATE varchar2(2),
	B_LIKE varchar2(3),
	B_DELETEYN varchar2(1),
	B_INSERTDATE DATE,
	B_UPDATEDATE DATE
);
SELECT * FROM BOARD ;

-- test insert data
SELECT NVL(MAX(SUBSTR(A.B_NUM, -4)), 0) + 1 B_NUM FROM BOARD A;
INSERT INTO BOARD VALUES(
'B0001',
'�׽�Ʈ �Խñ� ����',
'�׽�Ʈ����',
'����� ���� ���Դϴ�.���� ���� abcdefghijklmnop 123456789 ���� ',
'welsi.png',
'0',
'10',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0002',
'������ ������ ��������..',
'�۹�',
'�ȳ��ϼ���. ���񰭾��� ��������! ���� �Ϳ���?!',
'welsi.png',
'0',
'50',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0003',
'�о� ����Դϴ�..',
'�����������',
'�о��� �ް������ � ���� ������ ������Դϴ� ��',
'',
'0',
'1',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0004',
'����� vs ������',
'abcuser',
'����̰� �� ��������? �ƴϸ� �������� �� ��������? ���� �Ѵ� ���ƿ�..����������',
'',
'0',
'12',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0005',
'����� �о� ���',
'cat user',
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, repellat ducimus. Ut, tempore iusto! Quas a sequi explicabo sint. Provident corrupti voluptatibus obcaecati accusantium illo est vitae fugiat maiores ea',
'cat.png',
'0',
'120',
'Y',
sysdate,
sysdate
);INSERT INTO BOARD VALUES(
'B0006',
'����� �о� ���',
'cat user',
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, repellat ducimus. Ut, tempore iusto! Quas a sequi explicabo sint. Provident corrupti voluptatibus obcaecati accusantium illo est vitae fugiat maiores ea',
'cat.png',
'0',
'120',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0007',
'����� �о� ���',
'cat user',
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, repellat ducimus. Ut, tempore iusto! Quas a sequi explicabo sint. Provident corrupti voluptatibus obcaecati accusantium illo est vitae fugiat maiores ea',
'cat.png',
'0',
'120',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0008',
'11111����� �о� ���',
'cat user',
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, repellat ducimus. Ut, tempore iusto! Quas a sequi explicabo sint. Provident corrupti voluptatibus obcaecati accusantium illo est vitae fugiat maiores ea',
'cat.jpg',
'0',
'120',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0009',
'����� �о� ���11111',
'cat user',
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, repellat ducimus. Ut, tempore iusto! Quas a sequi explicabo sint. Provident corrupti voluptatibus obcaecati accusantium illo est vitae fugiat maiores ea',
'cat.jpg',
'0',
'120',
'Y',
sysdate,
sysdate
);
INSERT INTO BOARD VALUES(
'B0010',
'hello �ȳ� hello',
'ȫȫ��',
'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, repellat ducimus. Ut, tempore iusto! Quas a sequi explicabo sint. Provident corrupti voluptatibus obcaecati accusantium illo est vitae fugiat maiores ea',
'reg.jpeg',
'0',
'500',
'Y',
sysdate,
sysdate
);
/*
 * B.B_NUM				B_NUM,
	B.B_SUBJECT			B_SUBJECT,
	B.B_NAME			B_NAME,
	B.B_CONTENT			B_CONTENT,
	B.B_FILE			B_FILE,
	B.B_HATE			B_HATE,
	B.B_LIKE			B_LIKE,
	B.B_DELETEYN		B_DELETEYN,
	TO_CHAR(B.B_INSERTDATE, 'YYYY-MM-DD')	B_INSERTDATE,
	TO_CHAR(B.B_UPDATEDATE, 'YYYY-MM-DD')	B_UPDATEDATE
	--CEIL(ROW_NUMBER() OVER(ORDER BY B.B_NUM DESC) / 3) CURPAGE,
	--COUNT(B_NUM) OVER() AS TOTALCOUNT
	*/
-- paging example
SELECT * FROM (
SELECT
	B_NUM,
	B_SUBJECT,
	B_NAME,
	B_CONTENT,
	B_FILE,
	B_HATE,
	B_LIKE,
	B_DELETEYN,
	B_INSERTDATE,
	B_UPDATEDATE,
	CEIL(ROW_NUMBER() OVER(ORDER BY B_NUM DESC) / 3) CURPAGE,
	COUNT(B_NUM) OVER() AS TOTALCOUNT
FROM (
				SELECT 
						A.B_NUM				B_NUM,
						A.B_SUBJECT			B_SUBJECT,
						A.B_NAME			B_NAME,
						A.B_CONTENT			B_CONTENT,
						A.B_FILE			B_FILE,
						A.B_HATE			B_HATE,
						A.B_LIKE			B_LIKE,
						A.B_DELETEYN		B_DELETEYN,
						TO_CHAR(A.B_INSERTDATE, 'YYYY-MM-DD')	B_INSERTDATE,
						TO_CHAR(A.B_UPDATEDATE, 'YYYY-MM-DD')	B_UPDATEDATE	
				FROM
						BOARD	A
				WHERE	B_DELETEYN = 'Y'
				AND B_SUBJECT LIKE '%�����%'
)
);
WHERE CURPAGE = 1;

SELECT  * FROM WALKRECORDED;

SELECT 
		A.B_NUM				B_NUM,
		A.B_SUBJECT			B_SUBJECT,
		A.B_NAME			B_NAME,
		A.B_CONTENT			B_CONTENT,
		A.B_FILE			B_FILE,
		A.B_HATE			B_HATE,
		A.B_LIKE			B_LIKE,
		A.B_DELETEYN		B_DELETEYN,
		TO_CHAR(A.B_INSERTDATE, 'YYYY-MM-DD')	B_INSERTDATE,
		TO_CHAR(A.B_UPDATEDATE, 'YYYY-MM-DD')	B_UPDATEDATE	
FROM
		BOARD	A
WHERE	B_DELETEYN = 'Y';



SELECT 
TO_CHAR(b.B_INSERTDATE, 'yyyy-mm-dd'), b.B_INSERTDATE , b.B_UPDATEDATE 
FROM BOARD b ;


-- �� ��ȸ 
SELECT
        A.B_NUM			B_NUM,
        A.B_SUBJECT		B_SUBJECT,
        A.B_NAME		B_NAME,
        A.B_CONTENT		B_CONTENT,
        A.B_FILE		B_FILE,
        A.B_HATE		B_HATE,
        A.B_LIKE		B_LIKE,
        A.B_HATE		B_HATE,
        A.B_DELETEYN		B_DELETEYN,
        TO_CHAR(A.B_INSERTDATE, 'YYYY-MM-DD')	B_INSERTDATE,
        TO_CHAR(A.B_UPDATEDATE, 'YYYY-MM-DD')	B_UPDATEDATE
FROM
        BOARD	A
WHERE
        B_DELETEYN = 'Y'
AND		B_NUM = 'B0002';


SELECT 
		A.B_NUM				B_NUM,
		A.B_SUBJECT			B_SUBJECT,
		A.B_NAME			B_NAME,
		A.B_CONTENT			B_CONTENT,
		A.B_FILE			B_FILE,
		A.B_HATE			B_HATE,
		A.B_LIKE			B_LIKE,
		A.B_DELETEYN		B_DELETEYN,
		TO_CHAR(A.B_INSERTDATE, 'YYYY-MM-DD')	B_INSERTDATE,
		TO_CHAR(A.B_UPDATEDATE, 'YYYY-MM-DD')	B_UPDATEDATE
FROM
		BOARD	A
WHERE	B_DELETEYN = 'Y';

--------------------------------------------------------------------------------
-- ��member&pet table��
CREATE TABLE MEMBER(
	m_num varchar2(10) PRIMARY KEY,
	m_id varchar2(20) NOT NULL,
	m_pw varchar2(300) NOT NULL,
	m_email varchar2(100) NOT NULL,
	m_name varchar2(20) NOT NULL,
	m_nick varchar2(20) NOT NULL,
	m_phone varchar2(12),
	m_photo varchar2(100),
	m_addr varchar2(50) NOT NULL,
	m_snstype varchar2(10),
	m_snsid varchar2(20),
	m_deleteyn varchar2(1),
	m_insertdate DATE,
	m_updatedate date
);

SELECT * FROM MEMBER;
SELECT * FROM BOARD b ;
INSERT INTO MEMBER values(
	'M0001', 'user01', 'qwer1234', 'user01@gmail.com', 'ȫ�浿', 'ȫȫ��',
	'01012341234', 'PS21011600311.jpg', '����Ư���� ��õ�� ���굿',
	'', '', 'Y', sysdate, sysdate
);
INSERT INTO MEMBER values(
	'M0002', 'user02', 'qwer1234', 'user02@gmail.com', 'alice', 'papa',
	'01012341234', '8e8dcec18b1ecdea14fe4a02581e34f9.jpg', '����Ư���� ��õ�� ���굿',
	'KAKAO', 'user02kaka', 'Y', sysdate, sysdate
);
INSERT INTO MEMBER values(
	'M0003', 'user03', 'qwer1234', 'user03@gmail.com', '�ż���', '���澾',
	'01012341234', '', '����Ư���� ��õ�� ���굿',
	'', '', 'Y', sysdate, sysdate
);

-- ä�� �׽�Ʈ 
SELECT NVL(MAX(SUBSTR(A.B_NUM, -4)), 0) + 1 B_NUM FROM BOARD A;

CREATE TABLE MEMBER(
    M_NUM VARCHAR2(10) PRIMARY KEY
    ,M_ID VARCHAR2(20) NOT NULL
    ,M_PW VARCHAR2(300) NOT NULL
    ,M_EMAIL VARCHAR2(100) NOT NULL
    ,M_NAME VARCHAR2(20) NOT NULL
    ,M_NICK VARCHAR2(20) NOT NULL
    ,M_PHOTO VARCHAR2(100)
    ,M_PHONE VARCHAR2(13)
    ,M_ADDR VARCHAR2(50) NOT NULL
    ,M_SNSTYPE VARCHAR2(10)
    ,M_SNSID VARCHAR2(20)
    ,M_DELETEYN VARCHAR2(1)
    ,M_INSERTDATE DATE
    ,M_UPDATEDATE DATE
); 
-- �÷� ũ�� ����
ALTER TABLE MEMBER MODIFY M_PHONE VARCHAR2(13);
desc member;
SELECT * FROM MEMBER;

COMMIT;
DROP TABLE MEMBER;
-- �Է�############################################################
INSERT INTO MEMBER (M_NUM, M_ID, M_PW, M_EMAIL, M_NAME, 
                    M_NICK, M_PHOTO, M_PHONE, M_ADDR,
                    M_SNSTYPE, M_SNSID, M_DELETEYN, M_INSERTDATE, M_UPDATEDATE)
            VALUES ('M0020', '888', '888', '888', '888', '888', 
                    '', '', '���α�', '', '', 'Y', SYSDATE, SYSDATE);
ROLLBACK;                    
DELETE FROM MEMBER;
-- ��ȸ ############################################################
-- ��ȸ - ���̵�� ��ȸ�Ҷ��� �� �ٸ���� ����ϱ�! �ǹ����� ��� ���� �׷��� �Ѵ�
-- A�� �ϳ��� ����Ʈ�� �ȿ����� ��ȿ
SELECT  A.M_NUM M_NUM, 
        A.M_ID M_ID, 
        A.M_PW M_PW, 
        A.M_EMAIL M_EMAIL, 
        A.M_NAME M_NAME, 
        A.M_NICK M_NICK, 
        A.M_PHOTO M_PHOTO, 
        A.M_PHONE M_PHONE, 
        A.M_ADDR M_ADDR,
        A.M_SNSTYPE M_SNSTYPE, 
        A.M_SNSID M_SNSID, 
        TO_CHAR(A.M_INSERTDATE, 'YYYY-MM-DD') M_INSERTDATE,
        TO_CHAR(A.M_UPDATEDATE, 'YYYY-MM-DD') M_UPDATEDATE
FROM MEMBER A
WHERE A.M_ID = '888'
    AND A.M_DELETEYN = 'Y';

SELECT * FROM MEMBER;
WHERE M_ID = ?
    AND M_DELETEYN = 'Y';

-- ����############################################################
-- ���� ������Ʈ
UPDATE MEMBER 
    SET 
        M_PW = ? , 
        M_EMAIL = ? , 
        M_NAME = ? , 
        M_NICK = ? ,
        M_PHOTO = ? ,
        M_ADDR = ? ,
        M_UPDATEDATE = SYSDATE
    WHERE M_ID = ?
    AND M_DELETEYN = 'Y';
    
    ------------------
    UPDATE MEMBER 
    SET 
        M_PW = '333' , 
        M_EMAIL = '333' , 
        M_NAME = '333' , 
        M_NICK = '333' ,
        M_PHOTO = '333' ,
        M_ADDR = '333' ,
        M_UPDATEDATE = SYSDATE
    WHERE M_ID = '888'
    AND M_DELETEYN = 'Y';
    -------------------------------
UPDATE MEMBER 
    SET 
        M_PW = #{m_pw} , 
        M_EMAIL = #{m_email} , 
        M_NAME = #{m_name} , 
        M_NICK = #{m_nick} ,
        M_PHOTO = #{m_photo} ,
        M_ADDR = #{m_addr} ,
        M_UPDATEDATE = SYSDATE
    WHERE M_ID = #{m_id}
    AND M_DELETEYN = 'Y'; 
-- �ٸ�� A�� ����ϴ� ����

-- ����############################################################

-- flag ���� - ���̵�(��)�� �������� ȸ����ȣ�� ��������

UPDATE MEMBER 
	SET M_DELETEYN = 'N' , 
	M_UPDATEDATE = SYSDATE 
	WHERE M_ID = #{m_id} 
	AND M_DELETEYN = 'Y';

UPDATE MEMBER 
	SET M_DELETEYN = 'Y', 
	M_UPDATEDATE = SYSDATE 
	WHERE M_NUM = 'M0003'
	AND M_DELETEYN = 'N';

   
SELECT * FROM MEMBER;    

COMMIT;
    
UPDATE MEMBER SET M_DELETEYN = 'N' , M_UPDATEDATE = SYSDATE WHERE M_NUM = ? AND M_DELETEYN = 'Y';

UPDATE MEMBER SET M_DELETEYN = 'N' , M_UPDATEDATE = SYSDATE WHERE M_NUM = 'M0004' AND M_DELETEYN = 'Y';

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- �ݷ����� ��� ��
DROP TABLE PET;
CREATE TABLE PET (
    P_NUM VARCHAR2(10) PRIMARY KEY
    ,M_NUM VARCHAR2(10) NOT NULL
    ,P_NAME VARCHAR2(20) NOT NULL
    ,P_AGE VARCHAR2(2)
    ,P_GENDER VARCHAR2(1)
    ,P_TYPE VARCHAR2(20)
    ,P_VARIETY VARCHAR2(50)
    ,P_PHOTO VARCHAR2(100)
    ,P_REGNUM VARCHAR2(30)
    ,P_DELETEYN VARCHAR2(1)
    ,P_INSERTDATE DATE
    ,P_UPDATEDATE DATE
);

SELECT * FROM PET;
SELECT*FROM MEMBER;
COMMIT;
ROLLBACK;


INSERT INTO PET(P_NUM, M_NUM, P_NAME, P_AGE, P_GENDER,
                P_TYPE, P_VARIETY, P_PHOTO, P_REGNUM, 
                P_DELETEYN,P_INSERTDATE,P_UPDATEDATE) 
        VALUES ('P0002', 'M0020', 'hoho', '7', 'F', '', '', '', '', 'Y', SYSDATE, SYSDATE);
        
SELECT * FROM PET;
  -----------------------------------------------      
SELECT  A.P_NUM AS P_NUM, 
        A.M_NUM AS M_NUM,
        A.P_NAME AS P_NAME, 
        A.P_AGE AS P_AGE, 
        A.P_GENDER AS P_GENDER, 
        A.P_TYPE AS P_TYPE, 
        A.P_VARIETY AS P_VARIETY, 
        A.P_PHOTO AS P_PHOTO, 
        A.P_REGNUM AS P_REGNUM, 
        TO_CHAR(A.P_INSERTDATE, 'YYYY-MM-DD') AS P_INSERTDATE,
        TO_CHAR(A.P_UPDATEDATE, 'YYYY-MM-DD') AS P_UPDATEDATE
FROM PET A
WHERE A.P_NUM = 'P0001'
    AND A.P_DELETEYN = 'Y';
----------------------------------------------------
UPDATE PET 
    SET 
        P_NAME = ? , 
        P_AGE = ? , 
        P_GENDER = ? , 
        P_TYPE = ? ,
        P_VARIETY = ? ,
        P_PHOTO = ? ,
        P_REGNUM = ? ,
        P_UPDATEDATE = SYSDATE
    WHERE P_NUM = ?
    AND P_DELETEYN = 'Y';
    
    
UPDATE PET 
    SET 
        P_NAME = 'honey' , 
        P_AGE = '10' , 
        P_GENDER = 'F' , 
        P_TYPE = '' ,
        P_VARIETY = '' ,
        P_PHOTO = '' ,
        P_REGNUM = '' ,
        P_UPDATEDATE = SYSDATE
    WHERE P_NUM = 'P0002'
    AND P_DELETEYN = 'Y';    


----------------------------
UPDATE PET 
	SET P_DELETEYN = 'N', 
	P_UPDATEDATE = SYSDATE 
	WHERE P_NUM = #{p_num} 
	AND P_DELETEYN = 'Y';


--------------------------------------------------------------------------------
--��rboard��
-- rboard table creation
CREATE TABLE rboard(
	RB_NUM varchar2(10) PRIMARY KEY,
	B_NUM varchar2(10) NOT NULL,
	RB_NAME varchar2(100) NOT NULL,
	RB_CONTENT varchar2(500) NOT NULL,
	RB_DELETEYN varchar2(1),
	RB_INSERTDATE DATE,
	RB_UPDATEDATE DATE,
	CONSTRAINT FK_B_NUM FOREIGN KEY(B_NUM) REFERENCES board(b_num)
);

SELECT 
RB_NUM, B_NUM, RB_NAME, RB_CONTENT,
RB_DELETEYN, TO_CHAR(RB_INSERTDATE, 'YYYY-MM-DD'), TO_CHAR(RB_UPDATEDATE, 'YYYY-MM-DD') 
FROM rboard
WHERE b_num = 'B0010'
order by rb_num;



SELECT * FROM board;

-- rboard INSERT 
INSERT INTO RBOARD (RB_NUM, B_NUM, RB_NAME, RB_CONTENT, RB_DELETEYN, RB_INSERTDATE, RB_UPDATEDATE)
VALUES(
'RB0001', 'B0010',
'���澾', '�� �̻��� �ФФФФФФФФФ� ',
'Y', sysdate, sysdate
);

INSERT INTO RBOARD (RB_NUM, B_NUM, RB_NAME, RB_CONTENT, RB_DELETEYN, RB_INSERTDATE, RB_UPDATEDATE)
VALUES(
'RB0002', 'B0010',
'papa', '���� �Ϳ��׿�, ǰ���� ������??',
'Y', sysdate, sysdate
);
INSERT INTO RBOARD (RB_NUM, B_NUM, RB_NAME, RB_CONTENT, RB_DELETEYN, RB_INSERTDATE, RB_UPDATEDATE)
VALUES(
'RB0003', 'B0010',
'����', '�Ϳ�!',
'Y', sysdate, sysdate
);
INSERT INTO RBOARD (RB_NUM, B_NUM, RB_NAME, RB_CONTENT, RB_DELETEYN, RB_INSERTDATE, RB_UPDATEDATE)
VALUES(
'RB0004', 'B0012',
'ȫȫ��', '�����ݸ� ���� �ȶ��ϴ�!!',
'Y', sysdate, sysdate
);

SELECT * FROM rboard;

-- ä�� ����
SELECT NVL(MAX(SUBSTR(A.RB_NUM, -4)), 0) + 1 RB_NUM FROM RBOARD A;

-- ���� ���� 
UPDATE RBOARD SET
rb_content = '���� �Ϳ���.....�ФФФФ�',
rb_updatedate = SYSDATE
WHERE rb_deleteyn = 'Y'
AND rb_num = 'RB0001';

-- ���� ���� 
UPDATE RBOARD SET
rb_deleteyn = 'N',
rb_updatedate = SYSDATE
WHERE rb_deleteyn = 'Y'
AND rb_num = 'RB0001';

-- �� ��ȸ ���� (��� ��ȣ, �Խñ� ��ȣ�� �˻�) 
SELECT 
RB_NUM, B_NUM, RB_NAME, RB_CONTENT,
RB_DELETEYN, TO_CHAR(RB_INSERTDATE, 'YYYY-MM-DD'), TO_CHAR(RB_UPDATEDATE, 'YYYY-MM-DD') 
FROM rboard
WHERE rb_deleteyn = 'Y'
AND b_num = 'B0010'
AND rb_num = 'RB0002';

SELECT * FROM "MEMBER" m ;

COMMIT;

update rboard set rb_deleteyn = 'Y'
where rb_num = 'RB0001';

--���ƿ�
create table heart(
like_num varchar2(10),
b_num varchar2(10),
m_num varchar2(10),
like_deleteyn varchar2(1)
);

select * from heart;
insert into heart values('L0001', 'B0010', 'M0002', 'Y');


select * from board b
full outer join heart h
on b.b_num = h.b_num;


SELECT * FROM (
			SELECT
					B_NUM,
					B_SUBJECT,
					B_NAME,
					B_CONTENT,
					B_FILE,
					B_HATE,
					B_LIKE,
					B_DELETEYN,
					B_INSERTDATE,
					B_UPDATEDATE,
					CEIL(ROW_NUMBER() OVER(ORDER BY B_NUM DESC) / 3) CURPAGE,
					COUNT(B_NUM) OVER() AS TOTALCOUNT,
                    M_NUM,
                    LIKE_DELETEYN
			FROM
				(
					SELECT 
							A.B_NUM				B_NUM,
							A.B_SUBJECT			B_SUBJECT,
							A.B_NAME			B_NAME,
							A.B_CONTENT			B_CONTENT,
							A.B_FILE			B_FILE,
							A.B_HATE			B_HATE,
							A.B_LIKE			B_LIKE,
							A.B_DELETEYN		B_DELETEYN,
							TO_CHAR(A.B_INSERTDATE, 'YYYY-MM-DD')	B_INSERTDATE,
							TO_CHAR(A.B_UPDATEDATE, 'YYYY-MM-DD')	B_UPDATEDATE,
                            H.M_NUM              M_NUM,
                            H.LIKE_DELETEYN      LIKE_DELETEYN  
					FROM
							BOARD	A
                    full outer join heart H
                    on A.b_num = h.b_num
					WHERE	B_DELETEYN = 'Y'
					
					ORDER BY B_NUM DESC
				)
		)
WHERE CURPAGE = 1;

SELECT * FROM (
			SELECT
					B_NUM,
					B_SUBJECT,
					B_NAME,
					B_CONTENT,
					B_FILE,
					B_HATE,
					B_LIKE,
					B_DELETEYN,
					B_INSERTDATE,
					B_UPDATEDATE,
					CEIL(ROW_NUMBER() OVER(ORDER BY B_NUM DESC) / 3) CURPAGE,
					COUNT(B_NUM) OVER() AS TOTALCOUNT,
					M_NUM,
					LIKE_DELETEYN
					
			FROM
				(
					SELECT 
							A.B_NUM				B_NUM,
							A.B_SUBJECT			B_SUBJECT,
							A.B_NAME			B_NAME,
							A.B_CONTENT			B_CONTENT,
							A.B_FILE			B_FILE,
							A.B_HATE			B_HATE,
							A.B_LIKE			B_LIKE,
							A.B_DELETEYN		B_DELETEYN,
							TO_CHAR(A.B_INSERTDATE, 'YYYY-MM-DD')	B_INSERTDATE,
							TO_CHAR(A.B_UPDATEDATE, 'YYYY-MM-DD')	B_UPDATEDATE,
							H.M_NUM              M_NUM,
                  			H.LIKE_DELETEYN      LIKE_DELETEYN  	
					FROM
							BOARD	A
					FULL OUTER JOIN HEART H
                    ON A.B_NUM = H.B_NUM
					WHERE	B_DELETEYN = 'Y'
					
					ORDER BY B_NUM DESC
				)
		)
WHERE CURPAGE = 1;
select * from heart where b_num = 'B0017';

delete from heart where  b_num = 'B0018';
commit;
delete from board 
where b_num = 'B0018';

select * from member;
select * from board;
select * from rboard;

commit;


--------------------------------------------------------------------------------
--��login��
-- ȸ������ ���̺�
CREATE TABLE MEMBER(
        M_NUM             	  	VARCHAR2(10)  	PRIMARY KEY
        ,M_ID                  	VARCHAR2(50)  
        ,M_PW                 	VARCHAR2(300) 
        ,M_EMAIL            	VARCHAR2(100) 
        ,M_NAME            	VARCHAR2(20)  
        ,M_NICK              	VARCHAR2(20)  
        ,M_PHONE           	VARCHAR2(13)  
        ,M_PHOTO           	VARCHAR2(100) 
        ,M_ADDR             	VARCHAR2(50)  
        ,M_SNSTYPE       	VARCHAR2(10)  
        ,M_SNSID            	VARCHAR2(20)  
        ,M_DELETEYN      	VARCHAR2(1)   
        ,M_INSERTDATE   	DATE          
        ,M_UPDATEDATE  	DATE          
);

---------------------------------------------------------------------------------------------------------------------------
-- ID ã�� ���̺�(ID_AUTH_NUM)
CREATE TABLE ID_AUTH_NUM(
            ID_NUM 			VARCHAR2(20)
            ,ID_AUTH_NUM 		VARCHAR2(100)
            ,M_EMAIL 			VARCHAR2(100)
            ,ID_AUTH_INSERTDATE 	DATE
);

---------------------------------------------------------------------------------------------------------------------------
-- PW ã�� ���̺�(PW_AUTH_NUM)
CREATE TABLE PW_AUTH_NUM(
            PW_NUM 			VARCHAR2(20),
            PW_AUTH_NUM 		VARCHAR2(100),
            M_ID 				VARCHAR2(50),
            PW_AUTH_INSERTDATE 	DATE
);


---------------------------------------------------------------------------------------------------------------------------
-- �ڻ�å ���̺�(WALKRECORDED)��
CREATE TABLE WALKRECORDED (
            WALK_SEQ            		VARCHAR2(50) NOT NULL
            ,M_ID                     		VARCHAR2(50) NOT NULL
            ,WALK_DATE           		DATE
            ,WALK_TIME           		VARCHAR2(10)
            ,LATITUDE_STR      		VARCHAR2(2000)
            ,LONGITUDE_STR    	VARCHAR2(2000)
);

COMMIT;
SELECT*FROM WALKRECORDED;
DROP TABLE WALKRECORDED;

INSERT INTO WALKRECORDED 
(WALK_SEQ,	M_ID, WALK_DATE, WALK_TIME,	LATITUDE_STR, LONGITUDE_STR 
)VALUES('0001', '111', SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI'), '37.479223,37.479157,37.478469,37.484936,', '126.878717,126.878551,126.875853,126.873015,');

---------------------------------------------------------------------------------------------------------------------------
-- ��Ķ���� ���̺�(CALENDAR)��
CREATE TABLE CALENDAR(  
            CAL_NO	                            	VARCHAR2(13)  PRIMARY KEY		
            ,CAL_TITLE				VARCHAR2(50)
            ,CAL_STARTDATE			VARCHAR2(20)
            ,CAL_ENDDATE			VARCHAR2(20)
            ,CAL_DESCRIPTION			VARCHAR2(400)
            ,CAL_TYPE				VARCHAR2(10)
            ,CAL_BACKGROUNDCOLOR	VARCHAR2(7)	
            ,CAL_TEXTCOLOR			VARCHAR2(7)
            ,CAL_ALLDAY			VARCHAR2(5)
            ,CAL_INSERTDATE			DATE
            ,CAL_UPDATEDATE			DATE
            ,CAL_DELETEYN			VARCHAR2(1)
            ,M_ID					VARCHAR2(50)
);



SELECT 
     A.P_NUM		P_NUM
    ,A.M_NUM		M_NUM
    ,A.P_NAME		P_NAME		 
    ,A.P_AGE		P_AGE	     
    ,A.P_GENDER	    P_GENDER	 
    ,A.P_TYPE	    P_TYPE	     
    ,A.P_VARIETY	P_VARIETY	 
    ,A.P_PHOTO		P_PHOTO		 
    ,A.P_REGNUM	    P_REGNUM	 
    ,A.P_DELETEYN	P_DELETEYN   
    ,A.P_INSERTDATE P_INSERTDATE 
    ,A.P_UPDATEDATE P_UPDATEDATE 
FROM  PET A
WHERE M_DELETEYN = 'Y';



SELECT * FROM 
( SELECT B_NUM, B_SUBJECT, B_NAME, B_CONTENT, B_FILE, 
         B_HATE, B_LIKE, B_DELETEYN, B_INSERTDATE, B_UPDATEDATE, 
         CEIL(ROW_NUMBER() OVER(ORDER BY B_NUM DESC) / 4) CURPAGE, 
         COUNT(B_NUM) OVER() AS TOTALCOUNT, M_NUM, LIKE_DELETEYN 
  FROM ( SELECT *
         FROM BOARD A,  HEART H 
         WHERE A.B_NUM = H.B_NUM          
         AND A.B_DELETEYN = 'Y'
         AND   B.LIKE_DELETEYN = 'Y'
         AND H.B_NUM = 'B0024'
         AND H.M_NUM = 'M0027')
         -- AND A.B_SUBJECT LIKE '%' || ? || '%' ORDER BY B_NUM DESC ) 
) WHERE CURPAGE = 1; 

SELECT * FROM BOARD ORDER BY 1;
SELECT * FROM HEART WHERE LIKE_DELETEYN = 'Y' AND B_NUM = 'B0024' ORDER BY 2 ;

SELECT * 
FROM BOARD A, HEART B
WHERE A.B_NUM = B.B_NUM
AND   A.B_DELETEYN = 'Y'
AND   B.LIKE_DELETEYN = 'Y'
AND   B.B_NUM = 'B0024'
AND   B.M_NUM = 'M0027';

