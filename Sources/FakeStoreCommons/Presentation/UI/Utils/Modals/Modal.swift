//
//  Modal.swift
//  
//
//  Created by Andres Duque on 4/06/24.
//

import Foundation

public struct Modal: Identifiable {
    public let id = UUID()
    
    public let type: ModalType
    public let title: String?
    public let description: String?
    public let closeOnTap: Bool
    public let actions: [ModalAction]
    
    public init(
        type: ModalType,
        title: String? = nil,
        description: String? = nil,
        closeOnTap: Bool = true,
        actions: [ModalAction] = []
    ) {
        self.type = type
        self.title = title
        self.description = description
        self.closeOnTap = closeOnTap
        self.actions = actions
    }
}
