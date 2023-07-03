DROP TABLE LECTURE_TBL;
DROP TABLE ENROLL_TBL;
DROP TABLE STUDENT_TBL;
DROP TABLE COURSE_TBL;
DROP TABLE PROFESSOR_TBL;


 CREATE TABLE PROFESSOR_TBL--교수
    (
    PROF_NO         NUMBER NOT NULL,--교수번호,PK
    PROF_NAME       VARCHAR2(20 BYTE), --교수이름
    PROF_MAJOR      VARCHAR2(100 BYTE)--교수전공
    ,CONSTRAINT PK_PROF_NO PRIMARY KEY(PROF_NO)
    );
    
     CREATE TABLE COURSE_TBL--과목
    (
     COURSE_NO      NUMBER NOT NULL, -- 과목번호,PK
     COURSE_NAME    VARCHAR2(50 BYTE),--과목명
     CREDIT         NUMBER , -- 이수학점
     
     CONSTRAINT PK_COURSE_NO PRIMARY KEY(COURSE_NO)
    );
CREATE TABLE STUDENT_TBL--학생
    (
    STU_NO          NUMBER NOT NULL ,--학번,PK
    STU_NAME        VARCHAR2(100 BYTE) NOT NULL,--이름
    STU_ADDRESS     NUMBER,--주소
    STU_GRADE       NUMBER NOT NULL,--학년
    STU_PROF_NO     NUMBER  UNIQUE NOT NULL ,--담당교수번호,FK
    CONSTRAINT PK_STU_NO PRIMARY KEY(STU_NO),
    CONSTRAINT FK_STU_PROF_NO FOREIGN KEY(STU_PROF_NO) REFERENCES PROFESSOR_TBL(PROF_NO)
    );
    

    
CREATE TABLE ENROLL_TBL --시퀀스로-수강신청
    (
    ENROLL_NO       NUMBER,--수강신청번호,PK
    STU_NO          NUMBER ,--학번,FK(STUDENT_TBL)
    COURSE_NO       NUMBER,--과목번호,FK(COURSE_TBL)
    APLICATION_NO   DATE--신청일자
    ,CONSTRAINT PK_ENROLL_NO PRIMARY KEY(ENROLL_NO)
    ,CONSTRAINT FK_STU_NO    FOREIGN KEY (STU_NO)   REFERENCES STUDENT_TBL(STU_NO)
    ,CONSTRAINT FK_COURSE_NO FOREIGN KEY(COURSE_NO) REFERENCES COURSE_TBL
    );
    

    
CREATE TABLE LECTURE_TBL --시퀀스로- 강의
    (
    CLASS_NO        NUMBER,--강의번호,PK
    PROF_NO         NUMBER ,--교수번호,FK(PROFESSOR_TBL)
    ENROLL_NO       NUMBER,--수강신청번호,FK(ENROLL_TBL)
    CLASS_NAME      VARCHAR2(100 BYTE),--강의이름
    CLASSROOM       VARCHAR2(30 BYTE)--강의실
    ,CONSTRAINT PK_CLASS_NO     PRIMARY KEY(CLASS_NO)
    ,CONSTRAINT FK_PROF_NO      FOREIGN KEY(PROF_NO)   REFERENCES PROFESSOR_TBL ON DELETE SET NULL
    ,CONSTRAINT FK_ENROLL_NO    FOREIGN KEY(ENROLL_NO) REFERENCES ENROLL_TBL
    );
    
    DROP    SEQUENCE CLASS_NO_SEQ;
    DROP    SEQUENCE ENROLL_SEQ;
   
    CREATE  SEQUENCE ENROLL_SEQ
    START WITH 1000 ORDER; 
    
    CREATE  SEQUENCE CLASS_NO_SEQ
    START WITH 1000 ORDER;
    
--교수    
    INSERT INTO PROFESSOR_TBL(PROF_NO,PROF_NAME,PROF_MAJOR)VALUES(00001,'박교수','이산치수학');
    INSERT INTO PROFESSOR_TBL(PROF_NO,PROF_NAME,PROF_MAJOR)VALUES(00002,'김교수','디지털공학개론');   
    INSERT INTO PROFESSOR_TBL(PROF_NO,PROF_NAME,PROF_MAJOR)VALUES(00003,'이교수','그래픽스');   
--학생
    INSERT INTO STUDENT_TBL( STU_NO,STU_NAME,STU_ADDRESS,STU_GRADE,STU_PROF_NO)VALUES(000,'김김김',00000,1,00001) ;
    INSERT INTO STUDENT_TBL( STU_NO,STU_NAME,STU_ADDRESS,STU_GRADE,STU_PROF_NO)VALUES(111,'박박박',11111,2,00002) ;
    INSERT INTO STUDENT_TBL( STU_NO,STU_NAME,STU_ADDRESS,STU_GRADE,STU_PROF_NO)VALUES(222,'이이이',22222,3,00003) ;
--과목
     INSERT INTO COURSE_TBL(COURSE_NO,COURSE_NAME,CREDIT)VALUES(000,'이산치수학',3);
     INSERT INTO COURSE_TBL(COURSE_NO,COURSE_NAME,CREDIT)VALUES(111,'디지털공학개론',3);
     INSERT INTO COURSE_TBL(COURSE_NO,COURSE_NAME,CREDIT)VALUES(222,'그래픽스',3);
--수강신청
    INSERT INTO ENROLL_TBL( ENROLL_NO,STU_NO, COURSE_NO, APLICATION_NO )VALUES(ENROLL_SEQ.NEXTVAL,000,222,'2023/07/03');  
    INSERT INTO ENROLL_TBL( ENROLL_NO,STU_NO, COURSE_NO, APLICATION_NO )VALUES(ENROLL_SEQ.NEXTVAL,111,222,'2023/07/03');  
    INSERT INTO ENROLL_TBL( ENROLL_NO,STU_NO, COURSE_NO, APLICATION_NO )VALUES(ENROLL_SEQ.NEXTVAL,222,000,'2023/07/03');  
  
--강의
    INSERT INTO LECTURE_TBL( CLASS_NO ,PROF_NO,ENROLL_NO,CLASS_NAME,CLASSROOM)VALUES(CLASS_NO_SEQ.NEXTVAL,00001,1000,'이산치수학','101호');      
    INSERT INTO LECTURE_TBL( CLASS_NO ,PROF_NO,ENROLL_NO,CLASS_NAME,CLASSROOM)VALUES(CLASS_NO_SEQ.NEXTVAL,00002,1001,'디지털공학개론','102호');  
    INSERT INTO LECTURE_TBL( CLASS_NO ,PROF_NO,ENROLL_NO,CLASS_NAME,CLASSROOM)VALUES(CLASS_NO_SEQ.NEXTVAL,00003,1002,'그래픽스','103호');  
    /*있는값만 넣을 수 있다*/
    
    