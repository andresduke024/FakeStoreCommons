//
//  User.swift
//  
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation

public struct User: Codable {
    public let id: Int
    public let email: String
    public let username: String
    public let firstName: String
    public let lastName: String
    public let phone: String
    public let token: String
    
    public init(
        id: Int,
        email: String,
        username: String,
        firstName: String,
        lastName: String,
        phone: String,
        token: String
    ) {
        self.id = id
        self.email = email
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.token = token
    }
}
