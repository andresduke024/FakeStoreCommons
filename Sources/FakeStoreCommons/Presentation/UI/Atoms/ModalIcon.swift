//
//  ModalIcon.swift
//
//
//  Created by Andres Duque on 4/06/24.
//

import SwiftUI

public struct ModalIcon: View {
    
    private let type: ModalType
    
    public init(type: ModalType) {
        self.type = type
    }
    
    private let size: CGFloat = 60
    
    public var body: some View {
        Image(getAssetName().rawValue, bundle: .module)
            .resizable()
            .frame(width: size, height: size)
    }
    
    private func getAssetName() -> Assets {
        switch type {
        case .success:
            return .successIcon
        case .error:
            return .errorIcon
        case .info:
            return .infoIcon
        }
    }
}
