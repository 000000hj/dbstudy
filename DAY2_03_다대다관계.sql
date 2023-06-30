/*
    M:N관계 
        1. 현실세계에서 빈번히 나타나지만 주의해야하는 관계이다.
        2.M:N관계를 가진 2개의 테이블은 직접 관계를 맺는 것이 불가능하다.
        3.관계를 맺기 위해서 별도의 테이블이 추가로 필요하다
        4.M:N관계는 1:M 관계 2개로 구현할 수 있다.
*/

DROP TABLE ENROLL_T;
DROP TABLE SUBJECT_T;
DROP TABLE STUDENT_T ;


CREATE TABLE STUDENT_T
    (
    학번 NUMBER  NOT NULL PRIMARY KEY,
    성명 VARCHAR2(32 BYTE)NOT NULL,
    나이 NUMBER  NOT NULL
    );

CREATE TABLE SUBJECT_T
    (
    과목코드 VARCHAR2(4 BYTE) NOT NULL PRIMARY KEY,
    과목명   VARCHAR2(32 BYTE)NOT NULL UNIQUE,
    교수명   VARCHAR2(32 BYTE)NOT NULL
   
    );
    
CREATE TABLE ENROLL_T
    (
    신청번호 NUMBER UNIQUE NOT NULL,
    학번     NUMBER REFERENCES STUDENT_T(학번),
    과목코드 VARCHAR2(4 BYTE)  REFERENCES SUBJECT_T(과목코드)
    );