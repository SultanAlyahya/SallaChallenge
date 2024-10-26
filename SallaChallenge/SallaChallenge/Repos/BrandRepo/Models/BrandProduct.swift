//
//  BrandProduct.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

struct BrandProduct: Codable {
    let id: Int
    let name: String
    let description: String
    let productImage: String
    let price: Price
    let regularPrice: Price?
    let salePrice: Price?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case productImage = "thumbnail"
        case price = "price"
        case regularPrice = "sale_price"
        case salePrice = "regular_price"
    }
    
    struct Price: Codable {
        let amount: Double
        let currency: String
        
        enum CodingKeys: String, CodingKey {
            case amount = "amount"
            case currency = "currency"
        }
    }
}
