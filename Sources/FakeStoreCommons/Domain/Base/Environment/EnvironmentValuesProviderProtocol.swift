//
//  EnvironmentValuesProviderProtocol.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
import SwiftDependencyInjector

public protocol EnvironmentValuesProviderProtocol: InjectableDependency {
    func get<T>(_ key: EnvironmentValuesKeys) -> T?
}
