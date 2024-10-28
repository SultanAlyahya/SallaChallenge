//
//  InjectCashDataSource.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation


private struct CacheDataSourceKey: InjectionKey {
    static var currentValue: CacheDataSource = CacheDataSource()
}

extension InjectedValues {
    var cacheDataSource: CacheDataSource {
        get { Self[CacheDataSourceKey.self] }
        set { Self[CacheDataSourceKey.self] = newValue }
    }
}
