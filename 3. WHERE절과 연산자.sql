

-- WHERE 조건절
-- 조회 행을 제한
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2
;

-- PK로 필터링하면 무조건 1건 이하가 조회됨
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE emp_no = 1000000003
;


-- 비교 연산자
SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd != 2
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd <> 2
;

SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE birth_de >= '19800101'
    AND birth_de <= '19891231'
;


SELECT 
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE NOT birth_de >= '19800101'
;


-- BETWEEN 연산자
SELECT 
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

SELECT 
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;

-- IN 연산 : OR 연산
SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = 100002
    OR dept_cd = 100007
;

SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (100002, 100007, 100008)
;

SELECT 
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd NOT IN (100002, 100007, 100008)
;


-- LIKE 
-- 검색에서 사용
-- 와일드카드 매핑 (%: 0글자 이상, _: 딱 1글자 )

SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE addr LIKE '%용인%'
;

SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '이%'
;
SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '이_'
;

SELECT 
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '%심'
;

SELECT 
    email
FROM user
WHERE email LIKE '_A%@%'; -- banana@gmail.com

-- 성씨가 김씨이면서
-- 부서가 100003, 100004 중에 하나면서
-- 90년대생인 사원의 
-- 사번, 이름, 생일, 부서코드를  조회
SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
WHERE 1=1
    AND emp_nm LIKE '김%'
    AND dept_cd IN (100003, 100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;
   

-- NULL값 조회 
-- 반드시 IS NULL로 조회할 것!
SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL
;

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;


-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%'
    OR ADDR LIKE '%일산%')
;
-- 1 AND (2 OR 3)






