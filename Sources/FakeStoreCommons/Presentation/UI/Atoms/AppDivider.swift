//
//  AppDivider.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import SwiftUI

public struct AppDivider: View {
    
    private let color: Color?
    
    public init(_ color: Color?) {
        self.color = color
    }
    
    public var body: some View {
        Divider()
         .frame(height: 1)
         .background(color)
    }
}

#Preview {
    AppDivider(.black)
}
