//
//  APIServiceProtocol.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import Foundation

protocol APIServiceProtocol {
    func request<T: Decodable>(url:URL) async throws -> T
}
