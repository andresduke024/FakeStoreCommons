//
//  BaseObservableObjectsTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
import Combine
@testable import FakeStoreCommons

final class BaseObservableObjectsTests: XCTestCase {

    private var sut: BaseObservableObject!
    
    private var subscribers = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        subscribers.forEach { $0.cancel() }
        subscribers.removeAll()
        sut = BaseObservableObject()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func testAddModalSuccess() async throws {
        let mockModal = Modal(type: .info)
        
        let expectation = expectation(description: "Waiting for modal publisher to update")
        
        sut.$modals
            .dropFirst()
            .sink { items in
                expectation.fulfill()
                XCTAssertEqual(items.count, 1)
            }
            .store(in: &subscribers)
        
        await sut.addModal(mockModal)
        await fulfillment(of: [expectation], timeout: 1)
    }
}
