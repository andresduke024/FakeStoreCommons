//
//  Theme.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import SwiftUI
import SwiftDependencyInjector

public protocol Theme: InjectableDependency {
    var primaryColor: Color? { get }
    var secondaryColor: Color? { get }
    
    var onPrimaryColor: Color? { get }
    var onSecondaryColor: Color? { get }
    
    var backgroundColor: Color? { get }
    var onBackgroundColor: Color? { get }
}
