//
//  BaseObservableObject.swift
//
//
//  Created by Andres Duque on 4/06/24.
//

import Foundation

open class BaseObservableObject: ObservableObject {
    
    @Published
    public var modals: [Modal] = []
    
    public init() {}
    
    @MainActor
    public func addModal(_ modal: Modal) async {
        modals.append(modal)
    }
}
