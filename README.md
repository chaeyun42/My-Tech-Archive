# 🛠️ SAP ERP & Data Analytics Tech Archive

SAP ERP 개발 및 백엔드/데이터 분석(Python, MariaDB, Java) 학습 기록과 프로젝트를 정리하는 공간입니다.

---

## 📌 핵심 역량 요약
- **SAP ABAP:** Open SQL 활용, ALV Grid 데이터 출력, BAPI 연동 로직 구현 및 비즈니스 프로세스 이해
- **Python / AI:** Raw 데이터 전처리(결측치/이상치 제거, Feature Scaling) 및 기초 ML 모델링
- **MariaDB (SQL):** RDBMS 테이블 설계(DDL) 및 Multi-Table JOIN 쿼리 최적화
- **Java:** 객체지향 프로그래밍(OOP) 핵심 구조(상속, Static, Exception) 분석 및 ABAP Objects 개념 적용

---

## 📂 폴더 구조 및 주요 코드

### 1. 📦 `SAP-ABAP`


### 2. 🐍 `Python-Data`
- [`01_Data_Preprocessing.py`](./Python-Data/01_Data_Preprocessing.py): Raw 데이터 전처리 (결측치/이상치 처리, `LabelEncoder`, `StandardScaler` 적용 파이프라인)
- [`02_ML_Classification.py`](./Python-Data/02_ML_Classification.py): Scikit-learn 및 `GradientBoosting` 기반 데이터 분류 및 머신러닝 모델 학습/평가

### 3. 🐬 `MariaDB-SQL`
- [`01_ERP_Purchase_Join_Query.sql`](./03_MariaDB-SQL/01_ERP_Purchase_Join_Query.sql): 자재 마스터 및 구매 오더 CBO 테이블 설계, Multi-Table INNER JOIN 및 데이터 집계 쿼리
- [`02_ERP_Sales_Subquery.sql`](./03_MariaDB-SQL/02_ERP_Sales_Subquery.sql): LEFT JOIN을 통한 미입고 오더 추출 및 서브쿼리(Subquery) + HAVING 기반 조건부 데이터 산출
- [`03_SQL_View_Procedure.sql`](./03_MariaDB-SQL/03_SQL_View_Procedure.sql): 다중 조인 및 업무 로직이 포함된 복잡한 SQL 구문의 VIEW 객체화 및 재사용

### 4. ☕ `Java-Practice`
- [`ERP_Interface_Service.java`](./04_Java-Practice/ERP_Interface_Service.java): Class 상속, Static 초기화 블록, Try-Catch 예외 처리 흐름 분석

### 🐍 `Python_Algorithm`
- Programmers / 백준 알고리즘 코딩테스트 풀이 코드 (`.py`)

---

## 💡 Troubleshooting & Learnings (주요 문제 해결 기록)

### 1. [SAP ABAP] 
- **이슈:**
- **해결:** 

### 2. [Python] 
- **이슈:**
- **해결:**

### 3. [MariaDB] Multi-Table JOIN 시 데이터 누락 방지
- **이슈:** 구매 오더(PO) 테이블과 입고(GR) 실적 테이블 JOIN 시, 미입고 상태인 오더 건이 `INNER JOIN` 조건에 의해 조회 대상에서 누락되는 현상 발생
- **해결:** 기준 테이블(주문 건) 전체를 보존하기 위해 `LEFT JOIN`으로 변경하고, `IFNULL` 함수를 적용하여 미입고 건의 수량을 `0`으로 가공 처리하여 데이터 완전성 확보
