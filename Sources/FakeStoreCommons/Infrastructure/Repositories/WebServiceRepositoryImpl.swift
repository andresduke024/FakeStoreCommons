//
//  WebServiceRepositoryImpl.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
import SwiftDependencyInjector

struct WebServiceRepositoryImpl: WebServiceRepositoryProtocol {
    
    @Injectable
    private var urlSession: URLSession?
    
    init() {}
    
    func fetch<T: Decodable>(
        url: String?,
        method: HTTPMethod,
        body: Encodable?
    ) async throws -> T {
        guard let urlSession else { throw WebServiceError.fail }
        
        guard let url, let webServiceUrl = URL(string: url) else {
            throw WebServiceError.invalidURL
        }
        
        let request = try prepareRequest(webServiceUrl, method, body)
        
        let (data, response) = try await urlSession.data(for: request)
        
        return try handleResponse(data, response)
    }
    
    private func handleResponse<T: Decodable>(
        _ data: Data,
        _ response: URLResponse
    ) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw WebServiceError.fail
        }
        
        guard response.statusCode == 200 else {
            throw WebServiceError.statusCode(response.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    private func prepareRequest(
        _ url: URL,
        _ method: HTTPMethod,
        _ body: Encodable?
    ) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.value
        
        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        return request
    }
}
