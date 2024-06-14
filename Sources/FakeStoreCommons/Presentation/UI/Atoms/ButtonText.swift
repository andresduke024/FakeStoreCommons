//
//  ButtonText.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct ButtonText: View {
    
    @Injectable
    private var theme: Theme?
    
    private let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .foregroundColor(theme?.onPrimaryColor)
            .padding(.vertical, 14)
            .padding(.horizontal, 6)
    }
}

#Preview {
    ButtonText(text: "I'm a button")
}
