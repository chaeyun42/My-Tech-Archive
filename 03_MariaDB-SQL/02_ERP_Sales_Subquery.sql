-- ============================================================================
-- File Name   : 02_ERP_Sales_Subquery.sql
-- Description : LEFT JOIN, Subquery, HAVING 절을 활용한 미입고 및 우수 주문 추출
-- Purpose     : SAP SD/MM 모듈 연동 및 조건별 세부 데이터 분석 쿼리 작성
-- ============================================================================

-- 1. 영업 주문 테이블 생성 (SD 모듈)
CREATE TABLE TB_SALES_ORDER (
    VBELN VARCHAR(10),             -- 영업 주문 번호
    POSNR INT,                     -- 품목 번호
    MATNR VARCHAR(10),             -- 자재 번호
    KUNNR VARCHAR(10),             -- 고객 번호
    KWMENG INT DEFAULT 0,          -- 주문 수량
    NETWR INT DEFAULT 0,           -- 주문 금액
    PRIMARY KEY (VBELN, POSNR)
);

-- 2. 입고/출고 실적 테이블 생성 (MM 모듈)
CREATE TABLE TB_GOODS_RECEIPT (
    MBLNR VARCHAR(10) PRIMARY KEY, -- 자재 문서 번호
    VBELN VARCHAR(10),             -- 연결된 영업 주문 번호
    POSNR INT,                     -- 연결된 품목 번호
    BUDAT DATE,                    -- 처리 일자
    GR_QTY INT DEFAULT 0           -- 실제 입고/처리 수량
);

-- 3. 샘플 데이터 삽입
INSERT INTO TB_SALES_ORDER VALUES ('SO2001', 1, 'M001', 'C001', 50, 4000000);
INSERT INTO TB_SALES_ORDER VALUES ('SO2001', 2, 'M002', 'C001', 10, 1200000);
INSERT INTO TB_SALES_ORDER VALUES ('SO2002', 1, 'M001', 'C002', 120, 9600000);
INSERT INTO TB_SALES_ORDER VALUES ('SO2003', 1, 'M003', 'C003', 5, 500000);

-- SO2001만 입고 처리됨 (SO2002, SO2003은 미입고 상태)
INSERT INTO TB_GOODS_RECEIPT VALUES ('GR5001', 'SO2001', 1, '2026-09-10', 50);
INSERT INTO TB_GOODS_RECEIPT VALUES ('GR5002', 'SO2001', 2, '2026-09-11', 10);

-- ----------------------------------------------------------------------------
-- [시나리오 A] LEFT JOIN을 활용한 '입고 내역이 없는 미입고 영업 오더' 추출
-- ----------------------------------------------------------------------------
SELECT 
    S.VBELN AS 주문번호,
    S.POSNR AS 품목번호,
    S.MATNR AS 자재코드,
    S.KWMENG AS 주문수량,
    IFNULL(G.GR_QTY, 0) AS 처리수량,
    '미입고(Pending)' AS 진행상태
FROM TB_SALES_ORDER S
LEFT JOIN TB_GOODS_RECEIPT G 
       ON S.VBELN = G.VBELN AND S.POSNR = G.POSNR
WHERE G.MBLNR IS NULL;

-- ----------------------------------------------------------------------------
-- [시나리오 B] 서브쿼리 및 HAVING을 활용한 '전체 평균 주문 수량 초과건' 집계
-- ----------------------------------------------------------------------------
SELECT 
    S.MATNR AS 자재코드,
    SUM(S.KWMENG) AS 총주문수량,
    AVG(S.KWMENG) AS 평균주문수량
FROM TB_SALES_ORDER S
GROUP BY S.MATNR
HAVING SUM(S.KWMENG) > (
    -- [Subquery] 전체 영업 주문의 평균 주문 수량 산출
    SELECT AVG(KWMENG) FROM TB_SALES_ORDER
);
