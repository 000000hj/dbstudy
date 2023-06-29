--한줄 주석
/*
여러줄 주석
*/

/*
    1.관리자 계정은 SYS, SYSTEM  계정이다
    2. 관리자 계정으로 접속해서 수업에서 사용할 새로운 계정을 만듦
    3. 관리자 계정으로 작업 NO
*/

/*
    새로운 계정 만드는 법
    1.CREATE USER 계정명 IDENTIFIED BY 비번;
    2.GRANT 권한 TO 계정명;
*/


/*
    SQL DEVELOPER 쿼리문 실행법
    1.커서를 두고 CTRL + ENTER : 커서가 있는 쿼리문만 실행됨
    2.블록을 잡고 CTRL + ENTER : 블록이 잡힌 모든 쿼리문이 실행된다.
    3.그냥 F5                  :전체 스크립트가 실행된다.
*/
--CREATE USER C##GD IDENTIFIED BY 1111;
--GRANT CONNECT TO C##GD;

/*
    기존계정 삭제하는 방법
    1.계정이 가진 데이터가 없을 때 :DROP USER 계정명;
    2.계정이 가진 데이터가 있을 때 :DRO  USER 계정명 CASCADE ;
*/
--DROP USER C##GD;

/*
(')홑따옴표 : 문자열을 감싸주는 기호 ('문자열')
(")쌍따옴표 : 컬럼명 등을 감싸주는 기호 ("사용자명"."테이블명"."컬럼명")
*/

--새로운 계정을 만드는 전체 스크립트
ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;
DROP USER GD CASCADE;
CREATE USER GD IDENTIFIED BY 1111;
GRANT DBA TO GD;
