//
//  FieldValidators.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

public enum FieldValidators {
    case notEmpty
    
    public var value: FieldValidator {
        switch self {
        case .notEmpty:
            EmptyFieldValidator()
        }
    }
}
