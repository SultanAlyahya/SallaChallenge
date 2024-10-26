//
//  BrandRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

protocol BrandRepo {
    func getBrandProducts(url: String?) async throws -> BrandDTO
}
