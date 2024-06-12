//
//  WebServiceRepositoryImplTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import SwiftDependencyInjector

final class WebServiceRepositoryImplTests: XCTestCase {
    
    private var sut: WebServiceRepositoryImpl!
    
    private let injector = Injector.build(context: .tests(name: "WebServiceRepositoryImpl"))
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        injector.register(URLSession.self) { MockURLSession.build() }
        
        sut = WebServiceRepositoryImpl()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
        injector.destroy()
        MockURLSession.destroy()
    }
    
    func testFetchWithGetRequestSuccess() async throws {
        MockURLSession.setResponseHandler()
        
        let result: MockModel = try await sut.fetch(
            url: MockURLSession.mockUrl,
            method: .get,
            body: nil
        )
        
        XCTAssertEqual(result.id, 1)
    }
    
    func testFetchFailsDueToInvalidURL() async throws {
        do {
            let _: MockModel = try await sut.fetch(
                url: "",
                method: .get,
                body: nil
            )
            
            XCTFail("Success is not allowed in this test case")
        } catch WebServiceError.invalidURL {
            XCTAssert(true)
        } catch {
            XCTFail("Invalid error for this test case")
        }
    }
    
    func testFetchFailsDueToInvalidStatusCode() async throws {
        MockURLSession.setResponseHandler(statusCode: 400)
        
        do {
            let _: MockModel = try await sut.fetch(
                url: MockURLSession.mockUrl,
                method: .get,
                body: nil
            )
            
            XCTFail("Success is not allowed in this test case")
        } catch WebServiceError.statusCode(_) {
            XCTAssert(true)
        } catch {
            XCTFail("Invalid error for this test case")
        }
    }
}
