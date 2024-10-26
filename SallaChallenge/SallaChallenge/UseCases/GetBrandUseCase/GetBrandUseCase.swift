//
//  GetBrandUseCase.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

class GetBrandUseCase {
    @Injected(\.brandRepo) var brandRepo
    
    func getAppVersion() {
        
    }
    
    func run(page fromURL: String? = nil) async throws -> Brand {
        let brandDto = try await brandRepo.getBrandProducts(url: fromURL)
        let brand = Brand(brandDto: brandDto)
        return brand
    }
}
