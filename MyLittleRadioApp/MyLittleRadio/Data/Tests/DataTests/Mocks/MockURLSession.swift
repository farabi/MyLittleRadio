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

// MARK: - URLSessionSample

enum URLSessionSample {
    static let validResponse = HTTPURLResponse(
        url: URL(string: "https://example.com")!,
        statusCode: 200,
        httpVersion: nil,
        headerFields: nil
    )

    static let unauthorizedResponse = HTTPURLResponse(
        url: URL(string: "https://example.com")!,
        statusCode: 401,
        httpVersion: nil,
        headerFields: nil
    )

    static let mockStation = """
        {
            "stations": [
                {
                    "id": "1",
                    "brandId": "FRANCEINTER",
                    "title": "France Inter",
                    "hasTimeshift": true,
                    "shortTitle": "Inter",
                    "type": "on_air",
                    "streamUrl": "https://icecast.radiofrance.fr/franceinter-midfi.mp3",
                    "analytics": { "value": "france_inter", "stationAudienceId": 3 },
                    "liveRule": "apprf_inter_player",
                    "colors": { "primary": "#e20134" },
                    "isMusical": false
                }
            ]
        }
    """.utf8

    static let mockStationData = Data(mockStation)

    static let invalidJSONData = Data("invalid json".utf8)
    static let emptyData = Data()
}
