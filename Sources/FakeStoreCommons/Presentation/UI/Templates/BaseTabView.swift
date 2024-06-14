//
//  BaseTabView.swift
//  
//
//  Created by Andres Duque on 13/06/24.
//

import SwiftUI
import Combine
import SwiftDependencyInjector

public struct BaseTabView<Content: View>: View {
    
    @EnvironmentObject
    private var router: TabRouter
    
    @Injectable
    private var theme: Theme?
    
    @Injectable(injection: .singleton)
    private var routerEventPool: TabRouterEventPool?
    
    private var eventPool: AnyPublisher<TabRouterEvent, Never> {
        routerEventPool?.publisher ?? Empty<TabRouterEvent, Never>().eraseToAnyPublisher()
    }
    
    private let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        TabView(selection: $router.selectedTab) {
            content()
        }
        .tint(theme?.primaryColor)
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(theme?.backgroundColor ?? .black)
        }
        .navigationBarBackButtonHidden()
        .onReceive(eventPool) { event in
            switch event {
            case .changeTab(let newTab):
                router.changeTab(newTab)
            }
        }
    }
}
