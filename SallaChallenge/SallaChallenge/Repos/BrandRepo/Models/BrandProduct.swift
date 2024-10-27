//
//  BrandProduct.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

struct BrandProduct: Codable {
    let id: String
    let name: String
    let description: String?
    let productImage: Image
    let price: Double
    let currency: String
    let salePrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case productImage = "image"
        case price = "price"
        case currency = "currency"
        case salePrice = "sale_price"
    }
    
    struct Image: Codable {
        let url: String?
        enum CodingKeys: String, CodingKey {
            case url = "url"
        }
    }
}
