//
//  AppButton.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct AppButton: View {
    
    @Injectable
    private var theme: Theme?
    
    @Binding
    private var isLoading: Bool
    
    private let text: String
    private let action: () -> Void
    
    public init(
        isLoading: Binding<Bool> = .constant(false),
        text: String,
        action: @escaping () -> Void
    ) {
        self._isLoading = isLoading
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Button(
            action: {
                guard !isLoading else { return }
                
                action()
            },
            label: {
                HStack {
                    if isLoading {
                        ProgressView()
                            .tint(theme?.onSecondaryColor)
                    } else {
                        ButtonText(text: text)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(theme?.secondaryColor ?? Color.black)
                )
            }
        )
    }
}

#Preview {
    AppButton(
        isLoading: .constant(false),
        text: "I'm a button"
    ) { }
}
