//
//  ContentView.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: UserViewModel
    
    init() {
        let api = APIService()
        let userRepoImp = UserRepositoryImp(apiProtocol: api)
        let usecase = FetchUserRepository(userRepository: userRepoImp)
        _viewModel = StateObject(wrappedValue: UserViewModel(userCase: usecase))
    }
    
    var body: some View {
            NavigationView {
                UserView
                    .navigationTitle("User List")
            }
        .padding()
        .task {
            await viewModel.loadData()
        }
    }
    
    @ViewBuilder
    private var UserView: some View {
        switch viewModel.state {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .success(let array):
            List(array,id: \.id) { item in
                Text(item.name)
            }
        case .error(let errorMessage):
            Text(errorMessage)
        }
    }
}



//#Preview {
//    ContentView()
//}
