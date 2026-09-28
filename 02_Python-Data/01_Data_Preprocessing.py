# ============================================================================
# File Name   : 01_Data_Preprocessing.ipynb
# Description : Raw Data Preprocessing & Feature Scaling Workflow
# Purpose     : AI/ML 모델링을 위한 결측치 처리, 이상치 제거 및 스케일링 실습
# ============================================================================

import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler, LabelEncoder

# 1. 가상 ERP 데이터셋 생성 (결측치 및 이상치 포함)
data = {
    'Material_ID': ['M01', 'M02', 'M03', 'M04', 'M05'],
    'Category': ['Electronics', 'Mechanical', 'Electronics', np.nan, 'Mechanical'],
    'UnitPrice': [100, 150, 200, 5000, 120],  # 5000: 이상치(Outlier) 시뮬레이션
    'StockQty': [50, np.nan, 30, 20, 10]      # np.nan: 결측치 시뮬레이션
}
df = pd.DataFrame(data)

# 2. 결측치(Null) 처리
# Category의 결측치는 최다 빈도값으로 대체, StockQty의 결측치는 중앙값(Median)으로 채움
df['Category'] = df['Category'].fillna(df['Category'].mode()[0])
df['StockQty'] = df['StockQty'].fillna(df['StockQty'].median())

# 3. 이상치(Outlier) 제거 (IQR 방식)
Q1 = df['UnitPrice'].quantile(0.25)
Q3 = df['UnitPrice'].quantile(0.75)
IQR = Q3 - Q1
upper_bound = Q3 + 1.5 * IQR

# 이상치를 상한값으로 대체 (Clipping)
df['UnitPrice'] = np.where(df['UnitPrice'] > upper_bound, upper_bound, df['UnitPrice'])

# 4. 범주형 데이터 인코딩 (LabelEncoding)
encoder = LabelEncoder()
df['Category_Encoded'] = encoder.fit_transform(df['Category'])

# 5. 수치형 데이터 스케일링 (StandardScaler)
scaler = StandardScaler()
df[['UnitPrice_Scaled', 'StockQty_Scaled']] = scaler.fit_transform(df[['UnitPrice', 'StockQty']])

print("=== Preprocessing Completed ===")
print(df)
