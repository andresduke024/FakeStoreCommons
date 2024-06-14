//
//  BaseTabRouterEventPool.swift
//  
//
//  Created by Andres Duque on 13/06/24.
//

import Combine

open class BaseTabRouterEventPool: TabRouterEventPool {
    
    private let eventPool = PassthroughSubject<TabRouterEvent, Never>()
    
    public var publisher: AnyPublisher<TabRouterEvent, Never> { eventPool.eraseToAnyPublisher() }
    
    required public init() {}
    
    public func emit(_ event: TabRouterEvent) {
        eventPool.send(event)
    }
}
