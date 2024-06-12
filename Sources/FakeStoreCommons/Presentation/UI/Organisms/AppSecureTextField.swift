//
//  AppSecureTextField.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct AppSecureTextField: View {
    @Injectable
    private var theme: Theme?
    
    @Binding
    private var contentWrapper: FieldContentWrapper
    
    private let image: Image
    private let placeHolder: String
    
    private let onCommit: () -> Void
    
    public init(
        contentWrapper: Binding<FieldContentWrapper>,
        image: Image,
        placeHolder: String,
        onCommit: @escaping () -> Void = {}
    ) {
        self._contentWrapper = contentWrapper
        self.image = image
        self.placeHolder = placeHolder
        self.onCommit = onCommit
    }
    
    public var body: some View {
        TextFieldContainer(
            contentWrapper: $contentWrapper,
            image: image
        ) {
            SecureField(
                placeHolder,
                text: $contentWrapper.content,
                onCommit: {
                    guard contentWrapper.validate() else { return }
                    
                    onCommit()
                }
            )
        }
    }
}

#Preview {
    AppSecureTextField(
        contentWrapper: .constant(FieldContentWrapper.build()),
        image: Image(systemName: "person"),
        placeHolder: "test"
    )
}
