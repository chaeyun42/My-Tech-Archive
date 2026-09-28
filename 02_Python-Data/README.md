# 🐍 Python Data Preprocessing & Machine Learning

AI/데이터 분석 파이프라인 구축을 위한 **Data Preprocessing, Feature Engineering 및 Machine Learning 모델링** 학습 기록입니다.

---

## 📂 파일 구조
- `01_Data_Preprocessing.ipynb`: pandas 및 scikit-learn 기반 결측치/이상치 정제 및 StandardScaler 적용 파이프라인
- `02_ML_Classification.ipynb`: GradientBoosting/XGBoost 알고리즘을 활용한 데이터 분류 모델 구축 및 평가

---

## 🔑 구현 핵심 포인트
1. **Data Cleaning:** `pandas`를 활용한 결측치(Imputation) 처리 및 IQR 기법 기반 이상치(Outlier) 탐지/제거
2. **Feature Engineering:** `LabelEncoder`를 통한 범주형 변수 변환 및 `StandardScaler` 기반 수치형 데이터 정규화
3. **Data Pipeline Optimization:** Raw 데이터를 Machine Learning 모델 투입 가능 형태로 변환하는 전과정 모듈화
