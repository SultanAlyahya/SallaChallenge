//
//  BrandDataRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

class BrandDataRepo: BrandRepo {
    @Injected(\.remoteDataSource) var remoteDataSource
    
    private func deocdeToBrand(data: Data) throws -> BrandDTO {
        let brandDto = try JSONDecoder().decode(BrandDTO.self, from: data)
        return brandDto
    }
    
    func getBrandProducts(url: String?) async throws -> BrandDTO {
        let requeatHeaders = SallaAPIs.addSallaHeader()
        let brandURL = SallaAPIs.getEndpoint(endPoint: .brands, queryItems: nil)
        let data = try await remoteDataSource.makeRequst(url: brandURL, headers: requeatHeaders, body: nil)
        let brandDto = try deocdeToBrand(data: data)
        return brandDto
    }
}
