//
//  ChachDataSource.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation

class CacheDataSource {
    private let cache = NSCache<NSString, NSData>()
    
    func cacheObject(data: Data, forKey key: String) {
        cache.setObject(data as NSData, forKey: key as NSString)
    }
    
    func getObject(forKey key: String) -> NSData? {
        return cache.object(forKey: key as NSString)
    }
}
