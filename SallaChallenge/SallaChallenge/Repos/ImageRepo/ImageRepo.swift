//
//  ImageRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation

class ImageRepo {
    @Injected(\.remoteDataSource) private var remoteDataSource
    @Injected(\.cacheDataSource) private var cacheDataSource
    
    private func getImageFromCache(key: String) -> Data? {
        return cacheDataSource.getObject(forKey: key) as? Data
    }
    
    private func cacheImage(key: String, data: Data) {
        cacheDataSource.cacheObject(data: data, forKey: key)
    }
    
    func getImage(imageURL: String) async throws -> Data {
        if let data = getImageFromCache(key: imageURL) {
            return data
        }
        let url = URL(string: imageURL)!
        let data = try await remoteDataSource.makeRequst(url: url, headers: nil, body: nil)
        cacheImage(key: imageURL, data: data)
        return data
    }
}
