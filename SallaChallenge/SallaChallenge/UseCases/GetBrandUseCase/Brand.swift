//
//  Brand.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

struct Brand {
    let id: Int?
    let title: String?
    let label: String?
    let description: String?
    let logoURL: String?
    let nextProductsPage: String?
    let product: [Product]
    
    struct Product {
        let name: String
        let specialOffer: Bool
        let currency: String
        let price: Double
        let coverURL: String?
    }
}

extension Brand {
    init(brandDto: BrandDTO){
        self.id = brandDto.brandInfo?.id
        self.title = brandDto.brandInfo?.name
        self.label = brandDto.brandInfo?.label
        self.description = brandDto.brandInfo?.description
        self.logoURL = brandDto.brandInfo?.logo 
        self.nextProductsPage = brandDto.cursor.next
        var products = [Product]()
        for product in brandDto.products {
            products.append(Product(
                name:product.name,
                specialOffer: product.salePrice != nil,
                currency: product.currency,
                price: product.price,
                coverURL: product.productImage.url
            ))
        }
        self.product = products
    }
}
