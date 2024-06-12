//
//  Router.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import SwiftUI
import SwiftDependencyInjector

open class Router: InjectableDependency, ObservableObject  {
    
    @Published
    public var navPath: NavigationPath
    
    required public init() {
        self.navPath = NavigationPath()
    }
    
    public init(initialStak: [NavDestinations]) {
        self.navPath = NavigationPath(initialStak)
    }
    
    public func push(_ destination: any Hashable) {
        navPath.append(destination)
    }
    
    public func push(destination: NavDestinations) {
        push(destination)
    }
    
    public func pop() {
        navPath.removeLast()
    }
    
    public func popToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    public func replace(newDestination: NavDestinations) {
        popToRoot()
        push(newDestination)
    }
}
