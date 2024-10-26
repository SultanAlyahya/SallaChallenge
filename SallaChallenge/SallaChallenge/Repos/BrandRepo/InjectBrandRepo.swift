//
//  InjectBrandRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

private struct BrandRepoKey: InjectionKey {
    static var currentValue: BrandRepo = BrandDataRepo()
}

extension InjectedValues {
    var brandRepo: BrandRepo {
        get { Self[BrandRepoKey.self] }
        set { Self[BrandRepoKey.self] = newValue }
    }
}
