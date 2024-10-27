//
//  APIEndpoint.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import Foundation

// MARK: - APIManager.APIEndpoints

extension APIManager {
    private enum Constants {
        static let scheme = "http"
        static let baseUrl = "localhost"
        static let port = 3000
        static let stationsPath = "/stations"
    }

    enum APIEndpoint {
        case stations

        // MARK: Internal

        var url: URL? {
            switch self {
            case .stations:
                var components = URLComponents()
                components.scheme = Constants.scheme
                components.host = Constants.baseUrl
                components.port = Constants.port
                components.path = Constants.stationsPath
                return components.url
            }
        }
    }
}
