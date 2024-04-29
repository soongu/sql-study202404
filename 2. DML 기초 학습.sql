CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    reg_date DATE
);

-- INSERT
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (1, '선풍기', 120000, SYSDATE);
    
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES 
    (2, '세탁기', 2000000, SYSDATE);    
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES 
    (3, '달고나', SYSDATE);   
    
INSERT INTO goods
    (id, goods_name)
VALUES 
    (4, '계란');  
    
INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES 
    ('점퍼', 5, SYSDATE, '49000');  

-- 컬럼명 생략시 테이블구조 순서대로 자동 기입
INSERT INTO goods
    
VALUES 
    (6, '냉장고', 1000000, SYSDATE); 
    
  



-- UPDATE

UPDATE goods
SET goods_name = '에어컨'
WHERE id = 1
;

UPDATE goods
SET price = 9999;

UPDATE tbl_user
SET age = age + 1;

UPDATE goods
SET id = 11
WHERE id = 4;

UPDATE goods
SET goods_name = null
WHERE id = 3;

UPDATE goods
SET price = null
WHERE id = 3;

UPDATE goods
SET goods_name = '청바지', 
    price = 299000
WHERE id = 3;

-- DELETE

DELETE FROM goods
WHERE id = 11;

-- 조건 없이 delete하면 전체삭제됨
-- 다만 이 문법은 복구가 가능함
DELETE FROM goods;
TRUNCATE TABLE goods; -- 복구 불가
DROP TABLE goods;



SELECT * FROM goods;  

-- SELECT 기본
SELECT 
   certi_cd, 
   certi_nm, 
   issue_insti_nm 
FROM tb_certi;

SELECT 
   certi_nm, 
   certi_cd,
   issue_insti_nm 
FROM tb_certi;

SELECT ALL
   certi_nm, 
   issue_insti_nm 
FROM tb_certi;

-- 중복 제거
SELECT DISTINCT
   issue_insti_nm 
FROM tb_certi;

-- 모든 컬럼 조회
SELECT 
    * 
FROM tb_certi
;

-- 열 별칭 부여
SELECT 
    emp_nm AS "사원명",
    addr AS "주소"
FROM tb_emp
;

SELECT 
    emp_nm 사원명,
    addr "거주지 주소"
FROM tb_emp
;

-- 문자열 결합하기
SELECT
    '자격증: ' || certi_nm AS "자격증 정보"
FROM tb_certi;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "자격증"
FROM tb_certi;













    