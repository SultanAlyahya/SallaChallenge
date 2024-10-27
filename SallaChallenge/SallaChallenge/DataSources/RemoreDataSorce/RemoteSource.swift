//
//  RemoteSource.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation


protocol RemoteSource {
    func makeRequst(url: URL, headers: [String: String]?, body: [String: String]?) async throws -> Data
}
