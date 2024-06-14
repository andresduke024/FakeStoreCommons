//
//  SwiftUIView.swift
//  
//
//  Created by Andres Duque on 7/06/24.
//

public enum RouterEvent {
    case newNavDestination(_ destination: NavDestinations)
    case newDestination(_ destination: any Hashable)
    case replaceStack(_ newDestination: NavDestinations)
}

extension RouterEvent: Equatable {
    public static func == (lhs: RouterEvent, rhs: RouterEvent) -> Bool {
        switch (lhs, rhs) {
        case (.newDestination(_), .newDestination(_)):
            return true
        case (.newNavDestination(let lhsValue), .newNavDestination(let rhsValue)):
            return lhsValue == rhsValue
        case (.replaceStack(let lhsValue), .replaceStack(let rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
