//
//  UserViewModel.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

enum ViewState {
case idle
case loading
case success([User])
case error(String)
}

protocol APIEndPoint {
    var baseUrl: URL { get }
    var path: String { get }
    
}

enum apiImp: APIEndPoint {
    case User
    case Unknown
    
    var baseUrl: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }
    
    var path: String {
        switch self {
        case .User:
            return "users"
        case .Unknown:
            return "unknown"
        }
    }
}

import Foundation

@MainActor

class UserViewModel: ObservableObject {
    @Published var state: ViewState = .idle
    private let userCase: FetchUserRepository
    
    init(userCase: FetchUserRepository) {
        self.userCase = userCase
    }
    
    func loadData() async {
        state = .loading
        
        do {
            let userData = try await userCase.execute()
            state = .success(userData)
        }
        catch {
            state = .error(error.localizedDescription)
        }
    }
}
