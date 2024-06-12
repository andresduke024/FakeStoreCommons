//
//  FieldContentWrapper.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

public struct FieldContentWrapper {
    public var content: String
    public var error: String?
    public var isFirstValidationDone: Bool = false
    
    private let validators: [FieldValidator]
    
    private init(
        initial content: String,
        validators: [FieldValidator] = []
    ) {
        self.content = content
        self.error = nil
        self.validators = validators
    }
    
    @MainActor
    @discardableResult
    mutating public func validate() -> Bool {
        executeValidators()
        isFirstValidationDone = true
        
        return error == nil
    }
    
    @MainActor
    mutating private func executeValidators() {
        do {
            for item in validators {
                try item.validate(content)
            }
            
            self.error = nil
        } catch let validationError as FieldValidationError {
            self.error = validationError.message
        } catch let validationError {
            self.error = validationError.localizedDescription
        }
    }
}

public extension FieldContentWrapper {
    static func build(
        initialValue: String = "",
        rules validators: [FieldValidators] = []
    ) -> FieldContentWrapper {
        return FieldContentWrapper(
            initial: initialValue,
            validators: validators.map({ $0.value })
        )
    }
}
