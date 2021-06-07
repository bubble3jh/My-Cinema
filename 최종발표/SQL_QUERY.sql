-- ### 관리자 ###




-- # DEJH에 지역을 등록한다.
-- 지역을 등록한다.
INSERT INTO LOCAL VALUES("LOCALNO", "LOCALNAME");
-- 지역을 제거한다.
DELETE FROM LOCAL WHERE LOCALNO = "LOCALNO";




-- # DEJH에 영화관을 등록한다.
-- 영화관을 등록한다.
INSERT INTO CINEMA VALUES("CINEMANO", "CINEMANAME", "LOCALNO");
-- 영화관을 제거한다.
DELETE FROM CINEMA WHERE CINEMANO = "CINEMANO";




-- # 영화관에 상영관을 등록한다.
-- 상영관을 등록한다.
INSERT INTO THEATER VALUES("THEATERNO", "SEATTTL", "SEATCNT", "CINEMANO", "SCRWAYNO");
-- 상영관을 제거한다.
DELETE FROM THEATER WHERE THEATERNO = "THEATERNO" AND CINEMANO = "CINEMANO";




-- # 상영방식을 등록한다.
-- 상영방식을 등록한다.
INSERT INTO SCREENWAY VALUES("SCRWAYNO", "SCRWAY", "SCRPRICE");
-- 상영방식을 제거한다.
DELETE FROM SCREENWAY WHERE SCRWAYNO = "SCRWAYNO";
-- 상영방식을 수정한다.(상영금액만 수정가능)
UPDATE SCREENWAY SET SCRPRICE = "SCRPRICE" WHERE SCRWAYNO = "SCRWAYNO";




-- # 관객방식을 등록한다.
-- 관객방식을 등록한다.
INSERT INTO MOVIEGOERS VALUES("GOERSNO", "GOERSWAY", "GOERSDC");
-- 관객방식을 제거한다.
DELETE FROM MOVIEGOERS WHERE GOERSNO = "GOERSNO";
-- 관객방식을 수정한다.
UPDATE MOVIEGOERS SET GOERSDC = "GOERSDC" WHERE GOERSNO = "GOERSNO";




-- # DEJH에 영화를 등록한다.
-- 영화를 등록한다.
INSERT INTO MOVIE VALUES("MVNO", "MVNAME", "MVRELEASEDATE", "MVDIRECTOR", "MVCLASS", "MVRUNTIME", "MVGENRE", "MVSTORY", "MVPREVIEW", "MVPOST");
-- 영화를 제거한다.(상영일정에 등록되어 있지 않은지 조회)
DELETE FROM MOVIE WHERE MVNO = "MVNO";

DELETE FROM MOVIESCHEDULE_INFO WHERE MVNO = "MVNO";

UPDATE MOVIE_INFO SET MVBOOKRANK = 0 WHERE MVNO = "MVNO";

DELETE FROM ACTOR_INFO WHERE MVNO = "MVNO";




-- # 상영일정을 등록한다.
-- 영화 상영 일정을 등록한다.
INSERT INTO SCHEDULE VALUES("SCHNO", "SCHTIME", "THEATERNO", "MVNO");
-- 영화 상영 일정을 제거한다.
DELETE FROM SCHEDULE WHERE SCHNO = "SCHNO";




-- # 고객의 정보를 조회한다.
-- 고객의 회원정보를 조회한다.
SELECT NONMEMBERS_INFO.* 
FROM USERS, NONMEMBERS_INFO 
WHERE USERS.USERCODE = 0;

SELECT MEMBERS_INFO.* 
FROM USERS, MEMBERS_INFO 
WHERE USERS.USERCODE = 1;
-- 고객의 결제 내역을 조회한다.
SELECT PAYLIST_INFO.* 
FROM USERS, PAYLIST_INFO
WHERE USERS.USERID = PAYLIST_INFO.USERID;
-- 고객의 포인트 내역을 조회한다.
SELECT POINTLIST_INFO.* 
FROM MEMBERS_INFO, POINTLIST_INFO
WHERE MEMBERS_INFO.MEMID = POINTLIST_INFO.MEMID;
-- 고객정보를 삭제한다.
DELETE FROM USERS WHERE USERID = "USERID";

DELETE FROM MEMBERS_INFO WHERE MEMID = "USERID";




-- # 관리자로 로그인한다.
-- 로그인한다.
SELECT MANAGERS_INFO.* 
FROM USERS, MANAGERS_INFO
WHERE USERS.USERCODE = 2;








-- ### 고객 ###




-- # 회원가입한다.

-- 회원정보를 입력한다.
-- INSERT INTO USERS VALUES(식별아이디, 구분코드);
-- INSERT INTO MEMBERS_INFO VALUES(아이디, 비밀번호, 이름, 이메일, 전화번호, 생년월일, 본인인증여부, 시청가능여부, 누적포인트);
INSERT INTO USERS(USERID, USERCODE) VALUES(:USERID, 1);

INSERT INTO MEMBERS_INFO(MEMID, MEMPWD, MEMNAME, MEMEMAIL, MEMPHONE, MEMBIRTH, ISVERIFICATION, ISCLASS, TOTALPOINT)
    VALUES(:MEMID, :MEMPWD, :MEMNAME, :MEMEMAIL, :MEMPHONE, :MEMBIRTH, 0, 0, NULL);


-- 본인인증 및 회원가입완료한다.
UPDATE MEMBERS_INFO
SET ISVERIFICATION = 1, TOTALPOINT = 0
WHERE COUNT(
    SELECT VERIFICATION.VERNAME
    FROM VERIFICATION AS VER, MANAGERS_INFO AS MEM
    WHERE VER.VERNAME = MEM.MEMNAME AND VER.VERPHONE = MEM.MEMPHONE AND VER.VERBIRTH = MEM.MEMBIRTH
) = 1;

UPDATE MEMBERS_INFO
SET ISCLASS = 1
WHERE ISVERIFICATION = 1 AND MEMBIRTH > 01/12/31;


-- 최애장르를 입력한다.
-- INSERT INTO BESTGENRE_INFO VALUES(회원정보_아이디, 최애장르);
INSERT INTO BESTGENRE_INFO(MEMID, BESTGENRE) VALUES(:MEMID, :BESTGENRE);


-- 회원 정보를 수정한다.
UPDATE MEMBERS_INFO 
SET MEMPWD = :MEMPWD, MEMNAME = :MEMNAME, MEMEMAIL = :MEMEMAIL
WHERE MEMID = :USERID;

UPDATE BESTGENRE_INFO
SET BESTGENRE = :BESTGENRE
WHERE MEMID = :USERID;


-- 회원탈퇴한다.
DELETE FROM USERS WHERE USERID = :USERID;
DELETE FROM MEMBERS_INFO WHERE MEMID = :USERID;


-- 회원정보를 조회한다.

-- -- 회원정보를 조회한다.
SELECT *
FROM MEMBERS_INFO
WHERE MEMID = :USERID;


-- -- 포인트 정보를 조회한다.
SELECT *
FROM POINTLIST_INFO
WHERE MEMID = :USERID;




-- # DEJH에 로그인한다.

-- 회원으로 로그인한다.
SELECT MEMBERS_INFO.MEMID, MEMBERS_INFO.MEMPWD 
FROM USERS, MEMBERS_INFO
WHERE USERS.USERCODE = 1;
-- 비회원으로 로그인한다.
SELECT NONMEMBERS_INFO.NONMEMID, NONMEMBERS_INFO.NONMEMPWD 
FROM USERS, NONMEMBERS_INFO
WHERE USERS.USERCODE = 0;




-- # 등록된 영화를 조회한다.
-- 영화를 영화이름으로 검색하여 조회한다. (영화정보)
SELECT * 
FROM MOVIE 
WHERE MVNAME = "MVNAME";
-- 영화를 선호장르별 조회한다. (메인페이지)
SELECT MOVIE.* 
FROM MOVIE, BESTGENRE_INFO
WHERE BESTGENRE_INFO.MEMID = "USERID" AND BESTGENRE_INFO.BESTGENRE = MOVIE.MVGENRE;
-- 영화를 예매순위로 조회한다.
SELECT * 
FROM MOVIE
WHERE MVNO = 
    (SELECT MVNO
    FROM MOVIE_INFO
    WHERE MVBOOKRANK BETWEEN 1 AND 5
    ORDER BY MVBOOKRANK);    

-- 영화를 장르별로 조회한다.
SELECT * 
FROM MOVIE 
WHERE MVGENRE = "MVGENRE";




-- # 티켓을 예매한다.(= 만든다)
-- 회원이 예매한다.
-- -- 예매자의 시청 가능 여부를 확인한다.
--(예매한적 없는 회원인 경우)
INSERT INTO BOOKER_INFO VALUES("USERID", NULL, "MVNO", NULL);

UPDATE BOOKER_INFO
SET ISCLASS = 0
WHERE 
    (SELECT MV.MVCLASS
    FROM BOOKER_INFO AS BO, MVNO AS MV
    WHERE "USERID" = BO.USERID AND BO.MVNO = MV.MVNO)
    >
    2022 - (SELECT ME.MEMBIRTH
    FROM BOOKER_INFO AS BO, MEMBERS_INFO AS ME
    WHERE "USERID" = BO.USERID AND BO.USERID = ME.MEMID);

UPDATE BOOKER_INFO
SET ISCLASS = 1
WHERE 
    (SELECT MV.MVCLASS
    FROM BOOKER_INFO AS BO, MVNO AS MV
    WHERE "USERID" = BO.USERID AND BO.MVNO = MV.MVNO)
    <=
    2022 - (SELECT ME.MEMBIRTH
    FROM BOOKER_INFO AS BO, MEMBERS_INFO AS ME
    WHERE "USERID" = BO.USERID AND BO.USERID = ME.MEMID);

SELECT ISCLASS
FROM BOOKER_INFO
WHERE USERID = "USERID";
--(예매한적 있는 회원인 경우)
SELECT ISCLASS
FROM BOOKER_INFO
WHERE USERID = "USERID";

INSERT INTO BOOKER_INFO VALUES("USERID", "ISCLASS", "MVNO", NULL);
-- -- 영화를 예매한다.
/*
지역별 예매 방식 : 지역 ㅡ> 영화관 ㅡ> 상영관 + 상영일정 ㅡ> 영화
*/
SELECT MVNO, THEATERNO
FROM  SCHEDULE 
WHERE SCHTIME = "SCHTIME" AND THEATERNO =
    (SELECT THEATERNO
    FROM THEATER 
    WHERE CINEMANO = 
        (SELECT CINEMANO
        FROM CINEMA
        WHERE CINEMANAME = "CINEMANAME" AND LOCALNO = 
            (SELECT LOACLNO
            FROM LOCAL
            WHERE LOCALNAME = "LOCALNAME")));

SELECT MVNAME
FROM MOVIE
WHERE MVNO = "MVNO";

SELECT SEATNO
FROM SEAT
WHERE THEATERNO = "THEATERNO" AND SCHNO =
        (SELECT SCHNO
        FROM SCHEDULE
        WHERE SCHTIME = "SCHTIME")
    AND ISEMPTY = 1;

INSERT INTO BOOKSEAT_INFO VALUES("BOOKINGNO", "SEATNO", "GOERSNO");
INSERT INTO BOOKING VALUES("BOOKINGNO", "GOERSCNT", GETDATE());

UPDATE BOOKER_INFO
SET BOOKINGNO = "BOOKINGNO";
/*
영화별 예매 방식: 영화 ㅡ> 지역 ㅡ> 영화관 ㅡ> 상영관 + 상영일정
*/
SELECT MVNO
FROM MOVIE
WHERE MVNAME = "MVNAME";

SELECT THEATERNO
FROM  SCHEDULE 
WHERE SCHTIME = "SCHTIME" AND MVNO = "MVNO" AND THEATERNO =
    (SELECT THEATERNO
    FROM THEATER 
    WHERE CINEMANO = 
        (SELECT CINEMANO
        FROM CINEMA
        WHERE CINEMANAME = "CINEMANAME" AND LOCALNO = 
            (SELECT LOACLNO
            FROM LOCAL
            WHERE LOCALNAME = "LOCALNAME")));

SELECT SEATNO
FROM SEAT
WHERE THEATERNO = "THEATERNO" AND SCHNO =
        (SELECT SCHNO
        FROM SCHEDULE
        WHERE SCHTIME = "SCHTIME")
    AND ISEMPTY = 1;

INSERT INTO BOOKSEAT_INFO VALUES("BOOKINGNO", "SEATNO", "GOERSNO");
INSERT INTO BOOKING VALUES("BOOKINGNO", "GOERSCNT", GETDATE());

UPDATE BOOKER_INFO
SET BOOKINGNO = "BOOKINGNO";

-- 비회원이 예매한다.
-- -- 예매자의 시청 가능 여부를 확인한다.
INSERT INTO BOOKER_INFO VALUES("USERID", NULL, "MVNO", NULL);

UPDATE BOOKER_INFO
SET ISCLASS = 0
WHERE 
    (SELECT MV.MVCLASS
    FROM BOOKER_INFO AS BO, MVNO AS MV
    WHERE "USERID" = BO.USERID AND BO.MVNO = MV.MVNO)
    >
    2022 - (SELECT NO.NONMEMBIRTH
    FROM BOOKER_INFO AS BO, NONMEMBERS_INFO AS NO
    WHERE "USERID" = BO.USERID AND BO.USERID = NO.NONMEMID);

UPDATE BOOKER_INFO
SET ISCLASS = 1
WHERE 
    (SELECT MV.MVCLASS
    FROM BOOKER_INFO AS BO, MVNO AS MV
    WHERE "USERID" = BO.USERID AND BO.MVNO = MV.MVNO)
    <=
    2022 - (SELECT NO.NONMEMBIRTH
    FROM BOOKER_INFO AS BO, NONMEMBERS_INFO AS NO
    WHERE "USERID" = BO.USERID AND BO.USERID = NO.NONMEMID);

SELECT ISCLASS
FROM BOOKER_INFO
WHERE USERID = "USERID";
-- -- 영화를 예매한다.
/*
지역별 예매 방식 : 지역 ㅡ> 영화관 ㅡ> 상영관 + 상영일정 ㅡ> 영화
*/
SELECT MVNO, THEATERNO
FROM  SCHEDULE 
WHERE SCHTIME = "SCHTIME" AND THEATERNO =
    (SELECT THEATERNO
    FROM THEATER 
    WHERE CINEMANO = 
        (SELECT CINEMANO
        FROM CINEMA
        WHERE CINEMANAME = "CINEMANAME" AND LOCALNO = 
            (SELECT LOACLNO
            FROM LOCAL
            WHERE LOCALNAME = "LOCALNAME")));

SELECT MVNAME
FROM MOVIE
WHERE MVNO = "MVNO";

SELECT SEATNO
FROM SEAT
WHERE THEATERNO = "THEATERNO" AND SCHNO =
        (SELECT SCHNO
        FROM SCHEDULE
        WHERE SCHTIME = "SCHTIME")
    AND ISEMPTY = 1;

INSERT INTO BOOKSEAT_INFO VALUES("BOOKINGNO", "SEATNO", "GOERSNO");
INSERT INTO BOOKING VALUES("BOOKINGNO", "GOERSCNT", GETDATE());

UPDATE BOOKER_INFO
SET BOOKINGNO = "BOOKINGNO";
/*
영화별 예매 방식: 영화 ㅡ> 지역 ㅡ> 영화관 ㅡ> 상영관 + 상영일정
*/
SELECT MVNO
FROM MOVIE
WHERE MVNAME = "MVNAME";

SELECT THEATERNO
FROM  SCHEDULE 
WHERE SCHTIME = "SCHTIME" AND MVNO = "MVNO" AND THEATERNO =
    (SELECT THEATERNO
    FROM THEATER 
    WHERE CINEMANO = 
        (SELECT CINEMANO
        FROM CINEMA
        WHERE CINEMANAME = "CINEMANAME" AND LOCALNO = 
            (SELECT LOACLNO
            FROM LOCAL
            WHERE LOCALNAME = "LOCALNAME")));

SELECT SEATNO
FROM SEAT
WHERE THEATERNO = "THEATERNO" AND SCHNO =
        (SELECT SCHNO
        FROM SCHEDULE
        WHERE SCHTIME = "SCHTIME")
    AND ISEMPTY = 1;

INSERT INTO BOOKSEAT_INFO VALUES("BOOKINGNO", "SEATNO", "GOERSNO");
INSERT INTO BOOKING VALUES("BOOKINGNO", "GOERSCNT", GETDATE());

UPDATE BOOKER_INFO
SET BOOKINGNO = "BOOKINGNO";

-- 예매를 취소한다. 
DELETE FROM BOOKING WHERE BOOKINGNO = "BOOKINGNO";
DELETE FROM BOOKSEAT_INFO WHERE BOOKINGNO = "BOOKINGNO";
DELETE FROM BOOKER_INFO WHERE BOOKINGNO = "BOOKINGNO";
 



-- # 티켓을 결제한다.
INSERT INTO PAYING VALUES("PAYNO", "PRICE", "BOOKINGNO", NULL);
-- 결제 방식을 선택한다.
SELECT PAYWAYNO
FROM PAYWAY
WHERE PAYWAYCODE = "PAYWAYCODE";
-- -- 신용카드로 결제한다.
INSERT INTO CREDITCARD_INFO VALUES("PAYWAYNO", "CARDNAME", "CARDNUM");
-- -- 무통장입금으로 결제한다.
INSERT INTO DEPOSIT_INFO VALUES("PAYWAYNO", "BANKNAME", "ACOUNTNUM");
-- -- 인터넷결제로 결제한다.
INSERT INTO ONLINEPAY_INFO VALUES("PAYWAYNO", "QRCODE");

-- 포인트를 활용한다.
-- -- 포인트를 적립한다.
INSERT INTO POINT VALUES("POINTNO", 1, "POINTTMP", "MEMID", "PAYNO");
INSERT INTO POINTLIST_INFO VALUES("POINTNO", "MEMID", GETDATE(), 1);
-- -- 포인트를 소모한다.
INSERT INTO POINT VALUES("POINTNO", 0, "POINTTMP", "MEMID", "PAYNO");
INSERT INTO POINTLIST_INFO VALUES("POINTNO", "MEMID", GETDATE(), 1);

-- 결제를 완료한다.(예매율 정보 UPDATE)
UPDATE PAYING
SET PAYWAYNO = "PAYWAYNO";

INSERT INTO PAYLIST_INFO VALUES("PAYNO", "USERID", GETDATE(), 1, 0);   

UPDATE MOVIE_INFO
SET MVBOOKRATE = "MVBOOKRATE", MVBOOKRANK = "MVBOOKRANK";

-- 티켓정보를 조회한다.
SELECT * 
FROM VIEW
WHERE USERID = "USERID";
-- 결제내역정보를 조회한다.
SELECT * 
FROM PAYLIST_INFO
WHERE USERID = "USERID";
-- 결제 완료된 예매정보를 확인한다. -- 구현할것이 없음
-- 결제 완료된 예매정보를 취소한다. (예매율 정보 UPDATE)
INSERT INTO PAYLIST_INFO VALUES("PAYNO", "USERID", GETDATE(), 0, 0);
INSERT INTO POINTLIST_INFO VALUES("POINTNO", "MEMID", GETDATE(), 0);

DELETE FROM PAYING WHERE PAYNO = "PAYNO";
DELETE FROM POINT WHERE PAYNO = "PAYNO";

UPDATE MOVIE_INFO
SET MVBOOKRATE = "MVBOOKRATE", MVBOOKRANK = "MVBOOKRANK";

-- 영수증 정보를 조회한다.
SELECT * 
FROM RECEIPT
WHERE USERID = "USERID";