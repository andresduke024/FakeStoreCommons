//
//  TextFieldErrorText.swift
//
//
//  Created by Andres Duque on 11/06/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct TextFieldErrorText: View {
    
    @Injectable
    private var theme: Theme?
    
    private let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    private let iconSize: CGFloat = 11
    
    public var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Images.Icons.xcircle
                .resizable()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(theme?.onPrimaryColor)
            
            Text(text)
                .font(.footnote)
                .foregroundColor(theme?.onPrimaryColor)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                
        }
        .padding(.vertical, 2)
    }
}
