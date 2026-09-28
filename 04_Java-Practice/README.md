# ☕ Java OOP Architecture & Exception Handling

SAP ERP 시스템 연동 및 백엔드 데이터 처리에 필요한 **Java 객체지향(OOP) 구조와 예외 처리 패러다임**을 구현한 코드입니다.

## 📂 파일 구조
- `ERP_Interface_Service.java`: 객체지향 설계(상속, 다형성, 오버라이딩) 및 Exception Handling 구현 파일

## 🔑 구현 핵심 포인트
1. **Inheritance & Polymorphism:** `BaseErpService` 부모 클래스를 정의하고, 이를 상속받은 `MaterialManagementService` 객체를 다형성 개념으로 제어
2. **Method Overriding:** 부모의 기본 트랜잭션 로직을 MM 모듈의 입고(GR) 비즈니스 로직에 맞춰 재정의
3. **Robust Exception Handling:** 트랜잭션 수행 중 연산 오류(`ArithmeticException`) 발생 시, 시스템 튕김 현상을 방지하는 `try-catch-finally` 안전 구조 구축
4. **ABAP Objects 연계:** Java의 OOP 구조 이해를 통해 SAP ABAP Objects(Class, Method, Exception) 설계 패턴에 적용
