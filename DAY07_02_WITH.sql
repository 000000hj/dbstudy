/*
    WITH
    1.자주 사용하거나 복잡한 쿼리문 WITH절의 코드 블록을  등록 시켜놓을 수 있다.
    2. WITH 절의 코드 블록은 임시로 저장되기 때문에 곧바로 사용해야 한다.
    3.쿼리문의 가독성이 좋아진다.
*/

--1~10번째로 고용된 사원 조회하기
-- 1) 서브쿼리
SELECT EMPLOYEE_ID
    ,HIRE_DATE
    FROM(SELECT ROW_NUMBER()OVER(ORDER BY HIRE_DATE ASC)AS RN ,EMPLOYEE_ID,HIRE_DATE FROM EMPLOYEES)
    WHERE RN BETWEEN 1 AND 10;
    
--2)WITH
WITH
    MY_SUBQUERY AS (
                SELECT ROW_NUMBER()OVER (ORDER BY HIRE_DATE ASC) AS RN ,EMPLOYEE_ID, HIRE_DATE
                  FROM EMPLOYEES
 )
 SELECT EMPLOYEE_ID ,HIRE_DATE
 FROM MY_SUBQUERY
 WHERE RN BETWEEN 1 AND 10;
 
 --2.부서별 부서번호,부서명, 연봉총액을 조회하기
 SELECT MY.DEPARTMENT_ID
        ,MY.TOTAL_SALARY
        ,D.DEPARTMENT_NAME
        FROM DEPARTMENTS D INNER JOIN ( SELECT DEPARTMENT_ID,SUM(SALARY)AS TOTAL_SALARY
                                        FROM EMPLOYEES  
                                        GROUP BY DEPARTMENT_ID) MY
     ON D.DEPARTMENT_ID =MY.DEPARTMENT_ID;
     
--2)WITH
    WITH MY_SUBQUERY AS(
    SELECT DEPARTMENT_ID, SUM(SALARY)AS TOTAL_SALARY
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
    )
    SELECT MY.DEPARTMENT_ID
    ,D.DEPARTMENT_NAME
    ,MY.TOTAL_SALARY
    FROM DEPARTMENTS D INNER JOIN MY_SUBQUERY MY
    ON D.DEPARTMENT_ID=MY.DEPARTMENT_ID;
    
    