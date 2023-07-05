# HummingbirdServices

A simple library that provides a basic service layer for Hummingbird on top of app extensions.

## Install

Add the repository as a dependency:

```swift
.package(url: "https://github.com/binarybirds/hummingbird-services", from: "1.0.0"),
```

Add `HummingbirdServices` to the target dependencies:

```swift
.product(name: "HummingbirdServices", package: "hummingbird-services"),
```

Update the packages and you are ready.

## Usage example 

```swift
import Hummingbird
import HummingbirdServices

/// test service
final class TestService {
    var status = "ready"
}

/// test service extension
extension HBApplication.Services {
    
    var test: TestService {
        get {
            get(\.services.test)
        }
        nonmutating set {
            set(\.services.test, newValue) { _ in }
        }
    }
}

/// app shortcut for the test service
public extension HBApplication {

    /// test service reference
    var test: TestService {
        services.test
    }
}

/// req shortcut for the test service
public extension HBRequest {

    /// test service reference
    var test: TestService {
        application.services.tests
    }
}

/// initiate the service
app.services.test = TestService()

/// use the test service
print(app.test.status)
print(req.test.status)
```
