/*
    # 2021년 기준 02년생까지 청불 영화가능
*/

-- 영화 도메인(영화 크롤링) 

-- 관리자 도메인
-- INSERT INTO MANAGER_INFO VALUES(비밀번호, 이름, 아이디);
INSERT INTO MANAGER_INFO VALUES("aaa1111!", "강진호", "bubble3jh456");
INSERT INTO MANAGER_INFO VALUES("bbb2222!", "양다은", "daaeun123");

-- 본인인증 도메인
-- INSERT INTO VERIFICATION VALUES(이름, 전화번호, 생년월일);
INSERT INTO VERIFICATION VALUES("유재석", 01011112222, 901204);
INSERT INTO VERIFICATION VALUES("박명수", 01022223333, 840623);
INSERT INTO VERIFICATION VALUES("하하", 01033334444, 871227);
INSERT INTO VERIFICATION VALUES("정준하", 01044445555, 770421);
INSERT INTO VERIFICATION VALUES("양세형", 01055556666, 000505);
INSERT INTO VERIFICATION VALUES("조세호", 01066667777, 030813);
INSERT INTO VERIFICATION VALUES("강호동", 01077778888, 010102);
INSERT INTO VERIFICATION VALUES("이상민", 01088889999, 970308);
INSERT INTO VERIFICATION VALUES("서장훈", 01077778888, 011112);
INSERT INTO VERIFICATION VALUES("김영철", 01077778888, 750630);
INSERT INTO VERIFICATION VALUES("이수근", 01077778888, 740220);
INSERT INTO VERIFICATION VALUES("김희철", 01077778888, 011022);
INSERT INTO VERIFICATION VALUES("민경훈", 01077778888, 071225);

-- 지역 도메인
-- INSERT INTO LOCAL VALUES(식별문자, 이름);
INSERT INTO LOCAL VALUES(LOCAL01, "정문통학마을");
INSERT INTO LOCAL VALUES(LOCAL02, "학식러버마을");
INSERT INTO LOCAL VALUES(LOCAL03, "후문자취마을");
INSERT INTO LOCAL VALUES(LOCAL04, "하늘연못마을");
INSERT INTO LOCAL VALUES(LOCAL05, "쪽운동장마을");

-- 영화관 도메인
-- INSERT INTO CINEMA VALUES(식별문자, 이름, 지역_식별문자);
INSERT INTO CINEMA VALUES(CINEMA01, "전농관", LOCAL01);
INSERT INTO CINEMA VALUES(CINEMA02, "자작마루", LOCAL01);
INSERT INTO CINEMA VALUES(CINEMA03, "건공관", LOCAL01);
INSERT INTO CINEMA VALUES(CINEMA04, "학관", LOCAL02);
INSERT INTO CINEMA VALUES(CINEMA05, "21관", LOCAL02);
INSERT INTO CINEMA VALUES(CINEMA06, "자과관", LOCAL02);
INSERT INTO CINEMA VALUES(CINEMA07, "창공관", LOCAL03);
INSERT INTO CINEMA VALUES(CINEMA08, "배봉관", LOCAL03);
INSERT INTO CINEMA VALUES(CINEMA09, "정기관", LOCAL04);
INSERT INTO CINEMA VALUES(CINEMA10, "인문학관", LOCAL04);
INSERT INTO CINEMA VALUES(CINEMA11, "음악관", LOCAL04);
INSERT INTO CINEMA VALUES(CINEMA12, "과기관", LOCAL05);
INSERT INTO CINEMA VALUES(CINEMA13, "미래관", LOCAL05);
INSERT INTO CINEMA VALUES(CINEMA14, "백기관", LOCAL05);


-- 상영방식 도메인
-- INSERT INTO SCREENWAY VALUES(식별문자, 상영방식, 상영금액);
INSERT INTO SCREENWAY VALUES(SCRWAY01, "2D", 10000);
INSERT INTO SCREENWAY VALUES(SCRWAY02, "3D", 20000);
INSERT INTO SCREENWAY VALUES(SCRWAY03, "4DX", 30000);
INSERT INTO SCREENWAY VALUES(SCRWAY04, "SOUNDX", 30000);

-- 상영관 도메인
-- INSERT INTO THEATER VALUES(식별문자, 좌석수, 상영중여부, 영화관_식별문자, 상영방식_식별문자, 영화_식별문자);
INSERT INTO THEATER VALUES(THEATER01, 100, 0, CINEMA01, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER02, 80, 0, CINEMA01, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER03, 60, 0, CINEMA01, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER04, 40, 0, CINEMA01, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER05, 20, 0, CINEMA01, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER06, 100, 0, CINEMA02, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER07, 80, 0, CINEMA02, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER08, 60, 0, CINEMA02, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER09, 40, 0, CINEMA02, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER10, 20, 0, CINEMA02, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER11, 100, 0, CINEMA03, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER12, 80, 0, CINEMA03, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER13, 60, 0, CINEMA03, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER14, 40, 0, CINEMA03, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER15, 20, 0, CINEMA03, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER16, 100, 0, CINEMA04, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER17, 80, 0, CINEMA04, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER18, 60, 0, CINEMA04, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER19, 40, 0, CINEMA04, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER20, 20, 0, CINEMA04, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER21, 100, 0, CINEMA05, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER22, 80, 0, CINEMA05, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER23, 60, 0, CINEMA05, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER24, 40, 0, CINEMA05, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER25, 20, 0, CINEMA05, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER26, 100, 0, CINEMA06, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER27, 80, 0, CINEMA06, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER28, 60, 0, CINEMA06, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER29, 40, 0, CINEMA06, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER30, 20, 0, CINEMA06, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER31, 100, 0, CINEMA07, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER32, 80, 0, CINEMA07, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER33, 60, 0, CINEMA07, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER34, 40, 0, CINEMA07, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER35, 20, 0, CINEMA07, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER36, 100, 0, CINEMA08, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER37, 80, 0, CINEMA08, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER38, 60, 0, CINEMA08, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER39, 40, 0, CINEMA08, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER40, 20, 0, CINEMA08, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER41, 100, 0, CINEMA09, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER42, 80, 0, CINEMA09, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER43, 60, 0, CINEMA09, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER44, 40, 0, CINEMA09, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER45, 20, 0, CINEMA09, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER46, 100, 0, CINEMA10, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER47, 80, 0, CINEMA10, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER48, 60, 0, CINEMA10, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER49, 40, 0, CINEMA10, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER50, 20, 0, CINEMA10, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER51, 100, 0, CINEMA11, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER52, 80, 0, CINEMA11, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER53, 60, 0, CINEMA11, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER54, 40, 0, CINEMA11, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER55, 20, 0, CINEMA11, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER56, 100, 0, CINEMA12, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER57, 80, 0, CINEMA12, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER58, 60, 0, CINEMA12, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER59, 40, 0, CINEMA12, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER60, 20, 0, CINEMA12, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER61, 100, 0, CINEMA13, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER62, 80, 0, CINEMA13, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER63, 60, 0, CINEMA13, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER64, 40, 0, CINEMA13, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER65, 20, 0, CINEMA13, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER66, 100, 0, CINEMA14, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER67, 80, 0, CINEMA14, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER68, 60, 0, CINEMA14, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER69, 40, 0, CINEMA14, SCRWAY01, MV00001);
INSERT INTO THEATER VALUES(THEATER70, 20, 0, CINEMA14, SCRWAY01, MV00001);

-- 좌석 도메인
-- INSERT INTO SEAT VALUES(좌석문자, 상영관_식별문자, 좌석여부, 상영일정_식별문자);
-- 함수로 구현하자.

-- 관객방식 도메인
-- INSERT INTO MOVIEGOERS VALUES(식별문자, 관객방식, 할인율);
INSERT INTO MOVIEGOERS VALUES(GOERS01, "일반", 1.0);
INSERT INTO MOVIEGOERS VALUES(GOERS02, "청소년", 0.8);
INSERT INTO MOVIEGOERS VALUES(GOERS02, "경로", 0.6);
INSERT INTO MOVIEGOERS VALUES(GOERS02, "우대", 0.4);



-- # 관리자 #

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
INSERT INTO THEATER VALUES("THEATERNO", "SEATCNT", "CINEMANO", "SCRWAYNO");
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
SELECT NONMEMBER_INFO.* 
FROM USER, NONMEMBER_INFO 
WHERE USER.USERCODE = 0;

SELECT MEMBER_INFO.* 
FROM USER, MEMBER_INFO 
WHERE USER.USERCODE = 1;
-- 고객의 결제 내역을 조회한다.
SELECT PAYLIST_INFO.* 
FROM USER, PAYLIST_INFO
WHERE USER.USERID = PAYLIST_INFO.USERID;
-- 고객의 포인트 내역을 조회한다.
SELECT POINTLIST_INFO.* 
FROM MEMBER_INFO, POINTLIST_INFO
WHERE MEMBER_INFO.MEMID = POINTLIST_INFO.MEMID;
-- 고객정보를 삭제한다.
DELETE FROM USER WHERE USERID = "USERID";

DELETE FROM MEMBER_INFO WHERE MEMID = "USERID";

-- # 관리자로 로그인한다.
-- 로그인한다.
SELECT MANAGER_INFO.* 
FROM USER, MANAGER_INFO
WHERE USER.USERCODE = 2;



-- # 고객 #

-- # DEJH에 회원가입한다.
-- 고객 정보를 입력한다.
INSERT INTO USER VALUES("USERID",1);
INSERT INTO MEMBER_INFO VALUES("USERID", "MEMPWD", "MEMNAME", "MEMEMAIL", "MEMPHONE", "MEMBIRTH", 0, NULL);
-- 본인인증 및 회원가입완료한다.
UPDATE MEMBER_INFO
SET ISVERIFICATION = 1, TOTALPONUNINT = 0
WHERE COUNT(
    SELECT VERIFICATION.VERNAME
    FROM VERIFICATION AS VER, MANAGER_INFO AS MEM
    WHERE VER.VERNAME = MEM.MEMNAME AND VER.VERPHONE = MEM.MEMPHONE AND VER.VERBIRTH = MEM.MEMBIRTH
) != 0;
-- 회원 정보를 수정한다.
UPDATE MEMBER_INFO 
SET MEMPWD = "MEMPWD", MEMNAME = "MEMNAME", MEMEMAIL = "MEMEMAIL"
WHERE MEMID = "USERID";
-- 회원탈퇴한다.
DELETE FROM USER WHERE USERID = "USERID";
DELETE FROM MEMBER_INFO WHERE MEMID = "USERID";
-- 회원정보를 조회한다.
-- -- 회원정보를 조회한다.
SELECT *
FROM MEMBER_INFO
WHERE MEMID = "USERID";
-- -- 포인트 정보를 조회한다.
SELECT *
FROM POINTLIST_INFO
WHERE MEMID = "USERID";

-- # DEJH에 로그인한다.
-- 회원으로 로그인한다.
SELECT MEMBER_INFO.MEMID, MEMBER_INFO.MEMPWD 
FROM USER, MEMBER_INFO
WHERE USER.USERCODE = 1;
-- 비회원으로 로그인한다.
SELECT NONMEMBER_INFO.NONMEMID, NONMEMBER_INFO.NONMEMPWD 
FROM USER, NONMEMBER_INFO
WHERE USER.USERCODE = 0;

-- # 등록된 영화를 조회한다.
-- 영화를 영화이름으로 검색하여 조회한다. (영화정보)
SELECT * 
FROM MOVIE 
WHERE MVNAME = "MVNAME";
-- 영화를 선호장르별 조회한다. (메인페이지)
SELECT MOVIE.* 
FROM MOVIE, FAVORGENRE_INFO
WHERE FAVORGENRE_INFO.MEMID = "USERID" AND FAVORGENRE_INFO.FAVORGENRE = MOVIE.MVGENRE;
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
    FROM BOOKER_INFO AS BO, MEMBER_INFO AS ME
    WHERE "USERID" = BO.USERID AND BO.USERID = ME.MEMID);

UPDATE BOOKER_INFO
SET ISCLASS = 1
WHERE 
    (SELECT MV.MVCLASS
    FROM BOOKER_INFO AS BO, MVNO AS MV
    WHERE "USERID" = BO.USERID AND BO.MVNO = MV.MVNO)
    <=
    2022 - (SELECT ME.MEMBIRTH
    FROM BOOKER_INFO AS BO, MEMBER_INFO AS ME
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
    FROM BOOKER_INFO AS BO, NONMEMBER_INFO AS NO
    WHERE "USERID" = BO.USERID AND BO.USERID = NO.NONMEMID);

UPDATE BOOKER_INFO
SET ISCLASS = 1
WHERE 
    (SELECT MV.MVCLASS
    FROM BOOKER_INFO AS BO, MVNO AS MV
    WHERE "USERID" = BO.USERID AND BO.MVNO = MV.MVNO)
    <=
    2022 - (SELECT NO.NONMEMBIRTH
    FROM BOOKER_INFO AS BO, NONMEMBER_INFO AS NO
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
DELETE FROM  BOOKSEAT_INFO WHERE BOOKINGNO = "BOOKINGNO";
DELETE FROM  BOOKER_INFO WHERE BOOKINGNO = "BOOKINGNO";
 
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
-- -- 포인트를 소모한다.
INSERT INTO POINT VALUES("POINTNO", 0, "POINTTMP", "MEMID", "PAYNO");

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
-- 결제 완료된 티켓을 조회한다.
SELECT * 
FROM VIEW
WHERE USERID = "USERID";
-- 결제 완료된 예매정보를 취소한다. (예매율 정보 UPDATE)
-- 영수증 정보를 조회한다.