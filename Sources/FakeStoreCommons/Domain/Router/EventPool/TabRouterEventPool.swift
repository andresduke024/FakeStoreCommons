//
//  TabRouterEventPool.swift
//
//
//  Created by Andres Duque on 13/06/24.
//

import Combine
import SwiftDependencyInjector

public protocol TabRouterEventPool: InjectableDependency {
    var publisher: AnyPublisher<TabRouterEvent, Never> { get }
    
    @MainActor
    func emit(_ event: TabRouterEvent)
}
