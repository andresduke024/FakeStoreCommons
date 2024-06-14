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
    
    private let routerEventPool: RouterEventPool?
    private let content: () -> Content
    
    private var eventPool: AnyPublisher<RouterEvent, Never> {
        routerEventPool?.publisher ?? Empty<RouterEvent, Never>().eraseToAnyPublisher()
    }
    
    public init(
        routerEventPool: RouterEventPool?,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.routerEventPool = routerEventPool
        self.content = content
    }
    
    public var body: some View {
        content()
            .toolbar(.hidden)
            .onReceive(eventPool) { event in
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

#Preview {
    BaseNavigationView(routerEventPool: BaseRouterEventPool()) {}
}
