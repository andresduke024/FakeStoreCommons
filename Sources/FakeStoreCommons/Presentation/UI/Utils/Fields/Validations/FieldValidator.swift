//
//  FieldValidator.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

public protocol FieldValidator {
    func validate(_ text: String) throws
}
