//
//  FieldValidationError.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

public struct FieldValidationError: Error {
    public let message: String
    
    public init(message: String) {
        self.message = message
    }
}
