//
//  BaseModuleView.swift
//  
//
//  Created by Andres Duque on 4/06/24.
//

import SwiftUI
import Combine
import SwiftDependencyInjector

public struct BaseNavigationView<Content: View>: View {
    
    @EnvironmentObject
    private var router: Router
    
    private let routerEventPool: RouterEventPool
    private let content: () -> Content
    
    public init(
        routerEventPool: RouterEventPool,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.routerEventPool = routerEventPool
        self.content = content
    }
    
    public var body: some View {
        content()
            .toolbar(.hidden)
            .onReceive(routerEventPool.publisher) { event in
                switch event {
                case .newDestination(let destination):
                    router.push(destination)
                case .newNavDestination(let destination):
                    router.push(destination: destination)
                case .replaceStack(let destination):
                    router.replace(newDestination: destination)
                }
            }
    }
}
