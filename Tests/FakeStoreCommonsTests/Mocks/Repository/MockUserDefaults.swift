//
//  MockUserDefaults.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

class MockUserDefaults: UserDefaults {
    
    static let name = "MockUserDefaults"

    override init?(suiteName suitename: String?) {
        UserDefaults().removePersistentDomain(forName: suitename!)
        super.init(suiteName: suitename)
    }

    var setWassCalled: Bool = false
    override func setValue(_ value: Any?, forKey key: String) {
        setWassCalled = true
    }
    
    var dataResult: Data?
    override func data(forKey defaultName: String) -> Data? {
        return dataResult
    }
    
    var removeWassCalled: Bool = false
    override func removeObject(forKey defaultName: String) {
        removeWassCalled = true
    }
}
