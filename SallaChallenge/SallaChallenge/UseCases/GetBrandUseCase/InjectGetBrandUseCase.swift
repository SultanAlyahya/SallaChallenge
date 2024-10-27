//
//  InjectGetBrandUseCase.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation

private struct GetBrandUseCaseKey: InjectionKey {
    static var currentValue: GetBrandUseCase = GetBrandUseCase()
}

extension InjectedValues {
    var getBrandUseCase: GetBrandUseCase {
        get { Self[GetBrandUseCaseKey.self] }
        set { Self[GetBrandUseCaseKey.self] = newValue }
    }
}
