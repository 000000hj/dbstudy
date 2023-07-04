--1. 사원테이블에서 FIRST_NAME LAST_NAME 조회하기
SELECT E.FIRST_NAME AS 이름, E.LAST_NAME AS 성
  FROM EMPLOYEES E;
  
  --2. 사원테이블에서 DEPARTMENT_ID의 중복을 제거하고 조회하기
  SELECT DISTINCT DEPARTMENT_ID
    FROM EMPLOYEES;

-- 3 사원테이블에서 EMPLOYEE_ID가 150인 사원의 정보조회하기
SELECT *
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID=150;
 
 --4.사원테이블에서 연봉이 10000이상인 사원의 정보조회하기
 SELECT *
   FROM EMPLOYEES
  WHERE SALARY>=10000;
 
 --5.사원테이블에서 연봉이 10000이상 20000이하인 사원의 정보조회하기
 SELECT *
   FROM EMPLOYEES
  WHERE SALARY>=10000 AND SALARY<=20000;
  
  SELECT *
   FROM EMPLOYEES
  WHERE SALARY BETWEEN 10000 AND 20000;--이상 이하 사잇값에서 추천
 --6.사원테이블에서 부서번호가 30,40,50인 사원의 정보 조회하기
 SELECT*
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID IN(30,40,50);
 --7.사원테이블에서 부섭번호가 없는 사원의 정보 조회하기
 SELECT *
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NULL;
  
--8. 사원테이블에서 커미션을 받는 사원의 정보조회하기
  SELECT *
    FROM EMPLOYEES
   WHERE COMMISSION_PCT IS NOT NULL;
   
  --테이블 전체 조회
   SELECT *FROM EMPLOYEES;
   
--9. 사원테이블에서 전화번호가 515로 시작하는 사원정보조회 
   
   SELECT *
    FROM EMPLOYEES
    WHERE PHONE_NUMBER LIKE '515'||'%';
    
--10. 사원테이블에서 전화번호가 '515'로시작하는 전화번호를 조회(중복제거)

SELECT DISTINCT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515%'; 
 
 SELECT DISTINCT LAST_NAME
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '%King%';
 
 --11. 사원테이블에 사원들을 연봉순으로 조회하기(높은 연봉을 먼저 조회)
    SELECT *
    FROM EMPLOYEES
    ORDER BY SALARY ;--기본정렬 방식은 오름차순. ASC:ASCENDING 의 줄임말
    
    SELECT *
    FROM EMPLOYEES
    ORDER BY SALARY DESC;--DESC :DESCENDING 의 줄임말
    
 --12. 사원테이블에서 사원들을 입사순으로 조회하기
    SELECT *
    FROM EMPLOYEES
    ORDER BY HIRE_DATE ;
    
    
--13. 사원테이블의 사원들을 부서별로 비교할 수있도록 같은 부서의 사원들을 모아서 조회한 뒤 
--같은 부서내의 사원들은 연봉순으로 조회하기
--1차 정렬 기중:부서,오름차순
--2차 정렬 기준: 연봉,내림차순
    SELECT *
      FROM EMPLOYEES
  ORDER BY DEPARTMENT_ID,SALARY DESC;--하나씩 끊어서 해석해야함. 부서아이디는오름차순, 연봉은 내림차순
  
