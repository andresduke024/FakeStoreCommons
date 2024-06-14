//
//  TabRouterEvent.swift
//
//
//  Created by Andres Duque on 13/06/24.
//

import Foundation

public enum TabRouterEvent {
    case changeTab(_ newTab: TabNavDestinations)
}

extension TabRouterEvent: Equatable {
    public static func == (lhs: TabRouterEvent, rhs: TabRouterEvent) -> Bool {
        switch (lhs, rhs) {
        case (.changeTab(let lhsValue), .changeTab(let rhsValue)):
            return lhsValue == rhsValue
        }
    }
}
