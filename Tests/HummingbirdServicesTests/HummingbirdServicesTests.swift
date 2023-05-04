import XCTest
import Hummingbird
import HummingbirdServices

final class TestService {
    var status = "running"
}

extension HBApplication.Services {
    
    var test: TestService {
        get {
            get(\.services.test)
        }
        nonmutating set {
            set(\.services.test, newValue) { service in
                service.status = "done"
            }
        }
    }
}

final class HummingbirdServicesTestCase: XCTestCase {
    
    func testServices() throws {
        let service = TestService()
        let app = HBApplication()
        app.services.test = service
        try app.shutdownApplication()
        XCTAssertEqual(service.status, "done")
    }
}
