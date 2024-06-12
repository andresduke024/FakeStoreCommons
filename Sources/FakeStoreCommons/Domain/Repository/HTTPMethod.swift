//
//  HTTPMethod.swift
//  
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation

public enum HTTPMethod {
    case get
    case post
    case put
    
    var value: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        }
    }
}
