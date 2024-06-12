//
//  File.swift
//  
//
//  Created by Andres Duque on 4/06/24.
//

import Foundation

public typealias CloseModalAction = () -> Void

public struct ModalAction: Identifiable {
    public let id = UUID()
    
    let name: String
    let action: ((_ close: CloseModalAction) -> Void)?
    
    public init(name: String, action: ( (_: CloseModalAction) -> Void)? = nil) {
        self.name = name
        self.action = action
    }
}
