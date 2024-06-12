//
//  ModalViewWrapper.swift
//
//
//  Created by Andres Duque on 4/06/24.
//

import SwiftUI

public struct ModalPresenterWrapper<Content: View>: View {
    
    @Binding
    private var modals: [Modal]
    
    private let content: () -> Content
    
    public init(
        modals: Binding<[Modal]>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._modals = modals
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
            
            ForEach(modals) { item in
                ModalView(item: item) {
                    modals.removeAll { $0.id == item.id }
                }
            }
        }
    }
}
