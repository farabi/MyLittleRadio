// Copyright © Radio France. All rights reserved.

import Domain
import Foundation

// MARK: - URLSessionProtocol

public protocol URLSessionProtocol {
    func data(from url: URL, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

// MARK: - URLSession + URLSessionProtocol

extension URLSession: URLSessionProtocol {}

// MARK: - APIManager

public class APIManager: StationRepository {
    // MARK: Lifecycle

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    // MARK: Public

    public func fetchStations() async throws -> [StationEntity] {
        try await sendRequest(url: APIEndpoint.stations.url, responseModel: StationsList.self)
            .stations.map(\.toDomain)
    }

    // MARK: Private

    private let session: URLSessionProtocol
    private let decoder = JSONDecoder()

    private func sendRequest<T: Decodable>(url: URL?, responseModel: T.Type) async throws -> T {
        guard let url else {
            throw APIError.invalidURL
        }
        do {
            let (data, response) = try await session.data(from: url, delegate: nil)
            #warning("Give some time to admire my loading animation")
            try await Task.sleep(nanoseconds: 1_000_000_000)

            guard let response = response as? HTTPURLResponse else {
                throw APIError.notResults
            }
            switch response.statusCode {
            case 200 ... 299:
                guard let decodedResponse = try? decoder.decode(responseModel, from: data) else {
                    throw APIError.decodingError
                }
                return decodedResponse
            case 401:
                throw APIError.unAuthorized
            default:
                throw APIError.networkError(response.statusCode)
            }
        } catch let apiError as APIError {
            throw apiError
        } catch let urlError as URLError {
            throw APIError.networkError(urlError.code.rawValue)
        } catch {
            throw APIError.unknown
        }
    }
}
