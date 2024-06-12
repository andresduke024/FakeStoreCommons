//
//  WebServiceRepositoryProtocol.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
import SwiftDependencyInjector

public protocol WebServiceRepositoryProtocol: InjectableDependency {
    func fetch<T: Decodable>(
        url: String?,
        method: HTTPMethod,
        body: Encodable?
    ) async throws -> T
}
