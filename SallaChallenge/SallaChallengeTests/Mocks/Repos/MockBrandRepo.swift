//
//  MockBrandRepo.swift
//  SallaChallengeTests
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation
@testable import SallaChallenge

class MockBrandRepo: BrandRepo {
    func getBrandProducts(url: String?) async throws -> SallaChallenge.BrandDTO {
        
        let brandProduct = BrandProduct(id: 1, name: "Sultan", description: "", productImage: "", price: BrandProduct.Price(amount: 10.0, currency: "SAR"), regularPrice: nil, salePrice: nil)
        let brandInfo = BrandInfo(id: 1, name: "Sultan's brand", label: "none", description: "none", banner: nil, logo: nil)
        let cursor = Cursor(current: 1, previous: nil, next: nil, count: 1)
        
        return SallaChallenge.BrandDTO(products: [brandProduct], brandInfo: brandInfo, cursor: cursor)
    }
}

