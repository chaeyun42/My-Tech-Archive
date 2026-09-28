# 🐍 Python Data Preprocessing & Machine Learning

AI/데이터 분석 파이프라인 구축을 위한 **Data Preprocessing, Feature Engineering 및 Machine Learning 모델링** 학습 기록입니다.

---

## 📂 파일 구조
- `01_Data_Preprocessing.ipynb`: pandas 및 scikit-learn 기반 결측치/이상치 정제 및 StandardScaler 적용 파이프라인
- `02_ML_Classification.ipynb`: GradientBoostingClassifier 기반 ERP 자재 수급/납기 지연 예측 분류 모델 구축 및 evaluation

---

## 🔑 구현 핵심 포인트
1. **Data Cleaning & Scaling:** `pandas` 결측치 처리, IQR 기반 이상치 제거 및 `StandardScaler` 정규화
2. **Supervised Learning (Classification):** `GradientBoosting` 모델을 활용하여 다변량 데이터 기반 이진 분류(Binary Classification) 수행
3. **Model Evaluation:** Accuracy, Precision, Recall, F1-Score 등 분류 성능 지표 분석 및 데이터 파이프라인 모듈화
