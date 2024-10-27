//
//  BrandDTO.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

struct BrandDTO: Codable {
    let products: [BrandProduct]
    let brandInfo: BrandInfo?
    let cursor: Cursor
    
    enum CodingKeys: String, CodingKey {
        case products = "data"
        case brandInfo = "brand"
        case cursor = "cursor"
    }
}
