//
//  GetImageUseCase.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation


class GetImageUseCase {
    @Injected(\.imageRepo) private var imageRepo
    
    func run(imageURL: String) async throws -> Data {
        return try await imageRepo.getImage(imageURL: imageURL)
    }
}
