//
//  FetchUserRepository.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import Foundation

struct FetchUserRepository {
    private var userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [User] {
        return try await userRepository.fetchUser()
    }
}
