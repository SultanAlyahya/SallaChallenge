//
//  InjectGetImageUseCase.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation


private struct GetImageUseCaseKey: InjectionKey {
    static var currentValue: GetImageUseCase = GetImageUseCase()
}

extension InjectedValues {
    var getImageUseCase: GetImageUseCase {
        get { Self[GetImageUseCaseKey.self] }
        set { Self[GetImageUseCaseKey.self] = newValue }
    }
}
