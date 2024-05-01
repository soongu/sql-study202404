

SELECT * FROM tb_sal_his;

-- 집계 함수 (다중행 함수)
-- 여러 행을 묶어서 한번에 함수를 적용

SELECT
    COUNT(*) "지급 횟수",
    SUM(pay_amt) "지급 총액",
    AVG(pay_amt) "평균 지급액",
    MAX(pay_amt) "최대 지급액",
    MIN(pay_amt) "최소 지급액"
FROM tb_sal_his
;

SELECT
    SUBSTR(emp_nm, 1, 1)
FROM tb_emp;


SELECT 
    * 
FROM tb_emp;

SELECT 
    COUNT(*) 
FROM tb_emp;

SELECT 
    emp_nm 
FROM tb_emp;

SELECT 
    COUNT(emp_nm) 
FROM tb_emp;

SELECT 
    emp_nm 
FROM tb_emp
WHERE emp_nm LIKE '김%'
;

SELECT 
    COUNT(emp_nm) 
FROM tb_emp
WHERE emp_nm LIKE '김%'
;

SELECT 
    direct_manager_emp_no
FROM tb_emp
;

SELECT 
    COUNT(direct_manager_emp_no)
FROM tb_emp
;

SELECT 
    COUNT(emp_no) "총 사원수",
    MIN(birth_de) "최연장자 생일",
    MAX(birth_de) "최연소자 생일"
FROM tb_emp
;

-- 부서별로 사원수가 몇명인지
-- 부서별로 최연장자의 생일은 언젠지?

-- GROUP BY : 지정된 컬럼으로 소그룹화 한 후
--  각 그룹별로 집계함수를 각각 적용

SELECT 
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT 
    dept_cd, 
    COUNT(*) "부서별 사원수",
    MIN(birth_de) "부서별 최연장자"
FROM tb_emp
GROUP BY dept_cd
;


SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

SELECT 
    emp_no, 
    emp_nm, 
    dept_cd,
  COUNT(*)
FROM tb_emp
;

SELECT 
    emp_no
FROM tb_emp
;

SELECT 
  COUNT(*)
FROM tb_emp
;

-- GROUP BY절에 사용한 컬럼만
-- SELECT에서 직접조회 가능
SELECT 
  emp_no, COUNT(*)
FROM tb_emp
GROUP BY emp_no
;

SELECT 
  dept_cd, sex_cd, COUNT(*), MAX(birth_de)
FROM tb_emp
GROUP BY dept_cd, sex_cd
ORDER BY dept_cd
;

-- 사원별로 2019년에 급여 평균액, 
-- 최소지급액, 최대지급액 조회

-- WHERE : 집계 전 필터링
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

-- HAVING : 집계 후 필터링
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4000000
ORDER BY emp_no
;


-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
-- 그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음.

SELECT 
    dept_cd AS dc,
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*) cnt
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) > 1
ORDER BY dept_cd
;


SELECT
    SUBSTR(emp_nm, 1, 1)
FROM tb_emp
WHERE addr = SUBSTR(addr, 1, 2)
;



-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd ASC, emp_nm DESC
;


SELECT 
    emp_no AS 사번
    , emp_nm AS 이름
    , addr AS 주소
FROM tb_emp
ORDER BY 이름 DESC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, 1 DESC
;


SELECT 
    emp_no
    , emp_nm en
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no DESC
;


SELECT
    emp_nm, 
    direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;




SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- 사원별로 2019년 월평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회
SELECT 
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC
;








