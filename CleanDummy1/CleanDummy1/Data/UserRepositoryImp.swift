//
//  UserRepositoryImp.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import Foundation

class UserRepositoryImp: UserRepositoryProtocol {
    private let apiProtocol: APIServiceProtocol
    
    init(apiProtocol: APIServiceProtocol) {
        self.apiProtocol = apiProtocol
    }
    
    func fetchUser() async throws -> [User] {
        guard let url = URL(string: "\(apiImp.User.baseUrl)\(apiImp.User.path)") else {
            throw AppError.NetworkError
        }
        
        return try await apiProtocol.request(url: url)
    }
}
