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
- `01_Selection_Screen.abap`: PARAMETERS, RADIOBUTTON GROUP 및 SELECTION-SCREEN FRAME 박스 레이아웃 구성
- `02_Toolbar_FunctionKey.abap`: SSCRFIELDS 및 FUNCTION KEY를 활용한 검색 화면 내 사용자 정의 버튼(Excel 다운로드, 샘플 다운로드) 배치
- `03_Frontend_Services_Class.abap`: `CL_GUI_FRONTEND_SERVICES` 클래스 및 메소드(`DIRECTORY_BROWSE`, `GET_TEMP_DIRECTORY`)를 활용한 파일 경로 조회 및 객체 생성 실습

#### 2. 🐍 Python-Data

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

#### 1. [SAP ABAP] 클래스 메소드 호출 시 파라미터 전달 및 오류 디버깅
- **이슈**: `CL_GUI_FRONTEND_SERVICES` 클래스를 활용해 파일/폴더 경로 팝업창을 띄우는 과정에서 최초 경로(`INITIAL_FOLDER`) 전달 값 미설정으로 인한 실행 예외 발생
- **해결**: Breakpoint를 설정하여 디버깅 모드로 진입 후, 메소드로 전달되는 파라미터(`CHANGING`, `EXPORTING`)의 데이터 타입과 초기화 구문을 점검하고, 시스템 변수 동작을 손으로 직접 추적하며 데이터가 정상 전달되도록 수정

#### 2. [MariaDB] Multi-Table JOIN 시 데이터 누락 방지
- **이슈**: 주문 테이블과 실적 테이블 JOIN 시, 미입고 상태인 오더 건이 INNER JOIN 조건에 의해 조회 대상에서 누락되는 현상 분석
- **해결**: 기준 테이블(주문 건) 전체를 보존하기 위해 LEFT JOIN으로 변경하고, `IFNULL` 함수를 적용하여 미입고 건의 수량을 0으로 가공 처리하여 데이터 완전성 확보

#### 3. [Python] Machine Learning 모델 투입 전 데이터 이상치(Outlier) 편향 방지
- **이슈**: 수치형 데이터에 극단적으로 큰 이상치가 포함되어 있어 `StandardScaler` 적용 시 평균과 표준편차가 왜곡되는 문제 발생
- **해결**: 사전에 사분위수 범위(IQR, Interquartile Range)를 산출하여 상한을 초과하는 이상치를 Clipping(상한값 대체) 처리한 후 스케일링을 진행하여 모델 분석 안정성 확보

#### 4. [Java] 0으로 나누기 연산 예외(ArithmeticException) 방어
- **이슈**: 수량 계산 로직 수행 중 단위 수량이 0으로 전달될 경우 `ArithmeticException`이 발생하여 시스템이 비정상 종료될 위험 분석
- **해결**: `try-catch-finally` 예외 처리 블록을 도입하여 예외 발생 시 기본값(Default)을 할당하고, 성공/실패 여부와 무관하게 시스템 로그가 안전하게 남도록 예외 방어 로직 구현
