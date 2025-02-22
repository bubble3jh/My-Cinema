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
    PRIMARY KEY(CINEMANO),
    FOREIGN KEY(LOCALNO) REFERENCES LOCAL(LOCALNO)  -- 지역_식별번호
    ON DELETE NO ACTION 
);

-- 상영방식
/* 
    2D 3D 4DX SOUNDX 
    2D : 10000원 (DEFAULT)
    3D : 20000원 (X2)
    4D : 30000원 (X3)
    SOUNDX : 30000원 (X3)
*/
CREATE TABLE SCREENWAY(
    SCRWAYNO CHAR(8),       -- 식별문자
    SCRWAY VARCHAR2(8),     -- 상영방식
    SCRWAYPRICE NUMBER(4),  -- 상영금액
    PRIMARY KEY(SCRWAYNO)
);

-- 영화
CREATE TABLE MOVIE(
    MVNO CHAR(7),               -- 식별문자           
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

--영화일정정보
CREATE TABLE MOVIESCHEDULE(
    STARTEDATE DATE,         -- 시작일
    CLOSEDATE DATE,           -- 종료일
    ISMOVIE BINARY_FLOAT,                -- 영화상영
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION,-- 영화_식별문자
    PRIMARY KEY(MVNO)
);

--영화정보
CREATE TABLE MOVIE_INFO(
    MVBOOKRANK NUMBER(2),                    -- 예매순위 
    MVBOOKINGRATE NUMBER(4,2),               -- 예매율
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION,-- 영화_식별문자
    PRIMARY KEY(MVNO)
);

-- 배우정보
CREATE TABLE ACTOR (
    ACTORNAME VARCHAR2(20),    -- 이름
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION ,  -- 영화_식별번호
    PRIMARY KEY(MVNO)
);

-- 상영관
CREATE TABLE THEATER (
    THEATERNO CHAR(9),       -- 식별번호
    THEATERNAME NUMBER(2),   -- 이름(XX관)
    SEATCNT NUMBER(3),         -- 좌석수
    ONSCREEN BINARY_FLOAT,       -- 상영중
    PRIMARY KEY(THEATERNO),
    FOREIGN KEY(SCRWAYNO) REFERENCES SCREENWAY(SCRWAYNO) ON DELETE NO ACTION,   -- 상영방식_식별번호
    FOREIGN KEY(CINEMANO) REFERENCES CINEMA(CINEMANO) ON DELETE NO ACTION,      -- 영화관_식별번호
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION               -- 영화_식별번호
);

-- 상영일정
CREATE TABLE SCHEDULE (
    SCHNO CHAR(10),   -- 식별문자
    SCHTIME DATE,   -- 상영시각 (날짜랑 시각 포함)
    PRIMARY KEY(SCHNO),
    FOREIGN KEY(THEATERNO) REFERENCES THEATER(THEATERNO) ON DELETE NO ACTION  -- 상영관_식별번호
);

-- 좌석
CREATE TABLE SEAT (
    SEATNO CHAR(3),    -- 좌석문자
    PRIMARY KEY(SEATNO),
    FOREIGN KEY(SCHNO) REFERENCES SCHEDULE(SCHNO) ON DELETE NO ACTION  -- 상영일정_식별번호
);

-- 관객종류
/*  일반 청소년 경로 우대 
    일반 : DEFAULT
    청소년 : 0.8
    경로 : 0.6
    우대 : 0.4 
*/
CREATE TABLE MOVIEGOERS (
    GOERSNO CHAR(7),     -- 식별문자
    GOERSTYPE VARCHAR2(5), -- 관객종류
    GOERSDC NUMBER(2,1),    -- 관객할인
    PRIMARY KEY(GOERSNO) ON DELETE NO ACTION
);

-- 예매정보
CREATE TABLE BOOKING_INFO (
    BOOKINGNO CHAR(9),   -- 식별문자 (BOOKINGXX)
    GOERSCNT NUMBER(2),    -- 관객수
    BOOKINGDATE TIMESTAMP,   -- 예매시각
);

-- 예매좌석정보
CREATE TABLE BOOKINGSEAT(  
    FOREIGN KEY(BOOKINGNO) REFERENCES BOOKING_INFO(BOOKINGNO) ON DELETE NO ACTION,  -- 예매정보_식별문자
    FOREIGN KEY(SEATNO) REFERENCES SEAT(SEATNO) ON DELETE NO ACTION,                -- 좌석_좌석번호
    FOREIGN KEY(GOERSNO) REFERENCES MOVIEGOERS(GOERSNO) ON DELETE NO ACTION,        -- 관객종류_식별번호
    PRIMARY KEY(BOOKSEATNO)
)

-- 사용자
CREATE TABLE USER(
    USERID VARCHAR2(20),        -- 식별아이디
    MEMBERCHECK NUMBER(1),    -- 회원체크 (0=비회원, 1=회원, 2=관리자)
    PRIMARY KEY(USERID)
);

-- 비회원
CREATE TABLE NONMEMBER(
    NONMEMNAME VARCHAR2(10),     -- 이름
    NONMEMPHONE NUMBER(11),      -- 전화번호
    NONMEMBIRTH DATE,            -- 생년월일
    VERIFICATION BINARY_FLOAT,   -- 본인인증
    NONMEMPWD VARCHAR2*(20),     -- 임시비밀번호 
    FOREIGN KEY(NONMEMID) REFERENCES USER(USERID) ON DELETE CASCADE,  -- 임시아이디
    PRIMARY KEY(NONMEMNO)
);

-- 회원
CREATE TABLE MEMBER(
    MEMPWD VARCHAR2(20),        -- 비밀번호 
    MEMNAME VARCHAR2(10),       -- 이름
    MEMEMAIL VARCHAR2(40),      -- 이메일
    MEMPHONE NUMBER(11),        -- 전화번호
    MEMBIRTH DATE,          -- 생년월일
    ISVERIFICATION BINARY_FLOAT,   -- 본인인증
    POINT NUMBER(6),           -- 포인트 점수
    FOREIGN KEY(MEMID) REFERENCES USER(USERID) ON DELETE CASCADE, -- 아이디
    PRIMARY KEY(MEMID)
);

-- 선호장르정보
CREATE TABLE FAVORGENRE_INFO(
    FAVORGENRE VARCHAR2(10),    -- 선호장르
    FOREIGN KEY(MEMID) REFERENCES MEMBER(MEMID) ON DELETE CASCADE,    -- 회원_아이디
    PRIMARY KEY(MEMID)
);

--본인인증
CREATE TABLE VERIFICATION(
    VERNAME VARCHAR2(10),       -- 이름
    VERPHONE NUMBER(11),        -- 전화번호
    VERBIRTH DATE,              -- 생년월일
    FOREIGN KEY(VERID) REFERENCES USER(USERID) ON DELETE NO ACTION, -- 아이디
    PRIMARY KEY(VERID)
    
);

--관리자
CREATE TABLE MANAGER(
    MNGPWD VARCHAR2(20),        -- 비밀번호 
    MNGNAME VARCHAR2(10),       -- 이름
    FOREIGN KEY(MNGID) REFERENCES USER(USERID) ON DELETE CASCADE, -- 아이디
    PRIMARY KEY(MNGID)
);

-- 결제방법
/* 카드 무통장입금 인터넷결제 */
CREATE TABLE PAYWAY(
    PAYWAYNO CHAR(8),    -- 식별문자 (PAYWAYXX)
    PAYWAY VARCHAR2(10),    -- 결제방법
    PRIMARY KEY(PAYWAYNO)
);

-- 결제정보
CREATE TABLE PAY_INFO(
    PAYNO CHAR(5),         -- 식별문자
    PRICE NUMBER(7),       -- 결제금액
    PRIMARY KEY(PAYNO), 
    FOREIGN KEY(BOOKINGNO) REFERENCES BOOKING_INFO(BOOKINGNO) ON DELETE NO ACTION,      -- 티켓_일련번호
    FOREIGN KEY(PAYWAYNO) REFERENCES HOWTOPAY(PAYWAYNO) ON DELETE NO ACTION     -- 결제방법_식별번호
);

--결제정보내역
CREATE TABLE PAY_INFO_LIST(
    PAYDATE DATE,          -- 결제시각
    FOREIGN KEY(PAYNO) REFERENCES PAY_INFO(PAYNO) ON DELETE NO ACTION,    -- 결제정보_식별번호
    PRIMARY KEY(PAYNO),
    FOREIGN KEY(USERID) REFERENCES USER(USERID) ON DELETE NO ACTION,    -- 사용자_식별아이디
    PRIMARY KEY(USERID),
    PRIMARY KEY(PAYTIME),
    ISVALID BINARY_FLOAT                                 -- 유효여부
);

-- 결제자정보
CREATE TABLE PAYER(
    DOCLASS BINARY_FLOAT,    -- 시청가능
    FOREIGN KEY(MEMID) REFERENCES MEMBER(MEMID) ON DELETE NO ACTION,            -- 사용자_식별아이디
    PRIMARY KEY(PAYNO),
    FOREIGN KEY(PAYWAYNO) REFERENCES HOWTOPAY(PAYWAYNO) ON DELETE NO ACTION,    -- 결제방법_식별번호
    FOREIGN KEY(MVNO) REFERENCES MOVIE(MVNO) ON DELETE NO ACTION               -- 영화_식별번호
);

-- 포인트정보
/*
적립은 5%, 소모는 언제든 가능
*/
CREATE TABLE POINT_INFO(
    POINTNO CHAR(7),     -- 식별문자
    POINTWAY BINARY_FLOAT,  -- 활용방식
    SCORE NUMBER(6),       -- 활용점수
    FOREIGN KEY(PAYNO) REFERENCES PAY_INFO(PAYNO) ON DELETE NO ACTION ,      -- 결제정보_식별번호
    PRIMARY KEY(PAYNO),
    PRIMARY KEY(POINTNO),
    FOREIGN KEY(MEMID) REFERENCES MEMBER(MEMID) ON DELETE CASCADE ,            -- 회원_아이디
    PRIMARY KEY(MEMID),
);    

-- 포인트정보내역
CREATE TABLE POINT_INFO_LIST(
    POINTDATE DATE,                                               -- 활용시각
    FOREIGN KEY(POINTNO) REFERENCES POINT_INFO(POINTNO) ON DELETE NO ACTION,            -- 포인트정보_식별번호
    PRIMARY KEY(POINTNO),
    PRIMARY KEY(POINTDATE)
);

-- 티켓
CREATE OR REPLACE VIEW TICKET AS
SELECT
PAY_INFO.PAYNO,
MOVIE.MVNAME,
MOVIE.MVCLASS,
LOCAL.LOCALNAME,
CINEMA.CINEMANAME,
THEATER.THEATERNAME,
SCHEDULE.SCHTIME
FROM PAY_INFO, MOVIE, LOCAL, CINEMA, THEATER, SCHEDULE
WHERE PAY_INFO.BOOKINGNO = BOOKING_INFO.BOOKINGNO AND 
    BOOKSEAT.BOOKINGNO = BOOKING_INFO.BOOKINGNO AND
    BOOKSEAT.GOERSNO = MOVIEGOERS.GOERSNO AND
    BOOKSEAT.SEATNO = SEAT.SEATNO AND
    SEAT.SCHNO = SCHEDULE.SCHNO AND
    SCHEDULE.THEATERNO = THEATE.THEATERNO AND
    THEATER.MVNO = MOVIE.MVNO AND
    THEATER.CINEMANO = CINEMA.CINEMANO AND
    CINEMA.LOCALNO = LOCAL.LOACLNO