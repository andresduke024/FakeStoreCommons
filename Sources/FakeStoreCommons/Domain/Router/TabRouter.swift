//
//  TabRouter.swift
//  
//
//  Created by Andres Duque on 13/06/24.
//

import Foundation
import SwiftDependencyInjector

open class TabRouter: InjectableDependency, ObservableObject {
    
    @Published
    public var selectedTab: Int
    
    public required init() {
        self.selectedTab = TabNavDestinations.lobby.value
    }
    
    public init(initialTab: TabNavDestinations) {
        self.selectedTab = initialTab.value
    }
    
    public func changeTab(_ newTab: TabNavDestinations) {
        selectedTab = newTab.value
    }
}
