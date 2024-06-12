//
//  RouterTests.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons

final class RouterTests: XCTestCase {
    
    private var sut: Router!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func testPush() {
        sut = Router()
        
        sut.push("Mock")
        
        XCTAssertEqual(sut.navPath.count, 1)
    }
    
    func testPushDestination() {
        sut = Router()
        
        sut.push(destination: .home)
        
        XCTAssertEqual(sut.navPath.count, 1)
    }
    
    func testPop() {
        sut = Router(initialStak: [.authentication])
        
        sut.pop()
        
        XCTAssertEqual(sut.navPath.count, 0)
    }
    
    func testPopToRoot() {
        sut = Router(initialStak: [.authentication, .home])
        
        sut.popToRoot()
        
        XCTAssertEqual(sut.navPath.count, 0)
    }
    
    func testReplace() {
        sut = Router(initialStak: [.authentication])
        
        sut.replace(newDestination: .home)
        
        XCTAssertEqual(sut.navPath.count, 1)
    }
}
