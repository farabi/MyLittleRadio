import Foundation
import Testing
@testable import Data

// MARK: - Custom tag

extension Tag {
    @Tag static var api: Self
}

// MARK: - APIManagerTests

enum APIManagerTests {
    // MARK: - FetchStations Tests

    struct FetchStations {
        let sut = APIManager(session: MockURLSession())

        // MARK: - Successful Fetch Test

        @Test("fetches stations successfully", .tags(.api))
        func fetchStationsSuccessfully() async throws {
            let mockSession = MockURLSession(
                data: URLSessionSample.mockStationData,
                response: URLSessionSample.validResponse
            )
            let sut = APIManager(session: mockSession)

            // When: Fetch stations
            let stations = try await sut.fetchStations()

            // Then: Validate the fetched data
            #expect(stations.count == 1)
            #expect(stations.first?.title == "France Inter")
            #expect(stations.first?.id == "1")
            #expect(stations.first?.streamUrl == "https://icecast.radiofrance.fr/franceinter-midfi.mp3")
        }

        // MARK: - Invalid URL Test

        @Test("throws invalidURL error when URL is nil", .tags(.api))
        func throwsInvalidURLError_givenNilURL() async {
            let sut = APIManager(session: MockURLSession())
            await #expect(throws: APIError.networkError(-1011), performing: {
                try await sut.fetchStations()
            })
        }

        // MARK: - Unauthorized Error Test

        @Test("throws unAuthorized error for 401 status code", .tags(.api))
        func throwsUnauthorizedError() async throws {
            let mockSession = MockURLSession(
                data: URLSessionSample.emptyData,
                response: URLSessionSample.unauthorizedResponse
            )
            let sut = APIManager(session: mockSession)

            await #expect(throws: APIError.unAuthorized, performing: {
                try await sut.fetchStations()
            })
        }

        // MARK: - Decoding Error Test

        @Test("throws decodingError for invalid JSON", .tags(.api))
        func throwsDecodingError_givenInvalidJSON() async {
            let mockSession = MockURLSession(
                data: URLSessionSample.invalidJSONData,
                response: URLSessionSample.validResponse
            )
            let sut = APIManager(session: mockSession)

            await #expect(throws: APIError.decodingError, performing: {
                try await sut.fetchStations()
            })
        }

        // MARK: - Network Error Test

        @Test("throws networkError when not connected", .tags(.api))
        func throwsNetworkError_whenNotConnected() async {
            let mockSession = MockURLSession(error: URLError(.notConnectedToInternet))
            let sut = APIManager(session: mockSession)

            await #expect(throws: APIError.networkError(URLError.notConnectedToInternet.rawValue), performing: {
                try await sut.fetchStations()
            })
        }
    }
}
