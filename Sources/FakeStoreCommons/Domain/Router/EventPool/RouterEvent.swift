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
