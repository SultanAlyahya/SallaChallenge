//
//  RemoteDataSource.swift
//  SallaChallengeTests
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation
@testable import SallaChallenge

class MockRemoteDataSource: RemoteSource {
    var url: URL? = nil
    var headers: [String: String]? = nil
    var body: [String: String]? = nil
    
    func makeRequst(url: URL, headers: [String: String]? = nil, body: [String: String]? = nil) async throws -> Data {
        self.url = url
        self.headers = headers
        self.body = body
        return Data()
    }
    
  
}
