//
//  LoginRequest.swift
//  App
//
//  Created by Omid Kia on 11/3/19.
//

import Foundation
import Vapor
import FluentSQLite

final class LoginRequest: SQLiteModel {
    var id: Int?
    var userName: String
    var password: String
    init(userName: String, password: String) {
        self.id = Int(userName)
        self.userName = userName
        self.password = password
    }
    public func validate() {
        
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension LoginRequest: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension LoginRequest: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension LoginRequest: Parameter { }

