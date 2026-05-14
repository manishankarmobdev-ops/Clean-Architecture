//
//  MockService.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import Foundation

class MockService: UserRepositoryProtocol {
    var user: [User] = []
    var shouldThrowError = false
    
    func fetchUser() async throws -> [User] {
        if shouldThrowError {
            throw AppError.UnknownError
        }
        
        return user
    }
}
