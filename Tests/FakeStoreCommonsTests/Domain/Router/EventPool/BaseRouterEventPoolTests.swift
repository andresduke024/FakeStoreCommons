//
//  BaseRouterEventPoolTests.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
import Combine
@testable import FakeStoreCommons

final class BaseRouterEventPoolTests: XCTestCase {
    
    private var sut: BaseRouterEventPool!
    
    private var subscribers = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = BaseRouterEventPool()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        subscribers.forEach { $0.cancel() }
        subscribers.removeAll()
        sut = nil
    }
    
    func testEmitEvent() async {
        let expectation = expectation(description: "Waiting for event")
        
        sut.publisher
            .sink { event in
                expectation.fulfill()
                XCTAssertNotNil(event)
            }
            .store(in: &subscribers)
        
        await sut.emit(.newNavDestination(.home))
        await fulfillment(of: [expectation], timeout: 1)
    }
}
