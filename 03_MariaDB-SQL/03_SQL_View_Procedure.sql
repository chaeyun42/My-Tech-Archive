-- ============================================================================
-- File Name   : 03_SQL_View_Procedure.sql
-- Description : 자주 사용하는 조인 및 집계 구문의 VIEW(뷰) 객체화
-- Purpose     : 복잡한 SQL 쿼리 재사용성 확보 및 CBO 데이터 접근 단순화
-- ============================================================================

-- 1. [CREATE VIEW] 자재별 주문 및 입고 현황을 통합 조회하는 뷰 생성
CREATE OR REPLACE VIEW VW_ERP_ORDER_SUMMARY AS
SELECT 
    S.VBELN AS ORDER_NO,
    S.POSNR AS ITEM_NO,
    S.MATNR AS MATERIAL_CODE,
    S.KUNNR AS CUSTOMER_CODE,
    S.KWMENG AS ORDER_QTY,
    S.NETWR AS ORDER_AMOUNT,
    IFNULL(G.GR_QTY, 0) AS PROCESS_QTY,
    CASE 
        WHEN G.MBLNR IS NOT NULL THEN 'COMPLETED'
        ELSE 'PENDING'
    END AS STATUS
FROM TB_SALES_ORDER S
LEFT JOIN TB_GOODS_RECEIPT G 
       ON S.VBELN = G.VBELN AND S.POSNR = G.POSNR;

-- 2. [VIEW 활용] 생성된 뷰를 활용하여 미완료(PENDING) 오더만 간편하게 조회
SELECT 
    ORDER_NO,
    MATERIAL_CODE,
    ORDER_QTY,
    STATUS
FROM VW_ERP_ORDER_SUMMARY
WHERE STATUS = 'PENDING'
ORDER BY ORDER_QTY DESC;
