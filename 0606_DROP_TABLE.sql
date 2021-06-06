-- SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

-- 전체 TABLE 삭제
DROP TABLE "MOVIE" CASCADE CONSTRAINTS;
DROP TABLE "MOVIESCHEDULE_INFO" CASCADE CONSTRAINTS;
DROP TABLE "MOVIE_INFO" CASCADE CONSTRAINTS;
DROP TABLE "ACTOR_INFO" CASCADE CONSTRAINTS;
DROP TABLE "VERIFICATION" CASCADE CONSTRAINTS;
DROP TABLE "USERS" CASCADE CONSTRAINTS;
DROP TABLE "NONMEMBERS_INFO" CASCADE CONSTRAINTS;
DROP TABLE "MEMBERS_INFO" CASCADE CONSTRAINTS;
DROP TABLE "FAVORGENRE_INFO" CASCADE CONSTRAINTS;
DROP TABLE "MANAGERS_INFO" CASCADE CONSTRAINTS;
DROP TABLE "LOCAL" CASCADE CONSTRAINTS;
DROP TABLE "CINEMA" CASCADE CONSTRAINTS;
DROP TABLE "SCREENWAY" CASCADE CONSTRAINTS;
DROP TABLE "THEATER" CASCADE CONSTRAINTS;
DROP TABLE "SCHEDULE" CASCADE CONSTRAINTS;
DROP TABLE "SEAT" CASCADE CONSTRAINTS;
DROP TABLE "MOVIEGOERS" CASCADE CONSTRAINTS;
DROP TABLE "BOOKING" CASCADE CONSTRAINTS;
DROP TABLE "BOOKSEAT_INFO" CASCADE CONSTRAINTS;
DROP TABLE "BOOKER_INFO" CASCADE CONSTRAINTS;
DROP TABLE "PAYWAY" CASCADE CONSTRAINTS;
DROP TABLE "CREDITCARD_INFO" CASCADE CONSTRAINTS;
DROP TABLE "DEPOSIT_INFO" CASCADE CONSTRAINTS;
DROP TABLE "ONLINEPAY_INFO" CASCADE CONSTRAINTS;
DROP TABLE "PAYING" CASCADE CONSTRAINTS;
DROP TABLE "PAYLIST_INFO" CASCADE CONSTRAINTS;
DROP TABLE "POINT" CASCADE CONSTRAINTS;
DROP TABLE "POINTLIST_INFO" CASCADE CONSTRAINTS;
DROP VIEW RECEIPT;
DROP VIEW TICKET;