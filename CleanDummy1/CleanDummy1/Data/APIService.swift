//
//  APIService.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import Foundation

class APIService: APIServiceProtocol {
    func request<T: Decodable>(url: URL) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch is URLError {
            throw AppError.NetworkError
        }
        catch is DecodingError {
            throw AppError.DecodeError
        }
        catch {
            throw AppError.UnknownError
        }
    }
}
