-- 영화
CREATE TABLE MOVIE (
    MVNO CHAR(7) NOT NULL,                  -- 식별문자 (MVXXXXX)        
    MVNAME VARCHAR2(40) UNIQUE NOT NULL,    -- 제목
    MVRELEASEDATE DATE NOT NULL,            -- 개봉일
    MVDIRECTOR VARCHAR2(20) NOT NULL,       -- 감독
    MVCLASS NUMBER(2) NOT NULL,             -- 시청등급
    MVRUNTIME NUMBER(3) NOT NULL,           -- 상영시간 (단위 : MIN)
    MVGENRE VARCHAR2(10) NOT NULL,          -- 장르
    MVSTORY NVARCHAR2(1000),                -- 줄거리
    MVPREVIEW BLOB,                         -- 예고편
    MVPOST BLOB,                            -- 포스터
    PRIMARY KEY(MVNO)
);
 
-- 영화일정정보
CREATE TABLE MOVIESCHEDULE_INFO (
    MVNO CHAR(7) REFERENCES MOVIE(MVNO) NOT NULL,   -- 영화_식별문자
    STARTEDATE DATE NOT NULL,                       -- 시작일
    CLOSEDATE DATE,                                 -- 종료일
    ISMOVIE BINARY_FLOAT DEFAULT 0,                 -- 영화상영여부
    PRIMARY KEY(MVNO)
);

-- 영화인기정보
CREATE TABLE MOVIE_INFO (
    MVNO CHAR(7) REFERENCES MOVIE(MVNO),        -- 영화_식별문자
    MVBOOKRANK NUMBER(2) DEFAULT 0,             -- 예매순위 
    MVBOOKRATE NUMBER(4,2) DEFAULT 0 NOT NULL,  -- 예매율
    PRIMARY KEY(MVNO)
);

-- 배우정보
CREATE TABLE ACTOR_INFO (
    MVNO CHAR(7) REFERENCES MOVIE(MVNO),    -- 영화_식별문자
    ACTORNAME VARCHAR2(20) NOT NULL,        -- 배우이름
    PRIMARY KEY(MVNO)
);

-- 본인인증
CREATE TABLE VERIFICATION (
    VERNAME VARCHAR2(10) NOT NULL,  -- 이름
    VERPHONE NUMBER(11)NOT NULL,    -- 전화번호
    VERBIRTH DATE NOT NULL          -- 생년월일 
);

-- 사용자
CREATE TABLE USERS ( 
    USERID VARCHAR2(20) NOT NULL,   -- 식별아이디
    USERCODE NUMBER(1) NOT NULL,    -- 구분코드 (0=비회원, 1=회원, 2=관리자)
    PRIMARY KEY(USERID)
);

-- 비회원정보
CREATE TABLE NONMEMBERS_INFO (
    NONMEMID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE,  -- 임시아이디
    NONMEMPWD VARCHAR2(20) NOT NULL,                -- 임시비밀번호 
    NONMEMNAME VARCHAR2(10) NOT NULL,               -- 이름
    NONMEMPHONE NUMBER(11) NOT NULL,                -- 전화번호
    NONMEMBIRTH DATE NOT NULL,                      -- 생년월일
    ISVERIFICATION BINARY_FLOAT DEFAULT 0 NOT NULL, -- 본인인증여부
    ISCLASS BINARY_FLOAT NOT NULL,                  -- 시청가능여부
    PRIMARY KEY(NONMEMID)
);

-- 회원정보
CREATE TABLE MEMBERS_INFO (
    MEMID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE, -- 아이디
    MEMPWD VARCHAR2(20) NOT NULL,                   -- 비밀번호 
    MEMNAME VARCHAR2(10) NOT NULL,                  -- 이름
    MEMEMAIL VARCHAR2(40) NOT NULL,                 -- 이메일
    MEMPHONE NUMBER(11) NOT NULL,                   -- 전화번호
    MEMBIRTH DATE NOT NULL,                         -- 생년월일
    ISVERIFICATION BINARY_FLOAT DEFAULT 0 NOT NULL, -- 본인인증여부
    ISCLASS BINARY_FLOAT NOT NULL,                  -- 시청가능여부
    TOTALPOINT NUMBER(6) DEFAULT 0 NOT NULL,        -- 총포인트
    PRIMARY KEY(MEMID)
);

-- 최애장르정보
CREATE TABLE BESTGENRE_INFO (
    MEMID VARCHAR2(20) REFERENCES MEMBERS_INFO(MEMID) ON DELETE CASCADE, -- 회원정보_아이디
    BESTGENRE VARCHAR2(10),    -- 최애장르
    PRIMARY KEY(MEMID)
);

-- 관리자정보
CREATE TABLE MANAGERS_INFO (
    MNGID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE, -- 아이디
    MNGPWD VARCHAR2(20) NOT NULL,       -- 비밀번호 
    MNGNAME VARCHAR2(10) NOT NULL,      -- 이름
    PRIMARY KEY(MNGID)
);

-- 지역
CREATE TABLE LOCAL (
    LOCALNO CHAR(7) NOT NULL,               -- 식별문자
    LOCALNAME VARCHAR2(20) UNIQUE NOT NULL, -- 이름
    PRIMARY KEY(LOCALNO)
);

-- 영화관
CREATE TABLE CINEMA (
    CINEMANO CHAR(8) NOT NULL,                          -- 식별문자
    LOCALNO CHAR(7) REFERENCES LOCAL(LOCALNO) NOT NULL, -- 지역_식별문자
    CINEMANAME VARCHAR2(20) UNIQUE NOT NULL,            -- 이름
    PRIMARY KEY(CINEMANO)
);

-- 상영방식
/* 
    2D 3D 4DX SOUNDX 
    2D : 10000원 (DEFAULT)
    3D : 20000원 (X2)
    4D : 30000원 (X3)
    SOUNDX : 30000원 (X3)
*/
CREATE TABLE SCREENWAY (
    SCRWAYNO CHAR(8) NOT NULL,                          -- 식별문자
    SCRWAY VARCHAR2(8) DEFAULT '2D' UNIQUE NOT NULL,    -- 상영방식
    SCRPRICE NUMBER(5) DEFAULT 10000 NOT NULL,          -- 상영금액
    PRIMARY KEY(SCRWAYNO)
);

-- 상영관
CREATE TABLE THEATER (
    THEATERNO CHAR(9) NOT NULL,     -- 식별문자
    CINEMANO CHAR(8) REFERENCES CINEMA(CINEMANO) NOT NULL,      -- 영화관_식별문자
    SCRWAYNO CHAR(8) REFERENCES SCREENWAY(SCRWAYNO) NOT NULL,   -- 상영방식_식별문자
    SEATTTL NUMBER(3) DEFAULT 0 NOT NULL,     -- 총좌석수
    SEATCNT NUMBER(3) DEFAULT 0 NOT NULL      -- 누적좌석수
);

CREATE UNIQUE INDEX PK_THEATER ON THEATER (CINEMANO  ASC, THEATERNO ASC);
ALTER TABLE THEATER ADD CONSTRAINT PK_THEATER PRIMARY KEY (CINEMANO, THEATERNO);

-- 상영일정
CREATE TABLE SCHEDULE (
    SCHNO CHAR(10) NOT NULL,    -- 식별문자
    CINEMANO CHAR(8) NOT NULL,  -- 영화관_식별문자
    THEATERNO CHAR(9) NOT NULL, -- 상영관_식별문자
    MVNO CHAR(7) REFERENCES MOVIE(MVNO) NOT NULL,   -- 영화_식별문자
    SCHTIME DATE NOT NULL,      -- 상영일자 (날짜랑 시각 포함)
    PRIMARY KEY(SCHNO)
);

ALTER TABLE SCHEDULE 
ADD (
    CONSTRAINT FK_THEATER FOREIGN KEY (CINEMANO, THEATERNO) 
    REFERENCES THEATER (CINEMANO, THEATERNO) ON DELETE SET NULL
);

-- 좌석
CREATE TABLE SEAT (
    CINEMANO CHAR(8) NOT NULL,                          -- 영화관_식별문자
    THEATERNO CHAR(9) NOT NULL,                         -- 상영관_식별문자
    SCHNO CHAR(10) REFERENCES SCHEDULE(SCHNO) NOT NULL, -- 상영일정_식별문자
    SEATNO CHAR(3) NOT NULL,                            -- 좌석문자
    ISEMPTY BINARY_FLOAT DEFAULT 0 NOT NULL             -- 좌석여부
);

CREATE UNIQUE INDEX PK_SEAT ON SEAT (CINEMANO ASC, THEATERNO ASC, SCHNO ASC, SEATNO ASC);
ALTER TABLE SEAT ADD CONSTRAINT PK_SEAT PRIMARY KEY (CINEMANO, THEATERNO, SCHNO, SEATNO);

ALTER TABLE SEAT 
ADD (
    CONSTRAINT FK_THEATER2 FOREIGN KEY (CINEMANO, THEATERNO) 
    REFERENCES THEATER (CINEMANO, THEATERNO) ON DELETE SET NULL
);
   
-- 관객방식
/*  일반 청소년 경로 우대 
    일반 : DEFAULT
    청소년 : 0.8
    경로 : 0.6
    우대 : 0.4 
*/
CREATE TABLE MOVIEGOERS (
    GOERSNO CHAR(7) NOT NULL,                               -- 식별문자
    GOERSWAY VARCHAR2(10) DEFAULT '일반' UNIQUE NOT NULL,   -- 관객방식
    GOERSDC NUMBER(2,1) DEFAULT 1 NOT NULL,                 -- 할인율
    PRIMARY KEY(GOERSNO)
);

-- 예매
CREATE TABLE BOOKING (
    BOOKINGNO CHAR(11) NOT NULL,    -- 식별문자 (BOOKINGXXXX)
    GOERSCNT NUMBER(2) NOT NULL,    -- 관객수
    BOOKINGDATE TIMESTAMP NOT NULL, -- 예매시각
    PRIMARY KEY(BOOKINGNO)
);

-- 예매좌석정보
CREATE TABLE BOOKSEAT_INFO (  
    BOOKINGNO CHAR(11) REFERENCES BOOKING(BOOKINGNO) NOT NULL,  -- 예매_식별문자
    CINEMANO CHAR(8) NOT NULL,  -- 영화관_식별문자
    THEATERNO CHAR(9) NOT NULL, -- 상영관_식별문자
    SCHNO CHAR(10) NOT NULL,    -- 상영일정_식별문자
    SEATNO CHAR(3) NOT NULL,    -- 좌석_좌석문자
    GOERSNO CHAR(7) REFERENCES MOVIEGOERS(GOERSNO) NOT NULL     -- 관객방식_식별문자
);

CREATE UNIQUE INDEX PK_BOOKSEAT_INFO ON BOOKSEAT_INFO (BOOKINGNO ASC, CINEMANO ASC, THEATERNO ASC, SCHNO ASC, SEATNO ASC);
ALTER TABLE BOOKSEAT_INFO ADD CONSTRAINT PK_BOOKSEAT_INFO PRIMARY KEY (BOOKINGNO, CINEMANO, THEATERNO, SCHNO, SEATNO);

ALTER TABLE BOOKSEAT_INFO
ADD (
    CONSTRAINT FK_SEAT FOREIGN KEY (CINEMANO, THEATERNO, SCHNO, SEATNO)
    REFERENCES SEAT (CINEMANO, THEATERNO, SCHNO, SEATNO) ON DELETE SET NULL
);

-- 결제방식
CREATE TABLE PAYWAY (
    PAYWAYNO CHAR(7) NOT NULL,      -- 식별문자 (PAYWAYX)
    PAYWAYCODE NUMBER(1) NOT NULL,  -- 구분코드 (0=신용카드, 1=무통장입금, 2=인터넷결제)
    PRIMARY KEY(PAYWAYNO)
);

-- 신용카드정보
CREATE TABLE CREDITCARD_INFO (
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO) NOT NULL,  -- 결제방식_식별문자
    CARDNAME VARCHAR(20) NOT NULL,                          -- 카드사
    CARDNUM NUMBER(20) UNIQUE NOT NULL,                     -- 카드번호
    PRIMARY KEY(PAYWAYNO)
);

-- 무통장입금정보
CREATE TABLE DEPOSIT_INFO (
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO) NOT NULL,  -- 결제방식_식별문자
    BANKNAME VARCHAR2(10) NOT NULL,                         -- 은행사
    ACOUNTNUM NUMBER(20) UNIQUE NOT NULL,                   -- 계좌번호
    PRIMARY KEY(PAYWAYNO)
);

-- 인터넷결제정보
CREATE TABLE ONLINEPAY_INFO (
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO) NOT NULL,  -- 결제방식_식별문자
    QRCODE BLOB NOT NULL,                                   -- QR코드
    PRIMARY KEY(PAYWAYNO)
);

-- 결제
CREATE TABLE PAYING (
    PAYNO CHAR(7) NOT NULL,                                     -- 식별문자 (PAYXXXX)
    BOOKINGNO CHAR(11) REFERENCES BOOKING(BOOKINGNO) NOT NULL,  -- 예매_식별문자
    PAYWAYNO CHAR(7) REFERENCES PAYWAY(PAYWAYNO) NOT NULL,      -- 결제방식_식별문자
    PRICE NUMBER(7) NOT NULL,                                   -- 결제금액
    PRIMARY KEY(PAYNO)
);

-- 결제내역정보
CREATE TABLE PAYLIST_INFO (
    PAYNO CHAR(7) REFERENCES PAYING(PAYNO) NOT NULL,                -- 결제_식별문자
    USERID VARCHAR2(20) REFERENCES USERS(USERID) ON DELETE CASCADE, -- 사용자_식별아이디
    PAYDATE TIMESTAMP NOT NULL,                                     -- 결제시각
    ISVALID BINARY_FLOAT DEFAULT 1 NOT NULL,                        -- 유효여부
    ISWATCHED BINARY_FLOAT DEFAULT 0 NOT NULL                       -- 시청여부
);

CREATE UNIQUE INDEX PK_PAYLIST_INFO ON PAYLIST_INFO (PAYNO ASC, USERID ASC);
ALTER TABLE PAYLIST_INFO ADD CONSTRAINT PK_PAYLIST_INFO PRIMARY KEY (PAYNO, USERID);

-- 포인트
CREATE TABLE POINT (
    POINTNO CHAR(9) NOT NULL,       -- 식별문자(POINTXXXX)
    MEMID VARCHAR2(20) REFERENCES MEMBERS_INFO(MEMID) ON DELETE CASCADE,    -- 회원정보_아이디
    PAYNO CHAR(7) REFERENCES PAYING(PAYNO) NOT NULL,                        -- 결제_식별문자
    POINTWAY BINARY_FLOAT NOT NULL, -- 활용방식
    POINTTMP NUMBER(6) NOT NULL,    -- 활용포인트
    PRIMARY KEY(POINTNO)
);    

-- 포인트내역정보
CREATE TABLE POINTLIST_INFO (
    POINTNO CHAR(9) REFERENCES POINT(POINTNO) NOT NULL,                     -- 포인트_식별문자
    MEMID VARCHAR2(20) REFERENCES MEMBERS_INFO(MEMID) ON DELETE CASCADE,    -- 회원정보_아이디
    POINTDATE TIMESTAMP NOT NULL,               -- 활용시각
    ISVALID BINARY_FLOAT DEFAULT 1 NOT NULL     -- 유효여부
);

CREATE UNIQUE INDEX PK_POINTLIST_INFO ON POINTLIST_INFO (POINTNO ASC, MEMID ASC);
ALTER TABLE POINTLIST_INFO ADD CONSTRAINT PK_POINTLIST_INFO PRIMARY KEY (POINTNO, MEMID);

-- 티켓
CREATE VIEW TICKET AS
SELECT
    USERS.USERID,           -- 사용자_식별아이디
    MOVIE.MVNAME,           -- 영화_이름
    MOVIE.MVCLASS,          -- 영화_시청등급
    LOCAL.LOCALNAME,        -- 지역_이름
    CINEMA.CINEMANAME,      -- 영화관_이름
    THEATER.THEATERNO,      -- 상영관_식별문자
    SCREENWAY.SCRWAY,       -- 상영방식_상영방식
    SCHEDULE.SCHTIME,       -- 상영일정_상영일자
    BOOKSEAT_INFO.SEATNO    -- 예매좌석정보_좌석_좌석문자
FROM PAYLIST_INFO, USERS, PAYING, BOOKING, BOOKSEAT_INFO, SEAT, SCHEDULE, MOVIE, THEATER, SCREENWAY, CINEMA, LOCAL
WHERE PAYLIST_INFO.USERID = USERS.USERID AND
    PAYLIST_INFO.PAYNO = PAYING.PAYNO AND 
    PAYING.BOOKINGNO = BOOKING.BOOKINGNO AND
    BOOKING.BOOKINGNO = BOOKSEAT_INFO.BOOKINGNO AND
    BOOKSEAT_INFO.SEATNO = SEAT.SEATNO AND
    SEAT.SCHNO = SCHEDULE.SCHNO AND
    SCHEDULE.MVNO = MOVIE.MVNO AND
    SCHEDULE.THEATERNO = THEATER.THEATERNO AND
    THEATER.SCRWAYNO = SCREENWAY.SCRWAYNO AND
    THEATER.CINEMANO = CINEMA.CINEMANO AND
    CINEMA.LOCALNO = LOCAL.LOCALNO;

-- 영수증
CREATE VIEW RECEIPT AS
SELECT
    USERS.USERID,           -- 사용자_식별아이디
    PAYWAY.PAYWAYCODE,      -- 결제방식_구분코드
    PAYING.PRICE,           -- 결제_결제금액
    PAYLIST_INFO.PAYDATE,   -- 결제내역정보_결제시각
    POINT.POINTWAY,         -- 포인트_활용방식
    POINT.POINTTMP          -- 포인트_활용포인트
FROM PAYLIST_INFO, USERS, PAYING, PAYWAY, POINT
WHERE PAYLIST_INFO.USERID = USERS.USERID AND 
    PAYLIST_INFO.PAYNO = PAYING.PAYNO AND
    PAYING.PAYWAYNO = PAYWAY.PAYWAYNO AND 
    PAYING.PAYNO = POINT.PAYNO;