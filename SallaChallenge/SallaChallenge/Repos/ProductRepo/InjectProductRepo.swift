//
//  InjectProductRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation


private struct ProductRepoKey: InjectionKey {
    static var currentValue: ProductRepo = ProductRepo()
}

extension InjectedValues {
    var productRepo: ProductRepo {
        get { Self[ProductRepoKey.self] }
        set { Self[ProductRepoKey.self] = newValue }
    }
}
