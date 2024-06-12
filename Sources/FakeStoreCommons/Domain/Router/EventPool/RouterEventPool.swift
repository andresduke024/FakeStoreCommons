//
//  RouterEventPool.swift
//
//
//  Created by Andres Duque on 4/06/24.
//

import Combine
import SwiftDependencyInjector

public protocol RouterEventPool: InjectableDependency {
    var publisher: PassthroughSubject<RouterEvent, Never> { get }
    
    @MainActor
    func emit(_ event: RouterEvent)
}
