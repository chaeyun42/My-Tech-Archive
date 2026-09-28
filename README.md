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
---
## 💡 Troubleshooting & Learnings (주요 문제 해결 기록)

### 1. [MariaDB] Multi-Table JOIN 시 데이터 누락 방지
- **이슈:** 구매 오더(PO) 테이블과 입고(GR) 실적 테이블 JOIN 시, 미입고 상태인 오더 건이 `INNER JOIN` 조건에 의해 조회 대상에서 누락되는 현상 발생
- **해결:** 기준 테이블(주문 건) 전체를 보존하기 위해 `LEFT JOIN`으로 변경하고, `IFNULL` 함수를 적용하여 미입고 건의 수량을 `0`으로 가공 처리하여 데이터 완전성 확보

### 2. [Java] 0으로 나누기 연산 예외(ArithmeticException) 방어
- **이슈:** ERP 자재 입고 수량 계산 로직 수행 중 단위 포장 수량이 0으로 전달될 경우 `ArithmeticException`이 발생하여 시스템 전체 비정상 종료 위험 존재
- **해결:** `try-catch-finally` 예외 처리 블록을 도입하여 예외 발생 시 기본값(Default)을 할당하고, 성공/실패 여부와 무관하게 트랜잭션 로그가 항상 안전하게 남도록 자원 정리 및 로그 로직 보장

### 3. [Python] Machine Learning 모델 투입 전 데이터 이상치(Outlier) 편향 방지
- **이슈:** ERP 자재 단가 데이터에 극단적으로 큰 이상치가 포함되어 있어 `StandardScaler` 적용 시 평균과 표준편차가 distorted(왜곡)되는 문제 발생
- **해결:** 사전에 사분위수 범위(IQR, Interquartile Range)를 산출하여 상한을 초과하는 이상치를 Clipping(상한값 대체) 처리한 후 스케일링을 진행하여 모델 예측 안정성 확보

### 4. [SAP ABAP] ALV Grid 출력 시 대용량 데이터 성능 저하 방지
- **이슈:** 반복문(LOOP) 내에서 DB를 직접 조회하는 `SELECT` 구문 사용 시 데이터베이스 I/O 병목으로 인한 Performance 저하 우려
- **해결:** `FOR ALL ENTRIES IN` 구문 및 Internal Table 기반 데이터 매핑 구조를 적용하여 DB 접근 횟수를 최소화하고 데이터 처리 속도 최적화
