//
//  UserRepositoryProtocol.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser() async throws -> [User]
}


