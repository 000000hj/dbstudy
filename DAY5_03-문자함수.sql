--1.대소문자 변환하기
SELECT UPPER(EMAIL)--대문자
        ,LOWER(EMAIL)--소문자
        ,INITCAP(EMAIL)--첫글자만 대문자
        FROM EMPLOYEES;
--2. 글자 수
SELECT FIRST_NAME
    ,LENGTH(FIRST_NAME)
    FROM EMPLOYEES;

--3.바이트 수
SELECT FIRST_NAME
    ,LENGTHB(FIRST_NAME)
    FROM EMPLOYEES;
    
--4.연결하기
--1)||연산자(오라클 전용이므로 다른 DB에서는 오류가 난다)
--2)CONCAT함수 
-- CONCAT(A,B):인수를 2개만 전달 할 수 있다
--CONCAT(CONCAT(A,B),C):인수 3개 이상은 CONCAT 여러개로 해결

SELECT *
 FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE CONCAT('515' , '%');
 
 SELECT *
 FROM EMPLOYEES 
 WHERE EMAIL LIKE CONCAT(CONCAT('%','A'),'%');--A를 포함('%'||'A'||'%')
 
 --5.일부만 반환하기
 SELECT SUBSTR(PHONE_NUMBER ,1,3)  --전화번호 1번째 글자부터 3글자를 반환
 ,SUBSTR(PHONE_NUMBER ,1)
 FROM EMPLOYEES;
 
--6.특정 문자의 위치 반환하기
--  문자의 위치는 1부터 시작한다 ,
--못 찾으면 0을 반환한다.
SELECT EMAIL, 
INSTR(EMAIL,'A')
FROM EMPLOYEES;

--7.바꾸기 
SELECT EMAIL
    ,REPLACE(EMAIL, 'A','$')--모든 A를 찾아서 $로 바꾸기
    FROM EMPLOYEES;
    
--8. 채우기
-- 1)LPAD(표현식, 전체폭, 채울문자)
-- 2)RPAD(표현식, 전체폭, 채울문자)
SELECT DEPARTMENT_ID
    ,LPAD(DEPARTMENT_ID,3,0)
    ,EMAIL
    ,RPAD(SUBSTR(EMAIL,1,2),5,'*')--마스킹 할때 사용
    FROM EMPLOYEES;
    
--9.공백 제거
SELECT '[' || LTRIM('     HELLO     WORLD     ') || ']'--왼 공백 제거
      ,'[' || RTRIM('     HELLO     WORLD     ') || ']'--오른 공백 제거
      ,'[' || TRIM('     HELLO     WORLD     ') || ']'--양 공백 제거
      FROM DUAL;
      
--실습
--1. 사원 테이블의 JOB_ID 에서 밑줄(_) 앞/뒷 부분만 조회하기
--예시) IT_PROG  -> IT/ PROG

SELECT JOB_ID
,SUBSTR(JOB_ID ,1,INSTR(JOB_ID,'_')-1)
,SUBSTR(JOB_ID ,INSTR(JOB_ID,'_')+1,LENGTHB(JOB_ID))
FROM EMPLOYEES;

--해답
SELECT JOB_ID
,SUBSTR(JOB_ID ,1,INSTR(JOB_ID,'_')-1)
,SUBSTR(JOB_ID ,INSTR(JOB_ID,'_')+1,LENGTHB(JOB_ID)-INSTR(JOB_ID,'_'))
FROM EMPLOYEES;

SELECT JOB_ID
,SUBSTR(JOB_ID ,1,INSTR(JOB_ID,'_')-1)
,SUBSTR(JOB_ID ,INSTR(JOB_ID,'_')+1)
FROM EMPLOYEES;

--이름마스킹 연습 해보기 FIRSTNAME-LASTNAME으로 구별해서 마스킹. 외국 이름때문에

--2.FIRST_NAME과 LAST_NAME 을 연결해서 모두 대문자로 바꾼 FULL_NAME 조회하기
SELECT  CONCAT(UPPER(FIRST_NAME),CONCAT(' ',UPPER(LAST_NAME)))
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

--해답
SELECT UPPER(CONCAT(CONCAT(FIRST_NAME,' '),LAST_NAME))
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;


/*
*/