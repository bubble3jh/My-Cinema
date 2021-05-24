-- 영화
CREATE TABLE MOVIE (
    MVNO CHAR(7),               -- 식별문자 (MVXXXXX)        
    MVNAME VARCHAR2(40),        -- 제목
    MVRELEASEDATE DATE,         -- 개봉일
    MVDIRECTOR VARCHAR2(20),    -- 감독
    MVCLASS NUMBER(2),          -- 시청등급
    MVRUNTIME NUMBER(3),        -- 상영시간 (단위 : MIN)
    MVGENRE VARCHAR2(10),       -- 장르
    MVSTORY NVARCHAR(1000),     -- 줄거리
    MVPREVIEW BLOB,             -- 예고편
    MVPOST BLOB,                -- 포스터
    PRIMARY KEY(MVNO)
);
 
-- 영화일정정보
CREATE TABLE MOVIESCHEDULE_INFO (
    STARTEDATE DATE,        -- 시작일
    CLOSEDATE DATE,         -- 종료일
    ISMOVIE BINARY_FLOAT,   -- 영화상영여부
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION,   -- 영화_식별문자
    PRIMARY KEY(MVNO)
);

-- 영화정보
CREATE TABLE MOVIE_INFO (
    MVBOOKRANK NUMBER(2),       -- 예매순위 
    MVBOOKINGRATE NUMBER(4,2),  -- 예매율
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION,   -- 영화_식별문자
    PRIMARY KEY(MVNO)
);

-- 배우정보
CREATE TABLE ACTOR_INFO (
    ACTORNAME VARCHAR2(20), -- 배우이름
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION,   -- 영화_식별번호
    PRIMARY KEY(MVNO)
);

-- 본인인증
CREATE TABLE VERIFICATION (
    VERNAME VARCHAR2(10),   -- 이름
    VERPHONE NUMBER(11),    -- 전화번호
    VERBIRTH DATE,          -- 생년월일 
    VERID VARCHAR2(20),     -- 아이디
    PRIMARY KEY(VERNAME),
    PRIMARY KEY(VERPHONE),
    PRIMARY KEY(VERBIRTH) 
);

-- 사용자정보
CREATE TABLE USER_INFO ( 
    USERCODE NUMBER(1), -- 구분코드 (0=비회원, 1=회원, 2=관리자)
    FOREIGN KEY(USERID) REFERENCES VERIFICATION(VERID) ON DELETE CASCADE,   -- 식별아이디
    PRIMARY KEY(USERID)
);

-- 비회원정보
CREATE TABLE NONMEMBER_INFO (
    NONMEMPWD VARCHAR2(20),         -- 임시비밀번호 
    NONMEMNAME VARCHAR2(10),        -- 이름
    NONMEMPHONE NUMBER(11),         -- 전화번호
    NONMEMBIRTH DATE,               -- 생년월일
    ISVERIFICATION BINARY_FLOAT,    -- 본인인증여부
    FOREIGN KEY(NONMEMID) REFERENCES USER_INFO(USERID) ON DELETE CASCADE,    -- 임시아이디
    PRIMARY KEY(NONMEMNO)
);

-- 회원정보
CREATE TABLE MEMBER_INFO (
    MEMPWD VARCHAR2(20),            -- 비밀번호 
    MEMNAME VARCHAR2(10),           -- 이름
    MEMEMAIL VARCHAR2(40),          -- 이메일
    MEMPHONE NUMBER(11),            -- 전화번호
    MEMBIRTH DATE,                  -- 생년월일
    ISVERIFICATION BINARY_FLOAT,    -- 본인인증여부
    TOTALPOINT NUMBER(6),           -- 누적포인트
    FOREIGN KEY(MEMID) REFERENCES USER_INFO(USERID) ON DELETE CASCADE,   -- 아이디
    PRIMARY KEY(MEMID)
);

-- 선호장르정보
CREATE TABLE FAVORGENRE_INFO (
    FAVORGENRE VARCHAR2(10),    -- 선호장르
    FOREIGN KEY(MEMID) REFERENCES MEMBER_INFO(MEMID) ON DELETE CASCADE, -- 회원정보_아이디
    PRIMARY KEY(MEMID)
);

-- 관리자정보
CREATE TABLE MANAGER_INFO (
    MNGPWD VARCHAR2(20),        -- 비밀번호 
    MNGNAME VARCHAR2(10),       -- 이름
    FOREIGN KEY(MNGID) REFERENCES USER_INFO(USERID) ON DELETE CASCADE, -- 아이디
    PRIMARY KEY(MNGID)
);

-- 지역
/* 정문통학마을, 학식러버마을, 후문자취마을, 하늘연못마을, 쪽운동장마을 */
CREATE TABLE LOCAL (
    LOCALNO CHAR(7),        -- 식별문자
    LOCALNAME VARCHAR2(10), -- 이름
    PRIMARY KEY(LOCALNO)
);

-- 영화관
/*
    정문통학마을 : 전농관, 자작마루, 건설공학관(건공관)
    학식러버마을 : 학생회관(학관), 21세기관(21관), 자연과학관(자과관)
    후문자취마을 : 창공관, 배봉관
    하늘연못마을 : 정보기술관(정기관), 인문학관, 음악관
    쪽운동장마을 : 과학기술관(과기관), 미래관, 100주년기념관(100기관)
*/

CREATE TABLE CINEMA (
    CINEMANO CHAR(7),           -- 식별문자
    CINEMANAME VARCHAR2(10),    -- 이름
    FOREIGN KEY(LOCALNO) REFERENCES LOCAL(LOCALNO) ON DELETE NO ACTION, -- 지역_식별문자
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
    SCRWAYNO CHAR(8),       -- 식별문자
    SCRWAY VARCHAR2(8),     -- 상영방식
    SCRPRICE NUMBER(4),     -- 상영금액
    PRIMARY KEY(SCRWAYNO)
);

-- 상영관
CREATE TABLE THEATER (
    THEATERNO CHAR(9),      -- 식별문자
    SEATCNT NUMBER(3),      -- 좌석수
    ISSCREEN BINARY_FLOAT,  -- 상영중여부
    FOREIGN KEY(CINEMANO) REFERENCES CINEMA(CINEMANO) ON DELETE NO ACTION,      -- 영화관_식별문자
    FOREIGN KEY(SCRWAYNO) REFERENCES SCREENWAY(SCRWAYNO) ON DELETE NO ACTION,   -- 상영방식_식별문자
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION                -- 영화_식별문자
    PRIMARY KEY(THEATERNO),
    PRIMARY KEY(CINEMANO)
);

-- 상영일정
CREATE TABLE SCHEDULE (
    SCHNO CHAR(10), -- 식별문자
    SCHTIME DATE,   -- 상영일자 (날짜랑 시각 포함)
    FOREIGN KEY(THEATERNO) REFERENCES THEATER(THEATERNO) ON DELETE NO ACTION,   -- 상영관_식별문자
    PRIMARY KEY(SCHNO)
);

-- 좌석
CREATE TABLE SEAT (
    SEATNO CHAR(3),         -- 좌석문자
    ISEMPTY BINARY_FLOAT,   --좌석여부
    FOREIGN KEY(SCHNO) REFERENCES SCHEDULE(SCHNO) ON DELETE NO ACTION,  -- 상영일정_식별문자
    PRIMARY KEY(SEATNO)
);

-- 관객방식
/*  일반 청소년 경로 우대 
    일반 : DEFAULT
    청소년 : 0.8
    경로 : 0.6
    우대 : 0.4 
*/
CREATE TABLE MOVIEGOER (
    GOERSNO CHAR(7),        -- 식별문자
    GOERSTYPE VARCHAR2(5),  -- 관객방식
    GOERSDC NUMBER(2,1),    -- 할인율
    PRIMARY KEY(GOERSNO)
);

-- 예매
CREATE TABLE BOOKING (
    BOOKINGNO CHAR(11),     -- 식별문자 (BOOKINGXXXX)
    GOERSCNT NUMBER(2),     -- 관객수
    BOOKINGDATE TIMESTAMP,  -- 예매시각
    PRIMARY KEY(BOOKINGNO)
);

-- 예매좌석정보
CREATE TABLE BOOKSEAT_INFO (  
    FOREIGN KEY(BOOKINGNO) REFERENCES BOOKING(BOOKINGNO) ON DELETE NO ACTION,   -- 예매_식별문자
    FOREIGN KEY(SEATNO) REFERENCES SEAT(SEATNO) ON DELETE NO ACTION,            -- 좌석_좌석문자
    FOREIGN KEY(GOERSNO) REFERENCES MOVIEGOER(GOERSNO) ON DELETE NO ACTION,     -- 관객방식_식별문자
    PRIMARY KEY(BOOKSEATNO)
)

-- 예매자정보
CREATE TABLE PAYER(
    ISCLASS BINARY_FLOAT,   -- 시청가능여부
    FOREIGN KEY(USERID) REFERENCES USER_INFO(USERID) ON DELETE CASCADE,         -- 사용자_식별아이디
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION                -- 영화_식별문자
    FOREIGN KEY(BOOKINGNO) REFERENCES BOOKING(BOOKINGNO) ON DELETE NO ACTION,   -- 예매_식별문자
    PRIMARY KEY(USERID)
);

-- 결제방식
/* 카드 무통장입금 인터넷결제 */
CREATE TABLE PAYWAY (
    PAYWAYNO CHAR(7),       -- 식별문자 (PAYWAYX)
    PAYWAYCODE NUMBER(1),   -- 구분코드 (0=신용카드, 1=무통장입금, 2=인터넷결제)
    PRIMARY KEY(PAYWAYNO)
);

-- 신용카드정보
CREATE TABLE CREDITCARD_INFO (
    CARDWAY VARCHAR(20),    -- 카드사
    CARDNO NUMBER(20),      -- 카드번호
    FOREIGN KEY(PAYWAYNO) REFERENCES PAYWAY(PAYWAYNO) ON DELETE NO ACTION,  -- 결제방식_식별문자
    PRIMARY KEY(PAYWAYNO)
);

-- 무통장입금정보
CREATE TABLE DEPOSIT_INFO (
    BANKNAME VARCHAR2(10),  -- 은행이름
    ACOUNTNO NUMBER(20),    -- 계좌번호
    FOREIGN KEY(PAYWAYNO) REFERENCES PAYWAY(PAYWAYNO) ON DELETE NO ACTION,  -- 결제방식_식별문자
    PRIMARY KEY(PAYWAYNO)
);

-- 인터넷결제정보
CREATE TABLE ONLINEPAY_INFO (
    QRCODE BLOB -- QR코드
    FOREIGN KEY(PAYWAYNO) REFERENCES PAYWAY(PAYWAYNO) ON DELETE NO ACTION,  -- 결제방식_식별문자
    PRIMARY KEY(PAYWAYNO)
);

-- 결제
CREATE TABLE PAYING (
    PAYNO CHAR(7),         -- 식별문자 (PAYXXXX)
    PRICE NUMBER(7),       -- 결제금액
    FOREIGN KEY(BOOKINGNO) REFERENCES BOOKING(BOOKINGNO) ON DELETE NO ACTION,   -- 예매_식별문자
    FOREIGN KEY(PAYWAYNO) REFERENCES PAYWAY(PAYWAYNO) ON DELETE NO ACTION,      -- 결제방식_식별문자
    PRIMARY KEY(PAYNO)
);

-- 결제내역정보
CREATE TABLE PAYLIST_INFO (
    PAYDATE DATE,           -- 결제시각
    ISVALID BINARY_FLOAT    -- 유효여부
    FOREIGN KEY(PAYNO) REFERENCES PAY(PAYNO) ON DELETE NO ACTION,           -- 결제_식별문자
    FOREIGN KEY(USERID) REFERENCES USER_INFO(USERID) ON DELETE NO ACTION,   -- 사용자_식별아이디
    PRIMARY KEY(PAYNO),
    PRIMARY KEY(USERID)
);

-- 포인트
/*
적립은 5%, 소모는 언제든 가능
*/
CREATE TABLE POINT (
    POINTNO CHAR(9),        -- 식별문자(POINTXXXX)
    POINTWAY BINARY_FLOAT,  -- 활용방식
    POINTTMP NUMBER(6),     -- 활용포인트
    FOREIGN KEY(MEMID) REFERENCES MEMBER_INFO(MEMID) ON DELETE CASCADE,     -- 회원정보_아이디
    FOREIGN KEY(PAYNO) REFERENCES PAYING(PAYNO) ON DELETE NO ACTION,        -- 결제_식별문자
    PRIMARY KEY(POINTNO)
);    

-- 포인트내역정보
CREATE TABLE POINTLIST_INFO (
    POINTDATE DATE, -- 활용시각
    FOREIGN KEY(POINTNO) REFERENCES POINT(POINTNO) ON DELETE NO ACTION,     -- 포인트_식별문자
    FOREIGN KEY(MEMID) REFERENCES MEMBER_INFO(MEMID) ON DELETE CASCADE,     -- 회원정보_아이디
    PRIMARY KEY(POINTNO),
    PRIMARY KEY(MEMID)
);

-- 티켓
CREATE OR REPLACE VIEW TICKET AS

SELECT
BOOKING.BOOKINGNO,  -- 예매_식별문자
PAYING.PAYNO,       -- 결제_식별문자
USER_INFO.USERID    -- 사용자정보_식별아이디
MOVIE.MVNAME,       -- 영화_제목
MOVIE.MVCLASS,      -- 영화_시청등급
LOCAL.LOCALNAME,    -- 지역_이름
CINEMA.CINEMANAME,  -- 영화관_이름
THEATER.THEATERNO,  -- 상영관_식별문자
SCHEDULE.SCHTIME,   -- 상영일정_상영일자

-- FROM PAY, MOVIE, LOCAL, CINEMA, THEATER, SCHEDULE, PAYER
-- WHERE PAY.BOOKINGNO = BOOKING.BOOKINGNO AND 
--     BOOKSEAT.BOOKINGNO = BOOKING.BOOKINGNO AND
--     BOOKSEAT.GOERSNO = MOVIEGOERS.GOERSNO AND
--     BOOKSEAT.SEATNO = SEAT.SEATNO AND
--     SEAT.SCHNO = SCHEDULE.SCHNO AND
--     SCHEDULE.THEATERNO = THEATE.THEATERNO AND
--     THEATER.MVNO = MOVIE.MVNO AND
--     THEATER.CINEMANO = CINEMA.CINEMANO AND
--     CINEMA.LOCALNO = LOCAL.LOACLNO AND
--     PAYER.PAYNO = PAY.PAYNO

-- 영수증
CREATE OR REPLACE VIEW RECEIPT AS

SELECT
PAYING.PAYNO,           -- 결제_식별문자
USER_INFO.USERID        -- 사용자정보_식별아이디
PAYWAY.PAYWAYNO,        -- 결제방식_식별문자
PAY.PRICE,              -- 결제_결제금액
PAYLIST_INFO.PAYDATE,   -- 결제내역정보_결제시각
POINT.POINTWAY,         -- 포인트_활용방식
POINT.POINTTMP          -- 포인트_활용포인트

-- FROM PAY, HOWTOPAY, PAY_LIST_INFO, POINT
-- WHERE HOWTOPAY.PAYWAYNO = PAY.PAYWAYNO AND
--     PAY.PAYNO = PAY_LIST_INFO.PAYNO AND
--     PAY_LIST_INFO.USERID = POINT.MEMID