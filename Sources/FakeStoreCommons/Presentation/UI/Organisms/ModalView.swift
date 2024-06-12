//
//  ModalView.swift
//
//
//  Created by Andres Duque on 4/06/24.
//

import SwiftUI

public struct ModalView: View {
    private let item: Modal
    private let close: () -> Void
    
    public init(item: Modal, close: @escaping () -> Void) {
        self.item = item
        self.close = close
    }
    
    public var body: some View {
        ZStack {
            OpaqueBackground {
                guard item.closeOnTap else { return }
                
                close()
            }
            
            VStack {
                ModalIcon(type: item.type)
                    .padding(.bottom, 16)
                
                VStack(spacing: 8) {
                    if let title = item.title {
                        Text(title)
                            .font(.title2)
                    }
                    
                    if let description = item.description {
                        Text(description)
                            .font(.headline)
                    }
                }
                .padding(.bottom, 20)
                
                ForEach(item.actions) { modalAction in
                    AppButton(text: modalAction.name) {
                        guard let actionToInvoke = modalAction.action else {
                            close()
                            return
                        }
                        
                        actionToInvoke(close)
                    }
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
            )
            .padding(24)
        }
    }
}
