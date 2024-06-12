//
//  WebServiceError.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation

public enum WebServiceError: Error {
    case invalidURL
    case statusCode(Int)
    case fail
}
