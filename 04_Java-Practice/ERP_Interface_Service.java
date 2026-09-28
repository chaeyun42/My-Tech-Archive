* ============================================================================
 * File Name   : ERP_Interface_Service.java
 * Description : Object-Oriented Programming (OOP) & Exception Handling Pattern
 * Role        : 외부 시스템 연동 및 ERP 데이터 처리 인터페이스 구조 설계
* ============================================================================

// 1. 부모 클래스: 공통 ERP 트랜잭션 서비스
//앞으로 어떤 ERP 연동 작업을 하든, 기본적으로 시스템 관문(Gateway)이 열려야 하고 어떤 서비스인지 이름표를 달아야 한다는 공통 규격
class BaseErpService {
    // Static 블록: 클래스 로딩 시 시스템 설정 초기화
    static {
        System.out.println("[System] SAP Interface Gateway Initialized.");
    }

    protected String serviceName;

    public BaseErpService(String serviceName) {
        this.serviceName = serviceName;
    }

    // 공통 실행 메서드
    public void executeTransaction() {
        System.out.println("[Transaction] Starting Base ERP Processing for: " + this.serviceName);
    }
}

// 2. 자식 클래스: MM(자재관리) 전용 서비스 (상속 및 오버라이딩)
class MaterialManagementService extends BaseErpService {

    public MaterialManagementService() {
        // 부모 생성자를 호출하여 해당 모듈의 서비스 명칭 초기화
        super("MM Module - Goods Receipt Service"); 
    }

    // 메서드 오버라이딩: 자재 입고 처리 로직 재정의
    @Override
    public void executeTransaction() {
        super.executeTransaction(); // 부모의 공통 프로세스 우선 실행
        System.out.println("[MM Service] Processing Material Movement Data..."); // 자재 전용 작업 추가

        // 예외 처리(Try-Catch): 데이터 연산/검증 중 예외 상황 방어 로직
        try {
            int receivedQuantity = 500;
            int totalPackageCount = 0; // 검증 실패 시뮬레이션 (0으로 나누기 예외)

            System.out.println("[MM Service] Calculating average quantity per package...");
            int unitPerPackage = receivedQuantity / totalPackageCount;  
            System.out.println("Unit per package: " + unitPerPackage);

        } catch (ArithmeticException e) {
            // 예외 발생 시 시스템 다운을 막고 안전하게 로그 처리
            System.err.println("[Exception Caught] Package count invalid (Division by zero). Defaulting to 1.");
        } finally {
            // 성공/실패 여부와 무관하게 트랜잭션 로그 기록 및 자원 정리 보장
            System.out.println("[MM Service] Transaction log successfully saved.");
        }
    }
}

// 3. 메인 실행 클래스
public class ERP_Interface_Service {
    public static void main(String[] args) {
        // Polymorphism(다형성) 적용하여 서비스 객체 생성 및 실행
        BaseErpService mmService = new MaterialManagementService();
        mmService.executeTransaction();
    }
}
