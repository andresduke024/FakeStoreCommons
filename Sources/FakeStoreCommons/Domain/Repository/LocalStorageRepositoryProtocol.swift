//
//  LocalStorageRepositoryProtocol.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import Foundation
import SwiftDependencyInjector

public protocol LocalStorageRepositoryProtocol: InjectableDependency {
    func save<T: Encodable>(data: T, key: String)
    
    func get<T: Decodable>(_ key: String) -> T?
    
    func remove(_ key: String)
}
