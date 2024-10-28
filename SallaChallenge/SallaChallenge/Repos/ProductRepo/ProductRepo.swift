//
//  ProductRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation

class ProductRepo {
    @Injected(\.remoteDataSource) private var remoteDataSource
    
    private func deocdeToProduct(data: Data) throws -> ProductDto {
        let productDto = try JSONDecoder().decode(ProductDto.self, from: data)
        return productDto
    }
    
    func getProduct(id: String) async throws -> ProductDto {
        let url = SallaAPIs.getEndpoint(endPoint: .product(id))
        let requeatHeaders = SallaAPIs.addSallaHeader()
        let data = try await remoteDataSource.makeRequst(url: url, headers: requeatHeaders, body: nil)
        let product = try deocdeToProduct(data: data)
        return product
    }
}
