# 📦 SAP ABAP Core & Practice Archive
SAP ERP 커스텀 프로그램 및 OLE 엑셀 연동, ALV 그리드 제어 실습 기록입니다.

## 📁 파일 구조

* **`01_Selection_Screen.abap`** : PARAMETERS, RADIOBUTTON GROUP 및 SELECTION-SCREEN FRAME 박스 레이아웃 구성
* **`02_Toolbar_FunctionKey.abap`** : SSCRFIELDS 및 FUNCTION KEY를 활용한 검색 화면 내 사용자 정의 버튼(Excel 다운로드, 샘플 다운로드) 배치
* **`03_Frontend_Services_Class.abap`** : CL_GUI_FRONTEND_SERVICES 클래스 및 메소드(DIRECTORY_BROWSE, GET_TEMP_DIRECTORY)를 활용한 파일 경로 조회 및 객체 생성 실습

## 🔑 구현 핵심 포인트

1. **Selection Screen Layout**: 사용자 편의를 고려한 프레임 박스 및 라디오 버튼 그룹 설계
2. **Interactive Toolbar**: SSCRFIELDS를 통한 커스텀 펑션키 이벤트 핸들링 및 엑셀 다운로드 연계
3. **Frontend Automation**: GUI 서비스 클래스를 통한 로컬 파일 시스템 경로 탐색 및 예외 처리 구현
