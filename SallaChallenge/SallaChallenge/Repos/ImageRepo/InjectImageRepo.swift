//
//  InjectImageRepo.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation

private struct ImageRepoKey: InjectionKey {
    static var currentValue: ImageRepo = ImageRepo()
}

extension InjectedValues {
    var imageRepo: ImageRepo {
        get { Self[ImageRepoKey.self] }
        set { Self[ImageRepoKey.self] = newValue }
    }
}
