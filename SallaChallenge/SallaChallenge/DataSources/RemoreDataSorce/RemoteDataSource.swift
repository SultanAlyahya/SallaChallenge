//
//  RemoteDataSource.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

enum NetworkError: Error {
    case badRequest
}

class RemoteDataSource: RemoteSource {
    private let session = URLSession.shared
    
    func makeRequst(url: URL, headers: [String: String]? = nil, body: [String: String]? = nil) async throws -> Data {
        var request = URLRequest(url: url)
        if let headers = headers {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        return try mapResponse(response: (data,response))
    }
    
    private func mapResponse(response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return response.data
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        default:
            throw NetworkError.badRequest
        }
    }
}
