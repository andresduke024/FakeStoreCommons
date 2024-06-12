//
//  AppTextField.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct AppTextField: View {
    
    @Injectable
    private var theme: Theme?
    
    @Binding
    private var contentWrapper: FieldContentWrapper
    
    private let image: Image
    private let placeHolder: String
    
    private let onEditingChanged: (Bool) -> Void
    private let onCommit: () -> Void
    
    public init(
        contentWrapper: Binding<FieldContentWrapper>,
        image: Image,
        placeHolder: String,
        onEditingChanged: @escaping (Bool) -> Void = { _ in },
        onCommit: @escaping () -> Void = {}
    ) {
        self._contentWrapper = contentWrapper
        self.image = image
        self.placeHolder = placeHolder
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
    }
    
    public var body: some View {
        TextFieldContainer(
            contentWrapper: $contentWrapper,
            image: image
        ) {
            TextField(
                placeHolder,
                text: $contentWrapper.content,
                onEditingChanged: onEditingChanged,
                onCommit: {
                    guard contentWrapper.validate() else { return }
                    
                    onCommit()
                }
            )
        }
    }
}


#Preview {
    AppTextField(
        contentWrapper: .constant(FieldContentWrapper.build()),
        image: Image(systemName: "person"),
        placeHolder: "test"
    )
}

