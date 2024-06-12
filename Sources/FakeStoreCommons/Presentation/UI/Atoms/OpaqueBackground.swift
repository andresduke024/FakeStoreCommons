//
//  OpaqueBackground.swift
//  
//
//  Created by Andres Duque on 4/06/24.
//

import SwiftUI

public struct OpaqueBackground: View {
    private let onTap: () -> Void
    
    public init(onTap: @escaping () -> Void) {
        self.onTap = onTap
    }
    
    public var body: some View {
        Color.black
            .opacity(0.4)
            .ignoresSafeArea()
            .onTapGesture {
                onTap()
            }
    }
}
