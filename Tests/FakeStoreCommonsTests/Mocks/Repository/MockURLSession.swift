//
//  MockURLSession.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

final class MockURLSession: URLSession {

    static func build() -> URLSession {
        let configuration: URLSessionConfiguration = .ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }
    
    static func setError(_ error: Error) {
        MockURLProtocol.error = error
    }
    
    static let mockJsonResponse = """
    {
        "id": 1
    }
    """
    
    static let mockUrl = "https://tests.com"
    
    static func setResponseHandler(statusCode: Int = 200) {
        MockURLProtocol.requestHandler = { (request: URLRequest) in
            let response = HTTPURLResponse(
                url: URL(string: mockUrl)!,
                statusCode: statusCode,
                httpVersion: nil,
                headerFields: ["Content-Type": "application/json"]
            )!
            
            let data = MockURLSession.mockJsonResponse.data(using: .utf8)!
            return (response, data)
        }
    }
    
    static func destroy() {
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = nil
    }
}
