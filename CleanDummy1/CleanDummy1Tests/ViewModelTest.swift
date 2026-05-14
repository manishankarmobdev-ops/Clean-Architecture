//
//  ViewModelTest.swift
//  CleanDummy1Tests
//
//  Created by Manishankar KP on 12/05/26.
//
import XCTest
@testable import CleanDummy1

final class ViewModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccess() throws {
        let repo = MockService()
        repo.user = [User(id:1,name:"")]
        
        let usecase = FetchUserRepository(userRepository: repo)
        let viewModel = UserViewModel(userCase: usecase)
        
        await viewModel.loadData()
        
        if case .success(let user) = viewModel.state {
            XCTAssertEqual(user.count, 1)
            
        }
        else {
            XCTFail("Success Expected")
        }
    }

    func testPerformanceExample() async {
        let repo = MockService()
        repo.shouldThrowError = true
        
        let useCase = FetchUserRepository(userRepository: repo)
        let viewModel = UserViewModel(userCase: useCase)
        
        await viewModel.loadData()
        
        if case .error(let message) = viewModel.state {
            XCTAssertFalse(message.isEmpty)
        }
        else {
            XCTFail("Failure Expected")
        }
        
        
        
    }

}
