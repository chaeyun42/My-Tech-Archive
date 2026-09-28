# 🐬 MariaDB SQL & Database Design

SAP ERP 시스템 데이터 구조 분석 및 Open SQL 활용 능력 향상을 위한 **MariaDB DDL, DML, Multi-Table JOIN, Subquery 및 VIEW 활용 실습** 기록입니다.

---

## 📂 파일 구조

- `01_ERP_Purchase_Join_Query.sql`: 자재 마스터 및 구매 오더 CBO 테이블 설계, Multi-Table INNER JOIN 및 데이터 집계 쿼리
- `02_ERP_Sales_Subquery.sql`: LEFT JOIN을 통한 미입고 오더 추출 및 서브쿼리(Subquery) + HAVING 기반 조건부 데이터 산출
- `03_SQL_View_Procedure.sql`: 다중 조인 및 업무 로직이 포함된 복잡한 SQL 구문의 VIEW 객체화 및 재사용

---

## 🔑 구현 핵심 포인트

1. **Relational Database Design (DDL & DML):**
   - 자재 마스터, 구매 오더, 영업 오더, 입고 실적 테이블 간의 PK-FK 관계 정의 및 데이터 무결성 확보

2. **Advanced Data Retrieval (DQL):**
   - `INNER JOIN` / `LEFT JOIN`을 활용한 헤더-품목-실적 테이블 간 데이터 매핑 및 미처리(Pending) 건 검출
   - `GROUP BY`, `HAVING`, 서브쿼리(`Subquery`)를 조합하여 전체 평균값을 상회하는 핵심 자재 집계 분석

3. **Database Object Utilization (VIEW):**
   - 자주 조회되는 복잡한 조인 및 `CASE-WHEN` 로직을 `VIEW`로 재사용 가능하게 모듈화하여 쿼리 가독성 및 유지보수성 향상

4. **SAP Open SQL과의 연계성:**
   - ABAP의 `SELECT ... FOR ALL ENTRIES` 및 Open SQL 조인 구문의 기반이 되는 RDBMS 표준 SQL 기술 구조 정립
   - ABAP의 `SELECT ... FOR ALL ENTRIES` 및 Open SQL 구문 작성의 기초가 되는 RDBMS 표준 SQL 구문 숙달
