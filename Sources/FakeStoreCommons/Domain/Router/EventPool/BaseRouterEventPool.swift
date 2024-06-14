//
//  File.swift
//  
//
//  Created by Andres Duque on 4/06/24.
//

import Combine

open class BaseRouterEventPool: RouterEventPool {
    
    private let eventPool = PassthroughSubject<RouterEvent, Never>()
    
    public var publisher: AnyPublisher<RouterEvent, Never> { eventPool.eraseToAnyPublisher() }
    
    required public init() {}
    
    public func emit(_ event: RouterEvent) {
        eventPool.send(event)
    }
}
