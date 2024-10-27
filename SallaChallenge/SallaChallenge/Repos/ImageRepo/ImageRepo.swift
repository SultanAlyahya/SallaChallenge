//
//  ImageRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation

class ImageRepo {
    @Injected(\.remoteDataSource) private var remoteDataSource
    
    func getImage(imageURL: String) async throws -> Data {
        let url = URL(string: imageURL)!
        let data = try await remoteDataSource.makeRequst(url: url, headers: nil, body: nil)
        return data
    }
}
