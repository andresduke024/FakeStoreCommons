//
//  File.swift
//  
//
//  Created by Andres Duque on 4/06/24.
//

import Combine

open class BaseRouterEventPool: RouterEventPool {
    
    private let eventPool = PassthroughSubject<RouterEvent, Never>()
    
    public var publisher: PassthroughSubject<RouterEvent, Never> { eventPool }
    
    required public init() {}
    
    public func emit(_ event: RouterEvent) {
        eventPool.send(event)
    }
}
