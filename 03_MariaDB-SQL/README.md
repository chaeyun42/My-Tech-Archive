# 🐬 MariaDB SQL & Database Design

SAP ERP 시스템 데이터 구조(모듈) 분석 및 Open SQL 활용 능력 향상을 위한 **MariaDB DDL, DML, Multi-Table JOIN 및 GROUP BY 집계 쿼리 실습** 기록입니다.

---

## 📂 파일 구조
- `01_ERP_Purchase_Join_Query.sql`: 자재 마스터 및 구매 오더 CBO 테이블 설계, Multi-Table INNER JOIN 및 데이터 집계 쿼리 구현 파일

---

## 🔑 구현 핵심 포인트

1. **Relational Database Design (DDL):**
   - 자재 마스터(`TB_MATERIAL`) 및 구매 오더(`TB_PURCHASE_ORDER`) 테이블간 식별자/참조 관계(PK-FK) 정의
   - SAP MM 모듈의 구매 요청-발주 데이터 구조를 RDBMS 기본 규격으로 모델링

2. **Multi-Table JOIN & Data Aggregation (DQL):**
   - `INNER JOIN` 구문을 통한 헤더-품목 테이블간 데이터 매핑
   - `GROUP BY` 및 `HAVING` 절을 활용하여 자재별 총 구매 수량 및 총 구매 금액 집계 쿼리 작성

3. **SAP Open SQL과의 연계성:**
   - ABAP의 `SELECT ... FOR ALL ENTRIES` 및 Open SQL 구문 작성의 기초가 되는 RDBMS 표준 SQL 구문 숙달
