//
//  APIError+Equatable.swift
//  Data
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Foundation
@testable import Data

// MARK: APIError + Equatable

extension APIError: Equatable {
    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.decodingError, .decodingError),
             (.invalidURL, .invalidURL),
             (.notResults, .notResults),
             (.unAuthorized, .unAuthorized),
             (.unknown, .unknown):
            return true
        case let (.networkError(code1), .networkError(code2)):
            return code1 == code2
        default:
            return false
        }
    }
}
