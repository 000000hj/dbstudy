/*
    테이블
    1.데이터베이스에서 데이터를 저장하는 객체이다.
    2.표 형식을 가진다
    3.행(ROW)과 열(COLUMN)의 집합형태이다
*/

/*
    데이터 타입
    1.NUMBER(P,S): 정밀도P, 스케일S 로 표현하는 숫자형식
        1)정밀도 P:전체 유효 숫자의 갯수
        2)스케일 S: 소수부의 유효 숫자의 갯수
    2.CHAR(SIZE): CHARACTER 고정 문자
        1)글자수가 고정된 타입(예시: 전화번호 , 주민번호 등)
        2)size: 최대 2000 byte 
    3.VARCHAR2(SIZE):가변 문자
        1)글자 수가 고정 되지 않은 타입(예시: 이름, 이메일 , 주소 등)
        2)SIZE : 최대 4000 BYTE
    4.CLOB :큰 텍스트 타입
    
    5.DATE: 날짜와 시간을 동시에 표현한는 타입(년,월,일,시,분,초)
    6.TIMESTAMP: 날짜와 시간을 동시에 표현하는 타입(년,월,일,시,분,초,마이크로초(백만분의 1초))
        
*/

/*
    제약조건 5가지
    1.NOT NULL   :필수
    2.UNIQUE     :중복 불가
    3.PRIMARYKEY :기본키
    4.FOREIGNKEY :외래키
    5.CHECK      :값의 제한
*/
DROP TABLE 고객;
CREATE TABLE 고객
(
고객번호    NUMBER NOT NULL PRIMARY KEY,
아이디      VARCHAR2(32 BYTE)NOT NULL UNIQUE,
고객명      VARCHAR2(32 BYTE)NOT NULL,
직업        VARCHAR2(32 BYTE),
휴대폰번호  VARCHAR2(13 BYTE),
주민번호    VARCHAR2(14 BYTE)NULL UNIQUE
);



