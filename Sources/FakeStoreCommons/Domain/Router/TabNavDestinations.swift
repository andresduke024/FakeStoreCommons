//
//  TabNavDestinations.swift
//
//
//  Created by Andres Duque on 13/06/24.
//

import Foundation

public enum TabNavDestinations {
    case lobby
    case cart
    case profile
    
    public var value: Int {
        switch self {
        case .lobby: 1
        case .cart: 2
        case .profile: 3
        }
    }
}
