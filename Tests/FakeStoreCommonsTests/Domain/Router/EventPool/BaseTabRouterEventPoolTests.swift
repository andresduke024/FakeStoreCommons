//
//  BaseTabRouterEventPoolTests.swift
//
//
//  Created by Andres Duque on 13/06/24.
//

import XCTest
import Combine
@testable import FakeStoreCommons

final class BaseTabRouterEventPoolTests: XCTestCase {
    
    private var sut: BaseTabRouterEventPool!
    
    private var subscribers = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = BaseTabRouterEventPool()
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
        
        await sut.emit(.changeTab(.profile))
        await fulfillment(of: [expectation], timeout: 1)
    }
}

