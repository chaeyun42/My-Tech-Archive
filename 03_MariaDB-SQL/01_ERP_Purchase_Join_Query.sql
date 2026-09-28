-- ============================================================================
-- File Name   : 01_ERP_Purchase_Join_Query.sql
-- Description : MariaDB DDL/DML 및 Multi-Table JOIN, GROUP BY 집계 쿼리 실습
-- Purpose     : SAP Open SQL 및 MM 모듈(자재/구매) 데이터 구조 이해
-- ============================================================================

-- 1. 자재 마스터 테이블 생성 (DDL)
CREATE TABLE TB_MATERIAL (
    MATNR VARCHAR(10) PRIMARY KEY, -- 자재 번호 (PK)
    MAKTX VARCHAR(50) NOT NULL,    -- 자재 내역
    PRICE INT DEFAULT 0            -- 단가
);

-- 2. 구매 오더 테이블 생성 (DDL)
CREATE TABLE TB_PURCHASE_ORDER (
    EBELN VARCHAR(10),             -- 구매 오더 번호
    EBELP INT,                     -- 품목 번호
    MATNR VARCHAR(10),             -- 자재 번호 (FK)
    MENGE INT DEFAULT 0,           -- 구매 수량
    BEDAT DATE,                    -- 구매 일자
    PRIMARY KEY (EBELN, EBELP),
    FOREIGN KEY (MATNR) REFERENCES TB_MATERIAL(MATNR)
);

-- 3. 샘플 데이터 삽입 (DML)
INSERT INTO TB_MATERIAL VALUES ('M001', 'RAM 16GB', 80000);
INSERT INTO TB_MATERIAL VALUES ('M002', 'SSD 1TB', 120000);

INSERT INTO TB_PURCHASE_ORDER VALUES ('PO1001', 1, 'M001', 10, '2026-09-01');
INSERT INTO TB_PURCHASE_ORDER VALUES ('PO1001', 2, 'M002', 5, '2026-09-01');
INSERT INTO TB_PURCHASE_ORDER VALUES ('PO1002', 1, 'M001', 20, '2026-09-02');

-- 4. [핵심] 테이블 조인 및 자재별 총 구매 금액 집계 쿼리 (DQL)
SELECT 
    M.MATNR AS 자재코드,
    M.MAKTX AS 자재명,
    SUM(P.MENGE) AS 총구매수량,
    SUM(P.MENGE * M.PRICE) AS 총구매금액
FROM TB_MATERIAL M
INNER JOIN TB_PURCHASE_ORDER P ON M.MATNR = P.MATNR
GROUP BY M.MATNR, M.MAKTX
HAVING SUM(P.MENGE) >= 10
ORDER BY 총구매금액 DESC;
