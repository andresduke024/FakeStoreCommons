//
//  LocalStorageRepositoryImpl.swift
//  
//
//  Created by Andres Duque on 7/06/24.
//

import Foundation
import SwiftDependencyInjector

struct LocalStorageRepositoryImpl: LocalStorageRepositoryProtocol {
    
    @Injectable
    private var storage: UserDefaults?
    
    func save<T: Encodable>(data: T, key: String) {
        if let contentData = try? JSONEncoder().encode(data) {
            storage?.setValue(contentData, forKey: key)
        }
    }
    
    func get<T: Decodable>(_ key: String) -> T? {
        guard let content = storage?.data(forKey: key) else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: content)
    }
    
    func remove(_ key: String) {
        storage?.removeObject(forKey: key)
    }
}
