# ============================================================================
# File Name   : 02_ML_Classification.ipynb
# Description : Machine Learning Classification Model (GradientBoosting & XGBoost)
# Purpose     : ERP 데이터 기반 자재 납기 지연 및 정상 수급 분류/예측 모델 구축
# ============================================================================

import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

# 1. 가상 ERP 납기/수급 데이터셋 생성
np.random.seed(42)
n_samples = 200

data = {
    'Vendor_Rating': np.random.uniform(1.0, 5.0, n_samples),      # 공급업체 평점
    'Order_Qty': np.random.randint(10, 500, n_samples),            # 주문 수량
    'Lead_Time_Days': np.random.randint(1, 30, n_samples),         # 리드타임(일)
    'Category': np.random.choice(['RAW', 'SUB', 'MAIN'], n_samples), # 자재 카테고리
    'Is_Delayed': np.random.choice([0, 1], n_samples, p=[0.7, 0.3]) # Target: 납기지연 여부 (0: 정상, 1: 지연)
}
df = pd.DataFrame(data)

# 2. 피처 인코딩 및 전처리
encoder = LabelEncoder()
df['Category_Encoded'] = encoder.fit_transform(df['Category'])

X = df[['Vendor_Rating', 'Order_Qty', 'Lead_Time_Days', 'Category_Encoded']]
y = df['Is_Delayed']

# 데이터 분할 (Train / Test)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)

# 피처 스케일링
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# 3. GradientBoostingClassifier 모델 학습 및 평가
model = GradientBoostingClassifier(n_estimators=100, learning_rate=0.1, max_depth=3, random_state=42)
model.fit(X_train_scaled, y_train)

y_pred = model.predict(X_test_scaled)

# 4. 모델 성능 평가 출력
print("=== GradientBoosting Classification Result ===")
print(f"Accuracy: {accuracy_score(y_test, y_pred):.4f}\n")
print("Classification Report:")
print(classification_report(y_test, y_pred))
