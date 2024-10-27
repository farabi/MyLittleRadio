//
//  APIError.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import Foundation

// MARK: - APIError

enum APIError: Error {
    case invalidURL
    case notResults
    case networkError(Int)
    case decodingError
    case unAuthorized
    case unknown
}
