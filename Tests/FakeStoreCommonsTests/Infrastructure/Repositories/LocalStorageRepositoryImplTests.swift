//
//  LocalStorageRepositoryImplTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import SwiftDependencyInjector

final class LocalStorageRepositoryImplTests: XCTestCase {

    private var sut: LocalStorageRepositoryImpl!
    private var mockUserDefaults: MockUserDefaults!
    
    private let injector = Injector.build(context: .tests(name: "LocalStorageRepositoryImpl"))
    
    private let mockKey = "mock_model_key"
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockUserDefaults = MockUserDefaults(suiteName: MockUserDefaults.name)
        injector.register(UserDefaults.self) { self.mockUserDefaults }
        
        sut = LocalStorageRepositoryImpl()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        mockUserDefaults = nil
        sut = nil
        injector.destroy()
    }

    func testSaveModel() throws {
        let mockModel = MockModel(id: 1)
        
        sut.save(data: mockModel, key: mockKey)

        XCTAssert(mockUserDefaults.setWassCalled)
    }
    
    func testGetModel() throws {
        let mockData = try JSONEncoder().encode(MockModel(id: 1))
        mockUserDefaults.dataResult = mockData
        
        let result: MockModel? = sut.get(mockKey)
        
        XCTAssertEqual(result?.id, 1)
    }
    
    func testGetModelList() throws {
        let mockData = try JSONEncoder().encode([MockModel(id: 1)])
        mockUserDefaults.dataResult = mockData
        
        let result: [MockModel]? = sut.get(mockKey)
        
        XCTAssertEqual(result?.count, 1)
    }
    
    func testRemoveModel() throws {
        sut.remove(mockKey)
        
        XCTAssert(mockUserDefaults.removeWassCalled)
    }
}
