//
//  TextFieldContainer.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct TextFieldContainer<Content: View>: View {
    
    @Injectable
    private var theme: Theme?
    
    @Binding
    private var contentWrapper: FieldContentWrapper
    
    private var content: () -> Content
    private let image: Image
    
    public init(
        contentWrapper: Binding<FieldContentWrapper>,
        image: Image,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._contentWrapper = contentWrapper
        self.image = image
        self.content = content
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                image
                    .foregroundColor(theme?.onPrimaryColor)
                
                content()
                    .foregroundColor(theme?.onPrimaryColor)
                
            }
            .padding(5)
            
            AppDivider(theme?.onPrimaryColor)
            
            if let error = contentWrapper.error {
                TextFieldErrorText(text: error)
            }
        }
        .frame(minHeight: 40)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .onChange(of: contentWrapper.content) { oldValue, newValue in
            guard contentWrapper.isFirstValidationDone else { return }
            
            contentWrapper.validate()
        }
    }
}

