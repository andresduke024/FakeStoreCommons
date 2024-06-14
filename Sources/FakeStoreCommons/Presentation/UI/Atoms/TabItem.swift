//
//  TabItem.swift
//
//
//  Created by Andres Duque on 13/06/24.
//

import SwiftUI

public struct TabItem<Content: View>: View {
    
    private let type: TabNavDestinations
    private let content: () -> Content
    
    public init(
        type: TabNavDestinations,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.type = type
        self.content = content
    }
    
    public var body: some View {
        content()
            .tabItem { Label(name, systemImage: imageName) }
            .tag(type.value)
    }
    
    private var name: String {
        switch type {
        case .lobby: "Lobby"
        case .cart: "Cart"
        case .profile: "Profile"
        }
    }
    
    private var imageName: String {
        switch type {
        case .lobby: "house"
        case .cart: "person"
        case .profile: "cart"
        }
    }
}
