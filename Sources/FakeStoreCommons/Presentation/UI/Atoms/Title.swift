//
//  Title.swift
//  
//
//  Created by Andres Duque on 6/06/24.
//

import SwiftUI
import SwiftDependencyInjector

public struct Title: View {
    
    @Injectable
    private var theme: Theme?
    
    private let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(theme?.onPrimaryColor)
    }
}
