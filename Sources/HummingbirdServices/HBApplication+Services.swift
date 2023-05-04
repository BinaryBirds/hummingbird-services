import Hummingbird

public extension HBApplication {
 
    /// a generic wrapper for the services
    struct Services {
        let app: HBApplication
    }

    /// services instance
    var services: Services { .init(app: self) }
}

public extension HBApplication.Services {
    
    /// returns a service instance if exists
    func get<T>(
        _ keyPath: KeyPath<HBApplication, T>,
        _ error: StaticString? = nil
    ) -> T {
        app.extensions.get(keyPath, error: error)
    }

    /// setup a new service
    func set<T>(
        _ keyPath: KeyPath<HBApplication, T>,
        _ value: T,
        _ callback: ((T) throws -> Void)? = nil
    ) {
        app.extensions.set(
            keyPath,
            value: value,
            shutdownCallback: callback
        )
    }
}
