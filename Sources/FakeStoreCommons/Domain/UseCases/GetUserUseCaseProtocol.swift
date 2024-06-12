//
//  GetUserUseCaseProtocol.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import Foundation
import SwiftDependencyInjector

public protocol GetUserUseCaseProtocol: InjectableDependency {
    func invoke() async -> User?
}
