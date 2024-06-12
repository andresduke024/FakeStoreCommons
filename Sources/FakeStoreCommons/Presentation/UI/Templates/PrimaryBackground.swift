//
//  PrimaryBackground.swift
//
//
//  Created by Andres Duque on 11/06/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct PrimaryBackground<Content: View>: View {
    @Injectable
    private var theme: Theme?
    
    private let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            theme?.primaryColor?
                .edgesIgnoringSafeArea(.all)
            
            content()
        }
    }
}
