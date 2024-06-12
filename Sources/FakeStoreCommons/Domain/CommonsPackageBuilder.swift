//
//  CommonsPackageBuilder.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import SwiftDependencyInjector

public struct CommonsPackageBuilder: BasePackageBuilderProtocol {
    
    public init() {}
    
    public func start() {
        let injector = Injector.global
        
        // Router
        injector.register(RouterEventPool.self, implementation: BaseRouterEventPool.instance)
        
        // Repositories
        injector.register(WebServiceRepositoryProtocol.self, implementation: WebServiceRepositoryImpl.instance)
        injector.register(LocalStorageRepositoryProtocol.self, implementation: LocalStorageRepositoryImpl.instance)
        
        // Others
        injector.register(UserDefaults.self) { UserDefaults.standard }
        injector.register(URLSession.self) { URLSession.shared }
    }
}
