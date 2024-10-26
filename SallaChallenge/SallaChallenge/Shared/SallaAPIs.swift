//
//  SallaAPIs.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

class SallaAPIs {
    private static let baseAPI = "https://api.salla.dev/"
    
    static func getEndpoint(endPoint: EndPoints, queryItems: [URLQueryItem]? = nil) -> URL {
        let urlPath = baseAPI + endPoint.getPath()
        var url = URL(string: urlPath)!
        if let queryItems = queryItems {
            url.append(queryItems: queryItems)
        }
        return url
    }
}

extension SallaAPIs {
    enum EndPoints {
        case brands
        case product(String)
        
        func getPath() -> String {
            switch self {
            case .brands:
                "store/v1/brands/775656108"
            case .product(let productID):
                "store/v1/products/\(productID)/details"
            }
        }
    }
}
