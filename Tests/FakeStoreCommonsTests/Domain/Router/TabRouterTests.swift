//
//  TabRouterTests.swift
//  
//
//  Created by Andres Duque on 13/06/24.
//

import XCTest
@testable import FakeStoreCommons

final class TabRouterTests: XCTestCase {
    
    private var sut: TabRouter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func testChangeTab() {
        sut = TabRouter(initialTab: .lobby)
        
        sut.changeTab(.profile)
        
        XCTAssertEqual(sut.selectedTab, TabNavDestinations.profile.value)
    }
}
