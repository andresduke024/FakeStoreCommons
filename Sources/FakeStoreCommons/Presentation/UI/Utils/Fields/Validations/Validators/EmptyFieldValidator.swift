//
//  EmptyFieldValidator.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

struct EmptyFieldValidator: FieldValidator {
    func validate(_ text: String) throws {
        guard text.isEmpty else { return }
        
        throw FieldValidationError(message: CommonConstants.Errors.emptyField)
    }
}
