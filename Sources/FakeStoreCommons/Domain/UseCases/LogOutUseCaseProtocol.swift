//
//  LogOutUseCaseProtocol.swift
//  
//
//  Created by Andres Duque on 7/06/24.
//

import Foundation
import SwiftDependencyInjector

public protocol LogOutUseCaseProtocol: InjectableDependency {
    func invoke() async
}
