//
//  MockURLSession.swift
//  Data
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Foundation
@testable import Data

// MARK: - MockURLSession

class MockURLSession: URLSessionProtocol {
    // MARK: Lifecycle

    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }

    // MARK: Internal

    var data: Data?
    var response: URLResponse?
    var error: Error?

    func data(from _: URL, delegate _: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        if let error {
            throw error
        }
        guard let data, let response else {
            throw URLError(.badServerResponse)
        }
        return (data, response)
    }
}
