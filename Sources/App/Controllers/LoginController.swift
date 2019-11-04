//
//  LoginController.swift
//  App
//
//  Created by Omid Kia on 11/3/19.
//

import Vapor

final class LoginController {
    /// Returns a list of all `Users`s.
    func index(_ req: Request) throws -> Future<[LoginRequest]> {
        
        return LoginRequest.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> (Future<LoginRequest>)  {
        return try req.content.decode(LoginRequest.self).flatMap { loginRequest in
            return loginRequest.save(on: req)
        }
    }

    /// Deletes a parameterized `User`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(LoginRequest.self).flatMap { loginRequest in
            return loginRequest.delete(on: req)
        }.transform(to: .ok)
    }
}

