//
//  AppError.swift
//  CleanDummy1
//
//  Created by Manishankar KP on 12/05/26.
//

import Foundation

enum AppError: Error, LocalizedError {
    case NetworkError
    case DecodeError
    case UnknownError
    
    var errorDescription: String? {
        switch self {
        case .NetworkError:
            return "Network Error"
        case .DecodeError:
            return "Decode Error"
        case .UnknownError:
            return "Unknown Error"
        }
    }
}
